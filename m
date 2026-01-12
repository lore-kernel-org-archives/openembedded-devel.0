Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5D94D277D6
	for <webhook@archiver.kernel.org>; Mon, 12 Jan 2026 10:21:22 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.30043.1768213275177782695
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 12 Jan 2026 02:21:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QIyXAw9L;
 spf=pass (domain: gmail.com, ip: 209.85.221.49, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-432d256c2e6so2934546f8f.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 12 Jan 2026 02:21:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768213273; x=1768818073; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CbZc6Yh6wzZOQuwxytRasO05QDLDTasgIwdgvPJaghw=;
        b=QIyXAw9LCkaFUUMi6dKfflNAwqkozu/S24xV+WeEviF7nrMA4OR+TTEqceOV//QEJd
         V94L7uPE1eKgMNWNjUWD6bYlD5Fhah8KFjzG1S8YzXzzFdHB59K2Ye2j80tj2uWQ8eoz
         ok5j8gl/16lgdVKtoTdEVq3W2T0dFH1bvNeZ97XvZh6hgTDl8GSoTMp6nE9whk9nBRyp
         zcsrHg3MGQQ0J5Pn0d7iAaRd5zkrCGSsBaAa0ksp9Wep9GriStsW7d2qUgl83+5azj2C
         yL40zQ7QB3vznJmDnM7jEhr/N9jF/Gk9tM1+1jk7vTKzB8NyeSyiozgoP3qHmHDJ8kaC
         1A6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768213273; x=1768818073;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CbZc6Yh6wzZOQuwxytRasO05QDLDTasgIwdgvPJaghw=;
        b=s1skaZwXFGYa92YY8dNbzck0CDSHA/+4pB8rSNYQH6vu3L/5DLT1BrKmkGxiyZA+QX
         WLVsMWZ3WrSBIah8nOIufsGc5BN9akVDGhI4rXOOqm8vEOv7V7/ncTrZDWuKf+eHu5tt
         v5ylieceUNiOUOXJtxOkiPHo99o48B7pgU53NR0He2CM0VTMpvBdKmqjSnqTCHNt2UXo
         IquWz8m6cKcV+iugV8PRjkhBXC+b/n9Hs5uDwBppy4M6LBbebzwWTSZ/qe3xPfWNNgju
         2ZA4D9qS1vX5AN8sphsuh3iY4gOGbov1+Sd2tLMlYbwoVCfwbWuCjUmpDMh9WCqmuFjn
         y23g==
X-Gm-Message-State: AOJu0YzGRTN9FYSWY7556ZYYlCnu4CGbc1rEM+663rbTu3nKpIYC02JV
	T+Mm/oPqdB6wiTQMgZtmfXfqxcxXyc2hnbYNIAyHsp70AaNX6Wg5tDv18l9adQ==
X-Gm-Gg: AY/fxX4qLqEjDcF9ev7sldg1562WNOy+3jXGEWp3mX87zUhXGUBeM/SqhCQQVv5gvKR
	qZlTufWcCEFlTBa+CCfeShfEZZ6gwCyFy6b9vqozqurlALSP8GD64K4FPmYBkR1TsKGXzWMB3JA
	uV7shbvuvuCuMpHrxi83eRheeFIqGfI0ahUgoDvtP6FCaBGGiyAFxVsyO9dGehD4rplKfn7Kcwj
	4IQ6QuFg7/VA8tYRC9vmfscHMiFrdPELFU3IIT+mVzj+ktoV3ASQFuDQ2xHW0Gwpe0cmb6ivoN7
	aIVyUCzglXb+xfRTnyES9Zkwp6Bl7+1z3pNvCIzKgk6Y+F8RhcrOK4gPPwICsgTRq4+a+cnAT2X
	iwbcEInoXEJ+/rIwYR6/LGBhTSE9PzDdY7ncpBwwbeaOymGKgVQe6k6gf6QwY/Y9Xu11OygrtYv
	8jByWqe1ep
X-Google-Smtp-Source: AGHT+IEoaHoLVsQ/yxHqnybhVItW2iyNX0I9JBQp2T0RLJN4oz0553T99i44vIjIeGaVJHaPXf6WNA==
X-Received: by 2002:a05:6000:2891:b0:430:f1d3:fa2 with SMTP id ffacd0b85a97d-432c3760ec5mr17649492f8f.7.1768213273414;
        Mon, 12 Jan 2026 02:21:13 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5ee870sm38112342f8f.36.2026.01.12.02.21.11
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 02:21:12 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 2/3] boinc-client: mark CVE-2013-2018 patched
Date: Mon, 12 Jan 2026 11:21:05 +0100
Message-ID: <20260112102106.453902-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260112102106.453902-1-skandigraun@gmail.com>
References: <20260112102106.453902-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 12 Jan 2026 10:21:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123375

Details: https://nvd.nist.gov/vuln/detail/CVE-2013-2018

According to oss-security email[1], version 7.0.45 included
the fixes[2][3][4]

[1]: https://www.openwall.com/lists/oss-security/2013/04/29/11
[2]: https://github.com/BOINC/boinc/commit/6e205de096da83b12ffb2f0183b43e51261eb0c4
[3]: https://github.com/BOINC/boinc/commit/e8d6c33fe158129a5616e18eb84a7a9d44aca15f
[4]: https://github.com/BOINC/boinc/commit/ce3110489bc139b8218252ba1cb0862d69f72ae3

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
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

