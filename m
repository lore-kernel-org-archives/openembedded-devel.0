Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1073.1794332156488235802
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 Nov 2026 09:35:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=u5gMy3hp;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a4d7ae1ae9so21045005e9.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 10 Nov 2026 09:35:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794332155; x=1794936955; darn=lists.openembedded.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=rWDh3KiqCGkrsiHeHeayPDIWHUF0DjRtDaNVgKqlfig=;
        b=u5gMy3hpd/EB9lJbmTH57rw62fouutxrKuLptBbb1VOURym9Uko2hQDFZJtDITV5Fv
         B2UhdPom/Cw6RVohIJ4Wpv5Bu+Q/0ZjmqdMje4Y9yYNPx0Y40wOK5OUyRuZzeuM1UMAt
         WDpx5+0Gf9gtsGKVAm40L4Y6aQPYyRH2/pPUqLUqJ75ReyJCrT5CjZ5Wq18fDoLnsOjE
         9Bf1bJAI6mepPNVyBwa2XTwtMG/TTwwt1KbFKTbEzfN3peh3LuADgFKky71fhDbpyO7G
         PcEW7jfQ3rvgnfq4Q8nJTe74Puo0VK2DUjz1rTDaPgtrIFiNQuuiOlVFlL2Bs28OH4LX
         NE3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794332155; x=1794936955;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=rWDh3KiqCGkrsiHeHeayPDIWHUF0DjRtDaNVgKqlfig=;
        b=aZNtmTo/7ELQ4PyjXYPDCNEkzzDWSnRSwnpuFcYmAwKG1Du0QNcVfJuS3P0lSEXUzT
         xMGEpSIfMe/HgDtJb12KEFUy4i0kjbW+J8JONnQkDjFi2AUYWdh7il3cjgA/Ts7bnIxY
         VmpI+Ver1PVL+NJk+kJgDeo9K3r1JGYssNgMF/stD4EHV6dXzCGvZ7FKAhZU5rnt+Kqu
         U4PRAYzwjzVMGtHMQK0M5rY85XBGpBEsuvZV4pomeK1uCw3K28HvJtJyBuHfEyJPbLXV
         AolYtJM7UqVMQeGwJSW/LE07T3IIzHNdi6UGq8zuivlGf0IRLYgUvNlVp4vhOQweQ1ff
         hwkQ==
X-Gm-Message-State: APuU4Z91Dnh4LP6LNwoxDcNoJK7P5tcp/8dyjzrWaNP3W5yUVwP+TwWj
	n0qFR6zeIRcURIdKVr1hj7NvMBjOtN9QENcD/Ia33Mpile54f7tIfnZmdUeC1Q==
X-Gm-Gg: AYBFou3Mhy0hkgQowpDEFJHciOrK+Hw9FLCcCse7armlTEvGzZYowbDBaHM/vzA4hoy
	O2J7Ue8DqWceNiKfHe6pFDYBsVymFElZpZkCZksyRDc/UxRw5lFXqxPoVnZTm39DjHlnST+WUhb
	uDviUzb9XKM4ehARXBoGXpTQfs/+D+kJrJ18qCu0bPXRBHd4i/RVmSPgZH24odN+ZTfwbuN0FeX
	zfXYLYCWvyYQnD4NxpI/1ttAUHBdu92bvhe8qJXiAQssjNnjhAvEkkhX7MCDoopyfB3V+NpjQX4
	9S8LpBC2FCHyi09tKM5riEinCWhqe6TIx5sM4Y+fnFLYBd5swhtN3fyGKfaZz7LgOYfhdf7HBzx
	PSvy5sqBonSj8uNUt4wAdNDXeI9O6MhsR5BDF7Tawr2jyQ4lrfWvBbdQSTYcdDiB3/hbx6/iFjg
	IF4BFQ5BdLu8oqLvLhW3ryOVTv64F48xXgxy/XxZEBFVw6R7QbIarAs+o4C4hFQXGDbKEUa/Ar0
	1AKlBLrM+f7kDWYVdwCUnFwuECCbrshOnPmks8ahvs/HOWczfAj48pA/HtTCRP6zh+iNMYr2UrE
	Paq2/OU0FRtHsxlFRADh72Z3WZnf1/qfxENvj+HM181bloqaNdrP1A7pgpEczBax/kPEYukbNB3
	bFBli
X-Received: by 2002:a05:600c:3114:b0:4a3:59c9:a758 with SMTP id 5b1f17b1804b1-4ba0235112emr55714455e9.32.1794332154297;
        Tue, 10 Nov 2026 09:35:54 -0800 (PST)
Return-Path: <alex.kiernan@gmail.com>
Received: from [192.168.5.15] (cust18-dsl93-89-130.idnet.net. [93.89.130.18])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba01fea9eesm122994405e9.11.2026.11.10.09.35.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 09:35:52 -0800 (PST)
From: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [PATCH meta-oe 00/10] android-tools: adbd fixes and opt-in access
 control for Linux systems
