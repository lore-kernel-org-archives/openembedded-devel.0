Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com [209.85.222.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6456.1792569939101243680
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Oct 2026 01:05:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Dk1iY3nm;
 spf=pass (domain: gmail.com, ip: 209.85.222.44, mailfrom: tolvupostur@gmail.com)
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-99075306daaso242819241.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 21 Oct 2026 01:05:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792569938; cv=none;
        d=google.com; s=arc-20260327;
        b=i4q0tod9JsLusQEniTCyMsW5yXznjY5LBXRQQY3RrUb2NOXltWUwbbaW6fJX4ub524
         yLRAJu6seI0Klqwpq40q7lt30NoG6fSjrgi3pFFZNWUtrIxhjHgzl8l/2QHRVF0m3wlz
         YajGUe4loekkMnVb/72Z/OpQfIElFuJ61/EUQY/m/5XLyIQ7Wr9/KXpPKCLi4JAnoRsx
         S0BUKG0SpWeH9arq8EwCdNnuVSU66uMNqXFRDkdkX7+B+QqoLLFyTQFYWywEMEOYbuMw
         1f3UMQ4PC57+/0ZOGVvIS+QVnMdfdonNWkeK8jbQuXn83BF4PJtbuxub5YSylK59GmTg
         cz4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=7XOKi19FYboT6wKFx34qbJJnSHH1E+A7IBXZK9dc3m0=;
        fh=pgSuNtBd9WV+mTof3gYKFZAQkk03g+8G5+Acac4ed14=;
        b=Bu2UbJsHj4xgTabfYWXC3yeHIGyYZhd0X0eI3MGvvP/YO7QnTBOrjOabn9W21YeCPB
         AEnrDeg8AbUGUeNCbELKc3iI5fblh8m7AMf8ks3Ii/WUnFcaUisdYAz6zwffl6ZeBUrz
         s2rNSdHjZbhdRcXwUlVAWeEJ4e+6Dm5yYpD4c5XVVxqHLQ8QUp+3WxT5ItKndXovLjPm
         p5nrckmNE6v21JLuhZ+ddyoBDLPfv2wnhxfqHfkJYJWKQIsAXYxPkzax5C/Wu+VWGBMG
         fQSQqVxXEwQnjKCETdMhIeqhZQivJ5UnqFwitkCoAGnYIQ9AGPAu+9gD+HFIlKqShWho
         ly/A==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792569938; x=1793174738; darn=lists.openembedded.org;
        h=content-type:to:subject:message-id:date:from:mime-version:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=7XOKi19FYboT6wKFx34qbJJnSHH1E+A7IBXZK9dc3m0=;
        b=Dk1iY3nm3blMj0jzCxXM79pyu09hdVcFCX68HHokxy7CorKLDEQeHGyj9CNasQjMUC
         cddhVcsgJoSTBw0grt2M86r8Y4Q+9kW55MFR9xe/IfQ4xzJZ7n2zG1A2y0YmWVGZ03u/
         sH0MeCTNQaNlcg4McbDNiXUiv91K5NhjfRzkKIblHhxT1uO8Po3VF93UpDHun/SDIMvt
         bPqV0I/h99xvaZuvqfElxrDZ4gZ2KO043F4Vk3JnTqKRXhs/UMjzNYlwXAvlrwISeUBt
         abG0rgi1uLWY05iQ/n0SPHhO57NnFm/M2jqyPmDTcCwlrcsssC+hpi1jktZ7aY1dWWzl
         9h2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792569938; x=1793174738;
        h=content-type:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7XOKi19FYboT6wKFx34qbJJnSHH1E+A7IBXZK9dc3m0=;
        b=UBb9d/dE6nxhEaGDC2H7/brtZOpcJZcfoIX5F3cz+gbcPaaTx8ADUdUqfKxdJFD3lH
         GBYPfw4u++OTpACSTm0h3rAOv2Z9N5SUHTX7AyxKNetvH1Kwvoa21WH+rS0odiuJOdSD
         MySx+XwsYgQr6UXyzvPO9V2HjiKD9jUR/ErRSYAmW+QOm5nPXKL0M/grPWk+4pqcz0vE
         bcN2zxwRxDAPdAk3uXPkyKhA19zCoRuc124aV6oj8EVt3qk2Pgwf/u9xS1rs1Qrw4G3F
         LrAdlE6heqxQfMuJA72a4SvijbgtZJQR5hd5bGDzOAv8lXq+goeYnIFn1Qyv12LV2/dD
         IahQ==
X-Gm-Message-State: AFq9FYJ285CvjW0dZ1GwXPqE/DvGAvsDCJgQVrDAjdsqiUG25G/snaFe
	9kx0nBQiHCxTpDetSo7TI/STmMisjXLQLJzNZVlgFp1UTphNXIV9wifboBUwHZao41i+9MTwqWk
	9vjEaw/5MVs1EO+L4wG8xO+mY63/mRsUVVkTXWrE=
X-Gm-Gg: AYBFou0x1OF3hJp98Njc1XvhW8Lv5wSmXAFLg1HEVrvleT1bmqVSjbhoOrxzYsxaXRR
	4liyU9ne3ght/33ao+xTSKsVl+B6G0YaXp8LZv6t71B0hYyVMA/ETDTEw280iBwdusLwZxWmmPy
	+N+OE3ylN+mjFx8BqYWkNVQoYspZcqgA6R6Uk3yCnxwWSE+7pIfdODUDdulh9gpCUbOR+alUIaR
	iGcR3xD4vhuFJaVRhSWk1dXWtU1oPn8SJDlwu99qbs2VFET5Ke3o5bdYFED9WIH0QNM0JXeh5u+
	sI43DtJy+SRsqwkrnolyz93fdZh+kV3rgONW1vjEXktonu/cti0foKSXB2IfwrcVZsBdt4Igd9i
	aYUcIrPa7ajUd7jyUpqX8HRUbN5nPQwMIsw3jJtUN0IucjFu63LmTFIncs2vS
X-Received: by 2002:a05:6102:5490:b0:7c2:ea3:418a with SMTP id
 ada2fe7eead31-7cc927687damr544671137.36.1792569937963; Wed, 21 Oct 2026
 01:05:37 -0700 (PDT)
MIME-Version: 1.0
From: "Einar Gunnarsson" <tolvupostur@gmail.com>
Date: Wed, 21 Oct 2026 10:05:25 +0200
X-Gm-Features: AclHuK8AwI3ceRHXmHfRmJFr0f4Gt0wn_vG__5GoFup-6el66VWN7SHelE-r4EQ
Message-ID: <CABhNV23CdyW+_ZHPGWLhzPfwfNR28Q4KEm8eX4+6HRf1Q8i7hg@mail.gmail.com>
Subject: [meta-multimedia][PATCH] pipewire: Remove duplicate avahi from PACKAGECONFIG
To: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 21 Oct 2026 08:06:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131186

avahi is included in PACKAGECONFIG if zeroconf is in DISTRO_FEATURES.
The update to 0.3.63 enabled it unconditionally a second time.

Fixes: c4d52888a0 ("pipewire: update 0.3.62 -> 0.3.63")

Signed-off-by: Einar Jon Gunnarsson <tolvupostur@gmail.com>
---
 meta-multimedia/recipes-multimedia/pipewire/pipewire_1.6.9.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.6.9.bb
b/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.6.9.bb
index 33b46de6cf..143f3d5e0a 100644
--- a/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.6.9.bb
+++ b/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.6.9.bb
@@ -92,7 +92,7 @@ PACKAGECONFIG:class-target ??= " \
     ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd
systemd-system-service systemd-user-service', '', d)} \
     ${@bb.utils.filter('DISTRO_FEATURES', 'alsa vulkan pulseaudio', d)} \
     ${PIPEWIRE_SESSION_MANAGER} \
-    ${FFMPEG_AVAILABLE} avahi flatpak gstreamer gsettings jack libusb
pw-cat raop sndfile v4l2 udev volume webrtc-echo-cancelling \
+    ${FFMPEG_AVAILABLE} flatpak gstreamer gsettings jack libusb
pw-cat raop sndfile v4l2 udev volume webrtc-echo-cancelling \
     libcamera readline ncurses \
 "

-- 
2.43.0
