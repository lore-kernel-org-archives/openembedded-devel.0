Return-Path: <ross.burton@intel.com>
Received: from mail-we0-f169.google.com (mail-we0-f169.google.com
	[74.125.82.169])
	by mail.openembedded.org (Postfix) with ESMTP id 3EDE470579
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Jul 2014 16:18:47 +0000 (UTC)
Received: by mail-we0-f169.google.com with SMTP id u56so896498wes.14
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Jul 2014 09:18:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=6Hep/3JIS9uwcTd1dcAbZz6vVP4nQvmo+e8+AYcVnwA=;
	b=aWw2Ce/KeShD3b8oiXvWV9xyF1JE+NtV9dPChJoFrmg/U85EcGuPTWLzpfBbOTG4QU
	n97iO+wcKZThNkrp+DmwfwYuD2OeWPzM+4KrEod3XlR97JaUr5ZSxNw11DwdB8ZVqHuf
	/JG0hzOQIwqDJiUi3gsl9whcyoBFO0+6TaGBoMOK3fY7bl3chCfyrMMXUwm/R5TXdNzl
	pREfZOIINFBtl1LIKQGCAdVdVqqtT7zWa6tt+aPR4269GP0VglIZj6jL4nh4uDI691ku
	2eoj0V5Jv//EAoGHJe0KDMgZV8QB/XBHxekS1b21g7fC/JOkwlDJF7PTwK8Tvj/8Jvrf
	clQA==
X-Gm-Message-State: ALoCoQlMHmn1wX5xWrU5oIBR6U/uyUP2fGHwxmZzXD7K8MOusr6nVE2n4H7Qc88a1H3sQh+NpyKQ
X-Received: by 10.180.24.97 with SMTP id t1mr6803725wif.45.1405441128723;
	Tue, 15 Jul 2014 09:18:48 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id
	au7sm33554040wjc.41.2014.07.15.09.18.47 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 15 Jul 2014 09:18:47 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 15 Jul 2014 17:18:35 +0100
Message-Id: <a06eef80fa6a0912e704aa2d1fce598c46f7b588.1405440532.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1405440532.git.ross.burton@intel.com>
References: <cover.1405440532.git.ross.burton@intel.com>
In-Reply-To: <cover.1405440532.git.ross.burton@intel.com>
References: <cover.1405440532.git.ross.burton@intel.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: [PATCH 5/7] oprofile: use "foreign" automake strictness
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
X-List-Received-Date: Tue, 15 Jul 2014 16:18:48 -0000

oprofile doesn't want GNU-levels of automake strictness so tell it to be
"foreign".

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-kernel/oprofile/oprofile.inc                    |    1 +
 meta/recipes-kernel/oprofile/oprofile/automake-foreign.patch |    7 +++++++
 2 files changed, 8 insertions(+)
 create mode 100644 meta/recipes-kernel/oprofile/oprofile/automake-foreign.patch

diff --git a/meta/recipes-kernel/oprofile/oprofile.inc b/meta/recipes-kernel/oprofile/oprofile.inc
index 76d0b6c..6958203 100644
--- a/meta/recipes-kernel/oprofile/oprofile.inc
+++ b/meta/recipes-kernel/oprofile/oprofile.inc
@@ -20,6 +20,7 @@ FILES_${PN}-staticdev += "${libdir}/${BPN}/lib*.a"
 
 SRC_URI = "file://opstart.patch \
            file://acinclude.m4 \
+           file://automake-foreign.patch \
            file://oprofile-cross-compile-tests.patch \
            file://run-ptest \
            file://root-home-dir.patch"
diff --git a/meta/recipes-kernel/oprofile/oprofile/automake-foreign.patch b/meta/recipes-kernel/oprofile/oprofile/automake-foreign.patch
new file mode 100644
index 0000000..e82a381
--- /dev/null
+++ b/meta/recipes-kernel/oprofile/oprofile/automake-foreign.patch
@@ -0,0 +1,7 @@
+diff --git a/configure.ac b/configure.ac
+index 5740585..cf6c316 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -16 +16 @@ AC_CONFIG_SRCDIR([libop/op_config.h])
+-AM_INIT_AUTOMAKE
++AM_INIT_AUTOMAKE([foreign])
-- 
1.7.10.4


