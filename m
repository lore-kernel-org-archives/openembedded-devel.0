Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 066287F69C
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Oct 2019 20:45:22 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id p14so3855564wro.4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Oct 2019 13:45:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=kiYITeFg7ubMe5TlhR1NmOOfrwpb9MhoDKi48LYBNdM=;
	b=ofhW+GFa9nqpIKQCpGcMeT7BHwPqtgEiHiet4SqVpRCYryi5RUZFwJhgWnFPDMXDby
	XZxTcFgKYxNtkVn8a50YKkSeSIzuKwZsDBVjVC43WcdKbrrCp8IwmgytztTR88dhH6re
	7U/kViLMJTxxiXA/IzPM6Lvq/AXCWJWerHrHdkUVSXIjDjpzyKG2WLijs33FxMVKumJz
	0feF+0P5N0KsUvjuU/IfF2i0y5Yw/BV7j0OC4PVGXzCPdmIOLbknjUBjnvjCm0RSz7yE
	8mZI9NgWH3PzdM/HjzJnslURZaW4jZMoGOrhJyjsrol+XWSEr23WQ/AiStxHGqVG5b7m
	XI1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=kiYITeFg7ubMe5TlhR1NmOOfrwpb9MhoDKi48LYBNdM=;
	b=dxFZBhwVF2FAtJ5k21Nj4Kl61DNRAfc+tAARD7Avx35VOi/+cgTZBZteuvhpyKApcI
	Tk8qBwToeENdIwx/7I8NrwyyMVXyRsBXP9V5tTk5XDfzL3zsyIEJXofit7C3tCv/knZ7
	i88qNK31by/q4v4WkFRucea/2KrO1BVhz6Z0sn3eqBeqfajchxzcilD1FY8gkRdkCbVw
	jYfyCZcZMaFTP90z9kwr34EJV85jNTo4+S7CgHpdpQf6SDXzvRxBsX67NhW2jsJPl4bE
	62qOXaXzBaFei7cLYi3PaWRGsf1ZQg8OgoyWf5BNEmlaK1iMYXz7KV07O9yF9Ht7/WF7
	0SUQ==
X-Gm-Message-State: APjAAAX9DL839QZblBsU+3dH9gmA+enetr5P3AipgyQs/9PCwcNE5vW1
	1RRphYSRZDjGNm2wVa4mqp25bRP/
X-Google-Smtp-Source: APXvYqwrJWLZCpD0rsk9LNE5KNbBjJZM+3WtlT4nrEz+yuf1LlGr8HoSJSJJmaa43UybZZ94N4mVyA==
X-Received: by 2002:adf:e302:: with SMTP id b2mr4356907wrj.298.1571345123446; 
	Thu, 17 Oct 2019 13:45:23 -0700 (PDT)
Received: from localhost (ip-217-030-068-212.aim-net.cz. [217.30.68.212])
	by smtp.gmail.com with ESMTPSA id u1sm4040816wru.90.2019.10.17.13.45.22
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 17 Oct 2019 13:45:22 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 17 Oct 2019 20:45:24 +0000
Message-Id: <20191017204524.625-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe][warrior][PATCH] protobuf-c: fix race condition
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
X-List-Received-Date: Thu, 17 Oct 2019 20:45:23 -0000

From: "Qi.Chen@windriver.com" <Qi.Chen@windriver.com>

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Sinan Kaya <okaya@kernel.org>
(cherry picked from commit 489d3b4b932ee8016d792341f8ea5836a9522cd4)
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../0001-avoid-race-condition.patch           | 36 +++++++++++++++++++
 .../protobuf/protobuf-c_1.3.1.bb              |  3 +-
 2 files changed, 38 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-devtools/protobuf/protobuf-c/0001-avoid-race-condition.patch

diff --git a/meta-oe/recipes-devtools/protobuf/protobuf-c/0001-avoid-race-condition.patch b/meta-oe/recipes-devtools/protobuf/protobuf-c/0001-avoid-race-condition.patch
new file mode 100644
index 0000000000..4fc7703d81
--- /dev/null
+++ b/meta-oe/recipes-devtools/protobuf/protobuf-c/0001-avoid-race-condition.patch
@@ -0,0 +1,36 @@
+From 216e31260b618ec73862f9f5336597f391444dac Mon Sep 17 00:00:00 2001
+From: Chen Qi <Qi.Chen@windriver.com>
+Date: Sun, 29 Sep 2019 17:20:42 +0800
+Subject: [PATCH] avoid race condition
+
+It's possible that the cxx-generate-packed-data.cc is compiled
+while the t/test-full.pb.h is being generated. This will result
+the following error.
+
+  DEBUG:	./t/test-full.pb.h:4:0: error: unterminated #ifndef
+  ./t/test-full.pb.h:4:0: error: unterminated #ifndef
+
+Add a dependency to avoid such problem.
+
+Upstream-Status: Pending
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ Makefile.am | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/Makefile.am b/Makefile.am
+index b0cb065..1608ae0 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -156,6 +156,7 @@ noinst_PROGRAMS += \
+ t_generated_code2_cxx_generate_packed_data_SOURCES = \
+ 	t/generated-code2/cxx-generate-packed-data.cc \
+ 	t/test-full.pb.cc
++t/generated-code2/cxx-generate-packed-data.cc: t/test-full.pb.h
+ $(t_generated_code2_cxx_generate_packed_data_OBJECTS): t/test-full.pb.h
+ t_generated_code2_cxx_generate_packed_data_CXXFLAGS = \
+ 	$(AM_CXXFLAGS) \
+-- 
+2.17.1
+
diff --git a/meta-oe/recipes-devtools/protobuf/protobuf-c_1.3.1.bb b/meta-oe/recipes-devtools/protobuf/protobuf-c_1.3.1.bb
index 7ef0300925..17f92f04bb 100644
--- a/meta-oe/recipes-devtools/protobuf/protobuf-c_1.3.1.bb
+++ b/meta-oe/recipes-devtools/protobuf/protobuf-c_1.3.1.bb
@@ -15,7 +15,8 @@ DEPENDS = "protobuf-native protobuf"
 PV .= "+git${SRCPV}"
 SRCREV = "269771b4b45d3aba04e59569f53600003db8d9ff"
 
-SRC_URI = "git://github.com/protobuf-c/protobuf-c.git"
+SRC_URI = "git://github.com/protobuf-c/protobuf-c.git \
+           file://0001-avoid-race-condition.patch"
 
 S = "${WORKDIR}/git"
 
-- 
2.17.1


