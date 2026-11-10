Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1077.1794332160270640571
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 Nov 2026 09:36:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=Tm402ELv;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a3517554f7so24355975e9.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 10 Nov 2026 09:36:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794332158; x=1794936958; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VCoIVxUN7/HNcrZJQNRrtt1h0uxfOvtG2T4z2RkCTCE=;
        b=Tm402ELvGxgxOIUi5oulmDAxRDfb/3pRv0guVRkq8S9NCxcrhPrnzH1MbV9t8VOtu7
         bwNf/TfxoqqGnDLjmwK4Kebq6fBJzanb4OUyPzKxWxXItr7dnrEXG3fH/cPv8XGa2CtU
         1rCrLxcn/p39S/rrPkDlva24PVA0JRibcj+jUBPhj9sfp8oiStr+KIJy1GUAChXx59NR
         SondLh5YMxuI1PJLYFDLVSUOh4OoGYN0UZ6uz5ytCv4sXbK4t8rvITzrxLIrhhDg3/78
         ShyGsMCr/sMXLTLLPKaZ2gkUsl37gAe2NsglXav1ng5w9lKajDtEk8vBDax1EUzP7vTH
         lPcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794332158; x=1794936958;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VCoIVxUN7/HNcrZJQNRrtt1h0uxfOvtG2T4z2RkCTCE=;
        b=dTlnBqi2r0AwCqDnVVAhfO3BoEu2gE9Gv7ZrWwVFAuhJSY151WNWLsqkBjd5d12IL8
         9/pZufh3E7I51tjPekJcy+tl83C3GopXKImqmJjSwbn5WQ1e38P27SHu/ptma7XC93v5
         RFS4dgD8SUYd4LLAUA2hZOXbNDMjJizpD1+IGbvPIlnBtHWpU+uo/UHxcnFleAgmUEaz
         SH1Q7X76mdrfNUQ2HQMxrAsWrKujPYZy70AvUinE/EL5+jiukoEwxBDl1twx7/08m8Cv
         M3CmqMOodBridf9Z45zqg5rg+ABfVxTm89x0yMHSbdNH/flFp0xW/BFHTg+o+oVsWwlY
         4WtA==
X-Gm-Message-State: APuU4Z96ZFdq1vqktDfUV0cDG7YhIf+YkiiIRktvRykGAIalmoObVjwi
	JaLY2OITOr5KjdbgZnX59g1GLBgXsae6Kd8gHQFKTi57RZkNs4ZIlVrAUcF0Bg==
X-Gm-Gg: AYBFou1rNZl9yQDqHqwSOTwbWVFqPzYEFrwBfQY/tRPas4CbX8K0QqfA+LNihH4DhtX
	w/4LKOC5eWo3fuv9naVAh0SRVpruAKOeSopTelJhtuomXjyWjyI1pwP+zFpgSlS/Hdy8yjtUxj8
	P16kkaQ7w4VHW3K1guLlEHVp5Xrzstwd2xdhVpjgwqWhqM4fkPJspKK2AsuEXwLLTTX9Gvy+jC2
	2X6JpUb+2Ic371UCqF9vsyd3uu3OYg6XE/qABoAdN7wCT2B4uY139yHbUYSD1tPO/yQ4wvYN92G
	+Lz66k1uWov8R+0P3EEHpzTnfquXz0xZHgVtn3W5pakrr6JfuuAYcI8xP7WmttlxiqlPq4w9jv1
	fG67AJ8j8L0CBT3zBx4JMTXaS/J8gm1LK18ytZaoexDEGhMiZSWxxjEFb84vEsEZ5vycyRNfXcX
	2sY7gw8S+hh5kFfn5YfW8r5ESaTb6/aOR7MIvRe4+d/5lEkCrgmWdQg1xxBCV43Otti4Le4rigM
	GYUGfRoyjKl3MzyBoI0Ibs+NZv8puy+ppILTXxaFZfHOcK5UyYBA0sHaOQSUD2+yGjwt3bJlmE5
	xFlduaMdcj/pbb36sAh9pK9tfWX1aFVnnZAs3z6vH9gbnanRTJxBYHb1oJrpvp/8svMrW1gIRCR
	gUJbp
X-Received: by 2002:a05:600c:1d18:b0:4a6:eca1:7d5c with SMTP id 5b1f17b1804b1-4ba023580demr53430515e9.32.1794332158396;
        Tue, 10 Nov 2026 09:35:58 -0800 (PST)
Return-Path: <alex.kiernan@gmail.com>
Received: from [192.168.5.15] (cust18-dsl93-89-130.idnet.net. [93.89.130.18])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba01fea9eesm122994405e9.11.2026.11.10.09.35.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 09:35:57 -0800 (PST)
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Tue, 10 Nov 2026 17:35:33 +0000
Subject: [PATCH meta-oe 04/10] android-tools: adbd: restart after adb
 root/unroot
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261110-android-tools-adbd-v1-4-cc2176f381c3@gmail.com>
References: <20261110-android-tools-adbd-v1-0-cc2176f381c3@gmail.com>
In-Reply-To: <20261110-android-tools-adbd-v1-0-cc2176f381c3@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
X-Mailer: b4 0.16.0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 10 Nov 2026 17:36:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132101

`adb root` and `adb unroot` write the new privilege state to
/run/adbd.root and expect adbd to be restarted to apply it, as Android's
init does. Nothing restarted it here, so the client's wait-for-disconnect
hung and adbd kept its uid. Have adbd exit after writing the state, and
restart the service on any exit, not only on failure.

