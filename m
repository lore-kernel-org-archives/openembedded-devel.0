Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1RbSyY-0005Hi-RH for openembedded-devel@lists.openembedded.org;
	Fri, 16 Dec 2011 09:17:07 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1RbSrn-0004vj-62 for openembedded-devel@lists.openembedded.org;
	Fri, 16 Dec 2011 09:10:07 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Dec 2011 09:10:07 +0100
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Dec 2011 09:10:07 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Fri, 16 Dec 2011 08:52:28 +0100
Message-ID: <jcetbp$4n1$6@dough.gmane.org>
References: <1324003173-13994-1-git-send-email-b19537@freescale.com>
	<1324003173-13994-6-git-send-email-b19537@freescale.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:8.0) Gecko/20111105 Thunderbird/8.0
In-Reply-To: <1324003173-13994-6-git-send-email-b19537@freescale.com>
X-Enigmail-Version: 1.3.4
Subject: Re: [PATCH meta-oe 6/9] ptpd: add
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
X-List-Received-Date: Fri, 16 Dec 2011 08:17:07 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 16-12-11 03:39, b19537@freescale.com schreef:
> From: Zhenhua Luo <b19537@freescale.com>
> 
> Precision Time Protocol (PTP) as defined by the IEEE 1588 standard.
> 
> Signed-off-by: Zhenhua Luo <b19537@freescale.com> ---

> diff --git a/meta-oe/recipes-connectivity/ptpd/ptpd_1.0.0.bb
> b/meta-oe/recipes-connectivity/ptpd/ptpd_1.0.0.bb new file mode 100644 
> index 0000000..a9c0351 --- /dev/null +++
> b/meta-oe/recipes-connectivity/ptpd/ptpd_1.0.0.bb @@ -0,0 +1,21 @@ 
> +DESCRIPTION = "Precision Time Protocol (PTP) as defined by the IEEE 1588
> standard" +HOMEPAGE = "http://sourceforge.net/projects/ptpd" +LICENSE =
> "BSD" +SECTION = "network" +PR = "r1"

remove that

> + +LIC_FILES_CHKSUM =
> "file://../COPYRIGHT;md5=888bd1b2c9c013b93394b8bfb453c417"

move that next to LICENSE

> + +SRC_URI =
> "http://downloads.sourceforge.net/project/ptpd/ptpd/${PV}/ptpd-${PV}.tar.gz
> \ +           file://add-limit-h.patch;striplevel=2" + +S =
> "${WORKDIR}/ptpd-${PV}/src" + +do_install() { +        install -d
> ${D}${bindir} ${D}${mandir}/man8 +        install -m 4555 ptpd
> ${D}${bindir} +        install -m 644 ptpd.8 ${D}${mandir}/man8 +} + 
> +SRC_URI[md5sum] = "b112b2bedc7f6e6e11a838608b9e0357" +SRC_URI[sha256sum]
> = "8ac1fdcad1e246b0395097dd9af29966c6823533d7e6989aae91506048fb51bc"

move those next to SRC_URI

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (Darwin)
Comment: GPGTools - http://gpgtools.org

iEYEARECAAYFAk7q+LwACgkQMkyGM64RGpF1BQCeKzk8hQ6wwmP8059rerGkKD78
fJUAoIQZTtlHXlTkDlZ7c9XEROAvEwt5
=KpUq
-----END PGP SIGNATURE-----



