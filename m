Return-Path: <liu.ming50@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 524B3CFC532
	for <webhook@archiver.kernel.org>; Sat, 22 Nov 2025 12:22:00 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8130.1763814119567810772
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 22 Nov 2025 04:21:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bY0R6l3f;
 spf=pass (domain: gmail.com, ip: 209.85.218.45, mailfrom: liu.ming50@gmail.com)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b737502f77bso412346666b.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 22 Nov 2025 04:21:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763814117; x=1764418917; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=i9P5s7+4l/yB6yDJnnTLJQQ0kUNWHFs65YhB3E1gMqs=;
        b=bY0R6l3fAsVrTpjmOXMSv4k583cAT+p3v6Cg8iLi4i6QeaVpNmCWprslpGIW5qph1c
         d/skwNsVQFaowca0Omu7PTY12mO41lUa/lFQURKi+mIunxcKCfPetnRP2CnEA1t59ebP
         5UJ7+wPfFbHTbD6Jint3yoBjyf7X4GzXhjJ/jyRso0jm9euEF6TsuIUoj48U1r1gt/W5
         2aO2IjaOHOK7TDV0DaU+naQcUyC0/Bg9AoGijzy097iVR/fSvX/3fvXo0cGnslwIQj6q
         RgR2wh2/nS0visdU4KXQ8IWG9BPpJoIjgj3X7sY5AkInZ4HQUuyB1MFCDftupzrsHl3F
         5nRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763814117; x=1764418917;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i9P5s7+4l/yB6yDJnnTLJQQ0kUNWHFs65YhB3E1gMqs=;
        b=WdTfXZHYt59H1Q6raepl+Y7ER6pAxhVf20u2axW4RRXhRgWtyo35l7+49NRIKCwTui
         kimRYpmoUpjc7e0VLW6hEn69D+Ll1ZGkrujH8inKqO5tJAchD4vFfGFhSWyln+IVfw4T
         z5Ukffz5nU7boJNNjIc9ebM/VxS/54dZoGEuQIcuKgja35XWtTTJupBkI+yUh4PcEyNC
         n3KYg8e9D+k70BOK1CLE7bC57HDwz3gq8hjCyl4wuOFn76YLZIyk9FcZEZQSgbahv5gl
         JrV7y5Cd8gIOQvxEh9FZ0BqvjPwzyavafL7NYoAD35DVZxwjitlhPKGosN/VYDxXqssh
         uKjw==
X-Gm-Message-State: AOJu0YxZ5Dh6xdHO7YKJOArPxG2ft0TurBaY0fVYQ44Gb/E63RaAdURu
	i0LcAmMroGM+Yi2UYVBVuUb2CFniIpULgCnyge2h76WHiVj0e3+oH6n3L2eVqQ==
X-Gm-Gg: ASbGncsdj0NYeoE+t7og/reG6lnzW2Ps03Z7aVozj/otaSU6zXwRbFZFKCmLCx4we3r
	Ugja5Jv18AlM7zMXUURyUh9MT/CenevF2ouvWY1YbBok15fIqYGkqdYYnbkkRHCYA/6SfaBkxw7
	5FHuwjctCE6S83YgmLOwnqU++4GqrNTUQ2VQutwc8mr6zVO/NfzdycxTrSKAnnDsvAl8r0QGNNa
	qY+wl7DfKaG42XOtMegD2MzuJvZs9BXBX2WrCdSmCJcVd4n75dLwLrxdg4AepEbPQq1OVPZIQux
	hifoVDbavOmTj5YyhUQK4RWv/LYgk8qcJCGMYm9tfr6hiZ5/Db1WAkE4V0X5Fo7+akGsJ60Orwc
	UViKjcVWxJ6dd0FHAUtirdcmrit7kWi8XhElh59VJ6qdx9UsFTtIAAbuCnMlfPq8HoTzW2qoYSa
	6Efka4/X11utucpFgkn3IiPymChkoIXFVb1awQEwaLQr1ZMNVSdeC6vNXh3utGmBP/2G+LpUuce
	92iGMLBwbw/P1KZgrDEffeTZjZFA43hVDQqJclUg1XDN+a0wf4=
X-Google-Smtp-Source: AGHT+IHONBDYz3l65P977g42lCOh0h0cmWmahICxHyXqtGNxlaSK3OJ590yof9SLI6IGmP+VjzMpFw==
X-Received: by 2002:a17:906:fe4a:b0:b76:277b:9a3d with SMTP id a640c23a62f3a-b767170a37emr610113266b.29.1763814117223;
        Sat, 22 Nov 2025 04:21:57 -0800 (PST)
Received: from peterliu-Precision-5680.atlascopco.group (static-212-247-106-195.cust.tele2.se. [212.247.106.195])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7655051625sm716798666b.65.2025.11.22.04.21.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Nov 2025 04:21:56 -0800 (PST)
From: Ming Liu <liu.ming50@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Ming Liu <liu.ming50@gmail.com>
Subject: [meta-oe][PATCH] ostree: use "+=" to set PACKAGE_BEFORE_PN
Date: Sat, 22 Nov 2025 13:21:53 +0100
Message-ID: <20251122122153.1960929-1-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 22 Nov 2025 12:22:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121969

This avoid overridding the original PACKAGE_BEFORE_PN value could be
set in bbclasses.

Signed-off-by: Ming Liu <liu.ming50@gmail.com>
---
 meta-oe/recipes-extended/ostree/ostree_2024.10.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/ostree/ostree_2024.10.bb b/meta-oe/recipes-extended/ostree/ostree_2024.10.bb
index 8d3b1cd32e..1e9d47643a 100644
--- a/meta-oe/recipes-extended/ostree/ostree_2024.10.bb
+++ b/meta-oe/recipes-extended/ostree/ostree_2024.10.bb
@@ -136,7 +136,7 @@ do_install:append:class-nativesdk() {
     create_wrapper ${D}${bindir}/ostree OSTREE_GRUB2_EXEC="\$OECORE_NATIVE_SYSROOT/usr/lib/ostree/ostree-grub-generator"
 }
 
-PACKAGE_BEFORE_PN = " \
+PACKAGE_BEFORE_PN += " \
     ${PN}-dracut \
     ${PN}-grub \
     ${PN}-mkinitcpio \
-- 
2.43.0


