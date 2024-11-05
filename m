Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E429FD2B944
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 14:36:49 +0000 (UTC)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
 by mx.groups.io with SMTP id smtpd.web11.19502.1730817404259772098
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 06:36:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jcbu94HX;
 spf=pass (domain: gmail.com, ip: 209.85.128.181, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-6ea50585bf2so58088047b3.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 06:36:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730817403; x=1731422203; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1hEkjvun+LxWUEtSP9FKnjcDIjndcLX/hWuPKMtBIec=;
        b=jcbu94HX9ynCT/mentHu3MfPjml26I8hnmUMohyIzGdfJZ4VjlElT/wt2bNZZEGaqN
         tgOV3GwyFYvp+oPOUL5LHw4N4Vte8HbWIxk+M0nApnG3aQeQxAuKUXDJkyuDiDaI6wqW
         pBMYo0szQWD2bTU1+l9BXfdVW+bYtcnMI4D+OhBcYUACRkJvIt4vlSR4jDPaHk5Ez+xj
         0DJeKXHGNGZCWO5+wd8aGitp7EHUxwy8OwOBjia2+bkTiKuuxPlAuHIbrNVQQykQbh98
         3ljtk9qweMXEJE1/lFX+zQkE/KX6i9y0sYO1L6fsIYuEmfCf2D27PCXpBvok2qJURjG2
         aPew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730817403; x=1731422203;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1hEkjvun+LxWUEtSP9FKnjcDIjndcLX/hWuPKMtBIec=;
        b=eyFffUTf2WCPqm0MrJHyOHJJcpay/7KS/LpZpyJt82icQS8GuIj0260tvl7sJEkP21
         HxqmVPKpPXxcH4bhiRd2NdEjGgRludLeZyuFaNsQmX0jIGJvXUnHFwTsBLd0COJi2KGB
         FufetJPmSDHU6ZbIP4Ks/QMvYgEpOLjByVnptL59mm4fgnLjbOvYfj67BBXuVgokqyeP
         49xLZzyrhCkC+JsoShBvMAh9VhYms4NxfTI0t/TQ2FTggyooZUHBoAH7BHXFDmBOsyYi
         JZCDcperz3MMSWzITXToP3OR69+gVmvhhZFDJ2Qizrr3QYbf7NKaUorAq05lixcNE4dQ
         569A==
X-Gm-Message-State: AOJu0YxalxXYqRZngQp0xy0s79kvmk32aiyEp0tvaUXdtSARSOXqTzMB
	rJChGgh4nrAAQZiCKv/Madqxi2a/R/+Pv2YLe0Kxje47++TNY7YFwkeI5Q==
X-Google-Smtp-Source: AGHT+IHZncR5gM9A6BONKi96N8ETOv+DmPdDprIXXlZjMKzJLVDZ8sSHSGob++1OV6w3UbNikvkIdw==
X-Received: by 2002:a05:690c:6504:b0:6e2:b263:1051 with SMTP id 00721157ae682-6ea64a9f4f6mr161086217b3.7.1730817403336;
        Tue, 05 Nov 2024 06:36:43 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:45dd:7000::29])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55c8723esm22495977b3.126.2024.11.05.06.36.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 06:36:43 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][styhead][PATCH 09/90] python3-eventlet: upgrade 0.36.1 -> 0.37.0
Date: Tue,  5 Nov 2024 09:34:34 -0500
Message-ID: <20241105143638.2301245-10-akuster808@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241105143638.2301245-1-akuster808@gmail.com>
References: <20241105143638.2301245-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 14:36:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113427

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
* [fix] os.read/write waits until file descriptor is ready.
* [fix] Upgrade RLocks as last thing we do
* [security] drop header keys with underscores
* [doc] Various doc updates

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../{python3-eventlet_0.36.1.bb => python3-eventlet_0.37.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-eventlet_0.36.1.bb => python3-eventlet_0.37.0.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-eventlet_0.36.1.bb b/meta-python/recipes-devtools/python/python3-eventlet_0.37.0.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-eventlet_0.36.1.bb
rename to meta-python/recipes-devtools/python/python3-eventlet_0.37.0.bb
index b521162d2e..84de0d8e44 100644
--- a/meta-python/recipes-devtools/python/python3-eventlet_0.36.1.bb
+++ b/meta-python/recipes-devtools/python/python3-eventlet_0.37.0.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=56472ad6de4caf50e05332a34b66e778"
 
-SRC_URI[sha256sum] = "d227fe76a63d9e6a6cef53beb8ad0b2dc40a5e7737c801f4b474cfae1db07bc5"
+SRC_URI[sha256sum] = "fa49bf5a549cdbaa06919679979ea022ac8f8f3cf0499f26849a1cd8e64c30b1"
 
 inherit pypi python_hatchling
 
-- 
2.43.0


