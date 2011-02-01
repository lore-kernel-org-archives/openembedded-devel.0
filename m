Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1PkGmx-0006bq-Qm for openembedded-devel@lists.openembedded.org;
	Tue, 01 Feb 2011 15:01:00 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1PkGly-0006Vf-6y for openembedded-devel@lists.openembedded.org;
	Tue, 01 Feb 2011 14:59:58 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Feb 2011 14:59:58 +0100
Received: from k.kooi by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim
	0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Feb 2011 14:59:58 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Tue, 01 Feb 2011 14:59:37 +0100
Message-ID: <ii93k9$eub$1@dough.gmane.org>
References: <4D480A79.4030603@progra.de>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.16) Gecko/20101127 Shredder/3.0.11pre
In-Reply-To: <4D480A79.4030603@progra.de>
X-Enigmail-Version: 1.0.1
Subject: Re: hicolor-icon-theme installation/dependency problem
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
X-List-Received-Date: Tue, 01 Feb 2011 14:01:00 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 01-02-11 14:28, Fabian Ruff wrote:
> Hi,
> 
> first of all I'm not sure if this is the right mailing-list to post my
> question. Please point me to the right one if it isn't.
> 
> I've stumbled upon a problem building an recipe for custom software that
> depends on totem-pl-parser which itself depends on hicolor-icon-theme
> (which seems to be introduced by the gnome bbclass the totem-pl-parser
> recipe inherits from).
> 
> The installation of the hicolor-icon-theme fails at the postinstallation
> step because the directory /etc/gtk-2.0 and the binaries
> gdk-pixbuf-query-loaders & gtk-update-icon-cache don't exist.
> The postinst script of hicolor-icon-them is as follows:
> 
>> #!/bin/sh
>> if [ "x$D" != "x" ]; then
>>         exit 1
>> fi
>> # Update the pixbuf loaders in case they haven't been registered yet
>> gdk-pixbuf-query-loaders > /etc/gtk-2.0/gdk-pixbuf.loaders
>>
>> for icondir in /usr/share/icons/* ; do
>>     if [ -d $icondir ] ; then
>>         gtk-update-icon-cache -qt  $icondir
>>     fi
>> done
> I believe this postinstallation step is added by the gtk-icon-cache
> class the hicolor-icon-theme recipe inherits from.
> 
> I don't know which package provides this binaries/directory but as the
> package hicolor-icon-theme explicitly has no RDEPENDS set this seems
> wrong somehow.
> Installing hicolor-icon-theme via opkg from a standard console-image
> installation leaves the package manager in an inconsistent state with a
> half installed hicolor-icon-theme package which additionally can't be
> removed anymore because the postrm step also expects
> gtk-update-icon-cache to be available.
> 
> Any suggestions how to fix this or how this was intended to work?
> I want to use totem-pl-parser with the least possible additional
> software and hope this is possible without unfolding a complete
> gnome/gtk universe in my installation.

In recent gtk versions gdk-pixbuf is now split out again (after being
merged in 2002). Using that would be a good solution. The intermediate
solution would be to make the make it rdepend on the current pixbug package.

Now, the *real* solution would be to check if an icon cache is actually
needed before trying to run gtk-update-icon-cache. ISRT the cache format
is an FDO spec, but I'm not sure.

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFNSBHJMkyGM64RGpERAuGiAKCb2nzkVR0U04ME4Vh4TpR5GhtQRgCfRItf
GjRUnhHjeG1ep3gSMNhSVdw=
=OMGv
-----END PGP SIGNATURE-----