AI-Generated: Claude Opus 5.5 (Claude Code)
Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---
 ...exit-after-adb-root-unroot-so-an-init-sup.patch | 60 ++++++++++++++++++++++
 .../android-tools/android-tools-adbd.service       |  2 +-
 .../android-tools/android-tools_35.0.2.bb          |  1 +
 3 files changed, 62 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/0019-adb-daemon-exit-after-adb-root-unroot-so-an-init-sup.patch b/meta-oe/recipes-devtools/android-tools/android-tools/0019-adb-daemon-exit-after-adb-root-unroot-so-an-init-sup.patch
new file mode 100644
index 000000000000..a55e4259194c
--- /dev/null
+++ b/meta-oe/recipes-devtools/android-tools/android-tools/0019-adb-daemon-exit-after-adb-root-unroot-so-an-init-sup.patch
@@ -0,0 +1,60 @@
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From: Alex Kiernan <alex.kiernan@gmail.com>
+Date: Sun, 19 Jul 2026 08:59:06 +0100
+Subject: [PATCH] adb: daemon: exit after adb root/unroot so an init supervisor
+ restarts adbd
+
+On Android, `adb root`/`adb unroot` write the desired privilege state and
+rely on init restarting adbd (via a property trigger) to pick it up. This
+Linux port keeps the "write state file, rely on a restart" model but the
+running adbd never exits, so on a non-Android system with nothing watching
+the state file the daemon keeps its current uid and the client's
+`wait-for-disconnect` hangs (or times out once the USB transport happens to
+drop for unrelated reasons).
+
+Exit after successfully writing the root state, as the classic adbd did,
+so the service manager restarts adbd (systemd with Restart=always, or a
+supervisor such as runit); on restart should_drop_privileges() reads the
+state file and comes back root (root) or drops to the adb user (unroot). A
+short delay lets the reply reach the host over USB before the gadget is
+torn down.
+
+Upstream-Status: Pending
+Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
+---
+ packages/modules/adb/daemon/restart_service.cpp | 15 ++++++++++++++-
+ 1 file changed, 14 insertions(+), 1 deletion(-)
+
+diff --git a/packages/modules/adb/daemon/restart_service.cpp b/packages/modules/adb/daemon/restart_service.cpp
+index 8aee1afeaef8..3c3fd24ed5af 100644
+--- a/packages/modules/adb/daemon/restart_service.cpp
++++ b/packages/modules/adb/daemon/restart_service.cpp
+@@ -65,7 +65,16 @@ void restart_root_service(unique_fd fd) {
+         if (write_root_state(kRootMagic, kRootMagicSize)) {
+             LOG(INFO) << "adbd restarting as root";
+             WriteFdExactly(fd.get(), "restarting adbd as root\n");
+-            return;
++            // Unlike on Android (where init restarts adbd on a property
++            // trigger), on this Linux port nothing watches the root-state
++            // file, so a still-running adbd would keep its current uid and
++            // the client's `wait-for-disconnect` would hang. Exit instead so
++            // the init supervisor restarts us; on restart should_drop_
++            // privileges() reads #ROOT# and we come back as root. Give the
++            // reply time to reach the host over USB before tearing the gadget
++            // down, as the classic adbd did.
++            sleep(1);
++            _exit(0);
+         }
+         usleep(100000);
+     }
+@@ -84,6 +93,10 @@ void restart_unroot_service(unique_fd fd) {
+     }
+     LOG(INFO) << "adbd restarting as nonroot";
+     WriteFdExactly(fd.get(), "restarting adbd as non root\n");
++    // See restart_root_service(): exit so the init supervisor restarts adbd,
++    // which then reads #NOROOT# and drops privileges again.
++    sleep(1);
++    _exit(0);
+ }
+ 
+ void restart_tcp_service(unique_fd fd, int port) {
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/android-tools-adbd.service b/meta-oe/recipes-devtools/android-tools/android-tools/android-tools-adbd.service
index 7c16b5cea20f..355d91517cff 100644
--- a/meta-oe/recipes-devtools/android-tools/android-tools/android-tools-adbd.service
+++ b/meta-oe/recipes-devtools/android-tools/android-tools/android-tools-adbd.service
@@ -5,7 +5,7 @@ Before=android-system.service
 
 [Service]
 Type=notify
-Restart=on-failure
+Restart=always
 ExecStartPre=-/usr/bin/android-gadget-setup adb
 ExecStart=/usr/bin/adbd
 
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools_35.0.2.bb b/meta-oe/recipes-devtools/android-tools/android-tools_35.0.2.bb
index 9a0bae98dd19..e247cbbafa60 100644
--- a/meta-oe/recipes-devtools/android-tools/android-tools_35.0.2.bb
+++ b/meta-oe/recipes-devtools/android-tools/android-tools_35.0.2.bb
@@ -63,6 +63,7 @@ SRC_URI = "https://deb.debian.org/debian/pool/main/a/android-platform-tools/andr
            file://0016-adbd-forward-the-reboot-target-to-RESTART2.patch \
            file://0017-adbd-shell-start-in-HOME-and-drop-the-Android-only-T.patch \
            file://0018-adbd-do-not-use-pthread_kill-as-a-thread-liveness-pr.patch \
+           file://0019-adb-daemon-exit-after-adb-root-unroot-so-an-init-sup.patch \
            "
 
 SRC_URI[orig.md5sum] = "352376965cdef7bd7505d8fefdd43d50"

-- 
2.43.0

