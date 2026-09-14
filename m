Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 244E3C88E5C
	for <webhook@archiver.kernel.org>; Mon, 14 Sep 2026 03:13:33 +0000 (UTC)
Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12169.1789355606840516848
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 13 Sep 2026 20:13:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=r9Dxf8Mj;
 spf=pass (domain: gmail.com, ip: 74.125.228.12, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pz2-f12.google.com with SMTP id d2e1a72fcca58-85469b35611so671920b3a.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 13 Sep 2026 20:13:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789355606; x=1789960406; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=s3QyXvjbiZu+T36QqmtNtiKDGyyODoOfgKvufzNPjTk=;
        b=r9Dxf8Mjmvigl4gtyKpcZLQJrUyD1MFA7wyWg+L6TrsqXFs4nt8gTJbSd3cRh0Yte4
         RGdTCRQg5d2phu6mD1QSGUSEZlnqzo10UnfLHmGe+yylrNumitbHw0NxyuoaQBfXwiVs
         6nJcgjWD3XJJv+ri93zPJy5ubZM1XeENUQ2tmyFRASleKySJzpkRrUB/PD5KOpWV9eHl
         jNOGUf72Bx0z+l/JScfBHfTsqVb/XwZ+ceeZ9YKbQL63VNmvkGN68ETNLTugVW4MIb8G
         17orsSNlyb/k9UBKskzOuFapBwgeVLu6o7tLLlFcV/Gr2D2mJRCv+9Md8C1b8vkEsxRD
         h0WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789355606; x=1789960406;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s3QyXvjbiZu+T36QqmtNtiKDGyyODoOfgKvufzNPjTk=;
        b=nlMKttzAZV7L5W/X281kES47KUmi5N2rJwRNhlAIsd1WhhWhJGZtqYqQ38PswIg+pp
         Bb7mK+opyd7JEQcHZiR7QUsNiPi3/2CI+0ur6k1t65B/vQG9X4aqe/39IyhJ+KtI1yr1
         79qlPJNgn6VI/3427UiTyk3UPBYwYAjMjTmNe0ozJ2+TySc3cxzfh9dxkG5h/3+Nheiv
         YiUAliG6uL8GiEn71rZ3FS7x8kZAsO3UKwL8HCtvD20jMm1Ofs/ZXEONjo4PS6pE37LW
         j6aG67wRTidsnqRxYGI8qBuLQIBG2wva04v3AknuFg5HUkZSi5FhuMpKPMyNbRBTWbrH
         rCNA==
X-Gm-Message-State: AFuF++mVgk241jVjqhUJKotuUQ5KQrP/6U/gnTs8yFbBkhdxBv5b5dGE
	1qO1RV1BR4v1vbk1RuqnNo6r9d51y2vjaFiuBQFXk3d5zb9s5fpAidnul4CED+aK
X-Gm-Gg: AYBFou0UHNmxu6/2yPlXWT/LBStAllZbYz3GVbOBr36i8XdomWa+od6B59kFSonIuUo
	Z1ks+CGoKqFVbnD58e8DGno4FQuFwBneu7QOSvv9p9IJEVK7jqtECcHgKe4TVj2DepflRDlqCUu
	gbi2aG4Eor7Eo0diFAfXIrUxYY1f5iu292eviwgDISQVvShvu90KC9eNXXAXyykylroSD6G33ON
	RrwXx9IoqPDxDvvtSRnKsG2wuRL5P7DukQM/RE1wnHRLlqCgrtiUW5ZtyJFaGZiWe+T6rPaaWTq
	9rQ1EML7RNff9PX9zhn80THpkNquJudL6wXPEoYWNKZ4aye2ulLL8S70juazpn6NW3Ia9DE0uA1
	z5sXFxYX3Un7dCOR/0yD2dgonp7ouHVuTNRnm1oO4PCZ2AUyOwpx5wXE8jMI+SRXz7Isdaodl9G
	XFsctPQMeIDkhyu2Hq3onBkmhsgCV8LCApO+9cDbdaN0r/XS7pPQ5xqTdRdES8SMrzfVZCMDAHZ
	HfzEEoGEhJz5BwYzUKB
X-Received: by 2002:a05:6a00:94d6:b0:86b:43f6:67c4 with SMTP id d2e1a72fcca58-86f82a5f17bmr1701918b3a.1.1789355606040;
        Sun, 13 Sep 2026 20:13:26 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([202.170.174.3])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-86b2a2b5c72sm3712425b3a.52.2026.09.13.20.13.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 20:13:25 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-python][wrynose][PATCH 7/10] python3-sqlparse: patch CVE-2026-59893
