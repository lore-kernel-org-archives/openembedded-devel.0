Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5BEBC433EF
	for <webhook@archiver.kernel.org>; Sat, 29 Jan 2022 14:21:17 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web08.6330.1643466076970012964
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 29 Jan 2022 06:21:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Hv0D5NvT;
 spf=pass (domain: gmail.com, ip: 209.85.214.180,
 mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id c9so8653716plg.11
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 29 Jan 2022 06:21:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=IkXFQ2tiPqQsOHfd89pMlUboUJ1WjVv4dBXtLyS/yuY=;
        b=Hv0D5NvTqFP0LxfCgr1hQxBaEVE8mriSjT6ZqdbciSxD3KqKbSaApuIlU/vQqj3K6F
         EvCdp+ol2NDu8jH1Kn5JKCiUkqs4Qtf/iedGYh6B9KQ7P1HhjFSXfkY3TglydVgh+4p6
         5PKWzd6gEIE/jSc4kDBjnaWm+P0DUPLjI4wGGmfLELjNHPEClIpqHNhnkxgWwVS8p/jB
         MLcIbbuzjfMdabUhytcSlWOXf21sHzeiIs8B+kiLWXDCa8nn1of7nDgKLtnzmIh0WQvw
         ahaHSRdLCemJ4m5IPRW3AcxwJjOKm2N58bo3jW6cxv9p4JfiOrCkn0YCB3+xRS7bLlMZ
         u59g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IkXFQ2tiPqQsOHfd89pMlUboUJ1WjVv4dBXtLyS/yuY=;
        b=7lqv6c/13M4pfi0maR0SbJ+DdipOplGxVPATDKvStfxyQsV88AIS2iokwTyTc3bCFN
         fE4fcRWEuE6d511upZ38PJbytPasRsEm1JeYWAH8yCDGRvy4DZy09LKrxFW+26SbzdEZ
         bgB/9syAaRJ74OMjiqAVlh8LR8A6YDCtbxzR3mleHX/glZueCjAKzQU2mP0Ie6sXYXO7
         KNFLEhlq9mSK534iCmRsWwtXto63H7m2yLWjlR6HiaeO8rrf/L8dIRilGwH62ZNpKOqZ
         k2O6eErPTeh2GwW5p5m4Ei6COeVdV3bRHzr0ItfAzSKnsVO07zMCZkDhBFzDrHMZFF7a
         KMww==
X-Gm-Message-State: AOAM533Px8GB9OWKzFigsNGxxHC64tIbU2YfdEZIR1mL4B71fGCVq6Hb
	cwzwQwQjXBAfweiX7sVOypEOiX8iA3xGAA==
X-Google-Smtp-Source: 
 ABdhPJy+lNowIX4IcQcPgIeTUCpHVdra1m5qKhYdlWhy7jtu8LOuVsltS7+vCxXYN+7EVrmiUEvkKA==
X-Received: by 2002:a17:902:c409:: with SMTP id
 k9mr13620094plk.66.1643466076402;
        Sat, 29 Jan 2022 06:21:16 -0800 (PST)
Received: from keaua.caveonetworks.com
 ([2601:202:4180:a5c0:d32b:593f:f15f:8524])
        by smtp.gmail.com with ESMTPSA id
 h5sm13196205pfi.111.2022.01.29.06.21.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Jan 2022 06:21:16 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leif Middelschulte <Leif.Middelschulte@klsmartin.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][honister][PATCH 2/2] dbus-daemon-proxy: add missing
 `return` statement
Date: Sat, 29 Jan 2022 06:21:13 -0800
Message-Id: <20220129142113.3829383-2-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220129142113.3829383-1-akuster808@gmail.com>
References: <20220129142113.3829383-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 29 Jan 2022 14:21:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95168

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


