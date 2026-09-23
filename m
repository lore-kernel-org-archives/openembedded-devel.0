Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5499C98302
	for <webhook@archiver.kernel.org>; Wed, 23 Sep 2026 04:29:17 +0000 (UTC)
Received: from mail-dl2-f22.google.com (mail-dl2-f22.google.com [74.125.229.150])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.139.1790137755211163460
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Sep 2026 21:29:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=EjmSiXNJ;
 spf=pass (domain: gmail.com, ip: 74.125.229.150, mailfrom: raj.khem@gmail.com)
Received: by mail-dl2-f22.google.com with SMTP id a92af1059eb24-14383fddae4so261346c88.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 22 Sep 2026 21:29:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790137754; x=1790742554; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ihlYyZhQm3Vvpe9pjbqlrczFDhLuPLD7BJuS6MNqTns=;
        b=EjmSiXNJDDMd7nh9nfX8BpZ1dDXf7rz92R6GAWWDn5/ODHGV5vHLCr1TQQlFVTbr9e
         wu4K6JZ74nfjUSMNKQZOb/hPwH8bKotg1JGunuc+pJhucAE9XH9oNDc10MUJWB9jYOHA
         g04XVY4kWjg5kagOW04XvcW7g98ktzLueZrlSdpwUFhBHf/NsVAkro5QWVrW41BfQHRU
         qteqR57qk7hb0jnmRnMcAlIrn8XntcMJTXGTZxB0N510JrzJzq3ymHQu3zXitl3A7/SP
         ojkpEP5WjpxhQEQ0qnofAvAcetmKtZPPMwa8ij1U8PDxrdWG12k8cqvSQttEQh57/+R5
         AKbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790137754; x=1790742554;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ihlYyZhQm3Vvpe9pjbqlrczFDhLuPLD7BJuS6MNqTns=;
        b=JatJSe2POIJ27R2Z/iPdA4L4eIBRju8+0vdpME/tA1JKivW8smAvihTQAIGDuCwxJt
         jd/MueTFo3Hfg3fBKuPPRDjZeLRMMXq++Q/g3b0mFqlCK8Pnb+nBYDkJeLHYhuXTg3F7
         kHPF/Tt838AyMELLxqLRdQ6HBCgW5yDEnJB+5yVWAwrI7Wq6htkHDdHe/Z6ra+FyMLsO
         2g6NLYFBdXTUOUtmBUt9fJONjC4Bi7jwgpaIXOIo5lTVER6W7HpcKDIfppJqCLteuazg
         A8LaaCz8IBJTJFkROZ84I9WQ6KWNt6w92VTwreqBuGVvcdukLqVvOKmZoFkrCdWUn9R1
         dfQw==
X-Gm-Message-State: AFuF++nSrkPVe4xB321fll6Hq5cn4FElKQvfqHA3pbwxvdgY5TyJUMYP
	hHyvDimwiyKYfj4oCJmAfCROZ5l/gDB5V6pnA+814zh39Q8Kv94D67sIUcsLIw==
X-Gm-Gg: AYBFou23trlxCU48WnpLRpQA2Obn2Bjl07gOF9Fi2VcZZoMR+6TQkoObTinjPlk9VUF
	wQI5LUB7AZ9F9WgNe12Lh9tmdvWcPWYrZy9fFLtvjxJVCplIh+cZQpK4X5ltmpxSsfUfz4gCUb4
	FrWDruJsqn2GaUdZ6GmWrnOrDHcmUjJ0VRCHrQozm7aJTbwdB96m5gQHNgaCDHXvdaFR0vQT43d
	BMUE2Q4PXG6Pr3WsPXk/s78IQJX0nIozvH1SmNuoEVQugndYae4Y+Oh/AJMd6DD1ZnskcPiZ1/N
	n55ylHciT1cqbrs+GB5oaFepN5SuV4CBGBTxXinfzJtTBrtQvOFitQqMQSEGUfQc2fRFlS7CwKa
	Fmkh3Fn8k3y8k74H/Eoa6sWjWNqvdOlaUrjoTgM9cOCGNnbB4rfsUnaveVzkjyWFywite/Dmi63
	L6cwG9JPRP7OXOadAX95lIeYkvm3vKJqZSMQinXiRgVc6fjYbo4YjXjhDDK8uiHCHzKjnz0yfFr
	0GBa8ReeCdkN1lP2akQP6CbdFHi5G8XCNGx9B1ymS3Z9IN3wkrw+A3VtkytInZsSHcBcbt7zSew
	RdVonbuxBwYLgnxSWvKy8JUmFt+MnUWx1JiEcfVvhm0VKaG6U4HgDpmTPivgIC2jgAN4m8E2zS2
	rMjVYAyx8/xWsTQorGuMG9gHyxfdCv66JFabjlXYJnowqqzWySgb2dg1YbD3Iuf26TNtB2DFrdp
	zoGg7Zl9dnbEhUA5ZrEm3OPULF7aK3HbicHkKV6w==
