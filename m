Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web11.2293.1585607194515536121
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 30 Mar 2020 15:26:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=cfsKg1LE;
 spf=pass (domain: gmail.com, ip: 209.85.221.51, mailfrom: schnitzeltony@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id h15so23582528wrx.9
        for <openembedded-devel@lists.openembedded.org>; Mon, 30 Mar 2020 15:26:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=O8XI7uvQ3GdwB0L0lzhTHAxqqGkPkHAg8IiRgmXrXP8=;
        b=cfsKg1LELShHKwwz1VThJgNkiZ5CCPPXtS6PjNEJpyz/BFNjXLa3gb6cq3luZ1otFY
         jgdHcZB+LNpp+KF+gC5vuN+u30l5LgiJBQZ6TvopwPve4zUnGrdnyNWyTJaYKqBOBypN
         kATXhwntdVX7tklmCPEuiVzj8yLZo8hZdkKY/j+lS/Gs3iiYBfGzBELupzGV3z4KX2Nn
         SAG5o//TX14mE6elu4K9fv0dQuAgs4JcBevRQpYS0iy2YcDoXZzAi+z5pXVj7u55UEhX
         r+MRtrGV44wRlOtUEIoWQ2aCLgxlw3ibZ9FM11wZ3Y6q81tg1oU/pFnpTUSrVZI2BReQ
         ieow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=O8XI7uvQ3GdwB0L0lzhTHAxqqGkPkHAg8IiRgmXrXP8=;
        b=HWTjsgejdInHQ6JGefgp8KVDYWTs2PMgORJ0fP0dj3Qf4wP+DFQhfLEg0Ttzdz5WLc
         SOR26aMGRL97Q07ooC6MNZi8c5UE/ngBrewthWKI5/7YZOj+Lmrb1f8BKQF99jsfN5A5
         6wXKJ98UTniEFcTJvSR/xMNq/l/QWeMuI4LSfIR18L7rXuOSDbNQaqGjXGEPCNgHo3/H
         hkjVXlcQrQpf23kQYfKH90l2uXArBT4WIxp5OOkcDmnA7pI0oUqopMGe5vw+ueWmGXun
         shkpF0gF0coshZgg+4Gc1c5K0Mw8+j/b0ISiKj9aMAlCKQU6Yhn1HjB9p0SRt8/hjhbi
         v+iQ==
X-Gm-Message-State: ANhLgQ2bc+3wjyEdR6aGB3efJmXoMvwOEIqs44FnV015jhBRWK8O5Qr4
	NmK/nZkVNsktoHNSmL00aoDgN3ARl40=
X-Google-Smtp-Source: ADFU+vsTMGPoKCnFoPiJbBVOs8zgCSzXxm2pKGpRjNnd56Iz548xt8Yo7hQhLzg+SssE8xAOOmiiSw==
X-Received: by 2002:adf:ea8f:: with SMTP id s15mr16852184wrm.393.1585607192859;
        Mon, 30 Mar 2020 15:26:32 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300F07F030968BA11C5DB455F3E0C.dip0.t-ipconnect.de. [2003:f0:7f03:968:ba11:c5db:455f:3e0c])
        by smtp.gmail.com with ESMTPSA id z1sm12002404wrp.90.2020.03.30.15.26.31
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2020 15:26:32 -0700 (PDT)
From: "Andreas M?ller" <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 6/6] xfce4-screensaver: upgrade 0.1.8 -> 0.1.10
Date: Tue, 31 Mar 2020 00:26:16 +0200
Message-Id: <20200330222616.2354-6-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200330222616.2354-1-schnitzeltony@gmail.com>
References: <20200330222616.2354-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Release notes for 0.1.10
========================
[Please note that this is a development release.]

This release adds empty responses to DBus calls that don't require a
response. This matches gnome-screensaver's functionality, and fixes
support for xfce4-session.

- Send DBus lock responses for xfce4-session support (bug #16522)
- Translation Update: Galician

Release notes for 0.1.9
=======================
Please note that this is a development release.

- Replace deprecated GTimeVal usage
- Rebuild windows on monitor reconfiguration
- Draw overlays during window reconstruction to protect screen
- Do not activate DPMS when screensaver is inactive (bug #16327)
- Better handling of multi-monitor and lid-close events (bug #16102)
- Update LINGUAS (bug #15949)
- Fix decimal properties when running through atof
- Return 1 on lock command failure (bug #15945)
- Rename 'Pictures folder' to 'Slideshow' (bug #15589)
- Raise NameError and TypeError (bug #15830)
- Fix float parsing error (bug #16295)
- Fix inhibitor proxying (bug #16356)
- Fix inhibitor listing in xfce4-screensaver-command (bug #16355)
- Add systemd sleep inhibitor (bug #15929)
- Fix dbus inhibition (bug #16365)
- dbus: Prevent overzealous activation (bug #16365)

Translation Updates:
Albanian, Belarusian, Czech, Finnish, Galician, Hebrew, Italian,
Japanese, Korean, Malay, Norwegian Bokmål, Polish, Portuguese (Brazil),
Serbian, Spanish, Swedish, Turkish

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 ...xfce4-screensaver_0.1.8.bb => xfce4-screensaver_0.1.10.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-apps/xfce4-screensaver/{xfce4-screensaver_0.1.8.bb => xfce4-screensaver_0.1.10.bb} (86%)

diff --git a/meta-xfce/recipes-apps/xfce4-screensaver/xfce4-screensaver_0.1.8.bb b/meta-xfce/recipes-apps/xfce4-screensaver/xfce4-screensaver_0.1.10.bb
similarity index 86%
rename from meta-xfce/recipes-apps/xfce4-screensaver/xfce4-screensaver_0.1.8.bb
rename to meta-xfce/recipes-apps/xfce4-screensaver/xfce4-screensaver_0.1.10.bb
index 9c9c327b7..62f0640f0 100644
--- a/meta-xfce/recipes-apps/xfce4-screensaver/xfce4-screensaver_0.1.8.bb
+++ b/meta-xfce/recipes-apps/xfce4-screensaver/xfce4-screensaver_0.1.10.bb
@@ -16,8 +16,8 @@ SRC_URI_append = " \
     file://fix-cross-compile.patch \
     file://fix-pam-config.patch \
 "
-SRC_URI[md5sum] = "0fea7b676e6e533a3f305c6f642fe0cd"
-SRC_URI[sha256sum] = "4056045ea5fd3eccfe328b86ae245ee4949b9e3044e42ca29c492c0f4ac860d7"
+SRC_URI[md5sum] = "1f093cde5af09e9fd9be017774e032ef"
+SRC_URI[sha256sum] = "586f1c78dd6745a20e9ce9f12d0117189d597ba7ad0c8ffcfcd25c9bb05f1d57"
 
 do_install_append() {
     install -D -m 0644 ${S}/data/xfce4-screensaver.common-auth ${D}${sysconfdir}/pam.d/xfce4-screensaver
-- 
2.21.1

