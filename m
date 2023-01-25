Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6201C636BD
	for <webhook@archiver.kernel.org>; Wed, 25 Jan 2023 13:32:06 +0000 (UTC)
Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
 by mx.groups.io with SMTP id smtpd.web10.44854.1674653498449648384
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Jan 2023 05:31:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=TZYmxLFJ;
 spf=pass (domain: gmail.com, ip: 209.85.161.46, mailfrom: akuster808@gmail.com)
Received: by mail-oo1-f46.google.com with SMTP id i18-20020a4a2b12000000b00510ebea37bfso557571ooa.6
        for <openembedded-devel@lists.openembedded.org>; Wed, 25 Jan 2023 05:31:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bz+myrazPu957VhsgDcwHJyiMBsoBL3TPVoApBwJeTQ=;
        b=TZYmxLFJAm3H3lNY/UjDwcBoaoEH0QuCWMsWg2ku/3SuSomNxpd8uwsAVTnwxDxVMr
         Z/uJAveiRT5l4MBgNACPhykPENaahqwHOA1nwLLWXhQxokcpePFBnnimmkGLdiGf+Pq6
         FeZq1zClzlhLFWHm09iDddx710WjqImwlyHUOMxOAP2ibmZ4sRh89c8DrhZ9AP8+/pvA
         GBEimHMD34g5D2I2xI/F1WPJkEf8EeHVvllqGyTnRXo626cAhRzrPqxKWLQrYilhnb+3
         XJv8R+SZEU2UulLQaSnQvqZaCLaOZBasU3b68X07bmHbaaA1PN+W0mZKM/oTbH4pYSLb
         LCgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bz+myrazPu957VhsgDcwHJyiMBsoBL3TPVoApBwJeTQ=;
        b=Kb4ROQm/XKmV6eLd32FhbKOdelFdBPopZmgOxJh5kf2O3kqnikeMMLulbgbmispOfQ
         kioecAI/6INIfGIcnd4NMe13ocNof4IZh4pQ8GeBUfqClaCn+23mPnZ8bGdnShl2lTWd
         YEL/QpRRMeNQLU03huIVxlcY2l5t2tNv7e84EjqOB3x0dtcLLAsu4kJ67FqsKYEfqep1
         OJ2Ems7Hhoq4UWii+7Aya+RiI0O422CuhB8oB/SwhTCmy+vcpDK1OK5XsLzTDONBztfu
         7FmW1fyGqcU0m0cu2baCsbbC24x4NXvGFy4MnlPXJyRsDPIJjbFz7X+xkK1BVOd1dX7R
         6Png==
X-Gm-Message-State: AFqh2kroBw76lhiXSbs1tMbhqyGqUkXK6TEo/RlhTyThW6Y0H5AAoLP9
	COIXvjzsaywD+Me5QsivTOMlIrpR4Vg=
X-Google-Smtp-Source: AMrXdXu2Lj6AAZngdnfvGbwmQgXZ6BS0h/6UfMGy8dP/wbzVqwUErljvnOmrGGMlGM5L2NbamEmxDA==
X-Received: by 2002:a4a:e54a:0:b0:4f2:c7aa:a7db with SMTP id s10-20020a4ae54a000000b004f2c7aaa7dbmr13886364oot.2.1674653517713;
        Wed, 25 Jan 2023 05:31:57 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:9190:ba10:434e:23f3:d1f1:25c3])
        by smtp.gmail.com with ESMTPSA id b43-20020a4a98ee000000b0051134f333d3sm914383ooj.16.2023.01.25.05.31.57
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jan 2023 05:31:57 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [langdale 31/41] redis: Upgrade to 7.0.8
Date: Wed, 25 Jan 2023 08:31:13 -0500
Message-Id: <1457a1562a636111bd51b3031656570526bf0952.1674653280.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1674653280.git.akuster808@gmail.com>
References: <cover.1674653280.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 25 Jan 2023 13:32:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100766

From: Chee Yang Lee <chee.yang.lee@intel.com>

Upgrade urgency: SECURITY, contains fixes to security issues.

Security Fixes:

(CVE-2022-35977) Integer overflow in the Redis SETRANGE and SORT/SORT_RO
commands can drive Redis to OOM panic
(CVE-2023-22458) Integer overflow in the Redis HRANDFIELD and
ZRANDMEMBER
commands can lead to denial-of-service

Bug Fixes

Avoid possible hang when client issues long KEYS, SRANDMEMBER,
HRANDFIELD,
and ZRANDMEMBER commands and gets disconnected by client output buffer
limit (#11676)
Make sure that fork child doesn't do incremental rehashing (#11692)
Fix a bug where blocking commands with a sub-second timeout would block
forever (#11688)
Fix sentinel issue if replica changes IP (#11590)

Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../recipes-extended/redis/{redis_7.0.7.bb => redis_7.0.8.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/redis/{redis_7.0.7.bb => redis_7.0.8.bb} (96%)

diff --git a/meta-oe/recipes-extended/redis/redis_7.0.7.bb b/meta-oe/recipes-extended/redis/redis_7.0.8.bb
similarity index 96%
rename from meta-oe/recipes-extended/redis/redis_7.0.7.bb
rename to meta-oe/recipes-extended/redis/redis_7.0.8.bb
index 58055166cc..fe1db9f986 100644
--- a/meta-oe/recipes-extended/redis/redis_7.0.7.bb
+++ b/meta-oe/recipes-extended/redis/redis_7.0.8.bb
@@ -19,7 +19,7 @@ SRC_URI = "http://download.redis.io/releases/${BP}.tar.gz \
            file://GNU_SOURCE-7.patch \
            file://0006-Define-correct-gregs-for-RISCV32.patch \
            "
-SRC_URI[sha256sum] = "8d327d7e887d1bb308fc37aaf717a0bf79f58129e3739069aaeeae88955ac586"
+SRC_URI[sha256sum] = "06a339e491306783dcf55b97f15a5dbcbdc01ccbde6dc23027c475cab735e914"
 
 inherit autotools-brokensep update-rc.d systemd useradd
 
-- 
2.25.1