X-Received: by 2002:a05:701b:42cb:20b0:143:298f:33ba with SMTP id a92af1059eb24-144f931c06emr1658697c88.46.1790137754539;
        Tue, 22 Sep 2026 21:29:14 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144f98bf501sm2773178c88.14.2026.09.22.21.29.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 21:29:14 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-multimedia][PATCH 2/2] wireplumber: only build the dbus tests when dbus-daemon is available
Date: Tue, 22 Sep 2026 21:29:10 -0700
Message-ID: <20260923042910.1549997-2-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260923042910.1549997-1-khem.raj@oss.qualcomm.com>
References: <20260923042910.1549997-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 23 Sep 2026 04:29:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130181

test-dbus-connection and test-reserve-device spawn a private bus through
GLib's GTestDBus, which executes dbus-daemon. When VIRTUAL-RUNTIME_dbus
is dbus-broker, dbus-daemon is not installable (dbus-broker RCONFLICTS
dbus) and both tests abort with:

  GLib-GIO-FATAL-ERROR: Error spawning dbus-daemon: Failed to spawn
  child process "dbus-daemon" (No such file or directory)

Enable the dbus-tests meson option only when dbus provides the message
bus, and make the ptest package depend on dbus in that case instead of
relying on it being pulled in indirectly.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../recipes-multimedia/wireplumber/wireplumber_0.5.17.bb | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/meta-multimedia/recipes-multimedia/wireplumber/wireplumber_0.5.17.bb b/meta-multimedia/recipes-multimedia/wireplumber/wireplumber_0.5.17.bb
index 3dd58a70c4..bfe8137b0a 100644
--- a/meta-multimedia/recipes-multimedia/wireplumber/wireplumber_0.5.17.bb
+++ b/meta-multimedia/recipes-multimedia/wireplumber/wireplumber_0.5.17.bb
@@ -48,6 +48,11 @@ PACKAGECONFIG[systemd-user-service] = "-Dsystemd-user-service=true,-Dsystemd-use
 PACKAGECONFIG[dbus] = ""
 PACKAGECONFIG[test] = "-Dtests=true,-Dtests=false"

+# The dbus tests spawn a private bus through GTestDBus, which needs the
+# dbus-daemon binary. It is missing when dbus-broker provides the bus.
+WP_DBUS_TESTS = "${@'true' if d.getVar('VIRTUAL-RUNTIME_dbus') == 'dbus' else 'false'}"
+EXTRA_OEMESON += "-Ddbus-tests=${WP_DBUS_TESTS}"
+
 PACKAGESPLITFUNCS:prepend = " split_dynamic_packages "
 PACKAGESPLITFUNCS:append = " set_dynamic_metapkg_rdepends "

@@ -170,4 +175,6 @@ FILES:${PN}-modules = ""
 RRECOMMENDS:${PN}-modules += "${PN}-modules-meta"

 FILES:${PN}-ptest += "${datadir}/wireplumber/scripts/lib/test-utils.lua ${datadir}/wireplumber/scripts/testlib.lua"
-RDEPENDS:${PN}-ptest += "pipewire-modules-protocol-native ${PN}-scripts"
+RDEPENDS:${PN}-ptest += "pipewire-modules-protocol-native ${PN}-scripts \
+    ${@'dbus' if d.getVar('WP_DBUS_TESTS') == 'true' else ''} \
+"

