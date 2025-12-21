Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DFBAE67482
	for <webhook@archiver.kernel.org>; Sun, 21 Dec 2025 17:17:05 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.64218.1766337415483514444
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 21 Dec 2025 09:16:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=P039olSs;
 spf=pass (domain: gmail.com, ip: 209.85.214.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2a137692691so38096855ad.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 21 Dec 2025 09:16:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766337415; x=1766942215; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KGCcrrS0+iNT/ohXcxSqZXmTCrI68hACWN7HPkLwn2E=;
        b=P039olSs8kK8edqPlNCBCEebphxGcJGoeowAgFxP30fFd+xIkaaVaKuGFVfC0263L2
         RRgC0ypm/4h4LPMFbzi+dUCXax4/x2q9/zu/onBzbPe3OLIwlHdvRA2LO3BcCLkXGNOI
         EEejnXX/QmoDb+7EdXm7w8Hd5FTwAzsGm/1vfHodAnolnMs+Aihf+KhDqUlHZ7SI7fDS
         oAwS1lbNiXAarUowpYkCMDmT7i6YgsOInjy7ci517uFhmvm0tM8S74bQ+ZTFapo46Bxl
         /GtTmKYc+ufOz5cGpmk9WZZzLmq946UnGVY0hT6kUBZLlgAk7yE9eAjn0CSgjfYj4FJu
         3Wlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766337415; x=1766942215;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KGCcrrS0+iNT/ohXcxSqZXmTCrI68hACWN7HPkLwn2E=;
        b=cO8RMrd2Kmzv1cCV9BKrihx2NTNu2mSv9shZjHZPt+52G77xQQ9boISf8D4a8A4MWZ
         Rh3fF7GCLssdIj7W77/5gztctXSme/tqtHzV0ix31a9+oFrdgr78LaW/I5wi1L8Z+Ult
         huUb2evIEe1caCwM6qPW0/Utj9u41IUyf15CKYlgx8SxgCB0ZnWK8RKbRPFmInEy2+jQ
         bjvj9/vlCKuzgjzTHQXe7ooBRFYkkLDVOCR171CRZp8JMNrITwr596xtIHOzRQiRmWQF
         RXfnEys7cah+hRkgawXWrvdk8IXFMsgKqkHQv4pERs/jvNn7X5LX5F62uf4p68IUhpw2
         Whvw==
X-Gm-Message-State: AOJu0YwX6l7SVCGaug5aSNzH6HZjwmFaBOv8qsxvbcG7OQSnNwpPm2RL
	FHDSyXZkwXKpys5xhmy33g+F3U3gQyovdftFBF6FUqsvk1MHAL4dKX4xbNqGZq8s
X-Gm-Gg: AY/fxX4Yi71MpCwV/0pLgAPguGKLyogRN/MhnhlbQWDzSi8IgSDcncP4Y+CArJQj7yh
	Qo1qE9JAC59YrgTjo+/WlEL/rPpP8L+BuSGOVYLcr0U02FsJ/uML5WSPWkIf48kuYbdz1+qXDrm
	pSqSCJc9aUxea6GOKZGJN4VASo0ADIvEwkkESsHlWHGPMUoUymYfR34/xWXpR4v/Gb+HIRF6KSD
	EEMZqeeJwCdO8SVph67JxPx9t7pbxrNS61sl8/9nTeVxpE8iAFXLt/cU9rTzylGCdzxG10DRZ2t
	AWNRZezeQlOxHBkJ0gViJKUzxe90GRJY7ReFfSsr1zIjeheBOeqZXZe5JlkJ90gyV7Dj0OxMXIa
	3swdbOQMgLhK9NHOtZ4IkfiXMDZyoVKLaLxtw0VKOerwRAxsiNgNhDpIWbVBUVtzVsrACunhKyu
	pLuMCiGKn2sz/s6gZElzPd8icELab9zlxmzTWrz/AjykT9GT761SFQqwKNj6GseVI+hwqNxStFK
	MOc+gsaihqbbTRz3x+9DkX/cH0CXJR3
X-Google-Smtp-Source: AGHT+IEOX0Z6kEmHjKx+OkHfpGJ7QXTWk+/FNqdohfYOJtu1CKLFVzBHt85yNZW5iKPBooc6W0qcbg==
X-Received: by 2002:a05:7300:8182:b0:2ac:1bb1:68ed with SMTP id 5a478bee46e88-2b05ebd9158mr12223588eec.9.1766337414472;
        Sun, 21 Dec 2025 09:16:54 -0800 (PST)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::8429])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b05fe99410sm23585976eec.2.2025.12.21.09.16.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Dec 2025 09:16:53 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Gyorgy Sarvari <skandigraun@gmail.com>
Subject: [meta-gnome][PATCH] keybinder: Fix the branch in SRC_URI
Date: Sun, 21 Dec 2025 09:16:51 -0800
Message-ID: <20251221171651.128012-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 21 Dec 2025 17:17:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122780

Tag does not exist on keybinder-3.0 branch but on 'master' branch

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-gnome/recipes-support/keybinder/keybinder_3.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-support/keybinder/keybinder_3.0.bb b/meta-gnome/recipes-support/keybinder/keybinder_3.0.bb
index ec70f8e82b..4da164e081 100644
--- a/meta-gnome/recipes-support/keybinder/keybinder_3.0.bb
+++ b/meta-gnome/recipes-support/keybinder/keybinder_3.0.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=1f18f9c6d8b4cfcc7d7804a243a4c0b4"

 SRCREV = "04ae06724d914c7d4fec6a2723edf9c6320ec502"
 PV = "3.0+git"
-SRC_URI = "git://github.com/engla/keybinder.git;branch=keybinder-3.0;protocol=https;tag=keybinder-3.0-v0.3.2 \
+SRC_URI = "git://github.com/engla/keybinder.git;branch=master;protocol=https;tag=keybinder-3.0-v0.3.2 \
 "

 RDEPENDS:${PN} = "gtk+"

