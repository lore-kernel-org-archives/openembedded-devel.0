Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBE7FEA796A
	for <webhook@archiver.kernel.org>; Thu,  5 Feb 2026 05:05:17 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14187.1770267909889589157
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 04 Feb 2026 21:05:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gMy4rjBx;
 spf=pass (domain: gmail.com, ip: 209.85.221.42, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-432d2c7a8b9so456654f8f.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 04 Feb 2026 21:05:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770267908; x=1770872708; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xhZ3Go88+yIgux2au6WWVVeIlhx02YetotCRT/DL0Zg=;
        b=gMy4rjBxKquOYYVYMgIJMYaX2E7qmiRRSXDuAmdt9/NJXfPhrXOSDbGiP6Qq2Nh1R8
         AkGMyrSRuMqqd3YnfmlEaSJoUTxGvavGqy8UASBli+ITG4FQ2UcnSIghPY51pyg6r8fd
         ypmFBI5lQx5uBstBFsyz/QYQgWRIH3NThIkGktZP6Ikcmho8fl4oGl9kMAJZfevOlefp
         oyDfoeyZM9GRQqEY/9eyMVTAxPVR71njEZtkK594nxhpYlWJWJPejGy7IdHWc3hrWf+e
         GnAEuzRtKl1huRbamLV4t0njoET+4tvxCaOu58VhCRR5odE4kdcummKWuT0Fd5jNyAEx
         myAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770267908; x=1770872708;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xhZ3Go88+yIgux2au6WWVVeIlhx02YetotCRT/DL0Zg=;
        b=I1WviCCefznNP82HGO2SlpG1mzM5L8ZVmqdn8GepFvW2OpC4wERbanwjDABZwE8BIy
         vaa235DBo7jeB2zagVNfys8l/uqgKJtxj4NajoJTte8YY9K/Oq+yONLen+ZMjkEeLLL5
         lc0+yvz9yWb6xJZ2Rss2dNDZshRSCBfXFRfneOey3oYjv6/SC9+hLvsIF04Y0RKt+FhW
         CZeh6uS8jDd74ZxGxukcpwVYhtSsn+LYvZV+EgBWNa0Sz0/wJiqUwMKXkE/vBBiMBVqq
         Yf5FceChdewg/x87AuEOIy6v1vTwSGJ3jSROqFjtbX6nIgpf1zMv+tTsubGTgfY+I1TP
         s5AA==
X-Gm-Message-State: AOJu0YwadAs8DYsG7RWO0nbCsJsA8nEr6SCdkqPMqPCxloPiiOZn339P
	+U6VqN4zADxyOfeZkY5lztQsTqvQZaKyi3JzN5w//W3mfWIfUBYZ5DFX
X-Gm-Gg: AZuq6aJwrFNB6ksgX4uOOK3IxddmzfT+aDLWmH7yaIjsvo/OHJTTO3xxKII50gFDlRt
	l8V5jB5jPkWXRoL1SEOGu5dsZ/C/Ep1AOaWylW6/L3397EHNmwPgUsXONY8cmPiQD91imQ2HR3a
	wFQ1w5sejIJqSNT5/U2ymDsNL/H/0cgXYM47VNt1asw8N8a+VoePxxCAnqaVIDXhYW3BUJhc5kF
	Rv4vLFTSsptR86unsl5Cah/lkQ02v9+wT9G/7h8WX0p3lYUWy14IYBQNPODmmAUQOpKmUWJW2Db
	2iL8G8B09PJHQbZNKjYZmYRkPrXyMyp/VCqGovBSGSI8580k59atFfKUt+eCZ6C4Bf63k4x1INb
	kMp0DGOye+TbPcz3ssCtC/bNQ+2WHm2S7Ln8as7TOcy8gq/ihWALvXhE+KcB11Z8/1z31863TNC
	DIhvdGmbXO8/djbKfVD8I=
X-Received: by 2002:a05:6000:26c3:b0:435:bbd7:1947 with SMTP id ffacd0b85a97d-43617e3936dmr8061138f8f.5.1770267907863;
        Wed, 04 Feb 2026 21:05:07 -0800 (PST)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43618057f87sm11263825f8f.21.2026.02.04.21.05.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Feb 2026 21:05:06 -0800 (PST)
Message-ID: <5c887439-308d-4118-9da4-83e970c13d4d@gmail.com>
Date: Thu, 5 Feb 2026 06:05:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][PATCH v2] freerdp3: upgrade 3.20.2 -> 3.22.0
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
References: <20260204030503.1625693-1-skandigraun@gmail.com>
 <CAMKF1spqtXgad06k0iXHjp3-0mAk7yPgf0=73bSBhZE=jMHsAQ@mail.gmail.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <CAMKF1spqtXgad06k0iXHjp3-0mAk7yPgf0=73bSBhZE=jMHsAQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 05 Feb 2026 05:05:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124152

