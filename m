Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1RFsU0-0008F9-QE for openembedded-devel@lists.openembedded.org;
	Mon, 17 Oct 2011 21:04:20 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1RFsOO-000515-F8 for openembedded-devel@lists.openembedded.org;
	Mon, 17 Oct 2011 20:58:32 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Oct 2011 20:58:32 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Oct 2011 20:58:32 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Mon, 17 Oct 2011 20:58:11 +0200
Message-ID: <j7hts3$96r$1@dough.gmane.org>
References: <1318872201-26433-1-git-send-email-koen@dominion.thruhere.net>
	<1318872201-26433-2-git-send-email-koen@dominion.thruhere.net>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:7.0.1) Gecko/20110929 Thunderbird/7.0.1
In-Reply-To: <1318872201-26433-2-git-send-email-koen@dominion.thruhere.net>
X-Enigmail-Version: 1.3.2
Subject: Re: [meta-xfce 2/4] xfce-panel-plugin: bbclass for panel plugins
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
X-List-Received-Date: Mon, 17 Oct 2011 19:04:20 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 17-10-11 19:23, Koen Kooi schreef:
> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net> --- 
> meta-xfce/classes/xfce-panel-plugin.bbclass |   10 ++++++++++ 1 files
> changed, 10 insertions(+), 0 deletions(-) create mode 100644
> meta-xfce/classes/xfce-panel-plugin.bbclass
> 
> diff --git a/meta-xfce/classes/xfce-panel-plugin.bbclass
> b/meta-xfce/classes/xfce-panel-plugin.bbclass new file mode 100644 index
> 0000000..495d0b1 --- /dev/null +++
> b/meta-xfce/classes/xfce-panel-plugin.bbclass @@ -0,0 +1,10 @@ +inherit
> xfce + +DEPENDS += "libxfcegui4 libxfce4util xfce4-panel" + +SRC_URI =
> "http://archive.xfce.org/src/panel-plugins/${BPN}/${@'${PV}'[0:3]}/${BPN}-${PV}.tar.bz2"
>
> 
+
> +FILES_${PN} += "${datadir}/xfce4/panel-plugins/" +FILES_${PN}-dbg +=
> "${libexecdir}/xfce4/panel-plugins/.debug" + +

These seem to trigger a bitbake bug for me, I'm curious if other people are
seeing that as well
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFOnHrDMkyGM64RGpERAviNAJ9wUQHP7wN+Ef+qh2l9D9gBOUtMKwCgh+Zt
5dTS8HMYs4N3peckSXKvq9U=
=m2HC
-----END PGP SIGNATURE-----



