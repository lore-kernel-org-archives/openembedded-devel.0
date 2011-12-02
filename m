Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1RWRi0-0007Hl-H6 for openembedded-devel@lists.openembedded.org;
	Fri, 02 Dec 2011 12:55:16 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1RWRbX-0005SZ-L3 for openembedded-devel@lists.openembedded.org;
	Fri, 02 Dec 2011 12:48:35 +0100
Received: from ip5451781a.direct-adsl.nl ([84.81.120.26])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Fri, 02 Dec 2011 12:48:35 +0100
Received: from koen by ip5451781a.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 02 Dec 2011 12:48:35 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Fri, 02 Dec 2011 12:48:20 +0100
Message-ID: <jbadu4$u4u$1@dough.gmane.org>
References: <1322824856-15965-1-git-send-email-eric@eukrea.com>
	<1322824856-15965-2-git-send-email-eric@eukrea.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip5451781a.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:8.0) Gecko/20111105 Thunderbird/8.0
In-Reply-To: <1322824856-15965-2-git-send-email-eric@eukrea.com>
X-Enigmail-Version: 1.3.3
Subject: Re: [meta-oe 2/3] atftp: correctly handle init script
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
X-List-Received-Date: Fri, 02 Dec 2011 11:55:16 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 02-12-11 12:20, Eric Bénard schreef:
> else it's affected to atftp package which is the client and not the
> server, but the init file is only in the server package thus leading to
> the following log at boot : Configuring atftp. update-rc.d:
> /etc/init.d/atftpd: file does not exist
> 
> Signed-off-by: Eric Bénard <eric@eukrea.com> --- 
> meta-oe/recipes-extended/atftp/atftp_0.7.bb |   10 ++++++---- 1 files
> changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/meta-oe/recipes-extended/atftp/atftp_0.7.bb
> b/meta-oe/recipes-extended/atftp/atftp_0.7.bb index c541634..ab14a28
> 100644 --- a/meta-oe/recipes-extended/atftp/atftp_0.7.bb +++
> b/meta-oe/recipes-extended/atftp/atftp_0.7.bb @@ -3,6 +3,7 @@ SECTION =
> "network" HOMEPAGE = "http://packages.debian.org/atftp" LICENSE =
> "GPLv2" LIC_FILES_CHKSUM =
> "file://LICENSE;md5=94d55d512a9ba36caa9b7df079bae19f" +PR = "r1"
> 
> SRC_URI =
> "${DEBIAN_MIRROR}/main/a/atftp/atftp_${PV}.dfsg.orig.tar.gz;name=archive
> \ ${DEBIAN_MIRROR}/main/a/atftp/atftp_${PV}.dfsg-11.diff.gz;name=patch \ 
> @@ -16,11 +17,12 @@ inherit autotools update-rc.d systemd useradd 
> SYSTEMD_PACKAGES = "atftpd-systemd" SYSTEMD_SERVICE_atftpd-systemd =
> "atftpd.service"
> 
> -INITSCRIPT_NAME = "atftpd" -INITSCRIPT_PARAMS = "defaults 80" 
> +INITSCRIPT_PACKAGES = "${PN}d" +INITSCRIPT_NAME_${PN}d = "atftpd" 
> +INITSCRIPT_PARAMS_${PN}d = "defaults 80"
> 
> -USERADD_PACKAGES = "atftpd" -USERADD_PARAM_atftpd = "--system
> --no-create-home --shell /bin/false \ +USERADD_PACKAGES = "${PN}d" 
> +USERADD_PARAM_${PN}d = "--system --no-create-home --shell /bin/false \ 
> --user-group nobody"

Was the USERADD change intentional?


-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (Darwin)
Comment: GPGTools - http://gpgtools.org

iEYEARECAAYFAk7YuwQACgkQMkyGM64RGpF28ACgp424Q0NwZ8bd7YPA9Sb8N72f
Ug4AoKSN21FrC2eX55kKso8MEWt9lTwY
=4fY6
-----END PGP SIGNATURE-----



