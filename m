Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A2A1CA9EDC
	for <webhook@archiver.kernel.org>; Mon, 12 Oct 2026 21:11:17 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5111.1791839476777346842
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 12 Oct 2026 14:11:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=cF7pQpe+;
 spf=pass (domain: gmail.com, ip: 209.85.216.45, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3ab450c0873so1835202a91.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 12 Oct 2026 14:11:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791839476; x=1792444276; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Qm9oNQgB0SDyAkc7HUVwto23Q5hQajfQWVxN5SEl6r8=;
        b=cF7pQpe+LFEUawfTqIkUvKIwXIXpjg7faU6TidJ+8aIyDcJO3E8JLNaL1Z1cp3BFed
         JdsEUGL5I/cJC2Np2KZVVfKkBMZKSkF7Rd8uuFdkXmu5t2tkRAd6/ipuyuQJ4mO2BLAe
         HCeqt8eNtbByAuRa7lupO57v140NNRcFOjSQAMWHqc/Tf3I+gIkIqiPC9Gq11RRwpzgV
         uRhdtDLGcyz9PwIIh81Ck4cTIeIovektD5Fe1Ye4NyFjDxuyJBNFap3gC2SVTR+RJDJD
         Zql+Xq4azjdl8EnrPdX2QVAFQZAxPf6QLRbtKtZLv0z6vWBKNsHs2D7PVqXuj7oyGgNX
         9xjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791839476; x=1792444276;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Qm9oNQgB0SDyAkc7HUVwto23Q5hQajfQWVxN5SEl6r8=;
        b=wTNp1sJh/MTOqTUGA25Uk3VY7HfF1ad8Nesnwzx79fqTAwNYIRVjhQrucXjOturT2D
         MxZE14cy8Fzj+J7Ln+Nzd5FjN6JjmI7z3rT+URHkauiZUjIuNjfEFFPUPi1U/z2ybZD/
         oQV0SgKkk/sQwUoTVRZULliJ4iKoDIFYQJlwqFeq9DbcPVL3qmEkfPhKnnO4MilhFqp7
         WwDZ6QkWlkRUX9Io5Rg4/4ns6P0m5pHza8Av04eBjO2l3PZC+oP2YohmlCTNDQM1phRw
         vYEsP8la4qhSFBH/agkkS4t3VdAf4lh8SLHmD7QE2Hd+8n7yXXPjgkQEHajFe6fj52Ue
         +6iQ==
X-Gm-Message-State: AFq9FYIkTUpJlR/Y+u3oGcY03mkPInCMWOemuyX67F3cqmHte9Jshy0a
	26F1eYFz6IixH9aa0Y1yEalmffkOv1YY0/HoG+aJ4Vt7d9rjbnba/yTSAIr1DWj+
X-Gm-Gg: AYBFou3P4CI3bHLsSV9s9V69ImRwte4zJuT2Gq40AF3OWbMfdrIQ3RZtwvqZr5y4Lqg
	mrwIeHS/vcNIUUF7CqH0Cp+SI96qBAsa1ZENTStMLUF3JbG0KHlye87HHdnNDA62WP25zQMejEC
	kIEOcBaeHoC64VRGls7gnWK1ENxr0y37hY03/5uhcWAs9WUWt/9DMrObCPUjbOGACXSZ5kUyig7
	7ioD/UFN0IbOo5cZHVhjvhTQXjEhq7KyoQi/bXLNdwUTgTT6Ix2hRvdNvNDDjzOV8rmP92Z+/6v
	qH7gKmcTC1Qs+ImT4rVPm0cyJKZA9e/UxCH8vzfFZ9W9DqqcmnuPvCWfa/mjFVxQ61yjLdsgEly
	wsRBrckpWtPUtN1ldN3Hfu3czV8GD66avvak1wUZyZ/zVC04qiLBa2Q6FGIXqsVaS1x4mQWo4QR
	9knIR0BbBkM/6lqvTOvEICGDOix2BexH1Yg9+vb2q9rVXptwjLKXHrZ/YDi4qJDjrVbTdE8/85H
	FXSFcF0G/lSGUwGvcIBWLm7YutmwYsI3aNne+k=
X-Received: by 2002:a17:90b:4d88:b0:3a4:a850:6982 with SMTP id 98e67ed59e1d1-3ab3a7786e4mr9277852a91.26.1791839476133;
        Mon, 12 Oct 2026 14:11:16 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.brunswick.com ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab32c0f59bsm10962728a91.0.2026.10.12.14.11.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 14:11:15 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>,
	Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Subject: [oe][meta-oe][blacksail][PATCH 23/43] libnfs: patch CVE-2026-53689
Date: Tue, 13 Oct 2026 10:09:47 +1300
Message-ID: <20261012211009.3352822-23-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261012211009.3352822-1-ankur.tyagi85@gmail.com>
References: <20261012211009.3352822-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 12 Oct 2026 21:11:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130793

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-53689

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
(cherry picked from commit 6ace2f0b5e54469c5e9fd8b99412e8f412128458)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../libnfs/libnfs/CVE-2026-53689.patch        | 34 +++++++++++++++++++
 .../libnfs/libnfs_6.0.2.bb                    |  1 +
 2 files changed, 35 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/libnfs/libnfs/CVE-2026-53689.patch

diff --git a/meta-oe/recipes-connectivity/libnfs/libnfs/CVE-2026-53689.patch b/meta-oe/recipes-connectivity/libnfs/libnfs/CVE-2026-53689.patch
new file mode 100644
index 00000000000..0c624c72199
--- /dev/null
+++ b/meta-oe/recipes-connectivity/libnfs/libnfs/CVE-2026-53689.patch
@@ -0,0 +1,34 @@
+From d45a7d6cdc899ac2a62abc21280d674ae91ae0ae Mon Sep 17 00:00:00 2001
+From: Ronnie Sahlberg <ronniesahlberg@gmail.com>
+Date: Wed, 10 Jun 2026 11:43:28 +1000
+Subject: [PATCH] ZDR: check the string size for sanity
+
+It could otherwise cause an overflow in the bounds check later.
+
+Reported-by: Nick Hummel <nickhummel@google.com>
+Signed-off-by: Ronnie Sahlberg <ronniesahlberg@gmail.com>
+(cherry picked from commit 55c18ea33a83d667f79f0ef209c96895795c729f)
+
+CVE: CVE-2026-53689
+Upstream-Status: Backport [https://github.com/sahlberg/libnfs/commit/55c18ea33a83d667f79f0ef209c96895795c729f]
+
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ lib/libnfs-zdr.c | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/lib/libnfs-zdr.c b/lib/libnfs-zdr.c
+index bc507eb..cbdb650 100644
+--- a/lib/libnfs-zdr.c
++++ b/lib/libnfs-zdr.c
+@@ -305,7 +305,9 @@ bool_t libnfs_zdr_string(ZDR *zdrs, char **strp, uint32_t maxsize)
+ 	if (!libnfs_zdr_u_int(zdrs, &size)) {
+ 		return FALSE;
+ 	}
+-
++	if (size > zdrs->size) {
++		return FALSE;
++	}
+ 	if (zdrs->pos + (int)size > zdrs->size) {
+ 		return FALSE;
+ 	}
diff --git a/meta-oe/recipes-connectivity/libnfs/libnfs_6.0.2.bb b/meta-oe/recipes-connectivity/libnfs/libnfs_6.0.2.bb
index 49617eaa294..8068d35e1ca 100644
--- a/meta-oe/recipes-connectivity/libnfs/libnfs_6.0.2.bb
+++ b/meta-oe/recipes-connectivity/libnfs/libnfs_6.0.2.bb
@@ -5,6 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=825301ba17efc9d188ee0abd4b924ada"
 
 SRC_URI = "git://github.com/sahlberg/libnfs.git;protocol=https;branch=master \
            file://0001-CMakeLists.txt-respect-CMAKE_INSTALL_LIBDIR-for-mult.patch \
+           file://CVE-2026-53689.patch \
            "
 SRCREV = "18c5c73ee88bb7dc8da0d55dc95164bb77e49dc6"
 

