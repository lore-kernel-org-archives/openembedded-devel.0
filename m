Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.35457.1792987100785498437
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 25 Oct 2026 20:58:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=QOAXjMew;
 spf=pass (domain: gmail.com, ip: 74.125.82.175, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-369f33df08eso2012759eec.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 25 Oct 2026 20:58:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792987100; x=1793591900; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+rg0JwW5iNKNUAOzIFy1tsfp4cIcMifeMO+SEE84d9Y=;
        b=QOAXjMewlJLWrs7vIYTXvxRCSU4f4xuv+ku2ZPShsvL0lsHViH5/Tmq/qckOyYZTqQ
         xKtmZ99uprapSfDMDq/8WTUfZi7vhIozHYTFVQjMKwEE0BWKBmLyNm3VU/iScw6Eu9/Y
         t6PhohdqoHtq0sJAbckhTQ/fptxZ6+o1KFQiGZf6avDodUYE+0oZKff6KNpL2RF8asK+
         YcrTmnPb3fVFoJ7G3ZtnUkZDxZuOUb4fOS/+z4kNglS447a7piUmUO1ZKKwJ2IVPTMmw
         AiDELgPy1qhcHbrGEaIwWXk2ON205FVJB3Am5M3y0KHwl5dWP1O7CjcDdxo0wpA9/ALx
         Z3Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792987100; x=1793591900;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+rg0JwW5iNKNUAOzIFy1tsfp4cIcMifeMO+SEE84d9Y=;
        b=I/gDX8Et13COkHNrdJkhOt3lsWAJKimi4jT4JaN5LnrCHq/S2+vCkc0yurliJoXZO6
         BNx5QvCnNcJV2gPY3Iiz1wz4DeRNAo5tggCre0yADg2yNdjhcksj+/N+Q0zGEi1S0ypV
         5T9fu8CnRHhapX1x+haM5YGEKWGsbdir1NDAMQ5l6dFB05zV8zr2VVtlGdKUfrVnewX4
         0B/FOvDT0G0bSPb0P2HqZT9ZbfyaXcpxopg33Fv06IVwXnfXoMPYbnMwqco8JsKfp5QD
         Xd/JycU+Z5Gyw/2ukmPZy7IO97n0rhHWHiRb7hbGhcooZD4uEylEB0XO38Q+umoiEmB5
         zweg==
X-Gm-Message-State: AFq9FYKJTConegfDuDmLYCSViA/DK6ifcMbfID+DecFdzhaTnV6sl9QQ
	QDzD4GhUcremoZYPwK4dJ5/WX+53AEDJwXjjX1DIxi1/FZg2jnqyaVgwp9iK8Lj1fE8=
X-Gm-Gg: AYBFou2D20MxjgaYhij80YMJql4AMJr1mo+r9cN0mOS7u4NhSUrXVzlOjmLemq+BlOW
	V2z5OyY/RHK+1DBX30dtL7ILjLv9Y2GlOkNwJ54uwVfPYeQD+D35iHbA4V0AaSN4XnafejExwa5
	rc75KO2wOXUO4kn96SP1oL48I/NyLcAMh5x7fj0BIPrbUEjdEYzjH8yowAEryzl8KF4/DupY4YV
	B57zy0B5GhfGdtX2TnGxijeYQXUd/nUisIiu39nNFDnT/bt4Gzf+GLMEvVGuTqoVksylfXSVhAM
	VDc7atZov3oUcNr+tOFZDok5n8zfXndY9dQNWn/5+DW3SpsualWIcjjVl43BPqLi4Y7fTMjxnOT
	VaiVKaWusQ4QF0BjmLkX2oylWkqpCV/cylCrqStz7EmjHdtKPWyd/4t7ulU2onCJ9mBfAF4CfqK
	1zeS1dEJkpmQeJkeNDJYAyDTaTUGFNHhv4vhQUQkzfpfypCXCrV9EOHLKK5Nc9gutfOzlng5mEs
	X39YxHIuh1gSwlAKyYWvgDiTkoAjXht20YPXAsEYNln5AvriFcCNR7rtkldxBAq1jIRvM2hOfcy
	k+T+xQcv02sPl0ssCRplBHCdVsd7En/AhEa/o5EbRacW0ry/R3cWJ9xbTJlqe+uu4mvWXZ0tfg1
	YQ7R9ODztybf3Me5q7M9E1CDAsk4vfWDFczyhIOvOMOmLLkKfmCVp/ghp1zwX+AtNx2Unb+hdFN
	zJyl8ymCinxNIX/h6b6DzDXkSntN0CHLVKK6V1HJervwrabHBjQBwZQgBev2QuTvgdixcG2muIk
	8EAovHMjcLpDEdKs5J74ELXEHG+YMLg
X-Received: by 2002:a05:7300:d085:b0:369:f9da:a70f with SMTP id 5a478bee46e88-369f9daa873mr4561198eec.17.1792987099942;
        Sun, 25 Oct 2026 20:58:19 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369f44bd644sm13277417eec.15.2026.10.25.20.58.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 20:58:19 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-networking][PATCH 2/8] python3-scapy: Skip live whois tests in ptest
