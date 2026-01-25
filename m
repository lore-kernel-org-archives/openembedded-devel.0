Return-Path: <frederikbraendstrup@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D193CE63C9C
	for <webhook@archiver.kernel.org>; Sun, 25 Jan 2026 10:28:31 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.36608.1769336903295706982
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 25 Jan 2026 02:28:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Jg6qQjJl;
 spf=pass (domain: gmail.com, ip: 209.85.218.44, mailfrom: frederikbraendstrup@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b884a84e622so554643566b.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 25 Jan 2026 02:28:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769336902; x=1769941702; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PkYX9Tf+XkgEMATmjcdhFRJylYFbmXhKx49mp7ZUCSE=;
        b=Jg6qQjJlAksq1SWKe5sIS9JNQ/m+i3VBxPYdj66M1JU9RaX1syDc0esJ3hDOzTvSI0
         v6MVpVj+ZZMNUU1mejONBIC+9nQBVIDnf86138/Wzse1VNKqqBDg1SYWnNZ3l5znUfwT
         bjJXJ7K9q6bDScJDoxeButzmfeRLa3gYL+NWF+DMIQArJ7lczvLV+n5e5wnGMwf6F/9T
         4yPYNgo7SBdyV5qcCtHcrLfnbLepxALU858IYT7ZHRGFmU205K84qifyGgyUSL9Wqaig
         yBIWWFahzKiU9ZbgA2e8jRLu4/TdRtFmJ6mmHf6gx2bQUclKeYY1TJwWntvJ3BAGL1Ad
         SRyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769336902; x=1769941702;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PkYX9Tf+XkgEMATmjcdhFRJylYFbmXhKx49mp7ZUCSE=;
        b=Cak1xm8+Exl/fbXmHZUUKrQQOZ+8nFvUlYCmA+nQ8z3ErnPSy50mryUBlmGGdDHjBH
         /4cSodCr5MCuMZKcmPufkJ3oGniP9V+MG34k6wL7Mu6Zt0LduqFGwjawlXtstTrK1NK5
         KPar9Y4kvWvd+hMKssWEKUHWEi986Y5cw0nPPwRALwWA7l5v8df+s2hB0mwzIjV0cL0Y
         XBYePH83PoIdagOQzakIl8aAIljChwx23WHrV1qZmqF+7ehrNCuHAWjL9rXjj/AEy+WL
         kM1IsE+EzuSEpAJcIjgjCmBfgod5+GMI/rF24R6WwPgkKFcSmo8hE0YnduNyS/LfkR/p
         K7CA==
X-Gm-Message-State: AOJu0YzgYmqPsG9g+xw8ykrlM7FWYeh53jRcn2ZU4QRYxzByg4Zs4IKd
	Ncp23gUavjk6mngsHVSbP/fhSJkZe3G7ruRybhvCNVuigXIYqwOPrPuqKSCVgw==
X-Gm-Gg: AZuq6aLzhMjg8fge1+WwmEOLTeCND0DojuY3Eynv7lumDYDDSjhduv1xW3MrL8ZJsM6
	YH32AWS3aSloHKmkpaIqDCtWIxdcz18kk8GwZQMjsFC4360Py50lqUcV/5yEHJ1ow9qffT24XLl
	xqTy1a/mzWdqBykJapmU+/ftOZCW/EJ5nKhfyzgWEvr2RPGRUcz6K1LRo91S3mEAby5F5mVsE0c
	5Mr2VN+L8o2KIvrn/3FFjSHb07YfdOupVi4n5z4nbiW8wWlnyNTSieUUpOnVk5YmEEchvp9gy8u
	U1MGa05x6O4O1Qn9xezmyRkHcBL4fN0Pn/eHiKrdFaDLqke1laJRVF+rZXvEgSeIunsZENZKxOv
	jw9nUyTTwB41PXBQ41nSTYWr+s+DPX1W2XjKt74xrFPsb/g0yGJyR5ES6bTmPUuRCNX7aqVeA9a
	BnRugw0+fvAfux8Aei1ks7nni2svnURu/mRWZB8BZCPY0dJmkObOlYwlvx0fvcI0Vi
X-Received: by 2002:a17:907:868d:b0:b87:fad:442b with SMTP id a640c23a62f3a-b8cfee276f2mr94183566b.3.1769336901382;
        Sun, 25 Jan 2026 02:28:21 -0800 (PST)
Received: from ws.taila4487.ts.net (77.241.136.110.bredband.3.dk. [77.241.136.110])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b885b3dbbd1sm437659666b.2.2026.01.25.02.28.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jan 2026 02:28:20 -0800 (PST)
From: Frede Hoey Braendstrup <frederikbraendstrup@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Frede Hoey Braendstrup <frederikbraendstrup@gmail.com>
Subject: [meta-oe][PATCH v2 0/2] Add liboauth2
Date: Sun, 25 Jan 2026 11:27:41 +0100
Message-ID: <20260125102742.1827360-2-frederikbraendstrup@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 25 Jan 2026 10:28:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123837

These patches add liboauth2 and its dependency cjose from OpenIDC

V2 removes the hard requirement for apache2 for liboauth2

Frede Hoey Braendstrup (2):
  cjose: Add recipe at 0.6.2.4
  liboauth2: Add recipe at 2.2.0

 .../recipes-support/cjose/cjose_0.6.2.4.bb    | 14 +++++++++++++
 .../liboauth2/liboauth2_2.2.0.bb              | 21 +++++++++++++++++++
 2 files changed, 35 insertions(+)
 create mode 100644 meta-oe/recipes-support/cjose/cjose_0.6.2.4.bb
 create mode 100644 meta-oe/recipes-support/liboauth2/liboauth2_2.2.0.bb

-- 
2.52.0


