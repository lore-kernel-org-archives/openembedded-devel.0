Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77D72C5478C
	for <webhook@archiver.kernel.org>; Thu, 22 Feb 2024 18:03:09 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web10.20012.1708624979320891039
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 22 Feb 2024 10:02:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hcutELRi;
 spf=pass (domain: gmail.com, ip: 209.85.210.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-6e457fab0e2so58828b3a.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 22 Feb 2024 10:02:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708624978; x=1709229778; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Z03g7iAxs2uhIY9IJamvpQ44x7Hbs+unUVkkGjdwpnY=;
        b=hcutELRiiaCGO8j+A+z1F18t+dxenh770QM11qKmtnGaQxl//+hYbCCXYMcee65SvG
         oNTRQzjSuao+BVhuP88e6oCR4PPleX2XCut/p3yEpNVi8BdwNdlpn9l+jYsgzX+LoRGW
         jhxiZ4VpgvaL1YLnBelluyK3RfMXVlXX/72WIZcbWPHjfoun+fGF/F2TXoHZWHJ+Zg+P
         LbhyHRvf3e5WEUUy1cbbtQBd9/gnpvsh6/tr4ToTB5FhAoco965zY/QKHjpwBsM9ED6l
         qadWAEdKQLEYbnc6oKowrthOFWHQf3pXkRwMMOq0s23cV9lThaQo7hfjMr/RY6KsjKva
         q4xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708624978; x=1709229778;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z03g7iAxs2uhIY9IJamvpQ44x7Hbs+unUVkkGjdwpnY=;
        b=XTZlxId7WHE1ZAy2HIOJXUDgdpmDqz09Hdbl4Wx3O2jUDbG7+0u3OcoMKFjArndDuk
         iq+nvJmHlzsnT0ysAb4jAPpfivq/LNvJi9CVk1ajn3wO7NMtnODlYZzuGQ0WPURnY1BA
         BBgpq0SHt56OanvNw35GuVfp62HGXf5MHi10R6Qu5yNGkSJ2KzDtksWC1orqJmrsr8dC
         g/2DH93dEMJskqfeG2lnsOJcbzRlzyWZmeBhoepEDxYBNUaoYK2UOXpYLoTQ9UsKfwhf
         kKiMyVwQLUUm4+v9zTm6cBESosYEREKAOSWfJemn5lQoppA14DPXNsz9K9XE5zKysRMd
         AcPw==
X-Gm-Message-State: AOJu0YxMLdS3xi2V7t1mKYup6Cq0wItJ5zbIbydmqK8tarN1rhLgbYNj
	fjYyocslpq747Qo3YilBcuelXDLEaKtiTBUXL0l7ZKU+GkgGIGaBibQryoBq6Qo=
X-Google-Smtp-Source: AGHT+IFXYMfGTpAFmpeOSq/CpU54B5mQ4ow41lkPHkNlFiHdKs3RU5QjmCr4PqPw4xed/vVW9b9MJQ==
X-Received: by 2002:aa7:9dcd:0:b0:6e4:7a6c:7035 with SMTP id g13-20020aa79dcd000000b006e47a6c7035mr4125473pfq.2.1708624978488;
        Thu, 22 Feb 2024 10:02:58 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::7619])
        by smtp.gmail.com with ESMTPSA id o25-20020a056a001b5900b006e3b868b8b2sm9872117pfv.156.2024.02.22.10.02.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Feb 2024 10:02:58 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH] python3-jsmin: Fix ptests to run with python 3.12+
Date: Thu, 22 Feb 2024 10:02:56 -0800
Message-ID: <20240222180256.2212406-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.43.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 22 Feb 2024 18:03:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108991

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...d76c2d6bfb917f30ced8f5c0a9a4157f7819.patch | 82 +++++++++++++++++++
 .../python/python3-jsmin_3.0.1.bb             |  1 +
 2 files changed, 83 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-jsmin/7a75d76c2d6bfb917f30ced8f5c0a9a4157f7819.patch

