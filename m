Return-Path: <ninette@thehoodiefirm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE7D1C04FFE
	for <webhook@archiver.kernel.org>; Mon, 29 Apr 2024 15:12:38 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web11.23851.1714403549476790903
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Apr 2024 08:12:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@thehoodiefirm-com.20230601.gappssmtp.com header.s=20230601 header.b=EjZ91gGp;
 spf=neutral (domain: thehoodiefirm.com, ip: 209.85.128.42, mailfrom: ninette@thehoodiefirm.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-41bca450fa3so17109055e9.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 29 Apr 2024 08:12:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thehoodiefirm-com.20230601.gappssmtp.com; s=20230601; t=1714403548; x=1715008348; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=o1ov96Oh44uYKgjSrVEQR2R3w3PZebRY4rgl3NDXdyc=;
        b=EjZ91gGpEOGPFL+NYBwoXG2HSNPBJ0eDins+rrrAllv07p6p56giL+FeWoThXCacPb
         GDU5aZ3/E4ExwnrqPnL1LvLk+lLubiP4cVpk2fb20fTDciqTRWCYs63eFBDue3PyOE/w
         SHYCMC2Y/vFmJ+SWh2kEaBwrl/B8Ka/CLqrbeq/K0504Ei8RTiAuIPABXvt41nVYTiWr
         HmOHmfGJiRrvPRPXXnlfg13A1c+4ajebrpxz6QnixPTNxSlI/5RMlZ3qiGR5YgTvFUyd
         TSjWrZp7DPxiH/454LrdHnDGtw4ZmTg0Q/hskYSmBd2WLPJNswsl3UaxagP7T/vYrbfB
         GSZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714403548; x=1715008348;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=o1ov96Oh44uYKgjSrVEQR2R3w3PZebRY4rgl3NDXdyc=;
        b=wPM1Fh3NdRXIVy7KpJXlXLXPoIm6yahvvigzUFFyfVkugD7ig97WWAnd4r486ndVLn
         QAanHxWaeDBmob7gw7faTIbzAkIUuXkZD0IXiJUSlWXkYUNfn1rle6XW4c+lEbY9tyQi
         rZg9o5h7vRuLg+9SjG4iwo0D4mRCIGo1i6C+OTGzUZiCB9oFvBAVZzssurlWo1C6kktx
         N5pB7M3YHhITl9kQagZ3zNp7Hgv+KXEiIVyqMP/U8+wdG+JNuJ4oOBzAIHmlMiif4kuW
         oR+NCd53Xoyppygyw7a6QYvdEZINNA6fKHVh1fZw8RM70V7nSm6vsmeZFoA76vAAf1TK
         W2GA==
X-Gm-Message-State: AOJu0Yx1pZTdJ8rAgkyK8v/Z++WUr2yRlQhc8LkDWanwathoJUja2bFE
	6vyAP6G9uRJehUkDrgihNfHxDta+H5NzSj5IXXNoUCVt2lp8fULl8JcJoKdI6yn0V2K5j1atS7l
	V/cE=
X-Google-Smtp-Source: AGHT+IECuUdItmBMa5klcHbYZd+fNtcYVFCoG7ttofrzGyXzQOk0PpkmHTVpi37BgLAD+2k/BwCpww==
X-Received: by 2002:a05:600c:4e94:b0:41c:83aa:18b7 with SMTP id f20-20020a05600c4e9400b0041c83aa18b7mr63737wmq.33.1714403547831;
        Mon, 29 Apr 2024 08:12:27 -0700 (PDT)
Received: from Ninettes-MBP.fritz.box (pd9ebc533.dip0.t-ipconnect.de. [217.235.197.51])
        by smtp.gmail.com with ESMTPSA id v17-20020a05600c445100b0041c130520fbsm6384560wmn.46.2024.04.29.08.12.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Apr 2024 08:12:27 -0700 (PDT)
From: Ninette Adhikari <ninette@thehoodiefirm.com>
To: openembedded-devel@lists.openembedded.org
Cc: engineering@neighbourhood.ie,
	Peter.Marko@siemens.com,
	Ninette Adhikari <ninette@thehoodiefirm.com>
Subject: [PATCH v2] sthttpd: Update status for CVE-2017-10671
Date: Mon, 29 Apr 2024 17:12:24 +0200
Message-ID: <20240429151224.19406-1-ninette@thehoodiefirm.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <AS1PR10MB56973220F2C667576A4CAB35FD1B2@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <AS1PR10MB56973220F2C667576A4CAB35FD1B2@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
Reply-To: engineering@neighbourhood.ie
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 29 Apr 2024 15:12:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110188

Current version 2.27.1 is not affected by the issue.
Affected versions: Up to (excl.) 2.27.1

Signed-off-by: Ninette Adhikari <ninette@thehoodiefirm.com>
---
 meta-webserver/recipes-httpd/sthttpd/sthttpd_2.27.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-webserver/recipes-httpd/sthttpd/sthttpd_2.27.1.bb b/meta-webserver/recipes-httpd/sthttpd/sthttpd_2.27.1.bb
index b40b14851..601ec7bcd 100644
--- a/meta-webserver/recipes-httpd/sthttpd/sthttpd_2.27.1.bb
+++ b/meta-webserver/recipes-httpd/sthttpd/sthttpd_2.27.1.bb
@@ -57,3 +57,5 @@ SYSTEMD_SERVICE:${PN} = "thttpd.service"
 
 FILES:${PN} += "${SRV_DIR}"
 FILES:${PN}-dbg += "${SRV_DIR}/cgi-bin/.debug"
+
+CVE_STATUS[CVE-2017-10671] = "fixed-version: No action required. The current version (2.27.1) is not affected by the CVE."
-- 
2.44.0


