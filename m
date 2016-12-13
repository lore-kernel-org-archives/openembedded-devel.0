Return-Path: <andre.draszik@gmail.com>
Received: from mail-wj0-f194.google.com (mail-wj0-f194.google.com
	[209.85.210.194])
	by mail.openembedded.org (Postfix) with ESMTP id 7634C71BEE
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Dec 2016 09:39:05 +0000 (UTC)
Received: by mail-wj0-f194.google.com with SMTP id xy5so15365120wjc.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Dec 2016 01:39:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=hfe2gD18ZGJbgnzNCG5kYEgqI7/6RxnwSLq3ikbTl6s=;
	b=m/m6DQt8249TXyg7AJKVbPE1MZ4ePy6+40KBdKDGdoz3QU8vOd3P8R6X4z2mAe94WJ
	H0tNTOg2yRpVEQNr1HLyQQ6VrfbsGxzlMFIyhw1P4c+ZrIdTGLz34qN0yLtmIfWLUPzP
	PAVB/tdHocysC0to6oliSP8HKdybTv1zszLdR8hUZq+QgrjCQHNtO1/DNnnw4YIeLvtO
	gZDRUVU3z544OaXcH3w2wml+r3+Cazb8kuedQYwSXe2icaGJ6EXAIxuLRrp0rYfhR9U0
	IK5Pr666k0hTV9ufct/4a7Yh7cZvgcMbKigUoraxztptbQKe72JG0GtBeWMp2NkAnNfK
	rvnw==
X-Gm-Message-State: AKaTC00v7EBeEW+dQqKToMy7QxblqHGSks12S3CsHfr/mjAdPfHty8nIRAQF/uv2IRWkPw==
X-Received: by 10.194.93.104 with SMTP id ct8mr98317091wjb.87.1481621946724;
	Tue, 13 Dec 2016 01:39:06 -0800 (PST)
Received: from tfsielt31850.tycofs.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	l67sm17845082wmf.0.2016.12.13.01.39.05
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 13 Dec 2016 01:39:05 -0800 (PST)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 13 Dec 2016 09:39:04 +0000
Message-Id: <20161213093904.24994-1-git@andred.net>
X-Mailer: git-send-email 2.10.2
Subject: [meta-oe][PATCH] protobuf: switch from mips16 to mips32 due to in-line assembler
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
X-List-Received-Date: Tue, 13 Dec 2016 09:39:07 -0000

From: Lukasz Nowak <lnowak@tycoint.com>

| mipsel-poky-linux-musl-libtool: compile:  mipsel-poky-linux-musl-g++ -mel -mabi=32 -msoft-float -march=mips32r2 -mips16 -minterlink-compressed -mtune=24kec -mdsp --sysroot=<sysroot> -DHAVE_CONFIG_H -I. -I../../git/src -I.. -Wall -Wwrite-strings -Woverloaded-virtual -Wno-sign-compare -O2 -pipe -g -feliminate-unused-debug-types -fstack-protector-strong -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -fvisibility-inlines-hidden -c ../../git/src/google/protobuf/repeated_field.cc  -fPIC -DPIC -o google/protobuf/.libs/repeated_field.o
| {standard input}: Assembler messages:
| {standard input}:113: Error: unrecognized opcode `sync'
| {standard input}:140: Error: unrecognized opcode `ll $2,0($16)'
| {standard input}:143: Error: unrecognized opcode `sc $4,0($16)'
| {standard input}:202: Error: unrecognized opcode `sync'
| {standard input}:275: Error: unrecognized opcode `sync'
| Makefile:2064: recipe for target 'google/protobuf/stubs/once.lo' failed
| make[3]: *** [google/protobuf/stubs/once.lo] Error 1

Protobuf implements atomics for mips, using ASM "sync" instruction.
It is not available in mips16e. Switching the library to mips32 is
the easiest solution.

Signed-off-by: Lukasz Nowak <lnowak@tycoint.com>
---
 meta-oe/recipes-devtools/protobuf/protobuf_2.6.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-devtools/protobuf/protobuf_2.6.1.bb b/meta-oe/recipes-devtools/protobuf/protobuf_2.6.1.bb
index 2977c59..7b8f629 100644
--- a/meta-oe/recipes-devtools/protobuf/protobuf_2.6.1.bb
+++ b/meta-oe/recipes-devtools/protobuf/protobuf_2.6.1.bb
@@ -28,4 +28,6 @@ S = "${WORKDIR}/git"
 
 FILES_${PN}-compiler = "${bindir} ${libdir}/libprotoc${SOLIBS}"
 
+MIPS_INSTRUCTION_SET = "mips"
+
 BBCLASSEXTEND = "native nativesdk"
-- 
2.10.2


