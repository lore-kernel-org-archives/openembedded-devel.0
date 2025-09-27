Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 163ABCAC5B8
	for <webhook@archiver.kernel.org>; Sat, 27 Sep 2025 20:30:31 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web10.20279.1759005023078514943
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 27 Sep 2025 13:30:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cbyyGkLE;
 spf=pass (domain: gmail.com, ip: 209.85.218.52, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-afcb78ead12so565303766b.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 27 Sep 2025 13:30:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759005021; x=1759609821; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=CZ56+XZ6RYMZt5WrGrlCEGArCN9kGiSEdPi31fHbDxs=;
        b=cbyyGkLEZQfKrNxAJMIqrtT3LkbTdUZ1buZ1G94C443lU0Bw/eSBMemqD3KS1B3Qwm
         Uxf6bymeaUNfFKOSvNqKyCLmWJ6CWueiTO7FRccefAi3+PXODgZr9hkFQhvlnJEWwJqD
         KwDyFhTFj9mNaMoRGhgacP6GYBRNsPqUqVnPfee243D52TMVDSOR0qRbvw875iwFiQ5J
         0JI81pSpXVjSx8AkKgNa79rwjgTVoFS7I8qe/jDBmWplsh0uiRrDkT9J3T1aZYTzcr8b
         zu2A9rreWbckQNo+mthw59WoYwenBRk6ziPVAtC5IvofOTgyPA8gFV/6Hh7z1C3rTESF
         gMIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759005021; x=1759609821;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CZ56+XZ6RYMZt5WrGrlCEGArCN9kGiSEdPi31fHbDxs=;
        b=uz+S5Mals2Km5BCA+apexSRDpLVFpV+Kg3X5Ef6XuwCo8f+zchQpytNf4wZ4dcCECV
         eKrCfvniKxXEahs1m9ps8Swl808l57Cqp/6BNybO0oVO/GhEvD22jpdW0rHVLFJMULiH
         ZF6uOwuSsOO4DicBfkaZYuknboE/cie/5m/ruocLL+ldKnp0NRvLk+53UgzDzdRhzAX2
         HHU7WCCUZIIiOWZnh6MoBWoFCj79HVq503baPtkXGYFHbgHfnuJzNC2PUgEHszEpJvSW
         oPhnnkW1KSC8QhmYIoHNfJWU4a14tpOgQN5GIognF2kOk59DiTOKZzLQK/PQzLLrQhNM
         bUrw==
X-Gm-Message-State: AOJu0YzUOJZ9gSwuiopNZ0/VuU34K13GS40G1ASxPDGaF+GvllILslz/
	PZM8kyq+A03I3kfZGLAFk/1IEsKrSzIqsT1Bkjz9D4+HNyqAwaUUjeIPx+Z3cQ==
X-Gm-Gg: ASbGncsgg/Dz2L9koUtrqQybBgwyzZEatc8QkbIWIFwrUVSIzXkuhwxyuOLB2p6A3nl
	PupIouZKwfNHH/PtUi7yppmCtDv92k7riXhPM97xy6inDSNGlIKLlcDtzPWSG2tQMyCwi/Lr7h3
	2/GRa1vxSWrl4777IZXhg6WdC1H8ggAc2Uyx1xo9NOMWPDrhcyBupoeQkbBoJ1lU9IKKkep8h2k
	Ct7UVCREyo3dEfovVFRl8As6BrTJrfOLds9fsC5TGemCz2AB5J7ZHHH08Sj51Lc80w1cy96VB1N
	2q6Ytj+82Sn25mFk8Crm2GR94EKIQdvHSrZ7uBqpS2vBjmrDwcpC/9yx2d1qix4PdJ4hvIbggKg
	evUFSzhdt9xSzxisC0dEj
X-Google-Smtp-Source: AGHT+IH9EgqFgRJwjGKiy/V0RHXcF0dHIozNJdIfPicT/Jd/W4DOBCIPtFefe8SqiO4sBbFjmU5/Uw==
X-Received: by 2002:a17:906:c10c:b0:b11:3760:9596 with SMTP id a640c23a62f3a-b34bd538a2cmr1283680766b.60.1759005020195;
        Sat, 27 Sep 2025 13:30:20 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b3545a9978bsm619848766b.95.2025.09.27.13.30.19
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Sep 2025 13:30:19 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] smartmontools: upgrade 7.4 -> 7.5
Date: Sat, 27 Sep 2025 22:30:19 +0200
Message-ID: <20250927203019.3853633-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 27 Sep 2025 20:30:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119994

Changelog:

- CI and release builds are now reproducible if same SOURCE_DATE_EPOCH,
  build recipes and toolchains are used.
- smartctl '-j -A': New JSON value 'endurance_used' (ATA/SCSI/NVMe).
- smartctl '-j -A': New JSON value 'spare_available' (ATA/NVMe).
- smartctl '-j -i': Re-added the JSON value 'model_name' also for SCSI
  devices (regression).
- smartctl '-j -c': NVMe support.
- smartctl '-j -n ...': New JSON values 'power_mode.*' (ATA only).
- smartctl '-H -A': Support for NVMe SMART/Health Information per
  namespace.
- smartctl '-i': ATA ACS-6 updates.
- smartctl '-x': No longer includes '-g wcreorder'.
- smartctl '-x', '-l scterc': No longer returns exit status 4 if SCT ERC
  is not supported by the device.
