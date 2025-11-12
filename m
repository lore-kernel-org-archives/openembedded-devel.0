Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68F5FCD37BF
	for <webhook@archiver.kernel.org>; Wed, 12 Nov 2025 19:36:02 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6237.1762976160823949095
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Nov 2025 11:36:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PUQJuq+b;
 spf=pass (domain: gmail.com, ip: 209.85.221.41, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-429c48e05aeso20768f8f.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 12 Nov 2025 11:36:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762976159; x=1763580959; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jm7Qp+SkAZ4+fOaqQqP1e7yKimIkS3VrW9w7SQReSAk=;
        b=PUQJuq+blBFZtoBAkk9nk5EWCWsbl9Yq4R7hyw2spfiUSSwZzApX4hQLJF5/M8Vy06
         nlY64DV3XbZEZbzwiZga0wcbOR86v/IH5j7BrFa5z0lu11lJ33cw2xmiaQQAlrRMlZwJ
         xXol9wfNMrDm74u/McpKS5UhGEePL6q70HV8+dvbf7KBlbnlsIezdmCCSShckaJCjBXa
         ujfsOyIicaWM1jivIOcr2oUwtj6lZHDZYLyeXKw2WxmdbDv06MOicdtHoueoiD9jAbBo
         1T7/pxOItJPZu/LRZh/rNgHUBskQjt776qwAI7vcRvjLxTpPCWEu0/GChgGwdsyjXvmE
         VBsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762976159; x=1763580959;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jm7Qp+SkAZ4+fOaqQqP1e7yKimIkS3VrW9w7SQReSAk=;
        b=JcJ5i9WWQGVSLSJhsZHO+iFmZaBKGnUHvaKbbfPr/ZQOyrDEOMq2frhiWEn9380AQM
         mG0NlYEoOgLWUz4fElvfMssjSkNJWxK77wAYlE3ZadZcj/yXUOUtxNrYJBVQ6BFmSVBa
         T1vzffUcgjoZbVbRQsuwupVREQgSBr92qVS8dBWYpXv/XDG2VE2QCgbGMHq2g5nlLwwx
         drYCwH9P7c5kOFV1Qe4zrdfPhFVBsIQDvL82LuuOg2CicIAFd9IKQ+q6FXe8f9DAQ3Zj
         RR2uORPnnKki7X1aVt4IifHOP6Js+vfG4A6Zm79qKjBViq9SnX/XK7PTc6qAHYx6jeg5
         XSMg==
X-Gm-Message-State: AOJu0YyjM5qt5H/NJGm7yaZFQIV+cORzeExxdAglKV2YBhL2IQ3j7/na
	WN1NyxO4hmnpDCBMPC64pOg4PzdFx9ilrBRBJWJ7bdwGVQRYgXWwRlj/RMoLEjCY
X-Gm-Gg: ASbGncsUOKx4Urasa8VopG6aEYpR8EEhkgfnofLMOPpFaAoTpQ9+y8cIS0mVpOnO7Ou
	XaOz9fj6fmsPMzknlWXajeOs34pUw9VG77B6oVRouAWsB1Q2c5qEshIEF1FGY2SXOUpl4CnyERT
	Tvdm9K0e87k5fKWzXMf0zkvXVJ8+KwSTfzfbG6hWYjlnPpmNP26VsvLgCRl5HwIkZVUcy5BWhUG
	UNxqZZweGomLt51UC+5TAaPbTtqhQrdDiGiwGpnvR+8RgyxkV9Dyl4pKMcCf4zqQIYgF88d5zsI
	2+jLhuxCrm3SF9x9aEr1P3jVDJuM0tPu81sEkIdHCWrAXCqm73Oyrj1h6Q3/83KCHpehgeJ8ZF/
	MSVvJNdybhRAfJXykTosUTI5ngF+K8bsLkl1g+KpxXe0+e5BqHRoI1UczyrgLzg904WuwTJTL0g
	==
X-Google-Smtp-Source: AGHT+IEj8CLtyMHB+4v1N/gJG+ASA1zOSBs7kjOz2c62M/GDzfee7TTprA9d0K9RQ4JeILVHUnLSuA==
X-Received: by 2002:a5d:584a:0:b0:429:cfa3:5fde with SMTP id ffacd0b85a97d-42b527be676mr649508f8f.11.1762976159197;
        Wed, 12 Nov 2025 11:35:59 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b2dd927c9sm28723881f8f.27.2025.11.12.11.35.58
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 11:35:58 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 21/21] pyxdg: update SRC_URI
Date: Wed, 12 Nov 2025 20:35:41 +0100
Message-ID: <20251112193542.1589821-21-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251112193542.1589821-1-skandigraun@gmail.com>
References: <20251112193542.1589821-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Nov 2025 19:36:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121582

The previous repository was moved to freedesktop's gitlab instance,
and was causing fetching failures.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-gnome/pyxdg/pyxdg_0.27.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-gnome/pyxdg/pyxdg_0.27.bb b/meta-oe/recipes-gnome/pyxdg/pyxdg_0.27.bb
index abc1c23277..27b82c8ac6 100644
--- a/meta-oe/recipes-gnome/pyxdg/pyxdg_0.27.bb
+++ b/meta-oe/recipes-gnome/pyxdg/pyxdg_0.27.bb
@@ -5,7 +5,7 @@ LICENSE = "LGPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=f30a9716ef3762e3467a2f62bf790f0a"
 
 SRCREV = "f097a66923a65e93640c48da83e6e9cfbddd86ba"
-SRC_URI = "git://anongit.freedesktop.org/xdg/pyxdg;branch=master"
+SRC_URI = "git://gitlab.freedesktop.org/xdg/pyxdg.git;branch=master;protocol=https"
 
 inherit setuptools3
 

