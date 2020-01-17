Return-Path: <sumit.garg@linaro.org>
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
	[209.85.215.195])
	by mail.openembedded.org (Postfix) with ESMTP id CF5327FA29
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Jan 2020 07:19:26 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id s64so11205827pgb.9
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Jan 2020 23:19:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=s0BWEQIvf9TTVQiS3gwAIuIBWtTAn9NxV+Eu9Yf7I30=;
	b=cVix6Ws7NK3kmjQ7AvwdKgX6eV8bkITPuGRkV82ThGx4oBMCBytKxWnXCMtLqIr0uW
	iqgFQ/iZAJrrzLlsIfVCdFUW7ApDmcUnCwu8sCvPISUVMyxF+EOtUQv8GPB99yykGzqs
	tLg8MXFJobOjQigh9xppLWCLI1YIToENi5a4iFfUoy8IguMNV9aZT5G99tajoH47n5nO
	jTop4kvxL4M7PdvymNYN+CJNRPKBavbpxb5hazWNhLFqBG9NZBXGY4tiWMvvh1k7lCvW
	oVBCPYPEOBEGR0q5bE2Ly8WYinR5Xc66SHTA9wheEsazSgLCe9oOlk1Ls59GHnQy6HN+
	8/VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=s0BWEQIvf9TTVQiS3gwAIuIBWtTAn9NxV+Eu9Yf7I30=;
	b=hjOQtjuDt81mSBBlMgI/NcrrzCOraw8ixEPkB5VPtT/3U7GiVOyOpqyO6bxHsLTpPg
	L4vhMDz0bzWiJortCXwepP8LeOJOr+j2CfRHwAnkl9V18G7/cGWwlJxQoVszO4pbU8/i
	qo9GDgpQPzpd1UO4hGJoxiuix8LYd7IGqNY6/SCANI6OP3Zz1Z82EDquZOOMcrLEA+9n
	kTxyBq63zRFc5cbOkqJShXevzvsOMSsO5ok3HKfPvs8tQTz8N8wr4mDvoHYEFjAWcH98
	O3OW2wZAH/j2x4++0sgOZPsfN+hAzsO/xpmlfi7l4h2760Y/ItzFqVIgNmkowUZIwnBe
	gnVA==
X-Gm-Message-State: APjAAAUEO9yshD6s19Hh16G/ejTn/eIeR++h8FBmUlxp4eaMIQyx/Db/
	rSFyKSDeX/nKqURziS+MCgksG+kOW9c=
X-Google-Smtp-Source: APXvYqy7sPXRQZDo7nI0AqCVcxhTtW5Z2NqWcUxtefNH3/ndXqQoFuEr5vr7jKxp/jCcA5O0RPXgVg==
X-Received: by 2002:a63:5062:: with SMTP id q34mr43684965pgl.378.1579245567309;
	Thu, 16 Jan 2020 23:19:27 -0800 (PST)
Received: from localhost.localdomain ([117.252.69.227])
	by smtp.gmail.com with ESMTPSA id
	v4sm27777424pff.174.2020.01.16.23.19.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 16 Jan 2020 23:19:26 -0800 (PST)
From: Sumit Garg <sumit.garg@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 17 Jan 2020 12:49:11 +0530
Message-Id: <1579245551-14394-1-git-send-email-sumit.garg@linaro.org>
X-Mailer: git-send-email 2.7.4
Cc: daniel.thompson@linaro.org
Subject: [meta-networking][PATCH] meta-networking: fix recipes build with external tool-set
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
X-List-Received-Date: Fri, 17 Jan 2020 07:19:27 -0000

- drbd-utils: fix native tool dependency which was implicitly met while
  building with source GCC tool-set.
- unbound: Use HOST_SYS variable instead of TARGET_PREFIX for libtool as
  TARGET_PREFIX may vary from source GCC tool-set to external GCC
  tool-set. Also, libtool-cross is installed in recipe sysroot using
  HOST_SYS variable only.

Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
---
 meta-networking/recipes-support/drbd/drbd-utils_9.11.0.bb | 2 ++
 meta-networking/recipes-support/unbound/unbound_1.9.4.bb  | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/drbd/drbd-utils_9.11.0.bb b/meta-networking/recipes-support/drbd/drbd-utils_9.11.0.bb
index 286b0f6..01bb16a 100644
--- a/meta-networking/recipes-support/drbd/drbd-utils_9.11.0.bb
+++ b/meta-networking/recipes-support/drbd/drbd-utils_9.11.0.bb
@@ -23,6 +23,8 @@ UPSTREAM_CHECK_URI = "https://github.com/LINBIT/drbd-utils/releases"
 SYSTEMD_SERVICE_${PN} = "drbd.service"
 SYSTEMD_AUTO_ENABLE = "disable"
 
+DEPENDS = "flex-native"
+
 inherit autotools-brokensep systemd
 
 EXTRA_OECONF = " \
diff --git a/meta-networking/recipes-support/unbound/unbound_1.9.4.bb b/meta-networking/recipes-support/unbound/unbound_1.9.4.bb
index 03eb2fa..6200214 100644
--- a/meta-networking/recipes-support/unbound/unbound_1.9.4.bb
+++ b/meta-networking/recipes-support/unbound/unbound_1.9.4.bb
@@ -23,7 +23,7 @@ S = "${WORKDIR}/git"
 
 EXTRA_OECONF = "--with-libexpat=${STAGING_EXECPREFIXDIR} \
 		--with-ssl=${STAGING_EXECPREFIXDIR} \
-		libtool=${TARGET_PREFIX}libtool \
+		libtool=${HOST_SYS}-libtool \
 "
 		
 
-- 
2.7.4


