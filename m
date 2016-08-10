Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f193.google.com (mail-qk0-f193.google.com
	[209.85.220.193])
	by mail.openembedded.org (Postfix) with ESMTP id 33DC3771DB
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Aug 2016 00:39:07 +0000 (UTC)
Received: by mail-qk0-f193.google.com with SMTP id o1so2303069qkd.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 09 Aug 2016 17:39:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=RBBaYLmQQE2Dzu5j+w8ddBrjUM5N5N4kRj+tZvBQQGc=;
	b=H4eSIGEMEq+G1sCgwid0/I4kIpr7x71hvKHNJgrwlm11DbYQLwGDMJuIKLwvtJDutv
	Iqc2GIP0lRajw087iU5dmTCN19P4ITOpn7JmuazhYKE+C2WEu04HrrAXqsXDAksG3CTm
	Sx8bYvnqiqy66/dnWTCTDaQTsAWPDO0Pv4xhbAlcO3C+Lbm5rQUx8KhBIBEMkrBEP+uX
	iXAUVsiZvb7JxepvPeSAzhv9GGB+jBhxsFEhXZomTvztBR/uIOkOmWtWGoXaTkFkq4tt
	wfMrv77FFqBVEBCDLdpPowf6BovAiZzKB2u8vub71yTFjTYHehUlvZGB/V/jL8xwzFUb
	6KnA==
X-Gm-Message-State: AEkooutMe5LecKAk4Lw9nlzGzuSpwbbWZjGnxFRLPmlA6LvOJcMTGQbAj1Mmkf7IIm3fvw==
X-Received: by 10.55.195.139 with SMTP id r11mr1415935qkl.113.1470789548194;
	Tue, 09 Aug 2016 17:39:08 -0700 (PDT)
Received: from lnx-desktop.star.lab (c-73-172-178-168.hsd1.md.comcast.net.
	[73.172.178.168]) by smtp.gmail.com with ESMTPSA id
	o131sm4898084qke.20.2016.08.09.17.39.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 09 Aug 2016 17:39:07 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  9 Aug 2016 20:38:53 -0400
Message-Id: <1470789534-602-2-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1470789534-602-1-git-send-email-derek@asterius.io>
References: <1470789534-602-1-git-send-email-derek@asterius.io>
Subject: [meta-oe][PATCH 2/3] libp11: update to version 0.4.0
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
X-List-Received-Date: Wed, 10 Aug 2016 00:39:08 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-oe/recipes-support/libp11/{libp11_0.3.0.bb => libp11_0.4.0.bb} | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)
 rename meta-oe/recipes-support/libp11/{libp11_0.3.0.bb => libp11_0.4.0.bb} (81%)

diff --git a/meta-oe/recipes-support/libp11/libp11_0.3.0.bb b/meta-oe/recipes-support/libp11/libp11_0.4.0.bb
similarity index 81%
rename from meta-oe/recipes-support/libp11/libp11_0.3.0.bb
rename to meta-oe/recipes-support/libp11/libp11_0.4.0.bb
index d97bfc6..a7e43be 100644
--- a/meta-oe/recipes-support/libp11/libp11_0.3.0.bb
+++ b/meta-oe/recipes-support/libp11/libp11_0.4.0.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=fad9b3332be894bab9bc501572864b29"
 DEPENDS = "libtool openssl"
 
 SRC_URI = "git://github.com/OpenSC/libp11.git;protocol=http"
-SRCREV = "6f71240991aa831f6fc2cc5431faf6ebec627ed2"
+SRCREV = "22de793340ab73cafc92f8238afb51a06d8411c3"
 
 S = "${WORKDIR}/git"
 
@@ -21,3 +21,6 @@ do_install_append () {
     rm -rf ${D}${libdir}/*.la
     rm -rf ${D}${docdir}/${BPN}
 }
+
+FILES_${PN} += "${libdir}/pkcs11.so.0*"
+FILES_${PN}-dev += "${libdir}/pkcs11.so"
-- 
1.9.1


