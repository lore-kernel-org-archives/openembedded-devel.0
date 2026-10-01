Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7F58CA5FC1
	for <webhook@archiver.kernel.org>; Thu,  1 Oct 2026 03:04:07 +0000 (UTC)
Received: from mail-pz2-f37.google.com (mail-pz2-f37.google.com [74.125.228.37])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3436.1790823838981165768
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 30 Sep 2026 20:03:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Qu5igOKa;
 spf=pass (domain: gmail.com, ip: 74.125.228.37, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pz2-f37.google.com with SMTP id 41be03b00d2f7-cc7d1403bbaso1038694a12.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 30 Sep 2026 20:03:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790823838; x=1791428638; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mgS5K79BLUJmTIbcRTseQp0zYSuC5rkB6cMV7/zUQSI=;
        b=Qu5igOKaDxRtzCIUHY1Ox7JRKlzny6jfxMGndCvJgNQG25h2CFPKC6eJbgIZPrNPWH
         BxB9iyr6qaJV3giAjPpE/hSBDbNFwRn8BYCdtHm61bIKzxdHYhvJkRiI7PtfO/166DXZ
         8xPlC/mCqFJ918xla89c9bA5MFPw0NK4UvZgYP9BVS9s/eo3FiydQG41fWtOz/DeCDeI
         2PlvOfYMHK5JmZDkmntPzXqJP1MgQpxnZLjaP6a9iDBzaOUYpdEqLB/kChcGE5Qkt3WQ
         /XcZa0Tw+aUMtbOUePF74TwezR8nluu0JQAAmeSSdwjkOrVzsOxYCFLboF17KmrJae8p
         w5vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790823838; x=1791428638;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mgS5K79BLUJmTIbcRTseQp0zYSuC5rkB6cMV7/zUQSI=;
        b=KIPo0ExBEtNrRZSJqutMQiWrRlnsgLvQ2CqQZ5BxZN12WvwKUJop3oPVQdWCyZVgcg
         dGNwRNsN+NVZVcTZHzsEG6cukHkPINrNdTgE55IE8lziltNwhKETQHqdj/h5MctoE9Gu
         vu6PdM5TP7ag2MeVtxSPTFBnDjvIN0plPlhKz5k2jsOuMHhNhgA3BuOtSoxXNF/9ga5E
         9SnRFQLA4tKUK0DkIXBSvPx+mmZzemVAdyySKaI4ZYDNF2UqKpGtLqUH+qk+MAa2BOzu
         Wz3CgMC/V7w/P8+JRuqkzfDK80akJyweP76QsJ1Q8CqpX3Pf3UC4kdxrtDVJffdniWLj
         D/YQ==
X-Gm-Message-State: AFuF++lX1+Qia3Y6GfJ/Tful+KRg9PowKD17+wqnPKfvONHkxqWRy69L
	624pNpzczamUAesudo13wJIoe66WCPKX/yZo5QpyJeaUDA2ayeUlHKcMLwn21A==
X-Gm-Gg: AYBFou2Yf4BQQbzk7pb8yQM/GpO3H3E1AKjUF744226ZTfIJyckQEv1BzUye6TAtFlI
	MFQ4zBPh6LKSfxg1McrBxD+IFlEBPzieKmBglJXO/MgHCGHAnmqAOlTJ++dsScZgJcUH0z0kekQ
	2A0cm0DPiPDLGVhqKV+l+nqq0KDHksQU1DrjFX4fi59bd54z7sPCl+ND8+2SPq8eCmY0u5yrU+a
	MVkdz3qDTzv80/z2joniaKBfzj6TOnAZ7mNRxh2lL3IkrDr8Rc2wlKph1M2HhhNheEHVhTbGZ32
	0+vyBVCpPeFckVEt3r2p7bkJ4vZc8TufX28xW+eZ4r3mnzNqx2dmJOuQpnHmd8rJta++eJeFKew
	JkfR3vt6vhTfj3KFKiXI8gBTg0b1323g1ANTUF8rm/pWyaEMKNCDAWuBJVVgFBXbRbdFjOdNe7Z
	ePOLwvgWT8LnqHCi73SGqCA3YCx4sTL+0+L+U3qholchH42oIUgGpDpl++038jlc1TLayZcrYm4
	cQXAyk8y9txmhunOuOAp2z7AQ==
X-Received: by 2002:a05:6a20:9f03:b0:3de:589b:2356 with SMTP id adf61e73a8af0-3de9e74b4b1mr3251576637.66.1790823838237;
        Wed, 30 Sep 2026 20:03:58 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-88819db440csm357042b3a.60.2026.09.30.20.03.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 20:03:57 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][PATCH 11/17] iscsi-initiator-utils: upgrade 2.1.12 -> 2.1.13
Date: Thu,  1 Oct 2026 16:03:23 +1300
Message-ID: <20261001030331.1581021-11-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261001030331.1581021-1-ankur.tyagi85@gmail.com>
References: <20261001030331.1581021-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 01 Oct 2026 03:04:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130560

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://github.com/open-iscsi/open-iscsi/releases#release-2.1.13

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 ...nitiator-utils_2.1.12.bb => iscsi-initiator-utils_2.1.13.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-daemons/iscsi-initiator-utils/{iscsi-initiator-utils_2.1.12.bb => iscsi-initiator-utils_2.1.13.bb} (98%)

diff --git a/meta-networking/recipes-daemons/iscsi-initiator-utils/iscsi-initiator-utils_2.1.12.bb b/meta-networking/recipes-daemons/iscsi-initiator-utils/iscsi-initiator-utils_2.1.13.bb
similarity index 98%
rename from meta-networking/recipes-daemons/iscsi-initiator-utils/iscsi-initiator-utils_2.1.12.bb
rename to meta-networking/recipes-daemons/iscsi-initiator-utils/iscsi-initiator-utils_2.1.13.bb
index 9275835f1a..1481b1522f 100644
--- a/meta-networking/recipes-daemons/iscsi-initiator-utils/iscsi-initiator-utils_2.1.12.bb
+++ b/meta-networking/recipes-daemons/iscsi-initiator-utils/iscsi-initiator-utils_2.1.13.bb
@@ -12,7 +12,7 @@ DEPENDS += "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-SRCREV = "7e00642c40123e0b3f949e74c3945872c17a407e"
+SRCREV = "40f6b2944f8a8553ad57975d1f2bb512cc23d7d1"
 
 SRC_URI = "git://github.com/open-iscsi/open-iscsi;branch=master;protocol=https;tag=${PV} \
            file://0001-Makefile-Do-not-set-Werror.patch \

