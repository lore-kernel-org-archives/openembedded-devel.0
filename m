Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9D0CC433FE
	for <webhook@archiver.kernel.org>; Thu, 12 May 2022 08:42:21 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web09.1835.1652344926772535616
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 May 2022 01:42:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20210112.gappssmtp.com header.s=20210112
 header.b=OksHaTgF;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.221.42,
 mailfrom: brgl@bgdev.pl)
Received: by mail-wr1-f42.google.com with SMTP id j25so5195196wrc.9
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 May 2022 01:42:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=s+m82vP3VkHHCJUYseOAX1uhIUWmpWNq0W69VmNklEo=;
        b=OksHaTgFzua1+Fyg34mWOOEtiOGGjEZionvqetK3WdDPWf2yE8+kkAY/eM9JyI4hWo
         3QxRva9jSCWuOsmbIi81puHMqToXRcTI36s3aX298UI6vjL23CdCPp2ddOlSSDYyk0N/
         CvBRfEcnQd1n3Yk5C8icdXqMu5i3fuUmy+wZSVgCHhehvIA67Z3IVVpk9hQ3+lrMl3ig
         5HnYTnUui9gh/VhFZSzypcVrXPgVUpEO0F4iVf+lvQv8MwwuqF6ICpTn6geLWh1SIFlx
         msNE37DRXx3zYkuzjjYLG5AFeaN90oAqHOJBR3uqZvbqwVYVJ4IBIVl+5cewAFIASCLv
         a6cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=s+m82vP3VkHHCJUYseOAX1uhIUWmpWNq0W69VmNklEo=;
        b=ywb/s2p9w3Z/Vzg2bQLh7KMFfjwgMo+mAnL6LCqERbZ2sJknerxYktCEoTiK+j6HxQ
         ioM/0fJi2J/e8qJns1mCPCwXOIWpPIiW95b3bTb/so5muZuRcqK19aiLQzR3n7Tkx25X
         EGIcHjIP39+2Fke5+9N4PWTONZXf023b1SnIRtxgMR5I41VTnPvb1Uj5i4eUMb8cIjBt
         mkHK5MWlc9P7B1Y4GnL7+IzU8C6N4hIwDiMlPH+1yheUwxdtWhG8/XFpTdPMV6y9HQWR
         E9Q/EJ/GOAQyfZU0b4cZ85PhLc00SS/ekJgkKheCaozOoWW2tsONHiwOSXQSahU+f761
         MnHg==
X-Gm-Message-State: AOAM533poIjhjumJwahATGI84KYtzneKiC67Zh10VndU6XtVEQg69O3S
	hOyBIzmEhqxXrvobn0/Oz6l4/g==
X-Google-Smtp-Source: 
 ABdhPJyyOXihKuDO+CAhd/msucKEU0Fo7ZsHDtlREl3xkh2S6sXcl2C3Gy+cOGnAvXv3Y7MZ4GWT7w==
X-Received: by 2002:a5d:5011:0:b0:20a:e668:8c77 with SMTP id
 e17-20020a5d5011000000b0020ae6688c77mr26376172wrt.703.1652344931836;
        Thu, 12 May 2022 01:42:11 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:167a:c5b3:9ce9:8648])
        by smtp.gmail.com with ESMTPSA id
 m7-20020a5d6247000000b0020c5253d914sm3531898wrv.96.2022.05.12.01.42.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 May 2022 01:42:11 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [meta-python][PATCH 16/16] python3-web3: new package
Date: Thu, 12 May 2022 10:41:52 +0200
Message-Id: <20220512084152.1388464-17-brgl@bgdev.pl>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220512084152.1388464-1-brgl@bgdev.pl>
References: <20220512084152.1388464-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 12 May 2022 08:42:21 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97063

Add a recipe for web3: a library for interacting with Ethereum.

Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
---
 .../packagegroups/packagegroup-meta-python.bb |  1 +
 .../python/python3-web3_5.29.0.bb             | 20 +++++++++++++++++++
 2 files changed, 21 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-web3_5.29.0.bb

diff --git a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
index 2bf26fc69..d08908939 100644
--- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
+++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
@@ -443,6 +443,7 @@ RDEPENDS:packagegroup-meta-python3 = "\
     python3-visitor \
     python3-waitress \
     python3-watchdog \
+    python3-web3 \
     python3-webcolors \
     python3-webencodings \
     python3-websocket-client \
diff --git a/meta-python/recipes-devtools/python/python3-web3_5.29.0.bb b/meta-python/recipes-devtools/python/python3-web3_5.29.0.bb
new file mode 100644
index 000000000..660d4f6f0
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-web3_5.29.0.bb
@@ -0,0 +1,20 @@
+SUMMARY = "A Python library for interacting with Ethereum."
+HOMEPAGE = "https://github.com/ethereum/web3.py"
+SECTION = "devel/python"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=1dc2732bdc5e50382737979791cbb3b7"
+
+SRC_URI[sha256sum] = "a78acc0f0150013755398ae185c8c7063d9db0777aa09733de22242a746bd30c"
+
+inherit pypi setuptools3
+
+RDEPENDS:${PN} += " \
+    python3-aiohttp \
+    python3-distutils \
+    python3-eth-account \
+    python3-idna \
+    python3-lru-dict \
+    python3-requests \
+    python3-setuptools \
+    python3-websockets \
+"
-- 
2.34.1


