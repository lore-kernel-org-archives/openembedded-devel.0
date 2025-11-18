Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7798CED243
	for <webhook@archiver.kernel.org>; Tue, 18 Nov 2025 02:55:06 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2961.1763434497362338904
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Nov 2025 18:54:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=k6BdeJa+;
 spf=pass (domain: gmail.com, ip: 209.85.214.171, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-297d4a56f97so55232805ad.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 17 Nov 2025 18:54:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763434496; x=1764039296; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1hQp/d8Mm6xacVPkPK6koXK9jG11yciIlLicKF4vcX4=;
        b=k6BdeJa+fkGgQB7aWvwSoAFBEH0CQhbahE52PYBQBQeZGgqMaXF7UHUwPbdOpslMpE
         2C2sSl8/zTG7+4AAfluDbNhGaHzCwwuPuFQYuBhmUHAhI+nLQ74BjWJTu488xE3Mkc7P
         awm4cfcsUBPOO8ZQceW3TlWA7YLjyvhyUqbzoUURymmOrFHiLz4HMUdpSxhuX3Y2VoUv
         Q+Tu5doq+SYzaRzoJOK2m/iAexnnYOLWJSW6h5nkXDlP0rYmuY9dQzHnoc0/YYKkMXEe
         FZmd73fQAEt0e17p72cbtXCQL1H8EaXG7f48UdjFftORMXqdbxETkxJD3qfubusF7WEi
         lsSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763434496; x=1764039296;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1hQp/d8Mm6xacVPkPK6koXK9jG11yciIlLicKF4vcX4=;
        b=fsGHPnPxV7WDQvvxwSK/ANXvcpZ66fiwLQ21m+DgiWFXjQkFculjsDrJMv5l8Ag0tG
         NXlytn3Dndr8NvPjY9C6tKODvlEWU4Fst1n5JkSkfe9nKMrjPTafRpO75B3s5SakuADT
         YDWUn3Ag+SXWmiG0i0bRfbqRLbXC8vgeJUndaeixUp0HPGfF/2V5VCr8RPMEmti3ynGz
         w0Osc/wik/0AWjj2JMnx+jyMZnQEhQmE/p/un+Efm7uQbz3zUATrLN5TsYXsAPAryJcr
         RWrXhaLfEw+FWTmstd9YGtGPA66STyUwkEpszdw34OXdfnFMNDvOeNnNBnWt4lO+8YXk
         /6mQ==
X-Gm-Message-State: AOJu0Ywph/ZJ8Nd16s4AbeXM5OkQOBu8U6yhR3CjDLiQWQxGuMMgkMml
	eAx3N3DtTcjBLlYLwbOg2EIhQAAxl1kitYCOnrVAqnI0CKAmt07HQMff2wKCLg==
X-Gm-Gg: ASbGncvGQzqAFT9W9t/0B73QP5/GF7g4OLoyWhpeh48RsWogCaaI7M9WpNN04z1H7h3
	bu8jHp1lX+pDMxAqeBv/GyQ/cKdxvtRoC4PxqlnFEi6E82nlIuupEfBEe8uYZXj+MaprwHAg1oA
	wFAP+FY/Niy71tQa6ve46gVnuM1k2LMYUcLRUW+aQKN2FXm0sFzTBQx0HSrwlbbeNcgn25Fq9EP
	ws7RPkOAPbtR8mWH06MVoSjMsji0cFPiBwXsczG/5t5FjNjSawBkma9VB5n4zaKtYa1QP9PQjs3
	i3gxLgR8FR8xhYigCBSA6qhaRPSjdlGZUj24/5VgXZsKiwXHFcul9I1af0cIdtS/91+LJCtV7Xp
	0mWSy0eix8JozO4NfikuPhB1SfWkOub7EQHW9yFIzCPKmtVfNOu4wWy/uJK7joyhEilc1a5Ti+G
	jgmeLrpKSG54y0izq3fNjtKFI=
X-Google-Smtp-Source: AGHT+IGyEw5YxBQGyqZEZOdS1l8UIPqrjHK8WPVMJG/6LmVbcq4vAwnF619LLIzoLd9Vezdw2ZdO0A==
X-Received: by 2002:a17:903:1c5:b0:295:5945:2920 with SMTP id d9443c01a7336-2986a72c2dfmr171769415ad.34.1763434496531;
        Mon, 17 Nov 2025 18:54:56 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([147.161.217.15])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c2348afsm154505765ad.3.2025.11.17.18.54.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 18:54:56 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][PATCH v2 1/2] smarty: update CVE_PRODUCT
Date: Tue, 18 Nov 2025 15:54:47 +1300
Message-ID: <20251118025448.952479-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Nov 2025 02:55:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121802

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
changes in v2:
- CVE_PRODUCT change in a separate patch
---
 meta-oe/recipes-support/smarty/smarty_5.4.5.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/smarty/smarty_5.4.5.bb b/meta-oe/recipes-support/smarty/smarty_5.4.5.bb
index 047f10589d..7f99b9b5d7 100644
--- a/meta-oe/recipes-support/smarty/smarty_5.4.5.bb
+++ b/meta-oe/recipes-support/smarty/smarty_5.4.5.bb
@@ -34,4 +34,4 @@ FILES:${PN} += "${datadir}/php/smarty3/"
 
 RDEPENDS:${PN} = "php"
 
-CVE_STATUS[CVE-2020-10375] = "cpe-incorrect: The recipe used in the meta-openembedded is a different smarty package compared to the one which has the CVE issue."
+CVE_PRODUCT = "smarty:smarty"

