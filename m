Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C415E73179
	for <webhook@archiver.kernel.org>; Mon,  2 Feb 2026 13:50:58 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.52504.1770040249940669512
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 02 Feb 2026 05:50:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QovLYZKO;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-47ee76e8656so59624215e9.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 02 Feb 2026 05:50:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770040248; x=1770645048; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CqVgpnWSdl9I8VuwW0HY8Z+Jsv37cLQMSbB6IMkxzh8=;
        b=QovLYZKOlmiGOeOdAk9Mt2Ivv9FjZBiiHbRBiEvmpQiZ4054Z+nFGGFu9ZCXA0T5w5
         7V8+it4m8sjRRfJBWYZiqkacUYdF+xKXf+Flz8PUrWvmbbQ/cmKGYPxesA3vcWaFoCog
         zJ7nfgBNKSGGA/ZE4nBs1soiZMh69RbQkcpSYcdPLQoa5LZbbUGjGDJ7VGgTNPLjBIvD
         M2QfES/sLq3d9MUAfzTpo4+yHq041uncpLKClgPh1ojspUT6YlLi/PGtGtPCLEFuM7RS
         6zfHJteWgBz+DQyvSzMU0G2UhREvjeBjf5rPSg0CuFQYJteGEkv+R2sBTm9a2Y4KVgbN
         LrKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770040248; x=1770645048;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CqVgpnWSdl9I8VuwW0HY8Z+Jsv37cLQMSbB6IMkxzh8=;
        b=ZZ2ECvw94FVkMGANeYhjYlI7sKwfjVAGSc1L7jdpXMAS8acqHx+oAXlsKF7U33yFYk
         fOGGX+n7wMxmgEqr2wdNglkfBXmr5W7Mxv/CxGY8tTgQQM+uKXCRpW7WVMkrtA4ol0S+
         emxhU9T3r9IGjElS3L7dz66nCWKJ6J0IN01wJP5oKS+SfWaWlF2D5WWbC5w+OsnLI/gF
         jZBqyZDW93EugGCRr5+AThfseTvPxs4DylHw+/p6lCY6u8AnRNacC530FqYFHezQiEY3
         PN9+wp7No9fS0i55BZOEn1VBUt1NTH5uVxCIo2h7b4xWqi9qAghlAlh+WvRa8fwmlqcZ
         DvLA==
X-Gm-Message-State: AOJu0Yx/a5iCER+Lgf7mWZrFzg+oHzPUtIA1wMMAxmvBTbwBVWkdx0Oq
	6g5kXc/yKCLRmYDnHbPjpMbSQwBcsDkeiiyPvkzmzgYlIw4Se5gnH0TmSAo70Q==
X-Gm-Gg: AZuq6aKGbx6KM1BRXs4M6s9sTEj0zM9e2B25i9Vu85BkAC3guxnWyW51KSPITjZBRhv
	iPMtWkl4GOSe4rvbG6UHyDPYF9O2M+jzCWf4MbZtayJAlYLY3pKa2SqaAVIKPMeaUKmzx3SLSO/
	BK8Rsv6xVyI3gXnunaWMxMhaxxbDYZOQlBqosB85Dy8XNSD2of5uW5SW69oT1kxk/VDO/o9uP9U
	yYkgChw9pOjW8FddRePgRIF2gb8Av2MOR851xoLYV1h4yxTC0CWlebLTKs2T5mNuBWk2dJq+0Ih
	hE3crpbYCa9CYQM/MmxHy7j5yWDJwHhQjuHYLm6gpsXGp7KtsGcpsZqzJfLlgUkVS16wAMC+TnT
	bKglSdwbc+vzXRivAqS67j5OfzfH/V+pS5aemTZdXtVKa02yUtj/8YV8VJnVMYs2ku4dZvCg/dP
	v7j95DZRcb
X-Received: by 2002:a05:600c:350a:b0:480:6910:abd1 with SMTP id 5b1f17b1804b1-482db491f3emr130988705e9.18.1770040248209;
        Mon, 02 Feb 2026 05:50:48 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4360ef9e804sm2843518f8f.41.2026.02.02.05.50.47
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 05:50:47 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 3/3] freerdp3: upgrade 3.20.2 -> 3.22.0
Date: Mon,  2 Feb 2026 14:50:45 +0100
Message-ID: <20260202135045.1476359-3-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260202135045.1476359-1-skandigraun@gmail.com>
References: <20260202135045.1476359-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 02 Feb 2026 13:50:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124061

Ptests passed successfully.

Dropped manpages PACKAGECONFIG: when it is enabled, it requires an executable that
is compiled from the project's source, but since it is cross-compiled, it is not
usable. The cmakefile also started to explicitly disable generating this tool
when cross-compiling is enabled.
Since this recipe has no native counterpart, and the manpages can't be generated
in this state, this option was removed.

Changes:
3.22.0:
- Complete overhaul of SDL client
- Introduction of new WINPR_ATTR_NODISCARD macro wrapping compiler or C language
  version specific [[nodiscard]] attributes
