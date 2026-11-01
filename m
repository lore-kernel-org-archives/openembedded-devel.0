Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20269.1793559419620027113
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 01 Nov 2026 10:56:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=KXOAQfNH;
 spf=pass (domain: gmail.com, ip: 74.125.82.53, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-1ae18eb9b69so1352016c88.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 01 Nov 2026 10:56:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793559419; x=1794164219; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tC7bvIgBuZPmQzOLKQe47HQK1TR3HdrNxDl1JVcBrhE=;
        b=KXOAQfNHJJslGnSwesBz04AXpZzXmUdjufD7J6en7d/aXsW+Kfto2Bskrlje+8vuuJ
         ASxGIgkqr8aknM86n2dOwRSp33uspKRSO8EXGtSI1FPtoN1Hl+WYi3S3R34zBovxz7tu
         0NpQ/u3GbrbghkGOZTR2OXWsSyrFUvH0s+NcP8Tu6uR+/mp+PfCh7U5OWyrDZbi1b2qB
         CQLaZuUXfaOgx+CaXrf+Q4kWyxXjt6In479K9cnhq9cDbC+0AmbX38wBZDz0qRJaCK5f
         CiQ7DRZxS5dcRyNHCsn/vFQM7+A429ehNqdIFEELmpCnSbsTeN9fBU4OFCdSeD7OVDuK
         txtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793559419; x=1794164219;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tC7bvIgBuZPmQzOLKQe47HQK1TR3HdrNxDl1JVcBrhE=;
        b=mFsvduPlZ4xgatZI3ZohwnmdICXxQf4xqyI0qLYIqnyZE3AGsNvuZN/lVs52oQ+12k
         ZVtqEx8eAw28/oHUfBmWuJF1UERHgAbatq4oWFrXqdYdkI6FB/1h94uoADANLUkyzXP1
         vBd4KEaKAUXgty3k+B+x7JEU/j2OJyWankXfMHaHS5McVXoyTrZ92KaKH+9AIDl63avR
         HRZsTMumQfBX92DqdHGu2e+jjGSu3TUWxBwR44fRYyrje8QO7EIYs5wQGltQbIq32Gpl
         vcKKOEdXBt3FRAFdyvBiJBQzVoPWK5EdiT5a6NVTQV9gGa8w5iLHlpQaI8J5kEJ/oGi5
         fzzQ==
X-Gm-Message-State: AFq9FYJoXq30bxfha5MoTfpsXyRkURKbzqJPIsi48gjHXZlQH0Te3mNH
	aAYT2xBBOUfjZgl/6Fb5ygv6E2PMvmvZcvKK3hNxWQDFhcF4jhW8aD1w6cX+6gj4bYw=
X-Gm-Gg: AYBFou2m1MiUkwk1TxyfNjBqdfOCG/YyqoXkb0wPKppVEmxHtsh2mcZAQXZOoLc8quS
	OILLlAqGpME77vu4oXmkSf6RH0xxyqUz67uYzlmUiKC1IR2XaQS5JvKm/gpv5g7znmW6BrpGbQ3
	th8ma4ydKYl5Zt9G8780gCej+/UkGcVKd/aGBFGdjaIymhMMjdKYB5jOLEGR/A1rC7Hr4+ocSDb
	hcP72IyYZtWnI0Y1/pNMiG9eSVF7pF2Cxa6yyVzMdARUO4k+Hk8sxz3tUmM8l4azqD3qj8f/b5+
	N+bmw05hHcdL+hMyyLFDZgUuicU0UaazWIlLaMlsdWyc00v3f6N9hswPGW813uv1LPRchJvRh7Z
	Yh53ykcaXnTEmT6K8rO4QOuQsnkz/JA/QfHSmxBXDY+I1vTunfmQySQUsD9kFBsmXuePlUqM5bT
	kTM9yoxu1sOKfPWm9L6FERFParZ2F+q4Y7C6AaqerLvdZnb2S91XAQ7wiyv/xrhet2Qik5ziqdI
	ZRUtzSy++PCV42ACYKs7xC07GJnz4he4dGwy7h1/jh04NH/rBEi/LFK4Hr9ii/5JCmRlT0GvMW4
	dYi4qXdYvMJ47tUqqP9W6f9zoKkZ/dN2BEWOubriGJCqUEtMZMgGSHuvHyfGfLTnJnL/G1HSLxe
	AkCSce5g2vSevb79y83aZ2z202pDgquFsF2mmvZWRL6uRM21OVghu5k9SktG1PfJxa6n1X8PW2n
	RGRllU7K664kOkYkHwIT5rpp0fP4SI3/tcPz3sreE/3i/RKCgLw20utsHEGGN7XDbsar+86d56F
	7wLgtpXyh/HUyG14RmXxbxXQ3EL8EI6xbBwSSZbs+0QzZ6RXaSw3jh+7ICR6Pq2gXSCqd9Rcymg
	tRFV
X-Received: by 2002:a05:7022:7f17:b0:168:3243:c937 with SMTP id a92af1059eb24-1ac5cb1c8b3mr14002341c88.16.1793559418746;
        Sun, 01 Nov 2026 10:56:58 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac192c27cdsm46337863c88.10.2026.11.01.10.56.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 10:56:58 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 1/2] power-profiles-daemon: Fix configure without systemd
Date: Sun,  1 Nov 2026 10:56:54 -0800
Message-ID: <20261101185655.1459673-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Sun, 01 Nov 2026 18:57:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131730
Content-Type: text/plain; charset="utf-8"

The systemdsystemunitdir option defaults to auto, which makes meson look
up systemd.pc. That only worked because systemd ends up in the sysroot
through other dependencies, and it fails on sysvinit distros:

  meson.build:36:18: ERROR: Dependency "systemd" not found

Pass the unit directory explicitly. The unit is installed unconditionally
and systemd.bbclass removes it again on distros without systemd.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-oe/recipes-support/upower/power-profiles-daemon_0.30.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/upower/power-profiles-daemon_0.30.bb b/meta-oe/recipes-support/upower/power-profiles-daemon_0.30.bb
index f9f7e86990..5750ee33ee 100644
--- a/meta-oe/recipes-support/upower/power-profiles-daemon_0.30.bb
+++ b/meta-oe/recipes-support/upower/power-profiles-daemon_0.30.bb
@@ -14,7 +14,7 @@ inherit meson pkgconfig systemd features_check

 REQUIRED_DISTRO_FEATURES = "polkit"

-EXTRA_OEMESON = "-Dtests=false"
+EXTRA_OEMESON = "-Dtests=false -Dsystemdsystemunitdir=${systemd_system_unitdir}"

 SRCREV = "5b4994c8a91290481bef87a5bae95391d0ec677f"
 SRC_URI = "git://gitlab.freedesktop.org/upower/power-profiles-daemon;branch=main;protocol=https"
