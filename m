Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web12.24605.1612725020047284831
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 07 Feb 2021 11:10:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=cTCqnWPy;
 spf=pass (domain: gmail.com, ip: 209.85.215.172, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f172.google.com with SMTP id t25so8856187pga.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 07 Feb 2021 11:10:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=Mu11dPHWCCjmnha3Uv9U8mpnGxhSAudvWTZzGIdQLyU=;
        b=cTCqnWPyRcy5C9MnQtbEER6ySCFcqTAHC8KJ/4fz3S4khNwqcZsfvJSNJ3ywcm6u34
         Pg4KskCqc3K+8Voimyya98NyuHUZg4Au2zv1INnFlZLhWST5dBiZsDvs7LLpPnUh0/Ip
         Vyh1jb3RyrnsGqul1B7ERHFPf4PJsPYB0uBGFv4BVQvEkCPyIujCAmcndtqkn/pdFaNF
         h/uiVfowpGWnMMc+N2eev4r0dONDGmRSIpKdaWRcfrImUzesDLG6LnCQ8qdmgfbJ0a58
         72rVjLp4+aRgPO+LBgzG1RzK0pUcLgjunRcTes+3PB6QWIy+093JBuMWSwOfOqesyRFl
         rTcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Mu11dPHWCCjmnha3Uv9U8mpnGxhSAudvWTZzGIdQLyU=;
        b=hs1LKXNRFGHYp8WE4pPICsWkz/gSistU+g2l1zZswuq0lMNPNUADZfxL227d6sSBjE
         mOno4TeZ9gRNFytsZW0eDUwQlwH1Jqh4DIX2sUceiXcEd5qtFkqmlbKFRCaws2Kn69SI
         HLjrQZiF7IqFiRz8+D4Xi8lpp7wDVc6zDh3zVBCjONFnsjwueWUmmuwWlu71COTzBQy7
         E3qVWgQijLeXRNov7mGhVsKFFtQkoYhBrLPzoPuXBHK3HjrVnivC/tE4Ki5hl5zRyd9x
         ZkRD3TcK8MbFyydqJCxqq1VXe7O+fl3NKw4587sI7yS43wXiJRWfeGmyCuJitBaXG9Oc
         ZeKg==
X-Gm-Message-State: AOAM532vU3JYcjX3p+1qI9ybscEJc8Zv2GO7U7d9c9nHplOFXItZcuFs
	ww1jjV1bEs402p+KyPclqyclv8tl1hu58A==
X-Google-Smtp-Source: ABdhPJxzqhIVKQhuII8pplWNA2VW8rAghxKY/cgyVxY2/4ssRLv0Z3TkbGSqi6H8NKm1U8QlUrWkqw==
X-Received: by 2002:a63:f447:: with SMTP id p7mr13629873pgk.243.1612725019479;
        Sun, 07 Feb 2021 11:10:19 -0800 (PST)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:1d07:684d:b210:7d14])
        by smtp.gmail.com with ESMTPSA id 123sm16371911pfd.91.2021.02.07.11.10.18
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Feb 2021 11:10:19 -0800 (PST)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [gatesgarth 08/10] zram: fix sourcing of zram parameters
Date: Sun,  7 Feb 2021 11:10:06 -0800
Message-Id: <bdb79efaba481b2d9807eab59df04fb67e5277dd.1612724878.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1612724878.git.akuster808@gmail.com>
References: <cover.1612724878.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Søren Andersen <san@skov.dk>

Signed-off-by: Søren Andersen <san@skov.dk>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 3c8ad9192c1c9f4323bdc7ff28456f11db689adb)
Signed-off-by: Ulrich Ölmann <u.oelmann@pengutronix.de>
---
 meta-oe/recipes-extended/zram/zram/zram-swap-init | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/zram/zram/zram-swap-init b/meta-oe/recipes-extended/zram/zram/zram-swap-init
index 0643dbca23..ccc3aafe3a 100755
--- a/meta-oe/recipes-extended/zram/zram/zram-swap-init
+++ b/meta-oe/recipes-extended/zram/zram/zram-swap-init
@@ -14,7 +14,7 @@ fi
 ZRAM_SIZE_PERCENT=100
 ZRAM_ALGORITHM=lz4
 
-[ -f /etc/default/zram ] && ./etc/default/zram || true
+[ -f /etc/default/zram ] && . /etc/default/zram || true
 
 memtotal=$(grep MemTotal /proc/meminfo | awk ' { print $2 } ')
 memzram=$(($memtotal*${ZRAM_SIZE_PERCENT}/100))
-- 
2.17.1

