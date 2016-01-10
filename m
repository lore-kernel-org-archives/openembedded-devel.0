Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f66.google.com (mail-pa0-f66.google.com
	[209.85.220.66])
	by mail.openembedded.org (Postfix) with ESMTP id B7D8C75D4A
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Jan 2016 01:00:00 +0000 (UTC)
Received: by mail-pa0-f66.google.com with SMTP id pv5so24114974pac.0
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 09 Jan 2016 17:00:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=2By5qXcE9PVWwqRtePx/ZpuPgfKH1SOUlJ5WwbCxjlA=;
	b=jmv71IyuxEaWOR2awrl6QUQiSY5qlB3Rc5OGrtyDYxLVtLBiXkg+tZWTY7WYDYjabI
	Zn8GWfEWe2iSg6HB56zWu1LNxXrBhUEMH6y5WTJ16euzNXQzGqXHreMKyYe9fBWP2VAk
	hC1Z+32GKm6jddxr7awAWCYNc1B0OJNaoc/HZOCn17SCsJs91KaGqagHjjNLw4T/rRJA
	7Kz1CJBir31YP8ly2UlPi6ue7HzQLKkjrdd06e3UYGCKaOpFWnN/EPH9z5p2iI9nEia6
	Q4ZUDigX54yDJLgwqSBROgotVA4K1oIz0+c7Xl5O+ION6thbJ4AMc8cv4NN2o5MFhmXM
	pNIg==
X-Received: by 10.66.159.38 with SMTP id wz6mr171418285pab.12.1452387601242;
	Sat, 09 Jan 2016 17:00:01 -0800 (PST)
Received: from bigIsland.kama-aina.net (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by smtp.gmail.com with ESMTPSA id
	k74sm13762433pfb.30.2016.01.09.16.59.54
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 09 Jan 2016 16:59:57 -0800 (PST)
Received: by bigIsland.kama-aina.net (Postfix, from userid 1000)
	id C1E57FCC840; Sat,  9 Jan 2016 16:59:47 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  9 Jan 2016 16:59:31 -0800
Message-Id: <0968f88bf652111c5098205e7cab80595df8e3ff.1452386603.git.akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1452386602.git.akuster808@gmail.com>
References: <cover.1452386602.git.akuster808@gmail.com>
In-Reply-To: <cover.1452386602.git.akuster808@gmail.com>
References: <cover.1452386602.git.akuster808@gmail.com>
Subject: [PATCH 08/22] mpg123: add textrel to INSANE_SKIP
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
X-List-Received-Date: Sun, 10 Jan 2016 01:00:00 -0000

From: Andre McCurdy <armccurdy@gmail.com>

The x86 assembler optimisations contains text relocations and there
are no upstream plans to fix them:

  http://sourceforge.net/p/mpg123/bugs/168/

Benchmarking suggests that the SSE assembler is still clearly faster
than the generic C code, so leave the assembler optimisations enabled.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-multimedia/recipes-multimedia/mpg123/mpg123_1.21.0.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-multimedia/recipes-multimedia/mpg123/mpg123_1.21.0.bb b/meta-multimedia/recipes-multimedia/mpg123/mpg123_1.21.0.bb
index 3aa5f3d..85bd347 100644
--- a/meta-multimedia/recipes-multimedia/mpg123/mpg123_1.21.0.bb
+++ b/meta-multimedia/recipes-multimedia/mpg123/mpg123_1.21.0.bb
@@ -49,6 +49,10 @@ EXTRA_OECONF = " \
     ${@bb.utils.contains('TUNE_FEATURES', 'altivec', '--with-cpu=altivec', '', d)} \
 "
 
+# The x86 assembler optimisations contains text relocations and there are no
+# upstream plans to fix them: http://sourceforge.net/p/mpg123/bugs/168/
+INSANE_SKIP_${PN}_append_x86 = " textrel"
+
 # Fails to build with thumb-1 (qemuarm)
 #| {standard input}: Assembler messages:
 #| {standard input}:47: Error: selected processor does not support Thumb mode `smull r5,r6,r7,r4'
-- 
1.9.1


