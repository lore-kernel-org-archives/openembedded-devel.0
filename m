Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44806CD13DA
	for <webhook@archiver.kernel.org>; Sun,  9 Nov 2025 16:00:47 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.27299.1762704041193144371
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 09 Nov 2025 08:00:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FpTYlNne;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4775638d819so12448355e9.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 09 Nov 2025 08:00:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762704039; x=1763308839; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cFa7QCCuEtc6dcRwSxXa4xTxjr86jZ50BBdeUcjdvr0=;
        b=FpTYlNney9MbFkbbrSw8icJWbiEl1KTax8PEd5GofdLrrV4hPW93+omf1A2ryWqlmW
         vSd/AdlHh6ukIUFoRGuYfGwFCpeoTfzBc/79wt8V8w/8SCn8nmI5cFLBY2n94YDH800C
         FaDvQUevl4SlObG8yVGyWcHMHGYBeVOfn+jHlrq076h+eJG3tWWHeXuy5/igOt0SuvQI
         DGzsEDUZCxKFR57229KWqh/W3CiXuye+39b58TixCAN9XFlb7ePJ/aHYDczrDjytfOeE
         r5nvgGRuGq0Oywh2SAqo63yrY00nL4mWucvy2GLVcWpPKhdrOruzysXVYET5s/aNTnVP
         tjjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762704039; x=1763308839;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cFa7QCCuEtc6dcRwSxXa4xTxjr86jZ50BBdeUcjdvr0=;
        b=WzCRpIjLsTy81cO4AbGTdKUI1kFNL1EEU6fdEm16RJVrp3WRjVKTF2lYqjztZI95/c
         PqXyoeFf/OPVw4/81Jk+0M4pV9Np5Kwx/FB1pd9NEcq2LfpKxiNOMdh0/qCYzu9WDjhf
         ASVzAYNzBYS/Z3cpWyNlRoZxxz5VJdCXpx8o1tZ+R4F2ZksreqhIi4nyveT/yKii6HO1
         GxW2XErErj+t1D9a/QP3h2U3FBp+B0NIzIIZY2aocWbAyOXsUXZZwYwBlaGyd8etzJX+
         yeFtEvVG9tU6qk7tKaZUHuvomvFynqLffYl60D3aHAW9Xue65eNxmo5hT+KVYSFc7HRD
         e6tw==
X-Gm-Message-State: AOJu0Yy6c1GFpDRKwAbLDbyEXkzcgnpQp4MG5ztDUu+1gyUcpmWBJ7RQ
	Gy2a6WjZYI5FhLplibHAYZkOJnmE0fOquGVo8FZODEdIfrK1p7eyO2jQqLmF7sZ2
X-Gm-Gg: ASbGncs/23LD2uf+yQkjHIDJfMPwipgY40WOGccQpaIvrE989s8zOcrrOW1AjgUJtAY
	F3pyFCjt2OzdpyhN93o4urRr1Zm7IJZLPSdc1Xn87djcBZvOg5zc40IcBxdzoUkcQq7IdPvcXHa
	mxaCTcZlQOBhyOgWH6JF1MDkTuzqFL02iqJiy+t4IDOzJE/vL+7/xXN+GDQd+2NX30jkbzBmOYx
	fvmgkk9Y3LZ3TKPxoqozK8JQJTwfLzZiv0QnxpVmz5kxREJIROxzbr+41lNLv3FYVaY14nv04G+
	qhsnQ3voMSwHusKR+BSuUnCUJNTQ4MHVOEfSnTepzIoQp3hyoZYtjeO0pjn2btcZpmwDUtGgg4H
	ISa/JrrYb2wNdZc3ZCUfgpO5+gu9hNSs+v7zMOvlzIVPilrXJimQaRDcVYIfV1iw65BKrxaZNBZ
	B2n2KWyXZx
X-Google-Smtp-Source: AGHT+IGt2koz7Ei18yYVlfrWJ1Xhq9SmKl7EWh4+WWserf+QSRqTEIOg99+2Hloc0/+W4LeQfFw+0w==
X-Received: by 2002:a05:600c:19cf:b0:46e:53cb:9e7f with SMTP id 5b1f17b1804b1-4777325ba85mr46808805e9.18.1762704039519;
        Sun, 09 Nov 2025 08:00:39 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42abe63e131sm17406445f8f.20.2025.11.09.08.00.38
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Nov 2025 08:00:38 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][scarthgap][PATCH 16/27] transmission: update SRC_URI branch
Date: Sun,  9 Nov 2025 17:00:08 +0100
Message-ID: <20251109160020.2522353-16-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251109160020.2522353-1-skandigraun@gmail.com>
References: <20251109160020.2522353-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 09 Nov 2025 16:00:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121432

Master branch was renamed to main, causing fetching failures.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-connectivity/transmission/transmission_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-connectivity/transmission/transmission_git.bb b/meta-oe/recipes-connectivity/transmission/transmission_git.bb
index 735db1441e..2f259ed873 100644
--- a/meta-oe/recipes-connectivity/transmission/transmission_git.bb
+++ b/meta-oe/recipes-connectivity/transmission/transmission_git.bb
@@ -8,7 +8,7 @@ DEPENDS = "curl libevent gnutls openssl libtool intltool-native glib-2.0-native"
 RDEPENDS:${PN}-web = "${PN}"
 
 SRC_URI = " \
-	gitsm://github.com/transmission/transmission;branch=master;protocol=https \
+	gitsm://github.com/transmission/transmission;branch=main;protocol=https \
 	file://transmission-daemon \
 "
 

