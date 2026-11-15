Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3810.1794728997905329675
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 14 Nov 2026 23:49:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=gvpAL22n;
 spf=pass (domain: gmail.com, ip: 74.125.82.171, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-37600b0db49so3070422eec.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 14 Nov 2026 23:49:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794728997; x=1795333797; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Bgjy4PiL2ZNno4Q8qxitOBJ8uoWSNZ5X6Tzpod7qci0=;
        b=gvpAL22npTXwH3Immw07cXveWiWi8762EM6x4p6YRAe0knQRq2pBvnIfGCYqjNyZcN
         Ai9oxnuxQrDbe+qhhHt0b9ZZUz7V8K4J9Pmd1Uc7OQp1YEXyWVpXuiACgwmTEY4ydBE4
         xlJILuJZWoq+Ya00ogncC+c9S1oGN1GnaRzlg8o8hUdNKA2dmg/degS0z6XZR0A3UJo+
         nUkVrL0gHGgSovnaV3TyBZnBU5FlIaUuthZi+MhAeNyJwdET+UJh9bZHitpC4RRQnez9
         iweNBse8egpZM6aMbItOkUsAy4iYkuXVXzsqlAL4766QCaBtuSOYtv95wFCsNTh2Wc4d
         7CqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794728997; x=1795333797;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Bgjy4PiL2ZNno4Q8qxitOBJ8uoWSNZ5X6Tzpod7qci0=;
        b=ZDBZH+K7vnJmKuB9HA2naRAj4llTW35baML4OnfOT6h+pV5q0IgXQUi7lcF6X77abC
         tSDz1JmwYj4R/OLuf4/OQCIAHSkIorkKfkcI/pZoV14X1PjrJ/iAGpdehyQlYNxR/y45
         U9PuUw0i5Ck3BU8H50kJ/VRvVvR0slHoWvzt/qrAZlHw1TNro73lXKLP/A6E72PAGJQj
         Osq51Vw7Zy9ywAhV9qiJHxsy9uBzpYJ1Sq0z2nn/NWYDfreUBigZhlu4ejZWRljny4GA
         hsKScj5cMNo3Jd6FKPcrjHnG4ynqnDrj15SNgLfePbLVSZu17OzemPc7dpTQnPXDE3Bg
         iQcw==
X-Gm-Message-State: APuU4Z+kcsMduIDCwN7Ij9jvOlN7nWOfTlm9PH45n0VzEIXz9J2aJYfm
	uOEM+uGxdyP5hgJmwXKt3C5xfBnmzmixujkkXUT0h/WkOuunBHT5PKpHHfVIVOHA
X-Gm-Gg: AYBFou2hz97MdXIrrQwsPOfq9YSdlfc8MExByEyfXk+dBSqX+IYeXdIev6MyYgGDUfB
	YIFcuGUlnnwTTjLQj6CLCGok+ZqBxXFFpWlI3BGmQun0c+7Qmey16fMi354h0+uCktyi9G2389L
	1Hj/62S28GRya7LjboQ1j5BrU3P9XnFlnTqupZrF9mOlN349dke8f6iXDSn0X+305Xs2Ghos4DW
	igNfZ5j3TDlAjKtz+fSRqb1/9aBVqFyjjHkRnJWddQfxKs39kfMja2g1mNyRFEun6WsE5kiMDtO
	+BLoG6OvtF/BNIsbLne2gGiVKr0sWTxaBy6MK2w+hwm9Fe77nI11P+1NdF3nWqB+hqx7ef904Bo
	28rYCiaNr+OFAeCQ20TxIRILGpgq8DcLNboRGv/WEwRhzbe1sHSFNLhk7VkM5YoA3ibO2NBag92
	nJ4CctQxs6jLMv7UCLAbxYo6kM278Ufo1Hije9txwz4IaG9Nyo45apWGE4a7ZGJDaohPKpdvcDs
	fG8i/iMxQ8IBmqEUhyLyv9ygw/40nRsxvuHhj8MMCPYVpg4bS4RdQxEHKkJ6DPP0Fatc2HJo5G7
	J5UxdE0n1HYg1Ig9yZCbBv0olU0UGwGQX38DfXJGri3SyK94mugZIY77FL7bnA9ZOsyRv95K/Er
	hLM+Bqoq7O2u5oASI6THbo3a4uEs+Q+mtJlLfHbMytxUhzKX2AV67K/tE4ipRMHC70v6NEd57nf
	F7Lua8KoBhTUddBh2RoQiQWVX2j7yx4hmlIFlVsqWpWTdET6mgWe4KbJPf4dUSudLR/oANA+zNi
	049NaGI34RcClLA6HEYZl0JPdCwlTkf50fNt4M2fX5QfnWDdTW17DS9jZRJhu7XrPDLPS8s6+5e
	hD8O6w==
X-Received: by 2002:a05:7300:148c:b0:361:a195:c46e with SMTP id 5a478bee46e88-377de5f761amr14576566eec.1.1794728997172;
        Sat, 14 Nov 2026 23:49:57 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3795591f4f8sm23112817eec.13.2026.11.14.23.49.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 23:49:56 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 23/96] libimobiledevice-glue: upgrade 1.3.2 -> 1.3.3
Date: Sat, 14 Nov 2026 23:48:01 -0800
Message-ID: <20261115074918.2932593-23-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261115074918.2932593-1-khem.raj@oss.qualcomm.com>
References: <20261115074918.2932593-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Sun, 15 Nov 2026 07:49:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132293
Content-Type: text/plain; charset="utf-8"

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...obiledevice-glue_1.3.2.bb => libimobiledevice-glue_1.3.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-connectivity/libimobiledevice-glue/{libimobiledevice-glue_1.3.2.bb => libimobiledevice-glue_1.3.3.bb} (88%)

diff --git a/meta-oe/recipes-connectivity/libimobiledevice-glue/libimobiledevice-glue_1.3.2.bb b/meta-oe/recipes-connectivity/libimobiledevice-glue/libimobiledevice-glue_1.3.3.bb
similarity index 88%
rename from meta-oe/recipes-connectivity/libimobiledevice-glue/libimobiledevice-glue_1.3.2.bb
rename to meta-oe/recipes-connectivity/libimobiledevice-glue/libimobiledevice-glue_1.3.3.bb
index 8b7306b598..8c23b22201 100644
--- a/meta-oe/recipes-connectivity/libimobiledevice-glue/libimobiledevice-glue_1.3.2.bb
+++ b/meta-oe/recipes-connectivity/libimobiledevice-glue/libimobiledevice-glue_1.3.3.bb
@@ -8,7 +8,7 @@ HOMEPAGE = "http://www.libimobiledevice.org/"
 
 DEPENDS = "libplist"
 
-SRCREV = "aef2bf0f5bfe961ad83d224166462d87b1df2b00"
+SRCREV = "ecc0f1ba4fca96f3d7ef060b6c53f2e0bcfe829f"
 SRC_URI = "git://github.com/libimobiledevice/libimobiledevice-glue;protocol=https;branch=master"
 
 inherit autotools pkgconfig
