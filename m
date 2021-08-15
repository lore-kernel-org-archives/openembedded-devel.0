Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web12.11484.1629036408195351556
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 Aug 2021 07:06:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=uxv7UGCn;
 spf=pass (domain: gmail.com, ip: 209.85.216.46, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f46.google.com with SMTP id cp15-20020a17090afb8fb029017891959dcbso28325827pjb.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 15 Aug 2021 07:06:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=1u7JLgtwb66+5lj/kbuIMEzhuSpoxRZCFi0AB7Gc458=;
        b=uxv7UGCnh723upQMBXh+qCT5IqS3yO/j1Gu/qQXx653XqwvVPN/Cj6HlJL+cfM3BSV
         KOHfdb3WKTMYowWjrYOSp9kNDZh6X+ad+z1jjzgDUEQWxKNpZy3A3X4w2f7aDilKd+oW
         S4nI45Y6BemirlsLaYq+lF+xDTgdbHGUJdplMIVxeluFyKZgUzGdsZZPsNcu5Ltgd59Q
         ngwssmYUKY9J8vYEBiWFjeCrwvY8OCHBB0gEdWgG9kcvTrvXcSRX9ZXE8srd/THF3O/8
         LEXVSvJd4fQrzvVVVuJhM6+e/jyBdWQSoXtelIsKxr8fE3yhk4B4cxCDbCdJW+c6GpBu
         jSuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1u7JLgtwb66+5lj/kbuIMEzhuSpoxRZCFi0AB7Gc458=;
        b=qI3diqj0fzMgiUIQePN7bb/8dCbGuc3Of3g58E/YUtezJrXhVywVvSMXw5nVHRPcl+
         3lVXxtt1y9gFmfnKctdcCoDpSg7L4gbRXF21dFK6UKWt+QMrHrNMjijVjIypZ42x+l8g
         64aStyt1xo/uci2cRdRNJgd561LgRmJpTYb0i7rtN1yryQBVeCqQ7u+CqyszXjQtwbbE
         u2A3GIqepNEXrZU6zgx4rQEz936Ysv7HBHNolRW8xgsOUAyj/gpkA5TJdqW2lUtowNfW
         v5YnDxLjlG8NDbXuqnN9lWt5QdH+sDPsUAvi2nErv6LBsLp6fnx0wM1awKMPjaCIMQ6N
         O8UA==
X-Gm-Message-State: AOAM5332zH+BMeUSvSWgE6jHoz0ESH5aK2kqV9hDkgK6DLGacVHmo7HO
	bA5S+oQ+TQ2WfPCLpGEjcYvg+cjLKYBDCQ==
X-Google-Smtp-Source: ABdhPJw8PxY2IZlI9+zhOcCcsgscI/xnP62JmvMDvltTOeiSrTSAYj/6MAGSiOUKf7NYK5zDhfV/+Q==
X-Received: by 2002:a65:68d1:: with SMTP id k17mr11723460pgt.285.1629036407599;
        Sun, 15 Aug 2021 07:06:47 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from keaua.hsd1.ca.comcast.net ([2601:202:4180:a5c0:162c:344d:280d:4a4c])
        by smtp.gmail.com with ESMTPSA id y67sm8332901pfg.218.2021.08.15.07.06.46
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Aug 2021 07:06:47 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardknott 08/18] Suppress eol in functionfs setup scripts (#147)
Date: Sun, 15 Aug 2021 07:06:20 -0700
Message-Id: <b97e6c971639072f3866e26218505e390fd26cae.1629036279.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1629036279.git.akuster808@gmail.com>
References: <cover.1629036279.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Devendra Tewari <devendra.tewari@gmail.com>

Stray newline character causes errors in functionfs setup scripts
used by android-tools-adbd.service, when using musl libc and/or toybox.

Signed-off-by: Devendra Tewari <devendra.tewari@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit db5f48734404a52ee5323659082f1d6baa225ca7)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../android-tools-conf-configfs/android-gadget-cleanup        | 2 +-
 .../android-tools-conf-configfs/android-gadget-setup          | 4 ++--
 .../android-tools-conf-configfs/android-gadget-start          | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-devtools/android-tools/android-tools-conf-configfs/android-gadget-cleanup b/meta-oe/recipes-devtools/android-tools/android-tools-conf-configfs/android-gadget-cleanup
index 517227d4a6..f27d77df51 100644
--- a/meta-oe/recipes-devtools/android-tools/android-tools-conf-configfs/android-gadget-cleanup
+++ b/meta-oe/recipes-devtools/android-tools/android-tools-conf-configfs/android-gadget-cleanup
@@ -6,7 +6,7 @@ cd /sys/kernel/config/usb_gadget
 
 cd adb
 
-echo "" > UDC || true
+echo -n "" > UDC || true
 
 killall adbd || true
 
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools-conf-configfs/android-gadget-setup b/meta-oe/recipes-devtools/android-tools/android-tools-conf-configfs/android-gadget-setup
index e44d1bacbe..dbd7115151 100644
--- a/meta-oe/recipes-devtools/android-tools/android-tools-conf-configfs/android-gadget-setup
+++ b/meta-oe/recipes-devtools/android-tools/android-tools-conf-configfs/android-gadget-setup
@@ -23,8 +23,8 @@ mkdir configs/c.1
 mkdir functions/ffs.usb0
 mkdir strings/0x409
 mkdir configs/c.1/strings/0x409
-echo 0x18d1 > idVendor
-echo 0xd002 > idProduct
+echo -n 0x18d1 > idVendor
+echo -n 0xd002 > idProduct
 echo "$serial" > strings/0x409/serialnumber
 echo "$manufacturer" > strings/0x409/manufacturer
 echo "$model" > strings/0x409/product
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools-conf-configfs/android-gadget-start b/meta-oe/recipes-devtools/android-tools/android-tools-conf-configfs/android-gadget-start
index ca6c3df275..d67878fef9 100644
--- a/meta-oe/recipes-devtools/android-tools/android-tools-conf-configfs/android-gadget-start
+++ b/meta-oe/recipes-devtools/android-tools/android-tools-conf-configfs/android-gadget-start
@@ -4,4 +4,4 @@ set -e
 
 sleep 3
 
-ls /sys/class/udc/ > /sys/kernel/config/usb_gadget/adb/UDC
+ls /sys/class/udc/ | xargs echo -n > /sys/kernel/config/usb_gadget/adb/UDC
-- 
2.25.1

