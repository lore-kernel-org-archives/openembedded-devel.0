Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B434DC47422
	for <webhook@archiver.kernel.org>; Sun, 31 Dec 2023 12:23:43 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web10.219012.1704025418837004130
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 31 Dec 2023 04:23:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Yz1NIi+W;
 spf=pass (domain: gmail.com, ip: 209.85.218.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a22f59c6ae6so952288766b.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 31 Dec 2023 04:23:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704025417; x=1704630217; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2G8e62Wmu8V4X8z1xs/RdP9ZR9NhH/RpR3korQiFdV4=;
        b=Yz1NIi+WeSEMbgTBiL2cDv724ZUGPoU77f7O5sPPD+P/ooDnjbecOCYQmJCa3JWe6Z
         2yvbXvbIz9IYOKTwA2lE6keqWyPWZD7NnsUu7pNVPzNiMIC8jC6qnswW4wmYgLFaYX44
         TEec6XGGdNODbv4Ek6Na31jPZ2qy1/SjjNXDMOZqWEkxG1dwszWKRvmFJJAhWVoVlULU
         81GDutfnmsk/6wUF1blmqeteoYlH3WLQnO2dY9i6n9U+VVYleV5jUEIP6wA7heNIudQ3
         xHeQrw4V5mVXb3k3YGxOoQXGgLu7ebET4wQCoOzkTxtn899mhr0vn/CkBAdRtR06st4k
         7jYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704025417; x=1704630217;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2G8e62Wmu8V4X8z1xs/RdP9ZR9NhH/RpR3korQiFdV4=;
        b=mxWpkDMDx2WpcuSAsn5Eulcbm59xlONlBCvjA2F0iZbbnzSReOgLD6+YaKkL6zOP9p
         YsQPD7tsm+L7D8cwrbWlX+MZgSRKXGBn2A2UYaQvOW7/xfypKRxrFyUJ982oFDBSom/Z
         eYC4IlapUQ3+w1Afzm8GOlP7MothAvc73ND2L/rwZJdN9ERUvYQvz/wZMprDtKzCLUc0
         DP4I/0F4DDUjENUauMM33IHhw6M65c8bNsIqZcjvvoHQ1v3wRdaERTGGgr/dOApIiCVV
         GdoBEIO8xFhGaCZamdwpG6EPfU3g6vVWfCML+ixEF8emQYozbK8V9VZyvXkkBCQ3CLtA
         YwYA==
X-Gm-Message-State: AOJu0Yyug6HS3UAjtOYZZkEgJPL5Jqya5bjkI3Xl6GiZNvBmHJrgJX8Y
	MbN9WI6qZ/IE07iVIgc8yMS2QMJnyxQ=
X-Google-Smtp-Source: AGHT+IHcSWA6J1DD9VY1MZvIRllmom2jyIzTALuI3tuzE0o6P1tvmUXFWfXz0anQrtcLksubhjM/tA==
X-Received: by 2002:a17:906:1742:b0:a1d:fed:38d0 with SMTP id d2-20020a170906174200b00a1d0fed38d0mr3450448eje.174.1704025417313;
        Sun, 31 Dec 2023 04:23:37 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id ay23-20020a170907901700b00a26aea4942dsm9155474ejc.123.2023.12.31.04.23.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Dec 2023 04:23:37 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-devel@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 03/23] audit: disable python bindings as incompatible with python 3.12
Date: Sun, 31 Dec 2023 13:23:09 +0100
Message-Id: <20231231122329.405225-3-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231231122329.405225-1-alex@linutronix.de>
References: <20231231122329.405225-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 31 Dec 2023 12:23:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107954

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta-oe/recipes-security/audit/audit_3.1.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-security/audit/audit_3.1.2.bb b/meta-oe/recipes-security/audit/audit_3.1.2.bb
index 5380e9022..1f2c821f0 100644
--- a/meta-oe/recipes-security/audit/audit_3.1.2.bb
+++ b/meta-oe/recipes-security/audit/audit_3.1.2.bb
@@ -32,7 +32,7 @@ DEPENDS = "python3 tcp-wrappers libcap-ng linux-libc-headers swig-native"
 EXTRA_OECONF = " --with-libwrap \
         --enable-gssapi-krb5=no \
         --with-libcap-ng=yes \
-        --with-python3=yes \
+        --with-python3=no \
         --libdir=${base_libdir} \
         --sbindir=${base_sbindir} \
         --without-python \
-- 
2.39.2


