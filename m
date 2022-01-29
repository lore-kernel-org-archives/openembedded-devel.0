Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBA2BC433F5
	for <webhook@archiver.kernel.org>; Sat, 29 Jan 2022 14:21:57 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com
 [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web12.6261.1643466117014836404
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 29 Jan 2022 06:21:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=nC1hQFpq;
 spf=pass (domain: gmail.com, ip: 209.85.216.43,
 mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id
 b1-20020a17090a990100b001b14bd47532so9233191pjp.0
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 29 Jan 2022 06:21:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0MCEg3aLNhL9Bi3fErswpBfsN6rOCQPBJIv6wzB/PhU=;
        b=nC1hQFpqGpHwWAu/2KTnYFplxEblIToY6+2xguRay2Tfr79Lc+Kig2Gvo0eR0o+TRW
         u3ui0fFrvmI2HrEXE5MG4gkOPbrWMeb7cgUFberRobQhP8TXFUq6FkGcq/uryt4914Mm
         aW3StmS2hblkTgPcAv7oLqRlHYY1bfFdqt3dD/wlSsytLLdSLq7QtKGxyDoP3a6bqd7q
         XCRpk2Og4F/Iq08N+UbMnmb+5lHPzAqxCmTS53jNAkT6I4LzdGYrU4RcDi38opOkVmtq
         xIfqAq93wOW8lUfJZjArtSX2w8ucdVdOEhMbNntTYMI9omn3KvL5C5fKaX/4ROZzmQWX
         LlBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0MCEg3aLNhL9Bi3fErswpBfsN6rOCQPBJIv6wzB/PhU=;
        b=rN8vjEn86fCQb8jwkyza6cW26IR1i7dEisn/evHNLlxauSv6uaVl6fnjJwxLCTVKMg
         Vh7vzBLtfrpa7LjfmLLTrFU2SCMkVQyDl2jrFxqvqV5BA8uGHfzjf5v7pVZC/gwyCcau
         UuWjj3iKTJ6y4Yq0/KF2NDeiwXKuikkZ7MvSTScXLJUd1buX/QMBsh0SJXZgAQ2VTnHR
         LMcaSjAa9PzSdwnX+lMcbil93iTXWHjiBwAi2+Ye41alCA/VqQ3r1PCepzbdyw7z3I+p
         kY1gMsFQb8jULgvdptHi8DTqLT+tLsu88Lv6jkNaC0mSFDCdw8SzSZm/MZKmQ8sm5bfC
         zubw==
X-Gm-Message-State: AOAM533JPZcEDyD2+Ict+igVpx/JaY7XXXZtcWB0Zr9B+NROvuOjQNKk
	6Q3WpXobHj/Tkii1q8fR2Q1XPFrhV+8bOA==
X-Google-Smtp-Source: 
 ABdhPJwGmcvckz0j0+/DodAGpl9pjkol/FDJBSCRYHhDxryyLbYCwCfLpU+k3lOyLkT33SULPZvuRw==
X-Received: by 2002:a17:902:ab41:: with SMTP id
 ij1mr13623222plb.59.1643466116336;
        Sat, 29 Jan 2022 06:21:56 -0800 (PST)
Received: from keaua.caveonetworks.com
 ([2601:202:4180:a5c0:d32b:593f:f15f:8524])
        by smtp.gmail.com with ESMTPSA id 9sm4498304pjg.50.2022.01.29.06.21.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Jan 2022 06:21:56 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leif Middelschulte <Leif.Middelschulte@klsmartin.com>
Subject: [meta-oe][hardknott][PATCH 3/3] dbus-daemon-proxy: add missing
 `return` statement
Date: Sat, 29 Jan 2022 06:21:53 -0800
Message-Id: <20220129142153.3829490-3-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220129142153.3829490-1-akuster808@gmail.com>
References: <20220129142153.3829490-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 29 Jan 2022 14:21:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95172

From: Leif Middelschulte <Leif.Middelschulte@klsmartin.com>

The missing `return` statement leads to a `SIGABRT`.

Signed-off-by: Leif Middelschulte <Leif.Middelschulte@klsmartin.com>
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


