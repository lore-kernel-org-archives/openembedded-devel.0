Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEFDCEF4ED0
	for <webhook@archiver.kernel.org>; Mon,  6 Apr 2026 11:55:35 +0000 (UTC)
Received: from alln-iport-3.cisco.com (alln-iport-3.cisco.com [173.37.142.90])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.53314.1775476529734718028
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Apr 2026 04:55:29 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=BCGFaO1Z;
 spf=pass (domain: cisco.com, ip: 173.37.142.90, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=13940; q=dns/txt;
  s=iport01; t=1775476529; x=1776686129;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=85v8U8uGGQkYlbmzYgUM5tTBZpcMT388Gy7WpFFc+T8=;
  b=BCGFaO1Zq3MJw+pfQvoCHlR2fyL+EhyuXXrEms6Ochr9lO7JSEpIi+Ht
   LjK/cfM8LqATY1WjshI39AltElR+aoIi1Wka6trh6ixeD3yV5YpMHH3FM
   3IGWYCNQqNWNuGedGEaR7/3L03CZW6OArBOTYgyXM5tOPLxyapziUHUbr
   Mik7oYNrQo7bhy+P5U/8imAiL7qVN3999OGWSUzDeDNmpQps4VJAaiONg
   Ens71YtpolNFOKJ957JDfCxcp7qVEu0Ac+4ImnQYoN6yM4Dg//Wj1gQ11
   ROcJMX7Fex98tBKTvhKrlcIioxAMuNzr41um+lsX5vCZ2cCZhsizM7VvT
   w==;
X-CSE-ConnectionGUID: t7z0HGGcSNyepK3MHti5Tw==
X-CSE-MsgGUID: azITTG7pQAiduLYb/Uxv5A==
X-IPAS-Result: =?us-ascii?q?A0ChAwCwnNNp/5L/Ja1RCYI0EBqCU3FfQkkDhFSPU4Ihg?=
 =?us-ascii?q?RaaKIReDwEBAQ9EDQQBAZIzAiY3Bg4BAgQBAQEBAwIDAQEBAQEBAQEBAQEBC?=
 =?us-ascii?q?gEBBQEBAQIBBwWBDhOGTw2GWgEpDwEYAUYTAwECAwImAi0jGAmDAgGCcwIBE?=
 =?us-ascii?q?ZhZm0R6gTKBAYMoATEFCQJDT7UIAQsUAYEKLoI3gweDGQGFAlsYAUSENicbG?=
 =?us-ascii?q?4FygRWCcnaBBYFcAgIYgRoEhAOCaQSCIoEOgWGCBwaCTYIAgUqGFUiBAhwDW?=
 =?us-ascii?q?SwBVRMNCgsHBYFmAzUSKhVuMh2BIz4XNFgbBwWBS4ZKdG2BE4N3ZgMLGA1IE?=
 =?us-ascii?q?Sw3FBsEPQFuB4shJ4FzPAcBLBA3GgErIFsKWQ4fCRgRkwAdBwEJCpIrgTWdF?=
 =?us-ascii?q?YJECiiDdIwelToaM6prmQaOCZVoaIRogX4mgVlwFYMiCUkZD44tCwuDXoUTw?=
 =?us-ascii?q?S0jNQIJAzABBwIHAQEKAQOBc5ABgXwBAQ?=
IronPort-Data: A9a23:DXwM/aMAxh7d73bvrR3ilsFynXyQoLVcMsEvi/4bfWQNrUom3mYOy
 jFODz2AOveMYDGnKt8ibYrgphgEsZPXxoRjHXM5pCpnJ55oRWUpJjg4wmPYZX76whjrFRo/h
 ykmQoCeap1yFjmA9knF3oHJ9RFUzbuPSqf3FNnKMyVwQR4MYCo6gHqPocZh6mJTqYb/WVjlV
 e/a+ZWFZgf5g2Asawr41orawP9RlKWq0N8nlgRWicBj5Df2i3QTBZQDEqC9R1OQrl58R7PSq
 07rldlVz0uBl/sfIorNfoXTLiXmdoXv0T2m0RK6bUQNbi9q/UTe2o5jXBYVhNw+Zz+hx7idw
 /0V3XC8pJtA0qDkwIwgvxdk/y5WIfJUoJ/oDnOEl92e126dVlvwwqhSExRjVWEY0r4f7WBm7
 /cULnUJKxuEne/zmOP9Qeh3jcNlJ87uVG8dkig/lneCUrB8HM2FGvmUjTNb9G9YasRmEfvTf
 cMFaT1HZxXbaBoJMVASYH47tLjy2CejI20J9Tp5o4I+8Unv8CMuyIHEMdbIXu2AAvhFgBux8
 zeuE2PRR0ty2Mak4T2d/3Shg+XCkS/2VMceGaO18tZugUaP3SoUEBAQWF6xrPW1h0L4XMhQQ
 3H44QI0pqQ0sUjuRd7nUljg8TiPvwUXXJxbFOhSBByx95c4Kj2xXgAsJgOtovR/3CPqbVTGD
 mO0ou4=
IronPort-HdrOrdr: A9a23:5C5y7a8ecTisnau2BCZuk+DuI+orL9Y04lQ7vn2ZLiYlF/Bw9v
 re/sjzuiWbtN98YhwdcLO7Scq9qA3nlKKdiLN5VdzJYOCMggSVxe9ZgbcKuweBJwTOsshAyK
 xnb69yTPf0DVR8kILGxTPQKadF/DFCm5rY49s3CBxWPGZXV50=
X-Talos-CUID: =?us-ascii?q?9a23=3APFtCRWuFxA3EysuSrnPSx2dp6Is5LW+F7Fj/KHS?=
 =?us-ascii?q?eGGtxa+awaUORpZ97xp8=3D?=
X-Talos-MUID: 9a23:ael0nwmZ3JOX7OrV1Ao2dnprJuZU34vxEHkkkJkbn/iOchFgJWq02WE=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.23,163,1770595200"; 
   d="scan'208";a="726648895"
Received: from rcdn-l-core-09.cisco.com ([173.37.255.146])
  by alln-iport-3.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 06 Apr 2026 11:55:28 +0000
Received: from sjc-ads-3552.cisco.com (sjc-ads-3552.cisco.com [171.68.249.250])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-09.cisco.com (Postfix) with ESMTPS id 7683618000481
	for <openembedded-devel@lists.openembedded.org>; Mon,  6 Apr 2026 11:55:28 +0000 (GMT)
Received: by sjc-ads-3552.cisco.com (Postfix, from userid 1795984)
	id 24D05CC12B5; Mon,  6 Apr 2026 04:55:28 -0700 (PDT)
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)" <deeratho@cisco.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-oe][whinlatter][PATCH 2/3] libssh: Fix CVE-2026-0967
Date: Mon,  6 Apr 2026 04:55:22 -0700
Message-Id: <20260406115522.1242484-1-deeratho@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-3552.cisco.com [171.68.249.250];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 171.68.249.250, sjc-ads-3552.cisco.com
X-Outbound-Node: rcdn-l-core-09.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 06 Apr 2026 11:55:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126036

