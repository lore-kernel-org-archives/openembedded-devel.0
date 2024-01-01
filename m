Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D7F3C4706F
	for <webhook@archiver.kernel.org>; Mon,  1 Jan 2024 18:50:11 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web10.12002.1704135004024353271
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Jan 2024 10:50:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=aQQ178SI;
 spf=pass (domain: gmail.com, ip: 209.85.218.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a23350cd51cso967545166b.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 01 Jan 2024 10:50:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704135002; x=1704739802; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VUVlFMyUFbqHH1zCnrlgOrt9yVwKdC+KAKtfKsX132c=;
        b=aQQ178SI3VH8HYIESrMQCkfz60kW4UmN8VQmzW/Yc00arJN1siou9lx68Oj8FLRQou
         eGDYGGIwMqkf0LMijCy64U+mDzTe5H4qe6Kjt+tQm8ZxXX35GJTmxdUduTVidzu82cvk
         cUtGNEQX1Ez2YuGeuc/fPbf8/wSfbpitGzqn5jRgy+xb9wDj3krFQdrR76tfOexJpjVv
         lQoP7bZTCHWqFQ4lRyKhmP+X1VF0QQX3VY43PQkkW8k1oC9RHhQrWNxYbfnUBcy2M43X
         RTdKRhmKns7OD/PDNMlXO2QVRzlxGlop6aNS+l83sNOoNYTyNI5cTcDvNMpQ6SOB+hb/
         eurQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704135002; x=1704739802;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VUVlFMyUFbqHH1zCnrlgOrt9yVwKdC+KAKtfKsX132c=;
        b=hLgaB6pVWraURmI3iTZDNeYhQfQsjEkJP3O7V3pWxwPv5uMRMnQfvrEwiALP5hT9Af
         ktIhCLV0GpnHhEVukP/tgVt+EWYcdKS74jDgt8OR5Sr3ntzdcSZ+knKaJCynFq5vVwXZ
         Yc+SRsySySbMZUjS5Wwm7epdLry1QMZ8bCi1erp5Y8ri+VAlm8bgj+hPn5s8XDxJlJlc
         RUtj/tpkkfIBmrC1QBxSPWhhXbxXGWgTaLwancoilyDZcDQoDBE040i1mg2G1NaQzy9L
         ajmPd1iruAb27FtBDNjgOXOxUlID6g7BIssIS+fLUJb9chHJHvv+50UTwOMUcst1SWg3
         H9Ig==
X-Gm-Message-State: AOJu0Yw1+dPh5kTv+d/0Su4rSDCdQ3fugWlviGrzr+i637NASFhlrTVl
	uH31JWuWQvaakdqV5R0Zb0lDsWFZmAA=
X-Google-Smtp-Source: AGHT+IFh4kKchLI+cCdevRkJAoVjKV6HhvnrDdB9kAgMEslFt+U6S+aED1rNORYckRfgFdlUhjpwwg==
X-Received: by 2002:a17:906:51d1:b0:a28:1ff1:e0ac with SMTP id v17-20020a17090651d100b00a281ff1e0acmr454915ejk.155.1704135002071;
        Mon, 01 Jan 2024 10:50:02 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id vl8-20020a17090730c800b00a27eddc3dcbsm1517140ejb.198.2024.01.01.10.50.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jan 2024 10:50:01 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-devel@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH] audit: reenable python bindings and bring in distutils via setuptools (needed with python 3.12)
Date: Mon,  1 Jan 2024 19:49:57 +0100
Message-Id: <20240101184957.647473-1-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 01 Jan 2024 18:50:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107987

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta-oe/recipes-security/audit/audit_3.1.2.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-security/audit/audit_3.1.2.bb b/meta-oe/recipes-security/audit/audit_3.1.2.bb
index 1f2c821f0..7136ed6a4 100644
--- a/meta-oe/recipes-security/audit/audit_3.1.2.bb
+++ b/meta-oe/recipes-security/audit/audit_3.1.2.bb
@@ -27,12 +27,12 @@ INITSCRIPT_PARAMS = "defaults"
 SYSTEMD_PACKAGES = "auditd"
 SYSTEMD_SERVICE:auditd = "auditd.service"
 
-DEPENDS = "python3 tcp-wrappers libcap-ng linux-libc-headers swig-native"
+DEPENDS = "python3 tcp-wrappers libcap-ng linux-libc-headers swig-native python3-setuptools-native"
 
 EXTRA_OECONF = " --with-libwrap \
         --enable-gssapi-krb5=no \
         --with-libcap-ng=yes \
-        --with-python3=no \
+        --with-python3=yes \
         --libdir=${base_libdir} \
         --sbindir=${base_sbindir} \
         --without-python \
-- 
2.39.2


