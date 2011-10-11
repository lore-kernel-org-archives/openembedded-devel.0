Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1RDiVN-0002u6-An for openembedded-devel@lists.openembedded.org;
	Tue, 11 Oct 2011 22:00:49 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1RDiPr-00033a-NK for openembedded-devel@lists.openembedded.org;
	Tue, 11 Oct 2011 21:55:07 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Oct 2011 21:55:07 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Oct 2011 21:55:07 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Tue, 11 Oct 2011 21:54:45 +0200
Message-ID: <j726u5$8ta$1@dough.gmane.org>
References: <cover.1318362324.git.otavio@ossystems.com.br>
	<2d40bd35a2ecf2ac49a66a09656c7319aa811c98.1318362324.git.otavio@ossystems.com.br>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:7.0) Gecko/20110922 Thunderbird/7.0
In-Reply-To: <2d40bd35a2ecf2ac49a66a09656c7319aa811c98.1318362324.git.otavio@ossystems.com.br>
X-Enigmail-Version: 1.3.2
Subject: Re: [meta-oe][PATCH 1/1] xserver-nodm-init: exit 1 only if systemd is installed
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
X-List-Received-Date: Tue, 11 Oct 2011 20:00:49 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 11-10-11 21:46, Otavio Salvador schreef:
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br> --- 
> .../xserver-nodm-init/xserver-nodm-init_2.0.bb     |   10 ++++------ 1
> files changed, 4 insertions(+), 6 deletions(-)
> 
> diff --git
> a/meta-oe/recipes-graphics/xserver-nodm-init/xserver-nodm-init_2.0.bb
> b/meta-oe/recipes-graphics/xserver-nodm-init/xserver-nodm-init_2.0.bb 
> index d4a6b97..87079a6 100644 ---
> a/meta-oe/recipes-graphics/xserver-nodm-init/xserver-nodm-init_2.0.bb +++
> b/meta-oe/recipes-graphics/xserver-nodm-init/xserver-nodm-init_2.0.bb @@
> -3,7 +3,7 @@ LICENSE = "GPLv2" LIC_FILES_CHKSUM =
> "file://COPYING;md5=751419260aa954499f7abaabaa882bbe" SECTION = "x11"
> 
> -PR = "r9" +PR = "r10"
> 
> SRC_URI = "file://xserver-nodm \ file://xserver-nodm.service \ @@ -31,12
> +31,10 @@ INITSCRIPT_PARAMS = "start 01 5 2 . stop 01 0 1 6 ." 
> INITSCRIPT_PARAMS_shr = "start 90 5 2 . stop 90 0 1 6 ."
> 
> pkg_postinst_${PN}_append () { -    # can't do this offline -    if [
> "x$D" != "x" ]; then -        exit 1 -    fi - if [ -e /bin/systemctl ] ;
> then +        # can't do this offline +        [ "x$D" != "x" ] && exit
> 1 + systemctl enable xserver-nodm.service fi }

While you're at it, please change it to ${base_bindir}


-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFOlJ8EMkyGM64RGpERAjlwAKCryf1VfXEmdAFFj7tcyIc553EragCcDxx5
XG3FrZa5JCfCy8IHpJ6UZ1k=
=dU6H
-----END PGP SIGNATURE-----



