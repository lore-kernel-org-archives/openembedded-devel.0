Return-Path: <gcho-openembedded-devel@m.gmane.org>
Received: from plane.gmane.org (plane.gmane.org [80.91.229.3])
	by mail.openembedded.org (Postfix) with ESMTP id 59CA360030
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Jun 2014 09:29:49 +0000 (UTC)
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1X0STc-0003MY-H5 for openembedded-devel@lists.openembedded.org;
	Fri, 27 Jun 2014 11:29:48 +0200
Received: from ip4da2a5ae.direct-adsl.nl ([77.162.165.174])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Jun 2014 11:29:48 +0200
Received: from koen by ip4da2a5ae.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Jun 2014 11:29:48 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Fri, 27 Jun 2014 11:29:39 +0200
Message-ID: <lojdi3$8mu$1@ger.gmane.org>
References: <Lauren.Post@freescale.com>
	<1403793465-6376-1-git-send-email-lauren.post@freescale.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip4da2a5ae.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:24.0) Gecko/20100101 Thunderbird/24.6.0
In-Reply-To: <1403793465-6376-1-git-send-email-lauren.post@freescale.com>
X-Enigmail-Version: 1.6
Subject: Re: [meta-oe][PATCH] cpuburn-neon: Upgrade to 2014066 version to fix build break
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 27 Jun 2014 09:29:53 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Lauren Post schreef op 26-06-14 16:37:
> Replace SRC_URI with new location, md5sum and new name since previous
> download will not work.  Without this fix cpuburn-neon has a broken
> build.

Why not make the recipe clone the git repo?


> 
> Signed-off-by: Lauren Post <lauren.post@freescale.com> Signed-off-by:
> Otavio Salvador <otavio@ossystems.com.br> --- ...n-neon_20120610.bb =>
> cpuburn-neon_20140626.bb} |    9 +++++---- 1 file changed, 5
> insertions(+), 4 deletions(-) rename
> meta-oe/recipes-benchmark/cpuburn/{cpuburn-neon_20120610.bb =>
> cpuburn-neon_20140626.bb} (72%)
> 
> diff --git a/meta-oe/recipes-benchmark/cpuburn/cpuburn-neon_20120610.bb
> b/meta-oe/recipes-benchmark/cpuburn/cpuburn-neon_20140626.bb similarity
> index 72% rename from
> meta-oe/recipes-benchmark/cpuburn/cpuburn-neon_20120610.bb rename to
> meta-oe/recipes-benchmark/cpuburn/cpuburn-neon_20140626.bb index
> 8ec5e95..ed1f1ee 100644 ---
> a/meta-oe/recipes-benchmark/cpuburn/cpuburn-neon_20120610.bb +++
> b/meta-oe/recipes-benchmark/cpuburn/cpuburn-neon_20140626.bb @@ -8,17
> +8,18 @@ DL_DIR_append = "/${PN}-${PV}" COMPATIBLE_MACHINE =
> "(${@bb.utils.contains("TUNE_FEATURES", "neon", "${MACHINE}", "Invalid!",
> d)})"
> 
> SRC_URI = "http://hardwarebug.org/files/burn.S;name=mru \ -
> http://github.com/downloads/ssvb/ssvb.github.com/ssvb-cpuburn-a8.S;name=ssvb"
>
> 
+           https://github.com/ssvb/cpuburn-arm/raw/master/cpuburn-a8.S;name=ssvb"
> + SRC_URI[mru.md5sum] = "823abc72c2cd448e87df9bc5355a4456" 
> SRC_URI[mru.sha256sum] =
> "01d9fc04f83740c513c25401dcc89c11b2a5a6013e70bfca42b7b02129f88cd2" 
> -SRC_URI[ssvb.md5sum] = "0acc570d943c41c7f8602b9ff6fa111d" 
> -SRC_URI[ssvb.sha256sum] =
> "bfddd3226a499ffdf71bb58c05ccdc6dac5bb2c2c3bdb10ac610ee0b60aac087" 
> +SRC_URI[ssvb.md5sum] = "ba0ef2939a3b3b487523448c67544e94" 
> +SRC_URI[ssvb.sha256sum] =
> "ce42ebdc71c876a33d9f7534355ef76cefa0d00ddb19ad69cf05a266c861d08d"
> 
> S = "${WORKDIR}"
> 
> do_compile() { ${CC} ${CFLAGS} ${LDFLAGS} burn.S -o burn -    ${CC}
> ${CFLAGS} ${LDFLAGS} ssvb-cpuburn-a8.S -o burn-neona8 +    ${CC}
> ${CFLAGS} ${LDFLAGS} cpuburn-a8.S -o burn-neona8 }
> 
> do_install() {
> 

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFTrTmDMkyGM64RGpERAjXBAJ4s5eQ6sg0h4h3D62Vq8ULr+8tzKQCgkAKY
11UopJhFG8CsPTl/mxMv7Ck=
=jm+c
-----END PGP SIGNATURE-----


