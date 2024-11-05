Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1446DD2B94E
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 14:36:50 +0000 (UTC)
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
 by mx.groups.io with SMTP id smtpd.web11.19498.1730817403148713811
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 06:36:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=H86gWfEN;
 spf=pass (domain: gmail.com, ip: 209.85.219.173, mailfrom: akuster808@gmail.com)
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-e292926104bso4744999276.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 06:36:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730817402; x=1731422202; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jQPpzrrGFS5wGamk9WfugMfAZ7A0hJDMONeG1ntxMVw=;
        b=H86gWfENLL/5fwvy+8WvOdVBTqVv6z/iC+GltHi3T7pqaKCq0ID++XAVRxTAEzNpbl
         grVuyj9GXW7hr/3xtIkY6zSV69AYPMN+KGRByJ1MHQYDv1tRU+UKp3eYn6/4RRLGXSza
         L021Zo4zSTn3YDcGBCfvi0m7vWPISbelrBcNqvxww5ibHzI3tlKaqjUKp+iL5ITATm2G
         edKK5hE/pDI3FTYoJE7KrC2bV4OQ/rpIFHgriHY7uLPLl36OU1m0kVd23sCH4w9I+kYx
         PVe6kHUkzeeivIcMDtWjxvRO+MnVUQuxrxEBlv6sBtAukk/U+L1MmuEWk2UfXAbuXxjE
         qaTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730817402; x=1731422202;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jQPpzrrGFS5wGamk9WfugMfAZ7A0hJDMONeG1ntxMVw=;
        b=i3qB79bp9feP5Vmgae+U5sbE9RZTZIvbuYC7AZAi3AscKfoo9QLuc50ntSCNcDW1d9
         BZ21eEiRHT/ir5jHbNAE1rGcMbfzBNQg0sH+dWvieCR65ijn1rTjV/IcMUizFql040gs
         caeM0+bIuTDuA7aT6PG5+7rqjm0b4zF+Tr5o7wX2egcH4UaNrhjaYKpileKPsebzkkWp
         vqA0zRZouYQpuFkIVDwM3fpA6jd5nL2dOXka2lnrUP/bZZmz6Osu5O7mzjAdLkaJPXhN
         EU34+tzs3prcFctzaCBFICgfPLUxJ6cJ40occG2BjnWsz0WkBvoGOe/TMDmyQeWdWSG+
         bfMw==
X-Gm-Message-State: AOJu0YzE5pbcn/S1/+7dVX5t+rEY5hY9mCf1Uiwfle+5oMlodc603Fai
	a1e73rE5Qva2XRs+0+C9n2GOdt/YvKYc9lSYSXCL17Pj9eiMWPN+UZylBQ==
X-Google-Smtp-Source: AGHT+IGDrJd9kJpIDM91sQrBiS+3p8mACkzliTuQUqj9/fj6DPI0Upk1FzX1mvYq+21wGBu0RGM1AQ==
X-Received: by 2002:a05:690c:23c2:b0:6e3:156e:a917 with SMTP id 00721157ae682-6e9d89b12b9mr362442757b3.14.1730817402206;
        Tue, 05 Nov 2024 06:36:42 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:45dd:7000::29])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55c8723esm22495977b3.126.2024.11.05.06.36.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 06:36:42 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][styhead][PATCH 06/90] libmanette: upgrade 0.2.7 -> 0.2.9
Date: Tue,  5 Nov 2024 09:34:31 -0500
Message-ID: <20241105143638.2301245-7-akuster808@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241105143638.2301245-1-akuster808@gmail.com>
References: <20241105143638.2301245-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 14:36:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113423

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
* Update and clean up the game controller mapping database
* ManetteDevice
 - add manette_device_get_mapping() and manette_device_get_guid()
 - Handle keycodes before BTN_MISC as well
* ManetteMapping
 - Allow to map paddle1-4, misc1-6 and touchpad buttons
 - Improve error handling
* ManetteMappingManager
 - Check if user mapping file exists
* Tests
 - Test default mappings

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../libmanette/{libmanette_0.2.7.bb => libmanette_0.2.9.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/libmanette/{libmanette_0.2.7.bb => libmanette_0.2.9.bb} (87%)

diff --git a/meta-oe/recipes-support/libmanette/libmanette_0.2.7.bb b/meta-oe/recipes-support/libmanette/libmanette_0.2.9.bb
similarity index 87%
rename from meta-oe/recipes-support/libmanette/libmanette_0.2.7.bb
rename to meta-oe/recipes-support/libmanette/libmanette_0.2.9.bb
index db05422699..2e59401892 100644
--- a/meta-oe/recipes-support/libmanette/libmanette_0.2.7.bb
+++ b/meta-oe/recipes-support/libmanette/libmanette_0.2.9.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 DEPENDS = "libevdev libgudev"
 
 SRC_URI = "https://download.gnome.org/sources/libmanette/0.2/libmanette-${PV}.tar.xz"
-SRC_URI[sha256sum] = "cddd5c02a131072c19c6cde6f2cb2cd57eae7dacb50d14c337efd980baa51a51"
+SRC_URI[sha256sum] = "29366be5452f60a74c65fc64ffe2d74eddd4e6e6824c2cefa567a43bd92b688f"
 
 inherit meson pkgconfig gobject-introspection ptest vala
 
-- 
2.43.0


