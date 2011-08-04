Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QosaW-0005wt-6V for openembedded-devel@lists.openembedded.org;
	Thu, 04 Aug 2011 09:43:28 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QosWJ-00015h-0Q for openembedded-devel@lists.openembedded.org;
	Thu, 04 Aug 2011 09:39:07 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Thu, 04 Aug 2011 09:39:07 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 04 Aug 2011 09:39:07 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Thu, 04 Aug 2011 09:38:54 +0200
Message-ID: <j1diae$tc1$1@dough.gmane.org>
References: <1312192798-18259-1-git-send-email-koen@openembedded.org>
	<4E36AAB5.4080307@dresearch-fe.de>
	<4E3A472D.3030001@dresearch-fe.de>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:5.0) Gecko/20110624 Thunderbird/5.0
In-Reply-To: <4E3A472D.3030001@dresearch-fe.de>
X-Enigmail-Version: 1.2
Subject: Re: [PATCH] gtk-icon-cache bbclass: only add runtime dependencies on hicolor-icon-theme when installing icons
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 04 Aug 2011 07:43:28 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 04-08-11 09:15, Steffen Sledz schreef:
> On 01.08.2011 15:31, Steffen Sledz wrote:
>> On 01.08.2011 11:59, Koen Kooi wrote:
>>> Also import a fix from OE-core for setting the loader dir.
>>> 
>>> Tested with gnome-icon-theme and libsoup recipes on angstrom.
>>> 
>>> Signed-off-by: Koen Kooi <koen@openembedded.org>
>> 
>> Acked-by: Steffen Sledz <sledz@dresearch-fe.de>
> 
> Ping!
> 
>> Thx for this. Would be nice, if this patch could find it's way to 2011.03-maintenance branch too.

Wasn't this in the pull request you did this week?

>> 
>>> --- classes/gtk-icon-cache.bbclass |   11 +++++++---- 1 files changed, 7 insertions(+), 4 deletions(-)
>>> 
>>> diff --git a/classes/gtk-icon-cache.bbclass b/classes/gtk-icon-cache.bbclass index 2449e95..d9b5d1b 100644 --- a/classes/gtk-icon-cache.bbclass +++ b/classes/gtk-icon-cache.bbclass @@ -1,6 +1,4 @@ FILES_${PN} += "${datadir}/icons/hicolor" -# Only add runtime dependency on hicolor-icon-theme
>>> for target recipes -RDEPENDS_${PN} += "${@['', 'hicolor-icon-theme']['${PN}' == '${BPN}']}"
>>> 
>>> # This could run on the host as icon cache files are architecture independent, # but there is no gtk-update-icon-cache built natively. @@ -10,7 +8,7 @@ if [ "x$D" != "x" ]; then fi
>>> 
>>> # Update the pixbuf loaders in case they haven't been registered yet -gdk-pixbuf-query-loaders > /etc/gtk-2.0/gdk-pixbuf.loaders +GDK_PIXBUF_MODULEDIR=${libdir}/gdk-pixbuf-2.0/2.10.0/loaders gdk-pixbuf-query-loaders --update-cache
>>> 
>>> for icondir in /usr/share/icons/* ; do if [ -d $icondir ] ; then @@ -35,7 +33,12 @@ python populate_packages_append () { icon_dir = '%s/%s/%s/icons' % (pkgdest, pkg, bb.data.getVar('datadir', d, 1)) if not os.path.exists(icon_dir): continue - + +		bb.note("adding hicolor-icon-theme dependency
>>> to %s" % pkg) +		rdepends = bb.data.getVar('RDEPENDS', d, 1) +		rdepends += "hicolor-icon-theme" +		bb.data.setVar('RDEPENDS', rdepends, d) + bb.note("adding gtk-icon-cache postinst and postrm scripts to %s" % pkg)  postinst = bb.data.getVar('pkg_postinst_%s' % pkg, d, 1) or
>>> bb.data.getVar('pkg_postinst', d, 1)
>> 
>> 
> 
> 

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFOOkyOMkyGM64RGpERAu38AKCbLXcD5+k5mD+zqBZ1vrmqD2MhyQCfeu8q
FWqQAhn7kDc46b8BkBlIuf8=
=NfMW
-----END PGP SIGNATURE-----



