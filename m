Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 717D0CCF2C1
	for <webhook@archiver.kernel.org>; Mon, 19 Jan 2026 08:29:19 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.31285.1768811350067724651
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Jan 2026 00:29:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dmjKnCvg;
 spf=pass (domain: gmail.com, ip: 209.85.214.173, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2a0a33d0585so24859965ad.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 19 Jan 2026 00:29:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768811349; x=1769416149; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jEfew0EKk149hi9qnbrJdv4HVEWtcd+ecSmZyT+1lnE=;
        b=dmjKnCvgJ4sBO0MK0CdZ4BEzgpf1BAc6duS1JV+lenYQ9lcjGROClyfkJWh89BcbhF
         G12dmG4hMuEs1dCa8eDlEFqTUBfnTV3OROw3pumegOczkfCTifQko2hhtAJl0pdmzStX
         cPn9R1Ih26q903tdOwsNDi3MT4Lk5upfhU/hNPd76k1G9uX+IPc2AfQQZFZZmRNcvPJp
         y3VXybnsqaomDs6mKv4EuSRNurgDBSLVKXuEfd47gNhDKayjnV6MRWo9MSC2gDiz8X2n
         MAjNznHoKq9z5xQHniU2W3G8hlIHHNq/s9vlNRigw40VjJftCmyc2USEN+ZCDVknQR59
         KVNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768811349; x=1769416149;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jEfew0EKk149hi9qnbrJdv4HVEWtcd+ecSmZyT+1lnE=;
        b=AgKTrU7Awzmv6p25lzutkx+vgFmnsCX+6lEJWnaPVeAXyfwGof47cVVXdG84Kow7n5
         PddrspcUyv8t/apsqGbKJBT6oCCGqcmapFcwIt7ed15/LPTZitd9dkY02M5du1rJsU+T
         xsz4DcMarnxyTHMCVKKgX3Yr6jJH2nZhYIFBui30xJRa04S5fDGAiC0N4HVwq3ad1Emy
         lmzueyQwwR8EC8LFRj7Rv809YyaHmY3fOaEjtz0L7JrFF+FvPbSlHC3xxgj13dIYCjcl
         cotesNEcl5D1C9jiwAkyhxofQcSdHbWCDF8NN0DwJZ3m7FG2B5gv/5Sc6U+KBsohTn2D
         JthQ==
X-Gm-Message-State: AOJu0YzbNZylQPGREad3jUUZ3MGngrpJWgpgvyk0pUYrdMawHsK/uL3V
	L4TCb8t/GW4z+aOmbckLtoN6KkNCPAeeJ9TmwhIikejh/pOSipbVyu0crbBsuw==
X-Gm-Gg: AZuq6aKaxEJuUvvnWv+9AMFmHJE3KfvR+2dAtUiCVTwHgDGy9kdX+ZFGOIvsVEXMd4w
	b8P/7FH0Z4z4YtuZUzGhunzpvWFU/8fg8V1zOiLQETsJZLOs+dorCjpeaD7+3m5nLvXaIbIqM+M
	Zx4sshag17VRv5FQwsISEWL7m0Dus3ezEgRHAV8rau8nGhG/Yjh5VWFMWry1mp+9lbH2HvXeJo1
	sI6QOsZg1hn1qlaKx280XjeOj+62Pjt1czH2uIgFoycYCqI1t8pDl6umh7MJ+jVjRVWnTjerX41
	0Q4ZoU4GNKDyqTR5IaJ1wqdwmh84+cEspaF4+ZLTGIOeJVDxhIQjndsH465TEe2hsqKTAqOf8CP
	qRWJz2aKIyIWLaMVganYyKtItiUXJ3UaecdnVHAELQwzLwqJ+3/vPK1XjOMg0vpdPBIs291/VIo
	OO4V7gEvNShzf6ATxTtN1TYLQ=
X-Received: by 2002:a17:902:c942:b0:294:f1fa:9097 with SMTP id d9443c01a7336-2a7188fd7b8mr88761365ad.34.1768811349249;
        Mon, 19 Jan 2026 00:29:09 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([147.161.217.27])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a7193fab6esm88002455ad.68.2026.01.19.00.29.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 00:29:08 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Gyorgy Sarvari <skandigraun@gmail.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][whinlatter][PATCH 26/28] boinc-client: mark CVE-2013-2018 patched
Date: Mon, 19 Jan 2026 21:27:48 +1300
Message-ID: <20260119082752.4120991-26-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260119082752.4120991-1-ankur.tyagi85@gmail.com>
References: <20260119082752.4120991-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Jan 2026 08:29:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123620

From: Gyorgy Sarvari <skandigraun@gmail.com>

Details: https://nvd.nist.gov/vuln/detail/CVE-2013-2018

According to oss-security email[1], version 7.0.45 included
the fixes[2][3][4]

[1]: https://www.openwall.com/lists/oss-security/2013/04/29/11
[2]: https://github.com/BOINC/boinc/commit/6e205de096da83b12ffb2f0183b43e51261eb0c4
[3]: https://github.com/BOINC/boinc/commit/e8d6c33fe158129a5616e18eb84a7a9d44aca15f
[4]: https://github.com/BOINC/boinc/commit/ce3110489bc139b8218252ba1cb0862d69f72ae3

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 2a78ad8813845677132ad0f1552fcaa4961c3e15)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-oe/recipes-extended/boinc/boinc-client_7.20.5.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-extended/boinc/boinc-client_7.20.5.bb b/meta-oe/recipes-extended/boinc/boinc-client_7.20.5.bb
index aed6fe6edd..4cc0ed2da2 100644
--- a/meta-oe/recipes-extended/boinc/boinc-client_7.20.5.bb
+++ b/meta-oe/recipes-extended/boinc/boinc-client_7.20.5.bb
@@ -31,6 +31,7 @@ DEPENDS = "curl \
 "
 
 CVE_PRODUCT = "boinc_client"
+CVE_STATUS[CVE-2013-2018] = "fixed-version: fixed in version 7.0.45 and later"
 
 SRCREV = "4774e1cbe0ad13cb9a6f7fffbb626a417316f61d"
 BRANCH = "client_release/7/7.20"

