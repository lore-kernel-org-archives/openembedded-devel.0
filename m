Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4B5DD2502E
	for <webhook@archiver.kernel.org>; Sun, 11 Jan 2026 07:38:14 +0000 (UTC)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6589.1768117092924009812
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 10 Jan 2026 23:38:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fTEP3t/H;
 spf=pass (domain: gmail.com, ip: 209.85.215.177, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-c2dd0c24e5cso2394292a12.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 10 Jan 2026 23:38:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768117092; x=1768721892; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MzyPnSXDFNxY6I/LUi5gysBa4DW9ZlrI09n9yv94jsA=;
        b=fTEP3t/HKkesS0F4tBdb+KzhAiomaG4l2cahEXSpcMBafadJc4ElPdjagKF3XXuT+6
         tRU61vAy8fBPqV2z2ICJavLEY/zP7+PEmgWKftRIMq3CS2nGUKTY9Lr2AF2A+34pknS6
         qCGwYqNRKYmtnhRUlhlWldouO+KovVIpccfh+2IGlbV6xeq7SjL6W5TJZtd5xKh7kHBs
         /ioOXhCNTOjJQkfPPE2vNn230EuZc9UNm9WRNENu9Luqr/1ftWoTuGWMCXZIB77gX3Vu
         du4/Hy/IAli4fRAcmQ2fKizqI80BrTHTP9dssakMODE0yHDUlG9TeCplK7x6cKwvZx4B
         TJAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768117092; x=1768721892;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MzyPnSXDFNxY6I/LUi5gysBa4DW9ZlrI09n9yv94jsA=;
        b=VbMboJYMZKnVEXtPJw3MHdx/xxWt2uWHUCjSaSpT86WU57xTOhPNqOyn3J0lIukNKZ
         Z5psQVGsjvoS/P5XfuI4L24mKs3YMwjkFH4E6IpKAeC0o1sgAnpZE0nRqANJ89WdpNpT
         uuV58ERE6xcucv6xZZFAE+xZj+aq3nYhq6k/aWmgMjaPnOan67LGXkFt+5TU5/MZ+LhK
         b7MnUYdVn1xsT4xG5M84VGnqXW0ckYVppJ5AUurzA4PUKEamYalUbZ7pSXfc3W949XUv
         I64/nZJ8HbNy72HZvwY9seBfEx1t+xk6McGxbWcLjAEXMcC+H3bOePI1x/MEfiMeQf2n
         TYyA==
X-Gm-Message-State: AOJu0Yyaos7Ba2iUv6EEXQ3XBJXamaSsOOLYE7oWrO3ln2MG3J35J/+O
	3c+BiIqjCwivgl4lsD6zAnD60wdf0oTO8GN2XGb8ZYIFXxIpU2roqqUp3B6krw==
X-Gm-Gg: AY/fxX4CAeCTRfQR/cuJx8XbTQnaRy/bPs8nPMnLl/GG6J0mTKZftCYoLNQ/Vbyf8WR
	yKZfiBfqEXo+PF6nvnSRa3DBfzS/OiPSmPs+ci03Wqnc2h/f58LwToApqMzXyyW285K6zjFfGkS
	zwtFAF5sx2u9EkkB9STYa2BQKyhT5NfjbrWDzRGxAlFx+KCF6Bjlt3rEhNcHGdDZ+gOzYe7jLrh
	8qpY573blKHCOj6oO0wi3Pl6+UIDwT2lgjhq3jRJy8gJRRIKqvx2xZAGG/jqENPJiiQHCtnC9c+
	cWSDSL+zzJw3tHwBK5C3V9BKRpAvS1N3Vr//EVFhonIMElLV90EFGyxOfxYvr21Cm2W8PAIp4YW
	QjjH7o1byzYEYwbBXdbauipErBWat05sYDraoBLwWswbIpGs/aD9WlWObLxgKVGGoj70RpqjDCW
	JjMgqPgsQEI3dqpWy/i2GC8mI=
X-Google-Smtp-Source: AGHT+IH1qdcgIBeoLZqsCVy+o2tXfP0Z/AS6hWeU4Kt3oeJK6ptrKXPN3QCCSnz2XYwOfkSEFGDP3g==
X-Received: by 2002:a05:6a20:6a23:b0:366:14ac:e201 with SMTP id adf61e73a8af0-3898fa56518mr14079863637.63.1768117092164;
        Sat, 10 Jan 2026 23:38:12 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([167.103.127.10])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34f5f7c2666sm14340633a91.5.2026.01.10.23.38.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Jan 2026 23:38:11 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Gyorgy Sarvari <skandigraun@gmail.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-multimedia][scarthgap][PATCH] libao: ignore CVE-2017-11548
Date: Sun, 11 Jan 2026 20:38:03 +1300
Message-ID: <20260111073803.525301-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 11 Jan 2026 07:38:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123343

From: Gyorgy Sarvari <skandigraun@gmail.com>

Both Suse[1] and Debian[2] disputes that this is a vulnerability in libao.
Based on their investigation while an issue exists, it is not in libao, however
higher in the audio-toolchain, most likely in libmad or mpg321. There seem to
be nothing to be fixed about this in libao - ignore this CVE due to this.

[1]: https://bugzilla.suse.com/show_bug.cgi?id=1081767
[2]: https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=870608

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit a993eb8b93f16e3a16c9a1ab2eb0939cb2331593)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-multimedia/recipes-multimedia/libao/libao_1.2.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-multimedia/recipes-multimedia/libao/libao_1.2.0.bb b/meta-multimedia/recipes-multimedia/libao/libao_1.2.0.bb
index b30f398e87..b6bb17978c 100644
--- a/meta-multimedia/recipes-multimedia/libao/libao_1.2.0.bb
+++ b/meta-multimedia/recipes-multimedia/libao/libao_1.2.0.bb
@@ -31,3 +31,5 @@ PACKAGECONFIG ?= "${@bb.utils.filter('DISTRO_FEATURES', 'alsa pulseaudio', d)}"
 PACKAGECONFIG[alsa] = "--enable-alsa,--disable-alsa,alsa-lib"
 PACKAGECONFIG[pulseaudio] = "--enable-pulse,--disable-pulse,pulseaudio"
 FILES:${BPN}-ckport = "${libdir}/ckport"
+
+CVE_STATUS[CVE-2017-11548] = "disputed: the referenced vulnerability is not in libao"