- smartctl '-l error': No longer prints bogus ATA error log entries if
  the error index is nonzero but the error count is zero.
- smartctl '-l ssd': Fixed corruption of the output of the SCSI Format
  Status log page.
- smartctl '-l ssd': Now detects 'no format since manufacture' from the
  SCSI Format Status log page.
- smartctl '-l farm': Fixed the unit of 'Write Power On' time.
- smartctl '-l farm': Fixed the byte order of ATA 'Assembly Date'.
- smartctl '-l farm': Fixed a possible segfault.
- smartctl '-l farm -q noserial': Suppresses serial and WWN also from FARM.
- smartctl '-l farm -T permissive': Overrides false negative FARM support
  check for rebranded drives.
- smartctl '-t TEST': Fixed self-tests of single namespace NVMe devices.
- smartd '-A': NVMe attribute log support.
- smartd: Ignores NSID in duplicate check of single namespace devices.
- smartd: No longer issues LOG_CRIT warnings for 'Set Feature' related
  NVMe error information log entries.
- smartd: No longer hangs on systems with large file descriptor limits.
- smartd: No longer logs invalid "old test ... not run" messages if
  staggered self-tests are used.
- smartd.conf '-l selftest[sts] -s ...': NVMe self-test support.
- smartd.conf '-H MASK': Ability to ignore specific bits of NVMe
  SMART/Health value 'Critical Warning'.
- smartd.conf '-p': Checks NVMe SMART/Health value 'Available Spare'.
- smartd.conf '-u [-f]': Checks NVMe SMART/Health values 'Percentage Used'
  and 'Media and Data Integrity Errors'.
- smartd.conf '-W ...': No longer includes individual sensors in NVMe
  temperature check as some devices report other values there.
- ATA: Device type '-d jmb39x-q2,N' for another JMB39x protocol variant
  used by QNAP-TR002 NAS devices.
- SCSI: Fixed range checks of mode page offset and VPD inquiry.
- SCSI: Fixed buffer overflow parsing of VPD page.
- SCSI: Fixed handling of multiple designators in VPD page.
- USB/NVMe: '-d sntjmicron' no longer triggers USB resets on queries of
  the self-test log.
- USB/NVMe: '-d sntasmedia' now supports log pages > 512 bytes.
- USB/NVMe/SAT: New experimental NVMe/SAT autodetection options
  '-d snt*/sat'.
- Fixed segfault on missing option argument on systems using musl libc.
- HDD, SSD and USB additions to drive database.
- automake < 1.13 are no longer supported.
- Custom make rules are now silenced if 'make V=0' is used.
- Enhanced makefile targets 'dist-*' to create reproducible source
  tarballs if SOURCE_DATE_EPOCH is set.
- The makefile no longer uses GNU make specific syntax elements
  (exception: reproducible builds for macOS).
- Dropped support for platforms without 'sigaction()'.
- configure: Now also detects MidnightBSD.
- configure: Dropped option '--with-signal-func'.
- configure: Default for '--with-nvme-devicescan' is now 'yes' also on
  NetBSD.
- Version information is now also set if build from GH R/O mirror.
- Linux: 'smartd.service' now avoids a warning about an unset environment
  variable.
- Linux: Dropped autodetection of deprecated device type '-d marvell'.
- macOS: Support for reproducible builds of the DMG image.
- OpenBSD: NVMe support.
- Windows: Increased WMI timeout.
- Windows: Support for reproducible builds of the installer.
- Windows: Uninstaller is no longer damaged if the installer is signed.
- Windows 'update-smartd-drivedb.ps1': Fixed call of 'gpg.exe' if it
  appears more than once in the PATH.
- Windows 'update-smartd-drivedb.ps1 -Verbose': Now also prints the
  download command.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../{smartmontools_7.4.bb => smartmontools_7.5.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/smartmontools/{smartmontools_7.4.bb => smartmontools_7.5.bb} (95%)

diff --git a/meta-oe/recipes-extended/smartmontools/smartmontools_7.4.bb b/meta-oe/recipes-extended/smartmontools/smartmontools_7.5.bb
similarity index 95%
rename from meta-oe/recipes-extended/smartmontools/smartmontools_7.4.bb
rename to meta-oe/recipes-extended/smartmontools/smartmontools_7.5.bb
index bd92b16299..6f3bf49c07 100644
--- a/meta-oe/recipes-extended/smartmontools/smartmontools_7.4.bb
+++ b/meta-oe/recipes-extended/smartmontools/smartmontools_7.5.bb
@@ -23,7 +23,7 @@ PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'libcap-ng selinux', d)
 PACKAGECONFIG[libcap-ng] = "--with-libcap-ng=yes,--with-libcap-ng=no,libcap-ng"
 PACKAGECONFIG[selinux] = "--with-selinux=yes,--with-selinux=no,libselinux"
 
-SRC_URI[sha256sum] = "e9a61f641ff96ca95319edfb17948cd297d0cd3342736b2c49c99d4716fb993d"
+SRC_URI[sha256sum] = "690b83ca331378da9ea0d9d61008c4b22dde391387b9bbad7f29387f2595f76e"
 
 inherit autotools update-rc.d systemd
 

