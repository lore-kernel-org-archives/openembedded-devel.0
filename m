Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16220C88E66
	for <webhook@archiver.kernel.org>; Mon, 14 Sep 2026 03:13:33 +0000 (UTC)
Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12081.1789355612322366707
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 13 Sep 2026 20:13:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=fRN9uYK6;
 spf=pass (domain: gmail.com, ip: 74.125.228.12, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pz2-f12.google.com with SMTP id d2e1a72fcca58-85469e211a0so1310414b3a.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 13 Sep 2026 20:13:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789355612; x=1789960412; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VgzXQM1CNnUP6+dXHN+dhXBQziPytOi6dtk7PN1DgTM=;
        b=fRN9uYK67gAkw3mrrmvAfne0BwSBvz89DYOVZfS7o14LnYAHYNmuteQv0zXU0xN+dh
         IXDzusO6JIews8ShLGEO5Sgpt/cvzriw0CjGDVMGtdCq53SICKPpujhRvxbNCR39TtpE
         eMf6yj+u3zrFrCkw7vEqSOyH5PUMty6o/icuJ7Nq6Mk21Ut8fyTAiptenu1jNnpKxWKE
         nWfWB4XWRd0irioXceNhMLPW+Otdf/GuyUcEluy94/PBZjwAFwtH4vjCP7tFcTvrUxoK
         PugH/nM6S/8Ngw4WZsM7S9rp5b3lCathPYbd+yZ2CEkz1tdQr4gCI3cdDhMig4yoO/g5
         TMFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789355612; x=1789960412;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VgzXQM1CNnUP6+dXHN+dhXBQziPytOi6dtk7PN1DgTM=;
        b=r2vBZGqWqeV1Op3ohu4TVTj3ccDicE0zl3gxdBFDKHxT5Gx84EUvsxylentTOBVIFB
         bsg0G1AGuUJGOuHbbwl3vO1rJvTfBgWPtP7LERWVCiObu0wUQTn8uPTCgSMKSQDiCU1c
         h4LpRYTucIcMIucwrHNPP1FdrG5InVX4UWZPR5OOQYlP0843RCOFWOAWKpJ1pTTiqxPQ
         N641kXXAYV4Nyf7FcoE456JnUHIiLpt395v/EyTc8SGTjA0msj3UglzLgWPuBTA93P0W
         MB29NMCt8IW02wq1PKMCyD8N7TvSrRIS0c0Cn/kn4BUlf5c3vccJofe2fvKKR1fIpMli
         aqLw==
X-Gm-Message-State: AFuF++loIxMsgcndmwelpJvY8UZvsN+BkRGC4tNcx+xKMEpies2CQ6sQ
	O2rPz8wCaexxsCOfyMJoSdqYcnPM2vSVkASMJ/mpjlzAxSsHZdPko+YFzmhl4azN
X-Gm-Gg: AYBFou3B24huuJKWQRF2BpwjFdAcoAqnZjmuY3nqljl6C5OryYAKV3UjBTuolqQY04k
	pvItQZ0yY44CemMmi0Y50w7lkkeyKgLPTghzAXXMwL1l00RjuaAPDp4pCaHh6aRP3+v3y4ZT1zt
	R+oiRLctM84EeYeevPVFSMjVdlXHSE5tUIP5XaKyxeoUAUOHzO8ceJeOBkQ16g0kiEIjWHOfVVP
	mkesnQtustmnRCGzNtdPNobV3jtKDvdYenk6SZvloxBT2cnEJRMywoAnR4tiT8D3ZT9SBV/Iaaz
	ImRUJVlt40X36+pMjNYHmUCDI4v/AwO20pG3UYeMgPj56+HZBG2z/HQs/RZJxDRhpOIhd2jtpDk
	i72bMnK2x61t1HRkPXV0Uvpjxpr4iF+CCdF2qneHkwGsK+kfjShMTxXExBep64W5riRf8YYKzq/
	tiJ1gQHg2y7rVGZxbZbk4yHJUdvFrYbZRFgcIOsnNtTur8mTrmJj6amkRT0YayEmZYflR5FzJcT
	KCKLwcgymO3lBo1TSZcGzxGtvgwnoI=
X-Received: by 2002:a05:6a00:992:b0:866:abd8:f112 with SMTP id d2e1a72fcca58-86f83a3f608mr1823585b3a.8.1789355611590;
        Sun, 13 Sep 2026 20:13:31 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([202.170.174.3])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-86b2a2b5c72sm3712425b3a.52.2026.09.13.20.13.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 20:13:31 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-python][wrynose][PATCH 9/10] python3-sqlparse: patch CVE-2026-71491
