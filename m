Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A1CDC88E41
	for <webhook@archiver.kernel.org>; Thu, 10 Sep 2026 23:10:47 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.27854.1789081845318945091
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Sep 2026 16:10:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=GbcthewB;
 spf=pass (domain: gmail.com, ip: 209.85.216.49, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3969e82ff8fso359331a91.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 10 Sep 2026 16:10:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789081845; x=1789686645; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jGQBDLMKQSSAWZFPZuN5XivWaTxllzuRWNuh+ZBdkQs=;
        b=GbcthewB/mg3pMTSTmT9AIU/539U2Cwol/I4gF3o0/isXrHOlrH3t+gvqR/REn0sn8
         aHPRkjR3exZPMF2lx78FbPvMmlfyVBJOqRMrsbfNx1ueGyuqV0gPISyAs0hhKHpuXgsn
         86Du/2EhB57XFh7aVVUxJDJiZwXKRYcMcKH9o/3pNSxVZX8nFNlEZpLIOzz9boYErF70
         6ACkloxWIXGjvXF9SoAHpDt0gW1J5Wv5o72xsZMuthrc7zf6ZUtq8V+HvksKCerkCoU8
         SIOgo2GyMd3NcUNz/6VnpCjQufiE04NQWnGkFxYWJDyvXoq1f2K/xBQREd4OUyDKtLig
         7zIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789081845; x=1789686645;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jGQBDLMKQSSAWZFPZuN5XivWaTxllzuRWNuh+ZBdkQs=;
        b=tJQBkOmtutr2a+zxFLjT+YC9/n85mqDxQVcvQZsSvL3W45TIAbAp9wJg3lSBLE65Hw
         4lInWIPxzHaNLFCwtj3xCmeW1bWPl+i3O7CzjOE0lv2KnxKEYlS9iUrhzxUNF6cXQ9Ul
         9E9v/aajg0SHbUAfL2DsjYhtWZb6kyT3jXm3J1mfeWZVVVLpX3zPLJtTopaFqmRPVqQv
         TGeTOO1DEAO74pinKXfBJJbn+CVfsvE4zEn4PBpdzd8jfahmYVBvuaTjA+AXSNT0TpTi
         n8GCp0T+QPtPt27x3bnjxdAKbEpnJNfSFzpJC5ao6Kzl71VtHY7xyFWmqbfs2yLa+7P5
         8SUg==
X-Gm-Message-State: AFuF++kMV4+m81kSmdqetrnmvlgXGv2Eu5fPQNFkdytUw5Z0ZlCDD/NX
	oDNhiRUrSzNpUq/15rv51avfetguXtA5nIiMJZZ+WKmwitzPGBQods8h768Q5Q==
X-Gm-Gg: AYBFou1PKEzLv0s3SuJ4PltyU7DwzJbzuLZVs1vY88Bvj2Dd1sOe+eVCPgck8NBr4dH
	bQgRC/b85xBDQ8bqOiTKkUSBpI4VbCsvfv0EyWACEKmwsWEhCyMLbzGIlPjriFeMFVZaYHgMejF
	cV9q2LbqrHELaVqqbbR71fePWgaTVMKKl0wCkDvSX31N833UtfAgTOkFKqLrRS5xMr5DN5uIBOU
	vEUnDibrEDQ6zxDUCw5Hv9IGwvT0aGsbqX/ZA08Yod+ng8WimvTtoCxJKAvKzUpLVFfrM4bTf1Z
	ULhzV+8PmYeQl5f9GW1gnvtnj0rgOJv07pToxUyfAnRFYNRFuI/fQC9/K71Hd1uODIeYB4nQdyP
	v3tUqfDBXTgoJO1u5mD3zKyjINM+sR7fnjntIXewIQWpUsYfb3O541z/LTD80fYzis+yqKsDVgN
	pjJAqbRVUNUv+tZ6Q5Ug0gl0e3ZcOlC9S9wou+4x/hpaZh6WBkBHPFoRXstOND8VW0T0qQnj+Vl
	5BxSOppRSROhfMelnUK5ME=
X-Received: by 2002:a17:90b:2d03:b0:38e:67e1:15b with SMTP id 98e67ed59e1d1-39d9bc3f8c8mr1591252a91.6.1789081844629;
        Thu, 10 Sep 2026 16:10:44 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d98e602d8sm1265496a91.3.2026.09.10.16.10.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 16:10:44 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][wrynose][PATCH 22/32] unbound: patch CVE-2026-50251
Date: Fri, 11 Sep 2026 11:09:21 +1200
Message-ID: <20260910230932.173913-22-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260910230932.173913-1-ankur.tyagi85@gmail.com>
References: <20260910230932.173913-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 10 Sep 2026 23:10:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129940

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-50251

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../unbound/unbound/CVE-2026-50251.patch      | 72 +++++++++++++++++++
 .../recipes-support/unbound/unbound_1.24.2.bb |  1 +
 2 files changed, 73 insertions(+)
 create mode 100644 meta-networking/recipes-support/unbound/unbound/CVE-2026-50251.patch

