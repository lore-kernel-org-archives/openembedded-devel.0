Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73E4FCD98C3
	for <webhook@archiver.kernel.org>; Tue,  9 Jun 2026 14:21:17 +0000 (UTC)
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.80827.1781014874047116503
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Jun 2026 07:21:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=ktXYFXwn;
 spf=pass (domain: gmail.com, ip: 74.125.82.182, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-30749947917so4081327eec.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 09 Jun 2026 07:21:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781014873; x=1781619673; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5UCOdPSTgNLwcroD0FB6ICiSG1sI0VBZ7dPxke/zvZA=;
        b=ktXYFXwn0DAdWs4LJOQecu4bdib/ogYuHCM7ucTO+oAKwVnM2qtTUR0ukj6TZ4M02z
         A4Ps1FWmHdQVV3CGhVu5PndcQSxe7EHf99rqsaM08K8Rd/40rJVC7rbuowUPJLxrpv5k
         8JgophPzBEASuStioEmULlTO3JRQJVKx67+9S2zC3EI5v2P6cVz919Tbo+jX7lh8Ea80
         NNw/hIrVGd3sjHt+oC/Y5uLtcBQMFFffbh8S0cDjOAvo9fJV99pzRNZLv1ub1Qq3025Y
         z0OmUgqI86774xUzo75H9rjKLb/Ji73HPh5rUrCIuwjBsQ2voU2y2uk3sGPjIvIC3sjT
         gq+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781014873; x=1781619673;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5UCOdPSTgNLwcroD0FB6ICiSG1sI0VBZ7dPxke/zvZA=;
        b=C9OdKgdv4Ln/aBmyyogp16UaDZDGFUaO1a+1wvpkqsIUuBM9QXgt8nVRa+BJ9a0qpE
         Fo0x8rtzHw94nUJYMneRq/XpPKkCjnlk9o0jVG2metAg+Imu7mpRvCIl5yPUPGl4FbWc
         xLPbF/ZrfWbDdkX98KzKA6MMH/3LH08bGNoVZMXl8Sd6HGp0/B2O/Unb4ji4DcqXf/qZ
         WCZrvMP4BcAuSO7abhTfMZkEg9luTuVuxm9oLqV+/Gxd7ZjpbUUrluWe0Msihei88fNj
         9WWly4aP4gd9EO4bos41XmxqlZnKR2uejNwhjBPceA12yCRsCbNZ0GwqgaFdhovbjVhX
         9tdg==
X-Gm-Message-State: AOJu0YwlYwvdsK12nwNqfKib5Y59ypJUuF4ul0b3oPNr+TsJX8Gt5mPD
	8thHeLtqgGKKazCBJ2C9lSOLwVQHdXBAJq10LsZETALeBKHAi88ZBv4qD27PQEKQvCMB1Q==
X-Gm-Gg: Acq92OHcd6xrqyO2e4Hn4CTvPnXsKoNRfJiBFLuP0mjJxgvakH/D/yKztIP5jXSK2ZS
	Zi0JHFdGPZbAvulz+TYMNoMe2t2FgwdwTgFIPXXTkq8S+K7GwPpZhztgbnB18i+Mj3oJxZIwHYU
	n/HXCS/+z8eRHHrAQdNOA9pk8xeiFnejx7kvwFVhQYzDrBdJlJLTYMeffRSvi9Y3JWIGbkTVuEY
	a8f/EAY69fExOO1rduwK9ww5nvtTE9SNvqAhBJQbyGFmstsb1TwdeeEhQzo+KZqQ/UM+ZsllmM+
	HInU5nObmVhmuun//SqrptH6e/F0I4F4YsBXTkcAOiDEPeWHoobkpfo8G/kOUxqsf9NOmqiq6pG
	Fl8N0YS45kj7idb/yKgqaRWUDk+WIqlKlQ0nNEFfcWHzG1QX6N3sGX9i9Z6V+mVtLLXAaKTq/5t
	2X6HgJVoW68dqJ+mPBm/MevfdA3Z7aHi7PodlQsei/eqzY/xdQ45rlHC9hs+beuWhC7sJX4QL9S
	JP3EIgGH0s+37V17e/9EOZOpTnTvQ/Vk5BqPt2m6D0VXDr6mpyoZHYFeuGRFd0dBqhneLLcQW0O
	1WVxUcuZSpPExvWQg4UG7U+eZWb6DOEv3wSttV7K2yFYFFdSfXk=
X-Received: by 2002:a05:7300:534f:b0:304:b15:17d6 with SMTP id 5a478bee46e88-3077b357e93mr13278356eec.6.1781014873295;
        Tue, 09 Jun 2026 07:21:13 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3074df3b234sm27099386eec.23.2026.06.09.07.21.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 07:21:12 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 05/11] font-bh-lucidatypewriter-100dpi: upgrade 1.0.3 -> 1.0.4
Date: Tue,  9 Jun 2026 07:20:59 -0700
Message-ID: <20260609142105.1439225-5-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260609142105.1439225-1-khem.raj@oss.qualcomm.com>
References: <20260609142105.1439225-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 Jun 2026 14:21:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127492

Upstream now ships the release as .tar.xz (no .tar.bz2), so set
SRC_URI_EXT accordingly. The COPYING license checksum is unchanged.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...dpi_1.0.3.bb => font-bh-lucidatypewriter-100dpi_1.0.4.bb} | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-graphics/xorg-font/{font-bh-lucidatypewriter-100dpi_1.0.3.bb => font-bh-lucidatypewriter-100dpi_1.0.4.bb} (82%)

diff --git a/meta-oe/recipes-graphics/xorg-font/font-bh-lucidatypewriter-100dpi_1.0.3.bb b/meta-oe/recipes-graphics/xorg-font/font-bh-lucidatypewriter-100dpi_1.0.4.bb
similarity index 82%
rename from meta-oe/recipes-graphics/xorg-font/font-bh-lucidatypewriter-100dpi_1.0.3.bb
rename to meta-oe/recipes-graphics/xorg-font/font-bh-lucidatypewriter-100dpi_1.0.4.bb
index a1a6d43e06..89e2f26f05 100644
--- a/meta-oe/recipes-graphics/xorg-font/font-bh-lucidatypewriter-100dpi_1.0.3.bb
+++ b/meta-oe/recipes-graphics/xorg-font/font-bh-lucidatypewriter-100dpi_1.0.4.bb
@@ -10,10 +10,11 @@ DEPENDS = "util-macros-native font-util-native bdftopcf-native font-util"
 RDEPENDS:${PN} = "encodings font-util"
 RDEPENDS:${PN}:class-native = "font-util-native"

-UPSTREAM_CHECK_REGEX = "font\-bh\-lucidatypewriter\-100dpi\-(?P<pver>\d+(\.\d+)+).tar.gz"
+UPSTREAM_CHECK_REGEX = "font\-bh\-lucidatypewriter\-100dpi\-(?P<pver>\d+(\.\d+)+).tar.xz"

 inherit features_check
 # depends on bdftopcf-native -> virtual/libx11
 REQUIRED_DISTRO_FEATURES = "x11"

-SRC_URI[sha256sum] = "62a83363c2536095fda49d260d21e0847675676e4e3415054064cbdffa641fbb"
+SRC_URI_EXT = "xz"
+SRC_URI[sha256sum] = "76ec09eda4094a29d47b91cf59c3eba229c8f7d1ca6bae2abbb3f925e33de8f2"

