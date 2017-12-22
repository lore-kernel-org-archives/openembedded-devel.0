Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f193.google.com (mail-qt0-f193.google.com
	[209.85.216.193])
	by mail.openembedded.org (Postfix) with ESMTP id A0DCD77FEC
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Dec 2017 21:13:33 +0000 (UTC)
Received: by mail-qt0-f193.google.com with SMTP id g10so37692441qtj.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Dec 2017 13:13:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=aNdMobCPv89vlkI1hQNT+vR9O7EIbHlMp8VN1xqTzhE=;
	b=NXeW852Cd5qZQ13zTIv45jZ65AVc8oJlXUURz2yhFKslYvXTjgeAKwpaXzLxpnrkrw
	dIyRlu4Kl5647WOB3l/psByOvkUBC2bEoLarSdEkHk8nL6djjZ81bRT54N5MIUq1GCqa
	cp5zlXOXKIR8ISaBfqnRdNJS4Pi8/LNvYMJVetwkFiTkBniVorIJOELe2sP1n3Qspudj
	V8AcfxVbWopWrn8o/p5AGpd/pKsspjwZStd7hV54ihOHeRGY0ySxJisEZt4ffsAHiCPv
	M2JDdgAA6/eQN2CVp2NC6FvDXfo2+kBAQRQcfq2YPN/RUlVtqxFdDba9YG9ZTMO4djjk
	mtHA==
X-Gm-Message-State: AKGB3mJLjVRHqBlImKq0czNI5dV+cMpi5a8Ykj5V3g8u9kZsKBWZrHFd
	BwODplmeRHuXbEvCnfDkWmfV7NXL
X-Google-Smtp-Source: ACJfBoviTaxIES41VY21CT1sdnqBtN9wUdBQUKT1sbt1ULpCqARUYa3s/xZv/2QL28wi2SiuHCJysg==
X-Received: by 10.237.33.205 with SMTP id m13mr22691785qtc.131.1513977214427; 
	Fri, 22 Dec 2017 13:13:34 -0800 (PST)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id
	x40sm14756009qtb.77.2017.12.22.13.13.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 22 Dec 2017 13:13:33 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 22 Dec 2017 16:12:36 -0500
Message-Id: <1513977156-29239-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python3-cassandra-driver: update to version 3.12.0
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
X-List-Received-Date: Fri, 22 Dec 2017 21:13:33 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-cassandra-driver.inc       | 4 ++--
 ...-cassandra-driver_3.11.0.bb => python3-cassandra-driver_3.12.0.bb} | 0
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-cassandra-driver_3.11.0.bb => python3-cassandra-driver_3.12.0.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-cassandra-driver.inc b/meta-python/recipes-devtools/python/python-cassandra-driver.inc
index a522e67..d11e657 100644
--- a/meta-python/recipes-devtools/python/python-cassandra-driver.inc
+++ b/meta-python/recipes-devtools/python/python-cassandra-driver.inc
@@ -8,8 +8,8 @@ LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=2ee41112a44fe7014dce33e26468ba93"
 SRCNAME = "cassandra-driver"
 
-SRC_URI[md5sum] = "1659b074e10c613e5ba1cdf92974a57a"
-SRC_URI[sha256sum] = "643bed0fac08ee91630f0f35556bb62c3b4b007c20d4e6e8d349f769ea648150"
+SRC_URI[md5sum] = "33bfaebe3245bc9f9be3993baf67962f"
+SRC_URI[sha256sum] = "cbd9504e241c6b16d8e50b32ccca2a48b04bb3b855741f010a92b3f3bbbc5627"
 
 DISTUTILS_BUILD_ARGS += " \
     --no-libev \
diff --git a/meta-python/recipes-devtools/python/python3-cassandra-driver_3.11.0.bb b/meta-python/recipes-devtools/python/python3-cassandra-driver_3.12.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-cassandra-driver_3.11.0.bb
rename to meta-python/recipes-devtools/python/python3-cassandra-driver_3.12.0.bb
-- 
2.7.4


