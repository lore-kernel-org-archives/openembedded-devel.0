Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 030D2C433EF
	for <webhook@archiver.kernel.org>; Sat, 29 Jan 2022 14:22:25 +0000 (UTC)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com
 [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.web09.6349.1643466144300798351
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 29 Jan 2022 06:22:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=CZRCfWto;
 spf=pass (domain: gmail.com, ip: 209.85.215.180,
 mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f180.google.com with SMTP id g2so7857317pgo.9
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 29 Jan 2022 06:22:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IkXFQ2tiPqQsOHfd89pMlUboUJ1WjVv4dBXtLyS/yuY=;
        b=CZRCfWtoe02v8vFy9lK4l5jccOxGL8m6Kna6tN8O4W7jv8nsl2G5ph+kvQRVcV01Ts
         DlMHjmgd+xiikBNUrdVjg5HJqehlOfrPezQHN6HHAEcPMp/6XDO9ehx39cDpkRbwC1Zj
         812xtEqdD5xLAfXc+WF+i5/dMKn7ZL76+qAEtiDrGrPM0ukfmlN5WHRpqVDz5/YM6hu4
         NrjZzkehNg1z/zahCIufCNf3bNE0A30txTcsb3z9VIEWXw+AVtJ3LExMSMe9MD8ka0Mx
         iXMXcqBMyBtbvaCDa+cKPN8/KZnTDLS21Cw0aXoUyfoJ8pG1xH5UNh/0GvJbSFlqh6b4
         Gw4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IkXFQ2tiPqQsOHfd89pMlUboUJ1WjVv4dBXtLyS/yuY=;
        b=wQvpQ4HiYHF6Gqy26a80WID+KPkmXihLMYDme0im094WeuXCMkQPkUCj02+ONJG7bQ
         fpSWbBAmUQaZJByfQMdHKHiB66UJGsrm/XGmvFX+J2BUBKv0BCKOsaZPSk6S/4pxbvZb
         /FzvSl7tCQZ/FrncHv1uvGYFuXEnZ4XqCAlMtBXf8sk/cU6E4t3LnwuD8WWxGSaPKtRV
         GajNKRaNu7DtsmAC3DtpGwY8n6rpFoPQPtQukoLexX3VfqgTil+WP0YE0TXgZZ0od0R3
         /vTIH1bMopMYyOVbHOVfF4YT1jzyM5/2WkieEU5eZ+P1n27XCd7Exxnrv/qOKI01MZlj
         32DA==
X-Gm-Message-State: AOAM533YOqp+YOqOdSNXK/uz+Fewt60Mkc4mNHrEPXyM4lsVrabFQf1O
	rQRaigTi+fUBHSd8TnM6z4FFNCKlfFQVpQ==
X-Google-Smtp-Source: 
 ABdhPJy60wtGTupZ0Ugpp5sxVHa3KQOydKhT+0WddW+cup7lFZ+0yqATg+uKPCU0PBUj8xWDcevhZg==
X-Received: by 2002:a63:dd4d:: with SMTP id
 g13mr10431114pgj.202.1643466143751;
        Sat, 29 Jan 2022 06:22:23 -0800 (PST)
Received: from keaua.caveonetworks.com
 ([2601:202:4180:a5c0:d32b:593f:f15f:8524])
        by smtp.gmail.com with ESMTPSA id
 o9sm2320908pfw.86.2022.01.29.06.22.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Jan 2022 06:22:23 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leif Middelschulte <Leif.Middelschulte@klsmartin.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][dunfell][PATCH] dbus-daemon-proxy: add missing `return`
 statement
Date: Sat, 29 Jan 2022 06:22:22 -0800
Message-Id: <20220129142222.3829587-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 29 Jan 2022 14:22:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95173

From: Leif Middelschulte <Leif.Middelschulte@klsmartin.com>

The missing `return` statement leads to a `SIGABRT`.

Signed-off-by: Leif Middelschulte <Leif.Middelschulte@klsmartin.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 77479e1c9b7bffb6ad89ae68f80605ad1c65ea75)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...1-dbus-daemon-proxy-Return-DBUS_HANDLER_RESULT_NOT_YET.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-core/dbus/dbus-daemon-proxy/0001-dbus-daemon-proxy-Return-DBUS_HANDLER_RESULT_NOT_YET.patch b/meta-oe/recipes-core/dbus/dbus-daemon-proxy/0001-dbus-daemon-proxy-Return-DBUS_HANDLER_RESULT_NOT_YET.patch
index 2c4ca057f2..1c2fc3813f 100644
--- a/meta-oe/recipes-core/dbus/dbus-daemon-proxy/0001-dbus-daemon-proxy-Return-DBUS_HANDLER_RESULT_NOT_YET.patch
+++ b/meta-oe/recipes-core/dbus/dbus-daemon-proxy/0001-dbus-daemon-proxy-Return-DBUS_HANDLER_RESULT_NOT_YET.patch
@@ -21,7 +21,7 @@ index 009e4fd..f3f0d80 100644
  
    if (!dbus_conn)
 -    return;
-+    DBUS_HANDLER_RESULT_NOT_YET_HANDLED;
++    return DBUS_HANDLER_RESULT_NOT_YET_HANDLED;
  
    if (verbose)
      g_print ("New message from server: type='%d' path='%s' iface='%s'"
-- 
2.25.1


