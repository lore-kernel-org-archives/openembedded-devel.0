Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f182.google.com (mail-ea0-f182.google.com
	[209.85.215.182])
	by mail.openembedded.org (Postfix) with ESMTP id 9AF0B6B7D0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Aug 2013 07:19:06 +0000 (UTC)
Received: by mail-ea0-f182.google.com with SMTP id o10so184528eaj.27
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Aug 2013 00:19:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=0p5SeDFam7gh12ieLLxxRYPXepDIHuEHz3rvTfvWLy4=;
	b=xAtRiqeAOljbeCxNnt+7HrEYdA0bdr1ZXc4K4aKDc7OK9flY5aQNI5rhIg9cEW+szO
	PHNCc/+8Q/G6BGDSMKj4UsOrZOPXf2ZykSetW0b8N4EGFE+L8vCYorjt0lupbgsvdX2d
	uyM7IpacQLUJyuIh6EPlM8OOnAI0meenKOgeHU4hSJ4TmN4gRBYbWXzsQt17AiHCHc2i
	rWUQOU8wdo3S9NYQdiU04Qk1egfuvuLixnkMRakjLHTS2FKgAPFwUkl5XigTPkqjkuu2
	t8K3805lcUFByvxpjUNloDdLnWzv2YTUyXF5jQ+3R9g/xZ9cDyKavOBDZyOXAcZzHOZg
	qAVA==
X-Received: by 10.14.5.78 with SMTP id 54mr2614633eek.55.1376551147016;
	Thu, 15 Aug 2013 00:19:07 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	a4sm81924936eez.0.2013.08.15.00.19.06
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 15 Aug 2013 00:19:06 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 15 Aug 2013 09:18:51 +0200
Message-Id: <97599a85054e4fac4df520cf452a0fd01f113a41.1376551135.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1376551134.git.Martin.Jansa@gmail.com>
References: <cover.1376551134.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1376551134.git.Martin.Jansa@gmail.com>
References: <cover.1376551134.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][dylan][PATCH 11/60] ruby: add missing dependency on ruby-native
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
X-List-Received-Date: Thu, 15 Aug 2013 07:19:07 -0000

* without ruby available on host it fails:
  | NOTE: make LIBRUBYARG=-lruby-static
  |       CC = i586-starfish-linux-gcc  -m32 -march=i586 --sysroot=/OE/sysroots/qemux86
  |       LD = i586-starfish-linux-ld --sysroot=/OE/sysroots/qemux86
  |       LDSHARED = i586-starfish-linux-gcc  -m32 -march=i586 --sysroot=/OE/sysroots/qemux86 -shared
  |       CFLAGS = -O2 -pipe -g -feliminate-unused-debug-types -fPIC
  |       XCFLAGS = -include ruby/config.h -include ruby/missing.h -fvisibility=hidden -DRUBY_EXPORT
  |       CPPFLAGS =   -I. -I.ext/include/i386-linux -I./include -I.
  |       DLDFLAGS = -Wl,-soname,libruby.so.1.9
  |       SOLIBS = -lpthread -lrt -ldl -lcrypt -lm
  | executable host ruby is required. use --with-baseruby option.
  | make: *** [.rbconfig.time] Error 1
---
 meta-ruby/recipes-devtools/ruby/ruby_1.9.3-p194.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-ruby/recipes-devtools/ruby/ruby_1.9.3-p194.bb b/meta-ruby/recipes-devtools/ruby/ruby_1.9.3-p194.bb
index 6611ce1..bed678e 100644
--- a/meta-ruby/recipes-devtools/ruby/ruby_1.9.3-p194.bb
+++ b/meta-ruby/recipes-devtools/ruby/ruby_1.9.3-p194.bb
@@ -1,7 +1,7 @@
 require ruby.inc
 PR = "${INC_PR}.0"
 
-DEPENDS += "libyaml"
+DEPENDS += "libyaml ruby-native"
 
 SRC_URI += "\
     file://0001-socket-extconf-hardcode-wide-getaddr-info-test-outco.patch \
-- 
1.8.3.2


