Return-Path: <open.source@oleksandr-kravchuk.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B449CC433F5
	for <webhook@archiver.kernel.org>; Sun, 12 Dec 2021 17:44:27 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 by mx.groups.io with SMTP id smtpd.web09.794.1639331065834731953
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 12 Dec 2021 09:44:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20210112.gappssmtp.com
 header.s=20210112 header.b=4BsmAi1x;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com,
 ip: 209.85.167.42, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lf1-f42.google.com with SMTP id k37so27039123lfv.3
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 12 Dec 2021 09:44:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=l+V1wmePtRgrZlECxK4RWSr0+unbLYb0ebSXKj0kA/0=;
        b=4BsmAi1xE6mlZ+iDG6MPzvoHEG33oXDqkUBdOrL/O8L2gbeuDcQBmFFyEkuQYNRIgb
         APLNBn1gC1ZWIxPcu4miU/tAJoZFu/tUk3YAG2PSb1p4Nj4URxMFp+jrB+kzjmZI8Ae4
         c5j0EAl3GnUBUfmyP8wo97dl+SzMhrPICHiDBi3oTC9Vv3brMCW6bMMw73Heqo8/lGKD
         AE411qLEeQxyjM5BiPI1/im1DnmfwflTlkbugNvyq400bURBXOhAwUuu9D86dyArSxDr
         xuBZ4BGckBODJiShDX97D3/D+21bEFT5vhbHJtYxOUhn1E2zDhq/C1RV5Q364b2vijhf
         HdVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=l+V1wmePtRgrZlECxK4RWSr0+unbLYb0ebSXKj0kA/0=;
        b=InFXC9YezAVMMkwmhPf6O/ekKHO5rTcD9/Y0Kd8yvaToZjgc62S4meNtf9Wq6n4F6D
         u410fUX8NZa/Mk7b5ZCC4BaYLLXN6ZYdnbDpwTqaGFh9bUtUIB76tIdTOXWtXEQwLR+n
         2sJjxEj0BAmVvRT4Olk+bNDqdnDdJJ4lg4BUL0jIqRPUTCgSlRmTPb5hrs4hvkoyMyEB
         q3QHvzqEICjKzerxjFqXDQkVmXTUh3ZQLvMA1bHIVC03nDtiwdqfF61Q0x2+o8toHvyE
         2QZD3Tfxsx1Yd/vjdA+pxTlNE4pKxau+/iHvyxu10MIOKYaHO8sAesJmoYfeIW2AHB2n
         DDyw==
X-Gm-Message-State: AOAM53153hVd9ofEAFnCpV/B/JobyjbhGH3hDrIYweAbgXZVVawq4IAu
	EKyszofe+81pOnhvqLG1ZB0nc9+GLd88wmKQ
X-Google-Smtp-Source: 
 ABdhPJyDeBHz0LjkXlo1k42DNVJuGfJy8n7qtm/oN5n+TQh5/NccsNKmi8vrvb5yY52DPb6en3Nybw==
X-Received: by 2002:ac2:4353:: with SMTP id
 o19mr23264044lfl.670.1639331063605;
        Sun, 12 Dec 2021 09:44:23 -0800 (PST)
Received: from localhost.localdomain
 (c-7918524e.023-160-67626725.bbcust.telenor.se. [78.82.24.121])
        by smtp.gmail.com with ESMTPSA id
 k8sm1110178lfv.179.2021.12.12.09.44.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Dec 2021 09:44:23 -0800 (PST)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-gnome][PATCH] gparted: add UPSTREAM_CHECK_URI
Date: Sun, 12 Dec 2021 18:44:09 +0100
Message-Id: <20211212174409.3328311-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 12 Dec 2021 17:44:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94305

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 meta-gnome/recipes-extended/gparted/gparted_1.3.1.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-gnome/recipes-extended/gparted/gparted_1.3.1.bb b/meta-gnome/recipes-extended/gparted/gparted_1.3.1.bb
index 2ed7d22d0..1c8dd6968 100644
--- a/meta-gnome/recipes-extended/gparted/gparted_1.3.1.bb
+++ b/meta-gnome/recipes-extended/gparted/gparted_1.3.1.bb
@@ -13,6 +13,9 @@ SRC_URI = " \
 "
 SRC_URI[sha256sum] = "5eee2e6d74b15ef96b13b3a2310c868ed2298e03341021e7d12a5a98a1d1e109"
 
+UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/gparted/files/gparted/"
+UPSTREAM_CHECK_REGEX = "gparted-(?P<pver>\d+\.(\d+)+(\.\d+)+)"
+
 DEPENDS += " \
     glib-2.0-native \
     yelp-tools-native \
-- 
2.25.1


