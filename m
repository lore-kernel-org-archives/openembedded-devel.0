Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B740C55172
	for <webhook@archiver.kernel.org>; Sat,  1 Aug 2026 13:12:30 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5288.1785589949316155141
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 01 Aug 2026 06:12:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=OkWetp76;
 spf=pass (domain: gmail.com, ip: 209.85.210.181, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-84e27035206so2268094b3a.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 01 Aug 2026 06:12:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785589949; x=1786194749; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A25ja0iehuPGp0HGf+AYb1yP9ArN3EEUHxSqR9aBZm0=;
        b=OkWetp76eO7XWJYq6jN/ky6HC1ts3NXoqojc8bfZJlIAUjlML9yqSrFys6qShoXoCC
         0K/XPsXvGTYdtWdOX681tu2X6cm+fCyoDrpkQqFpfHCNm7yaH+1KKvMT2koUPOZ38fE9
         4vqEq355MJi8CCxfPKgH/nYbZa3b8ese9jtfRoKJFSXX7g34Z/NfcABZEOZwDpzLrW4e
         W67dTHN+dKgENNWerXmjNypjTwGNs4rokF0wZSM9fd57PZL9hRqq7F3z8mlg1hZTEFjB
         LVanMGZAR7YSfiIYKRiPNxJW4s17kwDOX9q2nUIJ2CtCENMSdJqRX7JaIhTEjEHy2Pqt
         b+KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785589949; x=1786194749;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=A25ja0iehuPGp0HGf+AYb1yP9ArN3EEUHxSqR9aBZm0=;
        b=Q7WJfkDOvNNo1cLmsTW+G0iVdjAvj3NFGIZ6GgDmn5q/45DrjsJzs54yiIKoRDFtLF
         DHRX7Ihibhxg5Qzz8mzk7pNegiCDwcuvh5DjJqSOBXmt6Re770bHJhem6CeO3fsvaAm+
         szVdNELi8N1UunCFCyHxKBIHN9tmcJJltYwHXxRjudntSCodnaEQBLOV6SqxevDrs64V
         dSXmklCLOF5/NI8QL6PrFi7bBeENgJh3pNVEMRZV824QQNYQYihkrU5kRe3U12venp2e
         eoMxSi88Kc0loUHFM3iZgAratv0bDyYSVhopbFYwGr7obo3EC4qT7bJJkCQXaAHPdn58
         YwJw==
X-Gm-Message-State: AOJu0Yxy4fvKlQuQYuIJcYrVlJv8wIkE/NOGlnMNgnTy9kHgwwaSGyZ2
	86UCzzJI6g321vYZ9udTDxijBiiNZX3BBkEUGksAYVoQMTDkTBhLEKGyC1gjBDWz
X-Gm-Gg: AR+sD12Mm1j8M7pXT7oRwqgivde8mA/ImdQ9t99i9kBhr96U7RjIX+lguY9ZdICYKJC
	5ruB6dWtDbF1HTdWFpufmdKqTaCBTk5weehKOmKvBJOobs3u7pU6bcjVhfnGebIG2YxCz66xM5Q
	+Qu1AJxbg6WyrnVGZDA1db1HBNSeDwkhNDo7HxwwGbV7dEH8i+HEgDnjqyyVrPVjLklSB5E7YW7
	0V0J/YBuqX5jbnxCKZjg7d1rkOoxFID+le+BQ5jY3BgyefBAdmnG4Gq1IA6dPbKGCRGLxtkpBA6
	18leCjnoy1w5OXExm9kAJhZl03l6otLJQM1SOa6sbt3z0Xl8Ez+Ldf/1BgGSlLk+5aLk6770m/N
	ElpByY2c6KyT2O1EhPNVzqmjYC3oGLxM3TE9mb9rmybYsjPuFvFtuEHF605SnQ4OCIeUGZnXskZ
	fxnGFHlj8mcjusWrQu94F+pzf5FUQK+/kjY+DfjLKB2PXXx6mI1ZclSfUq6ivxKSLpdWZOStEze
	OaMHdK4P66o
X-Received: by 2002:a05:6a00:3a8a:b0:84e:e809:dd30 with SMTP id d2e1a72fcca58-84ee809e13emr1740180b3a.67.1785589948654;
        Sat, 01 Aug 2026 06:12:28 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84edbd35ad5sm1652362b3a.1.2026.08.01.06.12.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 06:12:27 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-multimedia][PATCH 15/20] libde265: upgrade 1.0.18 -> 1.1.1
Date: Sun,  2 Aug 2026 01:11:33 +1200
Message-ID: <20260801131138.3299410-15-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260801131138.3299410-1-ankur.tyagi85@gmail.com>
References: <20260801131138.3299410-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 01 Aug 2026 13:12:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128609

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

https://github.com/strukturag/libde265/releases/tag/v1.0.19
https://github.com/strukturag/libde265/releases/tag/v1.1.0
https://github.com/strukturag/libde265/releases/tag/v1.1.1

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../libde265/{libde265_1.0.18.bb => libde265_1.1.1.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-multimedia/recipes-multimedia/libde265/{libde265_1.0.18.bb => libde265_1.1.1.bb} (93%)

diff --git a/meta-multimedia/recipes-multimedia/libde265/libde265_1.0.18.bb b/meta-multimedia/recipes-multimedia/libde265/libde265_1.1.1.bb
similarity index 93%
rename from meta-multimedia/recipes-multimedia/libde265/libde265_1.0.18.bb
rename to meta-multimedia/recipes-multimedia/libde265/libde265_1.1.1.bb
index 4d1795abb9..9a65d82348 100644
--- a/meta-multimedia/recipes-multimedia/libde265/libde265_1.0.18.bb
+++ b/meta-multimedia/recipes-multimedia/libde265/libde265_1.1.1.bb
@@ -9,7 +9,7 @@ LICENSE_FLAGS = "commercial"
 LIC_FILES_CHKSUM = "file://COPYING;md5=695b556799abb2435c97a113cdca512f"
 
 SRC_URI = "git://github.com/strukturag/libde265.git;branch=master;protocol=https;tag=v${PV}"
-SRCREV = "36ad04841c209cb8b3577ec2723d431b6bf7efa0"
+SRCREV = "4dd701fffac01632ffd5cabc5ef10deb56accba1"
 
 
 inherit cmake pkgconfig