diff --git a/meta-networking/recipes-support/unbound/unbound/CVE-2026-50251.patch b/meta-networking/recipes-support/unbound/unbound/CVE-2026-50251.patch
new file mode 100644
index 0000000000..5800ea8572
--- /dev/null
+++ b/meta-networking/recipes-support/unbound/unbound/CVE-2026-50251.patch
@@ -0,0 +1,72 @@
+From 2a514d577f035b1473d34201290be4394c732ff7 Mon Sep 17 00:00:00 2001
+From: "W.C.A. Wijngaards" <wouter@nlnetlabs.nl>
+Date: Wed, 22 Jul 2026 10:15:02 +0200
+Subject: [PATCH] - Fix CVE-2026-50251, Attacker supplied `0.0.0.0`/`::` glue
+ triggers   defensive full-cache flush. Thanks to Qifan Zhang, Palo Alto  
+ Networks, for the report.
+
+(cherry picked from commit e180b06298d8d39a764d3c5d4d4aca472c3a97d7)
+
+CVE: CVE-2026-50251
+Upstream-Status: Backport [https://github.com/NLnetLabs/unbound/commit/e180b06298d8d39a764d3c5d4d4aca472c3a97d7]
+
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ doc/unbound.conf.rst             |  7 +++++++
+ iterator/iter_donotq.c           | 12 ++++++++++++
+ testdata/dns_error_reporting.rpl |  1 +
+ 3 files changed, 20 insertions(+)
+
+diff --git a/doc/unbound.conf.rst b/doc/unbound.conf.rst
+index d83816c6f..ca96a4411 100644
+--- a/doc/unbound.conf.rst
++++ b/doc/unbound.conf.rst
+@@ -1954,6 +1954,13 @@ These options are part of the **server:** clause.
+     flushing away any poison.
+     A value of 10 million is suggested.
+ 
++    It is useful to add 0.0.0.0/8 and '::' to the
++    :ref:`do-not-query-address<unbound.conf.do-not-query-address>` list.
++    Otherwise they may be answered, from localhost, and the different source
++    makes an unwanted reply that unnecessarily ticks up.
++    The :ref:`do-not-query-localhost<unbound.conf.do-not-query-localhost>`
++    option includes them, the zero subnets, when it is enabled.
++
+     Default: 0 (disabled)
+ 
+ 
+diff --git a/iterator/iter_donotq.c b/iterator/iter_donotq.c
+index 40ffb45c4..7eecf1354 100644
+--- a/iterator/iter_donotq.c
++++ b/iterator/iter_donotq.c
+@@ -132,6 +132,18 @@ donotq_apply_cfg(struct iter_donotq* dq, struct config_file* cfg)
+ 		if(cfg->do_ip6) {
+ 			if(!donotq_str_cfg(dq, "::1"))
+ 				return 0;
++			if(!donotq_str_cfg(dq, "::ffff:127.0.0.0/104"))
++				return 0;
++		}
++		/* RFC 1122 3.2.1.3 / RFC 6890 / RFC 4291 2.5.2: not valid as
++		 * destination; on Linux these route to the local host. */
++		if(!donotq_str_cfg(dq, "0.0.0.0/8"))
++			return 0;
++		if(cfg->do_ip6) {
++			if(!donotq_str_cfg(dq, "::"))
++				return 0;
++			if(!donotq_str_cfg(dq, "::ffff:0:0/96"))
++				return 0;
+ 		}
+ 	}
+ 	addr_tree_init_parents(&dq->tree);
+diff --git a/testdata/dns_error_reporting.rpl b/testdata/dns_error_reporting.rpl
+index f1fac12a2..22175cade 100644
+--- a/testdata/dns_error_reporting.rpl
++++ b/testdata/dns_error_reporting.rpl
+@@ -12,6 +12,7 @@ server:
+ 	ede: no  # It is not needed for dns-error-reporting; only for clients to receive EDEs
+ 	dns-error-reporting: yes
+ 	do-ip6: no
++	do-not-query-localhost: no
+ 
+ stub-zone:
+ 	name: domain
diff --git a/meta-networking/recipes-support/unbound/unbound_1.24.2.bb b/meta-networking/recipes-support/unbound/unbound_1.24.2.bb
index b6b6ecef33..0a511f767e 100644
--- a/meta-networking/recipes-support/unbound/unbound_1.24.2.bb
+++ b/meta-networking/recipes-support/unbound/unbound_1.24.2.bb
@@ -32,6 +32,7 @@ SRC_URI = "git://github.com/NLnetLabs/unbound.git;protocol=https;branch=master;t
            file://CVE-2026-50046.patch \
            file://CVE-2026-50243.patch \
            file://CVE-2026-50248.patch \
+           file://CVE-2026-50251.patch \
            "
 
 SRCREV = "f6269baa605d31859f28770e01a24e3677e5f82c"