diff --git a/meta-python/recipes-devtools/python/python3-jsmin/7a75d76c2d6bfb917f30ced8f5c0a9a4157f7819.patch b/meta-python/recipes-devtools/python/python3-jsmin/7a75d76c2d6bfb917f30ced8f5c0a9a4157f7819.patch
new file mode 100644
index 0000000000..2646e2f5a0
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-jsmin/7a75d76c2d6bfb917f30ced8f5c0a9a4157f7819.patch
@@ -0,0 +1,82 @@
+From 7a75d76c2d6bfb917f30ced8f5c0a9a4157f7819 Mon Sep 17 00:00:00 2001
+From: aekoroglu <ali.erdinc.koroglu@intel.com>
+Date: Fri, 24 Jun 2022 14:12:59 +0300
+Subject: [PATCH] DeprecationWarning invalid escape sequence fix
+
+Upstream-Status: Submitted [https://github.com/tikitu/jsmin/pull/38]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ jsmin/test.py | 22 +++++++++++-----------
+ 1 file changed, 11 insertions(+), 11 deletions(-)
+
+diff --git a/jsmin/test.py b/jsmin/test.py
+index 173ac65..afea4e7 100644
+--- a/jsmin/test.py
++++ b/jsmin/test.py
+@@ -337,8 +337,8 @@ def testImplicitSemicolon3(self):
+         self.assertMinified("return//comment...\r\na", "return\na")
+ 
+     def testSingleComment2(self):
+-        self.assertMinified('x.replace(/\//, "_")// slash to underscore',
+-                'x.replace(/\//,"_")')
++        self.assertMinified('x.replace(/\\//, "_")// slash to underscore',
++                'x.replace(/\\//,"_")')
+ 
+     def testSlashesNearComments(self):
+         original = '''
+@@ -383,8 +383,8 @@ def test_space_in_regex(self):
+         self.assertMinified(original, original)
+ 
+     def test_brackets_around_slashed_regex(self):
+-        original = 'function a() { /\//.test("a") }'
+-        expected = 'function a(){/\//.test("a")}'
++        original = 'function a() { /\\//.test("a") }'
++        expected = 'function a(){/\\//.test("a")}'
+         self.assertMinified(original, expected)
+ 
+     def test_angular_1(self):
+@@ -455,12 +455,12 @@ def testBackticksTagged(self):
+     def test_issue_bitbucket_16(self):
+         original = """
+             f = function() {
+-                return /DataTree\/(.*)\//.exec(this._url)[1];
++                return /DataTree\\/(.*)\\//.exec(this._url)[1];
+             }
+         """
+         self.assertMinified(
+             original,
+-            'f=function(){return /DataTree\/(.*)\//.exec(this._url)[1];}')
++            'f=function(){return /DataTree\\/(.*)\\//.exec(this._url)[1];}')
+ 
+     def test_issue_bitbucket_17(self):
+         original = "// hi\n/^(get|post|head|put)$/i.test('POST')"
+@@ -470,7 +470,7 @@ def test_issue_bitbucket_17(self):
+     def test_issue_6(self):
+         original = '''
+             respond.regex = {
+-                comments: /\/\*[^*]*\*+([^/][^*]*\*+)*\//gi,
++                comments: /\\/\\*[^*]*\\*+([^/][^*]*\\*+)*\\//gi,
+                 urls: 'whatever'
+             };
+         '''
+@@ -548,16 +548,16 @@ def test_issue_9_multi_comments(self):
+ 
+     def test_issue_12_re_nl_if(self):
+         original = '''
+-            var re = /\d{4}/
++            var re = /\\d{4}/
+             if (1) { console.log(2); }'''
+         self.assertMinified(
+-            original, 'var re=/\d{4}/\nif(1){console.log(2);}')
++            original, 'var re=/\\d{4}/\nif(1){console.log(2);}')
+ 
+     def test_issue_12_re_nl_other(self):
+         original = '''
+-            var re = /\d{4}/
++            var re = /\\d{4}/
+             g = 10'''
+-        self.assertMinified(original , 'var re=/\d{4}/\ng=10')
++        self.assertMinified(original , 'var re=/\\d{4}/\ng=10')
+ 
+     def test_preserve_copyright(self):
+         original = '''
diff --git a/meta-python/recipes-devtools/python/python3-jsmin_3.0.1.bb b/meta-python/recipes-devtools/python/python3-jsmin_3.0.1.bb
index 15c9b14595..c3129e7b53 100644
--- a/meta-python/recipes-devtools/python/python3-jsmin_3.0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-jsmin_3.0.1.bb
@@ -10,6 +10,7 @@ SRC_URI[sha256sum] = "c0959a121ef94542e807a674142606f7e90214a2b3d1eb17300244bbb5
 BBCLASSEXTEND = "native nativesdk"
 
 SRC_URI += " \
+  file://7a75d76c2d6bfb917f30ced8f5c0a9a4157f7819.patch \
 	file://run-ptest \
 "
 
-- 
2.43.2


