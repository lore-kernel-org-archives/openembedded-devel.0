Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6.1794324456642472058
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 Nov 2026 07:27:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=uWXRFXB/;
 spf=pass (domain: konsulko.com, ip: 209.85.221.44, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-490c3ae81d3so1435468f8f.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 10 Nov 2026 07:27:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1794324455; x=1794929255; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hWGyvAQ1vbv850i2q6j5gsH6F5v9VZevqTG7Y5cNNnw=;
        b=uWXRFXB/ZP7F0UbUTpVsxzkgYo1BX18zbbXS0Incl3EKcJ2Y1S87EM6nH7ZhJBJ+Zc
         KlibMqdE0YgtHgdJGmBXLjJIFy7DkDT0U/9WfKiCg5zhJGNBEiktcjcUDkXDTxg7qhgQ
         E0xmkpp0wRUyyMHO88IBbbd/4rRoyObZUE3vY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794324455; x=1794929255;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hWGyvAQ1vbv850i2q6j5gsH6F5v9VZevqTG7Y5cNNnw=;
        b=2LvEbN2wytFUJaFB87X3OPJv+03kDbGj8wjLL/uBpK6ewKHkygAcVlNRoDqlYohhFO
         QrkGqWEmpuFiEEwfGFhhMl8kgjjKhMxIownb0zpQ/xfj3RWeubnHO+3DhkVhhZjnk3rK
         LgNIt5SsnHgYiym1qRKls8Hu6T+ym+8m2eI8M9UPKmCMzLj+nF3Rh0ifNc+JFWdWhOAm
         fJlSkDU7CdCEz674fD9e6CEvF92xFAA8leg9kKnKzN1AX/SP5bbSPJNqOZMFoFRk8rTu
         6izb2JGfBAB7Fb3k/JO7PW7StjtQW94wR6CQFkuu/eLYE3By/KLUMpurx2oPinuUs3Vu
         tRig==
X-Gm-Message-State: APuU4Z/FLixv2CxA+llUMoQJ7aakFbOwN8gRY2AAqjBj9GSD4R2tu9BO
	mfm8m6mAzdhBJNZ1vCBiS7ABER5NhkZKpsF12Ta839XQepUntb4HdM2VLQDTYGczAhdxNOcObMV
	RF1tN
X-Gm-Gg: AYBFou1VS0EwRTpte4llqfU5n2vrV/GCDpYdlGZ9A1V/wHYtBUpA2Pjn5h3I4dslTnY
	NmqO0vr/pIXcWM7/L4dtGmw2dzyvkBNsmPA2Kl7ntXgRfsohPkHbSAxIqCL0YCAVNQiMQ0l/TDK
	kmc4fSpwMowURR/IPNRZesxZoIh6xskB1MOIoyFJlUmqY/BGH048iS2wItOXxc18Pvp9Zhn5ESd
	TxJl44Da1sXDkOEAKfKqsQvNcE/RuWv07Yw9m76CHm3sG9SW45zqo1GEzr9yds0msbM4lsNGf+2
	kxdKGOWzthyyQOGJZWm8D4/DllNa8EE3OdfcIUbdKUaIlAQauxjQM4SVnkYZT9l4maIqgrx5QjH
	TzLHrPmQx3OX9WZ0VQvF6lP73of/JHVvx510IbU/pDYCvKBvZrd9TgIQmS6aTz92B2JJJ1wBJpL
	flbFc0R77t4wI9tf0w4vor/lpJgA6s1VWsv1BQoPr8nLljC+hJphkHwwupjwvEbXfxizOTh3aQw
	SmcO0vG0ZFBU13zQ6YdR2DUv4BqJsbtmUI/PQNI6gJy/RUAXBmuQqJgBqTxJijNRMA/mo7YHJKO
	ZwTffF6KdeboY9RhaWuaRyn6YGxnH3VrNcyKsHTWn92ImNzTjsBaMAsZHoDv+2CnfOMCv4+dZR4
	iDUNBK1/TLB/R+9XA+eHiT/o1AmWKHXAV3jfZviiGxUNN5Bre8uQUJw==
X-Received: by 2002:a05:6000:29cb:b0:490:71a7:6f51 with SMTP id ffacd0b85a97d-49830b97c12mr4053690f8f.45.1794324454843;
        Tue, 10 Nov 2026 07:27:34 -0800 (PST)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498369a3f4esm6064071f8f.53.2026.11.10.07.27.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 07:27:34 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 04/19] python3-glances: Upgrade 4.5.8 -> 4.5.9
Date: Tue, 10 Nov 2026 17:27:14 +0200
Message-ID: <20261110152729.1065911-4-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261110152729.1065911-1-leon.anavi@konsulko.com>
References: <20261110152729.1065911-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 10 Nov 2026 15:27:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132078
Content-Type: text/plain; charset="utf-8"

Upgrade to release 4.5.9:

Cyber:

- Replace python-jose (with CVE) by PyJWT
- Update all dependencies

This version will be the last one for Glances 4.x.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-glances_4.5.8.bb => python3-glances_4.5.9.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-glances_4.5.8.bb => python3-glances_4.5.9.bb} (94%)

diff --git a/meta-python/recipes-devtools/python/python3-glances_4.5.8.bb b/meta-python/recipes-devtools/python/python3-glances_4.5.9.bb
similarity index 94%
rename from meta-python/recipes-devtools/python/python3-glances_4.5.8.bb
rename to meta-python/recipes-devtools/python/python3-glances_4.5.9.bb
index b6e718e3d5..ff52b2a7ef 100644
--- a/meta-python/recipes-devtools/python/python3-glances_4.5.8.bb
+++ b/meta-python/recipes-devtools/python/python3-glances_4.5.9.bb
@@ -5,7 +5,7 @@ HOMEPAGE = "https://nicolargo.github.io/glances/"
 LICENSE = "LGPL-3.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=852ecadc0ac7e6f4d7144d5544a3815b"
 
-SRC_URI[sha256sum] = "a1e5ed5a6488964a576d550a420c91af6f2c7c2d8df8e9fbe67c98eb38bacf3b"
+SRC_URI[sha256sum] = "c197954341ee5a7f8657e87456884b1f52af4bc966f6ab3f1d4c37cf580f5fa0"
 
 inherit pypi python_setuptools_build_meta ptest-python-pytest
 
-- 
2.47.3

