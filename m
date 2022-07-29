Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE85EC3F6B0
	for <webhook@archiver.kernel.org>; Fri, 29 Jul 2022 15:03:48 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com
 [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web09.229.1659107024107752306
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 29 Jul 2022 08:03:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=PZxBeO6+;
 spf=pass (domain: gmail.com, ip: 209.85.210.169,
 mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f169.google.com with SMTP id k79so636065pfd.8
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 29 Jul 2022 08:03:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TlyD5XWGfa0ZEEBhiBZEXc+kAyy3GEputkt8zKnrb4E=;
        b=PZxBeO6+49dGEOQ+4hkU3ViNxN8ZlGcxaV5DBGCFMVg0iLaC5F9ftX4+KtdH6AD0gh
         Cb1I/BaoYxEijagTj0L0Ydbi6l1Gf97vmyrbk9GTe7w5kHePaifeIr8VXiGl8atytSVR
         KgFb0triA1UACFbOFhtnSpALduNE4+UXbbnjIJgBs/T8zMFPpNwWzUTDXLAb2NdB67wr
         NVtfTzVh994LeFA0VGEdOPouJS1tqeP/5sncfJ30ybjXBK9QgKRttwvb1qDIvqHoSVJX
         6EnPp7rrwMu6LmZoK82AtlCxXt4GF7a+J1MxzApcXvXoWGxNq/oR4W+lfhdFGeCwBjZe
         STGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TlyD5XWGfa0ZEEBhiBZEXc+kAyy3GEputkt8zKnrb4E=;
        b=npiE4kryZiJew5cwblyXgnOckeKn2v+rRdqZvQaz6hMVJzislxrbaqoT3tNfAzjMBE
         yeHJJekvPsNfTbd1RbbZLXj5UAwR4I7UAJawX3Xo8AoYFyROoksUP3uaBmntkPjqT19j
         TlkN7uiNjO3rum31gpqEJOj+ORX8oTEYSteNDTuID7YBMR9WepF6nRNhoQGi/3RtV5Sl
         Pks4OJYqv8JQbrxHDS4j4yWSCb3LJvqYG8P3MvbWr4ioqSnvFNJnDhjchUYa+vyNyGh8
         mnF3lpwaf/KfCs/Z4RmHI1uDIuEMvP1X+pqqZgczuMHxmt+ey+2Guh0+kdHPB7m46bSY
         8Ykw==
X-Gm-Message-State: AJIora/zTFyB3zvdVBzlnuX7eOE5+6VbE0swA+2OXhgbSaCN+yAQZpG7
	RWhDN+52qFEWSJh13Wcl/uElXoACfxg=
X-Google-Smtp-Source: 
 AGRyM1vU0C5u94f833DT3AZ3aBjL4zDrBM4Pyk2Qrz9Cqk4tk9FObYSvuN5V5iKu8HxPypPPv3Awug==
X-Received: by 2002:a63:441f:0:b0:41b:539c:6011 with SMTP id
 r31-20020a63441f000000b0041b539c6011mr3377042pga.156.1659107022995;
        Fri, 29 Jul 2022 08:03:42 -0700 (PDT)
Received: from keaua.hsd1.ca.comcast.net
 (c-67-181-203-136.hsd1.ca.comcast.net. [67.181.203.136])
        by smtp.gmail.com with ESMTPSA id
 x10-20020aa79aca000000b0051be16492basm2957080pfp.195.2022.07.29.08.03.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Jul 2022 08:03:42 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: wangmy <wangmy@fujitsu.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][kirkstone][PATCH 1/5] stunnel: upgrade 5.63 -> 5.64
Date: Fri, 29 Jul 2022 08:01:36 -0700
Message-Id: <20220729150140.104164-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 29 Jul 2022 15:03:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98041

From: wangmy <wangmy@fujitsu.com>

Changelog:
==========

    Security bugfixes
        OpenSSL DLLs updated to version 3.0.3.
    New features
        Updated the pkcs11 engine for Windows.
    Bugfixes
        Removed the SERVICE_INTERACTIVE_PROCESS flag in "stunnel -install".

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 6f3b52f4589bfa942e473488f91ecef85d339e78)
[New feature does not affect linux]
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../stunnel/{stunnel_5.63.bb => stunnel_5.64.bb}                | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/stunnel/{stunnel_5.63.bb => stunnel_5.64.bb} (93%)

diff --git a/meta-networking/recipes-support/stunnel/stunnel_5.63.bb b/meta-networking/recipes-support/stunnel/stunnel_5.64.bb
similarity index 93%
rename from meta-networking/recipes-support/stunnel/stunnel_5.63.bb
rename to meta-networking/recipes-support/stunnel/stunnel_5.64.bb
index 325737e8c9..13ecd5c5bf 100644
--- a/meta-networking/recipes-support/stunnel/stunnel_5.63.bb
+++ b/meta-networking/recipes-support/stunnel/stunnel_5.64.bb
@@ -11,7 +11,7 @@ SRC_URI = "https://stunnel.org/archive/5.x/${BP}.tar.gz \
            file://fix-openssl-no-des.patch \
 "
 
-SRC_URI[sha256sum] = "c74c4e15144a3ae34b8b890bb31c909207301490bd1e51bfaaa5ffeb0a994617"
+SRC_URI[sha256sum] = "eebe53ed116ba43b2e786762b0c2b91511e7b74857ad4765824e7199e6faf883"
 
 inherit autotools bash-completion pkgconfig
 
-- 
2.25.1


