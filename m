Return-Path: <eduardo@monkey.io>
Received: from mail-yw0-f178.google.com (mail-yw0-f178.google.com
	[209.85.161.178])
	by mail.openembedded.org (Postfix) with ESMTP id 9B2237391A
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Apr 2016 16:13:26 +0000 (UTC)
Received: by mail-yw0-f178.google.com with SMTP id g133so81232138ywb.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Apr 2016 09:13:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=monkey-io.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=mZv8xZcOM3lDLUkyYlj2EZ89e4o1z9AQIwAV6wXYk2s=;
	b=QTwnKD7iRloer/gmt5I5/ub2vNlMCHDe/vvDPHTjd3hENVAnizFGI0e+kIEq785Jof
	voSkyVCTko1IdFKvFDnpNVk9CDs397RGiPsazvr5aZQAaysAd5rUv3CSOla0XMX0nfLq
	sLjpJLew9E/jMorFs6iokQJZORvmfB4XQRCM5NNpvwkmRG9pO5i2CZC1dR8NUY2vbozm
	8QW+6pocvS6jx4ePdBbPGQ8RVTehdz2Nt+chpRrdLewqaG7q6uR2KpY+9qXhyjLsOk15
	I7LJMVccnJzmn0dn0haA5Rnt82rb7iPcjXCg6yRKnqwdjiMTs+vnw3oUWyKJ04/Jhp3A
	StPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=mZv8xZcOM3lDLUkyYlj2EZ89e4o1z9AQIwAV6wXYk2s=;
	b=BsRmF0lNnJNvnlxbN5lUQLADzmkCRo7zHHsbR1+2GFk1RFD2WjfseitwFg3JEC7la8
	YhTMKhXy7VBbDpCj6OUo/j0B0yQkrlkGxUHTCY7ezUJWaBdxl17WyuQcQAtyv0CvwdFf
	obN6r2hjh2figGJAEgTgAOZN0AI655tEg/zIFmaAQZok6LHQwTF/YQLp8Hiws97BYTQ8
	PtjjjMAGyRnzUxHLnB4ARbsomzePxyFEfeqpT3RhN9iUR5x/nScMjXwURC4DeU5+Qlcr
	Bc0BofxPFF9SF70x5l3rCxdmy1aQocREiL8Lrg6ncHuzfzJuel1ew2VJD9BaAfjE0gx0
	sRWg==
X-Gm-Message-State: AOPr4FWVz1+/B+LDz3birHcRcPotQwiNc7UaTVHmOWt2GIa2UKh5hyIvej2Zjr0t07hGyw==
X-Received: by 10.129.130.135 with SMTP id s129mr5047826ywf.139.1461773607088; 
	Wed, 27 Apr 2016 09:13:27 -0700 (PDT)
Received: from monotop.cabletica.com (ip137-194-15-186.ct.co.cr.
	[186.15.194.137]) by smtp.gmail.com with ESMTPSA id
	z20sm2270330ywd.44.2016.04.27.09.13.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 27 Apr 2016 09:13:26 -0700 (PDT)
From: Eduardo Silva <eduardo@monkey.io>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 27 Apr 2016 10:13:18 -0600
Message-Id: <1461773598-17951-1-git-send-email-eduardo@monkey.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-oe][PATCH v3] fluentbit: add new recipe
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
X-List-Received-Date: Wed, 27 Apr 2016 16:13:27 -0000

Fluent Bit is an open source data collector for Embedded Linux, this
patch adds the recipe for version 0.7.2.

  Project web site: http://fluentbit.io
  Documentation   : http://fluentbit.io/documentation/

Signed-off-by: Eduardo Silva <eduardo@monkey.io>
---
 meta-oe/recipes-extended/fluentbit/fluentbit_0.7.2.bb | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 meta-oe/recipes-extended/fluentbit/fluentbit_0.7.2.bb

diff --git a/meta-oe/recipes-extended/fluentbit/fluentbit_0.7.2.bb b/meta-oe/recipes-extended/fluentbit/fluentbit_0.7.2.bb
new file mode 100644
index 0000000..c75f446
--- /dev/null
+++ b/meta-oe/recipes-extended/fluentbit/fluentbit_0.7.2.bb
@@ -0,0 +1,16 @@
+SUMMARY = "Fast data collector for Embedded Linux"
+HOMEPAGE = "http://fluentbit.io"
+BUGTRACKER = "https://github.com/fluent/fluent-bit/issues"
+
+SRC_URI = "http://fluentbit.io/releases/0.7/fluent-bit-${PV}.tar.gz"
+SRC_URI[md5sum] = "6df9d676e1d2d782a243e655e144e8ae"
+SRC_URI[sha256sum] = "695b56ce378f56855c9554f88f5d8e4f7b11ba7691284903870f779912af4ebe"
+S = "${WORKDIR}/fluent-bit-${PV}"
+
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=2ee41112a44fe7014dce33e26468ba93"
+
+DEPENDS = "zlib"
+INSANE_SKIP_${PN}-dev += "dev-elf"
+
+inherit cmake
-- 
2.7.4


