Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 268B3C5516F
	for <webhook@archiver.kernel.org>; Sat,  1 Aug 2026 21:45:34 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13724.1785620732955890275
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 01 Aug 2026 14:45:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=DJShLapf;
 spf=pass (domain: gmail.com, ip: 209.85.216.46, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-38ea87caafeso1662814a91.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 01 Aug 2026 14:45:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785620732; x=1786225532; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MfAZ7Os/+V4JtpUYcyoIX58b4m+vk2Msa3EpHXQBLRc=;
        b=DJShLapfoPTgpdAVkhbUxKrN0KdzK7XP9zKpNCdhgi5Xx1v4Cc7zqqxPd9PWrGEhJJ
         VHUGwtSXmJJwaQHHJ4MX6PPo9o6eUkXjPkR/KybSDd1PfjXYXEwgg9HJ8kicVq0JEsw2
         QsOtp7+ZVFf5evr2HoI5UQG+IAVa0L6iw5KXzZ0NxdwLpdxL/nlcV0O+2AH+s4uDVrKL
         IJ08Z4j1h9UILYCK0Nv0FVbzwILkHPY+fbub8KKRwRj5w7yUKcBci9/q+i//UbnwHXvI
         BONhfVeTET8lUGUVmnZ/Um8F86cISDn1Jpg766ZOCbXi5fIcwmohsRa6fhsWu4L9vuiR
         2qtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785620732; x=1786225532;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MfAZ7Os/+V4JtpUYcyoIX58b4m+vk2Msa3EpHXQBLRc=;
        b=a5QjWb2n5Kde0SgtF7tmk5eUxmSR8Eq7UoS+j8cl1N6hJBolxQQYJ7b8NO4B6CJDt6
         PUMsfDbRHilNsbYk9v92d/I/W8B8a2x/OJDCzxNDimUF9pdAxZWdjoTTdXhpcoDLjOYU
         jJ5gHt6kPc/HbveWNsshzp0NxNoak5fd5Lwx1cAGhoFSYWL9B8lGPvE2qX31++AROEYp
         ep+b//IJCgvLGWHB1O8TidVIgXLQ6yQAIDAtYHSV4mfthocHmrNifXQYAvIMtwf7BIU3
         h4Z7ky7S+TxtLU7NiqABhIce24wdwcEz2jGbOcgIJiQrzavlHJdelSG2JWOq5A6AxuOU
         xNjw==
X-Gm-Message-State: AOJu0Ywq+d40EhRzIWQS9IOjpJxWEOgb1fieDzcSZxp94vErpve/OC/k
	93JZaw9NMN9nwYwO1dGqNdB11vfCHzxeeykkGB/XnLHbr66PPLob4MV/9CXORA==
X-Gm-Gg: AR+sD13YfPXt8oBQlV1u2PdEVXXAOcRpkul/BQ3fEelQ+JGwn93gBcvT7YvLrcqHiku
	T5NB1g5uZyXN/cwa9GURzyyXV0TjhBfMnXlB7l9OTynb7MYSMj06YgggKa2WtGXUvQFajaqhgZg
	3sBbzsCQWk/qivNpE1Y2W6hlslnLFhIC1k3MBT7gQj9K8tEOV+yZt4slMyUyDzWd5tP0HR7w1m6
	unEaPwA2PJ1VekslAgq2ligaKt6uyPRhPX5nCoBK4H4DI0ki2+XZE23143+7F68LkUTHgnczRag
	pMQJijq3w7S0vR+d+VusegKmBNUFY8xeJR7aa4YUzA3Laxv3DA/97z5Gl1lMEL8XWnne9e20MpM
	e0DIY3kAmYY14JS4+rMSMMag0umdN6564k90tv0TS2gaajy96srLKoW2+J76H87QvY92Ac/4M5k
	t/w0p2Kpk71i6dFA9f33p27dVhlHmlaT1rBydLdHv0dEtZqbKo7YmYktYqLF8WNx4AwlJe/Cmaj
	6V88tz/uVkj+BoSxuUZswf8GSZ961syNm6rquT/6FfxdAYV+3gjqaBvtCVTKPYRPuOSkfpwE08T
	bkZ7mbef2GkI/YUTb31lGiK4qox2VLY5xt29gGUMG7FrCg13312kjyjAOuSJaafAYkJZRB4ussy
	llg==
X-Received: by 2002:a17:90b:2dc4:b0:38e:ad9d:1151 with SMTP id 98e67ed59e1d1-38fbc3f807cmr4559174a91.4.1785620732210;
        Sat, 01 Aug 2026 14:45:32 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153dd4e5b0sm19105102eec.1.2026.08.01.14.45.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 14:45:31 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-multimedia][PATCH 04/31] libmpdclient: upgrade 2.24 -> 2.26
Date: Sat,  1 Aug 2026 14:44:59 -0700
Message-ID: <20260801214526.788343-4-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260801214526.788343-1-khem.raj@oss.qualcomm.com>
References: <20260801214526.788343-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 01 Aug 2026 21:45:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128621

Upstream changes (NEWS):
 * 2.26: fix a NULL pointer dereference in mpd_song_dup() (2.25
   regression).
 * 2.25: support MPD protocol 0.25 (song properties "RealUri",
   "start_ms", "end_ms"; tag "DiscSubtitle"); switch to C11; fix typos
   in MPD_STICKER_SORT_UNKNOWN.

Version-only bump (git tag v2.26); no recipe/packaging changes needed.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../musicpd/{libmpdclient_2.24.bb => libmpdclient_2.26.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-multimedia/recipes-multimedia/musicpd/{libmpdclient_2.24.bb => libmpdclient_2.26.bb} (91%)

diff --git a/meta-multimedia/recipes-multimedia/musicpd/libmpdclient_2.24.bb b/meta-multimedia/recipes-multimedia/musicpd/libmpdclient_2.26.bb
similarity index 91%
rename from meta-multimedia/recipes-multimedia/musicpd/libmpdclient_2.24.bb
rename to meta-multimedia/recipes-multimedia/musicpd/libmpdclient_2.26.bb
index 2e59d7624d..2170a28c19 100644
--- a/meta-multimedia/recipes-multimedia/musicpd/libmpdclient_2.24.bb
+++ b/meta-multimedia/recipes-multimedia/musicpd/libmpdclient_2.26.bb
@@ -9,7 +9,7 @@ inherit meson
 SRC_URI = " \
     git://github.com/MusicPlayerDaemon/libmpdclient;branch=master;protocol=https;tag=v${PV} \
 "
-SRCREV = "5073329989bf52676d8c446176a1d29ed3ffccca"
+SRCREV = "ee11992a793e16bcbd81eeef38d0cf20c0396cd3"
 
 PACKAGECONFIG ??= "tcp"
 PACKAGECONFIG[tcp] = "-Dtcp=true,-Dtcp=false"

