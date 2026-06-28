Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8A22C43458
	for <webhook@archiver.kernel.org>; Sun, 28 Jun 2026 08:11:32 +0000 (UTC)
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14709.1782634292307623557
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 28 Jun 2026 01:11:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=enIM/jok;
 spf=pass (domain: gmail.com, ip: 74.125.82.177, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-30bbe98c3f0so6036890eec.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2026 01:11:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782634292; x=1783239092; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dyq83/fTerNH25iRpvthMDkidy1khwL6jIwJ0F1F3j8=;
        b=enIM/jok+fsCpEL5jd5KYX3Vlr20Ti55vF9+VRASlkpu5FSbHhb2YzUpWN4pl750k2
         /Vyw7A3pK13DlwmfnpFcQ8JoZhnmI0JVKHgnSzmmEfoUt5Vnp5aGcrA0Jhh8VVsbUGmq
         IoDJ5cGi31I9nMNadlX8l4DvdSBy64819m5fcbGywOYHv/q9GmCdL15XSk5WpMhHFPn/
         NCccm9Ff/FlOJ3ueu8ECe9qYulITo9FtFNz9DWn4Av1oi67hOrDL3BUOEQQZuDyN5Ns7
         jiwFv3wcn/IAEXFyfTh7QXmQGPPN+KD2BClZhdXAS6pL5IPzNr5NYyw3M9gyX5ZKQtNE
         Bw2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782634292; x=1783239092;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Dyq83/fTerNH25iRpvthMDkidy1khwL6jIwJ0F1F3j8=;
        b=GWcKCiesrC0SuFXHZot1fHKsbRBnS+zHR3vFJuHBQttQ3FyYn9jcLKEU6vjnIf6rwY
         /0rRVdvbkmEy0KsFgyp+u/QgbgK4FVF93mOGnvntPOLcOodVEGzhAppCQF26XcTsrN6j
         mWzrO2ACnn/c7pfpfywkC/vD6FtIL5FLtOW6EfWdv9OJKeuQIJxYXQVtvDU3wZ+EFbLg
         HpqPUIkpc43yDLCXlImz0URPvImY5IexNVaJ1bnimg85cBCNYOTwm6DlWHuhnFvHw8eS
         mxlqPRkzS5xEmWWWHpztcK0TO1yhHAt5l38Oly0T+GWEg2uPho8ITadtGXIwb26a08aN
         IkBA==
X-Gm-Message-State: AOJu0YxFwjDIdFR/Tf4Y5oxJr1yb7Y9kLjzsT7OG+pLYXe/eWWHy/DHy
	Xq2hL5qxNjKUHh9Az1XKD0y6X7VvSH3p7N7PxtAlissHf+w2P77wV14bZ+RLIWYfJ8ASHA==
X-Gm-Gg: AfdE7clKYEVuwzN6Rv46OlcwVVdzT3D7KaaYDpbTd8WbchSEn39HI4EoLjFRaly5Gpt
	uzc7kuHw7RDJ5BQW0/8WBa9JcQxTW1WA0OaBVwpEqG8clUCMHwhSYo9N240uLrKxKmre34NtFEP
	XGRSuriDf4YPqLNQG8gEN3tfmApBoDaxbzal6skwUlDVF9zNTWPPMFSYt8L8HwXRlNDXFlfzgua
	07K8Jv7mw1tnLeZddqHP1RRdxxVTJ/kMntIGXyoRW59sNK7t5JcxQYm5oMvq6Z4m9MVqQY2b/pH
	aiUP10Hy72kBzOXm5KoQw6xVRpJzG6SfRFWt8wMLP/ZT1+k+Mek1pBBcmSlx0H6rzx+xksJ2lDj
	0HpP+lo12EIgMqVm3156FvxuxTrgJvpWS8/Kin8WL0r/VQp4L7PDT4AZMzrDoO7/8G1KPhbaQZu
	SzSULCH9CoK/SoqG8dKW+AilUReOArkwtF34evEuK9FQCLiM67QW2nHMH/zRHVejOIgkL8MuXIy
	mWWayQzdAQcipmSya/9Hjxf+64KnLZ0xKXENJRs/WTsOOwOeySVTPJsfLuIt4sBnFoQ8DERF8Fu
	0j1KX5H/n6zegPNBHp5iwcaYoWUFrg==
X-Received: by 2002:a05:693c:41cb:20b0:30c:9ab8:da85 with SMTP id 5a478bee46e88-30c9ab8dd63mr6084624eec.11.1782634291652;
        Sun, 28 Jun 2026 01:11:31 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ea81b39easm6306040eec.31.2026.06.28.01.11.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 01:11:31 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-webserver][PATCH 007/128] xdebug: upgrade 3.5.1 -> 3.5.3
Date: Sun, 28 Jun 2026 01:09:18 -0700
Message-ID: <20260628081122.178348-7-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260628081122.178348-1-khem.raj@oss.qualcomm.com>
References: <20260628081122.178348-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2026 08:11:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127817

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../recipes-php/xdebug/{xdebug_3.5.1.bb => xdebug_3.5.3.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-webserver/recipes-php/xdebug/{xdebug_3.5.1.bb => xdebug_3.5.3.bb} (92%)

diff --git a/meta-webserver/recipes-php/xdebug/xdebug_3.5.1.bb b/meta-webserver/recipes-php/xdebug/xdebug_3.5.3.bb
similarity index 92%
rename from meta-webserver/recipes-php/xdebug/xdebug_3.5.1.bb
rename to meta-webserver/recipes-php/xdebug/xdebug_3.5.3.bb
index 4c2c6538b5..02bac6f23f 100644
--- a/meta-webserver/recipes-php/xdebug/xdebug_3.5.1.bb
+++ b/meta-webserver/recipes-php/xdebug/xdebug_3.5.3.bb
@@ -7,7 +7,7 @@ DEPENDS = "php re2c-native"
 
 SRC_URI = "https://xdebug.org/files/xdebug-${PV}.tgz"
 
-SRC_URI[sha256sum] = "0f26849a5edf3d9120edc100219854599d54f923a8a4d1cb4fe4403520e49678"
+SRC_URI[sha256sum] = "f073de91bea046106abf4d6071c963ea71e58571df6ce58948ceca89d121cb2d"
 
 UPSTREAM_CHECK_URI = "https://github.com/xdebug/xdebug/releases"
 UPSTREAM_CHECK_REGEX = "releases/tag/(?P<pver>\d+(\.\d+)+)$"