Date: Sun, 25 Oct 2026 20:58:08 -0700
Message-ID: <20261026035814.55254-2-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261026035814.55254-1-khem.raj@oss.qualcomm.com>
References: <20261026035814.55254-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 26 Oct 2026 03:58:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131414
Content-Type: text/plain; charset="utf-8"

"Whois request" and "AS resolver - IPv6" only query public whois
servers and upstream notes they often fail. "AS resolver - IPv6" failed
intermittently in testimage on qemuarm64 and passed on a rerun. Tag both
with skipped_ptest so run-ptest leaves them out.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...-test-skip-live-whois-tests-in-ptest.patch | 43 +++++++++++++++++++
 .../python/python3-scapy_2.7.0.bb             |  1 +
 2 files changed, 44 insertions(+)
 create mode 100644 meta-networking/recipes-devtools/python/python3-scapy/0005-test-skip-live-whois-tests-in-ptest.patch

diff --git a/meta-networking/recipes-devtools/python/python3-scapy/0005-test-skip-live-whois-tests-in-ptest.patch b/meta-networking/recipes-devtools/python/python3-scapy/0005-test-skip-live-whois-tests-in-ptest.patch
new file mode 100644
index 0000000000..479500abe9
--- /dev/null
+++ b/meta-networking/recipes-devtools/python/python3-scapy/0005-test-skip-live-whois-tests-in-ptest.patch
@@ -0,0 +1,43 @@
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 25 Oct 2026 15:56:41 -0700
+Subject: [PATCH] test: skip live whois tests in ptest
+
+"Whois request" and "AS resolver - IPv6" only query public whois
+servers, and upstream already notes that they often fail. In OE
+testimage runs "AS resolver - IPv6" fails intermittently and turns the
+whole ptest result into a failure, while it passes on a rerun.
+
+Tag them with "skipped_ptest" so run-ptest filters them out with
+-K skipped_ptest. "AS resolvers" is kept since it also carries the
+offline riswhois and cymru parser checks.
+
+Upstream-Status: Inappropriate [OE-specific]
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ test/regression.uts | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/test/regression.uts b/test/regression.uts
+index b6bb9d6..c818e4c 100644
+--- a/test/regression.uts
++++ b/test/regression.uts
+@@ -1781,7 +1781,7 @@ def _test():
+ retry_test(_test)
+
+ = Whois request
+-~ netaccess IP as_resolvers
++~ netaccess IP as_resolvers skipped_ptest
+ * This test retries on failure because it often fails
+ def _test():
+     IP(src="8.8.8.8").whois()
+@@ -1825,7 +1825,7 @@ assert len(tmp) == 3
+ assert [l[1] for l in tmp] == ['AS24776', 'AS36459', 'AS26496']
+
+ = AS resolver - IPv6
+-~ netaccess IP as_resolvers
++~ netaccess IP as_resolvers skipped_ptest
+ * This test retries on failure because it often fails
+
+ def _test():
diff --git a/meta-networking/recipes-devtools/python/python3-scapy_2.7.0.bb b/meta-networking/recipes-devtools/python/python3-scapy_2.7.0.bb
index aa570308a9..4995f8e2cd 100644
--- a/meta-networking/recipes-devtools/python/python3-scapy_2.7.0.bb
+++ b/meta-networking/recipes-devtools/python/python3-scapy_2.7.0.bb
@@ -22,6 +22,7 @@ SRC_URI = "git://github.com/secdev/scapy.git;branch=master;protocol=https;tag=v$
            file://0002-main-initialize-banner-for-the-default-Python-shell.patch \
            file://0003-libpcap-load-libpcap-even-when-find_library-cannot-l.patch \
            file://0004-test-don-t-depend-on-libc-formatting-of-IPv4-compati.patch \
+           file://0005-test-skip-live-whois-tests-in-ptest.patch \
            file://run-ptest"

 UPSTREAM_CHECK_COMMITS = "1"
