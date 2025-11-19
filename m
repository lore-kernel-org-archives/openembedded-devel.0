Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1326CF3194
	for <webhook@archiver.kernel.org>; Wed, 19 Nov 2025 10:53:55 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3959.1763549629481277618
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Nov 2025 02:53:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QsQ1tzZO;
 spf=pass (domain: gmail.com, ip: 209.85.210.173, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-7b852bb31d9so7373279b3a.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 19 Nov 2025 02:53:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763549628; x=1764154428; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nc/TB3ZKVeGfStp9keFqXPPuL3u8pb+ShqneD/Q5daQ=;
        b=QsQ1tzZOV4nvHZ9wG16VHx4jhPvmZdCUyjAHAkFZHEau2DsZy7rWo3ehVQvjFFBsyi
         XWD+SnLWpuSuGYjySc2EInQaYlhDJM4CBvjhEjtsDl5WNJr9LmgAr9Vr0vukHnAROM78
         I60AYNXfe7UAVRI/VQgX7oWVTz2uhiIYgi2iNC7eutamCx9bq4yMs9ZUMkSZDD3qixRG
         u5hDINngzxvg2FvwHxGkWBMe4A5bytNFNvxZJH9wvDAy69nd5aXuAFAbl3jzswPa3EYD
         CEvWyzeHuLBGIzcCMp+sSBSozWWA8hS+kOBusmzxj+dcddl7jOWloSuIEa+1b77dBE+V
         m1pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763549628; x=1764154428;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nc/TB3ZKVeGfStp9keFqXPPuL3u8pb+ShqneD/Q5daQ=;
        b=aqjboh79TevGL5KhL/Pi+wd9GZ0+SM1Vk4v9oOsF3PR5dp4oI/QoRg7YokNsJx/H9M
         7p45zJPb1i7vLc5SV4V/YbgCqGsfFUxQ+wbl1Hh5tW1gKu2xLkZ+pe9zRnzb5CxfthB3
         8CCH0848blLCNUkcFeYHOSwcmvMSvSxWhvIkWjNtGQdd6934kVELCCUusEfBqJ5RJb3E
         O0xjcOU/hx3ddqn8H0OWk9Dai/mKpHEqe4L4J4VP6N+tFBGW46/GNZ2Vng59E2YxWvxa
         2ZdM08Dc8y3JBYKrXcRXdWfVbE9gRO44q957MtOLofIQMJ1Yov7efh0kEGh1uG9ODGBC
         FoQA==
X-Gm-Message-State: AOJu0Yy4e5CjdU9yQm1l0Z/mZZ+/XNoWbTMoU7TYNsFew+kr1dMbOp37
	UNo/G6xLLi0MeCjReqmTM4e7fAuB0aN2Ht/pTsnqoymkAuC/86pKeD3jyJ3mow==
X-Gm-Gg: ASbGncuT6fN4OxjyAPKEjkDNmzxQOy/4sw0HPzYAiho3ll2s+Cm+KaeeZIkmzrBimEZ
	qReAorTIp0E4AsfaWity8zsLDN5SMtyfQrdb3tkZoglHsFhVLMMOejltRTZ9M3ps1Cut4A37S6O
	JJ/2c8hTRYl1iedKfliq+RbA06506OJMSuq+4Rf+pdXE8UkbdfBcxFAqM8/k7Jrb3pkvr2CtdUJ
	fuYRO9zL1vSS38U7Ph7lmkuQB7epKrt/HfUpEmfcw4vnugeGaO2A+a0MS52ZXErPrtdHdLUYQrt
	YDnYFKrjXZXxMfLI6YYj3FsxBlg08bR3tAmvfHh0VXEUbVrxvGVdhzaEDnZmC25aMxEy/WRwNVs
	zXDxPR+zXuMpcGQcJ+4nt1abd47gJjhBwJvkW56Y8amBEK/0o5Ha3k+8uXrIysioefywtsPo4IV
	c+i9QsqO0oJbt4FowrBKmBdDYj
X-Google-Smtp-Source: AGHT+IFNcnClypZA2FWSK8QBZAs8tlxlPHesWI3t/Cj87IDsd/L4HqW6o+mZ/EJIcUY/gUC9n1/81A==
X-Received: by 2002:a05:6a00:94fa:b0:7a2:84f3:cefc with SMTP id d2e1a72fcca58-7ba371d36cbmr23548467b3a.0.1763549628558;
        Wed, 19 Nov 2025 02:53:48 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([167.103.126.249])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b924aed60bsm19383078b3a.4.2025.11.19.02.53.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 02:53:48 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][PATCH 6/6] tmux: upgrade 3.5 -> 3.5a
Date: Wed, 19 Nov 2025 23:53:28 +1300
Message-ID: <20251119105328.2849176-6-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251119105328.2849176-1-ankur.tyagi85@gmail.com>
References: <20251119105328.2849176-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Nov 2025 10:53:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121896

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://raw.githubusercontent.com/tmux/tmux/3.5a/CHANGES

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-oe/recipes-extended/tmux/{tmux_3.5.bb => tmux_3.5a.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/tmux/{tmux_3.5.bb => tmux_3.5a.bb} (90%)

diff --git a/meta-oe/recipes-extended/tmux/tmux_3.5.bb b/meta-oe/recipes-extended/tmux/tmux_3.5a.bb
similarity index 90%
rename from meta-oe/recipes-extended/tmux/tmux_3.5.bb
rename to meta-oe/recipes-extended/tmux/tmux_3.5a.bb
index c7c87eb4a1..72c84f562e 100644
--- a/meta-oe/recipes-extended/tmux/tmux_3.5.bb
+++ b/meta-oe/recipes-extended/tmux/tmux_3.5a.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://tmux.c;beginline=3;endline=17;md5=f256b76d52e7b4d02bf
 DEPENDS = "ncurses libevent bison-native"
 
 SRC_URI = "https://github.com/tmux/tmux/releases/download/${PV}/tmux-${PV}.tar.gz"
-SRC_URI[sha256sum] = "2fe01942e7e7d93f524a22f2c883822c06bc258a4d61dba4b407353d7081950f"
+SRC_URI[sha256sum] = "16216bd0877170dfcc64157085ba9013610b12b082548c7c9542cc0103198951"
 
 UPSTREAM_CHECK_URI = "https://github.com/tmux/tmux/releases"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+[a-z]?)"

