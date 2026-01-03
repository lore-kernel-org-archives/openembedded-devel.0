Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C940FC618A
	for <webhook@archiver.kernel.org>; Sat,  3 Jan 2026 19:02:08 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.29704.1767466519520185106
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 03 Jan 2026 10:55:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=k9Zrc6zN;
 spf=pass (domain: gmail.com, ip: 209.85.210.174, mailfrom: sanjayembeddedse@gmail.com)
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-8035e31d834so10488260b3a.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 03 Jan 2026 10:55:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767466519; x=1768071319; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k0sb8OvYuZJKMyTcnN3VIReU2WhY7FC3CfYfaoX84tk=;
        b=k9Zrc6zNeNHRCZ6gSYoF4u3mGtUu2exPwpkpR3WLPd18rO1/HKK73nMa4Lm5SOkeGL
         w9XerXMBg9b+KbXF4ptch8iGEOUDHno+ZYAAxD8wNw5MntWEh8pXLQdmBaoJWBQXStfT
         jbjYYXA3bw2Qa/uMPXZrbZa2cT7VKwcO0fhpcRylVKDEq9iA7PSEYAZmV8tao/Ka3jMt
         +Ml1bZIPJLGA9P6NRTX7zPzQdcVS6WxPa0mTKaHv19OASmSqXRnDTF1dUBYTmb6j7hAf
         htPOeTtf0Ant9KZAlgVaQ+fKZarj5xmFhDtQ9Tm/JiBwXlIH/lOyPQDCFYYPQ7FTmxOw
         46+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767466519; x=1768071319;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=k0sb8OvYuZJKMyTcnN3VIReU2WhY7FC3CfYfaoX84tk=;
        b=wG5NeERhIJGKOwSoPcxqj7D9NMEe6lMVIeRq9tRwo+OywdZ2R6VQ7nssJwutHyau78
         0noMOp9CNGUf4Rb+kjHnJxh6vFbnkatnUyTF9iv3/+I3uR6fU8gZoL7MaZxP53iTZL1u
         t4v3OF+f4Iae76471vZxwBczoXDZYdNlRmey4ZrsYBeLr4dp3EDKIrN/cbMTz8XK3UMH
         AKSgNWzoGFLsErO/Y8AYybRtl9iL0VmQXXd59dY3zHFui+pQm6vBZ6+gfh0rMZkll0pd
         obAOV/Sh1YL9pexJfzxzbKB7iTazwmpsIZQ9XBiOc7xmUtqf5crb1cTQQyHAQwY6Nc67
         T19w==
X-Gm-Message-State: AOJu0Yx8pSyneeMsrJirKz8G1UrvPFXo/wCxuA+HQ0Ba9tIE0jXlnhcW
	vGaQ1mGqWEpmSHm/XzMwQLQ3cdA2OMew36hQMHwQCBL+3/zSKTZIlpfWFxqrpA==
X-Gm-Gg: AY/fxX4nMgIgJ09dk2IZ++lOrjxd1kRKhMricrVAVrrf8DSlseu11aScGQgm9KxWNym
	sU4UmM++/Nncaf79Ox6BQvuYBbjqCiNoGQULVWOqDZBGFX4sbrDPrlAr3j8AiKx8ItW8iZTKHrk
	2DBwhTsrNAB36s0tUeEe7SKj9qdurEw3o6fnC2HerGkpllgWPyfOS9S3ZIGSE4scQdU6vLbVLm1
	KY58rN3IJJWAueh8UaC6fF2o3N7qQML1EGokY4Zy0cpbRnUM+9rQ0IyfkqEpXCe4JHAtExigPQf
	AVozoXQSm9K4HTxPEKR1qxeYtZi6rv33KS8jjGp7hMkCj9Tq8glN3wNsNYJamF6owp5y2RXKeQK
	He9gdxMqWppUUBoC3zFexN5d/zcMU4rt7qPw0DVCTCxdfm1jVws1dq0Uz+xPpRxdGJE9wsMLqNs
	sy18ypx6Fqjlv0R1ionf8YKCC7z3eA2ffNYw4t
X-Google-Smtp-Source: AGHT+IHFlRlrxp0ZHz8DIBUR8iutp01VajBNvf7PGHd3j/EbyCE4YA3Ic4kgCXByZ+TlzhDP2cxvOA==
X-Received: by 2002:a05:6a00:e17:b0:7a2:84f3:cefc with SMTP id d2e1a72fcca58-7ff61b8e615mr40931240b3a.0.1767466518926;
        Sat, 03 Jan 2026 10:55:18 -0800 (PST)
Received: from hu-ckantibh-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c1e7bd602desm40169135a12.21.2026.01.03.10.55.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Jan 2026 10:55:18 -0800 (PST)
From: Sanjay Chitroda <sanjayembeddedse@gmail.com>
X-Google-Original-From: Sanjay Chitroda <sanjayembedded@gmail.com>
To: skandigraun@gmail.com
Cc: openembedded-devel@lists.openembedded.org,
	sanjayembeddedse@gmail.com
Subject: [meta-oe][kirkstone][PATCH v2] recipes-core/toybox: Switch SRC_URI to HTTPS for reliable fetch
Date: Sun,  4 Jan 2026 00:25:13 +0530
Message-Id: <edb5e5e2949f7876e0c21ffc8ad8006058a0a60d.1767466424.git.sanjayembeddedse@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <af8bd9f6-02b7-4ebc-8f93-4d1425cf6fed@gmail.com>
References: <af8bd9f6-02b7-4ebc-8f93-4d1425cf6fed@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 03 Jan 2026 19:02:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123106

From: Sanjay Chitroda <sanjayembeddedse@gmail.com>

The upstream site (landley.net) serves inconsistent content when using HTTP,
causing checksum mismatches during do_fetch. Using HTTPS ensures stable
downloads and resolves checksum failures.

Signed-off-by: Sanjay Chitroda <sanjayembeddedse@gmail.com>
---
 meta-oe/recipes-core/toybox/toybox_0.8.6.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-core/toybox/toybox_0.8.6.bb b/meta-oe/recipes-core/toybox/toybox_0.8.6.bb
index 50ce50d1c2..b1d25fa83f 100644
--- a/meta-oe/recipes-core/toybox/toybox_0.8.6.bb
+++ b/meta-oe/recipes-core/toybox/toybox_0.8.6.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=78659a599b9325da368f2f1eb88f19c7"
 
 inherit cml1 update-alternatives
 
-SRC_URI = "http://www.landley.net/toybox/downloads/${BPN}-${PV}.tar.gz \
+SRC_URI = "https://www.landley.net/toybox/downloads/${BPN}-${PV}.tar.gz \
            "
 SRC_URI[sha256sum] = "4298c90a2b238348e4fdc9f89eb4988356c80da3f0cf78c279d2e82b9119034b"
 
-- 
2.34.1


