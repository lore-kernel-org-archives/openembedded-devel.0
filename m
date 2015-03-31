Return-Path: <mario.goulart@gmail.com>
Received: from mail-qc0-f174.google.com (mail-qc0-f174.google.com
	[209.85.216.174])
	by mail.openembedded.org (Postfix) with ESMTP id BEB697391D
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 Mar 2015 13:23:10 +0000 (UTC)
Received: by qcgx3 with SMTP id x3so12939033qcg.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 Mar 2015 06:23:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:organization; bh=cxtxsgiUvjMz7r/UQzPD3AMxnQ5MmXVoX1wesZQoLM8=;
	b=zj+dHBwpFONUmfwUeHLlHwiNN9YeQLrU6PI4dLYUFYMsQyF377SWo03T0r895uCSKg
	bRTuwX1bahwdCFc9lsAkOs5IRePxdWuUrkvS9Ibtq7gQN/4PswBFFa+fqNpDCW/t2Ym1
	vWhJ9AHxZ6J8eRo3wQm8+eRdCxbOoK7l3qzydRGgv7ek8K8BKllXGcc3fuTlkgrSsAkv
	XzPu4Rda+e9z37fGhaAC30euNliDLIFVU/XBs2SQeTcrrtNC+XhdFADOJjLqn4Gcdr0s
	1scg+5NKLLke83YkgEwT6xCRxE3VUtZQi5NCw9q3PhMlvzfAYbrR3erySeGOPXTWBqyH
	FKiw==
X-Received: by 10.229.95.74 with SMTP id c10mr49744159qcn.17.1427808191721;
	Tue, 31 Mar 2015 06:23:11 -0700 (PDT)
Received: from centrium.lab.ossystems.com.br ([177.100.224.72])
	by mx.google.com with ESMTPSA id q129sm9859631qha.4.2015.03.31.06.23.10
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 31 Mar 2015 06:23:11 -0700 (PDT)
Sender: Mario Domenech Goulart <mario.goulart@gmail.com>
From: Mario Domenech Goulart <mario@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 31 Mar 2015 10:22:36 -0300
Message-Id: <1427808158-16502-3-git-send-email-mario@ossystems.com.br>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1427808158-16502-1-git-send-email-mario@ossystems.com.br>
References: <1427808158-16502-1-git-send-email-mario@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: Mario Domenech Goulart <mario@ossystems.com.br>
Subject: [meta-java][PATCH 3/5] cacao-initial-native, jamvm-initial-native: provide virtual/java-initial-native
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
X-List-Received-Date: Tue, 31 Mar 2015 13:23:11 -0000

Since bd9c6023, virtual/java-initial is provided by
cacao-initial-native and jamvm-initial-native.  For consistency, this
commit makes them provide virtual/java-initial-native instead.

Signed-off-by: Mario Domenech Goulart <mario@ossystems.com.br>
---
 README                                           | 2 +-
 recipes-core/cacao/cacao-initial-native_0.98.bb  | 2 +-
 recipes-core/ecj/libecj-bootstrap.inc            | 2 +-
 recipes-core/jamvm/jamvm-initial-native_1.4.5.bb | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/README b/README
index c5bba6c..70af588 100644
--- a/README
+++ b/README
@@ -54,7 +54,7 @@ Usage instructions
 
 You should define at least the following variables in a distro include file or local.conf
 
-PREFERRED_PROVIDER_virtual/java-initial = "cacao-initial"
+PREFERRED_PROVIDER_virtual/java-initial-native = "cacao-initial-native"
 
 PREFERRED_PROVIDER_virtual/java-native = "jamvm-native"
 PREFERRED_PROVIDER_virtual/javac-native = "ecj-bootstrap-native"
diff --git a/recipes-core/cacao/cacao-initial-native_0.98.bb b/recipes-core/cacao/cacao-initial-native_0.98.bb
index 181faca..72c6246 100644
--- a/recipes-core/cacao/cacao-initial-native_0.98.bb
+++ b/recipes-core/cacao/cacao-initial-native_0.98.bb
@@ -4,7 +4,7 @@ LICENSE  = "GPL-2.0"
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
 SECTION  = "interpreters"
 
-PROVIDES = "virtual/java-initial"
+PROVIDES = "virtual/java-initial-native"
 
 inherit native autotools-brokensep
 
diff --git a/recipes-core/ecj/libecj-bootstrap.inc b/recipes-core/ecj/libecj-bootstrap.inc
index 9fb4156..020b8d3 100644
--- a/recipes-core/ecj/libecj-bootstrap.inc
+++ b/recipes-core/ecj/libecj-bootstrap.inc
@@ -5,7 +5,7 @@ HOMEPAGE = "http://www.eclipse.org/"
 LICENSE = "EPL-1.0"
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/EPL-1.0;md5=57f8d5e2b3e98ac6e088986c12bf94e6"
 
-DEPENDS = "fastjar-native jikes-initial-native virtual/java-initial"
+DEPENDS = "fastjar-native jikes-initial-native virtual/java-initial-native"
 
 INC_PR = "r5"
 
diff --git a/recipes-core/jamvm/jamvm-initial-native_1.4.5.bb b/recipes-core/jamvm/jamvm-initial-native_1.4.5.bb
index 25b42b0..bf005db 100644
--- a/recipes-core/jamvm/jamvm-initial-native_1.4.5.bb
+++ b/recipes-core/jamvm/jamvm-initial-native_1.4.5.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
 
 DEPENDS = "zlib-native classpath-initial-native jikes-initial-native libffi-native"
 
-PROVIDES = "virtual/java-initial"
+PROVIDES = "virtual/java-initial-native"
 
 PR = "r1"
 
-- 
2.1.4


