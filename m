Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22426D58D56
	for <webhook@archiver.kernel.org>; Mon, 25 Nov 2024 14:53:55 +0000 (UTC)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
 by mx.groups.io with SMTP id smtpd.web11.20489.1732546430066978380
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Nov 2024 06:53:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MVuFKTFM;
 spf=pass (domain: gmail.com, ip: 209.85.128.179, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-6eed41d2b12so33620357b3.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 25 Nov 2024 06:53:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732546429; x=1733151229; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WEDgjoKusE7LYX4PknvdN7bhBIBSpbvrznmjy0BNJjo=;
        b=MVuFKTFME4WfND4JXIwKw+zBdOnNFN0yD4bXs9xh/t8A7WS/6kVpca9e+1O9a4mvSC
         bg8JY7qBuya/hExAWFiLQiNd7Pr+tTI/ne9UNeXg+JRqmwQM7VXVfAJgSTIKdfH4veIY
         2rsrHW8MYs9UyOeZ11A9Idki1k3oAdortLmnX1/sYilFSLLYTCubHLN4fraJEvIb1M4l
         oiI+EkydNIEeAtAPMyP491I/b+73RyPmsGKmXotUZnpwumSAA6Z2lUPUy4YPxFh1XwUa
         FSS0f242pgwvbcm7nuwPNMB14QJFhysnASZiS4iB6pUT5QxuOu+ZBddA7CfZ48i/bfq1
         4V3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732546429; x=1733151229;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WEDgjoKusE7LYX4PknvdN7bhBIBSpbvrznmjy0BNJjo=;
        b=mvDsTeAWabRDIHdTUcrpN0MbP3I1KrvTZOr+pPnDYjZcxKKCNgHccaPXCvxwBhXuii
         Z7Y48LRlaSU7vlTqET/+w9jnNgADozIFbNOfTx4LRwEk2dNJTdIW2yZEICwDLGJ+MF/p
         h9pm4vV87RAH5I8rQWYh3qSNwTuEgRrHjIv/YvwuDsSiZa4L9eg+2LKLiqh9FLcz8hdK
         vd8AH2Ez9AHt0G7ujBq0CqBSAGTIxY5CfQMe8+5QK7lpuWqtJVx/sLI3VWzOpekzavah
         9Qv/mC5vNHZ33Csbg7NkRrYPpa8imKlqRc3M41Uf6S3hMvVbSGzD9hF0f1+s3t63vIdS
         Yvqg==
X-Gm-Message-State: AOJu0YyTep4dX3olzBeujYrL2zRYWu0/fwJ8aw8LbkWgDp7WW/IDVU3P
	1SOlFJqV1Ipk5w/AUp+RMwbDP5laBsQ1C4f6z+sjm4gpz0t2U6I2FQfcI6yv
X-Gm-Gg: ASbGncsnhSzqVCLTdpykew0C2euypwj2ZhPQ3ZZaf4gAaV+Qp//boSlQ9/4vvjG1B2Y
	gbTp5kyuMsUL+AzQqsxw+FqNkKvJe2TgM8blPT0KbKKkwXHodpEFI0tXR8/Z3d/vAqIo1sbf4wb
	57yl+OR4/wq549bj1c2GGbzBjPQiupRhSAn2PF9FeXdY+o6YMfYlDQzNrVRgbAV+IuUFCBQx3Dc
	fPl9D81VFPPsH8WbCLxDAmj91fcA/HXwIZB4qu7gaoxE+zL1z95E52k
X-Google-Smtp-Source: AGHT+IHQxhVD/BRWR/DEdg1SiT5kTgBloMdK2xiI95mvn8vNiwg/enixZD1XtVVhtUiLkUuIiFuYsA==
X-Received: by 2002:a05:690c:30f:b0:6ee:676b:4c65 with SMTP id 00721157ae682-6eecd304c86mr143237547b3.19.1732546428627;
        Mon, 25 Nov 2024 06:53:48 -0800 (PST)
Received: from localhost.localdomain ([71.215.7.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6eedfe152b2sm18073417b3.1.2024.11.25.06.53.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Nov 2024 06:53:48 -0800 (PST)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-xfce][PATCH 1/7] exo: Upgrade 4.19.0 -> 4.19.1
Date: Mon, 25 Nov 2024 09:53:01 -0500
Message-ID: <20241125145307.5479-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 25 Nov 2024 14:53:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114038

Changelog: https://gitlab.xfce.org/xfce/exo/-/tags/exo-4.19.1

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-xfce/recipes-xfce/exo/{exo_4.19.0.bb => exo_4.19.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-xfce/recipes-xfce/exo/{exo_4.19.0.bb => exo_4.19.1.bb} (90%)

diff --git a/meta-xfce/recipes-xfce/exo/exo_4.19.0.bb b/meta-xfce/recipes-xfce/exo/exo_4.19.1.bb
similarity index 90%
rename from meta-xfce/recipes-xfce/exo/exo_4.19.0.bb
rename to meta-xfce/recipes-xfce/exo/exo_4.19.1.bb
index 48044240a..f5415af75 100644
--- a/meta-xfce/recipes-xfce/exo/exo_4.19.0.bb
+++ b/meta-xfce/recipes-xfce/exo/exo_4.19.1.bb
@@ -15,7 +15,7 @@ SRC_URI += " \
     file://exo-no-tests-0.8.patch \
 "
 
-SRC_URI[sha256sum] = "a0124108c197efcc576a6deeface381416dc7137b6a7e7dfa3060fad62509fb7"
+SRC_URI[sha256sum] = "4c3721d47126b1a3143f00a4e4dff5eea364c02c3fa141b09c0b1af16b1f0794"
 
 # Note: python bindings did not work in oe-dev and are about to be moved to
 # pyxfce see http://comments.gmane.org/gmane.comp.desktop.xfce.devel.version4/19560
-- 
2.43.0


