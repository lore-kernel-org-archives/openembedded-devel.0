Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61B23C83F0F
	for <webhook@archiver.kernel.org>; Tue,  8 Jul 2025 10:52:03 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web11.15626.1751971918378418985
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 08 Jul 2025 03:51:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dgeZvqdW;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4538a2fc7ffso36621025e9.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 08 Jul 2025 03:51:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751971916; x=1752576716; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mcF41UNze9lMY0ySRm+daaoRGV4zRz//dvK+yQHmlqY=;
        b=dgeZvqdW8/TsNpeKgKfc54Dy+0Iz79b5jAqcU/U8aGqKqHIkwbGZV6tmmtqHIlvksU
         Fcum31eY9ECU4efwJbWBZfhPWiXHYWcc7uV0GxzNC3ao6FCm8snevUvyjkUSprvwwCaO
         WsNXzCZX7n5+L30N3j5CgYt6dry9Fu39m+FiPiZYEJh+Xr3W77diRbha7E0xo+2EaZP3
         L64KYGLN5/atJdReiWL8gn4NLSYLqN3eTL0I7dmbCEKmKS3lXBNBX7mWDZ2wg5+q6hJn
         1BVGZ2krSkT0HFuDeXsO+I4CGmopbR6gHbBfDDDc88P++BA4Bh8O1jIx/9mNOJF/6pLC
         Mz2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751971916; x=1752576716;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mcF41UNze9lMY0ySRm+daaoRGV4zRz//dvK+yQHmlqY=;
        b=U1AEPSv9BbuizE5QKyG+eovto3D0nZnvHX5M3ExF4A+C3WCU2EWlcAoCbKI8KjiDHg
         QJHWvr5Cxz5uwyv33iUajfhX6OiyfZ1jfX3S3O43qeVa5JDE0ksgCbog+fzZt0T1S25A
         PvqTJr9Dhm9xASB/5v2im6STk9vM3pJhtulBfyK26C1LAbief1h65xlaM5YcYpKS3A1G
         NWEsZMh5kIiikH4Hn9hZ5qPk0elxs+4zSaoPOI9IroaFM+YDCzq9644yFY2BOl3EMlth
         pWLjdFZYg2pNinF3cFzfUObHW49LpsiZ7SHnw8tvlQfXMLiHpoS9lJrrJLw48muErLjl
         T9eQ==
X-Gm-Message-State: AOJu0YyVC0CGHWwPJk5qhOk/yS+Nsi2gTkPgFdX1h1PSaN79vdfEBbtW
	5qfnL9iIBn/ZWFKYp7CTMIuU6eyGn56ZCmFF6YolbVlydxYwG3/spUt2uvbb6g==
X-Gm-Gg: ASbGncs929CaZ2ccSaUSoW8VQCrDDu+zaAFU93NMdJdCEx7cooafpEiA8ee65LLMHJm
	N+1PpyJItcOKvU76FA2Ij4BMDVRwGCvr2lQ2InHyWQqp10zGcehjQQUCulTD3p1IJNR+UNlySwe
	dxkePswD6p8iVgtlYT/L4hfh5afDym3LHAZWIKmSHQn/oiBKQ4jXLWY3uw+dH4VwyG53mSUi1GL
	wQ8qreHl3EtgStoJYKl2NT/37viil9FAEEiMl0jOxb34pHWXKNe8D0+2QdOB5c8P1I3Gg8NEQsK
	WqDwL6Zuw1DRrkPioHxFK3P4KQYlo4g5pFkkZN2ra/6Mrl4QTQTBygPx43HHxxV9b4sm77uI+RE
	=
X-Google-Smtp-Source: AGHT+IFVWWoEWpx8L3pRbKZTeufoF9mKM4kasZMgArm3hePYIeONpIVon+INFZhjk+3aVJDrJ8zCWw==
X-Received: by 2002:a05:6000:2303:b0:3a4:e231:8632 with SMTP id ffacd0b85a97d-3b5de111c2fmr2182808f8f.12.1751971916369;
        Tue, 08 Jul 2025 03:51:56 -0700 (PDT)
Received: from localhost ([109.238.218.228])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3b47030b9desm12801998f8f.19.2025.07.08.03.51.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jul 2025 03:51:55 -0700 (PDT)
From: martin.jansa@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [meta-oe][PATCH 1/2] gpicview: enable gtk3 PACKAGECONFIG only when gtk+3 is available
Date: Tue,  8 Jul 2025 12:51:53 +0200
Message-ID: <20250708105155.478279-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 08 Jul 2025 10:52:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118307

From: Martin Jansa <martin.jansa@gmail.com>

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 meta-oe/recipes-graphics/gpicview/gpicview_0.3.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/gpicview/gpicview_0.3.1.bb b/meta-oe/recipes-graphics/gpicview/gpicview_0.3.1.bb
index dab11a02bc..ace909fcf1 100644
--- a/meta-oe/recipes-graphics/gpicview/gpicview_0.3.1.bb
+++ b/meta-oe/recipes-graphics/gpicview/gpicview_0.3.1.bb
@@ -15,7 +15,7 @@ SRCREV = "ca13623c6176585db4759ce4371fbf89c56fa630"
 
 inherit autotools mime-xdg pkgconfig
 
-PACKAGECONFIG ?= "gtk3"
+PACKAGECONFIG ?= "${@bb.utils.contains_any('DISTRO_FEATURES', '${GTK3DISTROFEATURES}', 'gtk3', '', d)}"
 PACKAGECONFIG[gtk2] = ",,gtk+"
 PACKAGECONFIG[gtk3] = "--enable-gtk3,,gtk+3"
 

