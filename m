Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE4ECCCD184
	for <webhook@archiver.kernel.org>; Sun, 19 Oct 2025 13:22:15 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web10.24140.1760880129089419595
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 19 Oct 2025 06:22:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FrrvQlZw;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-47118259fd8so17636135e9.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 19 Oct 2025 06:22:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760880127; x=1761484927; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=RDxfeEJ2TOH59Rf5vQSqB8t+Cx4CMNjmS5Ii5hG9wS8=;
        b=FrrvQlZwStak/1dRLJwoaQpAdcVI+qZXO8YmC108xueMGe6Ng0lRRYcMeXupimv2vt
         FbO/JA0cg3tEZe7Kug9ReVK6Dl3do3E2Cv+3c/mastPdvmNHJLk6tQV9r+Y4xodLz/SK
         bBE4gGyErJABNVLB5PAQkm0OHG2UpqRWWKZYv9IIHA6sJK2SL03lvjvP8/yeZBqGgLMz
         8l1jeChuXLU1Gj7nbT1496HxitLbFSEUMSFrPO7K1tHQLZH2DzZ0kf3QJY3qgqo8PYg2
         yroGqypKorDKsU5Zu1knrti7DEaih7TrBpLDWcAT7HqC7NiYS3K77iJc8IsnV0GxyClw
         qT2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760880127; x=1761484927;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RDxfeEJ2TOH59Rf5vQSqB8t+Cx4CMNjmS5Ii5hG9wS8=;
        b=DV3ESsRIwP0Yk1hZbb71v6+OFr40lAGZgQI0WKfEXiFznO6shlcDFrytS5psVmOWif
         t5n4IKPfwMz8KW4BOhDHSiLR3OspVj5yMBn0XWR/xm1l+qCXe/SOxWhoLysap47pVRr2
         GzMWoUwdkBpsRLl3bbIo5XL69BOa/jcsZtnnDMAdcpKxeVws4UCgioUF44PS3ztNlXU4
         9uz8noGRp8POoVfU1eqYF3kVBFZtCrwleYEQlRkr9rFUx1hx+ZKtLKwy/chm0v5N/Ag8
         iVgczP7VGC/idQrDM9BntZ+hXmYSHkmKZDx8nx0dt7WPmmQLunEcv4Ymvff9kMk4eGCd
         wLWQ==
X-Gm-Message-State: AOJu0Yxkrsa0+krEazHI6UDuhBXUeGVsWcdV+1I06FC+C31pgA9ePeUq
	7Eo3BdlepLodU+hyaAgOXw5fFwfo+RGRQjYEMqtf69cfExYuDhxUVM6XrKm3zQ==
X-Gm-Gg: ASbGncvLEp9hJXvzR1WxyoYgDBTK/bQsEZzw47WqTfQIosldqxnB7Q64lTem2cq+4Rc
	Ea88sH0/OMeH2fqa3mgQxUoUgAx9DSiuLuh2oVgTHEBdB/AS99YJmkvS7LLHa5olgczzVpPmDqv
	H4IdA/lUVp+t8SCk7DIEDYd3DlPfL6Hh+wJPOCnHJC8qgQTrgTQWlwgoYgEAgYEdPYvw81CKoMl
	rLGBx+qBQ2IMAwQO5M2WUmQJONmF/lWVN4x+F9HUHoI96+aD7XhQLwGLG40z1dbM2wC1jtx+qoI
	AA5wk2MUyQZzXus1958SkRYldsTFxyCrnXm9Alyu4aQsZcv8PbvtAoqQ7P3Y2S4JzzjGyQ1kEhw
	du1yKHefwcbM61Y2Fd6OgVur33CveEQfOD8qV+TrJJuQ4JtbaEG5vLuw9c+J+Y3zUItrjR7iAnT
	SEmQClLPtU
X-Google-Smtp-Source: AGHT+IGMm5oyKO16T6EZTBZewTCGVHPfrSNi5Vnghm7ghL9L3KXZL6jd+rpHWsgaKOS+eKx4knvCPw==
X-Received: by 2002:a05:600c:4f89:b0:46e:3edc:2811 with SMTP id 5b1f17b1804b1-4711787750dmr63175145e9.14.1760880127017;
        Sun, 19 Oct 2025 06:22:07 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4710ed57cedsm93969425e9.2.2025.10.19.06.22.06
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Oct 2025 06:22:06 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][kirkstone][PATCH] python3-whoosh: Fix an intermittent ptest
Date: Sun, 19 Oct 2025 15:22:05 +0200
Message-ID: <20251019132205.903047-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 19 Oct 2025 13:22:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120791

From: Khem Raj <raj.khem@gmail.com>

It fails sometimes when system is under stress

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 38e2f6a9a94463916d2c4ea5d08f1a554e337f28)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 ...nstic-test_minimize_dfa-test-as-XFAI.patch | 29 +++++++++++++++++++
 .../python/python3-whoosh_2.7.4.bb            |  2 ++
 2 files changed, 31 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-whoosh/0001-Mark-non-determinstic-test_minimize_dfa-test-as-XFAI.patch

diff --git a/meta-python/recipes-devtools/python/python3-whoosh/0001-Mark-non-determinstic-test_minimize_dfa-test-as-XFAI.patch b/meta-python/recipes-devtools/python/python3-whoosh/0001-Mark-non-determinstic-test_minimize_dfa-test-as-XFAI.patch
new file mode 100644
index 0000000000..91fea24524
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-whoosh/0001-Mark-non-determinstic-test_minimize_dfa-test-as-XFAI.patch
@@ -0,0 +1,29 @@
+From ede95a4f4487b4fc3cad8452ae388376966fca0e Mon Sep 17 00:00:00 2001
+From: Chris Lamb <lamby@debian.org>
+Date: Fri, 5 Apr 2019 15:48:23 +0200
+Subject: [PATCH] Mark non-determinstic test_minimize_dfa test as XFAIL
+
+Sourced from Debian [1]
+[1] https://sources.debian.org/src/python-whoosh/2.7.4%2Bgit6-g9134ad92-8/debian/patches/0003-Mark-non-determinstic-test_minimize_dfa-test-as-XFAI.patch/
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ tests/test_automata.py | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/tests/test_automata.py b/tests/test_automata.py
+index daab96c..7031dc3 100644
+--- a/tests/test_automata.py
++++ b/tests/test_automata.py
+@@ -327,6 +327,7 @@ def test_regular():
+     assert not ex.accept("bc")
+ 
+ 
++@pytest.mark.xfail(strict=False)
+ def test_minimize_dfa():
+     # Example from www.cs.odu.edu/~toida/nerzic/390teched/regular/fa/min-fa.html
+ 
+-- 
+2.44.0
+
diff --git a/meta-python/recipes-devtools/python/python3-whoosh_2.7.4.bb b/meta-python/recipes-devtools/python/python3-whoosh_2.7.4.bb
index ed2a6d423f..6d932a8ef8 100644
--- a/meta-python/recipes-devtools/python/python3-whoosh_2.7.4.bb
+++ b/meta-python/recipes-devtools/python/python3-whoosh_2.7.4.bb
@@ -7,6 +7,8 @@ Whoosh works can be extended or replaced to meet your needs exactly."
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=05303186defc6141143629961c7c8a60"
 
+SRC_URI += "file://0001-Mark-non-determinstic-test_minimize_dfa-test-as-XFAI.patch"
+
 SRC_URI[md5sum] = "893433e9c0525ac043df33e6e04caab2"
 SRC_URI[sha256sum] = "e0857375f63e9041e03fedd5b7541f97cf78917ac1b6b06c1fcc9b45375dda69"
 