Date: Tue, 10 Nov 2026 17:35:29 +0000
Message-Id: <20261110-android-tools-adbd-v1-0-cc2176f381c3@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOJV82oC/yWMwQrCMBAFf6Xs2YWkSBF/RTwk2Vdd0awkqQil/
 27U4zDMrFRRFJWOw0oFL61quYPfDZSuIV/AKp1pdOPkvZs4ZCmmws3sXjlIFPbpMO8FKToB9fB
 ZMOv7Nz3RAy2wgc5/UZd4Q2rfJW3bB3tS9eh/AAAA
X-Change-ID: 20261106-android-tools-adbd-1c8f4decb0de
To: openembedded-devel@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
X-Mailer: b4 0.16.0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 10 Nov 2026 17:35:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132097

adbd built from this recipe runs on Linux devices rather than Android, and
several things that Android's init or property service would normally
provide are missing. This series fixes the bugs that follow from that, and
adds opt-in controls for who may use adbd.

The first five patches are fixes and change behaviour without any opt-in:

 - `adb reboot recovery` / `bootloader` pass their target to RESTART2
   instead of a fixed "adb", so kernels whose reboot-mode driver picks the
   boot mode from the reason string reboot into the requested mode.
 - `adb shell` starts in the user's home directory and no longer gets
   Android's TMPDIR=/data/local/tmp.
 - On glibc, UsbFfsConnection::StopWorker() no longer spins for ever
   after a cable pull: it relied on bionic's pthread_kill() behaviour, and
   the host saw the device as offline until adbd was restarted.
 - adbd exits after `adb root` / `adb unroot` so the service manager
   restarts it with the new privilege state; the unit becomes
   Restart=always.
 - Readiness is signalled once functionfs is being serviced, not
   immediately after the USB thread starts. sd_notify(READY=1) raced
   open_functionfs(), and 10-adbd-configfs.conf binds the UDC on READY=1
   with no delay, so the bind could be dropped and the host never reached
   CONFIGURED. Builds without systemd can get the same signal through a
   FIFO named in $ADBD_READY_FIFO.

The next four are opt-in, and change nothing unless enabled:

 - PACKAGECONFIG[debuggable-prop]: liblog reads ro.debuggable from the
   build.prop-style files in ADB_DEBUGGABLE_PROP_FILES rather than
   reporting every build as debuggable, so `adb root` can be refused on a
   production image.
 - PACKAGECONFIG[auth-unless-debuggable]: hosts must authenticate unless
   the build is debuggable, decided per connection. Today the Debian patch
   lets every host in without a key.
 - ADBD_AUTH_KEY_PATHS: where adbd reads trusted host keys, in place of
   Android's /adb_keys and /data/misc/adb/adb_keys.
 - adbd keeps root across a restart only while the build is debuggable,
   so a root state written while it was does not outlive it. Without
   debuggable-prop every Linux build is debuggable, so this is a no-op.

The last patch drops `killall adbd` from android-gadget-cleanup, which
runs after adbd has already exited.

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---
Alex Kiernan (10):
      android-tools: adbd: forward the reboot target to RESTART2
      android-tools: adbd: start adb shell in $HOME, without Android's TMPDIR
      android-tools: adbd: fix the USB worker hanging on glibc after a cable pull
      android-tools: adbd: restart after adb root/unroot
      android-tools: adbd: signal readiness once functionfs is serviced
      android-tools: add PACKAGECONFIG debuggable-prop
      android-tools: add PACKAGECONFIG auth-unless-debuggable
      android-tools: add ADBD_AUTH_KEY_PATHS
      android-tools: adbd: keep root only while the build is debuggable
      android-tools-conf: android-gadget-cleanup: don't killall adbd

 .../android-tools-conf/android-gadget-cleanup      |   4 +-
 ...dbd-forward-the-reboot-target-to-RESTART2.patch |  42 +++++++
 ...start-in-HOME-and-drop-the-Android-only-T.patch |  45 +++++++
 ...-use-pthread_kill-as-a-thread-liveness-pr.patch | 118 ++++++++++++++++++
 ...exit-after-adb-root-unroot-so-an-init-sup.patch |  60 +++++++++
 ...nal-readiness-once-functionfs-is-serviced.patch | 117 +++++++++++++++++
 ...onally-read-ro.debuggable-from-build.prop.patch | 117 +++++++++++++++++
 ...ally-require-authorization-unless-the-bui.patch | 138 +++++++++++++++++++++
 ...h-optionally-take-the-trusted-key-paths-a.patch |  72 +++++++++++
 ...oot-on-Linux-only-while-the-build-is-debu.patch |  51 ++++++++
 .../android-tools/android-tools-adbd.service       |   2 +-
 .../android-tools/android-tools_35.0.2.bb          |  28 ++++-
 12 files changed, 788 insertions(+), 6 deletions(-)
---
base-commit: 33db795031ddef81949db64aedf33070e1330fdd
change-id: 20261106-android-tools-adbd-1c8f4decb0de

Best regards,
--  
Alex Kiernan <alex.kiernan@gmail.com>

