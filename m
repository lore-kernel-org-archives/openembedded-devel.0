Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4144BE95A7F
	for <webhook@archiver.kernel.org>; Tue, 30 Dec 2025 12:25:01 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.63146.1767097498836016771
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Dec 2025 04:24:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=g2i1kBd5;
 spf=pass (domain: gmail.com, ip: 209.85.221.52, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-42fbc305914so6657156f8f.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 30 Dec 2025 04:24:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767097497; x=1767702297; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=72BoSLloO+dX8vRbNldeJSCoDL/FLW675FmUPFegoQk=;
        b=g2i1kBd5wFunCP9xy98TN/BO/xca0K2HlEQoHeIu8cDi4YHAYpt3BjgBgKMHGe7OQy
         kED4yPph/HYByMA3bBN/VCLmotRS+ZvHwsPqfY/ND7R9JaZjECFl1TnJAdvqejB+csuM
         GsZkaff4bNQyCcUhJYTBP5ZIESXSwghLFHwl+4l2W9AbRrvTWz0M+TKzct3ydks7e46s
         rwVC+wZyIYjmcjsMj5sqTO1a65iF8YXv+A1Dgggt0K8Hqg9O6zWOaeb3IFFWUDXyrFB4
         oz8kn5nk5XZ/8DFhqiS7nZtrxfpoT4sTjFt5nX4JwSspLgvOVkirfSkS1f5xihYcDER+
         GHIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767097497; x=1767702297;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=72BoSLloO+dX8vRbNldeJSCoDL/FLW675FmUPFegoQk=;
        b=w30CXfUXcx6O/g9dq/DDcqJO74RNvOHVnjdphfgB9PiSBKgucTzvTK/SWIWiza6fDq
         WnymqNaWRP1GLlM9mRdXb5ZYqZ6q32YplQvoqodOxp+KlMFPnz24G5BU+8C/IvPcxN/q
         7YkPWRqhkuFae0sIIgPOrUmfSDarpPRIFp/N/BlamOVl58n3+RlgKVrcGjrWh1xDauo1
         212nDwNiu/z9gx4JwyTBmS6GvRqaM6hivITCK4ivXt4tGe5I5bitwPvdQWWvazWzjWN3
         mgEFZQ1XdWgMQHaMRGa93UPON+unNrmcu78GVgUhuubnwPvuoCD2fyWsMgM6dQeVCdNd
         yelA==
X-Gm-Message-State: AOJu0Yxdzz+UiJCnQloI7kVxwS7broJgsNCi4nnTuN8cDsozJwTm1RRA
	ZigmwXpRuPr0Zc7G42CHDNavp0iEM5K6ZIawfcrK41bypIX9lAcm5qA+jKXikQ==
X-Gm-Gg: AY/fxX5J9571QwtUre6/Xa8G9WvyQqf+G91EhrH/vnXaY+U+XT5ZbUz1y835UPptqcD
	eJsTiNQ0YXCpZoZq0scSGc0g4f+/kPGPvdIo/v4KsgUSJmVRRMh9kIqLBPKxtqMj5ZGFEMgR6FE
	dWO4xI8lvbRL20WxSdbaIqj2HoAGLdQ+yZMT9BOe1E6nTC5zFsM35cc02QcwoqX5dIg2XeOktVE
	E1wpjDWqAsuRXAj09skYh5bAgTGxL1Ucv5Lv40NDeXZBxbgln6AdsM2/So5K/0bxSsQD8IHS+YA
	GDL7+pYQL7z+ww3D5/SqeVg28GffGgFQZBGNQECsNZ9zjWi91FMcIRAknZm7pyPNJWvA+C9ZeiG
	dyuslrAifZTRov8v6KgA/eWs+u6ftrDzYA3OzfbXCny8CFUbLoeW1FnEl74nUxmUB7nOy8Wpmky
	heTmuR1X31GMtdTmC5X5I=
X-Google-Smtp-Source: AGHT+IHrrdl6QEbk1xofvkpPYw4pMxwmoXmZk5wzCs/kISbDWLtArgx2/vjbF3s5wO5nTAY+0cOIkA==
X-Received: by 2002:a05:6000:25c1:b0:431:a50:6e98 with SMTP id ffacd0b85a97d-4324e5061e4mr37086745f8f.30.1767097497110;
        Tue, 30 Dec 2025 04:24:57 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324eaa477bsm68395060f8f.36.2025.12.30.04.24.56
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 04:24:56 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 03/10] python3-sqlalchemy: set CVE_PRODUCT
Date: Tue, 30 Dec 2025 13:24:47 +0100
Message-ID: <20251230122454.721515-3-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251230122454.721515-1-skandigraun@gmail.com>
References: <20251230122454.721515-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 30 Dec 2025 12:25:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123009

The default python:sqlalchemy CPE fails to match CVEs, because the CVEs
are associated with sqlalchemy:sqlalchemy CPE.

See CVE db query:
sqlite> select * from products where PRODUCT = 'sqlalchemy';
CVE-2012-0805|sqlalchemy|sqlalchemy|||0.7.0|<=
CVE-2012-0805|sqlalchemy|sqlalchemy|0.6.0|=||
CVE-2012-0805|sqlalchemy|sqlalchemy|0.6.0_beta1|=||
CVE-2012-0805|sqlalchemy|sqlalchemy|0.6.0_beta2|=||
CVE-2012-0805|sqlalchemy|sqlalchemy|0.6.0_beta3|=||
CVE-2012-0805|sqlalchemy|sqlalchemy|0.6.1|=||
CVE-2012-0805|sqlalchemy|sqlalchemy|0.6.2|=||
CVE-2012-0805|sqlalchemy|sqlalchemy|0.6.3|=||
CVE-2012-0805|sqlalchemy|sqlalchemy|0.6.4|=||
CVE-2012-0805|sqlalchemy|sqlalchemy|0.6.5|=||
CVE-2012-0805|sqlalchemy|sqlalchemy|0.6.6|=||
CVE-2012-0805|sqlalchemy|sqlalchemy|0.6.7|=||
CVE-2012-0805|sqlalchemy|sqlalchemy|0.7.0_b1|=||
CVE-2012-0805|sqlalchemy|sqlalchemy|0.7.0_b2|=||
CVE-2019-7164|sqlalchemy|sqlalchemy|||1.2.17|<=
CVE-2019-7164|sqlalchemy|sqlalchemy|1.3.0_beta1|=||
CVE-2019-7164|sqlalchemy|sqlalchemy|1.3.0_beta2|=||
CVE-2019-7548|sqlalchemy|sqlalchemy|1.2.17|=||

Set the CVE_PRODUCT accordingly.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../recipes-devtools/python/python3-sqlalchemy_2.0.45.bb        | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.45.bb b/meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.45.bb
index 6c6b95ceaa..f7d8f383f2 100644
--- a/meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.45.bb
+++ b/meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.45.bb
@@ -21,4 +21,6 @@ RDEPENDS:${PN} += " \
     python3-typing-extensions \
 "
 
+CVE_PRODUCT = "sqlalchemy"
+
 BBCLASSEXTEND = "native nativesdk"

