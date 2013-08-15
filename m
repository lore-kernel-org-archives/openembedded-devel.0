Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f47.google.com (mail-ee0-f47.google.com [74.125.83.47])
	by mail.openembedded.org (Postfix) with ESMTP id 266906B80B
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Aug 2013 07:20:10 +0000 (UTC)
Received: by mail-ee0-f47.google.com with SMTP id d49so179889eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Aug 2013 00:20:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=/+6Fw9bBieBTCCxDHSBMbp0VmXTNO1q35gkCM2FEMCo=;
	b=NTtOMAYBFZdnnHretrMGYVmsykcwe8DHd+x2qdefxIoumik4hwD+Dmhqb2KEK87JLF
	tNmbJDfxRqlrurBAl0yWzOvH3QhCYIrWOXGQO7q7UviZluKVIBwuqbmUwO4BtmOaSHrP
	q5esB+hUd2p7IutwtegGTvJGvyfeJo29KH+wqZGxAMOaEy6KjJaVN0p1Mz17JeGLkUFo
	4TfcKGYfX3Gy5159h2JvixruMFhBaPO2LxiLJJ+hXbjPusORBCrUorCXq6RxrlsQI5Q/
	b9U6mm/RBRKBb07DmN/NMUk4i1W8z6o98OqIe+OGxbn0CVAHWB8mknqf7ywQQ76iRcnK
	ez9A==
X-Received: by 10.14.5.78 with SMTP id 54mr2621589eek.55.1376551211530;
	Thu, 15 Aug 2013 00:20:11 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	r48sm74959050eev.14.2013.08.15.00.20.10
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 15 Aug 2013 00:20:11 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 15 Aug 2013 09:19:39 +0200
Message-Id: <1092a7686533413053f81a890d80d6f0ef18abd7.1376551136.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1376551134.git.Martin.Jansa@gmail.com>
References: <cover.1376551134.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1376551134.git.Martin.Jansa@gmail.com>
References: <cover.1376551134.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][dylan][PATCH 59/60] ruby: add dependency on db gdbm readline
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
X-List-Received-Date: Thu, 15 Aug 2013 07:20:11 -0000

* to prevent using bunded versions

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-ruby/recipes-devtools/ruby/ruby.inc           | 4 ++--
 meta-ruby/recipes-devtools/ruby/ruby_1.9.3-p194.bb | 2 --
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/meta-ruby/recipes-devtools/ruby/ruby.inc b/meta-ruby/recipes-devtools/ruby/ruby.inc
index becf64c..5ba1d2b 100644
--- a/meta-ruby/recipes-devtools/ruby/ruby.inc
+++ b/meta-ruby/recipes-devtools/ruby/ruby.inc
@@ -14,8 +14,8 @@ LIC_FILES_CHKSUM = "\
     file://LEGAL;md5=e88686821918c0b6d2b1b8328116cec5 \
 "
 
-DEPENDS = "ruby-native zlib openssl tcl"
-DEPENDS_virtclass-native = ""
+DEPENDS = "ruby-native zlib openssl tcl libyaml db gdbm readline"
+DEPENDS_class-native = ""
 
 INC_PR = "r1"
 
diff --git a/meta-ruby/recipes-devtools/ruby/ruby_1.9.3-p194.bb b/meta-ruby/recipes-devtools/ruby/ruby_1.9.3-p194.bb
index bed678e..8bb956a 100644
--- a/meta-ruby/recipes-devtools/ruby/ruby_1.9.3-p194.bb
+++ b/meta-ruby/recipes-devtools/ruby/ruby_1.9.3-p194.bb
@@ -1,8 +1,6 @@
 require ruby.inc
 PR = "${INC_PR}.0"
 
-DEPENDS += "libyaml ruby-native"
-
 SRC_URI += "\
     file://0001-socket-extconf-hardcode-wide-getaddr-info-test-outco.patch \
     file://ruby-1.9.3-always-use-i386.patch \
-- 
1.8.3.2


