Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FCA5CA6016
	for <webhook@archiver.kernel.org>; Mon, 19 Jan 2026 08:28:49 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.31276.1768811320658539728
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Jan 2026 00:28:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=npd5KeFt;
 spf=pass (domain: gmail.com, ip: 209.85.214.176, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2a0bae9aca3so26927375ad.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 19 Jan 2026 00:28:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768811320; x=1769416120; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=umdA62b0GXKETldsB8y0VDPC7l6lWg6MPC1OJjLmI1U=;
        b=npd5KeFt4M8ikQdtncakeuyBdLQsqmVq/xfqPaYbBO65wmym4LloFMvhPBcnuDVB4E
         LLi65HFeRksXuqm7CrD0CXe/S5uhUhLORNeRjx8gf7c8v1OPCRs5IJ/netToHe7ww08R
         RnkEiQembMbQjSFRo5/PtP7/w60Su1vELEpRzZPVvP0a5KAHKIC+T2lGmt3lZtreJZQV
         zNG/NglhH3DgvWql6XWwdUI+XnsMs07uuwpI7nomd1AkOn7k5oHPjuR9NGSTCd3teIyU
         UmBS30W/mYpoG0m5Hcp/6VUvZ72hcPEBhyX6ACAcFz0ILSL+mwT5BwEz3Aa23r2Iwlw2
         8Rog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768811320; x=1769416120;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=umdA62b0GXKETldsB8y0VDPC7l6lWg6MPC1OJjLmI1U=;
        b=C+d7xk/1/QfHWAHiYzEeCg11afWaTMYyfEL5h4RRk2sJ4wrGqkgJndoH7KrK5I1TDX
         tI4YHE/fvDR5B9F1uDBi3J+IVll9n4bTHPu4WNbSdedD7WeJDYYBpOU+mXWS637eRBrk
         topBdvrpfDD7GTAg5GoBhSiP4/ZWAcA2vs9nNO5kJeSYivJNJOnpOJZBniVMIZTbDZvl
         3PPsYAyfqRgqqLKlFWSlH3vjpC2o1+etFtrqow5c1JabFjaVXbmPJIEAJaiSM53Mhut0
         KeQMj5VSUIxPXNw5Ho22OZCxI0aKWe/FC8dnD68kuq6LYQacKjINdP3c40ZGV6E6hGmO
         Pdcw==
X-Gm-Message-State: AOJu0YzTxlBE+MIairlzVLomtL73SlwrT17S04fWv2P8mo1N29jKGPJO
	fvgaX/rKheFfcVzoRouYFJ7pQmkh5+oFyXwpKTWLjTKK8zHedw/Lq6GBsMbdVA==
X-Gm-Gg: AZuq6aJ9JlONgrd2aCoQI1dEJXQnvfAMfzofHjTncRy3kAmO0DSjfjRZhQkbNF5mZuM
	KFUnYUpr1lCFlnrc4WTfbVZAjW/wTNZFbaEXXfBLDlOi6Wwj1/VaMSsZqBJOuswcXemeoi/S4pB
	NvHS1Lw4HZmGtUKTfrNOHpyHTN3JuvWSRmUugcKiFAZcexf7IQqsHM2s9nzf2wPPn2Eef4iUC2d
	J8/emRYwMb8kgGLu0ZkMXSLT/aoyT/3TFtCYRMsG4uqGrrwMQ1/kF7rH9jDV9DOKhbtgto380XM
	oEd907WVwO/CvuknIdurYIVzzqCrzuEcfPT2TkR04x8IDyPY6WebMvfYGiBUb6Myx+QSRdsDPoQ
	91ffOxHCzcOB8mIPc0PRR8O5lESwFn6IzX3fFDUqHoHcDHwc3X9/Z2XjQWV9t9ENsdM5vv6bp6s
	l3gO2pL3iY7W1R6FF/ud9v6GI=
X-Received: by 2002:a17:902:fc4d:b0:2a2:dc1f:78d8 with SMTP id d9443c01a7336-2a7176cc6dfmr106938985ad.42.1768811319856;
        Mon, 19 Jan 2026 00:28:39 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([147.161.217.27])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a7193fab6esm88002455ad.68.2026.01.19.00.28.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 00:28:39 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Gyorgy Sarvari <skandigraun@gmail.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][whinlatter][PATCH 15/28] smarty: extend CVE_PRODUCT
Date: Mon, 19 Jan 2026 21:27:37 +1300
Message-ID: <20260119082752.4120991-15-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260119082752.4120991-1-ankur.tyagi85@gmail.com>
References: <20260119082752.4120991-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Jan 2026 08:28:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123609

From: Gyorgy Sarvari <skandigraun@gmail.com>

Some CVEs assign smarty-php as the vendor to the corresponding CPE.
E.g CVE-2024-35226[1] is tracked with smarty-php:smarty by mitre
(NVD tracks it without CPE).

[1]: https://cveawg.mitre.org/api/cve/CVE-2024-35226

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 1aee6a403c1901bc7ae793a2f4581b3cdbd95c1d)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-oe/recipes-support/smarty/smarty_5.6.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/smarty/smarty_5.6.0.bb b/meta-oe/recipes-support/smarty/smarty_5.6.0.bb
index 88afc55c15..56b239e9c7 100644
--- a/meta-oe/recipes-support/smarty/smarty_5.6.0.bb
+++ b/meta-oe/recipes-support/smarty/smarty_5.6.0.bb
@@ -34,4 +34,4 @@ FILES:${PN} += "${datadir}/php/smarty3/"
 
 RDEPENDS:${PN} = "php"
 
-CVE_PRODUCT = "smarty:smarty"
+CVE_PRODUCT = "smarty:smarty smarty-php:smarty"

