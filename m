Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD2A0CA5FA2
	for <webhook@archiver.kernel.org>; Mon, 28 Sep 2026 00:03:56 +0000 (UTC)
Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.46631.1790553833892183958
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 27 Sep 2026 17:03:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=GucYfoSH;
 spf=pass (domain: gmail.com, ip: 74.125.227.141, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2d747f01363so14329115ad.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 27 Sep 2026 17:03:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790553833; x=1791158633; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mO2u5B+RMCZ4Cxh1B+h65PBUSSei/nb2LT4FNXzpTj0=;
        b=GucYfoSHnDlUz/8yOaM2t8ejqm+/rKQ3qBLjjwAamKDED3sy3yagINAGhPlyEdyCMR
         GLWIyu7CjsZ5i57oXqU2z3dn7q5SaXIKpURVI7Bxx7VWdsdfcNjThwuzM+XFwCCVn2Is
         RZPXpZkCM8D7TIBP+n1qvRk8pgTj1S6CSlMZNd8Q4fdWr3CWs97EmADpRo+na4dVcU0X
         qvLnRG9iwUPsYuKWFtJ4c/vpNIV0A3Pdq6lRJQ6meLBMorbE+Y8C+mSJ6bLoz41tstfP
         D+J9Noi2ddltSE4ogDENTxRqkNz0cmOhKHPW6iehfD3ESMt4/Q+OY33q7z292IhkP+nA
         3Yqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790553833; x=1791158633;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mO2u5B+RMCZ4Cxh1B+h65PBUSSei/nb2LT4FNXzpTj0=;
        b=BKzwsFYpTtDbfe2QuzdpjdEqmiZVEabJ5w+3BCWtY7O4o74uPJueF5FCmAKWO81pTt
         +JshyuhCB+lQtkfZbYxorquzeTeeGsPfvXasMJjxnDVp07gwse8w5A6bKiPD17aRv45v
         m2xJLh6q9MBNDsuR3MaRkBbMKwWuqIFFykb6gxyDUtcnFPyU+ugT3G/KEgJ6POcYzAAb
         yzYXkrOleqbrtskzPATMkAR/WcYDZJTKdpZwcejI2AF+CwLGkJdX59jzrfzgIdNey9Dt
         z74ryG5TorTiG1yJx4f0VvTB/kBwp6rGXsnQ2+tB+VilDtBIGM+sC0HZZgg/F8iVxEx/
         vYlw==
X-Gm-Message-State: AFq9FYJ+dxLqG/4RNvnJbtcUzg1SJy+K6WURgEPaI1WoT2SsmKSc/Ni/
	6ZHSaS/OyKTQZUkKeBapFjnqDfZfC6hqjdOtEsxO2r+QyvPmotE4k7ZETPDzDw==
X-Gm-Gg: AYBFou29pvMPEviRU+o2atH2rrdvAGX5V/hnL3oq9ebI5DAl/pm+hhszwK0bAj/8N9f
	WMp+ZeYkrDLRwbrHo+nQvMF0lXvGFLxyNS/N0ZWPxU90yeakJOr+xQjfWN9DcBjFXzSna+Nj37b
	aobH5qvHcpoljmlbihI5YsgBxoD6/UbBPkiaPI2v7UWoT9Vsu1WSL6qhs9Ylk0bmQ1ZOv4td+qo
	oCIxYW4o+tdsvzqNAitQmz2e91Z1/EFZzx1wetHjQKgwiZFtZc1LiBbBnGqBQ/Qoqu4QQFSCWUy
	vN3SSv6Do6XVZP7zEhobob+YNTcHWp4tA4ST20fAfUsCeOkvZR3Q0T5yWUdru6HJhrE6es7n6ab
	8c6LGEhUG7OGAEykPT9LbeZyBw54D+ckTMz+5Tli57YaMhCRJUW+w2jZvKZZDuV2RDWko8jhx1A
	3ruRwVPSCmlSaPVFRNxa2c8GhZJUhFBcQEuXY+4qrfooT2qJCGNhlgaf2odK12YpTTZBp/Dgji9
	gL5xodw6VlMFGQAJLLg0TXPm+NrTPUaWQ==
X-Received: by 2002:a17:903:2351:b0:2df:3461:5162 with SMTP id d9443c01a7336-2df94b9986fmr53478865ad.37.1790553833129;
        Sun, 27 Sep 2026 17:03:53 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df913fcbbfsm32347775ad.30.2026.09.27.17.03.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 17:03:52 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-python][PATCH 21/30] python3-identify: upgrade 2.6.19 -> 2.6.20
Date: Mon, 28 Sep 2026 13:02:53 +1300
Message-ID: <20260928000302.2528437-21-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260928000302.2528437-1-ankur.tyagi85@gmail.com>
References: <20260928000302.2528437-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Sep 2026 00:03:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130408

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../{python3-identify_2.6.19.bb => python3-identify_2.6.20.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-identify_2.6.19.bb => python3-identify_2.6.20.bb} (70%)

diff --git a/meta-python/recipes-devtools/python/python3-identify_2.6.19.bb b/meta-python/recipes-devtools/python/python3-identify_2.6.20.bb
similarity index 70%
rename from meta-python/recipes-devtools/python/python3-identify_2.6.19.bb
rename to meta-python/recipes-devtools/python/python3-identify_2.6.20.bb
index e6ad7ab727..62b72df24e 100644
--- a/meta-python/recipes-devtools/python/python3-identify_2.6.19.bb
+++ b/meta-python/recipes-devtools/python/python3-identify_2.6.20.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=bbdc006359f3157660173ec7f133a80e"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "6be5020c38fcb07da56c53733538a3081ea5aa70d36a156f83044bfbf9173842"
+SRC_URI[sha256sum] = "ad729860a923858d26917c2f4fb0a1d83d27a75b1e090c06440c573f048f3285"
 
 RDEPENDS:${PN} = " \
 	python3-ukkonen \

