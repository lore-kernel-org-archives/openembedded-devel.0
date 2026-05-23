Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5507CD5BB1
	for <webhook@archiver.kernel.org>; Sat, 23 May 2026 05:01:52 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3093.1779512508955368811
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 22 May 2026 22:01:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=TfigSDjK;
 spf=pass (domain: gmail.com, ip: 209.85.210.180, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-82f8b60e54dso6569285b3a.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 22 May 2026 22:01:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779512508; x=1780117308; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h9o5RepdMhOpDt4ZFIKfGQ4jTTNIJ/DeCW5TqoyX+Dc=;
        b=TfigSDjKAlnp1LwpLCsLFMp9EXGqagHoataqrr9CsBVdcU/XRsdp+SG4KK9lbKv0bq
         /Mtq7qoobX+3vcXoYu9SeeyXUQUOCJbMom9M2ZlmewIe5naEZsrWly3RfvRseC+cW5mW
         VH4pOvfQIHBpxSffYFjzCr0C4eGn0MXLbPgfM9ULomwHne+kQXCdvg+taU7Uxc+YnmFg
         ZjcjVc/k6ASNgjfHPQjnQxmGYlRoo1p8SDnZpRqEQOb8ILI1+VJIUvgNFLoYkRX9oiDz
         Wp1xx8vBLM2tQ7MD1Cvcg2kcYxZ5TGhU5Jo0hGOm7+u7C+As6vNaHNcoHyMRx9p7mzLh
         bwIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779512508; x=1780117308;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=h9o5RepdMhOpDt4ZFIKfGQ4jTTNIJ/DeCW5TqoyX+Dc=;
        b=ZA42MDMy2YKED1/gxiUMKJx0f5r8zspEZFKoRYX0eFNlsOLEJWt/9z1iyMm+espCN7
         qOOI0ifYNCLq42vUAFGwJ0Puo6Em1HvplrPZXZ5v72/sFoyfk3WGYyuYMhYKD2g207Bf
         45MDjFKnp0xV9udXV/A0gce6hAzyhPuQt2TVCmsIF6Q15tKbBONij2S2RTKelDHfGG5j
         PRxYS388x01c7IW3LYaxmRKfewq2NQB79VAT7skyDzBEkMJaxW/3pTi/z4sVtKMfkn5Y
         zjCIY65I0lJe6zJceRbuOyhU6QQO0zT7RI+xIThSGe436eCzewKOgbGWAQSYT571hJqN
         V8NA==
X-Gm-Message-State: AOJu0YyxNS9V08480rJa1caSGVHRoHXwsQSQttuD5nW87h+/3OE1aj5J
	iGjC7FoOJhvEz6CQipbiyVtuQ+886g5I6500NOj4s9rDq27vNXo+WyjgwNMiXMF+
X-Gm-Gg: Acq92OE4SQGwvc+6959dNC495J99BuuQB5AFMdQrSQQvqAXGT+W7Z/qnZcxqi07vf04
	IDPVbIvmt8aAWfl+wM8s8TJEmp8iCHDE57iZ2L2P40aw913TeNoy5/maag8sMsvwmQdMDE3uMbX
	NM3QTLc82PlSUCE0F+dGcz03GW5AFJOkLoBPBnIYgEGpNFOuwvFXbUwC9K+2JpU3v3ymPNfi39J
	sLMXAzEPJKIQEEPDUOVdhXTDqJEIHQgKatzBi5G8JzsfgEV3MUn+z2AWVmWTdVe0ax9RHptpFN7
	v6VvzOwDK8hYENyxDk7+NF8BoG1VWl9c3VdXsQrWHdn78kzyyTSZJFRbHFvTP7HAsHe4WjSBjod
	I4QuTVwkOE0oj+Ne0caMm4p5OYz9oXPqUVcjyEsK5RLG1jSYDeWpG7VwKp62FGHWC2jx6E6qSu/
	nntLdFFfLON/JyL4Sf8JQD7JOWSvoT/7Cpd+tP
X-Received: by 2002:a05:6a00:1944:b0:82f:5125:a327 with SMTP id d2e1a72fcca58-8415f33006amr5946680b3a.27.1779512508334;
        Fri, 22 May 2026 22:01:48 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.105.153])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84164ad2ca6sm3423107b3a.5.2026.05.22.22.01.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 22:01:47 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>,
	Khem Raj <khem.raj@oss.qualcomm.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-multimedia][wrynose][PATCH 23/25] pipewire: update 1.6.3 -> 1.6.5
