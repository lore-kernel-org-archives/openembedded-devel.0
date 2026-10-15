Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11534CC6B39
	for <webhook@archiver.kernel.org>; Thu, 15 Oct 2026 05:44:29 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.32832.1792043065647158676
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Oct 2026 22:44:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=PlPtRAUc;
 spf=pass (domain: gmail.com, ip: 209.85.214.174, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2db80fcdf8bso28339635ad.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 14 Oct 2026 22:44:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792043065; x=1792647865; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=PdoOGoShBIaKsmxgsFEKeTs6cqMJE0impqUX5+QtO7s=;
        b=PlPtRAUcac3eiO9fC0tCzgkcN6Cn9akQ5iJCr+xaD8fIYvgy088pz8UV0scFRokvrR
         1fqC24EnpO5M2uu1K0BHmtmzR3PpqKYBZCdod6TxlcsOf06gOcuHoMiWXvntn0oowalW
         zMwusewfqG7eDo0lQOfQPxFpam7FGLgy7oRfhLxKQtxwt9/DMkvbC4PMwY38n9za1hHa
         lkkOKZxtXzvGGIoBlMYqZ0Zx9hGX0rJ5SeEn73sdI1TUk2Y1EkJAwCldz1gSlhVhmLaP
         beovYTTbmkqhis4sFWu03VsayU0HtKfqI0KG5QUFvvNGch7fc2nJSQB46+GacHidw9j1
         TMGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792043065; x=1792647865;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=PdoOGoShBIaKsmxgsFEKeTs6cqMJE0impqUX5+QtO7s=;
        b=JL7eH0FTzh7e0IT/h7V4lOYXpY0mq3hjr9xyQuK7MINVt37BNVJySsOK4IpQy8Hkpd
         kZHP32MiFVi8A9DiO5AjPwf3E9t2v0qthRAQIf/RIaPgZrh8oZBVWV5MKRd0JWREwRY3
         RH0G5B/ncCYSG8IfNzsFk4EtnKOEoojj9uHT2qi5L6Y6snxF1iQMmyVvV2evgleWDxrk
         lvv2tRJzIlM7lWGCifCMS9qp3gAv4I/Io1j055hzupz3/SiyEWI6IQbsv7OllSILArei
         S94EQUarGutJvp2iYHJbKLLrbtFPqdak1cinsMYxLnsOYRqOOaeSawJWLNh27+uq3/jT
         OBsw==
X-Gm-Message-State: AFq9FYK4cwa3pI22ZPvksE0ClkU9ug2h5bud6XbUY8iaf4he9X5vhihG
	IY2IKMtrRRdFzwoC5elehWjsmgs3qnGHQWAPlW/h1DI+U70f/CInPh/kDBXThw==
X-Gm-Gg: AYBFou2SOE9MvlRVPS+qfAgXIB3o0KKBjHmLzcSUAggLSY1IxbXyGARJwf5XTzkQ5QQ
	NeOh869dxutj45H41e7Lfrlp/ymj+JvFjZwJynkqaSHJQA9jJ6RJMURsyGm7nLbjGZOI/6+EYAG
	p2aOiweYTxZ+bEsaP8oH7B70+bhzYPMkF07Sd9TJZJJvkELmSy9USTOX8Q3CahRK4Maxz5VbMC8
	qmxOAtz2+I41SCDbO/oDaO4Lk/83wDD9l5ONAkF9X7+bzBFjzc4+r3/t9KuQKGwU/Gv6MFwE8Xt
	d4ecKOZm+sdtXWYBA5eqg7j+7WTr8a2YecG0AaGJSSKihp/qBW3MjarzuQVIuhiqR40gErYzJvh
	8h+3peHRyV4TnbHIIhop9ZUVuaFzKb20Pe9qs6kL/1L4pJ/JHKyiMXVqJAE7+eIdksuYstwT3dA
	Q/aPKCCuhP0b0bd8omSf9PbpWIPKd+tDfJ7B2f87Cp3xABY0/QsonifR2lQeli/vWgNgov8j6+9
	yw6Q1GCAGyrHB6Wm6mQHwc=
X-Received: by 2002:a17:902:cf4b:b0:2e6:13b1:e196 with SMTP id d9443c01a7336-2e842cea1famr141111985ad.74.1792043064975;
        Wed, 14 Oct 2026 22:44:24 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e967875e58sm549125ad.36.2026.10.14.22.44.23
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 22:44:24 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 44/82] pgpool2: upgrade 4.7.2 -> 4.7.3
Date: Thu, 15 Oct 2026 18:41:32 +1300
Message-ID: <48393460adf89c370e2b1fda81ec9ebce0aa655b.1791945956.git.ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1791945956.git.ankur.tyagi85@gmail.com>
References: <cover.1791945956.git.ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 15 Oct 2026 05:44:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130964

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://www.pgpool.net/docs/latest/en/html/release-4-7-3.html

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit 192d012d9a1f40061901ad4302a4d90fc08769aa)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../pgpool2/{pgpool2_4.7.2.bb => pgpool2_4.7.3.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/pgpool2/{pgpool2_4.7.2.bb => pgpool2_4.7.3.bb} (95%)

diff --git a/meta-networking/recipes-support/pgpool2/pgpool2_4.7.2.bb b/meta-networking/recipes-support/pgpool2/pgpool2_4.7.3.bb
similarity index 95%
rename from meta-networking/recipes-support/pgpool2/pgpool2_4.7.2.bb
rename to meta-networking/recipes-support/pgpool2/pgpool2_4.7.3.bb
index c6b6a22c64..2648cc1f9f 100644
--- a/meta-networking/recipes-support/pgpool2/pgpool2_4.7.2.bb
+++ b/meta-networking/recipes-support/pgpool2/pgpool2_4.7.3.bb
@@ -16,7 +16,7 @@ SRC_URI = "https://www.pgpool.net/source/pgpool-II-${PV}.tar.gz \
 	   file://pgpool.sysconfig \
 	   file://pgpool.service \
            "
-SRC_URI[sha256sum] = "e72b9d0ff3620f7da7e33a58dda44b77919d056752dc9bd86b2985c4988d1938"
+SRC_URI[sha256sum] = "4bf9df3e13feb8e64bee486b4ea54c9076296c2d9406165b0b68d32086fce250"
 
 S = "${UNPACKDIR}/pgpool-II-${PV}"
 

