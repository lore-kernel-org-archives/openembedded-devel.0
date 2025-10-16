Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A56DCCD195
	for <webhook@archiver.kernel.org>; Thu, 16 Oct 2025 14:04:23 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web11.9531.1760623456960304938
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Oct 2025 07:04:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cWPiieiF;
 spf=pass (domain: gmail.com, ip: 209.85.221.54, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-4256866958bso530183f8f.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 16 Oct 2025 07:04:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760623455; x=1761228255; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=t9XtF8bbz0L0rxl6p44+iXsjqx88nr5lN4hj3tkhUf0=;
        b=cWPiieiFA29QtU4mEwJr76TEQ+aQFNceTfpcHm4c7Ilra51DKfAq8v9Q+GacJlssWr
         K8Y+k6t7B9/MDpix4CZioJbUIa3bKLJ67i9LW4dT/XLnjHc7BDjwThA2ErSiJH2KC3AA
         T8ADym5tia/sNfqjaI+yxyZ15Huik0kO/wgy/T/FXUFGMCahJCtQSjiNO7pmdfZf+CBq
         tHzVhe2/ik4nwbybUMe8tutEdzydPpuKzR97XMrh6wwrIBVi6L96Ev902iH+Jb4Pb0Y8
         bPpQmHXavjiiR2PqwEipZh/d/ljC1rH1e1qUqdBkVLc7tG7WD5TU7TDeHnUAHmqxe68x
         J8LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760623455; x=1761228255;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=t9XtF8bbz0L0rxl6p44+iXsjqx88nr5lN4hj3tkhUf0=;
        b=IoXX/29fv7U5wCGfQfrJCK5U8Lm34gUDCjKG4xc2if5dSBCWYGkepJE6b1wB/S7mEn
         wJPPTE3yoxPC4Cf/hu4CZtTtNQbGynUucQcEX/TAbbcw+WrdPhmu6k/1mMm/PSy1TzAf
         Idk0svIBs1eIrmjs8C0snsKN5D4ob3YTShz5zAOk+9es4tJFsT5ytZJ6BQIdP+0+7Rc7
         7Rn20gsUAcq+NgZ88uLtKAbow+CklL+CwbGh7y8HHXlZ2mtBjlKDginwd6icAtTHltzt
         S4lotNtmYvgrxmcWNojWoejsbAs6bbJ5IPajLH1hpMoZVqJ8A/8VbKb5ue73xvnak1D7
         WfeA==
X-Gm-Message-State: AOJu0YyplldCX9cf/TCukKGuQ7a7u+eh07L8Bl2mBlEKI7Z2MawYGx6o
	5vdUC1YMz2mfNvmQtYgdHV7Vkwo3SX3NobaK9D358gErZI1SmBzYi5CaZxxDbw==
X-Gm-Gg: ASbGncveS7A4RrIoYYQoVKHULjJ7cSoux+GkO5Af8pp35Qtm4SvV9/VzShtInetpJa4
	KfhM7Xd6JtwE+fMbkhgDFvAcvqBbJuneDXPYE/dKkspO1Lzwfq4gAulGe6NhaUjz0aJSDLvnQEJ
	1RlfqKc8pO2iCJR9Nhon34evfY5FR3CLrsIsbqmNeo3IbsjFH2s1ofn3pOhH0x/s0vsqxndcS1q
	4McsCxtO59f0bAPZr9p0C5u4gYFH1NaDq1U7T3+BXirTboVnwnllZtboPvXaDZo2BIGQO31E0Wz
	Xw0UbGgvHENseWJZkpuoNQGB/q6ev1SOo13vYOUyFjG6ZS2lT+j8nMWZNyq4kg6JCAFqNoLv6Op
	rRzgWC3K1uPL63iUyW3JKhCgGxOaUegETCIdVdQllNeVBJ6vItKScm6M0wKc+9skfrihpoIYGWL
	PYx1ijufKG
X-Google-Smtp-Source: AGHT+IF0Dw2Vetg72ON6bU9AjPMOmkwEsy/jj+NSIl+6+wurYFJ37VaOFk48puiTKdFGFIaOjzS5eQ==
X-Received: by 2002:a05:6000:184f:b0:3dc:1a8c:e878 with SMTP id ffacd0b85a97d-42704d8ce6amr149487f8f.18.1760623455034;
        Thu, 16 Oct 2025 07:04:15 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4710cb49051sm22292805e9.1.2025.10.16.07.04.14
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Oct 2025 07:04:14 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] fwupd: fix ptests
Date: Thu, 16 Oct 2025 16:04:13 +0200
Message-ID: <20251016140413.2602136-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 16 Oct 2025 14:04:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120737

The ptest package requires dbus as a runtime dependency, otherwise the tests fail
with the following error:

Failed to connect to daemon: Could not connect: No such file or directory
FAIL: fwupd/fwupd.test (Child process exited with code 1)
SUMMARY: total=1; passed=0; skipped=0; failed=1; user=0.7s; system=0.1s; maxrss=21716
FAIL: fwupd/fwupd.test (Child process exited with code 1)

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-bsp/fwupd/fwupd_2.0.12.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-bsp/fwupd/fwupd_2.0.12.bb b/meta-oe/recipes-bsp/fwupd/fwupd_2.0.12.bb
index eb43c3d865..a40fa923f3 100644
--- a/meta-oe/recipes-bsp/fwupd/fwupd_2.0.12.bb
+++ b/meta-oe/recipes-bsp/fwupd/fwupd_2.0.12.bb
@@ -85,7 +85,7 @@ FILES:${PN} += "\
 
 FILES:${PN}-ptest += "${libexecdir}/installed-tests/ \
                       ${datadir}/installed-tests/"
-RDEPENDS:${PN}-ptest += "gnome-desktop-testing python3"
+RDEPENDS:${PN}-ptest += "gnome-desktop-testing python3 dbus"
 
 # ESP mounting, not strictly necessary
 RRECOMMENDS:${PN} += "${@bb.utils.contains('DISTRO_FEATURES', 'polkit', 'udisks2', '', d)}"

