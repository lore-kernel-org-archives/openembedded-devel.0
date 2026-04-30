Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3AB3CCFA13
	for <webhook@archiver.kernel.org>; Thu, 30 Apr 2026 11:47:23 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18371.1777549636594713929
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Apr 2026 04:47:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=sTy3JQmU;
 spf=pass (domain: gmail.com, ip: 209.85.216.45, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-35d94f4ee36so519300a91.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 30 Apr 2026 04:47:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777549636; x=1778154436; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3RFSQl8ytVi0wW8GHCzQB5JK4P1McmUcHFnwd/vBVB0=;
        b=sTy3JQmU682aHnszTSlClXkRidsIqgRha2snlYBezHU09G7gIfspNap0IvoH2X/IWC
         ryTIl+DXZa54rvv91fvoS1rHkK2gV354WM6XaJrqi2Pcumf/MFh8fyYv9KZ2hIzJiAhJ
         fNyFoEUzJ+WblVJn9rL+H9E+OMF7VXCx+77nJjC5lB0VYWx59oLKSigIR0GjHppA3eno
         QnMtxwKebapkpCoLCQTRbSvfaZ4AGNk5r05n7z0dr2BAerJCO0E21d91h4UCCGIDanV2
         ARQusLBn6O7zblaXEypVwsw04aFOeFA18cw1ogxVateT3Y3op2YPD0npC+sxMhlbepJg
         TxzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777549636; x=1778154436;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3RFSQl8ytVi0wW8GHCzQB5JK4P1McmUcHFnwd/vBVB0=;
        b=L8Kcm+UBk2Ax4ED1eouZ0QgYcq1tZkEzZ8XjT9WIPkNf29CaAEAJ24tMcgX2yRT3Tk
         e7oDPb+12CV/JjWZwVZz+UUx6MJHI1Nqrr3UJZZV7SWZsyUaG57noqb3v0Ru3hi+g4P+
         BljjyyHM4k36Bo+dAcVOPqnc/PAoqBBvnH9TB6t4wM6gfOB/ehcR1E2WmHmZ/omMN+Zf
         qgaKJwDhKRPo2Q9L3kBejAPydqiC5YbviPhy0s/8dBwyzTpAplJPkF4PFoCLL+XfObDp
         yPfBmNwGrBm7MGLUsXVl/vRtCZ+qBjDZdhDOEifF8fC8UVL3AmdTQ3TJ5SqifRcmNw3E
         fflg==
X-Gm-Message-State: AOJu0YzWp2Sq5p0vKSNc5d7g75B5Wbp0AZbUD026SylXowALd4prsJrA
	lyr6CzoGTkWhNA5gol/14EcpgjZc0oXc4WLg/ticoR+x2cZvxrP5I5onR6Ab7FIi
X-Gm-Gg: AeBDiesslmrlCe4F60MmjTTmig9vH2tciAXzXySg3KifcmWenP+79g6dTADzGmFVFNx
	HisDVwDhacCc9iZc0dS7TEhstAeaddk/hUuP+ib/Kr9+K9cmNUPwBlSfrU5H89z9IAUfhfzAX+D
	o7wNwLOGDIAvrB7xL+GV+ZfYgmUU47NkfnsHYbA0w+FtEqarHvqD7gt38forZ2O4gz6z6/1zLNv
	UxKfgfTZDia+VIZFz2nVEcPlTrReXAUmaOPNSX3uiFtUlAkPw2XHrRyyz/2/70YNNNqiOqO87n5
	L1tcOXOXiTTl6Hlf7PnVrLRM8mRBGrGgaYG5w48nBl2dUpDjzhfIHle2hus44MrY2N18gv0oTKU
	G3I1lL6e+9RK/F4oj3HI0juk/EWuVamKDN0uo0nc2gYoSPgcOSt4GVc2nZaj8KkDGHy0LQ3tQPW
	rn49v3liCsa28jKOpIpDLeX+dGhQGf/svxBVxRcBrPi8Pm+NA=
X-Received: by 2002:a17:90b:2d8c:b0:361:45df:103 with SMTP id 98e67ed59e1d1-364c302a1bfmr2637593a91.12.1777549635811;
        Thu, 30 Apr 2026 04:47:15 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.108.128])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-364c3fa0240sm769953a91.5.2026.04.30.04.47.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 04:47:15 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-webserver][whinlatter][PATCH 6/24] monkey: fix QA issue
Date: Thu, 30 Apr 2026 23:46:29 +1200
Message-ID: <20260430114649.4184890-6-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260430114649.4184890-1-ankur.tyagi85@gmail.com>
References: <20260430114649.4184890-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 Apr 2026 11:47:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126740

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-webserver/recipes-httpd/monkey/monkey_1.8.4.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-webserver/recipes-httpd/monkey/monkey_1.8.4.bb b/meta-webserver/recipes-httpd/monkey/monkey_1.8.4.bb
index 126a2a6fa5..4e4b272897 100644
--- a/meta-webserver/recipes-httpd/monkey/monkey_1.8.4.bb
+++ b/meta-webserver/recipes-httpd/monkey/monkey_1.8.4.bb
@@ -51,6 +51,10 @@ do_install:append() {
     if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
         install -Dm 644 ${UNPACKDIR}/monkey.service ${D}/${systemd_unitdir}/system/monkey.service
     fi
+
+    # QA Issue: monkey installs files in /var/volatile, but it is expected to be empty [empty-dirs]
+    # these folders are supposed to be recreated at runtime
+    find ${D}/var -type d -empty -delete
 }
 
 INITSCRIPT_NAME = "monkey"

