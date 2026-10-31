Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.694.1793419075557085796
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 30 Oct 2026 20:57:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=n8ntpyCg;
 spf=pass (domain: gmail.com, ip: 74.125.82.174, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-353804b591eso2156856eec.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 30 Oct 2026 20:57:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793419075; x=1794023875; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FhlLJrTQkyJBfhuIR/uzKNfVh+6ml6n4PbmhmrviERw=;
        b=n8ntpyCghGP9zivu4VmqErjNmSbV+NN7L9JQPasUi1Ju+/nW3Kbr6EMNsHlqUoRiaY
         rpO+eNcrC9z2LkjhztM4QIenXxllC7FKpdfz4VW3wYY8sqGP6VeOX4/Jh8CmkOiwAAMp
         Rtu72oSdyJbyZ6vm1U+tIwDpayZ52/s4UFUh2ILmN//tXgoOT/ZKiGtQ0EaEB8XNY2Sb
         wMYsImPMMMz3ArbN72fWb2ufVCmP92Y0RRYJNrcUe1nXCiZ43k9MB7/bguJJhLufkVrY
         78lklJEcw/QpbfdeKBiaObLb7BxCmJmb2f/0vgMWawkcONPCuuZoDlHK64Ukf4etE2FZ
         rV9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793419075; x=1794023875;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FhlLJrTQkyJBfhuIR/uzKNfVh+6ml6n4PbmhmrviERw=;
        b=OC6iqXgcuEY2rZVHIhaJa0fEqElcstgKV0PFBUbzn4Unuti2CKRKLI0kcggcpOsgRM
         EePEFER1GaAkznPvCbJaZe4PAwF6T7iss5KXpXsaq7jypFYUtBhlYV/iwfXTZOlVQMHu
         RvLOmLACg+kIj/pacZRj+jzCH4k/YUwgg0AJo+ER6QrFnebdKkgQ+SdYnQjHV/ZqsxJc
         nhRVVT0jPjD3atwpcHE1RTpsbsWP6jT/DcNBG2WTb8q/cyB5dQDoOfPmsIIpxd2ALp7d
         08p2eREHldB4yhNt9SqZioJ0ZdYcdbUWHERKbizyd4fL6p6OLCnOG3vzGc5FixQ6NT5V
         37Og==
X-Gm-Message-State: AFq9FYJUbN3sPxwoe02cXdytKVNKmdkbZnqX3a+POLXJmxrwfl4gksO3
	0HMTan71BIWpMvdxF6hrU/ieN7GtwwlETwDQTceM96U+1/mvCRdsyV3z0GCDWWGMTyY=
X-Gm-Gg: AYBFou1San7ECV/bTyIgyZXJo2zcj8b5FRCr9o1jfF4Ch/bG+7dJEcCIlmqSk8nj7iP
	Pu5piDe+JrZettIEMAAFUCXTLX3bbIkHTp1OgmzjRzr+OVxmKvg5nvmiFYpbXTQUhKBQtOfEFJi
	s9utRS7dE01YiQR7P+vK1oUK9nvWuaftD+K+/mU3EPZomnhZZTgt7harnVvtWThGbsUvt4HFOZ3
	Bvnw8jkwjiosNPv1VDB4+pFJH0MPXA7IPEPQ6e2HCtfKwfBsnw7GK8JxVRyZjxeix6Y6liyO4qL
	o2Dzj3zKaUclp6J5nJgruXY9fuDOIM2psk+f6dW2XjUuxtJtdraX2rLT9mY+cIB9IW6Sa7aZasU
	Q/3bhc/Bh93e7ptQgy85utkOufb6zRWxwcUSjreNP4o33/vijbopoZSju7DFsxr6tl3oKHpG9OO
	sdp0N7yQP4YjetJGjjvCFfQWvBCXoWCohN72/K6Q4WLIG3jwEHM53NiW21SZuG1CobxxSEUmNqB
	7NPNbcQPC0Fs6KWzQZHHoOa7VbhfVWgD2wufKm+pLpI9niOGD5tzy+51v0I+timNMxXvhVhhkCF
	H08l7e/VYl8WXEWcDDq8fJ2xfafij7maiuy4j5emBjpipaqKcpq+bpHRbUzn7Bliyrm7NDP2q2X
	xf4lOWGK32D0jPrz93mTH9BvxFs7eh3aLQpLwmdphdV7AVeGBH1UppDDIZxZ4VPBQrqbLqs4pqt
	Z1f524CpHworIX5/P2JcFY6JcZWHje5HC83sZix0GypCO150Wi2iBQ01O4UxsIfcbPE7wQZgEGO
	SaH65OBo7+6jTw77++yOw4oGe8u8T5ePb3Zm2+kX8jB5o6Mwb94J9mZOzhRlPLblqx/UzZO6Aou
	DEou
X-Received: by 2002:a05:7301:648d:b0:36a:f55:5c6d with SMTP id 5a478bee46e88-36a42388ffamr6434295eec.14.1793419074730;
        Fri, 30 Oct 2026 20:57:54 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42a5fb97sm13687837eec.23.2026.10.30.20.57.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 20:57:53 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 03/10] python3-opentelemetry-api: Add missing runtime dependency
Date: Fri, 30 Oct 2026 20:57:40 -0700
Message-ID: <20261031035748.2130261-3-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261031035748.2130261-1-khem.raj@oss.qualcomm.com>
References: <20261031035748.2130261-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Sat, 31 Oct 2026 03:58:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131713
Content-Type: text/plain; charset="utf-8"

From: Khem Raj <raj.khem@gmail.com>

opentelemetry-api requires typing-extensions.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../recipes-devtools/python/python3-opentelemetry-api_1.45.2.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-opentelemetry-api_1.45.2.bb b/meta-python/recipes-devtools/python/python3-opentelemetry-api_1.45.2.bb
index 4d903d1373..50d0ce77a4 100644
--- a/meta-python/recipes-devtools/python/python3-opentelemetry-api_1.45.2.bb
+++ b/meta-python/recipes-devtools/python/python3-opentelemetry-api_1.45.2.bb
@@ -7,3 +7,5 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 SRC_URI[sha256sum] = "d7b0008e21e5fd61cbe7a7f34ca3b6905a78ab677d9bc395e299359c75cda6b4"
 
 inherit pypi python_hatchling
+
+RDEPENDS:${PN} += "python3-typing-extensions"
