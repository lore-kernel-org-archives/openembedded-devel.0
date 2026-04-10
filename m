Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2EBFF36BAD
	for <webhook@archiver.kernel.org>; Fri, 10 Apr 2026 05:49:22 +0000 (UTC)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.150114.1775800155593742450
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Apr 2026 22:49:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=kqCBkYr1;
 spf=pass (domain: gmail.com, ip: 209.85.128.181, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-793fdbb8d3aso18740627b3.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 09 Apr 2026 22:49:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775800154; x=1776404954; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tFxFxhZcQkMT3BM3h0npjY4nMZIftbg8YpJnDQ1lklY=;
        b=kqCBkYr15g2/atTVGsGl6LaLaw5rIgBCpY+a+SaW+dyRIfKZ+ywcNpDN7Y3uT9ew3D
         0lpUqOmG/+70FY4JRRrnUJrkwhsru8sl1BFSDP2JIsdz8tjyITWfZJhollT0CEqxNRDg
         TiJw1C6DcMB/n5+f/uv/75qJMC/7ED0dc36hjWwssz5faBe1VUhpmptTRkE1zHEJ4kme
         dbVk4F5cn4iw/E+lS2wfkKrjxbEOAmN153DWjdmw+ZBUi8VPuwy8JgqkflUtwsI8buU9
         apDPjmsgrCYA0eFddBBRocjZPRpR91OSH0nIkhXAPFlGJfm4WSLHdi5uLjPylbxqErSX
         Jkow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775800154; x=1776404954;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tFxFxhZcQkMT3BM3h0npjY4nMZIftbg8YpJnDQ1lklY=;
        b=ngrvOON5PhyK6v+L20q509kihb2cmVT5IOzX4fCNFINFDMDhfRJsyY8ti+7eTMXGQ9
         YrUpPEyWatwke7vAqdAyqL/joxxz1JU560z6uHR1AMtRkH4E7ux68x5TtdVZ5nmUt8MH
         YDrFzqAeoT8jK25kHLSyYwDK6hhAXPU8CwlaJDgOl+kmFTJgj8wRBv6hl7IJXD1SI2Bi
         fZy9/G80JkvXfUEettPCe5F1kjWdgZmQ4++vnVh0VcA62hz6fWD5mG1HS4DqQupe6YfT
         vCpIlTPnmedCe8iNGnPYcSeu3JAUtxES5kAUqhuijkQLaAsWICKsmerulpQ3iFgpB7BA
         TUEA==
X-Gm-Message-State: AOJu0YykgAM+xa35ydJEDsdekCh0a4QU9UjSxEg4pAclLh1WoTYS8fUj
	FY+uX8oUZuBwCRk6UuPHCpiN+PA4TpSvlFoXM0fugggs/wTBap23dVCOrCuUQhYu
X-Gm-Gg: AeBDietRgUJvqnTdpgLyCgrmJuWywk/pXN7TNYE1dTVrVJdAP02M7/3IWnW+b6zkLN+
	AwlMMdPIYLv5ZvR5jH9rxm85u1HNi0/pD1OWy1ESmIOL7fLaf6u5P5uTj3EwDOpY/tSPKPM2UOn
	fH2plRtJbioF5C5hL2tXsxnaajjUU33uSg1h5IxPzqA8wgKII5ei7kNzHkz3X2hzIO4bwQFsKJ8
	PMhemZcCbL86Qx9UOgiLqQBf6dafDXP3p/VLA0WOtMM6KCZtGXcBU7eYniYQSFnHvlmmQhf6hIz
	5T6rsy2DQR8Mb+neZqS/KD2Evh8jPCGoJQy9UErbD7LM/W0ykZRuHObjBWow8biiLsGyOzlaVUd
	jyvYvKXa99c4aEQ/9q3uA/b5vogo5IoOr1UBV1idQzq2RlU/MxzRqpsRPtSKomVY25sFti6wibo
	lB4BIQQpFGSsz4fDgV1qGz20kffZM4oH57Ah7ihkcXwx0ZVuzDBuKd7JK0KVe87hNzZ1poZTC77
	cc+74aSCo3FGEDY8tI4hFOdN346bdrgcZyHnueZwmKCSUMeXQi/
X-Received: by 2002:a05:690c:6e87:b0:7a2:8cdb:b597 with SMTP id 00721157ae682-7af6fef5bfdmr17343437b3.23.1775800154102;
        Thu, 09 Apr 2026 22:49:14 -0700 (PDT)
Received: from localhost.localdomain ([67.233.60.136])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7af3d6a9c87sm9163247b3.22.2026.04.09.22.49.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 22:49:13 -0700 (PDT)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-oe][PATCH] php: upgrade 8.5.4 -> 8.5.5
Date: Fri, 10 Apr 2026 01:49:03 -0400
Message-ID: <20260410054903.3493053-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 10 Apr 2026 05:49:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126213

This is a bug fix release.

Changelog: https://www.php.net/ChangeLog-8.php#8.5.5

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-oe/recipes-devtools/php/{php_8.5.4.bb => php_8.5.5.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/php/{php_8.5.4.bb => php_8.5.5.bb} (99%)

diff --git a/meta-oe/recipes-devtools/php/php_8.5.4.bb b/meta-oe/recipes-devtools/php/php_8.5.5.bb
similarity index 99%
rename from meta-oe/recipes-devtools/php/php_8.5.4.bb
rename to meta-oe/recipes-devtools/php/php_8.5.5.bb
index efa778b6d8..2924b478ad 100644
--- a/meta-oe/recipes-devtools/php/php_8.5.4.bb
+++ b/meta-oe/recipes-devtools/php/php_8.5.5.bb
@@ -32,7 +32,7 @@ UPSTREAM_CHECK_REGEX = "releases/tag/php-(?P<pver>\d+(\.\d+)+)"
 
 S = "${UNPACKDIR}/php-${PV}"
 
-SRC_URI[sha256sum] = "2ac929a29a6b7ef4b8acec981a417b91bdf7f548f597df665cc56ab9ea95fc75"
+SRC_URI[sha256sum] = "ee262beff61c431965d1f97192854b36208adeac38983c3498bb3500ae87283c"
 
 CVE_STATUS_GROUPS += "CVE_STATUS_PHP"
 CVE_STATUS_PHP[status] = "fixed-version: The name of this product is exactly the same as github.com/emlog/emlog. CVE can be safely ignored."
-- 
2.43.0


