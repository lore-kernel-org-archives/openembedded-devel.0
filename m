Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5ED85E6ADEF
	for <webhook@archiver.kernel.org>; Mon, 22 Dec 2025 20:27:48 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.88183.1766435261664688778
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Dec 2025 12:27:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=l8GEB2ff;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-42fb6ce71c7so3391757f8f.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 22 Dec 2025 12:27:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766435260; x=1767040060; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z2ZwwighVyq+lQwkr5gaRxEzbBLPWuCIMcv8+jrfEZQ=;
        b=l8GEB2ff2+Qbz9Fy14nnQxODrqmWHhrj+V8uiVrIRMPPFEqFILdK7s+B+NH1FU6Ibv
         Jd5mUZXTzuowLwlRhbCgdLMTGWpEgjdLtR+ATxR5BHyiKW+4PMrF4hIu3lv7nQE12A0s
         QeKrk53g8VCgvb6LKdxdqN5n+gszuqWWqiLOymga3ggbue175ex40IXOqMMIsgdqSR0+
         iNfhZlkq+UKiBHqLKz/uq93gTQ90dUQ4WxabH60nJf9gkMILcgsaXMag06QWHW+Ff0ME
         tnVtD7mypk33YFXnxwxYobkQXHHeMgyiG0/NzzAsQwAF7A1+vqbqUwo0eIyWGQV2zrpB
         XNmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766435260; x=1767040060;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=z2ZwwighVyq+lQwkr5gaRxEzbBLPWuCIMcv8+jrfEZQ=;
        b=NrHj/QssO5vwigluhG/6CU0DI28x9XI9D9tb5j6XPgFb+l0I1lD72616locfMyn1cD
         ThLi+JAjFgyYU9jcAQLReWyJChNcxHWPHdqbyRxcp45s3bkjdA72Uwp8GGaQhKHAYevW
         6NTLUHiyQr04HibqppzUoHUx5RrImk/ZmTbTi8Ha6h30ruMhqoVI8lXJV50+G+FtiaZK
         6bWfAhS5Mot9Ook1LjR4F/H6jMnzVoZ6SGjZBCLqXyCioCi176yoZ0eiapk0vKuAzCrk
         x+u0+UQxCm0c30TDVbJUZ/ZqGQsl4vgMFALO2bN4QeRGe/+GFrCm+9ZuG+/kTmWmconi
         XMdQ==
X-Gm-Message-State: AOJu0YyEaslGVoG+YpYA706oGn25o9evCwO4geWI5UpMBBjqU1RXPVzz
	/Rbqak8Svja8HKR7MwQnEzTJY9Nlmw8EWsBcUFZJ8ho9yJk+ABxrWVlBJS66XQ==
X-Gm-Gg: AY/fxX4kvYP35VLlfVH+NQud+YMNe/VHmm64ZOYVD/HIlpjZOv4VyvBQYS9csyMkzn7
	RkKZbIaj+X4oSOuGYr8OLGXgkzIN4+Gvz1dA82I/amRBwxHKCAHXRB2EY59M9Pbz/hPZKX857ME
	/W/XCqj48A4sJy4wrXPpgNBgAoX3WHQWo6nCgBiUSg3RmOgIKb7/or87oOGuMD+bLgKnvuEfYnH
	X8iiOdORArL5XRMOZlIrq4hAMLZFUf2UiU63gxfmj6GBg2CaF4gnC4iENHlcKCF5ZTkxtWAhH3z
	bifRYMC0VWvtnycyDkHlOmlPKeVew65bWZSJh3f9D3oWCPfkcjv4pSL1pIKJAyY4OJsXpypNTy1
	4hggk8MqF/4qVqoUXmE5h1mHE4x8CujD5tWt6f+QGuZkb2+JmouskiQGxew19uVx/VY8Sak9KID
	Kf8jVl/lvvPj4+lB/PqjY=
X-Google-Smtp-Source: AGHT+IEcu7hW0xkrG+VT51DoXFQTxhuXob5R3LktcbHryFEQY8qLs6iKGJsABJrI9+p1SvEir6vs6w==
X-Received: by 2002:a05:6000:200f:b0:430:f879:a0ee with SMTP id ffacd0b85a97d-4324e4c1259mr15328202f8f.5.1766435259886;
        Mon, 22 Dec 2025 12:27:39 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324eab257asm24204522f8f.38.2025.12.22.12.27.38
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 12:27:38 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][scarthgap][PATCH 3/5] fio: ignore CVE-2025-10824
Date: Mon, 22 Dec 2025 21:27:30 +0100
Message-ID: <20251222202732.3363914-3-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251222202732.3363914-1-skandigraun@gmail.com>
References: <20251222202732.3363914-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 22 Dec 2025 20:27:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122809

Details: https://nvd.nist.gov/vuln/detail/CVE-2025-10824

The upstream maintainer wasn't able to reproduce the issue[1],
and the related bug is closed without further action.

[1]: https://github.com/axboe/fio/issues/1981

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit a275078cbeaa0fafcfa4eb60ca69f05a8fe3df99)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-benchmark/fio/fio_3.36.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-benchmark/fio/fio_3.36.bb b/meta-oe/recipes-benchmark/fio/fio_3.36.bb
index 917a6e1456..d1cd2c85ed 100644
--- a/meta-oe/recipes-benchmark/fio/fio_3.36.bb
+++ b/meta-oe/recipes-benchmark/fio/fio_3.36.bb
@@ -45,3 +45,5 @@ do_install() {
     install -d ${D}/${docdir}/${PN}
     cp -R --no-dereference --preserve=mode,links -v ${S}/examples ${D}/${docdir}/${PN}/
 }
+
+CVE_STATUS[CVE-2025-10824] = "disputed: Maintainer could not reproduce the issue, issue is closed without change."

