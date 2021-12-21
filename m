Return-Path: <open.source@oleksandr-kravchuk.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C580CC433F5
	for <webhook@archiver.kernel.org>; Tue, 21 Dec 2021 17:05:09 +0000 (UTC)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com
 [209.85.208.172])
 by mx.groups.io with SMTP id smtpd.web11.8305.1640106308150516440
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 21 Dec 2021 09:05:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20210112.gappssmtp.com
 header.s=20210112 header.b=17KDop43;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com,
 ip: 209.85.208.172, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lj1-f172.google.com with SMTP id b19so22368294ljr.12
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 21 Dec 2021 09:05:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9T3HQhjTkG2RjGsrC3w+guzVCyuML2104Ov8FRsyFvY=;
        b=17KDop43mtLlPmcEROjHX4pcgKJ5w0v8tZPEKtqUll9TPxP45CzaopsVcHkzczNerS
         lh4dfrgHbiSu0zVCPiyC1iYsSiY0E/4wyExPwmei2tuYIBG3yrgTwCzreBBQPDZKiTkm
         rzPzP67DHJTDoc9C+V9BH3Pl+cyAxoeRP7y+llRRy8yQhkZJ+IKiRn7cqZ77xpJEgZZZ
         yzilYtSr34MhVU5cUfAud6alean6r0AhO8M6pmSF4qvEr5O7U4F+iRsLezA881jMQCXL
         3egBAAbKgT8lQjXWeEJfuZcQO6R5HrYXYGK4jh0WcSOFCuE397Z28/MjBxON07U/8mZZ
         0/Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9T3HQhjTkG2RjGsrC3w+guzVCyuML2104Ov8FRsyFvY=;
        b=Zu/B8wm2DrRH1c2DS7r7Bjkwsf7oXpju7NeKJSSSyO/XoWsRsEZom+paYoCJ3O3cNh
         QQlAqmnhZWsgrARjoTimw+y4jnaaKOwPrIQPsCmmyeK48kT6C4ipKBJ1znP1HgN3Li1/
         B2aWikbNm2DiY9Da8dW61yPzPoxQ0m8SyaIAnyd20eEKYpCyAgg+oGxegXzSN/aMyEgQ
         LX3+7a8l+C6w2xZF43v+tG6JG0z2Ndm4iIODHgOD71R/qh3JDkXjXa3GizLOh96NT7N2
         y6MwSgJZQtqp5VpbdMlqyg9gJmplrb77PvAbjFRBUgGdG+MC1+0W89OOFnV9usX0JpJo
         IncA==
X-Gm-Message-State: AOAM531r1/yi/KR1o+G+9C99l5mhriTIxt0oe2hauvAb2AClpJc1a5rf
	zDAJ7qwAp6JeZv7Wfus7Vlk+BQUCyLf8rV0G
X-Google-Smtp-Source: 
 ABdhPJx1zvawBT805M4KJ+ceCyd0IxWuTeMZqdnsLX0N5YoK2k4F8LBUVZS+7FxM1RW08QSbIyvfzg==
X-Received: by 2002:a2e:720f:: with SMTP id n15mr3186488ljc.167.1640106305791;
        Tue, 21 Dec 2021 09:05:05 -0800 (PST)
Received: from localhost.localdomain
 (c-7918524e.023-160-67626725.bbcust.telenor.se. [78.82.24.121])
        by smtp.gmail.com with ESMTPSA id
 bq18sm2773391lfb.88.2021.12.21.09.05.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Dec 2021 09:05:05 -0800 (PST)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-filesystems][PATCH] simple-mtpfs: update to 0.4.0
Date: Tue, 21 Dec 2021 18:05:00 +0100
Message-Id: <20211221170500.1151067-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 21 Dec 2021 17:05:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94467

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../{simple-mtpfs_git.bb => simple-mtpfs_0.4.0.bb}            | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-filesystems/recipes-filesystems/simple-mtpfs/{simple-mtpfs_git.bb => simple-mtpfs_0.4.0.bb} (78%)

diff --git a/meta-filesystems/recipes-filesystems/simple-mtpfs/simple-mtpfs_git.bb b/meta-filesystems/recipes-filesystems/simple-mtpfs/simple-mtpfs_0.4.0.bb
similarity index 78%
rename from meta-filesystems/recipes-filesystems/simple-mtpfs/simple-mtpfs_git.bb
rename to meta-filesystems/recipes-filesystems/simple-mtpfs/simple-mtpfs_0.4.0.bb
index 595b34900..dfb748559 100644
--- a/meta-filesystems/recipes-filesystems/simple-mtpfs/simple-mtpfs_git.bb
+++ b/meta-filesystems/recipes-filesystems/simple-mtpfs/simple-mtpfs_0.4.0.bb
@@ -1,5 +1,6 @@
 DESCRIPTION = "SIMPLE-MTPFS is a FUSE based filsystem for MTP devices connected via USB"
 HOMEPAGE = "https://github.com/phatina/simple-mtpfs"
+BUGTRACKER = "19e7bb9b608b0c0dce2ee6f56fac75901bc69529"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=75859989545e37968a99b631ef42722e"
 
@@ -7,8 +8,7 @@ DEPENDS = "fuse libmtp"
 
 inherit autotools pkgconfig
 
-# 0.3.0
 SRC_URI = "git://github.com/phatina/simple-mtpfs.git;protocol=https;branch=master"
-SRCREV = "c9a691fc52fafaa55d26ac629856153c0514015a"
+SRCREV = "19e7bb9b608b0c0dce2ee6f56fac75901bc69529"
 
 S = "${WORKDIR}/git"
-- 
2.25.1


