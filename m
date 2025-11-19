Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20301CF3195
	for <webhook@archiver.kernel.org>; Wed, 19 Nov 2025 10:53:46 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3962.1763549624525715248
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Nov 2025 02:53:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UuADEYrW;
 spf=pass (domain: gmail.com, ip: 209.85.210.173, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-7baf61be569so5056982b3a.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 19 Nov 2025 02:53:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763549624; x=1764154424; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gr0dfzT6Vr0XbYJgFpqeOKubr5IMKbXzZZqI2aQMlEw=;
        b=UuADEYrWDeUFUbdBmqECtTR6QBCQd7ZGRSWAayp4X+VNlyr9d/YOgnjtNC8K92CBod
         +9L+26iDyCHcgCa/GtgOV6Si9feyP9JUopUzSaxNcueul4wyC2inKn8Im+aU0woUOUUR
         vcGfXyeopEpVysGlerU7wSqVkU1Nz1QnYe6bSZR/nOZTM2vjSwAJvukGdqbeMGOwOTEs
         /DIHSjVOcT4C6/dkhgnntDh7Kg3/FazVArG7dimcq8F8VRC1hmV6EEPgudwdkPvZbQJx
         0UxsL4NjQesRqhxUS/8oMgX/cN301ELNN+zd0nMiwuYMNz9tidAzJr2e58XginbJawR8
         f49Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763549624; x=1764154424;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Gr0dfzT6Vr0XbYJgFpqeOKubr5IMKbXzZZqI2aQMlEw=;
        b=OJYtsmAwGxOINL0geU6gI3VKhLRN3ee+1kWTz6Yj5aHvu5i+wVl05/o4dPEZuSsqdT
         qEBOSaIE5Uu1b9mqCp71nlIxrnsG71nJZRzEiCfHyZA4Y5/C1COe619/mCxEopavUpe/
         fDBVTUCIb/JHMRph1py5BU83lSyIRMFGyk8gb0sZTijCLXU7d+AfFELIjBW7Hp9WsXo/
         QsLO7gV3Y3qeSRG3doezDt1WxG3ErgXolrTZLi3vQMOfmAppdG7Y5fsyf5KLuCNm9aKz
         ZSnELc6BS5C27ERtH8evkmkrLtCh7iHfh25vewot/4fCFaZGaT6O8WLGOQVk8xBTPQ44
         NC/g==
X-Gm-Message-State: AOJu0Yzdyjk9b9mVgh8n9wo0yGJql+jxitLVso3EPdt2yPEG4bRiL+xG
	FrLBPLFxM8iT5R65eDwgWCE6Tf+AkoCfgcaZaq362gK9nY4cEkJqaOCtLcjn7g==
X-Gm-Gg: ASbGnctV264ZQYBnVHHAr8EjGeNzpn5GqJxNdUnv4C/PkKNWSKPXI0l2I2Vqmrafysx
	sliyw9NTlCQkdIvi/FPY9Q+nHJmobpj3/jrJ4YYJYDa8YPFGbQKE7zIn7eVZKEGpliK+ZtDYSsr
	VI+W6lzVbw3ZkAESWXg2lF3bGDDtRofho7+92j7eaWByYk46SwGgLU8zUVcasKsnLJk+VpNcteV
	2xHZTuGrfU/OmfSk8E3EEjWpwGMxEpGryx32aX/xtCdVS4u79g9l0/vzH365KGMnI06eBO7EpLj
	rjBXrTHjQUWU/ii2NJy+0n1w77X8PHdvE4DQB6cMEDtyuSbwc9UpXGo0llGIttFHZ9YMmGxFT3h
	n4kxgWkcAEo0/eLqUGimDdT8eebKH3h4E+o8nJzm3yEzOUycamt/VB1Nc/EumNd6ajpBdx8rlnE
	VuKLtyq3U0xPJH+Oh9fT2LOqZ6
X-Google-Smtp-Source: AGHT+IEBfuJjInkdo+MGw6rk57f1nqr4/9ab3QjRQEH3vm6uX0TrA/6TPySI5MC7bWhSUCgno0zN9Q==
X-Received: by 2002:a05:6a20:e210:b0:35f:aa1b:bbfb with SMTP id adf61e73a8af0-35faa1bc0edmr12368428637.50.1763549623714;
        Wed, 19 Nov 2025 02:53:43 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([167.103.126.249])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b924aed60bsm19383078b3a.4.2025.11.19.02.53.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 02:53:43 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][PATCH 4/6] libplist: update SRC_URI to include tag
Date: Wed, 19 Nov 2025 23:53:26 +1300
Message-ID: <20251119105328.2849176-4-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251119105328.2849176-1-ankur.tyagi85@gmail.com>
References: <20251119105328.2849176-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Nov 2025 10:53:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121894

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-oe/recipes-extended/libimobiledevice/libplist_2.6.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/libimobiledevice/libplist_2.6.0.bb b/meta-oe/recipes-extended/libimobiledevice/libplist_2.6.0.bb
index 1dfe895d23..69b9b46d62 100644
--- a/meta-oe/recipes-extended/libimobiledevice/libplist_2.6.0.bb
+++ b/meta-oe/recipes-extended/libimobiledevice/libplist_2.6.0.bb
@@ -9,7 +9,7 @@ DEPENDS = "libxml2 glib-2.0 swig python3"
 inherit autotools pkgconfig python3native python3targetconfig ptest
 
 SRCREV = "2117b8fdb6b4096455bd2041a63e59a028120136"
-SRC_URI = "git://github.com/libimobiledevice/libplist;protocol=https;branch=master \
+SRC_URI = "git://github.com/libimobiledevice/libplist;protocol=https;branch=master;tag=${PV} \
            file://run-ptest \
 "
 

