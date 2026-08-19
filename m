Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C174C5DF88
	for <webhook@archiver.kernel.org>; Wed, 19 Aug 2026 11:26:17 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4904.1787138771459260146
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Aug 2026 04:26:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Ehocwga5;
 spf=pass (domain: gmail.com, ip: 209.85.214.179, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2d58efc7356so9517945ad.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 04:26:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787138771; x=1787743571; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cnVzTbARb9kvsCxtOnhs/MFqsbXqKksS1IoegWY5gTI=;
        b=Ehocwga5sPHFPgDk+1r5ahLmN9PvraeuEnQ+emashRNfBjPZAa+eC6FQhIWvbitWyM
         o2MWN4bVubdtkK22hAkW5d1QM2ZOSusXCssGYjSa0+lSAyd5TkK9ye90GowCuhpdWceR
         RTVkL2Ad6rhjKtLhkP8MYKCsapn9r2IVAOwtBNihiHZQo+lsJWrnp7fu4b8IgXplFtTt
         42uYUSlqm9JKfR2cHUw6EPBAlw4bYBiBygAiibKaueJ5K6IpPvjuoowFDk27arg9jihZ
         88RgmMmwzQoV7nKlG5IAofJ2yHyaUrJR5ehkSsc8aNg4uVoRec8olNTMcCmdGNuMAftC
         e5MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787138771; x=1787743571;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cnVzTbARb9kvsCxtOnhs/MFqsbXqKksS1IoegWY5gTI=;
        b=FiNJ/MApEll/5m3CRtE3PRSg9dJtgP19GrXb42+2EzcooNy9iz904RtZDQN1GmWDZp
         zHyUX3+BEQv2EH5qPpX8XjlXtniOmMwDpBnmndQY2rTmagKeTLHZAZ/BaByGKj+/DPw2
         lfy/K6nhriMJimTCKw0ZAwrAD3+UM1UBGfuc4j2OC3q2P2YR/duqt9g9Hde2NH+xihw1
         vB9dlKYM6897poGrr/8AemdNaPA57+5keT429dCIn3PDxh8whGV0djpVYq7PJkyMUn+X
         vfi3nZsIixo03wArqH8XyzreAYC0APk+/Y6zif1vK90gNcK/iQAikaO/gMlbZyOKBScF
         WuNA==
X-Gm-Message-State: AFuF++kxmeojGHoxkE6PwLeG8SchYRqB97xjU6eRgfZxmCaf98xWgwyu
	fplHqhWh0FgNIKUUQhxsOF1av+Hi/VaeWk9hb8E1GhtZ+jjWbUhk2fiMrT/Ah/ib
X-Gm-Gg: AR+sD13ChQcaj5J7eXS5j6UoCQdBf8FLgBVWciD0s08naXlg7uqC5GHaY1vvNE4KEDc
	v37bC1i6XBdvRtYQ89dm9GNiEI8YYByctFQBWlGi4IoJR+bNMpWXttJbD1CknDrb3UDsO/ELQow
	4X3tBA3D94uEluzH44Q6pfHApr8TUX+CgrV5Aya0Y9+6yTI6sxMaoNK2hCCTYZLplzzIDEV9ryw
	DOm+tSZwJPWxUWBaVIGEbIhsv/dzyoMk956yze10Unp5TUhZUbLAORoDm6cczJSrd9xfRRiFzy+
	kInq7THfc80L1d9QGw36NktDXjqlzJQtk4yMJSzRtU7D4UBQMWdcmBrYxJi8zLqCZgSP6btvXnH
	H7JfWlD3ta8l4v+zZ55ofDk9iyU01sGgtd6TNhKEqbtkLEed3fyWk3mv98KepZwlkLEDuufDeEX
	sm7K+KU+k4o6/5JNlLLF34K5wFkV8TaeGh7xpGXYXEOxFRzMkHc7guLNB6HGHx9V2ZdHaB27fbf
	PaNpzfxVHOI
X-Received: by 2002:a17:903:2f92:b0:2cf:47c4:3d1a with SMTP id d9443c01a7336-2d5fd59f9e4mr67059505ad.3.1787138770779;
        Wed, 19 Aug 2026 04:26:10 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327c2a92406sm5073764eec.11.2026.08.19.04.26.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 04:26:10 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][PATCH 5/7] libyui-ncurses: add UPSTREAM_CHECK_GITTAGREGEX
Date: Wed, 19 Aug 2026 23:25:51 +1200
Message-ID: <20260819112553.971109-5-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260819112553.971109-1-ankur.tyagi85@gmail.com>
References: <20260819112553.971109-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 11:26:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129358

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Also add tag in the SRC_URI

Fixes:
$ devtool latest-version libyui-ncurses
...
INFO: Current version: 4.6.2
INFO: Latest version: 43018
INFO: Latest version's commit: 7009e514ecafb1e25e0cc5a4ec1e731ff8af30ee

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-oe/recipes-graphics/libyui/libyui-ncurses_4.6.2.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/libyui/libyui-ncurses_4.6.2.bb b/meta-oe/recipes-graphics/libyui/libyui-ncurses_4.6.2.bb
index 43a79e26ff..d2d786c66f 100644
--- a/meta-oe/recipes-graphics/libyui/libyui-ncurses_4.6.2.bb
+++ b/meta-oe/recipes-graphics/libyui/libyui-ncurses_4.6.2.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://../COPYING.lgpl-3;md5=e6a600fd5e1d9cbde2d983680233ad0
     file://../COPYING.lgpl-2.1;md5=4fbd65380cdd255951079008b364516c \
 "
 
-SRC_URI = "git://github.com/libyui/libyui.git;branch=master;protocol=https \
+SRC_URI = "git://github.com/libyui/libyui.git;branch=master;protocol=https;tag=${PV} \
            file://0001-NCurses-cast-wchar_t-before-streaming-to-narrow-ostr.patch \
           "
 
@@ -12,6 +12,8 @@ SRC_URI:append:class-target = " file://0001-Fix-the-error-of-can-t-find-header-f
 
 SRCREV = "e691b563262306a40a61bbf228839fa06e4f0516"
 
+UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)"
+
 S = "${UNPACKDIR}/${BP}/libyui-ncurses"
 
 inherit cmake gettext pkgconfig

