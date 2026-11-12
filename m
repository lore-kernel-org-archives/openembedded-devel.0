Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10094.1794478186998313720
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 Nov 2026 02:09:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=RFpIHRP/;
 spf=pass (domain: konsulko.com, ip: 209.85.128.51, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a210470b49so34218555e9.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 12 Nov 2026 02:09:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1794478185; x=1795082985; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=exaW4r9XrLUFwiIYQsaJ8DPK4UPr5G5MwcBfCND5sqk=;
        b=RFpIHRP/fYEDovRwOdMUXa7ljWJZCK3ZIYMa/+zOlaIDIKklG3UEN1pt2f9Ui5D6qK
         0J2BDnUZcOZYyCg+OQFmuMrp99zfqqakk+JNikWdUDm1UuEKy2hOxGqByebFgquokVAK
         6e0pGW0sjBg0UhaoHjZEm+91ZKg7gaiS8Uwbw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794478185; x=1795082985;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=exaW4r9XrLUFwiIYQsaJ8DPK4UPr5G5MwcBfCND5sqk=;
        b=BuhCp+5LWtQMb3uyJ96UlKcEavLtIGGUaosWO6nmZnvjXbQDmyC50Vucfbw6UcLugT
         RgIP5j81r+7mJ0dhfiL6VrPDoyx1VpRyThZJ+7rQ3upDBYH9gbrxc6HvhNdoTf+8cbpz
         dp71aqzb2tA0yxZzlBFWcrv2Mku6b7wWzAaB37yZQvYG9tJ1aKDXnKfWu/6bSwtGl+ve
         BgWVGNbPeMfwPeg1w6fvUwwcNU3t03VITPYI1LucSyhFDEofMkCDpnUgQEpmnfLKoXZM
         a2OmkRV7uBhr9yiUVR3GuAOKAet/hvwonf+qV5vkFyfC5sAGwhscnafWz34IUyPRn5Z9
         5TZA==
X-Gm-Message-State: APuU4Z85xikv5pNdvCmIAUdJFpbdbHaKUczSo0vrH764nWlt9ZyQxudn
	frKvpuY5gL2QkXVD7mkuwR65ZpTN4y2dKEWD+/GGnHmgshR6YZ1Io2FnFO+3NbRL35ghf7pQkWA
	hjiq9
X-Gm-Gg: AYBFou0V8F/vOs/elAXEDuDWTMdhlZ17fmXz0xKNS6pIGgBmH8ZOWPShjasTFq7D8Xl
	tIumKqdB08t/5FxnuqL8tBr/UnrjrO6BPcRKkMNSPgkIsRyTL2S8Mu8Wmwuk5UrJ9JZ973+MG+6
	wObCffaOGIK3vqt8zBJhVe0HmSsE/xgiavuHVvT5Qxq/pvUI5Agurqpys1kaxPC/+owysqrW+jq
	U9KcxHB7eu+RBKP1hEASWGVjWXG1aR50ufuxXyW9m8ero3+r6NBT8Z5X4dqQtRQrcZKwSkcf911
	syTdeUTaEzpff4mdGOAOQcST4spTKOJBLMsRifrMWnKV/DIApno/iXqvlrC5ydCzYvLE1LGXioK
	uk8y8MQaYFQktG1hY4EOJncfpCW+woBupeHvsEvyQj6PVmbruFpHpgfsXCFnuaedc03mGuaBQv/
	s+kN/Sd8XIFj9OcltU0ghqYhWxS4LcoYt9Iv72UBA2X/vz7cgucn/u+jZtux064s8lfzmsb2oIT
	LhcSM5Owmd3lA5GIl6Jtp5g+ipDW/5X2lwqP8zVQlrehw2OZt3jbcWDbtw/r2IGlW+rm3xL+oyy
	IY1avKd6OTYDW7JtgVb3wFvtmCa1XBqA/VhsoYnE+mpkiqw0azZ7kKD0rfqV3UiPPrXKEtxu7Si
	kgbCl8lNRJGde+XnnuEw4ItaZuHfLceMDNHG6Ie803O9tsYeZCsceEzdduBLgAv6223om4jpQro
	sl
X-Received: by 2002:a05:600c:190a:b0:4a1:e7ce:107b with SMTP id 5b1f17b1804b1-4ba0931d8d1mr97023565e9.2.1794478185205;
        Thu, 12 Nov 2026 02:09:45 -0800 (PST)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba08ddd467sm98124865e9.0.2026.11.12.02.09.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 02:09:44 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>,
	Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-webserver][PATCH 2/2] meta-webserver: README.md: Improve send-email
Date: Thu, 12 Nov 2026 12:09:38 +0200
Message-ID: <20261112100938.3170903-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261112100938.3170903-1-leon.anavi@konsulko.com>
References: <20261112100938.3170903-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 12 Nov 2026 10:09:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132207
Content-Type: text/plain; charset="utf-8"

Add -M30% -C --find-copies-harder to the git send-email example in
README.md so that git format-patch detects renames and copies more
aggressively.

Patches that move or copy files then show only the changed lines
instead of full file deletions and additions, which makes them
smaller and easier to review.

Suggested-by: Khem Raj <khem.raj@oss.qualcomm.com>
Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 meta-webserver/README.md | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-webserver/README.md b/meta-webserver/README.md
index 565269648d..c01e5488cf 100644
--- a/meta-webserver/README.md
+++ b/meta-webserver/README.md
@@ -54,7 +54,7 @@
 
 When sending single patches, please use something like:
 ```
-git send-email -M -1 --to openembedded-devel@lists.openembedded.org --subject-prefix="meta-webserver][PATCH"
+git send-email -M30% -C --find-copies-harder -1 --to openembedded-devel@lists.openembedded.org --subject-prefix="meta-webserver][PATCH"
 ```
 
 Layer maintainer: Derek Straka <derek@asterius.io>
-- 
2.47.3

