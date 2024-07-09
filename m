Return-Path: <jpuhlman@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 879F6C3271E
	for <webhook@archiver.kernel.org>; Tue,  9 Jul 2024 00:41:36 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web11.2131.1720485689700548565
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Jul 2024 17:41:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=YqfJrWgv;
 spf=pass (domain: mvista.com, ip: 209.85.216.54, mailfrom: jpuhlman@mvista.com)
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-2c9df3eb0edso1757883a91.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 08 Jul 2024 17:41:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1720485688; x=1721090488; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gXa4YJj/sSvwa4WF4mU9YfGc69k5cAeZ6sDpLaBRAyQ=;
        b=YqfJrWgvzt90yT5nXUyr86KmgPko+E6bSbIcLRTf3sMnvQEvy+v/+bPQCzfvyV/keK
         Ey4NXzc6caqvRZXWElR32pjVjWv74wsyN+0KpXj6pibWRrDkqpd1nIgvEYYdTX3IgmMU
         dPV6NXsM0D5FVq1g2YjjeIlw/LTXPzhlbzk5o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720485688; x=1721090488;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gXa4YJj/sSvwa4WF4mU9YfGc69k5cAeZ6sDpLaBRAyQ=;
        b=OjTnN9UgYkIOLKSptgytYnS/vrS2+9VveKHuyk6WwoJv+uRnJOHx7gXy0mzHiI7JW5
         t3AdgSEAMr3sBk4IHJYEp3OGGpNTxEnpWL7S0h+R2Ji1XpUoPsAZT1YKWaGIZ8gXet/f
         EWgRloDVheUoKpaMlgVEg6oM7hrwM9y/7wWsohsv4WKx2JZ0PRzGG6Vd5+OAYH5o8ysW
         F3m/zQbkhBhEyPWe9ROHJLn5TZEmEiscJZIKgv70R2sukH4d+OImA+wkMTsNeSPkbEQN
         YhMfFtVaHAMJU9HODoCy3H36ZFEyBxKlzeSlqFtoZTIUOt/w5uFw38X2lQe/1WBOrSeV
         05EA==
X-Gm-Message-State: AOJu0YwQ2OsTqmEuEM7wuc4+O9NhT+FXoqri2s5kVXeX6BnLuL65xXEZ
	gr/Q1hGLe7VVHAOaEUXOzjQA2UKCSqe/7Ym4toDOJ7oLg4R7AfVuNiHoxtUQWtDvB6f3Uoi8sby
	v
X-Google-Smtp-Source: AGHT+IFYesNhl6mKJlN5FrObYD2W7VLESSTAOueRteC7UXVy9kh8N+H1WNuzBfNGI7hVMI07Sav+zg==
X-Received: by 2002:a17:90a:654a:b0:2c8:716f:b46e with SMTP id 98e67ed59e1d1-2ca35c32b59mr1088326a91.16.1720485687886;
        Mon, 08 Jul 2024 17:41:27 -0700 (PDT)
Received: from brown (99-14-97-149.lightspeed.frokca.sbcglobal.net. [99.14.97.149])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ca34e6a7d1sm637966a91.13.2024.07.08.17.41.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jul 2024 17:41:27 -0700 (PDT)
Received: by brown (sSMTP sendmail emulation); Mon, 08 Jul 2024 17:41:24 -0700
From: jpuhlman@mvista.com
To: openembedded-devel@lists.openembedded.org
Cc: "Jeremy A. Puhlman" <jpuhlman@mvista.com>
Subject: [meta-networking][PATCH] net-snmp: Set ps flag value since it checks the host
Date: Mon,  8 Jul 2024 17:41:22 -0700
Message-Id: <20240709004123.1330033-1-jpuhlman@mvista.com>
X-Mailer: git-send-email 2.35.7
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 Jul 2024 00:41:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111270

From: "Jeremy A. Puhlman" <jpuhlman@mvista.com>

The value the configure script uses is picked up
from the host machine ps, and there are cases when
the flag selection can be different. Which would
break reproducablity between builds on different
machines.

Signed-off-by: Jeremy A. Puhlman <jpuhlman@mvista.com>
---
 meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.4.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.4.bb b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.4.bb
index 75b3d9e8c..989ec5413 100644
--- a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.4.bb
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.4.bb
@@ -73,6 +73,7 @@ CACHED_CONFIGUREVARS = " \
     lt_cv_shlibpath_overrides_runpath=yes \
     ac_cv_path_UNAMEPROG=${base_bindir}/uname \
     ac_cv_path_PSPROG=${base_bindir}/ps \
+    ac_cv_ps_flags="-e" \
     ac_cv_file__etc_printcap=no \
     NETSNMP_CONFIGURE_OPTIONS= \
 "
-- 
2.35.7


