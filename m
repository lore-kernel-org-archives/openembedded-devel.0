Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18213C79F99
	for <webhook@archiver.kernel.org>; Mon,  7 Sep 2026 10:23:59 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.31914.1788776638556036055
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Sep 2026 03:23:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=I714wWuB;
 spf=pass (domain: gmail.com, ip: 209.85.216.50, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3964dfb5b9aso4258003a91.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 07 Sep 2026 03:23:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788776638; x=1789381438; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lAdyoMu/H3OjnKdKk4f27G21sov60c3DzNMh4HvghZ4=;
        b=I714wWuB+m57exQPaICGXSi33hE5pBymQjVOYuEXp9WOjjW5M2M34rqCzeXK11bi3t
         rvHNDbxdJQ/k0QefI5TZQXr0hf7xjDf6ieJHmpsZuOfWWjC+zAe6WHE2xuKhC2xZt1Uc
         +PoemAcnEiTeSvDVq8SMIMZ3s+QPjRDUS1D/1EmHEDiW3L+LgdqvxA+0talBaukDKNft
         0V13viGZ2asjJijPrNE77KSIaENYilfU1nC2xfhQeXKITdGN+vXoOFLmgzz/iKCOq+wq
         X89TOQPo3q9VGN2bxjWPsXUAwXddad/fOytIc3wzEDgOCp7AB+5CTlfsKVyve9gffIYz
         YuBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788776638; x=1789381438;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lAdyoMu/H3OjnKdKk4f27G21sov60c3DzNMh4HvghZ4=;
        b=LcQRbuUeSqVDDY16G9C0fXUWbmB5bG9mRVnOV9uNIT6Z473bVXsdUvSJhEP3jGFo2l
         JC8dTcSFPa5Xe/yKBNX2k+vsFjH/LqUb3eF7jzZ/3qc0Y7xr1AsPAch9WqkMh/Lb+LHm
         s9EuN95Vz8z6cgoCbiqDYzKmbzm3Syh1dzQ0KL6augVsCVjzhr+zG522IzK93WwVpBts
         67KXqoUat/wuGaphNbUOGAjqaV1XrNnWhGnl5d5qD+qCb4swVePM+/8O4c60fr9PpSKu
         QivzWbg2EwCz21QLedl6rSmICzf04Hi7HRD+VY4gDZe59BZAF3KkkO847iZS/vQ6+WrD
         t2xA==
X-Gm-Message-State: AFuF++kv/v7W4RONrS1mJBOvN4sQQ9DJkAcoylsimxiiQLAa6sMKtmvL
	41mMfmEuOUIjHeUqQsKXofXr3ZlHFWjQEyMWumalW/3k2uG3QRsQosk/2jv4Sw==
X-Gm-Gg: AYBFou0IGljSF1Ct/SVw8bJk8WyuIx3+FQzR4GnBtFSml796u0Dro0X4AJsHH1O6Kr+
	t/58B6DipkvzyU+XTgw8hhtGMjom7sL/aeSgyu3TEulidWYhrV/r1ob4vBYmfywnsym7Gjk3ic7
	JVxRbrMWDcLiLSiYsEyFH+LkksTRprfAObihrTu+EyJzKMu4a2BWDf22r0ct2fDMPtxcHB4/ZaG
	K9AO6byJ0nopA/hCGq5q9nf1uHtvs4wORc0w9zE+MRkZUz/HeT3ETXinkyy1iicpbr+vllhCHmE
	ltMSxazZIbBESHBt8O2zt2/hDa8wEqoeseP9CYFKOwDKz+6iTZDU48/WAH65vZICZi/O40qvRfX
	IHRT7Uj8AhJsjw18Q4BprZyV1+DFLdPXSchVN5T2K+ME64IjvFW3pYRJSMqOziAlslFjeINGl4s
	h5xPqGJvUd8JTSMvTzO5qwcgR8/dV5wt5ltkQkJ1BXPsYxxUxdZpW//apTqV9N5p7Itb0e4X6l
X-Received: by 2002:a17:90a:51c6:b0:39b:29ca:3d23 with SMTP id 98e67ed59e1d1-39b29ca41d5mr20571438a91.17.1788776637915;
        Mon, 07 Sep 2026 03:23:57 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1432441f5f2sm30215104c88.15.2026.09.07.03.23.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 03:23:57 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][wrynose][PATCH 12/33] tinyproxy: patch CVE-2026-31842
