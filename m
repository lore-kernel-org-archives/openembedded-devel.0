Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA8E4CAC5B5
	for <webhook@archiver.kernel.org>; Wed, 24 Sep 2025 19:21:00 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.web11.23000.1758741652611042823
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Sep 2025 12:20:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bDuTmTd+;
 spf=pass (domain: gmail.com, ip: 209.85.208.46, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-62fce8b75a3so248841a12.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 24 Sep 2025 12:20:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758741651; x=1759346451; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=T9VM06+wuwX/HoXBMjFfjdXf8pBuqgWXYeFIhRuY7zI=;
        b=bDuTmTd+qHJKOYfnSxBoev8tn2POvpVq94olEJmT8sbhkcI4VwvoHbxAi3hnG19Ndm
         kMy7Ne1TXmnt/uQUFC4ex6r1OpL9LlwDPuHR9MHUyaMBp46JqkNtLM46CklYBWaL0vll
         7uf5MZkXQ6e8eCAKjJ95v/q/2wmy8diw7kQ8RTMJC6PIH6cE0/nAzBRF+Vc7+GmP08Yq
         MSmF+4SyZ/H+OppdA1ueskGtIszeZl0qdGoq3jYY1TkCz477ex8jN3zEr14hHAsd2K+t
         kS0G+BR2gJHuId3PUkhbgMMRCEN0o8kA5PuoMwaTJ9NM2ruYLOh1u43VbOpjRs0JhA6I
         EREw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758741651; x=1759346451;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=T9VM06+wuwX/HoXBMjFfjdXf8pBuqgWXYeFIhRuY7zI=;
        b=A30kK+stSK/+BWwmAWBuTzJxhpESZeIQEw63bPeLlz42LDWLcDSiqD+1kiyS/1Jwy3
         kjUNJHVgRzESjAwhnKUwxiOxV37N98myWN5J1THCJAuVtZKD/eQUoFkAJSkYoy/xZadz
         yv5hj0+qAbkvOAlfTyb+O/IAwdPhcBmJQxTXjmQn/Seb15k9skJ3UE98W9OuwPuRGRTz
         QhWjIJ2jNyAZjlEOOQb2Grfl8xCSFqgx8NKkalHFactrg8VNrtCzN54Rn9qp+iC3TWyE
         JiSKu4DtAvHlwVkANFu6EGQRdkoFbe78IbjbUjw0vxW8TG9WHkVV4HK1GGs1tRkXfU5m
         z3QA==
X-Gm-Message-State: AOJu0YyIYsTWRVMibBD/6hr9NSpgnm1q9A6xd66MzWB7goykRRH/xvAP
	SP8aFozdG5Tcu00uSEgIVgjip/bP91dYuhR4PYKStFbzhoEB9DTiHivWajYw/A==
X-Gm-Gg: ASbGncujhtZ5FanJsUYmp4t11aopmGrmH4YsvLTjeCn/dRAtzaixwVwlIouEIEW8V1f
	n1WyXq05ZP41Yxdcj/vAdeoHDkvv/sNdIIIwOtM/4jkLgJAEGB4ihyRd8Yf4TaqJCf1du1Kd9uc
	ou3kN4FV1dZHQBDe0chnaMNcR+mPc+ovf/OlQTr38PPNp1I1+mWc1wcvz5jAPE/dn68A7jBz7+p
	N+VTl5upq1Gn3qJMEnCDT4SDy9mwjMF/nr8FWF+JKy5fYjLOj6YHQCyc5RwzmFW6LlO79/2qveh
	0R2/vPbZlr5NgGvCYbPC/joAxELSb3I6PYx7Mi7ypAvuI0OnoYBJz/xkR8Jm+q7c/FFQVsyvafi
	K+IResJwCV5PYlrq7LPhO
X-Google-Smtp-Source: AGHT+IEABToSPYKOGT89zpwpUvSwxjlQvzt4+0Nuwa0h+AJm7qsrlhkHz+ln6mMlqQEaKWUxaJCyQw==
X-Received: by 2002:a05:6402:13c9:b0:633:2df2:11b2 with SMTP id 4fb4d7f45d1cf-6349fa81ff2mr450811a12.25.1758741650670;
        Wed, 24 Sep 2025 12:20:50 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6344e493329sm5629586a12.14.2025.09.24.12.20.49
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 12:20:50 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH] ipset: upgrade 7.22 -> 7.24
Date: Wed, 24 Sep 2025 21:20:49 +0200
Message-ID: <20250924192049.22948-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 Sep 2025 19:21:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119836

Changelog:

7.24
Userspace changes
    Improve fixing commas in sorted json output
    Fix extra quotes around elements in json output (bugzilla #1793, issue 3.)
    Fix commas in sorted json output (bugzilla #1793, issue 4)
    Fix unquoted port range in json output (bugzilla #1793, issue 1)
    Fix extraneous comma in terse list json output (Joachim, bugzilla #1793, issue 2)
    bash-completion: restore fix for syntax error (Jeremy Sowden)
    Correct typo in man-page (Jeremy Sowden)
Kernel part changes
    netfilter: ipset: fix region locking in hash types
    Handle "netfilter: ipset: Fix for recursive locking warning" patch for backward compatibility
    netfilter: ipset: Fix for recursive locking warning

7.23
Userspace changes
    tests: runtest.sh: Keep running, print summary of failed tests (Phil Sutter)
    tests: cidr.sh: Fix for quirks in RHEL's ipcalc (Phil Sutter)
    tests: cidr.sh: Respect IPSET_BIN env var (Phil Sutter)
    ipset: Fix implicit declaration of function basename (Mike Pagano)
    tests: Reduce testsuite run-time (Phil Sutter)
    lib: ipset: Avoid 'argv' array overstepping (Phil Sutter)
    lib: data: Fix for global-buffer-overflow warning by ASAN (Phil Sutter)
Kernel part changes
    netfilter: ipset: Hold module reference while requesting a module (Phil Sutter)
    netfilter: ipset: add missing range check in bitmap_ip_uadt (Jeongjun Park)
    netfilter: ipset: Fix suspicious rcu_dereference_protected()
    Replace BUG_ON() with WARN_ON_ONCE() according to usage policy.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../0001-ipset-Define-portable-basename-function.patch      | 6 +++---
 .../recipes-filter/ipset/{ipset_7.22.bb => ipset_7.24.bb}   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)
 rename meta-networking/recipes-filter/ipset/{ipset_7.22.bb => ipset_7.24.bb} (80%)

diff --git a/meta-networking/recipes-filter/ipset/ipset/0001-ipset-Define-portable-basename-function.patch b/meta-networking/recipes-filter/ipset/ipset/0001-ipset-Define-portable-basename-function.patch
index a06bcac362..bbe0687b26 100644
--- a/meta-networking/recipes-filter/ipset/ipset/0001-ipset-Define-portable-basename-function.patch
+++ b/meta-networking/recipes-filter/ipset/ipset/0001-ipset-Define-portable-basename-function.patch
@@ -19,9 +19,9 @@ diff --git a/src/ipset.c b/src/ipset.c
 index 162f477..7b5d580 100644
 --- a/src/ipset.c
 +++ b/src/ipset.c
-@@ -16,6 +16,16 @@
- #include <libipset/ipset.h>		/* ipset library */
+@@ -17,6 +17,16 @@
  #include <libipset/xlate.h>		/* translate to nftables */
+ #include <libgen.h>
  
 +/* basename is implemented differently across different C libraries. This
 + * implementation matches the one provided by the GNU libc, and does not
@@ -36,7 +36,7 @@ index 162f477..7b5d580 100644
  int
  main(int argc, char *argv[])
  {
-@@ -32,7 +42,7 @@ main(int argc, char *argv[])
+@@ -33,7 +43,7 @@ main(int argc, char *argv[])
  		exit(1);
  	}
  
diff --git a/meta-networking/recipes-filter/ipset/ipset_7.22.bb b/meta-networking/recipes-filter/ipset/ipset_7.24.bb
similarity index 80%
rename from meta-networking/recipes-filter/ipset/ipset_7.22.bb
rename to meta-networking/recipes-filter/ipset/ipset_7.24.bb
index 5eaf142411..15fffe6b9e 100644
--- a/meta-networking/recipes-filter/ipset/ipset_7.22.bb
+++ b/meta-networking/recipes-filter/ipset/ipset_7.24.bb
@@ -9,9 +9,9 @@ SECTION = "base"
 
 DEPENDS = "libtool libmnl"
 
-SRC_URI = "http://ftp.netfilter.org/pub/ipset/${BP}.tar.bz2 \
+SRC_URI = "https://ipset.netfilter.org/${BP}.tar.bz2 \
            file://0001-ipset-Define-portable-basename-function.patch"
-SRC_URI[sha256sum] = "f6ac5a47c3ef9f4c67fcbdf55e791cbfe38eb0a4aa1baacd12646a140abacdd9"
+SRC_URI[sha256sum] = "fbe3424dff222c1cb5e5c34d38b64524b2217ce80226c14fdcbb13b29ea36112"
 
 inherit autotools pkgconfig module-base
 

