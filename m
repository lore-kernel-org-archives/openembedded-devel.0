Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BF68C83F17
	for <webhook@archiver.kernel.org>; Sun, 13 Jul 2025 06:30:41 +0000 (UTC)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.web10.52280.1752388232285021134
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 12 Jul 2025 23:30:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=E7COPUM3;
 spf=pass (domain: gmail.com, ip: 209.85.215.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-b3aa2a0022cso3446860a12.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 12 Jul 2025 23:30:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752388231; x=1752993031; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mCioX6yqlUzc7ckNS0C2LQvPpixnA/ekFbYZhsCrkNM=;
        b=E7COPUM39m8or+pGW6wWLcl9Da0RN40VjaUS2KwW5pqJym+VD2DqFNs0xdJVJW0ZGi
         1fahVbylVAhFfqu6l4lTPTw7eKY5hF3Vwtl+1V3OwqJratZqOD1o7cZ7fHu27sniuA6D
         f792kcDG2KsGRX5guwEvaGYKmObzPT3KnXnp8CYLlX5TJYnBLSCTGROSr+WIFttPkmHs
         Fy7dFvs14JVn9L72ThbLL3/BdFYp4tWOszsbWbKl73bFa6jQszaHpFeUmJVJLwHi8I3U
         IfIFzHMbyvT4nqE3U75FXyMapD/+UEGcJ/sKPiMi6Cofz7auVP405sGIJeMQlznV+F2q
         6UXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752388231; x=1752993031;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mCioX6yqlUzc7ckNS0C2LQvPpixnA/ekFbYZhsCrkNM=;
        b=US2jUX9PJxqvSGckkBdhktFaKyNGQr1JVUjsf8YB0vMofX5LVfuVVZu9evb8zHHFgV
         PlBaOn2oM+mFLEaU/qBamOXM2tOfH8pXsOzEgZqaRlWqQ7nMzDVVWjUrTc4m5ar1JVb6
         xaVJkA4S2DhY2tTzkGecZpQytuGi6ffsNxUQowdS9JCa6hMeeLnKyF1EwtgZAGTxLGnP
         xDtUUGGc66YyawpDt2Io92XoXLPRrQnsy3/SKsXKa7KsLuiDUKrV9F8TkW+rrcgIZG4t
         m/G5zwXj1TFBkfLZrnQdH6/lu0IKYFOTPypRmPv75rpczadlEO059lfG3FDRrzTuEB+w
         A7Xw==
X-Gm-Message-State: AOJu0Ywhf1X/a65O2WRxcXO3wiDQEKl0gd3vxAY9ExubtEpBPGtXrpwE
	a6XuctxUVY5jeu5saMYBuuaQ7xEWQ2zUVlTvLWOM/Xelwyyjd25o3ZGcHvAZig4f
X-Gm-Gg: ASbGncuywamVHtUzE/hWV+mqyqW1zEBpd0DtXUCH4uOGUWoWGE/iZOYvrPhopFC3Azu
	ShItYHoMeCvkfnj3SsNqQi1+2vUsN4OumnF2QenP8yzU0gI/VY/28wtwG4DIbM8vZ17J+QL5TbQ
	BPEfyoKi39LgfZZlrTDMudX4spLXqVEtjsCJLk4YxsYWgtgOtfreOhU3LHYz7MHKSC00BHtxeEx
	hIbnn9qifqiJNvYlhryOYmBrwQeMAOrNLdq4esbzIZHPuth7cfrPRanehtpTNea/Yka3V0a0PtA
	flZpECh8xVN3YaH3s8RpPdp5pagGKzmVDwYZBNXuGPdACtuJMT7tROi0Xhak5WjvQc49Lvrnv/S
	8zVy4N2joshVWdg==
X-Google-Smtp-Source: AGHT+IHWc09p8DTOh3ostB1ZfmLTQiD0Q4H0Tod3Qvs4zuhXEr5bERDB4/qEcwTje44uRc7Ft8+r1g==
X-Received: by 2002:a05:6a20:e198:b0:220:94b1:f1b8 with SMTP id adf61e73a8af0-2311a7c0f53mr15961497637.0.1752388231263;
        Sat, 12 Jul 2025 23:30:31 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::1c1d])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b3bce529689sm4928927a12.52.2025.07.12.23.30.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Jul 2025 23:30:29 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 3/7] obexftp: Fix build with cmake4
Date: Sat, 12 Jul 2025 23:30:19 -0700
Message-ID: <20250713063023.3538218-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250713063023.3538218-1-raj.khem@gmail.com>
References: <20250713063023.3538218-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 13 Jul 2025 06:30:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118496

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-connectivity/obexftp/obexftp_0.24.2.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-connectivity/obexftp/obexftp_0.24.2.bb b/meta-oe/recipes-connectivity/obexftp/obexftp_0.24.2.bb
index 30326e89ef..dce7e72c8b 100644
--- a/meta-oe/recipes-connectivity/obexftp/obexftp_0.24.2.bb
+++ b/meta-oe/recipes-connectivity/obexftp/obexftp_0.24.2.bb
@@ -32,6 +32,7 @@ S = "${UNPACKDIR}/${BP}-Source"
 EXTRA_OECMAKE += "-DCMAKE_SKIP_RPATH=ON \
                   -DENABLE_PERL=OFF -DENABLE_PYTHON=OFF \
                   -DENABLE_RUBY=OFF -DENABLE_TCL=OFF \
+                  -DCMAKE_POLICY_VERSION_MINIMUM=3.5 \
 "
 
 do_compile:class-native () {

