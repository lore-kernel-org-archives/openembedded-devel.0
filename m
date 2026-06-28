Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07614C44500
	for <webhook@archiver.kernel.org>; Sun, 28 Jun 2026 08:12:38 +0000 (UTC)
Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.69150.1782634347868570977
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 28 Jun 2026 01:12:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=If/aRjYT;
 spf=pass (domain: gmail.com, ip: 74.125.82.48, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-139f1dfc9faso1111021c88.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2026 01:12:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782634347; x=1783239147; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bDKWPwf3Kp2Zwl69EyukDvV5yPliCqnOLG32nX36qC0=;
        b=If/aRjYTD1zNyryvcb0Hfq5mGszOK6o7vWua7oR777kp1s2E99a0J7NImARpEQmAF6
         Iatu6FDlNIFBW38ZWDdPvH4nCEr0ErEmKbfRJFXqp+tjJS2iz3wGUhRDHV0od0YL/Ac7
         NcYzuH+FzOB/6Ro0JfM7WHS9gJl+95qvuJY0JcYms07NrV1ecQy3ubtDp81BAf+WYDPU
         QFsycMnVhGeu0WUGq+aMwUo1aTW7qdSZC96jW3vNR1B+/uGgvrhKbjcEP336MqFiJizA
         Dhvm5Qnva+XaCyfv6KRD0WGNDkd/Qbg7PL8q/Sh8s0FKVCmH5oPK562+CPAyqxYVBXQi
         Xg9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782634347; x=1783239147;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bDKWPwf3Kp2Zwl69EyukDvV5yPliCqnOLG32nX36qC0=;
        b=pGKUAwjE5eGBQsBt1soUmOMvbkn5W+vAS8rES5l/CDtSYgWGcaUMC1bpDdhE5QhwhM
         mVOflOU1+Ln54908X48Q7GZQQVjf/UbzYjhJvgJH9JxPvCXfOmF5qoxYtGRlzDrOyiTY
         M84IZURpNYcRZtG7FuByEYHg1DrvBew+iBpWbx0IKa4zQW5YNfGk65KVxpz4RvCt6xbY
         1hQYwlkQcEJYZvX5PSmpo0ixr9IWD4C6UhfZ+2GCZo8Pv179uJpjznHAX9mQlptoQYXN
         cIoymeYIfjvVOdkV+Qy8zM1Rk/6hwEq/6lWHIQjQtQFyl9WiQUNR2BMLnFULHRUeAlJy
         2fjg==
X-Gm-Message-State: AOJu0Yyc3qva6UhRIss/ARyftkXPW6DstwQ34grOX1XBJAVlpGgWSz3t
	qLktf0+6F2DK5rzyQo+E/VTBALGYjX3S2Kipy0vi3vojdMwmbABFusoTUdweM2Oma7vfwg==
X-Gm-Gg: AfdE7clINyRFf6uGyPaouhpOpTY0WRUIRmQ0T64O+AsfJbQGIYUj8LDLyGyhiRBUCXJ
	LZOMTTWGvUPIXG/X0bXJQq5e0Itfn5YVfeOilaDCrrmDXHR/omWew8Rz/yrrG2KOPKRZrUqCXcJ
	eQr5k38ZLN6fEX8qkHd2dHUw3iYRQK1+7hl/mY8IFKELlIuH0midHEWrmZzNGT4Qpzajk/ImT0q
	iSsZpYBdgtpCcZDa4NmofinwNLu/78I3stFkgkpNZPPzf+iHbunDI2zys6i4eOfR8RSMEU5kB5/
	Ub/KmhsmvRLme3Lj7xagDRt5wFTl7evCc47X5mfgYwxTJBfAZOWYyV1DhQgNkAAPcpQV1gR9YcK
	H7sJvp7Rl1mpskNOkVfL1MKphyE1CVLk4WaWysygLKCRMbY3LJmEVd/oTS4K/GMgv8MWVsE/LkT
	QIVgr+UzHiZrQlg3i3fm8m/G/Dp8NkmZ8tlVHHhihxc9/9MXSc0vgxTFgSR2m9iN69iylscJ/0d
	6LX1wY7fyxxCiq8BqCp2G3Eu07haIV6SctDYZqf17rNom3oJclzNpGzHlxOATBeAAIOF1/h4xO7
	GEsRLAtkMZwQYm/mNdZ1jchAyhmZ+kuvmDhD6l2/
X-Received: by 2002:a05:7300:1890:b0:2da:2ec2:64fe with SMTP id 5a478bee46e88-30c84f10d70mr11365997eec.24.1782634347152;
        Sun, 28 Jun 2026 01:12:27 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ea81b39easm6306040eec.31.2026.06.28.01.12.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 01:12:26 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 067/128] libsdl2-compat: upgrade 2.32.64 -> 2.32.70
Date: Sun, 28 Jun 2026 01:10:18 -0700
Message-ID: <20260628081122.178348-67-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260628081122.178348-1-khem.raj@oss.qualcomm.com>
References: <20260628081122.178348-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2026 08:12:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127877

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../{libsdl2-compat_2.32.64.bb => libsdl2-compat_2.32.70.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-graphics/libsdl3/{libsdl2-compat_2.32.64.bb => libsdl2-compat_2.32.70.bb} (92%)

diff --git a/meta-oe/recipes-graphics/libsdl3/libsdl2-compat_2.32.64.bb b/meta-oe/recipes-graphics/libsdl3/libsdl2-compat_2.32.70.bb
similarity index 92%
rename from meta-oe/recipes-graphics/libsdl3/libsdl2-compat_2.32.64.bb
rename to meta-oe/recipes-graphics/libsdl3/libsdl2-compat_2.32.70.bb
index c83b90f77b..56134f805f 100644
--- a/meta-oe/recipes-graphics/libsdl3/libsdl2-compat_2.32.64.bb
+++ b/meta-oe/recipes-graphics/libsdl3/libsdl2-compat_2.32.70.bb
@@ -11,7 +11,7 @@ LICENSE = "Zlib"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=ca6eaff208365238403badb97aa6b3d2"
 
 SRC_URI = "http://www.libsdl.org/release/sdl2-compat-${PV}.tar.gz"
-SRC_URI[sha256sum] = "b2fa522e7bb08113534904b3dc2d2f7ff7b0c259224d86c12374d5b4a4027930"
+SRC_URI[sha256sum] = "998fa62557eb46ffe7e5c3e2c123bc332f7df9d9f593b3ceed88ed1158428a44"
 S = "${UNPACKDIR}/sdl2-compat-${PV}"
 
 DEPENDS += "libsdl3"

