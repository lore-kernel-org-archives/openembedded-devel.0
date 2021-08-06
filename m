Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
 by mx.groups.io with SMTP id smtpd.web09.54.1628286652185818426
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 06 Aug 2021 14:50:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@google.com header.s=20161025 header.b=G5hqnA5n;
 spf=pass (domain: flex--maxims.bounces.google.com, ip: 209.85.214.202, mailfrom: 3u64nyqykaf4i6teiockkcha.8ki@flex--maxims.bounces.google.com)
Received: by mail-pl1-f202.google.com with SMTP id s6-20020a170902b186b029012cbebe7236so3143472plr.11
        for <openembedded-devel@lists.openembedded.org>; Fri, 06 Aug 2021 14:50:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=/wCNb3TUoKk6adf7wqqEj700nR/0WDCWyxeo2Euj7qU=;
        b=G5hqnA5nQlOYdW07ZZSX9ujfyohClyeDX5H9zgBk364iFshzozcvRZxkYitZG3jpBR
         3ThCkvbXfEooDkalB6dHbLrgMzVzTPx7ivaETZ9tooREXPOl9Wq2BdF4I7DG/bfGlMMU
         Tlqzid6Ya+TtuHPsjF0l+kBuNeXLz5ddD1VjtP1YbsoiFg1ZUlb7F5slE959TutRtqRG
         A4XBzA51rgOpX6jnp/t5Y1VAAvjSaEp2pHWXck5FSvc2QvZAkqQT4ndVcbWfRYKrH9mn
         +Yfm8pzsv+4T+w5Jo8ELJOH6gVKDVKhSqIPHCg+PvrhOVE9jyg70VS/Uihf5bzikTLCW
         EV/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=/wCNb3TUoKk6adf7wqqEj700nR/0WDCWyxeo2Euj7qU=;
        b=gAO0eztXcv8NdcmpzOZllZqzZ632OpxXe11Sx+bgdI//b9rMEN7zMQg3R/D/4UsJWb
         sS3Z4uYRkRLumOSc7kiaVP0Od8/be1AqR38+PeWFG3KgvJvLOantT+whHygWI4d1M5Lm
         e9E7/bKSAsbrICqVcX0+SaLTSBultcMqIWW1eynT+rWCsSejF4xL8bLLj3Lw6uyPa3xJ
         jddQ6q/AKwqsjFX1gVjx9yg6V3bVk3kQum+ZbFxWm3oykFofm+QVQoRKLrlG3I3pa47v
         0DZvh7BOUQOo70iTQA2h//cSkmscgdrvie2gphIdIiMK5KKxtWu08ud9OOhEvVFMLGCc
         wN9g==
X-Gm-Message-State: AOAM531DX7DA4bcIVIGXSTK/wiYvydKjUlovw6hgJipr8ma1SHLJb6Tc
	rgyLNrE+XDQ8qP79W1MnBleXLnb0lNqt8e6X9xXNQZiAsGTYJJHc4QwtK6B/yEEkOFDJ4k2UhlA
	t9m1qMFwPC8wKEOTgt4inFZL79AlYjNX8sn1Hsz6hJfYKN6sPzrrfzbccvoAe+Cn3bjKxf8fB1d
	MevzpiPgVGB+w=
X-Google-Smtp-Source: ABdhPJy27jwjAbCbA3w+2XMq3N7Oy9B8VwW6lQ5yI5mxMrCwLID0pG9MRepfA6zGevBLWUevg7JZKUAAf5Q=
X-Received: from mxsl.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:221c])
 (user=maxims job=sendgmr) by 2002:aa7:9156:0:b029:393:57f3:e5a9 with SMTP id
 22-20020aa791560000b029039357f3e5a9mr6921677pfi.79.1628286651171; Fri, 06 Aug
 2021 14:50:51 -0700 (PDT)
Date: Fri,  6 Aug 2021 21:50:45 +0000
Message-Id: <20210806215045.3036785-1-maxims@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.32.0.605.g8dce9f2422-goog
Subject: [meta-oe][PATCH] meta-oe: libusbgx: Configure the Devices Used
From: "Maxim Sloyko" <maxims@google.com>
To: openembedded-devel@lists.openembedded.org
Cc: Maksym Sloyko <maxims@google.com>
Content-Type: text/plain; charset="UTF-8"

Add ability to configure the UDC used for specific schema.
The feature is backwards compatible, so existing users don't need to
change anything.

If one wants to specify which UDC is used for specific schema,
for example, `eth0`, they can add this variable to the configuration
file:

UDC_FOR_SCHEMA_eth0=f8000000.udc

If the device file exists in /sys/class/udc when the gadget is started,
it will be used for this schema.

If this configuration is not present, first available device is picked.

Signed-off-by: Maksym Sloyko <maxims@google.com>
---
 meta-oe/recipes-support/libusbgx/libusbgx/gadget-start | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)
 mode change 100644 => 100755 meta-oe/recipes-support/libusbgx/libusbgx/gadget-start

diff --git a/meta-oe/recipes-support/libusbgx/libusbgx/gadget-start b/meta-oe/recipes-support/libusbgx/libusbgx/gadget-start
old mode 100644
new mode 100755
index 1a106b785..9e22671a9
--- a/meta-oe/recipes-support/libusbgx/libusbgx/gadget-start
+++ b/meta-oe/recipes-support/libusbgx/libusbgx/gadget-start
@@ -7,5 +7,10 @@ for i in $IMPORT_SCHEMAS; do
 done
 
 for i in $ENABLED_SCHEMAS; do
-    ls /sys/class/udc/ > /sys/kernel/config/usb_gadget/"$i"/UDC
+    configured_udc=$(eval 'echo ${UDC_FOR_SCHEMA_'"$i"'}')
+    if [ -n "${configured_udc}" ] && [ -e "/sys/class/udc/${configured_udc}" ]; then
+        echo ${configured_udc} > /sys/kernel/config/usb_gadget/"$i"/UDC
+    else
+        ls /sys/class/udc/ > /sys/kernel/config/usb_gadget/"$i"/UDC
+    fi
 done
-- 
2.32.0.605.g8dce9f2422-goog

