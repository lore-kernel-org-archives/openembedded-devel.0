Return-Path: <rehsack@gmail.com>
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
	[209.85.221.45])
	by mail.openembedded.org (Postfix) with ESMTP id 28F267FC0A
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  2 Jan 2020 13:34:18 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id w15so26621743wru.4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 02 Jan 2020 05:34:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id;
	bh=cJoym7Kd0bpD+FTUHKU0KhpyuGwahiP+IVsIvDqHTQU=;
	b=Ofa09ACRm4C9TEafpJ77MZ3wecPo1LM210TSsmoEIbJwNFbX2NRsndPvGtDwUuYaJD
	rhYI2iHp5e+r14FvrKLxxSFJH7CZF3AaaHeyvtjqwCke3w6pNu0bc1GyrpNHeLTXl/8q
	zvtCCw/lAcy/Tns39nZKHVO9WNB5j7sVYz827CzkmmlEgsq9rTUAJKhC5nUJGa40HsG3
	u/B7VLy4aFnIkE2lqjya9TNc1B5wWqF63+Ae50FrLKuCqKosKxu/HwY9/mJuhbPSp3sO
	3nTUR7fq/QD0sntIY1K7r9mxKfwGM/m3NN5EroMyXPsscAzeQWVVSC2+0Po/bgmvbzPJ
	/R0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=cJoym7Kd0bpD+FTUHKU0KhpyuGwahiP+IVsIvDqHTQU=;
	b=rlEVaERxB9vDBn8UgURxyl/XjkKJMt/MXF3vGwXnwzeYrQoDuioA4E5lO4dodW3kQD
	9V+1pSbzhLWJHcUkpsO5NFCQ47LoNIN+JBsWsr4FqY4uBf/QcxdDLaIxsR+Lcl46Prck
	N48cSYihNcUX5lkRBuPcYSl0fRqjdj5Jgwz46tWzsDnZgMV/VcZ27WU/6E5QmtCYaNM0
	d/huov21fiXN0wzh7Q4RTGyYYn3SCDt/KezZx3saKHDVrsS+iWhBR6Qpq24jhPuoTGGU
	qKBrtTboMEReLGRNYGWNTFOYVkay94gEiIIVqb1sj59TjgQdpFYSzQaC3ibnIwWYVlmL
	J3ZQ==
X-Gm-Message-State: APjAAAWfdyUy5qze9dH+9Q/kkV6ckJve1kQUaVATNjbJxEcl6SUSpy4a
	7ocDSQS8oNjci2cOKQ2DVtlml/RkaJM=
X-Google-Smtp-Source: APXvYqxzDjw3+nlcmDn2MG9M0rmhLlDliDtV7B9RVwdl2p9QO9KRoqu6bk8haZafxATAnRylcasV/A==
X-Received: by 2002:adf:e6c5:: with SMTP id y5mr80427654wrm.210.1577972058491; 
	Thu, 02 Jan 2020 05:34:18 -0800 (PST)
Received: from beaker.muppets.liwing.de (p5B25B970.dip0.t-ipconnect.de.
	[91.37.185.112]) by smtp.gmail.com with ESMTPSA id
	s128sm8664174wme.39.2020.01.02.05.34.17
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 02 Jan 2020 05:34:17 -0800 (PST)
Sender: Jens Rehsack <rehsack@gmail.com>
From: Jens Rehsack <sno@netbsd.org>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  2 Jan 2020 14:34:04 +0100
Message-Id: <20200102133404.1274-1-sno@netbsd.org>
X-Mailer: git-send-email 2.17.1
Cc: Jens Rehsack <sno@netbsd.org>
Subject: [meta-perl][PATCH] libfile-slurper-perl: add recipe
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 02 Jan 2020 13:34:18 -0000

Since File::Slurp is broken since ages and File::Slurp::Tiny discouraged
for some years, newer perl5 module distributions often rely on File::Slurper.

Signed-off-by: Jens Rehsack <sno@netbsd.org>
---
 .../libfile/libfile-slurper-perl_0.012.bb     | 36 +++++++++++++++++++
 1 file changed, 36 insertions(+)
 create mode 100644 meta-perl/recipes-perl/libfile/libfile-slurper-perl_0.012.bb

diff --git a/meta-perl/recipes-perl/libfile/libfile-slurper-perl_0.012.bb b/meta-perl/recipes-perl/libfile/libfile-slurper-perl_0.012.bb
new file mode 100644
index 000000000..b684abd4b
--- /dev/null
+++ b/meta-perl/recipes-perl/libfile/libfile-slurper-perl_0.012.bb
@@ -0,0 +1,36 @@
+SUMMARY = "A simple, sane and efficient module to slurp a file"
+DESCRIPTION = "This module provides functions for fast and correct slurping and spewing. \
+All functions are optionally exported. All functions throw exceptions on \
+errors, write functions don't return any meaningful value."
+
+SECTION = "libs"
+LICENSE = "Artistic-1.0 | GPL-1.0+"
+
+HOMEPAGE=       "https://metacpan.org/release/File-Slurper"
+
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/Artistic-1.0;md5=cda03bbdc3c1951996392b872397b798 \
+file://${COMMON_LICENSE_DIR}/GPL-1.0;md5=e9e36a9de734199567a4d769498f743d"
+
+SRC_URI = "${CPAN_MIRROR}/authors/id/L/LE/LEONT/File-Slurper-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "5742c63096392dfee50b8db314bcca18"
+SRC_URI[sha256sum] = "4efb2ea416b110a1bda6f8133549cc6ea3676402e3caf7529fce0313250aa578"
+RDEPENDS_${PN} = " \
+    perl-module-carp \
+    perl-module-encode \
+    perl-module-exporter \
+    perl-module-perlio \
+    perl-module-perlio-encoding \
+    perl-module-strict \
+    perl-module-warnings \
+"
+
+RDEPENDS_${PN}-ptest += "libtest-warnings-perl \
+    perl-module-test-more \
+    "
+
+S = "${WORKDIR}/File-Slurper-${PV}"
+
+inherit cpan allarch ptest-perl
+
+BBCLASSEXTEND = "native"
-- 
2.17.1


