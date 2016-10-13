Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f196.google.com (mail-qk0-f196.google.com
	[209.85.220.196])
	by mail.openembedded.org (Postfix) with ESMTP id 550F46FF80
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Oct 2016 21:59:40 +0000 (UTC)
Received: by mail-qk0-f196.google.com with SMTP id z190so7211182qkc.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Oct 2016 14:59:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Fg/YqsValc+sqw19heSpgGA6/pV7vj40zgz+ndoKCU8=;
	b=iqQsPwq0in+gFVZZcw2btFwl4iE1s/QF9EJd7UmK6Z7T+t4cT2Co9pbDMvfFJU76c0
	T/ZJDKF8f+zapFrGgZPcfYHlqoXyYAfVAqGO3ogdSBF8gLBAoHv+DGTGymlPWh/uZcX6
	xymm8zjISKfGpNR7fkL0fICOSY4Ikaqmo7f+1e1iYb9a2W1EO7Wwn6hj7SuzFpGRNA4E
	vtFIPIuLY12gjWeKdWB/sdLXQUWsggnePafEZRiKtshrfQhqjBj0u/mZDrmQB5pDxELu
	o7Sk20f4MDYnHrd/p9PU2sBL/QV8x0TuB8hbOUZdIQ4CvdUQjq2xZainaj03A3IzAGot
	mSRg==
X-Gm-Message-State: AA6/9RnVuqSl3Ddrx5NG7xTShhvu8aOdXnx1s2m6O/75nVBRouKVQDQK6XPalBu2PnlJkg==
X-Received: by 10.55.204.215 with SMTP id n84mr10226449qkl.240.1476395981487; 
	Thu, 13 Oct 2016 14:59:41 -0700 (PDT)
Received: from sparta.ny.asterius.io (ool-457cd903.dyn.optonline.net.
	[69.124.217.3]) by smtp.gmail.com with ESMTPSA id
	t30sm5900597qtt.22.2016.10.13.14.58.55
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 13 Oct 2016 14:58:59 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 13 Oct 2016 17:58:18 -0400
Message-Id: <1476395898-16502-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-certifi: update to version 2016.9.26
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
X-List-Received-Date: Thu, 13 Oct 2016 21:59:41 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-certifi.inc                | 4 ++--
 .../{python-certifi_2016.8.8.bb => python-certifi_2016.9.26.bb}       | 0
 .../{python3-certifi_2016.8.8.bb => python3-certifi_2016.9.26.bb}     | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-certifi_2016.8.8.bb => python-certifi_2016.9.26.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-certifi_2016.8.8.bb => python3-certifi_2016.9.26.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-certifi.inc b/meta-python/recipes-devtools/python/python-certifi.inc
index 77fa53b..894154d 100644
--- a/meta-python/recipes-devtools/python/python-certifi.inc
+++ b/meta-python/recipes-devtools/python/python-certifi.inc
@@ -7,8 +7,8 @@ HOMEPAGE = " http://certifi.io/"
 LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=f77f61d14ee6feac4228d3ebd26cc1f1"
 
-SRC_URI[md5sum] = "b57513f7670482da45bb350b792f659e"
-SRC_URI[sha256sum] = "99864ed602d8a9d212e339b15ffa438895002eda7b7db20dca5309dac9605ae9"
+SRC_URI[md5sum] = "baa81e951a29958563689d868ef1064d"
+SRC_URI[sha256sum] = "8275aef1bbeaf05c53715bfc5d8569bd1e04ca1e8e69608cc52bcaac2604eb19"
 
 BBCLASSEXTEND = "native nativesdk"
 
diff --git a/meta-python/recipes-devtools/python/python-certifi_2016.8.8.bb b/meta-python/recipes-devtools/python/python-certifi_2016.9.26.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-certifi_2016.8.8.bb
rename to meta-python/recipes-devtools/python/python-certifi_2016.9.26.bb
diff --git a/meta-python/recipes-devtools/python/python3-certifi_2016.8.8.bb b/meta-python/recipes-devtools/python/python3-certifi_2016.9.26.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-certifi_2016.8.8.bb
rename to meta-python/recipes-devtools/python/python3-certifi_2016.9.26.bb
-- 
2.7.4


