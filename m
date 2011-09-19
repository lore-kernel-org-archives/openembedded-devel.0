Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1R5XLX-00059J-1i for openembedded-devel@lists.openembedded.org;
	Mon, 19 Sep 2011 08:28:51 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1R5XGS-0004DL-HQ for openembedded-devel@lists.openembedded.org;
	Mon, 19 Sep 2011 08:23:36 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Sep 2011 08:23:36 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Sep 2011 08:23:36 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Mon, 19 Sep 2011 08:23:19 +0200
Message-ID: <j56n4n$s0d$1@dough.gmane.org>
References: <1316383877-30796-1-git-send-email-dbaryshkov@gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:6.0.1) Gecko/20110830 Thunderbird/6.0.1
In-Reply-To: <1316383877-30796-1-git-send-email-dbaryshkov@gmail.com>
X-Enigmail-Version: 1.3.1
Subject: Re: [meta-oe][V2 1/2] gcc-4.5: include libgcov.a into libgcc-dev package
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
X-List-Received-Date: Mon, 19 Sep 2011 06:28:51 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Applied both, thanks!

Op 19-09-11 00:11, Dmitry Eremin-Solenikov schreef:
> First, this lib is usefull for coverage analysis-enabled building. 
> Second, this fixes the warning about unpackaged files in libgcc recipe.
> 
> Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com> --- 
> meta-oe/recipes-devtools/gcc/gcc-4.5.inc   |    2 +- 
> meta-oe/recipes-devtools/gcc/libgcc_4.5.bb |    1 + 2 files changed, 2
> insertions(+), 1 deletions(-)
> 
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5.inc
> b/meta-oe/recipes-devtools/gcc/gcc-4.5.inc index aabc1cf..a7f9480 100644 
> --- a/meta-oe/recipes-devtools/gcc/gcc-4.5.inc +++
> b/meta-oe/recipes-devtools/gcc/gcc-4.5.inc @@ -14,7 +14,7 @@
> LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552
> \
> 
> 
> PV = "4.5" -PR = "r40" +PR = "r41"
> 
> # BINV should be incremented after updating to a revision # after a minor
> gcc release (e.g. 4.5.1 or 4.5.2) has been made diff --git
> a/meta-oe/recipes-devtools/gcc/libgcc_4.5.bb
> b/meta-oe/recipes-devtools/gcc/libgcc_4.5.bb index 8a6c96a..1579c8b
> 100644 --- a/meta-oe/recipes-devtools/gcc/libgcc_4.5.bb +++
> b/meta-oe/recipes-devtools/gcc/libgcc_4.5.bb @@ -13,6 +13,7 @@
> FILES_${PN} = "${base_libdir}/libgcc*.so.*" FILES_${PN}-dev = " \ 
> ${base_libdir}/libgcc*.so \ ${libdir}/${TARGET_SYS}/${BINV}/crt* \ +
> ${libdir}/${TARGET_SYS}/${BINV}/libgcov.a \ 
> ${libdir}/${TARGET_SYS}/${BINV}/libgcc*"
> 
> do_fetch[noexec] = "1"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFOdt/XMkyGM64RGpERAsGWAJ961oI2+nv571hu4MElWen8+HbuwACbBFOb
U/vqGHRxq1btO/sT7OK5IEE=
=ruDF
-----END PGP SIGNATURE-----



