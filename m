Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f180.google.com (mail-ea0-f180.google.com
	[209.85.215.180])
	by mail.openembedded.org (Postfix) with ESMTP id 076EA6B01A
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  5 Jul 2013 01:23:54 +0000 (UTC)
Received: by mail-ea0-f180.google.com with SMTP id k10so1167260eaj.11
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 04 Jul 2013 18:23:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=bwCn5PjfrdawmjdU5UyasVnVH5x+NCis8IrHVef0ChY=;
	b=iti80Wn0feF3/A0dyLSq9KGl/HBXyZw/OagtLCwCs5geS8lzAxU5cNrDFLr3yI+zbH
	441zXY0v/5GzElZiQ9+E69YmZJibtTtQIXAQVEc9DuhZSkYwndDdSa44T+u3KCGq9pjV
	dJQiKhBYjZz0Em6C2v4asuXxoDdzr/YXVOxYg/6t6CEMYxqfQfbCORLYWUlLd74LgAGw
	ZJwbJaZpNebDzyN9gDwqWLjHqebP9PiRzY/vX4dfTHegunjmy25Eh5xjt++ffg+uxQPL
	qq5MzDiVWwrdslEU47+mWpXTDXfxvQsCRhZUAYM0DcPUlx3Q0NUls31XQL5KPdLtINBc
	TxUg==
X-Received: by 10.15.82.132 with SMTP id a4mr9143338eez.107.1372987435640;
	Thu, 04 Jul 2013 18:23:55 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id n5sm9657145eed.9.2013.07.04.18.23.54
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 04 Jul 2013 18:23:54 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  5 Jul 2013 03:23:46 +0200
Message-Id: <5fec7e15e0f9d37c1b764f6e5998d5f70e46cecf.1372987207.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.2.1
In-Reply-To: <47686756f036d39b24eb30d4522eb1f1b1a12702.1372987207.git.Martin.Jansa@gmail.com>
References: <47686756f036d39b24eb30d4522eb1f1b1a12702.1372987207.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1372987207.git.Martin.Jansa@gmail.com>
References: <cover.1372987207.git.Martin.Jansa@gmail.com>
Subject: [PATCH 02/10] ruby: add missing dependency on ruby-native
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
X-List-Received-Date: Fri, 05 Jul 2013 01:23:55 -0000

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
 meta-ruby/recipes-devtools/ruby/ruby_1.9.3-p429.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-ruby/recipes-devtools/ruby/ruby_1.9.3-p429.bb b/meta-ruby/recipes-devtools/ruby/ruby_1.9.3-p429.bb
index 7c5be36..868d0ff 100644
--- a/meta-ruby/recipes-devtools/ruby/ruby_1.9.3-p429.bb
+++ b/meta-ruby/recipes-devtools/ruby/ruby_1.9.3-p429.bb
@@ -1,7 +1,7 @@
 require ruby.inc
 PR = "${INC_PR}.0"
 
-DEPENDS += "libyaml"
+DEPENDS += "libyaml ruby-native"
 
 SRC_URI += "\
     file://0001-socket-extconf-hardcode-wide-getaddr-info-test-outco.patch \
-- 
1.8.2.1


