Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.48011.1795411818702556541
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 22 Nov 2026 21:30:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=ZvyDHCo/;
 spf=pass (domain: gmail.com, ip: 74.125.82.49, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-1b546061d58so6579133c88.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 22 Nov 2026 21:30:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795411818; x=1796016618; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JV5efBcq8/To9Zljl+cb6gU3FXft80u56p3EhZQk7Wo=;
        b=ZvyDHCo/4c5MXtcsAp4ia+IRs8KG9yLgmhvhk/Xv6z1EhcOGEqXBegdLZvUiP2/2Ol
         H/91pC25MuVkpEdGYMdeM9j/dr7B7AwhCrqwwL1SkgsZVywhSZJMQdit0cAGpeZC04Mp
         qodHusxG/Xlec5uju5gEg26n2IiBG5RdORaBvYVuVHdUbvBlnvB6hG5qojyLI/OgtTxC
         fCzxgnUR7rlYQzJtQ45m3SzOyIFOhNktnzGRhXbR8/YKD+t/Jms7+1tzcSkDfPgvD6kj
         K6A5DX4iRxC5U2y+QQzGMWxCjYewKYSHuHYYUjA7vhySoiQnPTHnSI2YNTGLBAwt33FE
         LGJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795411818; x=1796016618;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JV5efBcq8/To9Zljl+cb6gU3FXft80u56p3EhZQk7Wo=;
        b=k5VuQ6KpRldZeFTa0mi81nauQpp+6YrtH12rs69sbNWJlShi0YRHEtzz/TsaRAJysM
         cwSxEKj9yPgR5prZwRDG/GptADnNK4REte/HCsBiFNRCwgOyZ6WwkMU/SPDV+EsQlRpI
         t4IR28QphDIp6aJDvYLxShk4AtjJZknNU5Ah+itKaotG8WdBb2rOMK2LA7UCKNj7TtJH
         V44F0o+OGqqh8Mm9aQ/smJ4QnvHyjsdoK7cWWoYMTZRSe8TLwVGlnmVn4Rv8BadBMsqd
         QG+T/VzSiH9Y7CNzWcJkK0MiaoNDDaGwNE8GHdIg6L1jnPwTm88rChpSIbySIXD8/s71
         UUDw==
X-Gm-Message-State: APuU4Z9n2QXnJhWEsnYTj1a5YNE9dbDzmiSxh7HW2YiDq1Kmp5WmFybQ
	c16RsLwgm/JrUtZIL2fjKptdpHP2cMa1RFcNML/DosQfiCp2Od5Y7SnYKqpq+QgGjys=
X-Gm-Gg: AZFdTZfMstlH4luCDffHmKK5/ZTJ+l+S2w9OkYhBwQgjIlG4irxyoiEPH0lXvpb3SRe
	vEofTNlFu/DhSCAXfenyH8AIysAMvXjSHmajo9ccPT+6KMA5ainqccqVBoCkcNIDhf1rempZpBp
	zatT+v3YojOhbNKUiwMsfxUADWfgg+ULeF7tVdpK2D6cV40/H1e016aZJ+b6Tq3W+zCDXWW31Zs
	JKO+0EBpOIgMyJsR7/2aRtgR+EStBhvTueC08kvR4vGDOKHlpd6lxcG70eiqJoxv6whN88ViALZ
	Qh+0HXjXeZHKMzDemtFLBMf3ZLplD7nk3//sqCXlSBKxMQLffQTY/UDcaF8BV4l2OTiuC6g5CCA
	YJyaS2/f9iL9kHnC/DOcsLMCI54mGQIil0Q3xD+n+6ISqKUik9sV3F6lbneRAbaDhwP8K+aMw1A
	3NgYfgvcbpl18Ot7gO6l3GLRTgxGLoMU5y6UbqtXyxaQ+RG41vMpmjOFYzw6cZlbrCda01x5vvR
	B27KF8WLtbOs2yYW3vnYdBLD5kVW3jgBUt7k2X9+V8r11Z93GHJR+r5RtuZmJZFbOOwhnWK18Eg
	hQ3LgW+6T+NcSieLntqslzJrQKH6WxhTII+UaHrR0DQzIgXbaXAOmD0vIdMuuAUGSMtAw68O2MT
	MP3FlUfHd8VCvy69hIiI/0ZmmmjOW9tfYWxF9G1PZbKkgpFOA0v66sbuzMqfJjs+Kx37EdI+TUA
	BcDPhAHmD/Oxl+tfw8va9lFo3owUgvTWc7A74xKClJW939fy0KYmCk2+Y3xCSF05LIcPc3+p7Fl
	eB7iyiO6rT5FhLv0YQx0+hiZAE7hg/x1FVe5gyY/bjpdWYy+1DPyqo5BHd220kkbSW5YvXNnsYZ
	9dXn
X-Received: by 2002:a05:693c:880f:20b0:386:a520:1029 with SMTP id 5a478bee46e88-386a5201077mr4713622eec.9.1795411817957;
        Sun, 22 Nov 2026 21:30:17 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567cafec4sm36573136eec.26.2026.11.22.21.30.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 21:30:17 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-multimedia][PATCH 6/6] tinyalsa: Upgrade to tip of trunk
