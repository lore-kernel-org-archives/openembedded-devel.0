Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f48.google.com (mail-pl0-f48.google.com
	[209.85.160.48])
	by mail.openembedded.org (Postfix) with ESMTP id 37ADE75585
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  8 Apr 2018 06:59:10 +0000 (UTC)
Received: by mail-pl0-f48.google.com with SMTP id 59-v6so3201004plc.13
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 07 Apr 2018 23:59:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=pdjHP0qaZjMRP8+FOVGX3bxqUSoaKLhtZPWoIm4uxK4=;
	b=hW3GLBxRTOoFWJoep4JAw/9zljcDYV5UfLqAQeAOaWDUm9iENwBYcySRjNt5K9GAr+
	/ZDbz+G4+l8WmX4InOk3DdKaJeM4Q8BKIg55Fh/GxxG8bEymn1TB+DhP94ay5xWlCYfZ
	kaaBVfuaQQlg6fH8xN0GGJjw7yg3auLMNXJ4v+HLui2QEWRrt6bXBp1fmplSQoAjTCE2
	VJvwZ6FXWObgJfV/oVXH6MlOs3Ea7utLj9/F2YlP0OuI8azkA5XF96GKLvZP0MSt0b2/
	doA3rZ+i2KWFQdcMYqFc5ZesGvAfYnhJuYbxpcKau0wSWVIxZ69XjzQSt7HpJNy9wKfw
	RmPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=pdjHP0qaZjMRP8+FOVGX3bxqUSoaKLhtZPWoIm4uxK4=;
	b=DCFi4WjUV1m4JNzzrntPAdko+RXF2S/Ka1UT9mzFghubC8Xta4bCbx2+ne7JR+Djgg
	l4NixR6HD+YgJIXmEKLjxIunXrJmhuYfIdD2aWGO8CnJzEiPS9LQx/Sd+p7maKb1Yywy
	o3dFTXQtWiIDtWeNTEQQd94jGrWHMUjytvylfncEg89s1EwDe8q5KEjhMkZAhQp4QrV1
	QZxOWur6UxcBQ528BxTJqTT5+xO4MwWoUWVyF9yu9Q3h2eI6A0jCu6UlN6fSPtGclMNm
	3bC+uH/uWimcV5WglOvz3fWZf8nOotmasgFf4cCYWnv3+wIGNMjilno1YB/C7Z5vTYDe
	UKjg==
X-Gm-Message-State: AElRT7EKFWNzeeBJDaMtzGMPgabIKSKBg+dlLzvggO4wWyLz3iT2pUeR
	cESPV9gJudG9fuwKXc5Ok/Y1dg==
X-Google-Smtp-Source: AIpwx48VZmK/nh6YwIuSPfBiunqD1Vq1Y0wbXnsNvU0kY+DCXfpw39vz2xU9AbLvFZvDbZ3GOGg7vQ==
X-Received: by 2002:a17:902:6b45:: with SMTP id
	g5-v6mr33124079plt.171.1523170751438; 
	Sat, 07 Apr 2018 23:59:11 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4000:1184:932:e5ef:c5a4:fdbd])
	by smtp.gmail.com with ESMTPSA id
	c186sm20506137pfb.40.2018.04.07.23.59.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 07 Apr 2018 23:59:10 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster808@gmail.com,
	openembedded-devel@lists.openembedded.org
Date: Sat,  7 Apr 2018 23:58:31 -0700
Message-Id: <1523170729-26321-19-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1523170729-26321-1-git-send-email-akuster808@gmail.com>
References: <1523170729-26321-1-git-send-email-akuster808@gmail.com>
Subject: [meta-oe][PATCH 19/37] pyton-pygpme: refresh patches
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
X-List-Received-Date: Sun, 08 Apr 2018 06:59:12 -0000

WARNING:
Some of the context lines in patches were ignored. This can lead to incorrectly applied patches.
The context lines in the patches can be updated with devtool:

    devtool modify <recipe>
    devtool finish --force-patch-refresh <recipe> <layer_path>

Then the updated patches and the source tree (in devtool's workspace)
should be reviewed to make sure the patches apply in the correct place
and don't introduce duplicate lines (which can, and does happen
when some of the context is ignored). Further information:
http://lists.openembedded.org/pipermail/openembedded-core/2018-March/148675.html
https://bugzilla.yoctoproject.org/show_bug.cgi?id=10450
Details:
checking file tests/test_import.py
Hunk #4 succeeded at 122 with fuzz 1.

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../python-pygpgme/0001-reflect-2.1-reporting-for-key-imports.patch | 6 ++++--
 .../python/python-pygpgme/0002-passphrase_cb-is-deprecated.patch    | 6 ++++--
 .../0003-handle-generic-error-when-no-passphrase-callback-pre.patch | 6 ++++--
 3 files changed, 12 insertions(+), 6 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python-pygpgme/0001-reflect-2.1-reporting-for-key-imports.patch b/meta-python/recipes-devtools/python/python-pygpgme/0001-reflect-2.1-reporting-for-key-imports.patch