On 2/5/26 05:53, Khem Raj wrote:
> does this also solve configure issue seen here 
>
> https://gist.github.com/kraj/bda86016e7b8fc60f5fead5ee3dc9696

Yeah, it supposed to go away with this patch


>
> On Tue, Feb 3, 2026 at 7:05 PM Gyorgy Sarvari via
> lists.openembedded.org <http://lists.openembedded.org>
> <skandigraun=gmail.com@lists.openembedded.org> wrote:
>
>     Ptests passed successfully.
>
>     Dropped manpages PACKAGECONFIG: when it is enabled, it requires an
>     executable that
>     is compiled from the project's source, but since it is
>     cross-compiled, it is not
>     usable. The cmakefile also started to explicitly disable
>     generating this tool
>     when cross-compiling is enabled.
>     Since this recipe has no native counterpart, and the manpages
>     can't be generated
>     in this state, this option was removed.
>
>     Changes:
>     3.22.0:
>     - Complete overhaul of SDL client
>     - Introduction of new WINPR_ATTR_NODISCARD macro wrapping compiler
>     or C language
>       version specific [[nodiscard]] attributes
>     - Addition of WINPR_ATTR_NODISCARD to (some) public API functions
>     so usage errors
>       are producing warnings now
>     - Add some more stringify functions for logging
>     - CVE fixes: CVE-2026-23948, CVE-2026-24682, CVE-2026-24683,
>     CVE-2026-24676,
>       CVE-2026-24677, CVE-2026-24678, CVE-2026-24684, CVE-2026-24679,
>       CVE-2026-24681, CVE-2026-24675, CVE-2026-24491, CVE-2026-24680
>     - [core,info] fix missing NULL check
>     - [gateway,tsg] fix TSG_PACKET_RESPONSE parsing
>     - Allow querying auth identity with kerberos when running as a server
>     - Sspi krb heimdal
>     - Tsg fix idleTimeout parsing
>     - [channels,smartcard] revert 649f7de
>     - [crypto] deprecate er and der modules
>     - [channels,rdpei] lock full update, not only parts
>     - [winpr,platform] add WINPR_ATTR_NODISCARD macro
>     - Wlog cleanup
>     - new stringify functions & touch API defines
>     - Add support for querying SECPKG_ATTR_PACKAGE_INFO to NTLM and
>     Kerberos
>     - [channels,video] measure times in ns
>     - [utils] Nodiscard
>     - Error handling fixes
>     - [channels,drdynvc] check pointer before reset
>     - Winpr api def
>     - [winpr,platform] drop C23 [[nodiscard]]
>     - [gdi] add additional checks for a valid rdpGdi
>     - Sdl3 high dpiv2
>     - peer: Disconnect if Logon() returned FALSE
>     - [channels,rdpecam] fix PROPERTY_DESCRIPTION parsing
>     - [channel,rdpsnd] only clean up thread before free
>     - [channels,rdpei] add RDPINPUT_CONTACT_FLAG_UP
>
>     3.21.0:
>     - CVE fixes: CVE-2026-23530, CVE-2026-23531, CVE-2026-23532,
>     CVE-2026-23533,
>       CVE-2026-23534, CVE-2026-23732, CVE-2026-23883, CVE-2026-23884
>     - [client,sdl] fix monitor resolution
>     - [codec,progressive] fix progressive_rfx_upgrade_block
>     - Krb cache fix
>     - Rdpdr improved checks
>     - Codec advanced length checks
>     - Glyph fix length checks
>     - Wlog printf format string checks
>     - [warnings,format] fix format string warnings
>     - Double free fixes
>     - [clang-tidy] clean up code warnings
>
>     Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
>     ---
>
>     v2: add -DWITH_MANPAGES=OFF to EXTRA_OECMAKE
>
>      .../freerdp/{freerdp3_3.20.2.bb <http://freerdp3_3.20.2.bb> =>
>     freerdp3_3.22.0.bb <http://freerdp3_3.22.0.bb>}        | 4 ++--
>      1 file changed, 2 insertions(+), 2 deletions(-)
>      rename meta-oe/recipes-support/freerdp/{freerdp3_3.20.2.bb
>     <http://freerdp3_3.20.2.bb> => freerdp3_3.22.0.bb
>     <http://freerdp3_3.22.0.bb>} (97%)
>
>     diff --git a/meta-oe/recipes-support/freerdp/freerdp3_3.20.2.bb
>     <http://freerdp3_3.20.2.bb>
>     b/meta-oe/recipes-support/freerdp/freerdp3_3.22.0.bb
>     <http://freerdp3_3.22.0.bb>
>     similarity index 97%
>     rename from meta-oe/recipes-support/freerdp/freerdp3_3.20.2.bb
>     <http://freerdp3_3.20.2.bb>
>     rename to meta-oe/recipes-support/freerdp/freerdp3_3.22.0.bb
>     <http://freerdp3_3.22.0.bb>
>     index 81f160a848..c182ee1339 100644
>     --- a/meta-oe/recipes-support/freerdp/freerdp3_3.20.2.bb
>     <http://freerdp3_3.20.2.bb>
>     +++ b/meta-oe/recipes-support/freerdp/freerdp3_3.22.0.bb
>     <http://freerdp3_3.22.0.bb>
>     @@ -8,7 +8,7 @@ RDEPENDS:${PN}-ptest += "cmake coreutils"
>
>      inherit pkgconfig cmake ptest
>
>     -SRCREV = "ef106b0c5adf739085ff4e8f45ef384e5a1c7bb3"
>     +SRCREV = "e3ef4c71138f76516299cb3637d2d0c59b2a3737"
>      SRC_URI =
>     "git://github.com/FreeRDP/FreeRDP.git;branch=master;protocol=https;tag=${PV}
>     <http://github.com/FreeRDP/FreeRDP.git;branch=master;protocol=https;tag=$%7BPV%7D>
>     \
>                 file://run-ptest"
>
>     @@ -38,6 +38,7 @@ EXTRA_OECMAKE = " \
>          -DWITH_CLIENT_SDL=OFF \
>          -DWITH_SAMPLE=OFF \
>          -DWITH_CAIRO=ON \
>     +    -DWITH_MANPAGES=OFF \
>       "
>
>      X11_DEPS = "virtual/libx11 libxinerama libxext libxcursor libxv
>     libxi libxrender libxfixes libxdamage libxrandr libxkbfile"
>     @@ -49,7 +50,6 @@ PACKAGECONFIG[gstreamer] =
>     "-DWITH_GSTREAMER_1_0=ON,-DWITH_GSTREAMER_1_0=OFF,gst
>      PACKAGECONFIG[cups] = "-DWITH_CUPS=ON,-DWITH_CUPS=OFF,cups"
>      PACKAGECONFIG[fuse] = "-DWITH_FUSE=ON,-DWITH_FUSE=OFF,fuse3,fuse3"
>      PACKAGECONFIG[pcsc] = "-DWITH_PCSC=ON,-DWITH_PCSC=OFF,pcsc-lite"
>     -PACKAGECONFIG[manpages] =
>     "-DWITH_MANPAGES=ON,-DWITH_MANPAGES=OFF, libxslt-native
>     docbook-xsl-stylesheets-native"
>      PACKAGECONFIG[ffmpeg] = "-DWITH_DSP_FFMPEG=ON -DWITH_FFMPEG=ON
>     -DWITH_SWSCALE=ON, -DWITH_DSP_FFMPEG=OFF -DWITH_FFMPEG=OFF
>     -DWITH_SWSCALE=OFF,ffmpeg"
>      PACKAGECONFIG[krb5] = "-DWITH_KRB5=ON
>     -DWITH_KRB5_NO_NTLM_FALLBACK=OFF,-DWITH_KRB5=OFF,krb5"
>      PACKAGECONFIG[openh264] =
>     "-DWITH_OPENH264=ON,-DWITH_OPENH264=OFF,openh264"
>
>     -=-=-=-=-=-=-=-=-=-=-=-
>     Links: You receive all messages sent to this group.
>     View/Reply Online (#124119):
>     https://lists.openembedded.org/g/openembedded-devel/message/124119
>     Mute This Topic: https://lists.openembedded.org/mt/117628610/1997914
>     Group Owner: openembedded-devel+owner@lists.openembedded.org
>     <mailto:openembedded-devel%2Bowner@lists.openembedded.org>
>     Unsubscribe:
>     https://lists.openembedded.org/g/openembedded-devel/unsub
>     [raj.khem@gmail.com]
>     -=-=-=-=-=-=-=-=-=-=-=-
>


