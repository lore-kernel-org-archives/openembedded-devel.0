Return-Path: <liu.ming50@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id C75FF71A0F
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Nov 2017 14:43:29 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id l8so3428294wmg.4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Nov 2017 06:43:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=jlkwEyFQGVNORc1HO+QsYD/EnjoPXcdFomzSpXi4FT8=;
	b=PJe7MGy2ZAXGl323vv3kJG4tMm7z20B2WFIbHGVPVFgW7y9jxbyBbL4Z73BVkscMgS
	rDI2wtywgR+CQEzHawzZZB27GN0k3zq9FuIsPEMTj0qAf19enr8YV6oI2HegkqYEi9po
	HoEc9tTU8pVdG+4AbxWHKP5dhJw/9VfPyqzfGCKhnoopjNm7v241Nly98U10IScKaOn7
	BB8mJFIbDM5FR+9xrspR13O+RLt6DXDFDrLTBItop+sLafQcCPlXRCf2sBgkM+2tFUm/
	QGlwJcpBqZnsAwIpqXeks322HTPtVN3xC/hU42rQPZOrmIBrGVmJ0B2HWvQrVZTC8pf+
	wenw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=jlkwEyFQGVNORc1HO+QsYD/EnjoPXcdFomzSpXi4FT8=;
	b=dlk6bE1K1JsdFY7rCpB4fx8U6GaD9ZRIglfYjNtYM+qq8RUdEbnJLRukc+qGhjp/zM
	LzWQg8FfIu19588jNdJVch/qdtZlwSnpDTcRMcijbZ97DiC+bfVhI49sXUyRkqmWgT/i
	tgJOzM61dBvOMSuT1izdphIKSJ7na9gycfz/OxSUL7Z+wTdHWPs21L5NbXUxxaAdIGJv
	x5zvKvQr4nCNXt1vcJhYcVLppq8+1AO2lGJZP3PPjpk3phDXfVcsQqb6aoIiQYvzlYwA
	uIuLGm8V9h4T2s1smmF5H7kGh94i4GbdNQnL31CKhA3XYU/BrZAfgCqpnywNoiE3ifWj
	P2HA==
X-Gm-Message-State: AJaThX7YG0sI7Xd9ykt3ADurYzLsb2jRs3sqrtpXOndJ4MligEXKz3VZ
	5PC2RKh3Zk2PEx1MFb1u1lAfJQ==
X-Google-Smtp-Source: AGs4zMYboinEkBQvzhURBabmT5DQMhbXcMiN312fo/P6H/LpHocjSQUz0nm2te50ihoUkAtyWkOsww==
X-Received: by 10.80.244.141 with SMTP id s13mr15793156edm.222.1510757010573; 
	Wed, 15 Nov 2017 06:43:30 -0800 (PST)
Received: from peterliu-Precision-M4800.emea.group.atlascopco.com
	([123.125.90.58]) by smtp.gmail.com with ESMTPSA id
	s26sm18151660eds.68.2017.11.15.06.43.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 15 Nov 2017 06:43:29 -0800 (PST)
From: liu.ming50@gmail.com
To: openembedded-devel@lists.openembedded.org
Date: Wed, 15 Nov 2017 15:41:16 +0100
Message-Id: <1510756876-27098-1-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: Ming Liu <liu.ming50@gmail.com>
Subject: [meta-oe] [PATCH] libc-bench: add recipe
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
X-List-Received-Date: Wed, 15 Nov 2017 14:43:30 -0000

From: Ming Liu <liu.ming50@gmail.com>

libc-bench is a set of time- and memory-efficiency tests to compare
implementations of various C/POSIX standard library functions.

Coverage includes:
- Malloc throughput with varying degrees and forms of contention between
  threads.
- Malloc overhead and ability to return freed memory to the OS.
- Literal string and regular expression searches.
- Thread creation and joining throughput.
- UTF-8 decoding.
- Stdio buffered reads and writes.

Signed-off-by: Ming Liu <liu.ming50@gmail.com>
---
 .../recipes-benchmark/libc-bench/libc-bench_20110206.bb | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100644 meta-oe/recipes-benchmark/libc-bench/libc-bench_20110206.bb

diff --git a/meta-oe/recipes-benchmark/libc-bench/libc-bench_20110206.bb b/meta-oe/recipes-benchmark/libc-bench/libc-bench_20110206.bb
new file mode 100644
index 0000000..f534c73
--- /dev/null
+++ b/meta-oe/recipes-benchmark/libc-bench/libc-bench_20110206.bb
@@ -0,0 +1,17 @@
+SUMMARY = "Tests to compare standard functions of different libc implementations"
+DESCRIPTION = "libc-bench is a set of time- and memory-efficiency tests to compare \
+implementations of various C/POSIX standard library functions."
+HOMEPAGE = "http://www.etalabs.net/libc-bench.html"
+SECTION = "console/utils"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://Makefile;md5=e12f113da27dfe9cfb6c2c537da8d8df"
+
+SRC_URI = "http://www.etalabs.net/releases/${BPN}-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "f763de90f95fe68e4e03e5b6f49698ac"
+SRC_URI[sha256sum] = "6825260aa5f15f4fbc7957ec578e9c859cbbe210e025ec74c4a0d05677523794"
+
+do_install () {
+    install -d ${D}${bindir}
+    install -m 0755 ${B}/libc-bench ${D}${bindir}
+}
-- 
2.7.4


