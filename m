Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
	[209.85.210.194])
	by mail.openembedded.org (Postfix) with ESMTP id 72A2A7E735
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Aug 2019 03:45:33 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id w16so753348pfn.7
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Aug 2019 20:45:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=ZzwvYSzmIBNy+tO6g6n/MsbUEldUXBNVM8yxM5RlaWY=;
	b=W2M4uG3ybGJ6Cb2u5737VaepPSUgBNlLYQjVUPR6MutN9W7PvkXUb5ErV8kwflChcX
	RHu/O78TBgOofM1bqQA5Ln9JqB4JjtQZrjM6MOEiweFB53v38jrzF235Iai9++J3NjEA
	n0vNUtG7M3UsD4zbfrgSp6zKKbEVgfzyPb1tLTyRpGpyqrKu1Kfad1o347cIh480LFhv
	udfDBhKMV2iLvUkOdufw/LiIGhVno6ZwsQGT6VeAemYrgFFk4J5yffuhNxPL52r9WEgk
	MRpdp4WbDwe2fNqa5JyhluAIju0teyOtJe7jngoQOvdElKQg/rw1a7c0Irkh/XOxnLAZ
	dB7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=ZzwvYSzmIBNy+tO6g6n/MsbUEldUXBNVM8yxM5RlaWY=;
	b=F7Jyuhv+QgSSEk1Hw8Bk+TPiQfqTM8XC5NOQFw/drlB3Lo6IHul/pM+KA2znrt+xQn
	Jb5FfQ9Zohn59TLOl5cw+gum6FUzbO+NEUGffX+s0JzvgD4JX+9K2ICYd1UmwVzaEKMq
	R2uvsVb7u/QCj4uNmoHoEMzPOHcV9d1uqw3PucfekWnSMug+MZQ589mXYf3eFA4UmUqq
	R3REWwaU7dEdupNW65dk9UXOH0xKnrhSQJoLGKeXg3nAsDDnwAaaOCpuC5+WXmva3gCR
	v6v8TCghT71JAJ+ESK2NsFqs5oSqbQTXZwMIUc1aQRmFhGIHCs9Xq+Yat9hQSzJzwNMI
	hq7Q==
X-Gm-Message-State: APjAAAVrtdrPsxhnPbWAB6dWTRB81Ho/VAhNzClKhQk6a5VMh29SDspv
	oYEv//Mj575kloBtgU+/8iws+OtzyJM=
X-Google-Smtp-Source: APXvYqzRvxT4OBHASTE81dGUk0M10Q5f6yA9KzxEaIV5HPTl5wmiu2ljPgcIhfW7qC/GHY7scBymyg==
X-Received: by 2002:a17:90a:974c:: with SMTP id
	i12mr2193719pjw.12.1566963933844; 
	Tue, 27 Aug 2019 20:45:33 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net (c-73-71-176-3.hsd1.ca.comcast.net.
	[73.71.176.3]) by smtp.gmail.com with ESMTPSA id
	s125sm945907pfc.133.2019.08.27.20.45.33
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 27 Aug 2019 20:45:33 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 27 Aug 2019 20:45:26 -0700
Message-Id: <20190828034526.16731-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Subject: [meta-oe][PATCH] kernel-selftest: Warn conditionally about clang-native dependency
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
X-List-Received-Date: Wed, 28 Aug 2019 03:45:33 -0000
Content-Transfer-Encoding: 8bit

When meta-clang is in mix then it does the right thing already so no
need to warn in that case

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb b/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb
index 7370f9fb41..dce33c16c5 100644
--- a/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb
+++ b/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb
@@ -63,9 +63,10 @@ python __anonymous () {
 }
 
 do_compile() {
-    bbwarn "clang >= 6.0  with bpf support is needed with kernel 4.18+ so \
-either install it and add it to HOSTTOOLS, or add \
-clang-native from meta-clang to dependency"
+    if [ ${@bb.utils.contains('DEPENDS', 'clang-native', 'True', 'False', d)} = 'False' ]; then
+        bbwarn "clang >= 6.0 with bpf support is needed with kernel 4.18+ so
+either install it and add it to HOSTTOOLS, or add clang-native from meta-clang to dependency"
+    fi
     for i in ${TEST_LIST}
     do
         oe_runmake -C ${S}/tools/testing/selftests/${i}
-- 
2.23.0