Date: Sat, 23 May 2026 17:00:25 +1200
Message-ID: <20260523050028.848327-23-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260523050028.848327-1-ankur.tyagi85@gmail.com>
References: <20260523050028.848327-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 23 May 2026 05:01:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127173

From: Markus Volk <f_l_k@t-online.de>

PipeWire 1.6.5 (2026-05-13)

This is a bugfix release that is API and ABI compatible with the previous
1.6.x releases.

Highlights
  - Fix muted output in some cases.
  - Removed the pipe filter in filter-graph.
  - More fixes and improvements.

PipeWire
  - Fix an issue in pw-filter where it could end up in a loop where buffers
    are stuck on a port and the port becomes silent. (#5249)

Modules
  - Improve ROC receiver start/stop, fixes memory leaks. (#5250)
  - Remove the pipe filter from filter-graph, it's broken by design and a
    security nightmare.
  - Fix the midi buffer size in jack-tunnel.

SPA
  - Rate limit out-of-buffers errors. (#5249)
  - Partially revert the line-out mute patch, it seems to break things and leave
    audio muted when plugging-unplugging jacks.  (#5246)
  - Improve renegotiation in audioconvert when the graph rate changes and the
    resampler was disabled. (#4933).
  - Fix potential crash in alsa when logging.

Pulse-server
  - A whole bunch of extra security checks and hardening fixes.

Older versions:

PipeWire 1.6.4 (2026-04-22)

This is a bugfix release that is API and ABI compatible with the previous
1.6.x releases.

Highlights
  - Small improvements and seqfault fixes.
  - Try to not emit ports that JACK doesn't understand. Fixes glitches in
    ardour and other JACK apps.

PipeWire
  - Refuse to load plugins and crash when pw_init() was not called. (!2784)

SPA
  - Fix LADSPA plugin loading, support LADSPA_PATH ending with /
  - Fix segfault in alsa-seq when removing devices in some cases. (#5221)
  - Allow negative gain in mixer. (#5228)
  - Improve alsa-seq port names, add : between client and port. (#5229)
  - ACP: don’t override user-selected port on availability changes.

Bluetooth
  - Backport some important fixes and minor improvements.

JACK
  - Ignore non DSP ports to avoid emitting extra callbacks.

GStreamer
  - Fix crop metadata.

Tools
  - Fix WAVEX saving in pw-cat. (#5233)

Signed-off-by: Markus Volk <f_l_k@t-online.de>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit babcd8741435f1d97c759f7379dbfbd3ba3982f9)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../pipewire/{pipewire_1.6.3.bb => pipewire_1.6.5.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-multimedia/recipes-multimedia/pipewire/{pipewire_1.6.3.bb => pipewire_1.6.5.bb} (99%)

diff --git a/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.6.3.bb b/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.6.5.bb
similarity index 99%
rename from meta-multimedia/recipes-multimedia/pipewire/pipewire_1.6.3.bb
rename to meta-multimedia/recipes-multimedia/pipewire/pipewire_1.6.5.bb
index 82cd928b4a..5d610f5172 100644
--- a/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.6.3.bb
+++ b/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.6.5.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS = "dbus ncurses"
 
-SRCREV = "cc3d0d1191266b263f6d0fa03fce1d1ef57151cc"
+SRCREV = "55848f4260a2d2302f9f6bd304d82616976ef9af"
 BRANCH = "${@oe.utils.trim_version('${PV}', 2)}"
 SRC_URI = "git://gitlab.freedesktop.org/pipewire/pipewire.git;branch=${BRANCH};protocol=https;tag=${PV}"
 SRC_URI += "file://0002-spa-plugins-alsa-acp-compat.h-p-is-already-const-do-.patch"

