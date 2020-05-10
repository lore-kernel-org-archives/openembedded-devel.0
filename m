Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com [209.85.221.67])
 by mx.groups.io with SMTP id smtpd.web11.13128.1589110146831571533
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 10 May 2020 04:29:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=IQwkC2mm;
 spf=pass (domain: gmail.com, ip: 209.85.221.67, mailfrom: schnitzeltony@gmail.com)
Received: by mail-wr1-f67.google.com with SMTP id i15so7208369wrx.10
        for <openembedded-devel@lists.openembedded.org>; Sun, 10 May 2020 04:29:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=3gvdgsZDT2ZIMmYQoKKq3+OUz6BUfw2AYzezH1Mj94M=;
        b=IQwkC2mmvupyIESWVWtY1ElPk6lRR3zgZz1NGnzo+oVeDcoWgwDlhHZCqUOiriZ53y
         /n8R6JgOVgvn7mPs+QZsvbRQPng+mL4FdUZIMtdhOvVNDnImMLT48oz9ZZE892sQoNax
         djSgtbafmMKSsIenUPtUwa5ewXjj9h6Hn9dLws6R/BRLQGQAe/shrD3prwx6NoOoEN8g
         jcBVZV5p3lMgBjkEeEvSEYPpeBNgaqdIkgS2MqEoAB4LD6WX/hk8SOHG6cFmn0Xc4UBk
         bxO1gFH7NXpsgWdJ0tRxIu2GB4gTXYEntCJ1qI/qIQ+Z/PBC4+MFBRVfkSvv/0KIiFtb
         q3Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3gvdgsZDT2ZIMmYQoKKq3+OUz6BUfw2AYzezH1Mj94M=;
        b=Bx3kLIyq2/kj3s/58xoAIyv4MVOC+eaZCDrw6USPOBvmqQsN4TitBa0FUU81L76TOf
         P7MYTJFxsZ2UmdOj5rczOXfPO221Y7Sfj25zDNx7Xa4AATQN0SkkT7/dcSrK/6zIU1Xn
         4uR+4BZFNFTj+mvoZ5AwQrPNCUhJ/xXnQAMTc6deExN6rLyHUrXCPNJFpoy9EaBvy9sN
         XtPNmJU445gIyNgIJrh4VUtzjwowe9LG9qizGcansio1sE88//oVVXZa0tmc9v1oP7yu
         6T/4CdpdYqiBt9TWFnuHf51n/Lw1+u6v4rfl7MSZyfNec+EKBiXdq+OQe047BB2k6g4v
         hMew==
X-Gm-Message-State: AGi0PuZjM1hdb9dsnErLyWQjdJaF1I3YjoqwO0VQQj9XdwCshxqjmt4i
	eLqZZYuyMeJDrkBscWDUSfMbiNnd
X-Google-Smtp-Source: APiQypKZmYymy4YnrAu2MwhyEZRXSt0PhsjHsXfG+hkpGhWBukzM1xJ0HBuu8JCue8KQogq/tpxeQw==
X-Received: by 2002:adf:a297:: with SMTP id s23mr13390572wra.54.1589110145148;
        Sun, 10 May 2020 04:29:05 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300F07F085F042F904D54ECAC10E7.dip0.t-ipconnect.de. [2003:f0:7f08:5f04:2f90:4d54:ecac:10e7])
        by smtp.gmail.com with ESMTPSA id k5sm11733319wrx.16.2020.05.10.04.29.04
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 May 2020 04:29:04 -0700 (PDT)
From: "Andreas M?ller" <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 3/5] xfwm4: upgrade 4.14.1 -> 4.14.2
Date: Sun, 10 May 2020 13:28:49 +0200
Message-Id: <20200510112851.31218-3-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200510112851.31218-1-schnitzeltony@gmail.com>
References: <20200510112851.31218-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Release notes for 4.14.2
========================
4.14.2
======

- Prefer GLX on AMD (Bug #16716)
- Fix compositor without required X11 extensions (Bug #16713)
- Fix window decorations without XRender extension (Bug #16713)
- Avoid grabbing the keyboard with Alt-Tab to work around a bug in
  Qt with XInput2 valuators (Bug #16708)
- Automatically update window title fonts on scale change
- Fix a regression with title font size at scale 2 (Bug #16711)
- Fix an X error with XShape (Bug #16383)
- I18n:
  Update translations: ar, be, be@tarask, bg, bn, ca, cs, da, de, el,
  en_AU, en_CA, en_GB, es, eu, fi, fr, gl, he, hr, hy_AM, id, ie, is,
  it, ka, ko, lt, lv, nb, nl, nn, oc, pl, pt, pt_BR, ro, sk, sl, sq,
  sv, th, ug, ur, ur_PK, zh_CN, zh_HK

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../recipes-xfce/xfwm4/{xfwm4_4.14.1.bb => xfwm4_4.14.2.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-xfce/xfwm4/{xfwm4_4.14.1.bb => xfwm4_4.14.2.bb} (90%)

diff --git a/meta-xfce/recipes-xfce/xfwm4/xfwm4_4.14.1.bb b/meta-xfce/recipes-xfce/xfwm4/xfwm4_4.14.2.bb
similarity index 90%
rename from meta-xfce/recipes-xfce/xfwm4/xfwm4_4.14.1.bb
rename to meta-xfce/recipes-xfce/xfwm4/xfwm4_4.14.2.bb
index 617e14f8e..b6066a526 100644
--- a/meta-xfce/recipes-xfce/xfwm4/xfwm4_4.14.1.bb
+++ b/meta-xfce/recipes-xfce/xfwm4/xfwm4_4.14.2.bb
@@ -9,8 +9,8 @@ inherit xfce update-alternatives features_check
 REQUIRED_DISTRO_FEATURES = "x11"
 
 SRC_URI += "file://0001-Revert-compositor-Revert-to-GLX-as-default-vblank-me.patch"
-SRC_URI[md5sum] = "b20bd22bdbe1b17f76a139fd74e072a9"
-SRC_URI[sha256sum] = "100781a18070762e8f34c1d450e767586576753d567f76a8c32818284f511428"
+SRC_URI[md5sum] = "6d61d07b6ea88a429c43e1b9c3293eb8"
+SRC_URI[sha256sum] = "b15b40342596a3b6ab5167a58371262adf5484e165cb25a31fef42f0aa8ffd92"
 
 PACKAGECONFIG ?= " \
     ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'epoxy', '', d)} \
-- 
2.21.1

