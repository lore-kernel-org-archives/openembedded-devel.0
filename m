Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF784D36134
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 18:55:17 +0000 (UTC)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
 by mx.groups.io with SMTP id smtpd.web10.27884.1730831940964484186
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 10:39:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=AWtZYy8J;
 spf=pass (domain: gmail.com, ip: 209.85.128.178, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-6ea1407e978so54714307b3.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 10:39:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730831940; x=1731436740; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XBFRqu+Lzfz0TAZ3s1hMMG0+xiZmAaaofL/P9nlmI/A=;
        b=AWtZYy8JWpRlLaDKktW1I8c+jCkVfryYTomrifxquWB4Gn2Zy9j7OiV8c57ZJgVM/0
         H3ROJWekcbwU0Pl7BL3ejwfVW568wKIPgafBtdsX/wk/RqqsM5LkOk+I70UWblMPZUKD
         Zkr62WNfq+KDriMv1Cqbstl3ixZC+iEv0zFSnQbbVkBvTMyOamETcd8fp0eyL1nNI1Vy
         LuQ2fLQ5ppIMPEQQ2b+qeXn/APK3mx5l6ADcEsNKrj0+iPe9N+L/egueSHTtPQo8M/5Y
         1LPL0s4kGacH6Nm4jyGiPEV/QmMfkBkcmqMJ8u1HJE8f00XLmn6ooBSOELuKwguy8Y7P
         JDDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730831940; x=1731436740;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XBFRqu+Lzfz0TAZ3s1hMMG0+xiZmAaaofL/P9nlmI/A=;
        b=V8jIKWNXXXDBuBlDtFbW2jjZuI3BLqoPz8Qyav9bx2ef/nHGvRdM7/CAin1Imed0/7
         cwDnLdsLl2JrTmdV+BYCN/enA8f8YWDB7Jlz7Ab6nC1jJTUMhQLeXL2k2su3RhTBgAZ0
         ScFtg2EH/p6QT5iFQjb7gLve6UKDwfBEoPS7VGlQnegYhIvBwTLidib7gsm9SU7S3soj
         efJQtp52xR1nTl5sr+RCU1IvGWhRCfvM8QlSWfROvAHHfHIkGauiglBEfLezeFlMkkf0
         Fhv/W3lV51nm4qw46YS4ZHDYq8MPJwPUcECeLj1a/XThFrkKJ13Jm6REJZoSTZ+/PGHf
         hHZQ==
X-Gm-Message-State: AOJu0YxouEd6Ifq0W19ObGF9UouI6Jz/vlovzIfnEiq1Z+4bFpQ+Krhy
	4/+Xp1H7LilDkp8SdbjaeOaqqU5QXGwo6l0bM/K2/FIkBZhQ3eEK48t9DlvS
X-Google-Smtp-Source: AGHT+IFQVevwIAVCEb/gGp+0dAQl8KfoPWg2EZ6h/xTPFzbhg1rjn/2R3ieNoGLMJ6A4Dx1Zja39gw==
X-Received: by 2002:a05:690c:600a:b0:6e2:af9b:a862 with SMTP id 00721157ae682-6ea64acc9ddmr166830007b3.13.1730831939680;
        Tue, 05 Nov 2024 10:38:59 -0800 (PST)
Received: from localhost.localdomain ([71.215.7.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55c48b6esm23957617b3.103.2024.11.05.10.38.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 10:38:59 -0800 (PST)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: schonm@gmail.com
Subject: [meta-oe][PATCH 075/161] lxdm: Drop unnecessary SRC_URI md5sum
Date: Tue,  5 Nov 2024 13:25:51 -0500
Message-ID: <20241105183658.34982-77-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241105183658.34982-2-schonm@gmail.com>
References: <20241105183658.34982-2-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 18:55:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113590

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-oe/recipes-graphics/lxdm/lxdm_0.5.3.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/lxdm/lxdm_0.5.3.bb b/meta-oe/recipes-graphics/lxdm/lxdm_0.5.3.bb
index ae4525829..4fc916f4b 100644
--- a/meta-oe/recipes-graphics/lxdm/lxdm_0.5.3.bb
+++ b/meta-oe/recipes-graphics/lxdm/lxdm_0.5.3.bb
@@ -21,7 +21,6 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}%20${PV}/${BPN}-${PV}.tar.
            file://0001-systemd-lxdm.service-remove-plymouth-quit-conflicts.patch \
            file://0001-Initialize-msghdr-struct-in-a-portable-way.patch \
            "
-SRC_URI[md5sum] = "061caae432634e6db38bbdc84bc6ffa0"
 SRC_URI[sha256sum] = "4891efee81c72a400cc6703e40aa76f3f3853833d048b72ec805da0f93567f2f"
 
 PE = "1"
-- 
2.43.0