From: Deepak Rathore <deeratho@cisco.com>

Pick the patch [1] as mentioned in [2]

[1] https://git.libssh.org/projects/libssh.git/commit/?id=6d74aa6138895b3662bade9bd578338b0c4f8a15
[2] https://security-tracker.debian.org/tracker/CVE-2026-0967

Signed-off-by: Deepak Rathore <deeratho@cisco.com>
---
 .../libssh/libssh/CVE-2026-0967.patch         | 362 ++++++++++++++++++
 .../recipes-support/libssh/libssh_0.11.3.bb   |   1 +
 2 files changed, 363 insertions(+)
 create mode 100644 meta-oe/recipes-support/libssh/libssh/CVE-2026-0967.patch

diff --git a/meta-oe/recipes-support/libssh/libssh/CVE-2026-0967.patch b/meta-oe/recipes-support/libssh/libssh/CVE-2026-0967.patch
new file mode 100644
index 0000000000..0b32dfb97f
--- /dev/null
+++ b/meta-oe/recipes-support/libssh/libssh/CVE-2026-0967.patch
@@ -0,0 +1,362 @@
+From a2de885e93b39d5d834f2e6d93bdc62dd9c0322d Mon Sep 17 00:00:00 2001
+From: Jakub Jelen <jjelen@redhat.com>
+Date: Wed, 17 Dec 2025 18:48:34 +0100
+Subject: [PATCH 3/4] CVE-2026-0967 match: Avoid recursive matching (ReDoS)
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
+CVE: CVE-2026-0967
+Upstream-Status: Backport [https://git.libssh.org/projects/libssh.git/commit/?id=6d74aa6138895b3662bade9bd578338b0c4f8a15]
+
+Signed-off-by: Jakub Jelen <jjelen@redhat.com>
+Reviewed-by: Pavol Žáčik <pzacik@redhat.com>
+(cherry picked from commit a411de5ce806e3ea24d088774b2f7584d6590b5f)
+(cherry picked from commit 6d74aa6138895b3662bade9bd578338b0c4f8a15)
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+---
+ src/match.c                      | 111 +++++++++++++----------------
+ tests/unittests/torture_config.c | 116 +++++++++++++++++++++++--------
+ 2 files changed, 135 insertions(+), 92 deletions(-)
+
+diff --git a/src/match.c b/src/match.c
+index 2c004c98..771ee63c 100644
+--- a/src/match.c
++++ b/src/match.c
+@@ -53,85 +53,70 @@
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
+@@ -182,7 +167,7 @@ int match_pattern_list(const char *string, const char *pattern,
+     sub[subi] = '\0';
+ 
+     /* Try to match the subpattern against the string. */
+-    if (match_pattern(string, sub, MAX_MATCH_RECURSION)) {
++    if (match_pattern(string, sub)) {
+       if (negated) {
+         return -1;        /* Negative */
+       } else {
+diff --git a/tests/unittests/torture_config.c b/tests/unittests/torture_config.c
+index ada0ce8c..fcfe8fbc 100644
+--- a/tests/unittests/torture_config.c
++++ b/tests/unittests/torture_config.c
+@@ -2342,80 +2342,138 @@ static void torture_config_match_pattern(void **state)
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
+-- 
+2.51.0
+
diff --git a/meta-oe/recipes-support/libssh/libssh_0.11.3.bb b/meta-oe/recipes-support/libssh/libssh_0.11.3.bb
index 1d4fd637d9..193ff3512d 100644
--- a/meta-oe/recipes-support/libssh/libssh_0.11.3.bb
+++ b/meta-oe/recipes-support/libssh/libssh_0.11.3.bb
@@ -13,6 +13,7 @@ SRC_URI = "git://git.libssh.org/projects/libssh.git;protocol=https;branch=stable
            file://CVE-2026-3731_p2.patch \
            file://CVE-2026-0968_p1.patch \
            file://CVE-2026-0968_p2.patch \
+           file://CVE-2026-0967.patch \
           "
 
 SRC_URI:append:toolchain-clang = " file://0001-CompilerChecks.cmake-drop-Wunused-variable-flag.patch"
-- 
2.35.6