Date: Mon, 14 Sep 2026 15:12:57 +1200
Message-ID: <20260914031300.3677365-9-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260914031300.3677365-1-ankur.tyagi85@gmail.com>
References: <20260914031300.3677365-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 14 Sep 2026 03:13:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130017

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-71491

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../python3-sqlparse/CVE-2026-71491.patch     | 147 ++++++++++++++++++
 .../python/python3-sqlparse_0.5.5.bb          |   1 +
 2 files changed, 148 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-sqlparse/CVE-2026-71491.patch

diff --git a/meta-python/recipes-devtools/python/python3-sqlparse/CVE-2026-71491.patch b/meta-python/recipes-devtools/python/python3-sqlparse/CVE-2026-71491.patch
new file mode 100644
index 0000000000..e0136cc4aa
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-sqlparse/CVE-2026-71491.patch
@@ -0,0 +1,147 @@
+From ca01c323483883f205ee7bb44581c674fcfe6e49 Mon Sep 17 00:00:00 2001
+From: Andi Albrecht <albrecht.andi@gmail.com>
+Date: Mon, 10 Aug 2026 07:35:42 +0200
+Subject: [PATCH] Fix quadratic DoS in group_comments (GHSA-f2ff-p2ww-7p4p)
+
+A comment-only statement ('-- c\n' repeated) made group_comments rescan
+the whole remaining token tail once per comment token, costing O(n^2).
+Because group_comments runs before the MAX_GROUPING_TOKENS guard, the
+cost was paid even on oversized input.
+
+Stop as soon as token_not_matching finds no terminator in the remaining
+tokens: from that point on nothing can group, so re-scanning the tail is
+wasted work. This makes the pass O(n) while preserving grouping output.
+
+Add benchmarks/validate_group_comments_dos.py to check the scaling.
+
+Reported by sanktjodel.
+
+Co-Authored-By: Claude Opus 4.8 <noreply@anthropic.com>
+
+(cherry picked from commit ef2012a5eeb491e604dea2b00d516904a3830c87)
+
+CVE: CVE-2026-71491
+Upstream-Status: Backport [https://github.com/andialbrecht/sqlparse/commit/ef2012a5eeb491e604dea2b00d516904a3830c87]
+
+Dropped changes to the CHANGELOG file.
+
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ benchmarks/validate_group_comments_dos.py | 85 +++++++++++++++++++++++
+ sqlparse/engine/grouping.py               | 11 ++-
+ 2 files changed, 93 insertions(+), 3 deletions(-)
+ create mode 100644 benchmarks/validate_group_comments_dos.py
+
+diff --git a/benchmarks/validate_group_comments_dos.py b/benchmarks/validate_group_comments_dos.py
+new file mode 100644
+index 0000000..58b3e01
+--- /dev/null
++++ b/benchmarks/validate_group_comments_dos.py
+@@ -0,0 +1,85 @@
++"""Validate that ``group_comments`` scales linearly on comment-only input.
++
++Regression check for the quadratic O(n^2) DoS in ``group_comments``
++(sqlparse/engine/grouping.py), reported as GHSA-f2ff-p2ww-7p4p.
++
++A statement made only of single-line comments (``'-- c\\n'`` repeated n times)
++lexes in O(n) but ``group_comments`` rescans the O(n) remaining tokens for every
++comment token, giving O(n^2) total work. ``group_comments`` runs first in
++``group()``, before the ``MAX_GROUPING_TOKENS`` guard, so the token cap does not
++protect this vector. The path is reachable via ``sqlparse.parse()`` and
++``sqlparse.format(sql, strip_comments=True)``.
++
++This script measures the scaling of the vulnerable path and reports whether the
++observed growth is quadratic (vulnerable) or roughly linear (patched).
++
++Run with:  python benchmarks/validate_group_comments_dos.py
++
++Exit code 0 => behaviour looks linear (advisory mitigated).
++Exit code 1 => behaviour looks quadratic (advisory reproduced).
++"""
++
++import sys
++import time
++
++import sqlparse
++
++
++def payload(n):
++    """A comment-only statement of n single-line comments."""
++    return '-- c\n' * n
++
++
++def measure(fn, sql):
++    t0 = time.perf_counter()
++    fn(sql)
++    return (time.perf_counter() - t0) * 1000
++
++
++def run(label, fn):
++    print(f'{label}:')
++    sizes = (1000, 2000, 4000, 8000)
++    timings = []
++    for n in sizes:
++        dt = measure(fn, payload(n))
++        timings.append(dt)
++        print(f'  n={n:5d}  {dt:8.1f} ms  ({len(payload(n))} B)')
++
++    # For each doubling of the input, quadratic growth ~4x, linear ~2x.
++    ratios = [b / a for a, b in zip(timings, timings[1:]) if a > 0]
++    print(f'  doubling ratios: {", ".join(f"{r:.2f}x" for r in ratios)}')
++    return ratios
++
++
++def classify(ratios):
++    """Quadratic if the average per-doubling ratio is closer to 4x than 2x."""
++    if not ratios:
++        return 'inconclusive', 0.0
++    avg = sum(ratios) / len(ratios)
++    # Midpoint between linear (2x) and quadratic (4x) is 3x.
++    return ('quadratic' if avg >= 3.0 else 'linear'), avg
++
++
++def main():
++    print('GHSA-f2ff-p2ww-7p4p: quadratic DoS in group_comments\n')
++
++    all_ratios = []
++    all_ratios += run('sqlparse.parse', sqlparse.parse)
++    print()
++    all_ratios += run(
++        'sqlparse.format(strip_comments=True)',
++        lambda s: sqlparse.format(s, strip_comments=True),
++    )
++    print()
++
++    verdict, avg = classify(all_ratios)
++    print(f'Average doubling ratio: {avg:.2f}x  =>  {verdict}')
++    if verdict == 'quadratic':
++        print('VULNERABLE: growth is quadratic, advisory reproduced.')
++        return 1
++    print('OK: growth is roughly linear, advisory mitigated.')
++    return 0
++
++
++if __name__ == '__main__':
++    sys.exit(main())
+diff --git a/sqlparse/engine/grouping.py b/sqlparse/engine/grouping.py
+index 43ca5b5..7a3ca1a 100644
+--- a/sqlparse/engine/grouping.py
++++ b/sqlparse/engine/grouping.py
+@@ -339,9 +339,14 @@ def group_comments(tlist):
+     while token:
+         eidx, end = tlist.token_not_matching(
+             lambda tk: imt(tk, t=T.Comment) or tk.is_newline, idx=tidx)
+-        if end is not None:
+-            eidx, end = tlist.token_prev(eidx, skip_ws=False)
+-            tlist.group_tokens(sql.Comment, tidx, eidx)
++        if end is None:
++            # From tidx onward everything is comment/newline: there is no
++            # terminator to group against, and every later start would hit
++            # the same dead end. Stop instead of re-scanning the tail once
++            # per remaining comment token (which is O(n**2)).
++            break
++        eidx, end = tlist.token_prev(eidx, skip_ws=False)
++        tlist.group_tokens(sql.Comment, tidx, eidx)
+ 
+         tidx, token = tlist.token_next_by(t=T.Comment, idx=tidx)
+ 
diff --git a/meta-python/recipes-devtools/python/python3-sqlparse_0.5.5.bb b/meta-python/recipes-devtools/python/python3-sqlparse_0.5.5.bb
index a23f5ec0e2..61fe759ede 100644
--- a/meta-python/recipes-devtools/python/python3-sqlparse_0.5.5.bb
+++ b/meta-python/recipes-devtools/python/python3-sqlparse_0.5.5.bb
@@ -10,6 +10,7 @@ SRC_URI += "file://CVE-2026-54284-1.patch \
             file://CVE-2026-54284-2.patch \
             file://CVE-2026-59893.patch \
             file://CVE-2026-59894.patch \
+            file://CVE-2026-71491.patch \
 "
 
 CVE_PRODUCT = "sqlparse"

