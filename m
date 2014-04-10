Return-Path: <trevor.woerner@linaro.org>
Received: from mail-oa0-f54.google.com (mail-oa0-f54.google.com
	[209.85.219.54])
	by mail.openembedded.org (Postfix) with ESMTP id F1BD365E83
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Apr 2014 16:58:29 +0000 (UTC)
Received: by mail-oa0-f54.google.com with SMTP id n16so4816443oag.13
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Apr 2014 09:58:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=LZq4mdAz7U/tHuesZ7hF2clsy2GoKFnyLMSrBKNfm+w=;
	b=IcRvOil2AZGlfTrYDR7JGCe3Vxt84JrJsxIGivrvyG/+pQ+wsxQO9D597pdpvga45r
	QmBZv8emrpQ5q01g8RdsVWY0hasUVA1KApTZhl7mUSV8TbGX7py6eZwlZ/pCnNirYaDo
	VSHpjNfPAGucMxgEvb+A0yHrLVhHnZnp7uSg1qhw4yehhW0w+TLmiPrxgekQ/tSY/usZ
	CeGidwFi1YYddtVpPRuBGwc2oHcUrHjS9Bf9K7cuVOnekI2cGF04Ts9aZdnhHmTce3pn
	e+VNZ/BFvG/v4HHE6yciNMUxpC98UvzwB0T54ghnHVak/t3MF+/js7pwEf57lB9KJLIN
	FkyQ==
X-Gm-Message-State: ALoCoQnxC7lTGpuICCETQ+Pu5EVXvCwmXo7LXFEAoT/ATzZH4o/EWulfph9ajIx4fvzH1aSD+O0e
X-Received: by 10.60.59.196 with SMTP id b4mr15076858oer.48.1397149110616;
	Thu, 10 Apr 2014 09:58:30 -0700 (PDT)
Received: from openSUSE-i7.site (69-165-220-158.dsl.teksavvy.com.
	[69.165.220.158]) by mx.google.com with ESMTPSA id
	oz15sm19863136oeb.13.2014.04.10.09.58.29 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 10 Apr 2014 09:58:30 -0700 (PDT)
From: Trevor Woerner <trevor.woerner@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 10 Apr 2014 12:58:17 -0400
Message-Id: <1397149098-1303-2-git-send-email-trevor.woerner@linaro.org>
X-Mailer: git-send-email 1.9.0
In-Reply-To: <1397149098-1303-1-git-send-email-trevor.woerner@linaro.org>
References: <1397149098-1303-1-git-send-email-trevor.woerner@linaro.org>
Cc: patches@linaro.org
Subject: [meta-oe][PATCH 1/2] bdftopcf: add recipe
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
X-List-Received-Date: Thu, 10 Apr 2014 16:58:33 -0000

Signed-off-by: Trevor Woerner <trevor.woerner@linaro.org>
---
 meta-oe/recipes-graphics/xorg-app/bdftopcf_1.0.4.bb | 13 +++++++++++++
 1 file changed, 13 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/xorg-app/bdftopcf_1.0.4.bb

diff --git a/meta-oe/recipes-graphics/xorg-app/bdftopcf_1.0.4.bb b/meta-oe/recipes-graphics/xorg-app/bdftopcf_1.0.4.bb
new file mode 100644
index 0000000..2b0775d
--- /dev/null
+++ b/meta-oe/recipes-graphics/xorg-app/bdftopcf_1.0.4.bb
@@ -0,0 +1,13 @@
+SUMMARY = "bdftopcf is a font compiler for the X server and font server"
+HOMEPAGE = "http://cgit.freedesktop.org/xorg/app/bdftopcf/"
+SECTION = "x11/app"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://COPYING;md5=f9a35333adf75edd1eaef84bca65a490"
+DEPENDS = "libxfont"
+
+SRC_URI[md5sum] = "96a648a332160a7482885800f7a506fa"
+SRC_URI[sha256sum] = "eaf59057ba3d7cffe29526562ce50868da7da823487a4cfb3e16946e5ffd2798"
+
+require recipes-graphics/xorg-app/xorg-app-common.inc
+
+BBCLASSEXTEND = "native"
-- 
1.9.0


