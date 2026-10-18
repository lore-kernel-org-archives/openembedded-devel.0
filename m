Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EA01CCF2C4
	for <webhook@archiver.kernel.org>; Sun, 18 Oct 2026 17:20:29 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18075.1792344021949790032
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 18 Oct 2026 10:20:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=HosWNwCg;
 spf=pass (domain: konsulko.com, ip: 209.85.128.46, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-49d0da752ffso10908955e9.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 18 Oct 2026 10:20:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1792344020; x=1792948820; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=28J0zenWSJKGfTkGmeeQ5svOqZ1sBSiMW8fXhepjRig=;
        b=HosWNwCgiaAsnFPsXWEn6NYmfSpTODQ3T3/oqjy4LmuP2vk4v7zqmJHwr/rQQBGc01
         nT6aQV/bSL8TzMrICc09x/NeX9jwIsLQBSXl+CtVEQu27y/1hpI7e67EykCyiJ1L0ORT
         YnyeaP+CFJqpCxL2OAdiWWi4JJ1vKvHMnODkI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792344020; x=1792948820;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=28J0zenWSJKGfTkGmeeQ5svOqZ1sBSiMW8fXhepjRig=;
        b=2SP7kkZ+ak5waowuA/rkzjZl+YfLerDEyDfoSCU9XwO3LThjQuaKUpjem6h0MaTBm4
         LyDsa6iBpQTiE5ZKaN3iNhbu4uzL+eWY+qZMY5bJr31r6Qd1ko8N0Beh4AAej27YCp6d
         lKb631W4NC+ulWikNm0iKeMuoi4nKPzwHWcHNdCy+d2pYuc5LHUF2OKB4W6Sngyzhu4d
         87FuatSyYRtkyMIweYMKCgzqCwXH7T6vU58oaNYSQkntDXvpwNlxC670+EI+KElrHu9U
         DpcWWeNLVuybVYXMx9TwO+m7aXYmpY2iB3cttXl7V9+iKrF49b8V+fHxpwhbqIbKOVgR
         qoWA==
X-Gm-Message-State: AFq9FYJvO0EMMHuIzoOMl8A9gkbpc0O9+X2ecaNUdmpPu9zMrnAQ9gdz
	9QsYQRsg6162RYk3bR9ozVcmuZ68pT8AIIcPJoy5VJUvNEpqgN/xTk2K3VMGbBqDNWSJbc36Ya8
	6UQJL
X-Gm-Gg: AYBFou2KfY9JB2P9rBA6Nf4w5bB55OGju8ZB55xH8wtAP3e54VDHzFgDuWiN3FUNwVT
	IcElcBid0fKLmJNVSMrcpMXHVo18naNhXtv+o0VOIuMbreESgmPSLRxBXTMQTzbyrJCv/q1Apxb
	1663ZESn+6AYz8l8iVHNHPjQdqlmAqvN12ejWIVESzVADs09gyepVhNyylsN6o7kOZEULEdXlB0
	ORmcC8PSXp7pzlJ693kWLtww5RHWL42tu7on4MDtBL10xwrCjv8lVsq2RpJMVuQ3E89K2i2MiHu
	lVOMbp2GE12w6ACCcYihoZdOw8FcXMPVlry4qKk7CvYQCTrxd2jLNKsZ3DfrO0dAVQanA4PVXfx
	C8FF4Ga5emZvAwJKU56emdYIxUe9NtGQ3yS9QOJip5Yk3uPzpIZLtEUDJh2RNcKbXne1tuSiM/5
	r/EiaOwmn873mH3DkxrUNEnVrbz13MMso9TnVloNknUWz3Hm3WSUHCLugF+lBGBhTvztcKC7k1S
	nNzC0vz0kel1cJfVWfiEvdaCq6lyLCvB/2knPVQz8VGnJqqbd9gAMO9CE+90mTGN+00m+n1IbfZ
	LtmdW7nK9O6xmZhPuh93YwU=
X-Received: by 2002:a05:600c:4689:b0:4a1:ddf6:fd78 with SMTP id 5b1f17b1804b1-4a1ddf6ff41mr79773455e9.26.1792344020244;
        Sun, 18 Oct 2026 10:20:20 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1dc952d63sm156755155e9.2.2026.10.18.10.20.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 10:20:19 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 5/5] python3-anyio: Upgrade 4.14.2 -> 4.15.1
Date: Sun, 18 Oct 2026 20:20:13 +0300
Message-ID: <20261018172013.925046-5-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261018172013.925046-1-leon.anavi@konsulko.com>
References: <20261018172013.925046-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 18 Oct 2026 17:20:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131099

Upgrade to release 4.15.1:

- Implemented a compatibility fix for supporting direct access of
  anyio.* submodules from the main package even when those
  submodules were not directly imported first.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-anyio_4.14.2.bb => python3-anyio_4.15.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-anyio_4.14.2.bb => python3-anyio_4.15.1.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python3-anyio_4.14.2.bb b/meta-python/recipes-devtools/python/python3-anyio_4.15.1.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python3-anyio_4.14.2.bb
rename to meta-python/recipes-devtools/python/python3-anyio_4.15.1.bb
index f817610a1c..8c262a848e 100644
--- a/meta-python/recipes-devtools/python/python3-anyio_4.14.2.bb
+++ b/meta-python/recipes-devtools/python/python3-anyio_4.15.1.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=c0a769411d2af7894099e8ff75058c9f"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "cfa139f3ed1a23ee8f88a145ddb5ac7605b8bbfd8592baacd7ce3d8bb4313c7f"
+SRC_URI[sha256sum] = "9f28306018cbd6d329e64a36d58256edff76dd996fe423bc957326e578b82a94"
 
 DEPENDS += " \
 	python3-setuptools-scm-native \
-- 
2.47.3


