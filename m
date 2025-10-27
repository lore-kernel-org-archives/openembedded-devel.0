Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF7D6CCF9E5
	for <webhook@archiver.kernel.org>; Mon, 27 Oct 2025 01:09:09 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web11.22470.1761527348483490341
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 26 Oct 2025 18:09:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ntVr96pn;
 spf=pass (domain: gmail.com, ip: 209.85.210.169, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-77f67ba775aso5043995b3a.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 26 Oct 2025 18:09:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761527348; x=1762132148; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Kd/Bp+MaexhyeRFvmR5LlivkdlAdhc/TDdrdxUMrUus=;
        b=ntVr96pnW1qsrBXVYKM/qq4t+Fkn/ESO+1cYTvRKsWifQ7AAXbLchmtAEjh4Fkfj+a
         opKULrcZ9r+qcFuCFf6HxZvbHoOjUXUaPCrxGr+cY9p4FzhcfhLsO8R3J7szTAtYvdPj
         hYQ+ehGY0FWtq018po8bWRdBpyNk3dR8Sid+8By7p38twx51uq/ZyKOhR/XGyCO1zixz
         x1f+VJ4lP2wpMsLFE72/yoaSfptJr5lLwIdQGMSLFQqQzWqaEl70xFwwqT45dAJReIOr
         QjHm8cgTpJRaVl+0eH4iFdxhu+AzWS05Vazf3DNYw26AObZh+X14rjJ0tvr3g8sFX3rW
         hgHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761527348; x=1762132148;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Kd/Bp+MaexhyeRFvmR5LlivkdlAdhc/TDdrdxUMrUus=;
        b=hM6HOm3mvB3DhEZhrmTExbJqzX/zq3cnKpsruV6oV73ygnJ4gN0VKFDB64kYnCmN27
         pRRNvr5gYtO/7D+ZKOCd0nTFg2pCqYJIkxleoMPfgLdj9c54q1G+9bHRzU5GxuRRoh9S
         txemoH8+4YirmfIjROsH/iiKP5bc0Q8MWGMZ8RhpI0XouOUZZTzDH3F38POHPNWcKn5v
         xHh2THgqbV/0d6vEnloLjrfTk2XX0tpYtIu76Dgk+HyrxnIEiXu8sDRp1Z/MWrd2X1+2
         5ZC4x/oM58C0UUEpPbezGZigdZtab+O2NG3xcyElpNITTcYSmtbimmjLGQMyUovvpkiI
         qa0g==
X-Gm-Message-State: AOJu0YwsGA1LSQA8DD7uz0ZcxW56Uc2qwEdlJIfwQZCuiZnJI+uFaHJZ
	CaGfKoXo25aU6rLQw/1w++aGjkbT8I/BNvoJIp1n96lgNBf2Tg20p8Wlv5S5xyNg
X-Gm-Gg: ASbGncuDnyOwh9+V9R7Ufefm3SFMZ5AI/f+56A8J0yYguVihTuJ7RTq/KZ6yukDOFov
	fP+kY1KFwLqShOHZtgbw4HeKZlFWEjN4ocAk2oxDpmwSo2xT1BT+8X1XXkURfMNtvEf9uDg0cta
	QylTYUIOeMdP6YjxZBWyNJRZuim8Whd4551DL2AtbxEvYp/eAHsioJFPDZY8jT4XqgtXzgdGl8P
	W3CcIj/7S747bpg86cgyo/QWdylvwd/jUpVcjSMb6y0mAbPtQiSo12D6voO2iS2YyoMooNb4FP7
	bhySARMO3uhu+Zhq7f6gnDjLnzjUbNWUBX+cMIJWYvpf/MkrHg0N3wPegRhJwbQRSZeJoOi+RDl
	IkweBkUtuHkLPci76ohBSTFPbiypkgPjhWeuGJy96opBmVqSKFXw/YLk5rWeK3OCibPze9OTo+P
	Kbct3pM22iDbu0/5b2LhU0hEv3Rm0uUJbSOKbaMSFlhCqxMC8+ZmbXsguWuTdzgw==
X-Google-Smtp-Source: AGHT+IFbd+eF3YsrNTzpg5bgSYPz3/tLwVeBNthyM56x1tpC+kOZUxTXlJfH9fIkAlFAH6neRC6TnQ==
X-Received: by 2002:a05:6a00:27a0:b0:7a2:7f87:7ae6 with SMTP id d2e1a72fcca58-7a27f877cd1mr12977164b3a.10.1761527347443;
        Sun, 26 Oct 2025 18:09:07 -0700 (PDT)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::9dbe])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a414032cabsm6130380b3a.22.2025.10.26.18.09.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Oct 2025 18:09:06 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] pocketpy: Upgrade to 3.1.3
Date: Sun, 26 Oct 2025 18:09:05 -0700
Message-ID: <20251027010905.2450999-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.51.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 27 Oct 2025 01:09:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121020

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../pocketpy/{pocketpy_2.1.1.bb => pocketpy_2.1.3.bb}         | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-devtools/pocketpy/{pocketpy_2.1.1.bb => pocketpy_2.1.3.bb} (93%)

diff --git a/meta-oe/recipes-devtools/pocketpy/pocketpy_2.1.1.bb b/meta-oe/recipes-devtools/pocketpy/pocketpy_2.1.3.bb
similarity index 93%
rename from meta-oe/recipes-devtools/pocketpy/pocketpy_2.1.1.bb
rename to meta-oe/recipes-devtools/pocketpy/pocketpy_2.1.3.bb
index c5fc4f0f6e..1fc0d0eacb 100644
--- a/meta-oe/recipes-devtools/pocketpy/pocketpy_2.1.1.bb
+++ b/meta-oe/recipes-devtools/pocketpy/pocketpy_2.1.3.bb
@@ -13,8 +13,8 @@ BUGTRACKER = "https://github.com/pocketpy/pocketpy/issues"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c292beb20a17db07c359b0cc2c039027"

-SRC_URI = "git://github.com/pocketpy/pocketpy.git;protocol=https;branch=main"
-SRCREV = "b6a6aa85a6cbfe0427b48e523d53ee3832bf5bd2"
+SRC_URI = "git://github.com/pocketpy/pocketpy.git;protocol=https;branch=main;tag=v${PV}"
+SRCREV = "e39e63191f004b61902ae3293317bd1e61f791f4"


 inherit cmake