index f587037..1f31cb8 100644
--- a/meta-python/recipes-devtools/python/python-pygpgme/0001-reflect-2.1-reporting-for-key-imports.patch
+++ b/meta-python/recipes-devtools/python/python-pygpgme/0001-reflect-2.1-reporting-for-key-imports.patch
@@ -1,7 +1,7 @@
-From 1c1812def711803382cc28caea1f35fb7ef774b0 Mon Sep 17 00:00:00 2001
+From ed44474c11f577c1644910964a917a4cf701bb0f Mon Sep 17 00:00:00 2001
 From: Daniel Kahn Gillmor <dkg@fifthhorseman.net>
 Date: Tue, 26 Jan 2016 14:24:26 -0500
-Subject: [PATCH 1/5] reflect 2.1 reporting for key imports
+Subject: [PATCH] reflect 2.1 reporting for key imports
 
 GnuPG 2.1 changes how it reports key imports.  These changes should
 make the pygpgme test suite compatible with GnuPG 2.1.
@@ -12,6 +12,7 @@ https://lists.gnupg.org/pipermail/gnupg-devel/2016-January/030718.html
 Upstream-Status: Backport
 
 Signed-off-by: Catalin Enache <catalin.enache@windriver.com>
+
 ---
  tests/test_import.py | 22 +++++++++++-----------
  1 file changed, 11 insertions(+), 11 deletions(-)
@@ -86,3 +87,4 @@ index 10eb816..597eb47 100644
 +                          None, gpgme.IMPORT_NEW | gpgme.IMPORT_SECRET))
          self.assertEqual(result.imports[3],
                           ('93C2240D6B8AA10AB28F701D2CF46B7FC97E6B0F',
+                           None, gpgme.IMPORT_NEW))
diff --git a/meta-python/recipes-devtools/python/python-pygpgme/0002-passphrase_cb-is-deprecated.patch b/meta-python/recipes-devtools/python/python-pygpgme/0002-passphrase_cb-is-deprecated.patch
index ccd941f..c18cf3f 100644
--- a/meta-python/recipes-devtools/python/python-pygpgme/0002-passphrase_cb-is-deprecated.patch
+++ b/meta-python/recipes-devtools/python/python-pygpgme/0002-passphrase_cb-is-deprecated.patch
@@ -1,7 +1,7 @@
-From dc75482af095d667a4a92655c4e7eb312e80c42d Mon Sep 17 00:00:00 2001
+From ba0dc8273e4f83bcd2d43baa5910aae34b93048c Mon Sep 17 00:00:00 2001
 From: Daniel Kahn Gillmor <dkg@fifthhorseman.net>
 Date: Mon, 1 Feb 2016 19:25:12 -0500
-Subject: [PATCH 2/5] passphrase_cb is deprecated
+Subject: [PATCH] passphrase_cb is deprecated
 
 https://bugs.gnupg.org/gnupg/issue767 indicates that
 gpgme_set_passphrase_cb is a deprecated corner of the API and that
@@ -19,6 +19,7 @@ test suite to be able to make those tests.
 Upstream-Status: Backport
 
 Signed-off-by: Catalin Enache <catalin.enache@windriver.com>
+
 ---
  tests/util.py | 8 +++++++-
  1 file changed, 7 insertions(+), 1 deletion(-)
@@ -48,3 +49,4 @@ index cd803c2..86892ca 100644
 +
          # import requested keys into the keyring
          ctx = gpgme.Context()
+         for key in self.import_keys:
diff --git a/meta-python/recipes-devtools/python/python-pygpgme/0003-handle-generic-error-when-no-passphrase-callback-pre.patch b/meta-python/recipes-devtools/python/python-pygpgme/0003-handle-generic-error-when-no-passphrase-callback-pre.patch
index 462f442..6acb68b 100644
--- a/meta-python/recipes-devtools/python/python-pygpgme/0003-handle-generic-error-when-no-passphrase-callback-pre.patch
+++ b/meta-python/recipes-devtools/python/python-pygpgme/0003-handle-generic-error-when-no-passphrase-callback-pre.patch
@@ -1,7 +1,7 @@
-From 024fe219582143017b2f02bc924c0ed107b63619 Mon Sep 17 00:00:00 2001
+From 579b5930e15de8855bf63b3c20b6c3aaf894c3eb Mon Sep 17 00:00:00 2001
 From: Daniel Kahn Gillmor <dkg@fifthhorseman.net>
 Date: Mon, 1 Feb 2016 19:27:59 -0500
-Subject: [PATCH 3/5] handle generic error when no passphrase callback present
+Subject: [PATCH] handle generic error when no passphrase callback present
 
 apparently gpg 2.1 returns ERR_GENERAL right now if the pinentry was
 in loopback mode and no passphrase callback was supplied.  Earlier
@@ -10,6 +10,7 @@ versions supplied ERR_BAD_PASSPHRASE.
 Upstream-Status: Backport
 
 Signed-off-by: Catalin Enache <catalin.enache@windriver.com>
+
 ---
  tests/test_passphrase.py | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
@@ -26,3 +27,4 @@ index 0a235e9..35b3c59 100644
 +            self.assertEqual(exc.args[1], gpgme.ERR_GENERAL)
          else:
              self.fail('gpgme.GpgmeError not raised')
+ 
-- 
2.7.4


