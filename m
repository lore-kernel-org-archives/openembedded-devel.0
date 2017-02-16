Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f196.google.com (mail-qt0-f196.google.com
	[209.85.216.196])
	by mail.openembedded.org (Postfix) with ESMTP id A4B0F77240
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Feb 2017 22:59:50 +0000 (UTC)
Received: by mail-qt0-f196.google.com with SMTP id h53so4076677qth.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Feb 2017 14:59:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=AKbAh5Quadbcqf81x/mdEJFkVX6+qNEthrEGF1rdyBE=;
	b=l2sdMqlnR+Zxu9yzyRPUaazWtujhETE9W0hwPc6GuQM4Jf18iVCzJgYnHYltbeiHst
	cxqm8OY0NUixEjM4YdqyYRCJoAsXUwbE1lo/rwY+i9BmEOznSUQ6v2ffSplcdS2vXRPT
	G6ktDCBCINW75hznxIK83FaANK0xLY1WWFqyeGBpYGsWBGJNImbtBy77CfOx/OU5PAWE
	DzPn0EXankUcnyqRjIOMGy79O57rAXNgIn7LCkNMxxVRiktdx+pHGz3WvjrBhX9kcjWl
	ucVvZdi+8CQXelsn9i3RaxS+LgmYATzEJY252T+mnxZMBrlPLCh4uNueqjwPK0s7ezWz
	eosw==
X-Gm-Message-State: AMke39kUgcLuGdXAIyww88bRv1rfI11CWKMnfQaGEQLpgf7JJJDoqMsGZeJSZRtg39ME6A==
X-Received: by 10.237.34.38 with SMTP id n35mr4369917qtc.253.1487285991310;
	Thu, 16 Feb 2017 14:59:51 -0800 (PST)
Received: from sparta.ny.asterius.io (ool-435561e0.dyn.optonline.net.
	[67.85.97.224]) by smtp.gmail.com with ESMTPSA id
	b28sm5297900qkj.59.2017.02.16.14.59.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 16 Feb 2017 14:59:50 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 16 Feb 2017 17:59:44 -0500
Message-Id: <1487285984-7526-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-decorator: update to version 4.0.11
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
X-List-Received-Date: Thu, 16 Feb 2017 22:59:51 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-decorator.inc            | 6 +++---
 .../{python-decorator_4.0.10.bb => python-decorator_4.0.11.bb}      | 0
 meta-python/recipes-devtools/python/python3-decorator_4.0.10.bb     | 2 --
 meta-python/recipes-devtools/python/python3-decorator_4.0.11.bb     | 6 ++++++
 4 files changed, 9 insertions(+), 5 deletions(-)
 rename meta-python/recipes-devtools/python/{python-decorator_4.0.10.bb => python-decorator_4.0.11.bb} (100%)
 delete mode 100644 meta-python/recipes-devtools/python/python3-decorator_4.0.10.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-decorator_4.0.11.bb

diff --git a/meta-python/recipes-devtools/python/python-decorator.inc b/meta-python/recipes-devtools/python/python-decorator.inc
index 9264cef..aeae231 100644
--- a/meta-python/recipes-devtools/python/python-decorator.inc
+++ b/meta-python/recipes-devtools/python/python-decorator.inc
@@ -7,10 +7,10 @@ can be abused and you should not try to solve every problem with a \
 decorator, just because you can."
 
 LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=41e24e0e235a97e60cdb5c4137fa2cd0"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=893f896413826096ce5270c700a498fd"
 
-SRC_URI[md5sum] = "434b57fdc3230c500716c5aff8896100"
-SRC_URI[sha256sum] = "9c6e98edcb33499881b86ede07d9968c81ab7c769e28e9af24075f0a5379f070"
+SRC_URI[md5sum] = "73644c8f0bd4983d1b6a34b49adec0ae"
+SRC_URI[sha256sum] = "953d6bf082b100f43229cf547f4f97f97e970f5ad645ee7601d55ff87afdfe76"
 
 inherit pypi
 
diff --git a/meta-python/recipes-devtools/python/python-decorator_4.0.10.bb b/meta-python/recipes-devtools/python/python-decorator_4.0.11.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-decorator_4.0.10.bb
rename to meta-python/recipes-devtools/python/python-decorator_4.0.11.bb
diff --git a/meta-python/recipes-devtools/python/python3-decorator_4.0.10.bb b/meta-python/recipes-devtools/python/python3-decorator_4.0.10.bb
deleted file mode 100644
index 844cbdc..0000000
--- a/meta-python/recipes-devtools/python/python3-decorator_4.0.10.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-inherit setuptools3
-require python-decorator.inc
diff --git a/meta-python/recipes-devtools/python/python3-decorator_4.0.11.bb b/meta-python/recipes-devtools/python/python3-decorator_4.0.11.bb
new file mode 100644
index 0000000..7840b20
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-decorator_4.0.11.bb
@@ -0,0 +1,6 @@
+inherit setuptools3
+require python-decorator.inc
+
+RDEPENDS_${PN}_class-target += "\
+    ${PYTHON_PN}-enum \
+"
-- 
2.7.4


