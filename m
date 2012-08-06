Received: from plane.gmane.org ([80.91.229.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1SyOQe-0001Jq-Nt for openembedded-devel@lists.openembedded.org;
	Mon, 06 Aug 2012 16:37:08 +0200
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1SyOFK-0008GW-Cp for openembedded-devel@lists.openembedded.org;
	Mon, 06 Aug 2012 16:25:26 +0200
Received: from ip4da2a5ae.direct-adsl.nl ([77.162.165.174])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Mon, 06 Aug 2012 16:25:26 +0200
Received: from koen by ip4da2a5ae.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 06 Aug 2012 16:25:26 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Mon, 06 Aug 2012 16:25:58 +0200
Message-ID: <jvok48$5ct$1@dough.gmane.org>
References: <cover.1343859304.git.Martin.Jansa@gmail.com>
	<5dd20f461ce240ffcaf43bd048e9b5e6ffd06bd0.1344259248.git.Martin.Jansa@gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip4da2a5ae.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:14.0) Gecko/20120713 Thunderbird/14.0
In-Reply-To: <5dd20f461ce240ffcaf43bd048e9b5e6ffd06bd0.1344259248.git.Martin.Jansa@gmail.com>
X-Enigmail-Version: 1.4.3
Subject: Re: [meta-oe][PATCH 09/12] systemd-compat-units: move list of disabled services to variable, fix hwclock.sh and output
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
X-List-Received-Date: Mon, 06 Aug 2012 14:37:08 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 06-08-12 15:37, Martin Jansa schreef:
> * variable allows to add items in .bbappend without overwritting whole 
> postinst * hwclock.service should be used to blacklist SYSV hwclock.sh
> (not hwclock.sh.service) * show only newly disabled SYSV scripts
> 
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com> --- 
> .../recipes-core/systemd/systemd-compat-units.bb   |   19
> ++++++++++++++----- 1 files changed, 14 insertions(+), 5 deletions(-)
> 
> diff --git a/meta-systemd/recipes-core/systemd/systemd-compat-units.bb
> b/meta-systemd/recipes-core/systemd/systemd-compat-units.bb index
> c9a6b67..2973208 100644 ---
> a/meta-systemd/recipes-core/systemd/systemd-compat-units.bb +++
> b/meta-systemd/recipes-core/systemd/systemd-compat-units.bb @@ -3,7 +3,7
> @@ DESCRIPTION = "Units to make systemd work better with existing
> sysvinit scripts" LICENSE = "MIT" LIC_FILES_CHKSUM =
> "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58"
> 
> -PR = "r15" +PR = "r16"
> 
> inherit allarch
> 
> @@ -26,15 +26,24 @@ do_install() { chmod 0755 ${D}${bindir}/runlevel }
> 
> +SYSTEMD_DISABLED_SYSV_SERVICES = " \ +  busybox-udhcpc \ +  dnsmasq \ +
> hwclock \ +  networking \ +  syslog \ +  syslog.busybox \ +" + 
> pkg_postinst_${PN} () { cd $D${sysconfdir}/init.d
> 
> echo -n "Disabling the following sysv scripts: "
> 
> -for i in busybox-udhcpc dnsmasq hwclock.sh networking syslog
> syslog.busybox ; do -	if [ -e $i ] ; then -		echo -n "$i " ; ln -s
> /dev/null $D${systemd_unitdir}/system/$i.service -	fi +for i in
> ${SYSTEMD_DISABLED_SYSV_SERVICES} ; do +    if [ \( -e $i -o $i.sh \) -a
> ! -e $D${base_libdir}/systemd/system/$i.service ] ; then +        echo -n
> "$i " ; ln -s /dev/null $D${base_libdir}/systemd/system/$i.service +
> fi done ; echo }

Doing something like this should work a bit better:

for i in ${SYSTEMD_DISABLED_SYSV_SERVICES} ; do
	systemctl mask $i
done

regards,

Koen

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFQH9P2MkyGM64RGpERAlt0AKC5RPAcFlS5DKhIBjnGptlWCuuN9gCfVZ/Y
jcUARKDAfbMatCrQx2ELcAw=
=qvM6
-----END PGP SIGNATURE-----



