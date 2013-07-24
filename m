Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f176.google.com (mail-ea0-f176.google.com
	[209.85.215.176])
	by mail.openembedded.org (Postfix) with ESMTP id 48F656B36B
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Jul 2013 12:41:35 +0000 (UTC)
Received: by mail-ea0-f176.google.com with SMTP id q16so214154ead.35
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Jul 2013 05:41:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=6Rrpxaxc1JNX9dSTUlQ3AxK+eGHdm63Zs+7aplvDpeQ=;
	b=umQAADlltW2mKgfsiVJtRei+ussABHCc919yuXz6FBr6eUpn/LxCKHGZn6lRXd3YT6
	wnBKW3JW73cnCc0FzWmRuDRLGhBrVO6pweiI1iVDrbKVua+seNTs4wpiBZvOmFv69O6r
	1eGowPqx24/DPl9vkWlzS9dU9OkE2PhTZA5/uJID8AHiQna7OT7rCjWyNwxr7NS4AHe1
	+3ig8gsmXn9LKClJE3iIrYF8ZUqChlWpFzHNXe9bSkhnXhbhxnsYOx17N5AKF3n2wnHi
	AiUPDjZWu9sOleJChTQ+3QZpYkgRFIgE8Ic9WwyGiIhmdDTMaH8z6Mc6sL3b2bMqij/T
	v9mg==
X-Received: by 10.14.100.2 with SMTP id y2mr37662900eef.75.1374669695747;
	Wed, 24 Jul 2013 05:41:35 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	n42sm65835144eeh.15.2013.07.24.05.41.34 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 24 Jul 2013 05:41:34 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 24 Jul 2013 14:41:12 +0200
Message-Id: <f42103685d5fa4fad364b5476adf2f25afac4040.1374669516.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <bddf85b42118361920fbde7c54baffd0e085d5a7.1374669516.git.Martin.Jansa@gmail.com>
References: <bddf85b42118361920fbde7c54baffd0e085d5a7.1374669516.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1374669516.git.Martin.Jansa@gmail.com>
References: <cover.1374669516.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 28/29] ruby: add dependency on db gdbm readline
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
X-List-Received-Date: Wed, 24 Jul 2013 12:41:35 -0000

* to prevent using bunded versions

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-ruby/recipes-devtools/ruby/ruby.inc           | 4 ++--
 meta-ruby/recipes-devtools/ruby/ruby_1.9.3-p429.bb | 2 --
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/meta-ruby/recipes-devtools/ruby/ruby.inc b/meta-ruby/recipes-devtools/ruby/ruby.inc
index 18fcb9c..837e52b 100644
--- a/meta-ruby/recipes-devtools/ruby/ruby.inc
+++ b/meta-ruby/recipes-devtools/ruby/ruby.inc
@@ -14,8 +14,8 @@ LIC_FILES_CHKSUM = "\
     file://LEGAL;md5=3ce1fae39fe573b818c0af162bce6579 \
 "
 
-DEPENDS = "ruby-native zlib openssl tcl"
-DEPENDS_virtclass-native = ""
+DEPENDS = "ruby-native zlib openssl tcl libyaml db gdbm readline"
+DEPENDS_class-native = ""
 
 INC_PR = "r1"
 
diff --git a/meta-ruby/recipes-devtools/ruby/ruby_1.9.3-p429.bb b/meta-ruby/recipes-devtools/ruby/ruby_1.9.3-p429.bb
index 868d0ff..de51f2f 100644
--- a/meta-ruby/recipes-devtools/ruby/ruby_1.9.3-p429.bb
+++ b/meta-ruby/recipes-devtools/ruby/ruby_1.9.3-p429.bb
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


