Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
	[209.85.210.195])
	by mail.openembedded.org (Postfix) with ESMTP id 704DE615C7
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Feb 2020 06:25:56 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id q8so10110393pfh.7
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Feb 2020 22:25:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=7Rgjs5W3nj1mQvPBpXY9qYcLmQZlbhfJA0gp8S+ZObg=;
	b=IYcwW0p9T4l9h7YAwv+JowxDLqbqn7SKymPu4Vs4uaNo5bwA0H/CoF88vnA8U+n+xo
	dJ8JO44w41LrAZk3DJHInNixboDMBOtPk9D+84+P2oqZzh+fW8+F80APyLbZ7aiBmt+0
	qfLqYrfucie+VgGQ0S/VJI0NwTskR8QXjYsWTNw8ENiHCWWMlqILeXWLdCtxsl7NSnfU
	p1zX2cVkRHoXLT40edw4j2NG3rb/wt+nGow+jd9Jy4hpe3R1x0y7FkQkfJQdzD0YguQE
	1g1H+Kcyg2M5lRULKCT7yxsAUG8lVjnLldQymlxwIQuzzV7gmuhImeoU1nPDOnvte9JZ
	dd1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=7Rgjs5W3nj1mQvPBpXY9qYcLmQZlbhfJA0gp8S+ZObg=;
	b=jTm/pzquv0gkwT3kLHOtz3kUD6e3yRe6Vbl3sbhvDBE7CMrhtoN4jdNQZbLF3J0k7b
	mluJrul81yBZYTbtpdVERY7fXZFSb6vt67FbNl+hVuNHnGLEd248t7shdLynUmCzTE0B
	476jJUHYTiac6/p2gmplqDMqZG2I15SJAglxMObGmu/zI6KGKoz+LD2SBUYvdEMkYMkg
	EePQysHySS20Ftu8t03WkYR0qeiA6HlXd9iVOzEP9r0IYstl14E1trJb6psM1OW2E8Hn
	ic68tO1Q1EVRGguOkECAqwdQ84xACCealoGWjzAotC8LzlUU5QHnZc/XrQToFgis1Lpv
	YM4w==
X-Gm-Message-State: APjAAAWsAFcN44L9OlKxMoIixEQTOWsJUJG6hm52BPyVtZJpfnY3MDyr
	qGpAj0T36qjQc8vRVWjoEfCIig5LxGs=
X-Google-Smtp-Source: APXvYqzBD2hWt32cRrqbrR1Vau+cl14wDtxhEMZYCg4+c2dX9dGkW/KXh8aN4VHR/z0rCBisRFp3TQ==
X-Received: by 2002:a63:1503:: with SMTP id v3mr21274719pgl.295.1582007157185; 
	Mon, 17 Feb 2020 22:25:57 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::98a3])
	by smtp.gmail.com with ESMTPSA id ev5sm1571898pjb.4.2020.02.17.22.25.56
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 17 Feb 2020 22:25:56 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 17 Feb 2020 22:26:01 -0800
Message-Id: <20200218062601.3743291-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200218062601.3743291-1-raj.khem@gmail.com>
References: <20200218062601.3743291-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 3/3] rsyslog: Use python3 in ptests
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
X-List-Received-Date: Tue, 18 Feb 2020 06:25:56 -0000
Content-Transfer-Encoding: 8bit

Adjusts rdeps accordingly

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-extended/rsyslog/rsyslog_8.1911.0.bb | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog_8.1911.0.bb b/meta-oe/recipes-extended/rsyslog/rsyslog_8.1911.0.bb
index 29bba2d9a7..f82caf7b5c 100644
--- a/meta-oe/recipes-extended/rsyslog/rsyslog_8.1911.0.bb
+++ b/meta-oe/recipes-extended/rsyslog/rsyslog_8.1911.0.bb
@@ -77,6 +77,12 @@ PACKAGECONFIG[libdbi] = "--enable-libdbi,--disable-libdbi,libdbi,"
 PACKAGECONFIG[mail] = "--enable-mail,--disable-mail,,"
 PACKAGECONFIG[valgrind] = "--enable-valgrind,--disable-valgrind,valgrind,"
 
+do_configure_prepend() {
+    sed -i -e 's|python |python3 |g' ${S}/tests/*.sh
+    sed -i -e 's|/usr/bin/env python|/usr/bin/env python3|g' ${S}/tests/*.py
+    sed -i -e 's|/usr/bin/env python|/usr/bin/env python3|g' ${S}/tests/testsuites/*.py
+}
+
 TESTDIR = "tests"
 do_compile_ptest() {
     echo 'buildtest-TESTS: $(check_PROGRAMS)' >> ${TESTDIR}/Makefile
@@ -186,6 +192,6 @@ VALGRIND_riscv64 = ""
 
 RDEPENDS_${PN}-ptest += "\
   make diffutils gzip bash gawk coreutils procps \
-  libgcc python-core python-io \
+  libgcc python3-core python3-io \
   "
 RRECOMMENDS_${PN}-ptest += "${TCLIBC}-dbg ${VALGRIND}"
-- 
2.25.1


