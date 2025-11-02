Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2160CCFA02
	for <webhook@archiver.kernel.org>; Sun,  2 Nov 2025 16:55:13 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1478.1762102506899513180
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 02 Nov 2025 08:55:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UfKB8aw+;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-47728f914a4so18465505e9.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 02 Nov 2025 08:55:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762102505; x=1762707305; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=cJX71VGmVy79to2u4DDPb/mxtYCAfsPYBLV8cD9cQvU=;
        b=UfKB8aw+XtCMDC0mGBH13pWMFY+lZlOV91xUaF6YoQdmos4TzixgOXOGNNOgVfa/s2
         AZvUP4IrSBHDrnNB8YZQ4ayJw37sYBjsrGCD86ybBQMJ22SIzZdS8pcAg7K7ytIOzTgw
         +5X2nal4QrP9ueZhjRpAI573KG5oA/CmypOlvfwmOr5LKEJyGErruZRo/UhkYz1Lyo25
         eaJIvahVSn8v05dZAskLaaadLAh7iZEPei7kpLR7bEW8EPi0n3guLc1kpJajaZudGK9G
         WJl0s1icm0KKfvleglU3yWVL9w9bvGojMx+3BtMRKi2V11oYv737bTD2qWzagD9bg1wM
         gzqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762102505; x=1762707305;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cJX71VGmVy79to2u4DDPb/mxtYCAfsPYBLV8cD9cQvU=;
        b=aKmIVRwnqxYfv/L5vCdrs8iIR0XkDW8wD+zKxhm8W/mBpNvcObf0DLnj3IgNU/0gd3
         7QqK5tW/c4WeXkxFCizHXPhDOdWdfDOR04LuAJsEvofv0I2FeHrAu8xcw7wIZBOJvjX+
         NXK6O1jZhFD9VhFcC+k/g2iSD7//bOU1TE2l61GIA+P38p0leiq2xaN/XsIbNIVyN5YE
         KSqtL+fOOqAZrNGE8jGa/GTVzcas/73w4+hxHdzO+L1ZgakEFMtezjCUWElLqhPMkXX+
         yZ2uouxbblDNms2JxIKhqdUEbyaoXQXMp5v/7KU/cRy7rr2mEDzp2lUwGFVAq3CTe6Bx
         degw==
X-Gm-Message-State: AOJu0YyYrBbjW90hpij1sCH9KpJ71xlr763PWGFIyyeJjq6xKTD03ISQ
	Sdcz9vk2R6Kinny+HyYiGfR1unS6aLN10qxIKDthVEOcBd10rZdOBTz4NZT3KzJb
X-Gm-Gg: ASbGnctNYcK+JkTwI9PWgvq1mI+v2DjPOPi/qhw6xJ4e5kT7mIrBC9xTRgIUYsecgY6
	o8Qpc15QNJK+NuhxDsu6c7vANzWPhcG8Qk7q84l0OtOX6i8hh59VA7FHCcj5V3TF7TJUuY/wKxc
	dBJLxru3p1h999mj65AtSWmRqvetHfc/jgUTaD1vROBHZIc3icfGWVhJA4AGlu+folIko6kDWCo
	RJSCVfrZfnEu9ETYUURP5cr3iKt8+ol/iZDxYK2KFjT6+U4O67CNZo9GqRb2DK8rPSTEM3WHX79
	VDnPOkXLlGM67N1MLjNH94tzrWksZbC84yscGoG9gCcKbZPmajIIG+VG9xoUP5XmQbZ3Etuvw71
	R5p9+9PtPVHwfqIjoDIEOHsRUl0pO1ajqcwFTQk+k9cEIqACsW1D0KhfdxlGHdoN5LGn7VS7k4g
	==
X-Google-Smtp-Source: AGHT+IGrydI/xPGNsSFRbSLzMOCX5B+Zs+w9W8sadPnVr1CXR9f7gXpZwQi4tScRt62A3VapobNRZg==
X-Received: by 2002:a05:600c:b85:b0:471:9da:5252 with SMTP id 5b1f17b1804b1-477308900e0mr86812385e9.29.1762102505026;
        Sun, 02 Nov 2025 08:55:05 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4772fe402c5sm65918545e9.14.2025.11.02.08.55.04
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Nov 2025 08:55:04 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][kirkstone][PATCH] gimp: ignore CVE-2007-3741
Date: Sun,  2 Nov 2025 17:55:03 +0100
Message-ID: <20251102165503.651159-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 02 Nov 2025 16:55:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121258

It has been fixed in version 2.2.16: [1] references [2].

[1]: https://bugzilla.redhat.com/show_bug.cgi?id=248053
[2]: https://bugzilla.gnome.org/show_bug.cgi?id=453973

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-gnome/recipes-gimp/gimp/gimp_2.10.30.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-gnome/recipes-gimp/gimp/gimp_2.10.30.bb b/meta-gnome/recipes-gimp/gimp/gimp_2.10.30.bb
index a73de1e3ff..a24fa993cf 100644
--- a/meta-gnome/recipes-gimp/gimp/gimp_2.10.30.bb
+++ b/meta-gnome/recipes-gimp/gimp/gimp_2.10.30.bb
@@ -67,3 +67,6 @@ do_compile:prepend() {
 FILES:${PN}  += "${datadir}/metainfo"
 
 RDEPENDS:${PN} += "mypaint-brushes-1.0"
+
+# It has been fixed in version 2.2.16
+CVE_CHECK_IGNORE += "CVE-2007-3741"

