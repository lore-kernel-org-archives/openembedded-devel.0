Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
	[209.85.214.194])
	by mail.openembedded.org (Postfix) with ESMTP id 684F17F81C
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Dec 2019 03:42:10 +0000 (UTC)
Received: by mail-pl1-f194.google.com with SMTP id c13so3857043pls.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Dec 2019 19:42:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=1SMcBtJSbWqr8dJvPWQ5S1lxk1tdmTYl5rVFi6P6LbM=;
	b=PhMcr5C/Tlj515uMoA6vc2RyvYhIZuOnS7X+jJO761oIPOwxlB3c44sLtYN7VJK+FI
	avIA/PLhjvDJm+8uPKmvTkW38hVTLO1Tq93I8+p5CjazTEz/Z8Il3Pr4p97s30eSvWr5
	5GLJgtPZdwrlSrFEvbS5HTIFSImhuIfJqqVZtp6JqdPMaLYtxUUWuN3T0CzOf3jGQtKF
	nwCkf2hawFX9djA1fe6KNVlxO0t6LmWcSZ1nI+BIOsffe/+ieIpZYDygQueYA8TMgxu8
	tJWRZcOtsyE840ynS2pGJlHwpEe7ij9EVPD6NEAhAOnoDviMM64dgIiRIhn/LiN3vNNK
	iDbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=1SMcBtJSbWqr8dJvPWQ5S1lxk1tdmTYl5rVFi6P6LbM=;
	b=rex5lb9Kep5QzJ3g0k4udHVUCv3uL64eH3YpnYsoCCqpUiwGzK/VavRZYvgR4HrOYH
	3odgnC/aUJ9WKWwq6OIWsBaahk/fAnJG0g2+GsFVUuVcIjHw9N+i632hch+hEODBcukz
	uNCvgWU2uVdpvnLJ78ZI5aRsDMUE889BqTv1sazuAzm29umwZ6mNTQ130SejgbLmzKSU
	be8VtlDSuxiDUc6iEw9x8ts8fJemjSjjnfiSIWlk0bBAhZgXD3aBeNBUnuugFPVgW2O1
	sSdDR375X+jw5X46tN8bejjTbg/k3VW/Dl1d3bnw3NPJneVLTPwWIgJM5wGhHscPXXPu
	cDwQ==
X-Gm-Message-State: APjAAAX3VFSsKnDLNf/HLQPvCPXV8mboXE3OJgKGPZDDrevAc6JxyPKm
	DHc+O6rRB+NJOS0A6C0K7GpdiAoJi3I=
X-Google-Smtp-Source: APXvYqyxWo4R/w6fOqM7DLc6py6vf+9sOO2nfQcm0UQkf6/U+OG5WTq+/6pp0P/krbNmOFziELOfbw==
X-Received: by 2002:a17:90b:252:: with SMTP id
	fz18mr15540234pjb.49.1576467731258; 
	Sun, 15 Dec 2019 19:42:11 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::6563])
	by smtp.gmail.com with ESMTPSA id
	a22sm21336106pfk.108.2019.12.15.19.42.10
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 15 Dec 2019 19:42:10 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 15 Dec 2019 19:41:53 -0800
Message-Id: <20191216034155.2675900-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20191216034155.2675900-1-raj.khem@gmail.com>
References: <20191216034155.2675900-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 3/5] rsyslog: Sync VALGRIND supported arch list
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
X-List-Received-Date: Mon, 16 Dec 2019 03:42:11 -0000
Content-Transfer-Encoding: 8bit

This list should be same as the valgrind recipe

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../rsyslog/rsyslog_8.1910.0.bb               | 24 +++++++++++++++----
 1 file changed, 19 insertions(+), 5 deletions(-)

diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog_8.1910.0.bb b/meta-oe/recipes-extended/rsyslog/rsyslog_8.1910.0.bb
index 8287d2b7fe..89ccc6d751 100644
--- a/meta-oe/recipes-extended/rsyslog/rsyslog_8.1910.0.bb
+++ b/meta-oe/recipes-extended/rsyslog/rsyslog_8.1910.0.bb
@@ -162,12 +162,26 @@ RDEPENDS_${PN} += "logrotate"
 
 # for rsyslog-ptest
 VALGRIND = "valgrind"
-VALGRIND_mips = ""
-VALGRIND_mips64 = ""
-VALGRIND_mips64n32 = ""
-VALGRIND_arm = ""
-VALGRIND_aarch64 = ""
+
+# valgrind supports armv7 and above
+VALGRIND_armv4 = ''
+VALGRIND_armv5 = ''
+VALGRIND_armv6 = ''
+
+# X32 isn't supported by valgrind at this time
+VALGRIND_linux-gnux32 = ''
+VALGRIND_linux-muslx32 = ''
+
+# Disable for some MIPS variants
+VALGRIND_mipsarchr6 = ''
+VALGRIND_linux-gnun32 = ''
+
+# Disable for powerpc64 with musl
+VALGRIND_libc-musl_powerpc64 = ''
+
+# RISC-V support for valgrind is not there yet
 VALGRIND_riscv64 = ""
+
 RDEPENDS_${PN}-ptest += "\
   make diffutils gzip bash gawk coreutils procps \
   libgcc python-core python-io \
-- 
2.24.1


