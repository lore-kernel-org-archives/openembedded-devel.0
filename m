Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA621CA9ED2
	for <webhook@archiver.kernel.org>; Mon, 12 Oct 2026 21:11:53 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5092.1791839503788184266
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 12 Oct 2026 14:11:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Kk6YG4W/;
 spf=pass (domain: gmail.com, ip: 209.85.216.51, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3ab62a8250aso1197883a91.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 12 Oct 2026 14:11:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791839503; x=1792444303; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Tq4Jyy0Md+hDU71NW0upmsmT1bjck2A5lshkdE8RtuQ=;
        b=Kk6YG4W/xTjqHn9EHSLJl7HBwj+N/XsabLbXnq1b1oR6K5uTVp+HC33chKCknNwbY2
         BRJAjKthXNULCUMJabHC+vyG5GnpJ9bapXPwl0YecS97CurOt1UoylPesTjywlq1N5P/
         XSgLrq54WVBvWEL9702yGtFVS5sAXw4PMknngz6xPleSV6/6Az+ZjjM41uHu18r6jgWz
         BWmUG3u1hWDNO5DdlogGszQwCbNXp3sTldMBgxH00a+pZHsfurj5QNhL2s7wKuqUps33
         VTStc0EIt6gRSesUKe/t1QsngUwACNZgfW3vcyraDLoN3KvHoO4uGQy4dP2tb2ZB1eg6
         fTqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791839503; x=1792444303;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Tq4Jyy0Md+hDU71NW0upmsmT1bjck2A5lshkdE8RtuQ=;
        b=G1tmtcurmokh1zcgceJcvrBcxxwYFS9NHJSxDFut8LFE9dCy+eOl+7ZVwYwaQulp7T
         QGmzKoGH7AQqxi9fpbCj1JW4IGKTgAlOLV4vkRhX+R2ce8pgWkrvgkoAXrkxuV7GZ0sM
         XbfBky6kZDfLJI81+C3+5UKwAbTP5X+/l1MH7EXZU49uB/y1NwoaQgG9ySCSgp48lKdI
         Ax6C8ABVxTbmHMmKzJMHkIo5ggbHq1qJ24HpaXoWQVc5N1lmntZaZAOSaeJ5VpziI1YZ
         n19EpCivLEIpXYRDVjTn/XrNO8x6Mto+58bwB3+uBoK4WUH9tWXU7/0tTXBUHbX+uKkK
         1OdA==
X-Gm-Message-State: AFq9FYJ1q8deH5NLpVi3dH3+BJvt71oarcLhyWTxMBfSt5TnhD+lN0pW
	6qQdJs9qnY5gMjpF2QdvF8iFXfCgx3WaU0VJgVBYM1omoFDxshwRT1XNpERn2w==
X-Gm-Gg: AYBFou1OX949ajliGQBhWlOH8VFDrgLIidHgCJ8XXUV/Oa/dU8whKG5lm0DIHrvqPD1
	Zgvqtk295OIoGe4Lo+0zvrNqE3wi+2VdA7BYGw5LMNjwn6Maxn01O0T9nGopbxnisjC3BYRCDZb
	3Ll7tDx9nKFOdxbeKwBiVtuhKVNk40b9Qcpg0pV76Gt8NWyg2CJQUqcKHmN0yMIB5SFt1Gd7KOi
	MM1+1ZEubbjIUHVT0cV3xINjQn3Wk+/+G5Agfke4cfr+TW26WWR4CITvwN1KdvRGew2cHfA2wpD
	IX14F/w63oVXckONB8ZgfA0+meFe8rwzGm5/lrYbn6TE61So8XwVzYUfZMPEKnTRsAnf0qULcn5
	NgTXY5FssBSF0KTjJ+zxr8qFyywpW3uVT8VxK6QP/s71eCFp/Zi9IE5wy43CA/i3V0tl/gzEd5/
	Cpg4+ZZnuv7LNZaTLuovD9d1vclNzRqcdfNUbndOnwuyuM5EDm3RoK5xME2S8o+NevcjqvNVyW/
	aot0g2+IcFvt8AY4ngqtzEVbhtzyByT9ZI7uQU=
X-Received: by 2002:a17:90b:3c85:b0:3a7:8ef9:3bb5 with SMTP id 98e67ed59e1d1-3ab3a90b5e6mr8441621a91.10.1791839502978;
        Mon, 12 Oct 2026 14:11:42 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.brunswick.com ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab32c0f59bsm10962728a91.0.2026.10.12.14.11.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 14:11:42 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-python][blacksail][PATCH 34/43] python3-gunicorn: mark CVE-2024-1135 patched
Date: Tue, 13 Oct 2026 10:09:58 +1300
Message-ID: <20261012211009.3352822-34-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261012211009.3352822-1-ankur.tyagi85@gmail.com>
References: <20261012211009.3352822-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 12 Oct 2026 21:11:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130804

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Debian[1] also identified the commit.

Details:
https://nvd.nist.gov/vuln/detail/cve-2024-1135

[1]https://security-tracker.debian.org/tracker/CVE-2024-1135

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-python/recipes-devtools/python/python3-gunicorn_26.2.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-gunicorn_26.2.0.bb b/meta-python/recipes-devtools/python/python3-gunicorn_26.2.0.bb
index 545947446cf..e19be893602 100644
--- a/meta-python/recipes-devtools/python/python3-gunicorn_26.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-gunicorn_26.2.0.bb
@@ -41,3 +41,5 @@ EOF
 }
 
 RDEPENDS:${PN} += "python3-setuptools python3-fcntl"
+
+CVE_STATUS[CVE-2024-1135] = "fixed-version: fixed since v22.0.0"

