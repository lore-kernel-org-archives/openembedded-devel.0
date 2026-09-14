Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 330ECC88E6A
	for <webhook@archiver.kernel.org>; Mon, 14 Sep 2026 03:13:33 +0000 (UTC)
Received: from mail-pz2-f42.google.com (mail-pz2-f42.google.com [74.125.228.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12079.1789355603962511859
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 13 Sep 2026 20:13:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=MAQUC0FJ;
 spf=pass (domain: gmail.com, ip: 74.125.228.42, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pz2-f42.google.com with SMTP id d2e1a72fcca58-85469b35601so643230b3a.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 13 Sep 2026 20:13:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789355603; x=1789960403; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=M98FyxSIT8OIOjyA0Vx4jQt/GdTEw9IXpHU98g0Qqgw=;
        b=MAQUC0FJo9s+oXyXlYlv7jeSYGc6SX/Ei4tf25eoKLPHRrmdwTtdNAqB3mOnINlt4n
         8Kgo60jT0c6aNhqPyB0IoT7jG57WYN+cPcbfZPiOi/ugsyBUTLR/dwnmRFbH94vZ8uem
         tbTRJWL2BKDTqpjogqGlBIhJti5xLYwRFolowYdIRklcao3gWzUre19NtLbguQ93vVII
         0Z1FfBBGb+EE0lY3xavYz39NWvYhhUUEI+biT9kwpFbhQSn1J31+hINSl0SwrBVM/9mO
         kcu+oQNJWaFT0fY1aKGtuWL1AhNPH02ubg3Tn66Z1OLkheMTztki0xlF2xpb76gGowKp
         E/Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789355603; x=1789960403;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M98FyxSIT8OIOjyA0Vx4jQt/GdTEw9IXpHU98g0Qqgw=;
        b=K9z6Vefu+omqNvXvF4RATYccPxIQhlq2E96I9jtxA/68TFBgglcV/d3KnZyM12yg6Y
         kjGPOv4RUmIzHA2NJeNXp/Db4Qas7Q0s1aKBuV8yxE3hyjSxqM+N4KK2N0991v7PDU+D
         x64GLp0fmXAV3wDq6vKp+0qeTX/biyU99a5pLDynKzcOMc9DBdh60LxPla9Clz4UIpwW
         VFChDNiqV/UFD2r7+JTTQaxAUfKi5hXIt9xJx4WeXNF+WHBf2Hg0Ewq7PXFOX9EYS4vi
         LNFmK4GrpXjxzimiaExFmZT9mR2HY0DSEfR90OIs+GwPcx7Cisb/bWAa+i5af/JRJgfx
         dpKw==
X-Gm-Message-State: AFuF++lL5J5ZUagppkL5zyXOL4Lrq3DayiqDUdKICj2+hmxe7Z/s0Q8F
	gMCxbi7YU2G2EVExEJio2vW/sNWA/8r0RXwnSfG9AwhlMEuaVB5Ra8OIkf7NSdws
X-Gm-Gg: AYBFou1ucuILFSey1Cy3iVs1qHRZlFSRJGiCxWuapf5ie0wpOXdtLMAmeOrZI0bNaQq
	cBP+IEs61qdOIhT8SXW11vu1yZPMbQ5F0QzOfDcNmGqUsupc9p2ECMsgr+1ZsXncMmqn+l3UCX3
	CcdAoqHxvtq37/1trnAS63S/Jm0RFbgQlPRUDzDAeDEC6UzM0J826rWgJ5x2nA2+iYq0L8dJciN
	CN9cjSeqWZNX2NqzvBlQrOD5feML6OcIjzK7s86HocSAOWRZfzAy4mtzcyqnQI379YC50lFDYIO
	E1cfxBr8A7jIvRXDvpr4V91E895dtl8hDsD3R+owup5TNA0y/p3zcvSa8zPwjUM7AKBvEv1zewo
	Q4W7HpL+IxKtUoX5a14wne9z/klZg/+K2ATd0vp43NIDMiyPM/lNJM7DNjo4x0UStBgmWkqTZi9
	Q6ZDzOWWP4slfTCaMR2LUyWtmrk/BPBHf8KOTsd0wqwyhRuureKB6uWnxBYvj5x8Tgkec/BjO8S
	MCT3LiCjjdg0tpEq5yiAR2meFsVnTg=
X-Received: by 2002:a05:6a00:3924:b0:86e:8deb:fbd4 with SMTP id d2e1a72fcca58-86f8374468dmr1663902b3a.11.1789355603162;
        Sun, 13 Sep 2026 20:13:23 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([202.170.174.3])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-86b2a2b5c72sm3712425b3a.52.2026.09.13.20.13.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 20:13:22 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-python][wrynose][PATCH 6/10] python3-sqlparse: patch CVE-2026-54284
Date: Mon, 14 Sep 2026 15:12:54 +1200
Message-ID: <20260914031300.3677365-6-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260914031300.3677365-1-ankur.tyagi85@gmail.com>
References: <20260914031300.3677365-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 14 Sep 2026 03:13:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130014

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Detais:
https://nvd.nist.gov/vuln/detail/cve-2026-54284

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../python3-sqlparse/CVE-2026-54284-1.patch   |  37 +++++
 .../python3-sqlparse/CVE-2026-54284-2.patch   | 144 ++++++++++++++++++
 .../python/python3-sqlparse_0.5.5.bb          |   4 +
 3 files changed, 185 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-sqlparse/CVE-2026-54284-1.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-sqlparse/CVE-2026-54284-2.patch

diff --git a/meta-python/recipes-devtools/python/python3-sqlparse/CVE-2026-54284-1.patch b/meta-python/recipes-devtools/python/python3-sqlparse/CVE-2026-54284-1.patch
new file mode 100644
index 0000000000..90769436aa
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-sqlparse/CVE-2026-54284-1.patch
@@ -0,0 +1,37 @@
+From 1a0f6530c8f506f953d1b4ffdfa84ae7ad72f7df Mon Sep 17 00:00:00 2001
+From: alhudz <al.hudz.k@gmail.com>
+Date: Mon, 1 Jun 2026 19:05:57 +0530
+Subject: [PATCH] set group value from child tokens to avoid quadratic grouping
+
+(cherry picked from commit 939b129e24c0ad5d51368b1aa72fffcaca76f06f)
+
+CVE: CVE-2026-54284
+Upstream-Status: Backport [https://github.com/andialbrecht/sqlparse/commit/939b129e24c0ad5d51368b1aa72fffcaca76f06f]
+
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ sqlparse/sql.py | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/sqlparse/sql.py b/sqlparse/sql.py
+index 831dfb9..0163ff1 100644
+--- a/sqlparse/sql.py
++++ b/sqlparse/sql.py
+@@ -159,7 +159,7 @@ class TokenList(Token):
+     def __init__(self, tokens=None):
+         self.tokens = tokens or []
+         [setattr(token, 'parent', self) for token in self.tokens]
+-        super().__init__(None, str(self))
++        super().__init__(None, ''.join(token.value for token in self.tokens))
+         self.is_group = True
+ 
+     def __str__(self):
+@@ -322,7 +322,7 @@ class TokenList(Token):
+             grp = start
+             grp.tokens.extend(subtokens)
+             del self.tokens[start_idx + 1:end_idx]
+-            grp.value = str(start)
++            grp.value += ''.join(token.value for token in subtokens)
+         else:
+             subtokens = self.tokens[start_idx:end_idx]
+             grp = grp_cls(subtokens)
diff --git a/meta-python/recipes-devtools/python/python3-sqlparse/CVE-2026-54284-2.patch b/meta-python/recipes-devtools/python/python3-sqlparse/CVE-2026-54284-2.patch
new file mode 100644
index 0000000000..c2d355f78a
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-sqlparse/CVE-2026-54284-2.patch
@@ -0,0 +1,144 @@
+From 6416e171b41da8939f391c0492b355d3b6cb8c11 Mon Sep 17 00:00:00 2001
+From: Andi Albrecht <albrecht.andi@gmail.com>
+Date: Sat, 6 Jun 2026 07:12:43 +0200
+Subject: [PATCH] Add tests from PR, update CHANGELOG and AUTHORS.
+
+(cherry picked from commit f80af6a4007f11ada847218df8c29dc859238290)
+
+CVE: CVE-2026-54284
+Upstream-Status: Backport [https://github.com/andialbrecht/sqlparse/commit/f80af6a4007f11ada847218df8c29dc859238290]
+
+Dropped changes to the CHANGELOG file.
+
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ AUTHORS                      |  2 ++
+ benchmarks/bench_grouping.py | 59 ++++++++++++++++++++++++++++++++++++
+ tests/test_dos_prevention.py | 28 +++++++++++++++++
+ 3 files changed, 89 insertions(+)
+ create mode 100644 benchmarks/bench_grouping.py
+
+diff --git a/AUTHORS b/AUTHORS
+index 24ca667..872c700 100644
+--- a/AUTHORS
++++ b/AUTHORS
+@@ -12,6 +12,7 @@ Alphabetical list of contributors:
+ * Aki Ariga <chezou+github@gmail.com>
+ * Alexander Beedie <ayembee@gmail.com>
+ * Alexey Malyshev <nostrict@gmail.com>
++* alhudz <al.hudz.k@gmail.com>
+ * ali-tny <aliteeney@googlemail.com>
+ * andrew deryabin <github@djsf.com>
+ * Andrew Tipton <andrew.tipton@compareglobalgroup.com>
+@@ -77,6 +78,7 @@ Alphabetical list of contributors:
+ * Tao Wang <twang2218@gmail.com>
+ * Tenghuan <tenghuanhe@gmail.com>
+ * Tim Graham <timograham@gmail.com>
++* tonghuaroot <tonghuaroot@users.noreply.github.com>
+ * Victor Hahn <info@victor-hahn.de>
+ * Victor Uriarte <vmuriart@gmail.com>
+ * Ville Skyttä <ville.skytta@iki.fi>
+diff --git a/benchmarks/bench_grouping.py b/benchmarks/bench_grouping.py
+new file mode 100644
+index 0000000..245ea0e
+--- /dev/null
++++ b/benchmarks/bench_grouping.py
+@@ -0,0 +1,59 @@
++"""Grouping performance benchmarks.
++
++Measures parse time for SQL patterns that stress the grouping engine:
++- Deeply nested parentheses
++- Deeply nested CASE WHEN expressions
++- Wide column lists (tests O(N) identifier grouping, fixed in PR848)
++
++Run with:  python benchmarks/bench_grouping.py
++"""
++
++import signal
++import time
++
++import sqlparse
++
++
++def _alarm_handler(signum, frame):
++    raise TimeoutError()
++
++
++signal.signal(signal.SIGALRM, _alarm_handler)
++
++
++def measure(label, sql, fn):
++    signal.alarm(30)
++    t0 = time.perf_counter()
++    status = 'OK'
++    try:
++        fn(sql)
++    except sqlparse.exceptions.SQLParseError:
++        status = 'CAP'
++    except TimeoutError:
++        status = 'TIMEOUT'
++    finally:
++        signal.alarm(0)
++    dt = (time.perf_counter() - t0) * 1000
++    print(f'  {status:8} {dt:8.1f} ms  {label}  ({len(sql)} B)')
++
++
++# Vector 1: deeply nested parentheses
++print('Nested parentheses:')
++for n in (200, 500, 1000, 2000):
++    sql = 'SELECT ' + '(' * n + '1' + ')' * n
++    measure(f'nested-paren n={n}', sql, sqlparse.parse)
++
++# Vector 2: deeply nested CASE WHEN
++print('Nested CASE WHEN:')
++for n in (100, 200, 400):
++    case = '1'
++    for i in range(n):
++        case = f'CASE WHEN x={i} THEN {case} ELSE NULL END'
++    measure(f'CASE-nested n={n}', f'SELECT {case} FROM t', sqlparse.parse)
++
++# Vector 3: wide column lists (O(N) grouping, regression fixed in PR848)
++print('Wide column lists:')
++for n in (500, 1000, 2000, 4000):
++    cols = ', '.join(f'col_{i}' for i in range(n))
++    sql = f'SELECT {cols} FROM t'
++    measure(f'wide-select n={n}', sql, sqlparse.parse)
+diff --git a/tests/test_dos_prevention.py b/tests/test_dos_prevention.py
+index 4e826c5..1753c05 100644
+--- a/tests/test_dos_prevention.py
++++ b/tests/test_dos_prevention.py
+@@ -50,6 +50,34 @@ class TestDoSPrevention:
+         with pytest.raises(SQLParseError, match="Maximum number of tokens exceeded"):
+             sqlparse.format(sql, reindent=True)
+ 
++    def test_nested_paren_within_cap_under_1s(self):
++        """Reaching MAX_GROUPING_DEPTH must not require multi-second CPU.
++
++        Before the TokenList.__init__ fix, a 1 KB payload of 500 nested
++        parens took ~1.3 s and a 2 KB payload of 1000 nested parens took
++        ~11 s before the depth cap raised SQLParseError, because each
++        TokenList materialised its ``value`` via ``str(self)`` which
++        recursed over the full subtree (O(n * depth)).
++        """
++        sql = 'SELECT ' + '(' * 1000 + '1' + ')' * 1000
++        t0 = time.perf_counter()
++        with pytest.raises(SQLParseError, match='Maximum grouping depth'):
++            sqlparse.parse(sql)
++        dt = time.perf_counter() - t0
++        assert dt < 1.0, f'parse took {dt:.2f}s, expected sub-second'
++
++    def test_nested_case_within_cap_under_1s(self):
++        """Same invariant as nested parentheses, exercised via CASE WHEN."""
++        case = '1'
++        for i in range(400):
++            case = f'CASE WHEN x={i} THEN {case} ELSE NULL END'
++        sql = f'SELECT {case} FROM t'
++        t0 = time.perf_counter()
++        with pytest.raises(SQLParseError, match='Maximum grouping depth'):
++            sqlparse.parse(sql)
++        dt = time.perf_counter() - t0
++        assert dt < 1.0, f'parse took {dt:.2f}s, expected sub-second'
++
+     def test_normal_sql_still_works(self):
+         """Test that normal SQL still works correctly after DoS protections."""
+         sql = """
diff --git a/meta-python/recipes-devtools/python/python3-sqlparse_0.5.5.bb b/meta-python/recipes-devtools/python/python3-sqlparse_0.5.5.bb
index 03c032c49e..021ccfa349 100644
--- a/meta-python/recipes-devtools/python/python3-sqlparse_0.5.5.bb
+++ b/meta-python/recipes-devtools/python/python3-sqlparse_0.5.5.bb
@@ -6,6 +6,10 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=2b136f573f5386001ea3b7b9016222fc"
 
 SRC_URI[sha256sum] = "e20d4a9b0b8585fdf63b10d30066c7c94c5d7a7ec47c889a2d83a3caa93ff28e"
 
+SRC_URI += "file://CVE-2026-54284-1.patch \
+            file://CVE-2026-54284-2.patch \
+"
+
 CVE_PRODUCT = "sqlparse"
 
 export BUILD_SYS

