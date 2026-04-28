Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91917FF886F
	for <webhook@archiver.kernel.org>; Tue, 28 Apr 2026 05:01:34 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5618.1777352489031877551
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Apr 2026 22:01:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=ByIh+mo5;
 spf=pass (domain: gmail.com, ip: 209.85.216.45, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-362bb3260f1so5232130a91.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 27 Apr 2026 22:01:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777352488; x=1777957288; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0FSdqdHyGR/XEzwmqk5eaeslqyWSMaPKdWu09Z+79ao=;
        b=ByIh+mo5Tonin2R9WGDEvfvXjQL5VJk7k6lOicUwW0+mMaNySRHEdwuHtDYz2Z/LE2
         xcCploDjh0HN+5oDPb295zoJzBapJxBOCtD1XGiqy5M+Z1ASEDnUG5lBPoPqUj4WgZ9k
         u9EvKOiO0G0Bp+gwEMnCgDchA17LksYn0UfRKq4w2gwdpTWSwaa95oZGmly/RTnO0++3
         96CYLiO587h9dDTxcKFaigwJcnHu92Ln4y5ii5nbhYV26D5LQhSJlyjUyHs7Yyd5yPaA
         t9Vrd4zWxFfiREtxT9pfKy3NoODhLjVIyupl0VySr1+emQDDtx+a//4kPkUUWz+UdHm9
         TJZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777352488; x=1777957288;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0FSdqdHyGR/XEzwmqk5eaeslqyWSMaPKdWu09Z+79ao=;
        b=p9112nGskKfyET58TzrgozLP3boH8vuXxdL8J7O9dlxPQR9QGBp3dJCxal3yG9eJwj
         POet2GZcrwWCujNtPrNvbMJ00xiXOHlGqAkTuuyWwuvDlnBa9zjQlYZFAqTp6Pl5/NIE
         AB1MbJqJHPv+5WDHwuiaLai2AV+pB7dthXaX6TuL12XVlEn86jmZWZF4qSUjaaJI4Myw
         LV4EdoylkbmMMPQS2aZUCtsmieeHq/jqNhOyiXHHUVFhXcxNApV+9y7OSh4sADXGXh9s
         gPFvWcMNqBDFajh1a9UjqDGAXcuNvewfd11ZN5afeLRgTy+4MgXv7WzR0HtnabCHXiOF
         8CwQ==
X-Gm-Message-State: AOJu0YxIIXfhCZrN6utiRvaLpgxly4cYS/NQxNofH2IPvre00QwhFSto
	ECt8yTEN/WYPT7five1iKCAMMvoiQGD9rYgfcZwgBSMBkXqHNQTKBVBJQYcHQPag
X-Gm-Gg: AeBDietTFUudyNSGo051aWkDNMm/NL7PMiUR1driODTfNLGLQTsMgu0iArdl/qvRoZm
	P/en7fyI071U/085oldyof1sLXhq8E7u9GqwyunebU0IhrNgTW8rGpft36Wp+bvw6HJSa935Wxn
	irvOE+vNkoE5tScLkG4HFNkroCExF3Phb3jHO0rBzgWYvLGS/uVXLLJhaxaAKVjsT2Nt2pr7R5V
	80BWj1bYbDGp20v6a+e6ginCqYnzpiw86WpptEP9KO/u0Einq1FHgaN2i9BExXJgpF/LL/4V754
	v/XH/yxIFE89sdC42/qTwlP5qKhGOQa8dUqLAMCfMXi3TmOSSg2wRbqSAB04EyoghsNMQUcz+HW
	e9BrfKddyoidtKdzhUrkD7kIcbtWtNswM7U07eSL/rNmpvBj56/rZ7QNE+d6nGn0/gJGsOsCJfj
	8tr7/jM3lAWZNDcLIW7io+el6i56DKwzUB38CGzWnBKY1LWtgueFRpapYvHA==
X-Received: by 2002:a17:90b:48:b0:35b:9ab6:1d4a with SMTP id 98e67ed59e1d1-36492030caemr1653275a91.18.1777352488040;
        Mon, 27 Apr 2026 22:01:28 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.108.128])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b97ac8d619sm11798385ad.70.2026.04.27.22.01.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 22:01:27 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][scarthgap][PATCH 4/5] libssh: patch CVE-2026-0967
