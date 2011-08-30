Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QyMti-0001Ks-Nq for openembedded-devel@lists.openembedded.org;
	Tue, 30 Aug 2011 13:54:30 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QyMoz-0000K1-J3 for openembedded-devel@lists.openembedded.org;
	Tue, 30 Aug 2011 13:49:37 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Aug 2011 13:49:37 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Aug 2011 13:49:37 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Tue, 30 Aug 2011 13:49:26 +0200
Message-ID: <j3iio6$u5s$1@dough.gmane.org>
References: <cover.1314691875.git.noor_ahsan@mentor.com>
	<ef49be97f8e75115c1b001694f676f52a53a70c6.1314691875.git.noor_ahsan@mentor.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:6.0) Gecko/20110812 Thunderbird/6.0
In-Reply-To: <ef49be97f8e75115c1b001694f676f52a53a70c6.1314691875.git.noor_ahsan@mentor.com>
X-Enigmail-Version: 1.3
Subject: Re: [meta-oe][PATCH 1/3] bonnie++: Add version 1.03c (initial recipe)
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
X-List-Received-Date: Tue, 30 Aug 2011 11:54:30 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 30-08-11 12:58, Noor, Ahsan schreef:
> From: Noor Ahsan <noor_ahsan@mentor.com>
> 
> * Imported from oe.dev commit id 44985d56bc556786812a0a02d6219afd31a7381d. * Merge .bb and .inc file.
> 
> Signed-off-by: Noor Ahsan <noor_ahsan@mentor.com> --- meta-oe/recipes-benchmark/bonnie/bonnie++_1.03c.bb |   30 ++++++++++++++++++++ .../bonnie/files/gcc-4.3-fixes.patch               |   19 ++++++++++++ 2 files changed, 49 insertions(+), 0 deletions(-) create mode 100644
> meta-oe/recipes-benchmark/bonnie/bonnie++_1.03c.bb create mode 100644 meta-oe/recipes-benchmark/bonnie/files/gcc-4.3-fixes.patch
> 
> diff --git a/meta-oe/recipes-benchmark/bonnie/bonnie++_1.03c.bb b/meta-oe/recipes-benchmark/bonnie/bonnie++_1.03c.bb new file mode 100644 index 0000000..2067307 --- /dev/null +++ b/meta-oe/recipes-benchmark/bonnie/bonnie++_1.03c.bb @@ -0,0 +1,30 @@ +DESCRIPTION = "Tests large file IO and
> creation/deletion of small files." +HOMEPAGE = "http://www.coker.com.au/bonnie++/" +LICENSE = "GPL v2"

without spaces please

> +LIC_FILES_CHKSUM = "file://copyright.txt;md5=cd4dde95a6b9d122f0a9150ae9cc3ee0" + +SRC_URI = "http://www.coker.com.au/bonnie++/bonnie++-${PV}.tgz \ +           file://gcc-4.3-fixes.patch \ +           " +SRC_URI[md5sum] = "77a1ba78f37bdd7f024b67e1e36ad151" +SRC_URI[sha256sum] =
> "c674f1182f4c20f1e6d038feceb0a6617fc3e7658dfbbac89396043b49612a26" + +SCRIPTS = "bon_csv2html bon_csv2txt" +EXES = "bonnie++ zcav"

And move those 2 below the inherit line please.

> + +inherit autotools + +do_install () { +        install -d ${D}/bin +        install -d ${D}/sbin +        install -m 0755 ${EXES} ${D}/sbin +        install -m 0755 ${SCRIPTS} ${D}/bin +} + +PACKAGES += "bonnie-scripts" + +FILES_${PN} = "/sbin" +FILES_bonnie-scripts="/bin" + +TARGET_CC_ARCH
> += "${LDFLAGS}"

and move this one above do_install please. The general idea is to group them by usage and TARGET_CC_ARCH is a configure/compile thing.


regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFOXM5GMkyGM64RGpERAsl1AKClQMALBYl1u1e67wpOM9+Sp3L1rgCeN/tw
jieEZYOfqBAgQFkgDaqmfko=
=mlKS
-----END PGP SIGNATURE-----



