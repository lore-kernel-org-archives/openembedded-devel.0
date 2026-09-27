Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B2A4C9830E
	for <webhook@archiver.kernel.org>; Sun, 27 Sep 2026 21:53:44 +0000 (UTC)
Received: from mail-dy2-f41.google.com (mail-dy2-f41.google.com [74.125.229.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.45672.1790546020324419263
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 27 Sep 2026 14:53:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=QUC19H37;
 spf=pass (domain: gmail.com, ip: 74.125.229.41, mailfrom: raj.khem@gmail.com)
Received: by mail-dy2-f41.google.com with SMTP id 5a478bee46e88-343c8177767so681978eec.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 27 Sep 2026 14:53:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790546020; x=1791150820; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4LJ8mIoptjNAaobNuTMdPVrhu4eW2WGxc9It2OncO8s=;
        b=QUC19H37j/NvGKxP/kg2E6chntpBzYis1vby6IRlG0StEKqLnHlGuuvnJbbqK0Nzeh
         KkhJLTiqS9chX4cf5hkLLDdjtfDSKLdR2/ALKMMnaWyXbunIlqh3PI4xYMqi+Gh16QRg
         OS3u+42uAtSBVpJ0u1UadVGZiWR8XyDnf/UtEhxf8nH4XsfRKYH9wW0wV2vklqNicnxZ
         bCg6BbFXYelCHN5pJDvN6gKjOR72RW8N7DmzM5tjzTDS1o6II4TTCghVjPK1+Pxeo3em
         pD+AC57YhyiTKkKmkyf00jFb6+CVHbMaLkISBPN2uzL+1KGuYPQZgNVcj9T0++XzdzbC
         VnVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790546020; x=1791150820;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4LJ8mIoptjNAaobNuTMdPVrhu4eW2WGxc9It2OncO8s=;
        b=XgCkI3fQmBXM/HWoSldP2wgNP4WhSFIr0/K9WIsrCwb49SbYmKLnzqh1Xes2LztTe7
         0dzLWJOmPPqzBwP4mpDqez3i7EYC+2D1DZY7C7kO5z54thsGNI8CwtK59FMo8BIwEm1S
         eiYy0A0lYwrjc0dRi3Z1Eo1EHwtRB4l4FmrBwcqAuUafkGy9WWIEFB2XAy59qz5Oe9UJ
         TEYYrkBFhEFZemldbJ6H+zbg+LrrmIvpNAENocBSDLEIM+977eG3xWAwxklRKbdXmDH7
         nTsi5Ox8dlaZ06O5Bqj1Xy/Vs7frmEref0Q2WGgLMm6FeYkhAWmXweRU8+LZYVzlcGKn
         eLBw==
X-Gm-Message-State: AFq9FYJDsOqmhNhqSVAUxIskki6Hg6aCht/FKhtelbe4xF4hX025pTld
	D/OtLqMZOR2xuOg1UKUHzjPci/6/9BtMNiizeT8+PSX/jajuh1UT4rgCSBhfisf3
X-Gm-Gg: AYBFou0r7HPd4nltSugepocnlv1jqD5xoEvAJAd73gL8wzHPRb4wFa3lU38PizjLqec
	l8Nrl8W9j0eQTvtmbFH2v96sQB70HyJqyu/ROyKP7ejRRXleSOlq1d2F+q0ldMrlbmi04xRotkA
	KP6yf/IxmTXO8NFAmlFMgiDNZZ1Na2Jh0YeAilf9lX5O7Dlz5tP4naPXQMSiJoRfmx4tZ81Q/vG
	JXHDwEglyurXBGO7H+QFdg+bSFexwrqWzYuSrf3VHC04rTMqxedI7r0ABT10UQ6RxfcXqnlSzSu
	4hikzjkfJ8Rizl46vS1XY2bmJ83AMz3d2jnDbRiKNF/6Abqx6qnVAS26i9ixFgqb8R9idjwYL5V
	bnB6LUvohIe3mDSd5K3cTPOhqaeXwip2sllRNR4APh6+yV7iPEoYLOM43kDQLwFUa0wsZ2MM47T
	PlA3NsJHgVNC8EDGKLvhLLzIqOGgoCKuBTD8pfu8rhr/hbqIMiIK5Wg8hF7Hf76WkTUq3Yx2oti
	pChRW0ROHbjkUOILowZzk+2JPCkLVAr08GdCJ4c7Tp8EZQQT1mNBHPCjrtB2PtkrFBg+9B5Fn9Y
	YNGHQNBeUriKnASMqGRPdMe4bZcdZt/UnMFdVrcNsF4UbJOPy68Ecs4Om2y9zGreyjz+1maKIPT
	K7/r0/CLy0L3TrzByOWZhKgP4nEKVRREcnvF09LXAaL4i8byrmdMxzpWr3BWrejBjkjYqydDxjQ
	xbdHHCSaw0emYh00noeo9siqy+Rsa0FXRVMfigow==
X-Received: by 2002:a05:693c:8953:10b0:346:7bfd:8504 with SMTP id 5a478bee46e88-3467bfd8655mr2808045eec.41.1790546019469;
        Sun, 27 Sep 2026 14:53:39 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34144f4eb9esm23047736eec.19.2026.09.27.14.53.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 14:53:38 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH] conserver: fix racy console-down ptest
Date: Sun, 27 Sep 2026 14:53:35 -0700
Message-ID: <20260927215335.255230-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 27 Sep 2026 21:53:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130385

test/test1.cf sets "reinitcheck 1s", added upstream only to exercise
the seconds unit. A reinit check brings back every console that is down,
including one taken down on purpose, so test #5, which expects the
console that test #4 downed ("cd") to still be down, has about a second
to attach and query it. On a loaded host, e.g. while testimage runs
several VMs, it loses:

  FAIL: conserver #5  (diffs in test5.diff)
  -[`shell' -- console is down]

conserver.log shows "[shell] automatic reinitialization" between the
two tests. Reproduced with 2 failures in 20 runs in qemux86-64 with the
host CPUs saturated; instrumenting group.c confirmed the reinit comes
from ReUp(pGE, 2), the reinitcheck timer.

Use "reinitcheck 60s" in the test config, so the seconds unit is still
parsed but the check cannot fire during the ~10 s test run. 40 of 40
runs passed under the same load.

Tested with meta-oe-image-ptest-conserver on qemux86-64 with
yoe-musl-systemd-wayland.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...einitcheck-race-the-console-down-tes.patch | 37 +++++++++++++++++++
 .../conserver/conserver_8.3.0.bb              |  1 +
 2 files changed, 38 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/conserver/conserver/0001-test-don-t-let-reinitcheck-race-the-console-down-tes.patch

diff --git a/meta-oe/recipes-connectivity/conserver/conserver/0001-test-don-t-let-reinitcheck-race-the-console-down-tes.patch b/meta-oe/recipes-connectivity/conserver/conserver/0001-test-don-t-let-reinitcheck-race-the-console-down-tes.patch
new file mode 100644
index 0000000000..0bb7f99bd1
--- /dev/null
+++ b/meta-oe/recipes-connectivity/conserver/conserver/0001-test-don-t-let-reinitcheck-race-the-console-down-tes.patch
@@ -0,0 +1,37 @@
+From: Khem Raj <khem.raj@oss.qualcomm.com>
+Date: Sun, 27 Sep 2026 14:15:00 -0700
+Subject: [PATCH] test: don't let reinitcheck race the console-down test
+
+test1.cf sets "reinitcheck 1s", added to exercise the seconds unit.
+A reinit check brings back every console that is down, including one
+taken down on purpose, so test #4 ("cd") and test #5, which expects the
+console to still be down, race it: if the second console client does
+not attach and query the state within a second, conserver has already
+reinitialized the console and test #5 fails with
+
+  -[`shell' -- console is down]
+   [Enter `^Ec?' for help]
+
+This shows up readily on loaded or emulated targets. Use 60s instead:
+the seconds unit is still parsed and the check can no longer fire
+during the test run.
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
+ test/test1.cf | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/test/test1.cf b/test/test1.cf
+index 781267e..b02a9ba 100644
+--- a/test/test1.cf
++++ b/test/test1.cf
+@@ -8,7 +8,7 @@ default * {
+ 	include full;
+ }
+ config * {
+-	reinitcheck 1s;
++	reinitcheck 60s;
+ }
+ break 5 {
+ 	string "\rtest\r";
diff --git a/meta-oe/recipes-connectivity/conserver/conserver_8.3.0.bb b/meta-oe/recipes-connectivity/conserver/conserver_8.3.0.bb
index 8ca5d9c95d..8a841bf97e 100644
--- a/meta-oe/recipes-connectivity/conserver/conserver_8.3.0.bb
+++ b/meta-oe/recipes-connectivity/conserver/conserver_8.3.0.bb
@@ -23,6 +23,7 @@ SRC_URI = "\
     git://github.com/bstansell/conserver;protocol=https;branch=master;tag=v${PV} \
     file://conserver.service \
     file://run-ptest \
+    file://0001-test-don-t-let-reinitcheck-race-the-console-down-tes.patch \
 "
 SRCREV = "fe9aac337554f95721dc9f3da721092a81092089"
 