Date: Mon,  7 Sep 2026 22:22:56 +1200
Message-ID: <20260907102318.2459883-12-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260907102318.2459883-1-ankur.tyagi85@gmail.com>
References: <20260907102318.2459883-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Sep 2026 10:23:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129824

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Backport commit identified by Debian[1]

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-31842

[1]https://security-tracker.debian.org/tracker/CVE-2026-31842

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../tinyproxy/tinyproxy/CVE-2026-31842.patch  | 33 +++++++++++++++++++
 .../tinyproxy/tinyproxy_1.11.3.bb             |  1 +
 2 files changed, 34 insertions(+)
 create mode 100644 meta-networking/recipes-support/tinyproxy/tinyproxy/CVE-2026-31842.patch

diff --git a/meta-networking/recipes-support/tinyproxy/tinyproxy/CVE-2026-31842.patch b/meta-networking/recipes-support/tinyproxy/tinyproxy/CVE-2026-31842.patch
new file mode 100644
index 0000000000..6b8c02d629
--- /dev/null
+++ b/meta-networking/recipes-support/tinyproxy/tinyproxy/CVE-2026-31842.patch
@@ -0,0 +1,33 @@
+From ed5252d213a68546feaff68e2b40e401d2c2afd4 Mon Sep 17 00:00:00 2001
+From: rofl0r <rofl0r@users.noreply.github.com>
+Date: Fri, 3 Apr 2026 11:21:23 +0200
+Subject: [PATCH] reqs: fix case-sensitive matching of "chunked" (#605)
+
+the chunked transfer encoding needs to be matched in a case-
+insensitive manner.
+
+closes #604
+
+(cherry picked from commit 879bf844abffa0bf5fae6aff0c73179024dd9f98)
+
+CVE: CVE-2026-31842
+Upstream-Status: Backport [https://github.com/tinyproxy/tinyproxy/commit/879bf844abffa0bf5fae6aff0c73179024dd9f98]
+
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ src/reqs.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/reqs.c b/src/reqs.c
+index 7aacfd3..8b68538 100644
+--- a/src/reqs.c
++++ b/src/reqs.c
+@@ -850,7 +850,7 @@ static int is_chunked_transfer (pseudomap *hashofheaders)
+ {
+         char *data;
+         data = pseudomap_find (hashofheaders, "transfer-encoding");
+-        return data ? !strcmp (data, "chunked") : 0;
++        return data ? !strcasecmp (data, "chunked") : 0;
+ }
+ 
+ /*
diff --git a/meta-networking/recipes-support/tinyproxy/tinyproxy_1.11.3.bb b/meta-networking/recipes-support/tinyproxy/tinyproxy_1.11.3.bb
index 56e3296066..4ce766b40b 100644
--- a/meta-networking/recipes-support/tinyproxy/tinyproxy_1.11.3.bb
+++ b/meta-networking/recipes-support/tinyproxy/tinyproxy_1.11.3.bb
@@ -9,6 +9,7 @@ SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/${PV}/${BP}.tar.gz
            file://run-ptest \
            file://CVE-2026-3945-1.patch \
            file://CVE-2026-3945-2.patch \
+           file://CVE-2026-31842.patch \
            "
 
 SRC_URI[sha256sum] = "9bcf46db1a2375ff3e3d27a41982f1efec4706cce8899ff9f33323a8218f7592"