Date: Sun, 22 Nov 2026 21:28:33 -0800
Message-ID: <20261123052953.3658549-17-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261123052953.3658549-1-khem.raj@oss.qualcomm.com>
References: <20261123052953.3658549-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 23 Nov 2026 05:30:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132804
Content-Type: text/plain; charset="utf-8"

Brings in pcm_set_sw_config(), 8 bit and S24_3LE capture in tinycap,
pcm_drain() fixes, the mmap and event notification race fixes, and
plugin support enabled by default.

Drop the pcm_ioctl() plugin dispatch patch: upstream commit 785ff00
("pcm: replace ioctl() with pcm->ops->ioctl()") does the same. Keep the
meson plugin option patch, which is still pending upstream. Add an
upstream check for the release tags, which come with and without a
leading v.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...ioctl-to-dispatch-through-plugin-ops.patch | 36 -------------------
 .../tinyalsa/tinyalsa_2.0.0.bb                |  7 ++--
 2 files changed, 4 insertions(+), 39 deletions(-)
 delete mode 100644 meta-multimedia/recipes-multimedia/tinyalsa/tinyalsa/0002-pcm-fix-pcm_ioctl-to-dispatch-through-plugin-ops.patch

diff --git a/meta-multimedia/recipes-multimedia/tinyalsa/tinyalsa/0002-pcm-fix-pcm_ioctl-to-dispatch-through-plugin-ops.patch b/meta-multimedia/recipes-multimedia/tinyalsa/tinyalsa/0002-pcm-fix-pcm_ioctl-to-dispatch-through-plugin-ops.patch
deleted file mode 100644
index 1b7bead7e9..0000000000
--- a/meta-multimedia/recipes-multimedia/tinyalsa/tinyalsa/0002-pcm-fix-pcm_ioctl-to-dispatch-through-plugin-ops.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From ef8edd2f8931c8f43d8f4fef836678ecf643608d Mon Sep 17 00:00:00 2001
-From: Claude <noreply@anthropic.com>
-Date: Thu, 20 Aug 2026 10:41:55 +0530
-Subject: [PATCH] pcm: fix pcm_ioctl to dispatch through plugin ops
-
-pcm_ioctl() bypassed pcm->ops->ioctl() and called ioctl(pcm->fd, ...)
-directly, per a FIXME comment noting it does not handle plugins. For
-plugin-backed (virtual) pcm devices, pcm->fd is not a real character
-device descriptor, so calls such as SNDRV_PCM_IOCTL_RESET or
-SNDRV_PCM_IOCTL_PAUSE silently fail with -1 and never reach the
-plugin's ioctl callback.
-
-Both hw_ops and plug_ops already implement .ioctl correctly (hw_ops
-just forwards to the raw fd, so behavior for real hardware pcms is
-unchanged), so dispatch pcm_ioctl() through pcm->ops->ioctl() instead.
-
-Upstream-Status: Inactive-Upstream [fixed independently in a later
-upstream commit that changed this to pcm->ops->ioctl(pcm->data, ...)]
----
- src/pcm.c | 4 +++-
- 1 file changed, 3 insertions(+), 1 deletion(-)
-
-diff --git a/src/pcm.c b/src/pcm.c
-index 1b2103a..a37c383 100644
---- a/src/pcm.c
-+++ b/src/pcm.c
-@@ -1806,6 +1806,8 @@ int pcm_ioctl(struct pcm *pcm, int request, ...)
-     arg = va_arg(ap, void *);
-     va_end(ap);
- 
--    // FIXME Does not handle plugins
-+    if (pcm->ops && pcm->ops->ioctl)
-+        return pcm->ops->ioctl(pcm->data, request, arg);
-+
-     return ioctl(pcm->fd, request, arg);
- }
diff --git a/meta-multimedia/recipes-multimedia/tinyalsa/tinyalsa_2.0.0.bb b/meta-multimedia/recipes-multimedia/tinyalsa/tinyalsa_2.0.0.bb
index a76e5a7447..b3ce5b4307 100644
--- a/meta-multimedia/recipes-multimedia/tinyalsa/tinyalsa_2.0.0.bb
+++ b/meta-multimedia/recipes-multimedia/tinyalsa/tinyalsa_2.0.0.bb
@@ -7,10 +7,11 @@ LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://NOTICE;md5=d2918795d9185efcbf430b9ad5cda46d"
 
 PV .= "+git"
-SRCREV = "f78ed25aced2dfea743867b8205a787bfb091340"
+SRCREV = "a7cd26a17fe2add2ff38d2f281ed0b919187a068"
 SRC_URI = "git://github.com/tinyalsa/tinyalsa;branch=master;protocol=https \
-           file://0001-meson-add-option-to-enable-disable-plugin-support.patch \
-           file://0002-pcm-fix-pcm_ioctl-to-dispatch-through-plugin-ops.patch"
+           file://0001-meson-add-option-to-enable-disable-plugin-support.patch"
+
+UPSTREAM_CHECK_GITTAGREGEX = "v?(?P<pver>\d+(\.\d+)+)"
 
 
 inherit meson
