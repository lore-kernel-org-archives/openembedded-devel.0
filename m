Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6630C4453D
	for <webhook@archiver.kernel.org>; Wed, 22 Jul 2026 10:18:28 +0000 (UTC)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.44513.1784715505029821173
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Jul 2026 03:18:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=WjF97uJB;
 spf=pass (domain: gmail.com, ip: 209.85.215.182, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-c9e7391839cso8012792a12.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 22 Jul 2026 03:18:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784715504; x=1785320304; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ea27Ae9bFEVqvleGZU5lytoBngXZjOTmC4MqgdC85t8=;
        b=WjF97uJB3J+rCUWkkR8nu0nWqC6tNGYIG15g64FJMJLVWLJyf7EvxAs76YSWgJ09WE
         zqj6QERPvHyzC9q22ZRWgo2jEHKr1VM/762VCy/2ZOmGUtqdqfqM1JG/cpoKcUdh17BT
         35Js61OPc1N+p9kjldBc8WqnMywGHSmh1/rQEGMU254rIHJyIoDNgWUTTzgOmoNRJmki
         kwGvshGStjlj3wc0TpCuxAll7BdLocSLnf20r5NoRtOwCIp0iqZqdwtDxlWLxOqCS42p
         8uuatRsdpdBnhqHPcpuaK0MV4m2bVeUHY5pgHxbMZg+JuLuU3tJIrj9OzTt/7Alc2ZKY
         v0Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784715504; x=1785320304;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ea27Ae9bFEVqvleGZU5lytoBngXZjOTmC4MqgdC85t8=;
        b=q1OIpOuQvcTM0T9ZddAYan9y5AE0KMEwjYeUOhYLjuYhLnB1xZSDaV0HCe7Q9wzRar
         UwbdEWdiXPiIL94/XMgBYJWz4u1+BkHjdvZhDJHrrS3jomNa/EAYsLDRAt/EUbzc+lvF
         VmYjReKrzSJvjK01LnQjuA+MYy0RCKlD6NX7ncrmP2xRmNoWtKfs3Pl8/7sphTeDVzJ5
         L3AwK9X61KUBTeXQ6Sh4CoxXXrOt9hRjsXRxwYECVLXvM5rR7MXDooDiaeYJaubmPNA7
         8EuJbK99tJHEH16BiDLcw4f4UDkhYR7jadBQndI9BHhN/q1ZMfPPJIR4YdJ7/5BUwea3
         qSAg==
X-Gm-Message-State: AOJu0YywkxRoItIl1OIMlbxEOt3vxS8mcrnbzPVwHOkek2KtbsHYuXMk
	JjfE3OlTCWvF24lsTRu2E/dVU/W9OFrJRNV9avZC4ziDJnKmgYvPsLVsxP8ISxII
X-Gm-Gg: AR+sD11Pab30AYjPC3XuKVF2uCVdoFFlRZgOdY9wSlhujydeq4X34ft13X0fucOl1em
	VgbqdwMlnrF2f1ZG/e4JwAkZk8Lejo3/cjdv34xV/A98FqsLlfqg8oiOELjKjaWUX8iWjI+tY/N
	fTnu8F/AanbPMfFat52TeF1EJdmc22aEgOqgFrHp2YcKX6NbgEcqCuFeDtEl9qI1fkhvNbA5W66
	LUENmH2NLFMO4F8oCTDiHNzYvWQffVFDM08YmQD2xL2KImUH66LQUx6UdLgQtbSCS69QIkTnqap
	M3G+cBDZWkcRFEvUHoiiv16VWQZ0JMHpgrIPl8KxZWj9jW/HP7oiTxLz3wXyfxetwxTVuoknQtM
	cjI0EPp4BsKOVnZ7eULPuluhrs4kuKJ015im3cu2l8Ylr4jjK6AYyN0m2t9fOvWcd19xgt6UEi1
	YJ8DG9Bs7SVcxA538=
X-Received: by 2002:a05:6a20:e282:b0:3c3:91f5:82ba with SMTP id adf61e73a8af0-3c3ad975d54mr26008379637.57.1784715504211;
        Wed, 22 Jul 2026 03:18:24 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147dc9d932sm7808659eec.12.2026.07.22.03.18.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 03:18:23 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][scarthgap][PATCH 1/4] postfix: upgrade 3.8.17 -> 3.8.19
Date: Wed, 22 Jul 2026 22:18:09 +1200
Message-ID: <20260722101812.625240-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 22 Jul 2026 10:18:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128367

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Release Notes:
https://www.postfix.org/announcements/postfix-3.11.4.html
https://www.postfix.org/announcements/postfix-3.11.5.html

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../postfix/{postfix_3.8.17.bb => postfix_3.8.19.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-daemons/postfix/{postfix_3.8.17.bb => postfix_3.8.19.bb} (99%)

diff --git a/meta-networking/recipes-daemons/postfix/postfix_3.8.17.bb b/meta-networking/recipes-daemons/postfix/postfix_3.8.19.bb
similarity index 99%
rename from meta-networking/recipes-daemons/postfix/postfix_3.8.17.bb
rename to meta-networking/recipes-daemons/postfix/postfix_3.8.19.bb
index b67a1cf96e..018e8d89bb 100644
--- a/meta-networking/recipes-daemons/postfix/postfix_3.8.17.bb
+++ b/meta-networking/recipes-daemons/postfix/postfix_3.8.19.bb
@@ -28,7 +28,7 @@ SRC_URI = "http://ftp.porcupine.org/mirrors/postfix-release/official/postfix-${P
            file://0005-makedefs-add-lnsl-and-lresolv-to-SYSLIBS-by-default.patch \
            "
 
-SRC_URI[sha256sum] = "8221897d96b42495d68d2a730a65edf1b83c7358cdc45f84bed4146eb9212574"
+SRC_URI[sha256sum] = "1ebaec340fea1b80a9c88d276f07bed0886cc4f000753cf310223affb427754b"
 
 UPSTREAM_CHECK_REGEX = "postfix\-(?P<pver>3\.8(\.\d+)+).tar.gz"
 

