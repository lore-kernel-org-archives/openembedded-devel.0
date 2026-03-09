Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52CEBEFCD70
	for <webhook@archiver.kernel.org>; Mon,  9 Mar 2026 09:36:22 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10101.1773048973024224670
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Mar 2026 02:36:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YmkQ/eOz;
 spf=pass (domain: gmail.com, ip: 209.85.221.49, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-439c5b40f60so4437496f8f.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 09 Mar 2026 02:36:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773048971; x=1773653771; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=876VzEL+SlX+gEv1Vu2HJUiwSGB18goGP2fbxUiWrds=;
        b=YmkQ/eOzbnl+nfhmXRRRPLNbYH/t4eMMHoM6cWS5XKgigXZufSA98OqCvuksazrZxK
         g48vIKY4UEMI81KIf+2IS6aQFtz4JvelIPDng98KLc4X6uTuKbz/NkCzkZComTcFI2fn
         jRgU14kfOJyfv6wtwgAtvozxWWL3i3RY6/F3uuEjfSeZ7MVMnYDbwjdP+68kJcuRvJ1+
         FUlxz4duAFCQhgxBhVH0SySCOSZkptVbs7h6IKcybKzuQSXDO9GwAwEs7NnqWq54w2+s
         +23CvB9GchVUicbBywSCIQHEKbR7LwXBkAeBlrwUCwwvxHdaV/cmEtnwONmjpLLxDrIE
         8VJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773048971; x=1773653771;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=876VzEL+SlX+gEv1Vu2HJUiwSGB18goGP2fbxUiWrds=;
        b=Fp4NyWNQu/piOgQqthQvbUSeTm2/uiI2FSV9D/GGFAe9S2qELLhIDk6wMb6oCxS2TY
         5UaEoQLCDce5l8mGG5DKFG9illISSbzecKIvXc/vlqrGo7zoA3av9UJgnqfqnpCN1rxo
         9u6sjFnfsOXv0kk6+s1Gj3KmRfi8UpEeqGZJVYMDNnPrqSzDPT0YJM6BaIfMlRp88Q5r
         olMQUqMKkr62ZsLlSlaBa9kfptniV/vrRkPPk8zDm5x2FZKhh5N/qq2NK4zwbYbH8SyY
         6pSr4hye0oFjQ/c3i/iJhouNAJST4KE853GPgMWRLKeq898ciR/H3QPPlOGAOFM56Z8H
         UJ1A==
X-Gm-Message-State: AOJu0YwpTFv2JcV6TYqHDEMuZKsOIAyYcS5OUb2PB+TTZV1T7ELZp5xO
	0T1rShDWrKv9qFH82uOmBzMJE1RdWpL79c3g6i0c7NWnWULlvQzJ5vQt5/s72g==
X-Gm-Gg: ATEYQzwS0Y2XeZUF1gijKl0VRXwAlW2D4DwsC2C2cjGdxBbMQw67p8vU6/NO00WzX3R
	rRrRN7Ms6Y3XJAbKH34P9dYDkduShyqBflSr/V64tpXLkbxyOk+Ftq6b0Tftsza3YyNWO/WzpUj
	bf1wofLfQdCGGB+/2NSnD9bSDPrbFFccbvf7cQKtf3pMWLElnRt9VUZrtI+z2TIMsD1QuhpeABw
	LM+XMuqxLNjWed8gADOJJGM4isCqtAYSmhPsBqFmERsp0EgK8YVX5T2CCmSSYVj0A4IDDxyop0R
	FSCXjnYQgOFisbTztCGhs+nceLozpURt56M8HRmDJi0IgYX5m7fDZILxbicFXjeQdOMODeWuHhO
	SjbKR1LMr7PDtlf27mmlcznLFr5xIriLqZ4uOG46GXFlyA65FQsEoHfbkYPSVrxfdtfQgyVMu1v
	XBGJ1ozW7uk3MN3SVL+j0/
X-Received: by 2002:a05:6000:40cb:b0:439:bdba:56c9 with SMTP id ffacd0b85a97d-439da348351mr19405906f8f.2.1773048971100;
        Mon, 09 Mar 2026 02:36:11 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dae2bdf8sm26062120f8f.25.2026.03.09.02.36.10
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 02:36:10 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 1/2] zabbix: upgrade 7.0.19 -> 7.0.23
Date: Mon,  9 Mar 2026 10:36:08 +0100
Message-ID: <20260309093609.274988-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 09 Mar 2026 09:36:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124967

This update contains many bugfixes.

Changelog: https://github.com/zabbix/zabbix/blob/7.0.23/ChangeLog

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../zabbix/{zabbix_7.0.19.bb => zabbix_7.0.23.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-connectivity/zabbix/{zabbix_7.0.19.bb => zabbix_7.0.23.bb} (96%)

diff --git a/meta-oe/recipes-connectivity/zabbix/zabbix_7.0.19.bb b/meta-oe/recipes-connectivity/zabbix/zabbix_7.0.23.bb
similarity index 96%
rename from meta-oe/recipes-connectivity/zabbix/zabbix_7.0.19.bb
rename to meta-oe/recipes-connectivity/zabbix/zabbix_7.0.23.bb
index 28e4cc4eb0..0b066de282 100644
--- a/meta-oe/recipes-connectivity/zabbix/zabbix_7.0.19.bb
+++ b/meta-oe/recipes-connectivity/zabbix/zabbix_7.0.23.bb
@@ -27,7 +27,7 @@ SRC_URI = "https://cdn.zabbix.com/zabbix/sources/stable/7.0/${BPN}-${PV}.tar.gz
     file://0001-Fix-configure.ac.patch \
     file://zabbix-agent.service \
 "
-SRC_URI[sha256sum] = "30bef0173493b199377c9061b34e8a2e16a28eb0d6f7e9c7b942433e4b75367f"
+SRC_URI[sha256sum] = "43ea5fcb1e5db25e74bdc83ea8936d79b8093b614af4e889417485bc74f061e2"
 
 inherit autotools-brokensep linux-kernel-base pkgconfig systemd useradd
 

