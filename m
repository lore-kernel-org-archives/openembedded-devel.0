Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43574C47DB7
	for <webhook@archiver.kernel.org>; Wed, 17 Jan 2024 01:13:34 +0000 (UTC)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
 by mx.groups.io with SMTP id smtpd.web10.1325.1705454008138866974
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Jan 2024 17:13:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fmFKpNIO;
 spf=pass (domain: gmail.com, ip: 209.85.128.169, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-5f69383e653so105165367b3.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 16 Jan 2024 17:13:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705454007; x=1706058807; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zA9NDAK3OJNevYke9QRfqXfzk7nRSkkUj2Osrxgltwk=;
        b=fmFKpNIOZwXrKWyBUA+M4x25nvRmZOsrj9SlrukHyWuvyq+MQmC9R57K3NpCIJdJy9
         EnmyiugAHAJQsdRcOY2cIcHJyvX2Dqjj+KJ0QOIKLVnRH+bK6Nh+YKo8GpzPwrZXCsw5
         pCC52CA/X+IeMvUQ2Dpus2UN32jWwmNBVO1+FUvbYVssmO+E0MR3p8Y56GBhzpTVmQ6D
         SL0U30z/E/itPVGT7MtWO+tOXhVv3Rz/qtf8CySnbrjOb/jQgn/4QZUxqedvc84LsdVP
         eccgV2mzlJCMTUBoW537U8vpt2FEzTf0dQaHIrrXjhYl3EWDTyMhhEKVAQtb82nE7sjV
         0viA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705454007; x=1706058807;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zA9NDAK3OJNevYke9QRfqXfzk7nRSkkUj2Osrxgltwk=;
        b=oT+F2J2ZL6rgSow4TXrrzf95CFxnc6cDcJTAZShBnq798QB3568arKZ41IsvSdla9B
         Ng+XeqsLQIB8R2onWWxQBoDd0D18UJMD8Mj0GPasEipoHPrzCyTEFypaP7wxdGOgop+h
         ESd5yW/H2gnxjyYl1rPSK10fB3tXuGmq4b73whTp6jC5cxyG0X3z0vOlhs6ZzWGApvpA
         XIHEAOcLJj0XURewlCpP1gH/8YbVCoCJwwhkp1wGtoj5AzJv2CbWGzDrvl/RNwhwl0lA
         rM0orAMjheguZPanBaZK+oBwiNfHxOYPTKcXt2qFQOcXarwyoLXeNl8/gPuBmJr0O5Z+
         T6Sw==
X-Gm-Message-State: AOJu0YwGHWSRzbIuH7zV0SKnn9q83UF0Qow5FQMYC0WVQQQ7lDwAXft2
	m0SYtDnjoCAfQayA9krrUyIOYIc7tL5ojQ==
X-Google-Smtp-Source: AGHT+IFY5Ho6JSLKIuDeiw5G1LOXZFYDKJlSl5zUjudd2PoEdWx7kUmc/MTYUqt1SnvTNsbsovZCzw==
X-Received: by 2002:a0d:cc86:0:b0:5ff:5723:b563 with SMTP id o128-20020a0dcc86000000b005ff5723b563mr1507510ywd.95.1705454007103;
        Tue, 16 Jan 2024 17:13:27 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:9190:ba10:5290:e922:866d:63a6])
        by smtp.gmail.com with ESMTPSA id s188-20020a815ec5000000b005f06f997e22sm5426446ywb.50.2024.01.16.17.13.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jan 2024 17:13:26 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Yi Zhao <yi.zhao@windriver.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][nanbield][PATCH 09/11] samba: upgrade 4.18.8 -> 4.18.9
Date: Tue, 16 Jan 2024 20:13:18 -0500
Message-Id: <20240117011320.1856392-9-akuster808@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240117011320.1856392-1-akuster808@gmail.com>
References: <20240117011320.1856392-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 17 Jan 2024 01:13:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108319

From: Yi Zhao <yi.zhao@windriver.com>

This is the latest stable release of the Samba 4.18 release series.
It contains the security-relevant bugfix CVE-2018-14628:

    Wrong ntSecurityDescriptor values for "CN=Deleted Objects"
    allow read of object tombstones over LDAP
    (Administrator action required!)
    https://www.samba.org/samba/security/CVE-2018-14628.html

Release Notes:
https://www.samba.org/samba/history/samba-4.18.9.html

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit f4c3c747d6df6015eb1231f2867ffe43ddb9620e)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../samba/{samba_4.18.8.bb => samba_4.18.9.bb}                  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-connectivity/samba/{samba_4.18.8.bb => samba_4.18.9.bb} (99%)

diff --git a/meta-networking/recipes-connectivity/samba/samba_4.18.8.bb b/meta-networking/recipes-connectivity/samba/samba_4.18.9.bb
similarity index 99%
rename from meta-networking/recipes-connectivity/samba/samba_4.18.8.bb
rename to meta-networking/recipes-connectivity/samba/samba_4.18.9.bb
index f80742640f..73ceb7b754 100644
--- a/meta-networking/recipes-connectivity/samba/samba_4.18.8.bb
+++ b/meta-networking/recipes-connectivity/samba/samba_4.18.9.bb
@@ -31,7 +31,7 @@ SRC_URI:append:libc-musl = " \
            file://samba-4.3.9-remove-getpwent_r.patch \
            "
 
-SRC_URI[sha256sum] = "4fb87bceaeb01d832a59046c197a044b7e8e8000581548b5d577a6cda03344d1"
+SRC_URI[sha256sum] = "f455c1d6351ed3a36fc2cb6e8ab1bfd0effe54a56686ffd495d64ab52d50f245"
 
 UPSTREAM_CHECK_REGEX = "samba\-(?P<pver>4\.18(\.\d+)+).tar.gz"
 
-- 
2.34.1