- Addition of WINPR_ATTR_NODISCARD to (some) public API functions so usage errors
  are producing warnings now
- Add some more stringify functions for logging
- CVE fixes: CVE-2026-23948, CVE-2026-24682, CVE-2026-24683, CVE-2026-24676,
  CVE-2026-24677, CVE-2026-24678, CVE-2026-24684, CVE-2026-24679,
  CVE-2026-24681, CVE-2026-24675, CVE-2026-24491, CVE-2026-24680
- [core,info] fix missing NULL check
- [gateway,tsg] fix TSG_PACKET_RESPONSE parsing
- Allow querying auth identity with kerberos when running as a server
- Sspi krb heimdal
- Tsg fix idleTimeout parsing
- [channels,smartcard] revert 649f7de
- [crypto] deprecate er and der modules
- [channels,rdpei] lock full update, not only parts
- [winpr,platform] add WINPR_ATTR_NODISCARD macro
- Wlog cleanup
- new stringify functions & touch API defines
- Add support for querying SECPKG_ATTR_PACKAGE_INFO to NTLM and Kerberos
- [channels,video] measure times in ns
- [utils] Nodiscard
- Error handling fixes
- [channels,drdynvc] check pointer before reset
- Winpr api def
- [winpr,platform] drop C23 [[nodiscard]]
- [gdi] add additional checks for a valid rdpGdi
- Sdl3 high dpiv2
- peer: Disconnect if Logon() returned FALSE
- [channels,rdpecam] fix PROPERTY_DESCRIPTION parsing
- [channel,rdpsnd] only clean up thread before free
- [channels,rdpei] add RDPINPUT_CONTACT_FLAG_UP

3.21.0:
- CVE fixes: CVE-2026-23530, CVE-2026-23531, CVE-2026-23532, CVE-2026-23533,
  CVE-2026-23534, CVE-2026-23732, CVE-2026-23883, CVE-2026-23884
- [client,sdl] fix monitor resolution
- [codec,progressive] fix progressive_rfx_upgrade_block
- Krb cache fix
- Rdpdr improved checks
- Codec advanced length checks
- Glyph fix length checks
- Wlog printf format string checks
- [warnings,format] fix format string warnings
- Double free fixes
- [clang-tidy] clean up code warnings

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../freerdp/{freerdp3_3.20.2.bb => freerdp3_3.22.0.bb}         | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-oe/recipes-support/freerdp/{freerdp3_3.20.2.bb => freerdp3_3.22.0.bb} (97%)

diff --git a/meta-oe/recipes-support/freerdp/freerdp3_3.20.2.bb b/meta-oe/recipes-support/freerdp/freerdp3_3.22.0.bb
similarity index 97%
rename from meta-oe/recipes-support/freerdp/freerdp3_3.20.2.bb
rename to meta-oe/recipes-support/freerdp/freerdp3_3.22.0.bb
index 81f160a848..ce4af4227e 100644
--- a/meta-oe/recipes-support/freerdp/freerdp3_3.20.2.bb
+++ b/meta-oe/recipes-support/freerdp/freerdp3_3.22.0.bb
@@ -8,7 +8,7 @@ RDEPENDS:${PN}-ptest += "cmake coreutils"
 
 inherit pkgconfig cmake ptest
 
-SRCREV = "ef106b0c5adf739085ff4e8f45ef384e5a1c7bb3"
+SRCREV = "e3ef4c71138f76516299cb3637d2d0c59b2a3737"
 SRC_URI = "git://github.com/FreeRDP/FreeRDP.git;branch=master;protocol=https;tag=${PV} \
            file://run-ptest"
 
@@ -49,7 +49,6 @@ PACKAGECONFIG[gstreamer] = "-DWITH_GSTREAMER_1_0=ON,-DWITH_GSTREAMER_1_0=OFF,gst
 PACKAGECONFIG[cups] = "-DWITH_CUPS=ON,-DWITH_CUPS=OFF,cups"
 PACKAGECONFIG[fuse] = "-DWITH_FUSE=ON,-DWITH_FUSE=OFF,fuse3,fuse3"
 PACKAGECONFIG[pcsc] = "-DWITH_PCSC=ON,-DWITH_PCSC=OFF,pcsc-lite"
-PACKAGECONFIG[manpages] = "-DWITH_MANPAGES=ON,-DWITH_MANPAGES=OFF, libxslt-native docbook-xsl-stylesheets-native"
 PACKAGECONFIG[ffmpeg] = "-DWITH_DSP_FFMPEG=ON -DWITH_FFMPEG=ON -DWITH_SWSCALE=ON, -DWITH_DSP_FFMPEG=OFF -DWITH_FFMPEG=OFF -DWITH_SWSCALE=OFF,ffmpeg"
 PACKAGECONFIG[krb5] = "-DWITH_KRB5=ON -DWITH_KRB5_NO_NTLM_FALLBACK=OFF,-DWITH_KRB5=OFF,krb5"
 PACKAGECONFIG[openh264] = "-DWITH_OPENH264=ON,-DWITH_OPENH264=OFF,openh264"

