Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A71ECD4842
	for <webhook@archiver.kernel.org>; Wed, 12 Nov 2025 19:36:02 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6232.1762976154302265219
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Nov 2025 11:35:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VW0W984t;
 spf=pass (domain: gmail.com, ip: 209.85.221.54, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-429c8632fcbso28663f8f.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 12 Nov 2025 11:35:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762976153; x=1763580953; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MkaqTICaZQWLpoIaBBS6Fo2MgvUoIxM2ssonplC4gDE=;
        b=VW0W984tW+37FmR7+2aIRYF+uU/ut2u7S2YEGmMkSzxQww0GEvu89XIl/hPanNuSuc
         kZOuYPOanC1Tqc7lU3p4jqDVuSlZQ3+64KGHqiU3sLUnnlxlpARIOFME80s9O/0yuBdD
         f9CorIJut0svMX6QFmLqpgmLw6mUDQkMKi0fXZ6w9acPT08C0+rMMllELAu2UZi/5+em
         FVLvut4CsQJQPrMDwsTuQRU0/2acNV8hAvlr7oiXwrKeqzCdfZcIcgdcgqY0L+xMHGqZ
         oHdRtVYPItBqJgzH4EqGX7ZlR2k+W9NoArqXTAegtrdh8SIXTugJafeK/S5RbkxsC3g0
         UdMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762976153; x=1763580953;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MkaqTICaZQWLpoIaBBS6Fo2MgvUoIxM2ssonplC4gDE=;
        b=eowkWUIiapxGrQuWxDPZtemMlDQRc/og96Qrfc65dyT+IN6tQGkSXoxbaLk7WxMS8e
         agmgBuP5nBPWEIwRrXBIYgW/EYaaphpmrNbzXkQu/3L6AiM+3K4Jzx7Re1WtYUGsXU62
         BcAbWngQbII/HMUMDeuVqvoUK00oifks8jaSSeEG1jJrMTPHjeTv4Taf3gFM02QwJNIj
         LXiW6ZnMpOQ8fjatnQztY5tA6x0BEMrKMxpSjgChu9YjDoxnrq2vygi3DSTpksnvUPp6
         wTs5AGKblqatL/GzEK2tEm318CoHG7/QTz2dkZCexz5QGHXDmqpvPY3lfjtEYir4JaEu
         3S8A==
X-Gm-Message-State: AOJu0YzFcCnuohmdxJwgdyWGl1w4a1R+EIsTYVefjZkOUNWNMMFnvQX+
	rmRE618RTAAtztjQ2WBmti4LUGfU4qftmIkd6lFzs7vamnk3y5jJzypZQfwnJBFy
X-Gm-Gg: ASbGncvDVHWaf3L58fCPktuV0WA9ozuBivyOf6meSYKxuIwCRkMc4pqw50UzKPJJfpa
	fZfs+6oLpa71xaWD4p1O7po24saxN5tQvD/X9l/i3OPwETjBuTgfcagbg2YebxYZFW757SmK3Qx
	nqgkT046Ksv9TG1KcAyr+zQ8D9Pur2P5+q/o4XpWf6lJZBARkiPe5WxnJWHoeXsCTrLS7Q0YJbi
	r0fdhkNDqVVeCYQ004Dzo3QKBDvR0qY1nZFS0MxNVmsEYrYUF8EmxB9fy2NWKaSTeBd7j/YqO3t
	gUc/xVDiYaVTQfDGu73+BMUCKk40egJSSbR2njPDrWb5n63xiG2TOzgkSGi+6gD7+OezykyJRH9
	80XYRQcPoggpV0FdNwvUE6/u+AK+0MBi1g269Wcp+pVHjk2iNEmrsz+c5Gala5ctp1D3StCRROo
	in/aZQuKKf
X-Google-Smtp-Source: AGHT+IEFUA2uMgG9NFqTOwRcsHmN7k1DEzwib871PQ53HUBp8fH3TpSMt8L8IkoL0Q0a33kdLIfafw==
X-Received: by 2002:a05:6000:40cd:b0:42b:4803:75e8 with SMTP id ffacd0b85a97d-42b4bdb44c0mr2816082f8f.43.1762976152615;
        Wed, 12 Nov 2025 11:35:52 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b2dd927c9sm28723881f8f.27.2025.11.12.11.35.52
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 11:35:52 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][kirkstone][PATCH 13/21] mpd: fix SRC_URI branch
Date: Wed, 12 Nov 2025 20:35:33 +0100
Message-ID: <20251112193542.1589821-13-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251112193542.1589821-1-skandigraun@gmail.com>
References: <20251112193542.1589821-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Nov 2025 19:36:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121574

The original branch was deleted, but the commit is still present in the
master branch.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-multimedia/recipes-multimedia/musicpd/mpd_0.23.12.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.23.12.bb b/meta-multimedia/recipes-multimedia/musicpd/mpd_0.23.12.bb
index 13938444c8..0b4e9e3df1 100644
--- a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.23.12.bb
+++ b/meta-multimedia/recipes-multimedia/musicpd/mpd_0.23.12.bb
@@ -18,7 +18,7 @@ DEPENDS += " \
     fmt \
 "
 
-SRC_URI = "git://github.com/MusicPlayerDaemon/MPD;branch=v0.23.x;protocol=https \
+SRC_URI = "git://github.com/MusicPlayerDaemon/MPD;branch=master;protocol=https \
            file://mpd.conf.in \
            "
 SRCREV = "d91da9679801224847c30147f5914785b6f8f240"

