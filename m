Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB8D5C48BF8
	for <webhook@archiver.kernel.org>; Thu, 22 Feb 2024 18:50:39 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web11.20967.1708627832765643315
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 22 Feb 2024 10:50:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fQSN4/dk;
 spf=pass (domain: gmail.com, ip: 209.85.214.182, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1d7881b1843so741995ad.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 22 Feb 2024 10:50:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708627832; x=1709232632; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dFBmEabJwnkW4yfuEJa9vsio2UAwxAF6NCde7s0NrwQ=;
        b=fQSN4/dkxY/sfEl36jetf9tW+EKbFJULsp1LmXFXrROEvw0DcF36B3omzRgqaXGTOO
         l4kX/zcVe7fq/7jbSJNJd+xWrZo4ToIKFG3aaFUX4rLRdjJQeSD2eF9W5X9FN/8NM90/
         EcaDBTdSm8CGEz7UDC03PPNLuc36drRaghCUAT466T0Gm99O7FFu4SxpTlNTDNBiaG75
         gZUuF5SQQXF7S3ZNbOXsljlQnyPlbVv3g5scMyoOvm4l9tKF3ylXbkVozMPcVbPbbcnh
         6Uc/7gj1PQsRHmfzVfc2v8wI5lE1C9ryNxuLaeuY621PaQkL0eA0JuH0L3/0tWIMm5FW
         4LWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708627832; x=1709232632;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dFBmEabJwnkW4yfuEJa9vsio2UAwxAF6NCde7s0NrwQ=;
        b=GrQq2hxLCQG8QVdVOXx3JVXco19TDcOSlGzf45dJhyVyPkaERycnmNLOdCq6zNAQgo
         rOgJph8IbhLPtU3eNLzwdGP9rSUm8HQfIGqRTNMXicc0MunnehXovXut1G2kZxmrvMo/
         OuZVpGa+74NraozRkvGiYD4RLls5gTack3b62tOCMnqB0xvN3Ph/Q4pE2jC4yvmoWBoD
         mrY2YRYTd3ykoZH2j55A0hst2HbtacP3TMMrmWgoNVX+LNx9z2NvaB9lZGpkZLFPu+nP
         d3jUxIKXzTIxp4u5OmhAsALgW/0W7W+16+/yr/cmZWGjEYlg1A854eJ9bdvdH76LfpVi
         NETg==
X-Gm-Message-State: AOJu0YyjESc6cUop/IgkYAayYjv5pfgNLHrOREtwMKzt/NR6J9wr2RsL
	HgPs/FAf8+LEgKqeFBrZm4gkpoBEKXD683cGPSlLgsBgGwETDIGLbdNDcZ3BaMY=
X-Google-Smtp-Source: AGHT+IFCW2+diRkxavzcXDEzkvJS+c9G2uwKZNf9E7Nszi9tM/UXeHfSk2zL9Dk2N+IyBmjsDNjl3Q==
X-Received: by 2002:a17:902:9006:b0:1d7:524:a4f8 with SMTP id a6-20020a170902900600b001d70524a4f8mr21587629plp.41.1708627831631;
        Thu, 22 Feb 2024 10:50:31 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::7619])
        by smtp.gmail.com with ESMTPSA id qa8-20020a17090b4fc800b002989901759bsm4413100pjb.42.2024.02.22.10.50.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Feb 2024 10:50:31 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH v2] python3-jsmin: Fix ptests to run with python 3.12+
Date: Thu, 22 Feb 2024 10:50:29 -0800
Message-ID: <20240222185029.2463631-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.43.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 22 Feb 2024 18:50:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108992

Remove it from problematic tests list ot fast list as it runs ok now.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Fix test output and remove from problematic list

 .../ptest-packagelists-meta-python.inc        |  1 -
 ...d76c2d6bfb917f30ced8f5c0a9a4157f7819.patch | 82 +++++++++++++++++++
 .../python/python3-jsmin/run-ptest            |  3 +-
 .../python/python3-jsmin_3.0.1.bb             |  1 +
 4 files changed, 84 insertions(+), 3 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-jsmin/7a75d76c2d6bfb917f30ced8f5c0a9a4157f7819.patch

diff --git a/meta-python/conf/include/ptest-packagelists-meta-python.inc b/meta-python/conf/include/ptest-packagelists-meta-python.inc
index c899166a7c..790d5b019d 100644
--- a/meta-python/conf/include/ptest-packagelists-meta-python.inc
+++ b/meta-python/conf/include/ptest-packagelists-meta-python.inc
@@ -76,7 +76,6 @@ PTESTS_PROBLEMS_META_PYTHON ="\
     python3-dnspython \
     python3-fastjsonschema \
     python3-gpiod \
-    python3-jsmin \
     python3-ordered-set \
     python3-pillow \
     python3-pint \
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
diff --git a/meta-python/recipes-devtools/python/python3-jsmin/run-ptest b/meta-python/recipes-devtools/python/python3-jsmin/run-ptest
index cbcfffda5b..586608d7b2 100644
--- a/meta-python/recipes-devtools/python/python3-jsmin/run-ptest
+++ b/meta-python/recipes-devtools/python/python3-jsmin/run-ptest
@@ -1,3 +1,2 @@
 #!/bin/sh
-
-python3 test.py
+pytest -vv test.py | sed -e 's/\[...%\]//g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPPED/SKIP/g'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS"){printf "%s: %s\n", $NF, $0}else{print}}'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS") {$NF="";print $0}else{print}}'
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