Date: Tue, 28 Apr 2026 17:01:07 +1200
Message-ID: <20260428050109.2099228-4-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260428050109.2099228-1-ankur.tyagi85@gmail.com>
References: <20260428050109.2099228-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 Apr 2026 05:01:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126644

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Backport patch [1] as mentioned in [2]

[1] https://git.libssh.org/projects/libssh.git/commit/?id=6d74aa6138895b3662bade9bd578338b0c4f8a15
[2] https://security-tracker.debian.org/tracker/CVE-2026-0967

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../libssh/libssh/CVE-2026-0967.patch         | 360 ++++++++++++++++++
 .../recipes-support/libssh/libssh_0.10.6.bb   |   1 +
 2 files changed, 361 insertions(+)
 create mode 100644 meta-oe/recipes-support/libssh/libssh/CVE-2026-0967.patch

diff --git a/meta-oe/recipes-support/libssh/libssh/CVE-2026-0967.patch b/meta-oe/recipes-support/libssh/libssh/CVE-2026-0967.patch
new file mode 100644
index 0000000000..c34bced2a8
--- /dev/null
+++ b/meta-oe/recipes-support/libssh/libssh/CVE-2026-0967.patch
@@ -0,0 +1,360 @@
+From bd18dd3a2e1fc1f76a65fbdcc4d88b8d77ff7cab Mon Sep 17 00:00:00 2001
+From: Jakub Jelen <jjelen@redhat.com>
+Date: Wed, 17 Dec 2025 18:48:34 +0100
+Subject: [PATCH] CVE-2026-0967 match: Avoid recursive matching (ReDoS)
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+The specially crafted patterns (from configuration files) could cause
+exhaustive search or timeouts.
+
+Previous attempts to fix this by limiting recursion to depth 16 avoided
+stack overflow, but not timeouts. This is due to the backtracking,
+which caused the exponential time complexity O(N^16) of existing algorithm.
+
+This is code comes from the same function from OpenSSH, where this code
+originates from, which is not having this issue (due to not limiting the number
+of recursion), but will also easily exhaust stack due to unbound recursion:
+
+https://github.com/openssh/openssh-portable/commit/05bcd0cadf160fd4826a2284afa7cba6ec432633
+
+This is an attempt to simplify the algorithm by preventing the backtracking
+to previous wildcard, which should keep the same behavior for existing inputs
+while reducing the complexity to linear O(N*M).
+
+This fixes the long-term issue we had with fuzzing as well as recently reported
+security issue by Kang Yang.
+
+Signed-off-by: Jakub Jelen <jjelen@redhat.com>
+Reviewed-by: Pavol Žáčik <pzacik@redhat.com>
+(cherry picked from commit a411de5ce806e3ea24d088774b2f7584d6590b5f)
+(cherry picked from commit 6d74aa6138895b3662bade9bd578338b0c4f8a15)
+
+CVE: CVE-2026-0967
+Upstream-Status: Backport [https://git.libssh.org/projects/libssh.git/commit/?id=6d74aa6138895b3662bade9bd578338b0c4f8a15]
+
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ src/match.c                      | 111 +++++++++++++----------------
+ tests/unittests/torture_config.c | 116 +++++++++++++++++++++++--------
+ 2 files changed, 135 insertions(+), 92 deletions(-)
+
+diff --git a/src/match.c b/src/match.c
+index 3e58f733..896d87cb 100644
+--- a/src/match.c
++++ b/src/match.c
+@@ -43,85 +43,70 @@
+ 
+ #include "libssh/priv.h"
+ 
+-#define MAX_MATCH_RECURSION 16
+-
+-/*
+- * Returns true if the given string matches the pattern (which may contain ?
+- * and * as wildcards), and zero if it does not match.
++/**
++ * @brief Compare a string with a pattern containing wildcards `*` and `?`
++ *
++ * This function is an iterative replacement for the previously recursive
++ * implementation to avoid exponential complexity (DoS) with specific patterns.
++ *
++ * @param[in]  s        The string to match.
++ * @param[in]  pattern  The pattern to match against.
++ *
++ * @return              1 if the pattern matches, 0 otherwise.
+  */
+-static int match_pattern(const char *s, const char *pattern, size_t limit)
++static int match_pattern(const char *s, const char *pattern)
+ {
+-    bool had_asterisk = false;
++    const char *s_star = NULL; /* Position in s when last `*` was met */
++    const char *p_star = NULL; /* Position in pattern after last `*` */
+ 
+-    if (s == NULL || pattern == NULL || limit <= 0) {
++    if (s == NULL || pattern == NULL) {
+         return 0;
+     }
+ 
+-    for (;;) {
+-        /* If at end of pattern, accept if also at end of string. */
+-        if (*pattern == '\0') {
+-            return (*s == '\0');
+-        }
+-
+-        /* Skip all the asterisks and adjacent question marks */
+-        while (*pattern == '*' || (had_asterisk && *pattern == '?')) {
+-            if (*pattern == '*') {
+-                had_asterisk = true;
+-            }
++    while (*s) {
++        /* Case 1: Exact match or '?' wildcard */
++        if (*pattern == *s || *pattern == '?') {
++            s++;
+             pattern++;
++            continue;
+         }
+ 
+-        if (had_asterisk) {
+-            /* If at end of pattern, accept immediately. */
+-            if (!*pattern)
+-                return 1;
+-
+-            /* If next character in pattern is known, optimize. */
+-            if (*pattern != '?') {
+-                /*
+-                 * Look instances of the next character in
+-                 * pattern, and try to match starting from
+-                 * those.
+-                 */
+-                for (; *s; s++)
+-                    if (*s == *pattern && match_pattern(s + 1, pattern + 1, limit - 1)) {
+-                        return 1;
+-                    }
+-                /* Failed. */
+-                return 0;
+-            }
+-            /*
+-             * Move ahead one character at a time and try to
+-             * match at each position.
++        /* Case 2: '*' wildcard */
++        if (*pattern == '*') {
++            /* Record the position of the star and the current string position.
++             * We optimistically assume * matches 0 characters first.
+              */
+-            for (; *s; s++) {
+-                if (match_pattern(s, pattern, limit - 1)) {
+-                    return 1;
+-                }
+-            }
+-            /* Failed. */
+-            return 0;
+-        }
+-        /*
+-         * There must be at least one more character in the string.
+-         * If we are at the end, fail.
+-         */
+-        if (!*s) {
+-            return 0;
++            p_star = ++pattern;
++            s_star = s;
++            continue;
+         }
+ 
+-        /* Check if the next character of the string is acceptable. */
+-        if (*pattern != '?' && *pattern != *s) {
+-            return 0;
++        /* Case 3: Mismatch */
++        if (p_star) {
++            /* If we have seen a star previously, backtrack.
++             * We restore the pattern to just after the star,
++             * but advance the string position (consume one more char for the
++             * star).
++             * No need to backtrack to previous stars as any match of the last
++             * star could be eaten the same way by the previous star.
++             */
++            pattern = p_star;
++            s = ++s_star;
++            continue;
+         }
+ 
+-        /* Move to the next character, both in string and in pattern. */
+-        s++;
++        /* Case 4: Mismatch and no star to backtrack to */
++        return 0;
++    }
++
++    /* Handle trailing stars in the pattern
++     * (e.g., pattern "abc*" matching "abc") */
++    while (*pattern == '*') {
+         pattern++;
+     }
+ 
+-    /* NOTREACHED */
+-    return 0;
++    /* If we reached the end of the pattern, it's a match */
++    return (*pattern == '\0');
+ }
+ 
+ /*
+@@ -172,7 +157,7 @@ int match_pattern_list(const char *string, const char *pattern,
+     sub[subi] = '\0';
+ 
+     /* Try to match the subpattern against the string. */
+-    if (match_pattern(string, sub, MAX_MATCH_RECURSION)) {
++    if (match_pattern(string, sub)) {
+       if (negated) {
+         return -1;        /* Negative */
+       } else {
+diff --git a/tests/unittests/torture_config.c b/tests/unittests/torture_config.c
+index b7c763af..3569b51a 100644
+--- a/tests/unittests/torture_config.c
++++ b/tests/unittests/torture_config.c
+@@ -1656,80 +1656,138 @@ static void torture_config_match_pattern(void **state)
+     (void) state;
+ 
+     /* Simple test "a" matches "a" */
+-    rv = match_pattern("a", "a", MAX_MATCH_RECURSION);
++    rv = match_pattern("a", "a");
+     assert_int_equal(rv, 1);
+ 
+     /* Simple test "a" does not match "b" */
+-    rv = match_pattern("a", "b", MAX_MATCH_RECURSION);
++    rv = match_pattern("a", "b");
+     assert_int_equal(rv, 0);
+ 
+     /* NULL arguments are correctly handled */
+-    rv = match_pattern("a", NULL, MAX_MATCH_RECURSION);
++    rv = match_pattern("a", NULL);
+     assert_int_equal(rv, 0);
+-    rv = match_pattern(NULL, "a", MAX_MATCH_RECURSION);
++    rv = match_pattern(NULL, "a");
+     assert_int_equal(rv, 0);
+ 
+     /* Simple wildcard ? is handled in pattern */
+-    rv = match_pattern("a", "?", MAX_MATCH_RECURSION);
++    rv = match_pattern("a", "?");
+     assert_int_equal(rv, 1);
+-    rv = match_pattern("aa", "?", MAX_MATCH_RECURSION);
++    rv = match_pattern("aa", "?");
+     assert_int_equal(rv, 0);
+     /* Wildcard in search string */
+-    rv = match_pattern("?", "a", MAX_MATCH_RECURSION);
++    rv = match_pattern("?", "a");
+     assert_int_equal(rv, 0);
+-    rv = match_pattern("?", "?", MAX_MATCH_RECURSION);
++    rv = match_pattern("?", "?");
+     assert_int_equal(rv, 1);
+ 
+     /* Simple wildcard * is handled in pattern */
+-    rv = match_pattern("a", "*", MAX_MATCH_RECURSION);
++    rv = match_pattern("a", "*");
+     assert_int_equal(rv, 1);
+-    rv = match_pattern("aa", "*", MAX_MATCH_RECURSION);
++    rv = match_pattern("aa", "*");
+     assert_int_equal(rv, 1);
+     /* Wildcard in search string */
+-    rv = match_pattern("*", "a", MAX_MATCH_RECURSION);
++    rv = match_pattern("*", "a");
+     assert_int_equal(rv, 0);
+-    rv = match_pattern("*", "*", MAX_MATCH_RECURSION);
++    rv = match_pattern("*", "*");
+     assert_int_equal(rv, 1);
+ 
+     /* More complicated patterns */
+-    rv = match_pattern("a", "*a", MAX_MATCH_RECURSION);
++    rv = match_pattern("a", "*a");
+     assert_int_equal(rv, 1);
+-    rv = match_pattern("a", "a*", MAX_MATCH_RECURSION);
++    rv = match_pattern("a", "a*");
+     assert_int_equal(rv, 1);
+-    rv = match_pattern("abababc", "*abc", MAX_MATCH_RECURSION);
++    rv = match_pattern("abababc", "*abc");
+     assert_int_equal(rv, 1);
+-    rv = match_pattern("ababababca", "*abc", MAX_MATCH_RECURSION);
++    rv = match_pattern("ababababca", "*abc");
+     assert_int_equal(rv, 0);
+-    rv = match_pattern("ababababca", "*abc*", MAX_MATCH_RECURSION);
++    rv = match_pattern("ababababca", "*abc*");
+     assert_int_equal(rv, 1);
+ 
+     /* Multiple wildcards in row */
+-    rv = match_pattern("aa", "??", MAX_MATCH_RECURSION);
++    rv = match_pattern("aa", "??");
+     assert_int_equal(rv, 1);
+-    rv = match_pattern("bba", "??a", MAX_MATCH_RECURSION);
++    rv = match_pattern("bba", "??a");
+     assert_int_equal(rv, 1);
+-    rv = match_pattern("aaa", "**a", MAX_MATCH_RECURSION);
++    rv = match_pattern("aaa", "**a");
+     assert_int_equal(rv, 1);
+-    rv = match_pattern("bbb", "**a", MAX_MATCH_RECURSION);
++    rv = match_pattern("bbb", "**a");
+     assert_int_equal(rv, 0);
+ 
+     /* Consecutive asterisks do not make sense and do not need to recurse */
+-    rv = match_pattern("hostname", "**********pattern", 5);
++    rv = match_pattern("hostname", "**********pattern");
+     assert_int_equal(rv, 0);
+-    rv = match_pattern("hostname", "pattern**********", 5);
++    rv = match_pattern("hostname", "pattern**********");
+     assert_int_equal(rv, 0);
+-    rv = match_pattern("pattern", "***********pattern", 5);
++    rv = match_pattern("pattern", "***********pattern");
+     assert_int_equal(rv, 1);
+-    rv = match_pattern("pattern", "pattern***********", 5);
++    rv = match_pattern("pattern", "pattern***********");
+     assert_int_equal(rv, 1);
+ 
+-    /* Limit the maximum recursion */
+-    rv = match_pattern("hostname", "*p*a*t*t*e*r*n*", 5);
++    rv = match_pattern("hostname", "*p*a*t*t*e*r*n*");
+     assert_int_equal(rv, 0);
+-    /* Too much recursion */
+-    rv = match_pattern("pattern", "*p*a*t*t*e*r*n*", 5);
++    rv = match_pattern("pattern", "*p*a*t*t*e*r*n*");
++    assert_int_equal(rv, 1);
++
++    /* Regular Expression Denial of Service */
++    rv = match_pattern("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
++                       "*a*a*a*a*a*a*a*a*a*a*a*a*a*a*a*a");
++    assert_int_equal(rv, 1);
++    rv = match_pattern("ababababababababababababababababababababab",
++                       "*a*b*a*b*a*b*a*b*a*b*a*b*a*b*a*b");
++    assert_int_equal(rv, 1);
++
++    /* A lot of backtracking */
++    rv = match_pattern("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaax",
++                       "a*a*a*a*a*a*a*a*a*a*a*a*a*a*a*a*a*a*ax");
++    assert_int_equal(rv, 1);
++
++    /* Test backtracking: *a matches first 'a', fails on 'b', must backtrack */
++    rv = match_pattern("axaxaxb", "*a*b");
++    assert_int_equal(rv, 1);
++
++    /* Test greedy consumption with suffix */
++    rv = match_pattern("foo_bar_baz_bar", "*bar");
++    assert_int_equal(rv, 1);
++
++    /* Test exact suffix requirement (ensure no partial match acceptance) */
++    rv = match_pattern("foobar_extra", "*bar");
++    assert_int_equal(rv, 0);
++
++    /* Test multiple distinct wildcards */
++    rv = match_pattern("a_very_long_string_with_a_pattern", "*long*pattern");
++    assert_int_equal(rv, 1);
++
++    /* ? inside a * sequence */
++    rv = match_pattern("abcdefg", "a*c?e*g");
++    assert_int_equal(rv, 1);
++
++    /* Consecutive mixed wildcards */
++    rv = match_pattern("abc", "*?c");
++    assert_int_equal(rv, 1);
++
++    /* ? at the very end after * */
++    rv = match_pattern("abc", "ab?");
++    assert_int_equal(rv, 1);
++    rv = match_pattern("abc", "ab*?");
++    assert_int_equal(rv, 1);
++
++    /* Consecutive stars should be collapsed or handled gracefully */
++    rv = match_pattern("abc", "a**c");
++    assert_int_equal(rv, 1);
++    rv = match_pattern("abc", "***");
++    assert_int_equal(rv, 1);
++
++    /* Empty string handling */
++    rv = match_pattern("", "*");
++    assert_int_equal(rv, 1);
++    rv = match_pattern("", "?");
+     assert_int_equal(rv, 0);
++    rv = match_pattern("", "");
++    assert_int_equal(rv, 1);
+ 
++    /* Pattern longer than string */
++    rv = match_pattern("short", "short_but_longer");
++    assert_int_equal(rv, 0);
+ }
+ 
+ /* Identity file can be specified multiple times in the configuration
diff --git a/meta-oe/recipes-support/libssh/libssh_0.10.6.bb b/meta-oe/recipes-support/libssh/libssh_0.10.6.bb
index e0ade7f67c..e4a28af7a6 100644
--- a/meta-oe/recipes-support/libssh/libssh_0.10.6.bb
+++ b/meta-oe/recipes-support/libssh/libssh_0.10.6.bb
@@ -30,6 +30,7 @@ SRC_URI = "git://git.libssh.org/projects/libssh.git;protocol=https;branch=stable
            file://CVE-2026-0966-3.patch \
            file://CVE-2026-0968-1.patch \
            file://CVE-2026-0968-2.patch \
+           file://CVE-2026-0967.patch \
           "
 SRCREV = "10e09e273f69e149389b3e0e5d44b8c221c2e7f6"
 

