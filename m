Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27E18CAC5B7
	for <webhook@archiver.kernel.org>; Thu, 25 Sep 2025 12:03:49 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.web11.9933.1758801823340387582
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Sep 2025 05:03:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hQJ9cKMD;
 spf=pass (domain: gmail.com, ip: 209.85.208.46, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6349e3578adso1548136a12.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 25 Sep 2025 05:03:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758801821; x=1759406621; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DrLGpm/UispL/wA6FOy+R5MIsRLhRXFVDLAxOyN1P/w=;
        b=hQJ9cKMDFl07ymCglj0awaETJMJVL0j5qmZx/+VtPhTKLRL2L+iPhXJOYlc/KX7kcJ
         d2F9nrT6TyLq7qyXnjnvz4PzXmZ1vFXhCPeV3E7VlUnifwEudiecCZFBE1b9AKAWqOYd
         XUDWzMugHSFNuVbsEVvQ6mJpYznwDb1kz/odK45GveEgjzv9XCUaFC5olIW/I5+vxAHh
         t46/SiHiYzlSbRK3qbUqhUmGR01gPBairm5MWKXRSLTtPVxkbW6Zb4YfPOy47smSk857
         dX3Cvkhbxf0AFvoJef7Zz5g0FR1xlJyZ/pESK3OYc6Jv7MDM8TKIL0BLg6h5Dctvjr3P
         g+Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758801821; x=1759406621;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DrLGpm/UispL/wA6FOy+R5MIsRLhRXFVDLAxOyN1P/w=;
        b=GRbK1pkTX2SG2RpYFYpUELr6EK+/fkzSBkDTzBuXfR42sDK5E6DmGKU/Te9TNeNsE6
         MEiJEiCKbSJZZ1FdUW9PkQuEg2hu+1oZihLE/h2AMpSjU3mP1Waxc9or43ZCTvlmveMr
         qQMnwsVHZjwg5bb93o/DUDr1cXNdZ0i83epuJmJCs/kph94SHfWnn9cx+vzUI6RSwGp6
         UndQS5k3yWhUfmPULhUXiFRfCj0h2N47bLCtAvQdkLXTzccJaG4RZjoqIOJRxTzZP4GG
         VnTOC03wnwp3PywbfXB8a5kgIlj2zrHnCTjBjVxKqaC70GV44E9mCMgvNXbZ85aUO2Xb
         BD4Q==
X-Gm-Message-State: AOJu0YzCTFBsTSQFTFZ989VqeLR8JySjRtRITlhJ44DK8HNagEPWV72E
	BadLo4uOur+fiIeedCc+LTCDoHca8J1cq/HbxDgdRAvtUzfVbsNC9dE45XrzIVhp
X-Gm-Gg: ASbGncvrTU9zSadilqL7FI7ev8elxYSaS1fXvQ79EWtd0atksB66Z6FcGSJvUjjqaKH
	sqnn1aRBxdBbaM6ybEzWjNxdyXYsiPqN84IUxHL9OBdVOmSzX9gdPZ3bf6+ar40/wg1rMkoHLge
	PG6BUvxJdxu4dE0xz4LQRciR+R3zAjp8mGhhMgU+bsbDY+Z1KpTfuVSMtsrXnaueQfNBbXgF8j9
	0Pb1dqDwaCsarQotwl8LHOhzbjF2s3C2hgiEfmfgKWrH7F4d8/reHHgeWeDHCAmF6Dg0dB7IF4U
	d2ZmUuPcySvW3RN/Xu1MdiezVbjPe6w0Q5DIC9pPGGU5B3zLCUBcHsOqQLgkO9DxXyhmAebu5IN
	01fYoEHxpuz/lhoEDGfNK
X-Google-Smtp-Source: AGHT+IEhVLs+sWaRklCNIyuZUiTcIy0u4DLwM7Qi92vE/ATaufBAkPkoJrQrKrLxJVPJbxVq1qeSDw==
X-Received: by 2002:a17:907:9689:b0:b30:ed1f:894c with SMTP id a640c23a62f3a-b34be6d7425mr382807966b.43.1758801821250;
        Thu, 25 Sep 2025 05:03:41 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b3545a98e54sm153761266b.97.2025.09.25.05.03.39
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 05:03:39 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][kirkstone][PATCH 02/21] ibus: add opengl related check
Date: Thu, 25 Sep 2025 14:03:14 +0200
Message-ID: <20250925120334.1670367-3-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250925120334.1670367-1-skandigraun@gmail.com>
References: <20250925120334.1670367-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 25 Sep 2025 12:03:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119862

From: Mingli Yu <mingli.yu@windriver.com>

Add opengl to REQUIRED_DISTRO_FEATURES when gtk4 is configured in
PACKAGECONFIG.

Fixes:
  ERROR: Nothing PROVIDES 'gtk4' (but /build/layers/meta-openembedded/meta-gnome/recipes-support/ibus/ibus.bb DEPENDS on or otherwise requires it)
  gtk4 was skipped: missing required distro feature 'opengl' (not in DISTRO_FEATURES)
  ERROR: Required build target 'meta-world-pkgdata' has no buildable providers.
  Missing or unbuildable dependency chain was: ['meta-world-pkgdata', 'ibus', 'gtk4']

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 35dd6f4833fc6895cb281f5e6dfcc5469d8a6b04)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-gnome/recipes-support/ibus/ibus.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-support/ibus/ibus.bb b/meta-gnome/recipes-support/ibus/ibus.bb
index be43d0d500..7156081499 100644
--- a/meta-gnome/recipes-support/ibus/ibus.bb
+++ b/meta-gnome/recipes-support/ibus/ibus.bb
@@ -8,7 +8,7 @@ DEPENDS += " \
     iso-codes \
 "
 
-inherit gtk-icon-cache bash-completion
+inherit gtk-icon-cache bash-completion features_check
 
 # for unicode-ucd
 EXTRA_OECONF += "--with-ucd-dir=${STAGING_DATADIR}/unicode/ucd"
@@ -19,6 +19,8 @@ PACKAGECONFIG ??= " \
     ${@bb.utils.filter('DISTRO_FEATURES', 'systemd wayland x11', d)} \
 "
 
+REQUIRED_DISTRO_FEATURES = "${@bb.utils.contains('PACKAGECONFIG', 'gtk4', 'opengl', '', d)}"
+
 do_configure:prepend() {
     # run native unicode-parser
     sed -i 's:$(builddir)/unicode-parser:unicode-parser:g' ${S}/src/Makefile.am

