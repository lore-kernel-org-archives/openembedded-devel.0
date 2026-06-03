Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E7CACD6E64
	for <webhook@archiver.kernel.org>; Wed,  3 Jun 2026 09:42:18 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15894.1780479737759425598
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Jun 2026 02:42:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=WKm7G6tM;
 spf=pass (domain: gmail.com, ip: 209.85.214.173, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2bf1f074a12so54998145ad.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 03 Jun 2026 02:42:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780479737; x=1781084537; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fbPAEYY7aLnA/MVJ0mdRhD3ogWRbtDZe4/bY4fMDm9c=;
        b=WKm7G6tMBwSvAn5QsZWiHZn1Hr0ohwmHUuRBLB1vztU+VA1QMsXq+VE6Vf+LiUI7zk
         eWowpfvtFhycxBn33j9Y1KlQLQml4NdVEN03WYLgQ4kPK7zIBL4wJEqCX5pVvlQ23rnF
         S0k24vxwzt45jHfvs8q/430tuRcmqqPKcSSHWhBiAs2qQkbHTle9x5GdUVsUMAC7P0GQ
         QWWSkzXqSTzvK+rpCXEgNFtKupcsqjp9CSet/qRI+Ry/Bgpk2xjiGACtBFQPI3QpGObZ
         zsg9ShcoRPQJefitO0H63npsewhoLn/js1+nQyJMT36WiANuEDjr9pPto+DEy6m4HIBy
         9Jqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780479737; x=1781084537;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fbPAEYY7aLnA/MVJ0mdRhD3ogWRbtDZe4/bY4fMDm9c=;
        b=gJwtIWqU9ZP6loIA454RLi1ggkL4XDHqK7pBkke0z2ynQIxe03qNTMuM5OAFuBvHIf
         YJptDXxRStpwWYqUciQfCm2jZLxkh5MLZFMk+tNd1BHRVwAV8oO8mrlhbUdqMXcQ/DCn
         ZegPRUecTj1fgDqda8w6cO2xDTqTh/RmUhDBjOSXPeEII+XDtyJYH3FvLXFjQht9iCP6
         LRTJDwEQaG+mu4wIXdEJstoaB3hNuTLm1pvgBfFQPAWU0F9lhtYr1lwAT6clV0F3B1lX
         NzDsm9pBNV73OnKAY5EeCYhO8kNYvQeuH3E5P17RqNHsJ10xFD190v5aj8m7SpHrbGMS
         qB/w==
X-Gm-Message-State: AOJu0YyZF4YY/j+1KDmiGyC65k8PTinmsjL1FJdN5GREMuo1pZuz2Yei
	yS5a0DH4CYvJGqwBTivWGcjoECTWc0XQUjyvyVjWHozhrrE0uCVd2wP7HcqUAg==
X-Gm-Gg: Acq92OE8eA6LgzoeoewV7Lsm3A5g2WuD56QdVdSfMxXm6SsTJM2gTl8CqbQEsfZKmnz
	24392gVW/6xzdwpAiaauQWQDa26lh5C3VTEQOrdgBm8IFKeUuIo+8bVPtbGb5UfIEFDJDaeYEjO
	uPIrlfOxEweq6DYzm1VEXeRdvSTwUOtNPNw34/seqSD43Ek+5dPSLjQFNM3aVDSca8Y8irK5x/Q
	vMl44s7yrEfxAY0GeEBX61YstPXl88lM142965T8gz5ZQtg6ifOpNPA0kiry5LVeW87KozwhuI6
	hIYqfmr93zxolxqcFDm1dAfkEhVgr1xX1xN7lFbaoAdxhPiReeptvM3zdfaCYPl5eG8vXU0PkIT
	jKIjwgELbKHXEyJjX8zSpMZCWWdEqpzaTEb/eMRkZKkCYHQwjWp3t2Mb+5vu1Abgx3r0DReuqkQ
	OnqiCJApCWVHwOSg8GrivwmqyASJew7EkKsbARQv+UGMHqpQloyzsCJ92Tog==
X-Received: by 2002:a17:902:e790:b0:2bf:26fc:6548 with SMTP id d9443c01a7336-2c1644ca7b3mr29026275ad.38.1780479737100;
        Wed, 03 Jun 2026 02:42:17 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.105.153])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c16609e627sm19660035ad.52.2026.06.03.02.42.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 02:42:16 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][scarthgap][PATCH 1/3] postfix: upgrade 3.8.16 -> 3.8.17
Date: Wed,  3 Jun 2026 21:42:05 +1200
Message-ID: <20260603094207.218632-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 03 Jun 2026 09:42:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127377

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

https://www.postfix.org/announcements/postfix-3.11.3.html

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../postfix/{postfix_3.8.16.bb => postfix_3.8.17.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-daemons/postfix/{postfix_3.8.16.bb => postfix_3.8.17.bb} (99%)

diff --git a/meta-networking/recipes-daemons/postfix/postfix_3.8.16.bb b/meta-networking/recipes-daemons/postfix/postfix_3.8.17.bb
similarity index 99%
rename from meta-networking/recipes-daemons/postfix/postfix_3.8.16.bb
rename to meta-networking/recipes-daemons/postfix/postfix_3.8.17.bb
index 1c31130c04..b67a1cf96e 100644
--- a/meta-networking/recipes-daemons/postfix/postfix_3.8.16.bb
+++ b/meta-networking/recipes-daemons/postfix/postfix_3.8.17.bb
@@ -28,7 +28,7 @@ SRC_URI = "http://ftp.porcupine.org/mirrors/postfix-release/official/postfix-${P
            file://0005-makedefs-add-lnsl-and-lresolv-to-SYSLIBS-by-default.patch \
            "
 
-SRC_URI[sha256sum] = "54244c05f71cfa22adc70506b8ef7e17cb55e18ac2595332ec629d8ea0f0e5f4"
+SRC_URI[sha256sum] = "8221897d96b42495d68d2a730a65edf1b83c7358cdc45f84bed4146eb9212574"
 
 UPSTREAM_CHECK_REGEX = "postfix\-(?P<pver>3\.8(\.\d+)+).tar.gz"
 

