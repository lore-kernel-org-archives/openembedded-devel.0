Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62BE3D277D9
	for <webhook@archiver.kernel.org>; Sat, 10 Jan 2026 10:37:33 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6312.1768041447053453994
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 10 Jan 2026 02:37:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Xhjzo+Jr;
 spf=pass (domain: gmail.com, ip: 209.85.210.179, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-81df6a302b1so1466618b3a.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 10 Jan 2026 02:37:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768041446; x=1768646246; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rhiVffF4Y5af5eBBdNZ/yggt2ZEMEJ2+eZDb5J5ocIc=;
        b=Xhjzo+JrE5DHjfIDxFM6zzxY9bEYWY9bL9iOvQ0O1azui/LMDFgcIq+q2zxOoY0+mq
         44+twE8gvcfPBE81W+pJWcIvf/2etAnjsS/GR+RqijAJNRM8FPKOa/ilhbIf3IkvEO3A
         ImM+Lo/vALjPQt0z1h2GVRQCZ+rxBsAEKgIJyggCqWPwNTW4RxK9xNWJdIkYm8CljUww
         9bHoGisbdS2u5WlQN/UNXpMaVx0+O5+T66opAolnpaWM+SoP6IYxJgXZxdXumR66cJlo
         eWx45Ue09bHIjty0lXP+EF37I13ZEE+W/wjODVKnU2+AQl7iRIyzQTxAIKLLKa6n2468
         RLYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768041446; x=1768646246;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rhiVffF4Y5af5eBBdNZ/yggt2ZEMEJ2+eZDb5J5ocIc=;
        b=mlS39WKI/D8REBuF/C8MnEJbaa+M/6kuImKdnJINXjIFv2IsEt/GLDmKtn1jEStuLc
         AIvp0aMd8+aLtW0ywF0hjSoMMjAs1bpsgH8l55XGg+QrsWRd4+xjn83SzPsQU24w2YfD
         SoSpzYs15kvYGEAgtVSdaCzlxoXyNrNQB3qXO7M7GBQxAU+Ze1+7oBM3OBpZMg8/izII
         eIyE6B7MF8MahOMiPhG39PXn6aGavMYSX5Bxi4J0eG90Il32BzuKIP+V4nc3I59JifA6
         eR/YJ+YTcfUwuLgXZX+lar7vl7JSKIDfQIJntu20OVSUEKZ+fYUrRE9drUf1+sAav7S9
         iO0g==
X-Gm-Message-State: AOJu0YwjEmCUSbOYzPbUxdnhgziEsCR7J7UaphnE+quj5z9Vq+erZS8+
	v1btLHC4GT1i+n8sN2fXIDtbs7Kg/mjyklE3ptgHch3rYPC2agqioItvddzgIA==
X-Gm-Gg: AY/fxX5IKhKO6cAcP38mKbQnadC1HhEN3gjAG/obmxggeobOSNUJAFW57rZX9QcukxE
	5LfrjOpSvwMBzgiykfjFL1zWo25eQqL9DwbUHxRky/g2RnmPl1bUfgsspckt/cVnDktlnBm6DVJ
	RhVGGmpIjJP/zMhFKY9oVAM18MUoYg7u9y2LcUTWzCkPmUBcWVYHetx9ug7WZJ0ttNfgCG8/jLY
	T464E8oF1AeWRahplnG+Q9mtkdg1/oMnCN/9vdCbnYywAkyCDcFiTfPKAkdlf+rbo4gbkfbCicb
	jx6ZkKVFMQMOebCBHA6Nm8AOaVcJteG5mzcAMT13Vx/nS0ZcDCVcDqxQegCMuaUYt44uz2J3iuJ
	aQBZVI5f8mzvX/8g5uiPAn6grC2wR7oGg9ZV42vD8F2l4jCxxsdurVj8P/5HwWV8Pegs0juYbmm
	hbxg5D85mhY3L0LOD7AVldTYo=
X-Google-Smtp-Source: AGHT+IFtCTUv1Jo+zycgyUugPZL1OD6zQ9tQA7i/rr5m+hhuGPEsqLcMo+fVgpgb0RZlcys/fFZ2Fw==
X-Received: by 2002:a05:6a00:35c6:b0:772:8101:870c with SMTP id d2e1a72fcca58-81b7d260374mr10194944b3a.11.1768041446115;
        Sat, 10 Jan 2026 02:37:26 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([167.103.127.10])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-81f46882d19sm375715b3a.63.2026.01.10.02.37.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Jan 2026 02:37:25 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][scarthgap][PATCH 1/5] freerdp3: ignore CVE-2025-68118
Date: Sat, 10 Jan 2026 23:37:12 +1300
Message-ID: <20260110103716.3470419-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 10 Jan 2026 10:37:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123320

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Only affects Windows and can be ignored.

Details: https://nvd.nist.gov/vuln/detail/CVE-2025-68118

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-oe/recipes-support/freerdp/freerdp3_3.4.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-support/freerdp/freerdp3_3.4.0.bb b/meta-oe/recipes-support/freerdp/freerdp3_3.4.0.bb
index b9ec75236b..6e27efb5ce 100644
--- a/meta-oe/recipes-support/freerdp/freerdp3_3.4.0.bb
+++ b/meta-oe/recipes-support/freerdp/freerdp3_3.4.0.bb
@@ -74,3 +74,5 @@ do_configure:append() {
 }
 
 FILES:${PN} += "${datadir}"
+
+CVE_STATUS[CVE-2025-68118] = "not-applicable-platform: only affects Windows"

