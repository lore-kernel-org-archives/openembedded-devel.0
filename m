Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E281ACEACC2
	for <webhook@archiver.kernel.org>; Fri, 14 Nov 2025 19:45:26 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6979.1763149526182230020
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Nov 2025 11:45:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TV59RcUz;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4775e891b5eso12964925e9.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 14 Nov 2025 11:45:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763149524; x=1763754324; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=zgWKSOdmR/2/aNxOM6nJ0Z2xxabRbyUMHBIAKxxTz1A=;
        b=TV59RcUztcIjqjlXO7w7NsHGOPFEaogN99DkWVlv28w8W/nVSw70KLvpkGwaTwmw+9
         JoXy6fxSi/FbbcpfLf/vnZsd+WpS/ZTOsyvrfvN0sjcF2rBgmN82/hKBpJAi/fJpcnKT
         n1OzI24XzsVTHD2ALOpHZqHj0Wr8DJmDANybBwLAvpvWotuoC7ERPAOmI/f+0rq2AYU1
         dgtuCL+FlDWBu+D6rzbMX0IvbJWUpeZ26amd9K0BFtUiGv+ohjRSoRxp7pg9jv0WIkf2
         arlva8NHkMnobpz7i9fikVM19G1HMi8OrKEIl+lhGMePW9Ema5E4c76+LsUplQ28zW9f
         c87w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763149524; x=1763754324;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zgWKSOdmR/2/aNxOM6nJ0Z2xxabRbyUMHBIAKxxTz1A=;
        b=bjWwogn7L0PQs6JXNjHUjuBSUi7NEOFXvsTJ7RvHUqp8yQ9//vz61i3ffRuyEZPugB
         HPhEeKBQcnRkSGicPaRyD2eXNmG0JAQ4/lpBdcsI6hBPeabTVDO/Qskp4O/aIjaAdv07
         /4dylLOMpibTCJNp+v1K+pAJKXvPbp+VdMBH8vEmymBRj78qdJ4fFez7MtrZQpSS0lny
         8TQxmHLfhBBr7uqQLoo2JTyX98d43leWMz+L3i9UYiN0VpmN/pysu8+6JAHEIGLlv89F
         Lv1fdkkSAUoZkz3FYl2b1WDFocmCYFof6FEPUTLJhoVKcM23k9/73LIflloQfSrV5QhA
         gxuA==
X-Gm-Message-State: AOJu0YwOLqO7UxOizQUEvTcWry3Detgr+JEdhxNVxljkOM9t/WqBydVU
	vd1QLlhw8jyDZg9y7/dTZP5iWlsBTEtb+V4C5DXyW7fGolWP4ewhfcMkt4LtqnoJ
X-Gm-Gg: ASbGncvzikh7lfBeYgXTuulkBArn+npMoWEUYcgpEM2hx0vsfOyjxDxgi/Ren+8vuH4
	6sPvLcYfnqOm244tZB1Y1fDawVFpIr+TPf/z0K3urJ0hOIBanjhECnVUGGOySYJFbNuSBmsai41
	809OQCAtQ7eD3dvbqtfmUMgFUeI7EYyPZ7yLECa8uo4/LSkn6YtHGeIFQ9gDbxs4BYl0tHwuu2X
	DLxWe7z0ted8b91HJfgtyxUxWpCwxOBZrxLVEz4UHnvvVoWMgNKHXv4twkUa6cKtbveDKWfAcY9
	pNQTztjcGyjLjxVrHIdc1XuAWPscEk9ChUgXjkwZPV7EAuE3VYu6PIid6RGBDxeAbJtE5u0Bsp1
	DdhW414LgVbLWuABpK3iBq0lauLj4LUSa9YX/A/5pGRowI7w1wTYq98GPFzqLV5GE7/40eNYeJQ
	+hdHsaXpsF
X-Google-Smtp-Source: AGHT+IFhIvQMTmgOReG+Vs2TEtnXFGbQv5Wxz6Yfm7gSFknsOamK3u17QhZq+1evprOkRrmVyuoz8w==
X-Received: by 2002:a05:6000:430e:b0:429:c709:7b54 with SMTP id ffacd0b85a97d-42b593679eemr4412376f8f.36.1763149524219;
        Fri, 14 Nov 2025 11:45:24 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53f17cbfsm11561514f8f.35.2025.11.14.11.45.23
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 11:45:23 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 1/5] audiofile: mark CVE-2020-18781 as patched
Date: Fri, 14 Nov 2025 20:45:18 +0100
Message-ID: <20251114194522.643069-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Nov 2025 19:45:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121711

From: Peter Marko <peter.marko@siemens.com>

Per [1] this CVE is already patched by commit [2].

This can be also verified with yocto build.

Running without this patch:
root@qemux86-64:~# sfconvert poc.wav output format wave
malloc(): corrupted top size
Aborted

Running with it:
root@qemux86-64:~# sfconvert poc.wav output format wave
Audio File Library: Bad number of coefficients [error 62]
Could not open file 'poc.wav' for reading.

[1] https://github.com/mpruett/audiofile/issues/56
[2] https://github.com/antlarr/audiofile/commit/c48e4c6503f7dabd41f11d4c9c7b7f8960e7f2c0

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 68f55c158e15a5d35702ae5c730586001e487f86)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../files/0004-Always-check-the-number-of-coefficients.patch     | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-multimedia/audiofile/files/0004-Always-check-the-number-of-coefficients.patch b/meta-oe/recipes-multimedia/audiofile/files/0004-Always-check-the-number-of-coefficients.patch
index 282f4c01b9..17a97163f5 100644
--- a/meta-oe/recipes-multimedia/audiofile/files/0004-Always-check-the-number-of-coefficients.patch
+++ b/meta-oe/recipes-multimedia/audiofile/files/0004-Always-check-the-number-of-coefficients.patch
@@ -17,6 +17,7 @@ CVE: CVE-2017-6832
 CVE: CVE-2017-6833
 CVE: CVE-2017-6835
 CVE: CVE-2017-6837
+CVE: CVE-2020-18781
 Upstream-Status: Inactive-Upstream [lastrelease: 2013]
 Signed-off-by: Peter Marko <peter.marko@siemens.com>
 ---

