Return-Path: <ninette@thehoodiefirm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE781C30658
	for <webhook@archiver.kernel.org>; Wed, 26 Jun 2024 15:06:21 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web11.29433.1719414377972218986
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 Jun 2024 08:06:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@thehoodiefirm-com.20230601.gappssmtp.com header.s=20230601 header.b=K8rcWgU7;
 spf=neutral (domain: thehoodiefirm.com, ip: 209.85.210.177, mailfrom: ninette@thehoodiefirm.com)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-7066cba4ebbso2955767b3a.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 26 Jun 2024 08:06:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thehoodiefirm-com.20230601.gappssmtp.com; s=20230601; t=1719414377; x=1720019177; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=9KWkGQIY9u3NU4DmJbbOhcbBDX3ynXdvRgYPsOC7nq0=;
        b=K8rcWgU7xQfT6EfUkny1hURWgd0CHTxAa2+DDBZnmazdQMezTElONVa6Wfnux9QHog
         grWw/k18NcWrXqjWHJ67i6MHTx+eHSD77vYpd5z4952UBPyLOsNHRAi2lKc6hYt4guSb
         LSRMd/JC8eXh2U7F322tKw+eTyBZWD01kkvUqLgdd670qkyrv5hzudIP44QFGTfa5gUj
         gTboI6jDaWYHax5R6zWJUBlCAzBUtqcAKTm3gM99Dx2DjohYo07c1fP6O5jr9Z/jWcgB
         VEX7M50PczSOb8dtbnNteRd8PGnVNyy17+0fCiiT1Awn0Bd6lAhUqdzDST3BDbnIj8Yp
         6F0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719414377; x=1720019177;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9KWkGQIY9u3NU4DmJbbOhcbBDX3ynXdvRgYPsOC7nq0=;
        b=F9ZJoz49K1PBt0tzPG8iiQ/sdZ6OkUj//xensSKOD2Nl2pbyLgopgi041sI1FgEiFp
         0upUCSy4Dy4WYGKuRjUBrXWrAjx1sI0bpbF/zv35FrUfJJHodd+/0nwbE1FzwbMMg7oq
         4LXVNdJ9F3fu3DT1Rmbfv4/d1cgWDUFDGxRCNFMW1AXA4RAKTGZdf0VSNdMvgfIsHsxp
         rubzCqTjVLeEYaJfuRHBgFKSGIq2Mx8kgtg9ClxMNbMydDXFwe//3f5nOBeXZErGuFF0
         vdpf0vVsrLagobtWRWzbswG3uc9GIVgbEeT53NTLIH0pFTKFoOs+N1mGQcVJq4w6jKcX
         Ugyw==
X-Gm-Message-State: AOJu0YzbH4K14KhHONQp0Y/0bC7bzHxdhpCfBB57lK4+B6Ch7hDzy1x+
	xVgA4z601WQN4HQLgXlAqhqZ2rlbJP2PlAvQIW++jyMGsfbwDq1gTqXyj8wfFxqZUyObZebEW23
	U
X-Google-Smtp-Source: AGHT+IE5nyHTJ+wG+N3zJC+G+h2tzPMi/G/EOaFm3GIXhB9kLbVlDa/XYrtz6gi7mmIpAi7/FxIk/Q==
X-Received: by 2002:a05:6a20:3ca5:b0:1bd:23de:e7e4 with SMTP id adf61e73a8af0-1bd23dee903mr4953937637.3.1719414377330;
        Wed, 26 Jun 2024 08:06:17 -0700 (PDT)
Received: from localhost.localdomain ([50.54.151.77])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7068e088e1esm5015143b3a.213.2024.06.26.08.06.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jun 2024 08:06:16 -0700 (PDT)
From: Ninette Adhikari <ninette@thehoodiefirm.com>
To: openembedded-devel@lists.openembedded.org
Cc: engineering@neighbourhood.ie,
	Ninette Adhikari <ninette@thehoodiefirm.com>
Subject: [PATCH 1/1] apache2:apache2-native: CVE status update
Date: Wed, 26 Jun 2024 08:06:12 -0700
Message-ID: <20240626150612.29837-2-ninette@thehoodiefirm.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240626150612.29837-1-ninette@thehoodiefirm.com>
References: <20240626150612.29837-1-ninette@thehoodiefirm.com>
Reply-To: engineering@neighbourhood.ie
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 26 Jun 2024 15:06:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111108

Update status for:
CVE-2007-6421, CVE-2007-6422, CVE-2007-6423, CVE-2008-2168

CPE is incorrect, the current version (2.4.59) is not affected.

Signed-off-by: Ninette Adhikari <ninette@thehoodiefirm.com>
---
 meta-webserver/recipes-httpd/apache2/apache2_2.4.59.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.59.bb b/meta-webserver/recipes-httpd/apache2/apache2_2.4.59.bb
index 1632c6ccb..6dfecef8d 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2_2.4.59.bb
+++ b/meta-webserver/recipes-httpd/apache2/apache2_2.4.59.bb
@@ -37,6 +37,11 @@ DEPENDS = "openssl expat pcre apr apr-util apache2-native "

 CVE_PRODUCT = "apache:http_server"

+CVE_STATUS[CVE-2007-6421] = "cpe-incorrect: The current version (2.4.59) is not affected by the CVE which affects versions from 2.2 (incl.) to 2.2.8 (excl.)"
+CVE_STATUS[CVE-2007-6422] = "cpe-incorrect: The current version (2.4.59) is not affected by the CVE which affects versions from 2.2 (incl.) to 2.2.8 (excl.)"
+CVE_STATUS[CVE-2007-6423] = "cpe-incorrect: The current version (2.4.59) is not affected by the CVE which affects versions from 2.2.x to 2.2.7-dev"
+CVE_STATUS[CVE-2008-2168] = "cpe-incorrect: The current version (2.4.59) is not affected by the CVE which affects versions up to 2.2.6 (excl.)"
+
 SSTATE_SCAN_FILES += "apxs config_vars.mk config.nice"

 PACKAGECONFIG ?= "${@bb.utils.filter('DISTRO_FEATURES', 'selinux', d)}"
--
2.44.0


