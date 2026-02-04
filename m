Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 846A8E8B392
	for <webhook@archiver.kernel.org>; Wed,  4 Feb 2026 03:05:13 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11000.1770174307991835593
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 03 Feb 2026 19:05:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Utv1gqiL;
 spf=pass (domain: gmail.com, ip: 209.85.221.47, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-42fbc305882so3849540f8f.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 03 Feb 2026 19:05:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770174306; x=1770779106; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=bB9xSkIASQlKBxPw0iN3HWa7VdyqcPX/NloOT3Crk3E=;
        b=Utv1gqiL4sYsB2EYuaPCfmHK0T1Klt5s7iSlvt9CmjgQuvnl6tIeT20Xj9jwC1Vous
         WCBkYK2l6dZv1PvzfV7uBQkJgdZW/iqXMbH0t8gysY45h4bBBum+GE5KP8qDbLUlr2Z3
         iRUHI5liGgUOnzRNN+rOtqiw1cWF4g3W2W54PSJlXlbOzrBjjZFRTMEeG7HH6jCh/WzT
         RKQUpvq2hhU+fZ40iT5l+epIX/5Aw3YM0CJF02Qltk684Wbnje2zsopzrn/fhuctnIv3
         R0FYYY/xdVHrv6VJ89M8SPEwXUYs0hhcph/le/+7HttonuFglwxj53NqOx0wVZt7w3Hl
         ruPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770174306; x=1770779106;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bB9xSkIASQlKBxPw0iN3HWa7VdyqcPX/NloOT3Crk3E=;
        b=TzbPQ6rxDhe2/OkNIveoudfYdaT/VTF/e9DBTIOe5LJRyGg/kdC8WNcWxjY7dLaDRP
         EDrp40Lpmj8LMs1yvfyv9CIZUP0B0/0ujsxhfscf2uBlzy8KbP8ABjq3nqsHMebnxPnw
         6xa1zahz+NM1j+QL5qam2xap267aEfRrn+zoO0QvOg/kEkNv8001TeB4pK4lr1qC/XyG
         /0S72VFhmTjT5SzqpDexBpIyaWrsUiRwfHGVfPn4qkc4DB0oFlu9cbiisL3lrUyfV8O8
         gAJNtjU75rNsXn+fh6njjanCwmlAUvNWTnSbBnYl4F4M+1pG9tN62cpE+BYdKxKtnuF6
         +1Tw==
X-Gm-Message-State: AOJu0Yx/38jVh6VR8u5cY/jEcSxVoAu4iDQVcD97r1XCx04eH9TFDU0E
	P41r53oNrfnIl/LP4EAAkj5zUYlF5hU+F0Nov938GNAGIN0GQt04/HcrNN9Lng==
X-Gm-Gg: AZuq6aJcbmZlx+tYtKHA95DTS90lyy3KkeSb/2ygjdFVKPbkn87ae1rlIFHneFTWjPX
	WRgbtU35GZUTEco+9px+owdaXYnIZoA+hfNlQBu9iROteVHEG25nExWvEc9Mc/mN0TDxOX1nivr
	Q7NF2LZaQrRae95l7n9KUnhgTqYQWAKtiTJhADaf3uR9Ao7qzBNo5uv71xGgXbi0WC+g+D/tqyr
	OQGK6/B/4x4LQhP4ouoRfWAip4wdymUP60hyriCaFL2vZYccAn3K61l0JyjiwyFw94nEoCq7SGp
	7kijDA0SfGlXWEA6eO3QgGeE6PV9uG+dxJgiSzIzyggPf4O6W27zqqXdI3Th8ko4bONaCFVh3Qa
	Hq7e6LrR6sPTiQIfsOJlK4KvVqCPHcPfHC+wAdqS5/W6cieiz3YdOKtHIgrqdMFIjvyCfY457U5
	Sez2zoxYK7
X-Received: by 2002:a05:6000:2505:b0:435:8f1b:bb32 with SMTP id ffacd0b85a97d-43618052866mr1699009f8f.32.1770174305983;
        Tue, 03 Feb 2026 19:05:05 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-436180659b8sm2627580f8f.43.2026.02.03.19.05.04
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Feb 2026 19:05:05 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH v2] freerdp3: upgrade 3.20.2 -> 3.22.0
Date: Wed,  4 Feb 2026 04:05:03 +0100
Message-ID: <20260204030503.1625693-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 04 Feb 2026 03:05:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124119

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

