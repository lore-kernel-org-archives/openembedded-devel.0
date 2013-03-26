Received: from plane.gmane.org ([80.91.229.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1UKRbI-0002Ve-Au for openembedded-devel@lists.openembedded.org;
	Tue, 26 Mar 2013 11:59:34 +0100
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1UKRLD-0005Bn-RY for openembedded-devel@lists.openembedded.org;
	Tue, 26 Mar 2013 11:42:55 +0100
Received: from ip4da2a5ae.direct-adsl.nl ([77.162.165.174])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Mar 2013 11:42:55 +0100
Received: from koen by ip4da2a5ae.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Mar 2013 11:42:55 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Tue, 26 Mar 2013 11:42:21 +0100
Message-ID: <kiru27$1u0$1@ger.gmane.org>
References: <1364293926-32661-1-git-send-email-laurentiu.palcu@intel.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip4da2a5ae.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:17.0) Gecko/20130107 Thunderbird/17.0.2
In-Reply-To: <1364293926-32661-1-git-send-email-laurentiu.palcu@intel.com>
X-Enigmail-Version: 1.5
Subject: Re: [meta-browser][PATCH] nss: change shebang line for smime script
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
X-List-Received-Date: Tue, 26 Mar 2013 10:59:42 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 26-03-13 11:32, Laurentiu Palcu schreef:
> This patch fixes the shebang line of the smime script and also adds a 
> 'perl' RDEPENDS for the main package since smime needs perl to run.
> 
> Also, this patch fixes some do_rootfs failures when using RPM backend 
> because RPM automatically scans the files and, if perl scripts are found,
> adds dependency on the file found in the shebang line (i.e. 
> /usr/local/bin/perl).
> 
> Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com> --- 
> recipes-support/nss/nss_3.13.3.bb |    3 +++ 1 file changed, 3
> insertions(+)
> 
> diff --git a/recipes-support/nss/nss_3.13.3.bb
> b/recipes-support/nss/nss_3.13.3.bb index 59c16e8..c05179f 100644 ---
> a/recipes-support/nss/nss_3.13.3.bb +++
> b/recipes-support/nss/nss_3.13.3.bb @@ -7,6 +7,7 @@ LICENSE = "MPL1.1 GPL
> LGPL" LIC_FILES_CHKSUM =
> "file://security/nss/manifest.mn;md5=d71978748f23eae3156c38ac2a691924"
> 
> DEPENDS = "sqlite3 nspr nspr-native" +RDEPENDS_${PN} += "perl"

R* variables are grouped with below do_install since the OE style guide
tends to group variables into the order the tasks are executed. So RDEPENDS
and friends go below do_install next to FILES_*

> 
> SRC_URI = "\ 
> http://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_3_13_3_RTM/src/${PN}-${PV}.tar.gz
> \ @@ -105,6 +106,8 @@ do_install() { sed -i s:OELIBDIR:${libdir}:g
> ${D}${libdir}/pkgconfig/nss.pc sed -i s:OEINCDIR:${includedir}:g
> ${D}${libdir}/pkgconfig/nss.pc sed -i s:OEEXECPREFIX:${exec_prefix}:g
> ${D}${libdir}/pkgconfig/nss.pc + +	sed -i
> s:/usr/local/bin/perl:${bindir}/perl:g ${D}${bindir}/smime }
> 
> FILES_SOLIBSDEV := ""
> 

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFRUXuNMkyGM64RGpERAkwBAJoC3D1MJRVys1x7mMOJJYKRldACmgCfRz4J
K/jWMy6Ni5/K8wXHpS9rbWU=
=T5Sy
-----END PGP SIGNATURE-----



