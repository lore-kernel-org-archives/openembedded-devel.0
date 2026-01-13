Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77D4DD0C83F
	for <webhook@archiver.kernel.org>; Tue, 13 Jan 2026 10:27:01 +0000 (UTC)
Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.56105.1768300019791637045
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Jan 2026 02:26:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GygmgRtc;
 spf=pass (domain: gmail.com, ip: 74.125.224.50, mailfrom: schonm@gmail.com)
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-6420c08f886so10299834d50.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 13 Jan 2026 02:26:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768300019; x=1768904819; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dDIpkV37ayQoA1L6S0kUbH+rXPMbuPiLQw4yiUik9V8=;
        b=GygmgRtcCPm+gaaNwzdyCDRVBrSWxpzyxKADi2eP5CpHVvrpBBirg8//iMlIAF6ZEe
         3YULQKcIupTAK808G3eLTl/sJOiF3XrVnvhNTM+Rz09/+mceJ+zEDOcpfycOJS/dEukB
         vrHcvqak10snHSA7sK/8yxvy3eBYLgZpja+3b5aPQ6SdDka46AcnF7s8faMF8MlUVEhO
         HU1gJZSgpCxpl2yrJ6kzG5GS4OeQRkqcT7dMemQ2QJZ7a7MhJ7YgJzawu4Clj+fN5Rcy
         QIfOKRSE6Y5nnaYalMeXnldS6A8BuhlEsu7mybKLxpy2ASy+E9Odp1vfSuiUWq1LYdqj
         ol0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768300019; x=1768904819;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dDIpkV37ayQoA1L6S0kUbH+rXPMbuPiLQw4yiUik9V8=;
        b=Ezbi/Cg+KC4zNTK+auuXAZ/Q80WFJhJlWYuNszn2oIaD6gedHaVPx2YAopp8KqwTaP
         krdN21rHzr8B02xNuDsOIEg0hTshUJE7S8vDJl2KGBNTWAczIGvaUmv+9KmsAowv/ROG
         rhxQhgQEP8MrMJIEgmXvsqqAL5el40+Kozt02qTJvNYlLovvoIKTf9CwtKtzJGGZo27H
         +iUwbxV/FSYGF1nNp0BXseQhLRn3JnvAnw57F6gUnX0wh25LqqKr46yPKDWYTkUrOLNE
         n+ODxXW0yR6bwZqvfTaZ6YWaEcSrAnwxd4LaskEj/xFIbLfTsg/JT/oekPVpLNjUjVKW
         Cp1A==
X-Gm-Message-State: AOJu0Yw8ADvv8Dmkl8jLUleJLK8FlzcKC9pcNszdn8tox7qEr0mH6yIP
	TR/QT95bMLrOWJn76s2YsY+rlngnnqRxD8UWPhpJze5Z0OFLd3nqGPl4ENDijPMW
X-Gm-Gg: AY/fxX6Af8McuVbKGoWnjjqyemxN3TV0phjZW2fHwclAOozW+zWdT2wywQhPPU+bJWg
	9GlYO1GQgeDC2LIXMpV7QpnyDwR8lqEoTxgUCdMRGue2V34zqAOWwF+fInoyzWYws88E03JhvBc
	pCiN+ZaqTwAu8ixG8+oOFNgMxmvgLFK4gX/KDoAnDtje37Z7thW8TZveQNzQnZfpc1U4AFmk7rU
	m/PhrKY5AE0sA7CSzFHrKcGhkPzPqC3q9aYqwH9jqv0qMNrVTl5TCl5gBlTbPZwdsUiCARDe8aR
	3hQk7FZCYZeXc4WbvAq5dVOZ48SOzJN4ZE5wyr5j0yFPKD92GFSDPtu/73hiNM62OGjJdzdpOSq
	QSRC7avbXfhIgZ0N3bCqL+QCZ2gw0RlFrJ2B3ktp5s9C+n8OVYhTKqqhEemLhEeRAoHtjgR6FNN
	R3AAknNgVtC2XDA4FXU20isd2db2/NPtvvcMLbY8As5TWmZpOygN/xm0+I8tnsjJf95SdMb20ib
	4aLohj0psSMv+sY0KzGjJELqxZBzhcbtOPxu2Gqjh6BLd0nPMOIAdLIymSMF8D5rA==
X-Google-Smtp-Source: AGHT+IGUVzo/kfQZdH6ZmO5aJuXh5yFmL7Zct/7YsAzxL+2H7hEUjgqYGS4BARSBfLH4EwkX4arvtQ==
X-Received: by 2002:a05:690e:138b:b0:644:60d9:7533 with SMTP id 956f58d0204a3-64716cb7b47mr16471171d50.89.1768300018531;
        Tue, 13 Jan 2026 02:26:58 -0800 (PST)
Received: from localhost.localdomain (71-208-41-41.ftmy.qwest.net. [71.208.41.41])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-790aa592cdcsm78318877b3.25.2026.01.13.02.26.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 02:26:58 -0800 (PST)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-xfce][PATCH] tumbler: upgrade 4.20.0 -> 4.20.1
Date: Tue, 13 Jan 2026 05:26:53 -0500
Message-ID: <20260113102654.5076-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 13 Jan 2026 10:27:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123429

Changelog: https://gitlab.xfce.org/xfce/tumbler/-/tags/tumbler-4.20.1

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 .../tumbler/{tumbler_4.20.0.bb => tumbler_4.20.1.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-xfce/recipes-xfce/tumbler/{tumbler_4.20.0.bb => tumbler_4.20.1.bb} (93%)

diff --git a/meta-xfce/recipes-xfce/tumbler/tumbler_4.20.0.bb b/meta-xfce/recipes-xfce/tumbler/tumbler_4.20.1.bb
similarity index 93%
rename from meta-xfce/recipes-xfce/tumbler/tumbler_4.20.0.bb
rename to meta-xfce/recipes-xfce/tumbler/tumbler_4.20.1.bb
index 6894e5ad67..c18d719c36 100644
--- a/meta-xfce/recipes-xfce/tumbler/tumbler_4.20.0.bb
+++ b/meta-xfce/recipes-xfce/tumbler/tumbler_4.20.1.bb
@@ -7,7 +7,7 @@ DEPENDS = "freetype gdk-pixbuf poppler curl xfce4-dev-tools-native libxml2 libgs
 
 inherit xfce gtk-doc systemd
 
-SRC_URI[sha256sum] = "74b1647d55926547e98bfac70838ff63c5a84299a5e10c81c38d1fab90e25880"
+SRC_URI[sha256sum] = "87b90df8f30144a292d70889e710c8619d8b8803f0e1db3280a4293367a42eae"
 
 INSANE_SKIP:${PN} = "dev-so"
 
-- 
2.43.0