v2: add -DWITH_MANPAGES=OFF to EXTRA_OECMAKE

 .../freerdp/{freerdp3_3.20.2.bb => freerdp3_3.22.0.bb}        | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/freerdp/{freerdp3_3.20.2.bb => freerdp3_3.22.0.bb} (97%)

diff --git a/meta-oe/recipes-support/freerdp/freerdp3_3.20.2.bb b/meta-oe/recipes-support/freerdp/freerdp3_3.22.0.bb
similarity index 97%
rename from meta-oe/recipes-support/freerdp/freerdp3_3.20.2.bb
rename to meta-oe/recipes-support/freerdp/freerdp3_3.22.0.bb
index 81f160a848..c182ee1339 100644
--- a/meta-oe/recipes-support/freerdp/freerdp3_3.20.2.bb
+++ b/meta-oe/recipes-support/freerdp/freerdp3_3.22.0.bb
@@ -8,7 +8,7 @@ RDEPENDS:${PN}-ptest += "cmake coreutils"
 
 inherit pkgconfig cmake ptest
 
-SRCREV = "ef106b0c5adf739085ff4e8f45ef384e5a1c7bb3"
+SRCREV = "e3ef4c71138f76516299cb3637d2d0c59b2a3737"
 SRC_URI = "git://github.com/FreeRDP/FreeRDP.git;branch=master;protocol=https;tag=${PV} \
            file://run-ptest"
 
@@ -38,6 +38,7 @@ EXTRA_OECMAKE = " \
     -DWITH_CLIENT_SDL=OFF \
     -DWITH_SAMPLE=OFF \
     -DWITH_CAIRO=ON \
+    -DWITH_MANPAGES=OFF \
  "
 
 X11_DEPS = "virtual/libx11 libxinerama libxext libxcursor libxv libxi libxrender libxfixes libxdamage libxrandr libxkbfile"
@@ -49,7 +50,6 @@ PACKAGECONFIG[gstreamer] = "-DWITH_GSTREAMER_1_0=ON,-DWITH_GSTREAMER_1_0=OFF,gst
 PACKAGECONFIG[cups] = "-DWITH_CUPS=ON,-DWITH_CUPS=OFF,cups"
 PACKAGECONFIG[fuse] = "-DWITH_FUSE=ON,-DWITH_FUSE=OFF,fuse3,fuse3"
 PACKAGECONFIG[pcsc] = "-DWITH_PCSC=ON,-DWITH_PCSC=OFF,pcsc-lite"
-PACKAGECONFIG[manpages] = "-DWITH_MANPAGES=ON,-DWITH_MANPAGES=OFF, libxslt-native docbook-xsl-stylesheets-native"
 PACKAGECONFIG[ffmpeg] = "-DWITH_DSP_FFMPEG=ON -DWITH_FFMPEG=ON -DWITH_SWSCALE=ON, -DWITH_DSP_FFMPEG=OFF -DWITH_FFMPEG=OFF -DWITH_SWSCALE=OFF,ffmpeg"
 PACKAGECONFIG[krb5] = "-DWITH_KRB5=ON -DWITH_KRB5_NO_NTLM_FALLBACK=OFF,-DWITH_KRB5=OFF,krb5"
 PACKAGECONFIG[openh264] = "-DWITH_OPENH264=ON,-DWITH_OPENH264=OFF,openh264"

