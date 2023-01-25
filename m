Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7BBAC54EAA
	for <webhook@archiver.kernel.org>; Wed, 25 Jan 2023 13:32:06 +0000 (UTC)
Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
 by mx.groups.io with SMTP id smtpd.web10.44854.1674653498449648384
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Jan 2023 05:32:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=iBjSVgP9;
 spf=pass (domain: gmail.com, ip: 209.85.161.46, mailfrom: akuster808@gmail.com)
Received: by mail-oo1-f46.google.com with SMTP id i18-20020a4a2b12000000b00510ebea37bfso557618ooa.6
        for <openembedded-devel@lists.openembedded.org>; Wed, 25 Jan 2023 05:32:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K+25IteYx/sSJTCN7z7kHHnNrHRl+8Ib5prqZS/ecqI=;
        b=iBjSVgP9Q7S6Xuk3vOURraGgmRcmO+0zTmgasY5HT6auZUpH9zyY9kMmWDFk0B0YxS
         /M24aIhnnu9OBrTatpPUdGNIcIJzO3c5/QJRYqgqLiGf0t0Of38460nD8AoXfI0e0gbX
         IlOO8MZO97f1QxHfMXQCLkGTbzoyaCJHAnTbKbylfz00lqgZyRpMDVlUbc3rFXdofTj2
         3NHO0H97QyvSbgd9Fqk5FC6DNGL1mD+PDuZZvTjkjvrnJ9uJORUF2pG5ZzSWxoQCnYLC
         /XrwdwpyraeudXP1fMXXb4z0KcejfVCH53vRV9Wv2NdSV/93vViv00WhSRoi0tefheKy
         ingw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K+25IteYx/sSJTCN7z7kHHnNrHRl+8Ib5prqZS/ecqI=;
        b=R9l2D7tFBly9RLwRYnCEIsAo6lVfvVguYK/SxsOq1DCFr9QpsZpG77v3h0KSC7eoZY
         fuQ+ldhM1C71f4XXHbIFjsxKCT19RePe7nGjwK1ZQfEh3AsF9Dn7CPTMNiTiWqSSUwI2
         far1yynsDHsH6HuKFmpPyyGM42Jkym0Wve/oyLvbZ3+YYTz5oAjx9hd3uDigYjx0HnpG
         7ijE+0xnjpAOZBDxADztNnnehhpEBpcjkX+sVF2bLYE2HCKpv9gar7Qj58+E2Lxhtba4
         jrFHg/SjlzjUfrZAQDSrWe+fxaQK26wtXkaHYbo1SActaxBVXut2pYT3Kscor95lpZED
         e3Vg==
X-Gm-Message-State: AFqh2kr88lV0kXtiEgpbeLnQ2mgLn00v4vQcsiwS5jf6l7C5pEbZghiU
	/gCfEFeq5NowPp2I8iivM5GYvI7oEao=
X-Google-Smtp-Source: AMrXdXv591y9pbLI6cg2r8kmY1UXa5z0+GK09rorTXDlYC5cBZ0ISq7uoEh2gjkItkFhqOnr9VGC2Q==
X-Received: by 2002:a4a:d0d9:0:b0:4f1:e491:c80 with SMTP id u25-20020a4ad0d9000000b004f1e4910c80mr14973521oor.2.1674653522909;
        Wed, 25 Jan 2023 05:32:02 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:9190:ba10:434e:23f3:d1f1:25c3])
        by smtp.gmail.com with ESMTPSA id b43-20020a4a98ee000000b0051134f333d3sm914383ooj.16.2023.01.25.05.32.02
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jan 2023 05:32:02 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [langdale 37/41] openwsman: upgrade 2.7.1 -> 2.7.2
Date: Wed, 25 Jan 2023 08:31:19 -0500
Message-Id: <7594435f6892ca7f9a37056c2e17263f3d7afbf5.1674653280.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1674653280.git.akuster808@gmail.com>
References: <cover.1674653280.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 25 Jan 2023 13:32:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100772

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Security
  - call setgroups before setuid or setgid
  - harden systemd service (https://en.opensuse.org/openSUSE:Security_Features#Systemd_hardening_effort)
- Bugfixes
  - wsman-win-client-transport: initialize certificate pointer
  - iniparser: fix buffer size
  - wsman-win-client-transport: plug leak in error path
  - memory.c: fix memory cleanup
  - Improve handling of HTTP 401 Unauthorized
  - Fix serialization tests
  - Fix Ruby bindings warnings
  - Fix Ruby plugin loading test
  - Fix rpm packaging
  - Allow to run tests from 'build' directory
  - Add Python XML test
  - Enable CUNIT tests

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit bdbb3eeb2bfaf2a03dd6ab2a2024775ab28306a7)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../openwsman/{openwsman_2.7.1.bb => openwsman_2.7.2.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/openwsman/{openwsman_2.7.1.bb => openwsman_2.7.2.bb} (98%)

diff --git a/meta-oe/recipes-extended/openwsman/openwsman_2.7.1.bb b/meta-oe/recipes-extended/openwsman/openwsman_2.7.2.bb
similarity index 98%
rename from meta-oe/recipes-extended/openwsman/openwsman_2.7.1.bb
rename to meta-oe/recipes-extended/openwsman/openwsman_2.7.2.bb
index 7fc5d4218f..84a00df8e7 100644
--- a/meta-oe/recipes-extended/openwsman/openwsman_2.7.1.bb
+++ b/meta-oe/recipes-extended/openwsman/openwsman_2.7.2.bb
@@ -15,7 +15,7 @@ DEPENDS = "curl libxml2 openssl libpam"
 inherit features_check
 REQUIRED_DISTRO_FEATURES = "pam"
 
-SRCREV = "6cdf3bee50388d8e5f70850322a4df57fd685a5e"
+SRCREV = "0120e256faa255d997d9a49d5207662c0b73d430"
 
 SRC_URI = "git://github.com/Openwsman/openwsman.git;branch=master;protocol=https \
            file://libssl-is-required-if-eventint-supported.patch \
-- 
2.25.1


