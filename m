Return-Path: <raj.khem@gmail.com>
Received: from mail-io0-f195.google.com (mail-io0-f195.google.com
	[209.85.223.195])
	by mail.openembedded.org (Postfix) with ESMTP id 2995F77A50
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Apr 2017 03:47:33 +0000 (UTC)
Received: by mail-io0-f195.google.com with SMTP id k87so52124604ioi.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Apr 2017 20:47:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=fze47jAVqqQbWf0/r4UF8QFeO58GmkMqTzqN/ERm3dc=;
	b=SswCkSs87bs3xkoIn9ZYyxQNHgfD2/IKgqvJ2Ijx5DRcqwDD3jDPDGYWZR8jmu0IVB
	ttmR2wGCproKkHBwTVsEapkx96m3aLfjFpA1kIfQzPohx1Pkwd3pHB7HXI0NRcl03W+t
	Sus8iacngrwGtSDD1BFjUxBmm4RtCiOa7cdPpcabFQdp+yukA8vyFEeiDlVSxjme3hot
	/nJtU7kKonoDkxtQmHedYrS25s1DQOBkusAv4ksexfGPMvlIUA4k6bn0AdtQrr1sbYUD
	bQhQ7PF7feW4wsQcdEOttIvjRCD/m32F8TukfgTdYRnrangsvznKFxN7xVjotl6HwPUi
	Bc6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=fze47jAVqqQbWf0/r4UF8QFeO58GmkMqTzqN/ERm3dc=;
	b=N0Ykfe1NgnZ7LfCJerwAg4bsqDvkYITWSf2MXMkhArLOZUvXDcfIStg3CS4E3OHk6r
	9wCA+3nvkTwNTBqOqQ4g/sGIHkFpyzUc0mqUl/+Dj2ril1+j6CmPs4QIlPRsOo5Rx972
	L1q/WnZTdrXCGIr2SEofH0kTKzEp5cD4ePgvKhmdIACI+x6zeel2VF7lgl8XswGYxUUz
	oAou3lUq/Qs8p1aydKFKD9+0xVumysthLV0XGlzwqQ4uen9BE0amksUPZjUfxDvI8fLa
	/yqBYO68z9LeKnJ+uJt+2vq2ib6WBggDe57Bplv3H67ASLu8drRS0j8qRwWFNZifdFiN
	gbaw==
X-Gm-Message-State: AN3rC/7eKXpl271tlfY1ZUz6j9Kf5woCeJoRZ9keEiYg/dPhm2jctXBH
	Rfh1LxRnqEJp9M3D
X-Received: by 10.107.8.226 with SMTP id h95mr11485843ioi.163.1493092055031;
	Mon, 24 Apr 2017 20:47:35 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192])
	by smtp.gmail.com with ESMTPSA id 9sm1244118itm.6.2017.04.24.20.47.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 24 Apr 2017 20:47:34 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 24 Apr 2017 20:47:10 -0700
Message-Id: <20170425034719.8630-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.12.2
In-Reply-To: <20170425034719.8630-1-raj.khem@gmail.com>
References: <20170425034719.8630-1-raj.khem@gmail.com>
Subject: [meta-oe][ 02/11] msgpack-c: Drop unused patch
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
X-List-Received-Date: Tue, 25 Apr 2017 03:47:35 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../304ff96d04599401172568d042723ff507e78cc3.patch | 40 ----------------------
 1 file changed, 40 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/msgpack/msgpack-c/304ff96d04599401172568d042723ff507e78cc3.patch

diff --git a/meta-oe/recipes-devtools/msgpack/msgpack-c/304ff96d04599401172568d042723ff507e78cc3.patch b/meta-oe/recipes-devtools/msgpack/msgpack-c/304ff96d04599401172568d042723ff507e78cc3.patch
deleted file mode 100644
index b8b3d3187..000000000
--- a/meta-oe/recipes-devtools/msgpack/msgpack-c/304ff96d04599401172568d042723ff507e78cc3.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From 304ff96d04599401172568d042723ff507e78cc3 Mon Sep 17 00:00:00 2001
-From: James McCoy <jamessan@debian.org>
-Date: Thu, 13 Apr 2017 11:38:45 -0400
-Subject: [PATCH] Comment the intentional fallthrough to default from
- _fixed_trail_again
-
-GCC 7 added a new diagnostic, -Wimplicit-fallthrough, which is enabled
-with -Wextra that warns about implicitly falling through a case
-statement.
-
-    [  4%] Building C object CMakeFiles/msgpackc-static.dir/src/unpack.c.o
-    /usr/lib/gcc-snapshot/bin/gcc   -I/home/jamessan/src/msgpack-c/. -I/home/jamessan/src/msgpack-c/include -I/home/jamessan/src/msgpack-c/build/include  -g -O2 -fdebug-prefix-map=/home/jamessan/src/msgpack-c=. -specs=/usr/share/dpkg/no-pie-compile.specs -fstack-protector-strong -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2   -Wall -Wextra -Werror -g -O3 -o CMakeFiles/msgpackc-static.dir/src/unpack.c.o   -c /home/jamessan/src/msgpack-c/src/unpack.c
-    In file included from /home/jamessan/src/msgpack-c/src/unpack.c:283:0:
-    /home/jamessan/src/msgpack-c/include/msgpack/unpack_template.h: In function 'template_execute':
-    /home/jamessan/src/msgpack-c/include/msgpack/unpack_template.h:238:17: error: this statement may fall through [-Werror=implicit-fallthrough=]
-                     ++p;
-                     ^~~
-    /home/jamessan/src/msgpack-c/include/msgpack/unpack_template.h:240:13: note: here
-                 default:
-                 ^~~~~~~
-    cc1: all warnings being treated as errors
-
-Adding the comment makes it explicit that the fallthrough is
-intentional, so gcc doesn't complain.
----
- include/msgpack/unpack_template.h | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/include/msgpack/unpack_template.h b/include/msgpack/unpack_template.h
-index 8450442..e557bb6 100644
---- a/include/msgpack/unpack_template.h
-+++ b/include/msgpack/unpack_template.h
-@@ -236,6 +236,7 @@ msgpack_unpack_func(int, _execute)(msgpack_unpack_struct(_context)* ctx, const c
- 
-             _fixed_trail_again:
-                 ++p;
-+                // fallthrough
- 
-             default:
-                 if((size_t)(pe - p) < trail) { goto _out; }
-- 
2.12.2


