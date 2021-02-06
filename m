Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com [209.85.208.193])
 by mx.groups.io with SMTP id smtpd.web09.11536.1612642582171342201
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 06 Feb 2021 12:16:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20150623.gappssmtp.com header.s=20150623 header.b=lFBmb+vc;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com, ip: 209.85.208.193, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lj1-f193.google.com with SMTP id e18so11600665lja.12
        for <openembedded-devel@lists.openembedded.org>; Sat, 06 Feb 2021 12:16:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XCahqmnEisGRHQ596oO43s6l5RpaFWWW1iuvOV2kecY=;
        b=lFBmb+vc5YbcPyh9un08wYfpAGFbw/B+OmAhHs5PfJIxgV9IJNAQ/V1nvjVfb2Vu8r
         rTGY3I5w6nUIQ1jjDJLn4CD+YdWhrgnq3+5MbPcFDkzXpMX3MKAaHzCdi/X+XgcmVJ4R
         zsN3lioa4Gows1cT+NEXj1gt1bpqeCBl7skp35tbozkp6h6/r2SeIabPVGwiH8ekxOfS
         rBvjzTovRRy2tjcK4ctMWxyDUDGwmUMNrp/wL50KBOaZJUoyvDFjwbuoYMdqvd0jPZ6K
         NU+dFHD5LUGSrNQxjPT8OSERZUuvnJPlnRf5JE2XTE+vgnwfmq9yArKTBjF/8YGFFSY5
         FB3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XCahqmnEisGRHQ596oO43s6l5RpaFWWW1iuvOV2kecY=;
        b=kAA/7sPF5HheNpcxBtYeYZLv7xBYS4qnJGZ+5KNadhDKGZuucbbbSBBWRGdUgb3Wse
         uvTjMfaAEC1qUkQLqeVqCg5uanU5nGeFYqXGmbrwhzqp0N5Fp6kxpN7Hbi7t7ePif1LS
         CRwEEvNIYj2DETT8ICIhk9fO9EE6ZlRY0mvz8iuQvpHc7ghf88DS/prTITyPftdasdNj
         iNMAO0dETDzuE9vm3cSYQARXVJqfCz5g76MrXOPGZw6ZXYiNrF8z8PZyPnb+SHDImRxF
         ZwmQsjTltBE0HbnxW1k7oZYpv3PevKNSmuLGPRDHRdXpEGBlPkkcWuHjFVlYQ/5ZVcrX
         pUuw==
X-Gm-Message-State: AOAM5301wRBsLLDmv9C89Iur9l4wD7fpoifHNY0hDeJUV5ClBz219CEO
	ttuKuWOwNVPGJFy2QB+ZtgP8/2XceCvX61e6
X-Google-Smtp-Source: ABdhPJwhqp6AtRobqJHImsRfV8ohMQWeW5td4fE+69LGHj78hrT5sxpZkUm+a95UmJbX71cPDgjEbw==
X-Received: by 2002:a2e:5c46:: with SMTP id q67mr6482322ljb.358.1612642579823;
        Sat, 06 Feb 2021 12:16:19 -0800 (PST)
Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from localhost.localdomain (c213-89-0-115.bredband.comhem.se. [213.89.0.115])
        by smtp.gmail.com with ESMTPSA id e28sm1430409lfn.112.2021.02.06.12.16.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Feb 2021 12:16:19 -0800 (PST)
From: "Oleksandr Kravchuk" <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-oe][PATCH] plymouth: update to 0.9.5
Date: Sat,  6 Feb 2021 21:16:17 +0100
Message-Id: <20210206201617.3684276-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Changelog:
- Add new firmware-upgrade mode
- Deprecate some cruft, expunge some old code
- Add keyboard layout indicator
- Add translations
- Improve boot.log output
- Darmatically rework DRM renderer
- Add support for EFI vendor provided logos
- Theme updates
- Misc fixes

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../plymouth/{plymouth_0.9.4.bb => plymouth_0.9.5.bb}        | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-core/plymouth/{plymouth_0.9.4.bb => plymouth_0.9.5.bb} (93%)

diff --git a/meta-oe/recipes-core/plymouth/plymouth_0.9.4.bb b/meta-oe/recipes-core/plymouth/plymouth_0.9.5.bb
similarity index 93%
rename from meta-oe/recipes-core/plymouth/plymouth_0.9.4.bb
rename to meta-oe/recipes-core/plymouth/plymouth_0.9.5.bb
index 78c1cb444..04106fcc9 100644
--- a/meta-oe/recipes-core/plymouth/plymouth_0.9.4.bb
+++ b/meta-oe/recipes-core/plymouth/plymouth_0.9.5.bb
@@ -21,8 +21,7 @@ SRC_URI = " \
     file://0001-Make-full-path-to-systemd-tty-ask-password-agent-con.patch \
         "
 
-SRC_URI[md5sum] = "4efa5551d230165981b105e7c6a50aa7"
-SRC_URI[sha256sum] = "4a197a4f1a05785d7453dd829b231352fb2d09171bd86c5ffaafbb2dd6791351"
+SRC_URI[md5sum] = "8a25d23f3ae732af300a56fa33cacff2"
 
 EXTRA_OECONF += " --enable-shared --disable-static --disable-gtk --disable-documentation \
     --with-logo=${LOGO} \
@@ -41,7 +40,7 @@ PACKAGECONFIG[initrd] = ",,,"
 
 LOGO ??= "${datadir}/plymouth/bizcom.png"
 
-inherit autotools pkgconfig systemd
+inherit autotools pkgconfig systemd gettext
 
 do_install_append() {
     # Remove /var/run from package as plymouth will populate it on startup
-- 
2.25.1

