Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60FC0FEC10C
	for <webhook@archiver.kernel.org>; Tue, 24 Mar 2026 20:00:28 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6450.1774382425754678826
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Mar 2026 13:00:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=CSxvNXJL;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-48700b1ba53so41030635e9.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 24 Mar 2026 13:00:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774382424; x=1774987224; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3GHYE3VQySG7BMo8RGElkmHktyxWM+Fjl0siS4gn5J4=;
        b=CSxvNXJLBq+V4u78M6d/2/rfwTDp3zIOtKse0P8hmBnpZZkgTzuy64QF+NvBK3fmm7
         1bcR6CHTyMhXU+whTyjle6lKE3/YH1QF25xKQ5p2TFbQNfAWniDw6SrXPAu0OHOl0n5d
         5rl5hJl+FhELpVwAWOYUtHGLe0+6jElne0glbWmlyj7VPzXKAsPF+NDPM/OgVhqgF4Rr
         kT6AqZfEZunpjc22FGOUHt94v6vhW4OAMPMwS+/Ikqvkxqil2cUJenRHVAzV3RsLbM8z
         mJczSI9AOesB+wR6GJCNHJVK/9pMXCAanGYWmMoXCuiEyIZUlgFzHWroEQxBLPesME2u
         zSpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774382424; x=1774987224;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3GHYE3VQySG7BMo8RGElkmHktyxWM+Fjl0siS4gn5J4=;
        b=fz3lN5e2rR+L6doh/izMQYCbWe5dIB0dUqnmh2QFZ328noj8SfbeV0y+dCZoMdxFyt
         vd3eidElYdCoJiN2I8CQVS/I3svoDNhSj/xWXdakwyb+u4X9lPTOBJiwCrpkmBGOEM11
         X/JJCxHk5eKuDIWNs9AZ4Gqy/rP5rbZyOz7BB0n/oq24bUPUniwYFzVFGue3bp+1aozr
         8AJBiF9sLqDtiTrK07VQNA05rf3bB1i1sFRBqy18/rNWJP4gtYGAWC26Ip10/Vb6bYnW
         zcMl/S/OmVxsffbd36CG1bIQpLcrjakqq6HpBw/xbJCVZpcKmyhVe8NcjAo4NimqOVly
         Wu6A==
X-Gm-Message-State: AOJu0YxDhoTnbomh9fwtD3mDWXuxsQyTOxHj1nopHp3KlacGsbRGAoBi
	nDXnl9BE9/Aoe7GPprVv82QCXv4jJJV017+UQ20FHPmeY8tG7ZuUHzezdAacQw==
X-Gm-Gg: ATEYQzz+Ai6oNGYRnGOdo6m68DfBIhbDUtui5EjWaUDNJ1+yKwdR0lYSY/hEG9kVbN/
	ewgRpFabhfZk1rx5/ZZmhF70zRzOli0rUoR5iXdomfJdQOI+ii9ew+uUX7INHnXEzP8HjUkKGzE
	2N9ENXMZusg24t3XuO93doeJWCzCcGP8jc7KrnsPScSLcILQOxEMCsvmBacFId5H2ypuyeGRlsC
	YzzU22TPpdbnxLSTnzRXo/00psDi/Q2ufZfhURn0UOzozVcujV9rQbjNNTeLlDhO0WPu4EPQDuk
	TpwXWz/s8EEtkDA8F4QgK+PSoQ1WRO5aO5HwEk8zdKCtLiDCdpVkEc+1G5b+O9DQLRSo0lL/wGN
	k3SJf467M7OJ/WdJgSmCTsVkERom/6iKz+39jDEfzKCz58szYstSfa99vayPLSHRfwBw8U8Fjpb
	st1gPQamRWjxVTRRHL1KfeI87FW40Qnpw=
X-Received: by 2002:a05:600c:4644:b0:485:2fe9:336f with SMTP id 5b1f17b1804b1-4871607e225mr8846155e9.30.1774382424043;
        Tue, 24 Mar 2026 13:00:24 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4871728f5a7sm4116625e9.2.2026.03.24.13.00.23
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 13:00:23 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 2/2] python3-txdbus: add missing RDEPENDS
Date: Tue, 24 Mar 2026 21:00:22 +0100
Message-ID: <20260324200022.3831228-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260324200022.3831228-1-skandigraun@gmail.com>
References: <20260324200022.3831228-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 24 Mar 2026 20:00:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125590

This module depends on python3-six, otherwise it errors out:

>>> from txdbus.interface import DBusInterface, Method, Signal
Traceback (most recent call last):
  File "<python-input-1>", line 1, in <module>
    from txdbus.interface import DBusInterface, Method, Signal
  File "/usr/lib/python3.14/site-packages/txdbus/interface.py", line 8, in <module>
    import six
ModuleNotFoundError: No module named 'six'

Add the missing dependency.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-python/recipes-devtools/python/python3-txdbus_1.1.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-txdbus_1.1.2.bb b/meta-python/recipes-devtools/python/python3-txdbus_1.1.2.bb
index 01c069291c..ef6c248e80 100644
--- a/meta-python/recipes-devtools/python/python3-txdbus_1.1.2.bb
+++ b/meta-python/recipes-devtools/python/python3-txdbus_1.1.2.bb
@@ -8,4 +8,4 @@ SRC_URI[sha256sum] = "8375a5fb68a12054f0def91af800c821fb2232949337756ed975f88d8e
 
 inherit pypi setuptools3
 
-RDEPENDS:${PN} += "python3-twisted-core"
+RDEPENDS:${PN} += "python3-twisted-core python3-six"