Date: Mon, 14 Sep 2026 15:12:55 +1200
Message-ID: <20260914031300.3677365-7-ankur.tyagi85@gmail.com>
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130015

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-59893

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../python3-sqlparse/CVE-2026-59893.patch     | 293 ++++++++++++++++++
 .../python/python3-sqlparse_0.5.5.bb          |   1 +
 2 files changed, 294 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-sqlparse/CVE-2026-59893.patch

diff --git a/meta-python/recipes-devtools/python/python3-sqlparse/CVE-2026-59893.patch b/meta-python/recipes-devtools/python/python3-sqlparse/CVE-2026-59893.patch
new file mode 100644
index 0000000000..39dd978266
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-sqlparse/CVE-2026-59893.patch
@@ -0,0 +1,293 @@
+From 3cca1f008a24b9817137d020eeed87efa5ed68d3 Mon Sep 17 00:00:00 2001
+From: Andi Albrecht <albrecht.andi@gmail.com>
+Date: Wed, 1 Jul 2026 08:38:53 +0200
+Subject: [PATCH] Fix uncontrolled CPU consumption (ReDoS) in the lexer's
+ handling of dollar-quoted literals and multiline comments.
+
+(cherry picked from commit d1d80602741f77ec78e5a04ce4719244cf32352e)
+
+CVE: CVE-2026-59893
+Upstream-Status: Backport [https://github.com/andialbrecht/sqlparse/commit/d1d80602741f77ec78e5a04ce4719244cf32352e]
+
+Dropped changes to the CHANGELOG file.
+
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ benchmarks/bench_dollar_quote_redos.py | 90 ++++++++++++++++++++++++++
+ sqlparse/keywords.py                   | 60 ++++++++++++++++-
+ sqlparse/lexer.py                      |  8 +++
+ sqlparse/utils.py                      | 46 ++++++++++++-
+ 4 files changed, 200 insertions(+), 4 deletions(-)
+ create mode 100644 benchmarks/bench_dollar_quote_redos.py
+
+diff --git a/benchmarks/bench_dollar_quote_redos.py b/benchmarks/bench_dollar_quote_redos.py
+new file mode 100644
+index 0000000..234d9c4
+--- /dev/null
++++ b/benchmarks/bench_dollar_quote_redos.py
+@@ -0,0 +1,90 @@
++"""Delimited-literal lexer benchmark (GHSA-prg7-hcfm-mfcr).
++
++Measures parse time for SQL text containing many unique, unmatched
++opening delimiters for the two lexer constructs that used a lazy dot-all
++regex (`[\\s\\S]*?`) terminated by a backreference or a literal closing
++sequence:
++
++- Dollar-quoted literals, e.g. `$a0$x $a1$x ... $aN$x` (backreference).
++- Multiline comments, e.g. `/* unique0 ... /* unique1 ...` (literal `*/`).
++
++When no closing delimiter is present, a lazy dot-all quantifier applied at
++every text position must scan to the end of the remaining input for every
++opener, which is O(n^2) total work as the number of openers grows.
++
++This benchmark does not assert a pass/fail threshold, since absolute timings
++and scaling ratios depend on the host machine. It exists to make the
++runtime characteristics of these code paths observable and to let it be
++re-run (e.g. after a fix) to confirm that scaling has improved.
++
++Run with:  python benchmarks/bench_dollar_quote_redos.py
++"""
++
++import signal
++import time
++
++import sqlparse
++from sqlparse.engine import grouping
++
++# Disable the grouping-stage DoS guards. They fire only after lexing
++# completes and do not bound regex CPU time, so they would otherwise mask
++# the lexer's true (unbounded) timing behind a SQLParseError at larger n.
++grouping.MAX_GROUPING_DEPTH = None
++grouping.MAX_GROUPING_TOKENS = None
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
++    return dt
++
++
++def make_dollar_quote_payload(n):
++    # N unique, never-closed dollar-quote openers. Each is unique so the
++    # backreference regex cannot short-circuit on an earlier match.
++    return ' '.join(f'$a{i}$x' for i in range(n))
++
++
++def make_comment_payload(n):
++    # N unique, never-closed multiline comment openers. No '*/' appears
++    # anywhere, so the closing literal can never short-circuit the scan.
++    return ' '.join(f'/* unique{i} comment never closed' for i in range(n))
++
++
++def run_scaling(label, make_payload, sizes=(250, 500, 1000, 2000, 4000, 8000)):
++    print(f'{label}:')
++    timings = {}
++    for n in sizes:
++        sql = make_payload(n)
++        timings[n] = measure(f'{label} n={n}', sql, sqlparse.parse)
++
++    print()
++    print('Scaling ratios (O(n^2) implies ~4x time per 2x input):')
++    for prev, curr in zip(sizes, sizes[1:]):
++        if timings[prev] > 0:
++            ratio = timings[curr] / timings[prev]
++            print(f'  n={prev} -> n={curr} (input x{curr / prev:.1f}): '
++                  f'time ratio = {ratio:.2f}x')
++    print()
++
++
++run_scaling('Unmatched dollar-quote openers', make_dollar_quote_payload)
++run_scaling('Unclosed multiline comments', make_comment_payload)
+diff --git a/sqlparse/keywords.py b/sqlparse/keywords.py
+index 874431f..243f389 100644
+--- a/sqlparse/keywords.py
++++ b/sqlparse/keywords.py
+@@ -5,7 +5,10 @@
+ # This module is part of python-sqlparse and is released under
+ # the BSD License: https://opensource.org/licenses/BSD-3-Clause
+ 
++import re
++
+ from sqlparse import tokens
++from sqlparse.utils import _DelimiterOccurrence, resolve_paired_delimiters
+ 
+ # object() only supports "is" and is useful as a marker
+ # use this marker to specify that the given regex in SQL_REGEX
+@@ -13,12 +16,64 @@ from sqlparse import tokens
+ PROCESS_AS_KEYWORD = object()
+ 
+ 
++# Dollar-quoted literals (`$tag$...$tag$`) and multiline comments
++# (`/*...*/`, `/*+...*/`) used to be matched with per-position regexes
++# using a lazy dot-all quantifier (`[\s\S]*?`) terminated by a
++# backreference or a literal delimiter. Applied at every text position by
++# the lexer loop below, that shape is O(n^2) on adversarial input with
++# many unclosed openers, since each failed attempt re-scans to the end of
++# the remaining text (GHSA-prg7-hcfm-mfcr). They are resolved instead in
++# a single linear pass by find_delimited_spans().
++_DOLLAR_QUOTE_DELIM = re.compile(r'\$(?:[_A-ZÀ-Ü]\w*)?\$', re.IGNORECASE | re.UNICODE)
++_DOLLAR_QUOTE_OPENER_OK = re.compile(r'(?<![\w"$])', re.UNICODE)
++_COMMENT_HINT_OPEN = re.compile(r'/\*\+')
++_COMMENT_OPEN = re.compile(r'/\*(?!\+)')
++_COMMENT_CLOSE = re.compile(r'\*/')
++
++
++def find_delimited_spans(text):
++    """Locate dollar-quoted literals and multiline comments in `text`.
++
++    Returns a dict mapping each span's start offset to
++    (end offset, token type).
++    """
++    has_dollar = '$' in text
++    # A comment can only ever open on "/*"; without it "*/" alone can
++    # never pair with anything, so gating on "/*" alone is sufficient to
++    # skip all three comment-related regex passes below.
++    has_comment_open = '/*' in text
++    if not has_dollar and not has_comment_open:
++        return {}
++
++    occurrences = []
++    if has_dollar:
++        for m in _DOLLAR_QUOTE_DELIM.finditer(text):
++            tag = m.group()
++            can_open = _DOLLAR_QUOTE_OPENER_OK.match(text, m.start()) is not None
++            occurrences.append(
++                _DelimiterOccurrence(m.start(), m.end(), tag, can_open, True, tokens.Literal))
++    if has_comment_open:
++        for m in _COMMENT_HINT_OPEN.finditer(text):
++            occurrences.append(_DelimiterOccurrence(
++                m.start(), m.end(), 'C', True, False,
++                tokens.Comment.Multiline.Hint))
++        for m in _COMMENT_OPEN.finditer(text):
++            occurrences.append(_DelimiterOccurrence(
++                m.start(), m.end(), 'C', True, False,
++                tokens.Comment.Multiline))
++        for m in _COMMENT_CLOSE.finditer(text):
++            occurrences.append(
++                _DelimiterOccurrence(m.start(), m.end(), 'C', False, True, None))
++    occurrences.sort(key=lambda occ: occ.start)
++
++    spans = resolve_paired_delimiters(occurrences)
++    return {start: (end, ttype) for start, end, ttype in spans}
++
++
+ SQL_REGEX = [
+     (r'(--|# )\+.*?(\r\n|\r|\n|$)', tokens.Comment.Single.Hint),
+-    (r'/\*\+[\s\S]*?\*/', tokens.Comment.Multiline.Hint),
+ 
+     (r'(--|# ).*?(\r\n|\r|\n|$)', tokens.Comment.Single),
+-    (r'/\*[\s\S]*?\*/', tokens.Comment.Multiline),
+ 
+     (r'(\r\n|\r|\n)', tokens.Newline),
+     (r'\s+?', tokens.Whitespace),
+@@ -30,7 +85,6 @@ SQL_REGEX = [
+ 
+     (r"`(``|[^`])*`", tokens.Name),
+     (r"´(´´|[^´])*´", tokens.Name),
+-    (r'((?<![\w\"\$])\$(?:[_A-ZÀ-Ü]\w*)?\$)[\s\S]*?\1', tokens.Literal),
+ 
+     (r'\?', tokens.Name.Placeholder),
+     (r'%(\(\w+\))?s', tokens.Name.Placeholder),
+diff --git a/sqlparse/lexer.py b/sqlparse/lexer.py
+index 8f88d17..71fd261 100644
+--- a/sqlparse/lexer.py
++++ b/sqlparse/lexer.py
+@@ -134,8 +134,16 @@ class Lexer:
+             raise TypeError("Expected text or file-like object, got {!r}".
+                             format(type(text)))
+ 
++        delimited_spans = keywords.find_delimited_spans(text)
++
+         iterable = enumerate(text)
+         for pos, char in iterable:
++            if pos in delimited_spans:
++                end, ttype = delimited_spans[pos]
++                yield ttype, text[pos:end]
++                consume(iterable, end - pos - 1)
++                continue
++
+             for rexmatch, action in self._SQL_REGEX:
+                 m = rexmatch(text, pos)
+ 
+diff --git a/sqlparse/utils.py b/sqlparse/utils.py
+index 58c0245..ed83734 100644
+--- a/sqlparse/utils.py
++++ b/sqlparse/utils.py
+@@ -7,7 +7,7 @@
+ 
+ import itertools
+ import re
+-from collections import deque
++from collections import defaultdict, deque, namedtuple
+ from contextlib import contextmanager
+ 
+ # This regular expression replaces the home-cooked parser that was here before.
+@@ -110,6 +110,50 @@ def consume(iterator, n):
+     deque(itertools.islice(iterator, n), maxlen=0)
+ 
+ 
++_DelimiterOccurrence = namedtuple(
++    '_DelimiterOccurrence', 'start end tag can_open can_close payload')
++
++
++def resolve_paired_delimiters(occurrences):
++    """Pair delimiter occurrences (quote/comment open & close markers) in
++    one left-to-right pass, instead of re-scanning the remaining text for
++    every unmatched opener -- which is what a backreference- or literal-
++    terminated lazy-dot-all regex applied at every text position ends up
++    doing, and is O(n^2) on adversarial input (GHSA-prg7-hcfm-mfcr).
++
++    `occurrences` must be sorted by `start`. Each occurrence with
++    `can_open` is paired with the nearest later occurrence sharing its
++    `tag` that has `can_close`; anything in between (including other
++    openers) is left as literal content. Unpaired openers are dropped,
++    exactly as a regex that never finds its closing delimiter fails to
++    match at all.
++
++    Returns a list of (start, end, payload) for each resolved span.
++    """
++    occurrences = list(occurrences)
++    closers = defaultdict(deque)
++    for idx, occ in enumerate(occurrences):
++        if occ.can_close:
++            closers[occ.tag].append(idx)
++
++    spans = []
++    consumed_until = 0
++    for i, occ in enumerate(occurrences):
++        if occ.can_close:
++            queue = closers[occ.tag]
++            if queue and queue[0] == i:
++                queue.popleft()
++        if occ.start < consumed_until or not occ.can_open:
++            continue
++        queue = closers[occ.tag]
++        if queue:
++            close_idx = queue.popleft()
++            close_end = occurrences[close_idx].end
++            spans.append((occ.start, close_end, occ.payload))
++            consumed_until = close_end
++    return spans
++
++
+ @contextmanager
+ def offset(filter_, n=0):
+     filter_.offset += n
diff --git a/meta-python/recipes-devtools/python/python3-sqlparse_0.5.5.bb b/meta-python/recipes-devtools/python/python3-sqlparse_0.5.5.bb
index 021ccfa349..a1dc52db49 100644
--- a/meta-python/recipes-devtools/python/python3-sqlparse_0.5.5.bb
+++ b/meta-python/recipes-devtools/python/python3-sqlparse_0.5.5.bb
@@ -8,6 +8,7 @@ SRC_URI[sha256sum] = "e20d4a9b0b8585fdf63b10d30066c7c94c5d7a7ec47c889a2d83a3caa9
 
 SRC_URI += "file://CVE-2026-54284-1.patch \
             file://CVE-2026-54284-2.patch \
+            file://CVE-2026-59893.patch \
 "
 
 CVE_PRODUCT = "sqlparse"

