Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E28EC5DF6D
	for <webhook@archiver.kernel.org>; Fri, 14 Aug 2026 22:47:21 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.24536.1786747634129885809
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Aug 2026 15:47:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=dNXEP8Ui;
 spf=pass (domain: gmail.com, ip: 209.85.214.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2cf50c6f235so19296355ad.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 15:47:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786747633; x=1787352433; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=adFrsNfEAR81ugRv1ZMYoCF69YA35/ezJQg3zqWul0c=;
        b=dNXEP8Uie0wv9JyMZ+7Pne45dfYFEB/X/Ejesjp50WRaKku5hgc5KtNCD3KKZlGoDo
         YLwA7DU1MFwNxvLdcmo4MGWODzrfl6X5VVnc0d6jmK6xvUBKiGC77WJVq29nsfV6FWhj
         UwTpcLCt8SGeR0ZLVddLJdXUfSnpKu2F5l1lvgiakHkkkPQ6NKXN1o+AmGaiBWUu1XZs
         GRz7N/VzA37aaN/pBWUO+dI+10gz6cIFKU5qqm248J1/t9ZbxLA3ALUxuSfv0CI/KeAG
         hmSOnBYQ3arNMDq8JSKWdOVmZ1G0V2VibFq51QuZeDtdEJ85EaWTKfmVsLOm8vXPOpA6
         YhKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786747633; x=1787352433;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=adFrsNfEAR81ugRv1ZMYoCF69YA35/ezJQg3zqWul0c=;
        b=kB7gdZXt1B0ecJPQlF7hYkwBat4DNJowuj268oRrURPhLBWrspNEsk4ut73CqSD7ST
         etOeCEJuPRRMKJP/QOwhH909cJDQZ/WaNseMAxOeHIXQaSgvZCOzxjyZfJ1VoKvas/Vd
         GW21EohlZV3FqolatHXdWWSgSf+WV7nC30zAil00d2yeW5kchYtZV+iGy94pBQkrGpvK
         g761OMmkzBUB+l/ubMQHQor/G7enjEg/4JM4DxtsKGQMxExU1CCwR1TlQd6NkuYz2gF3
         h9F4dPLcDK6kanHBZTWj6E/mRPecob1/qGnweA4v0m5rslwbTsZpfb34vF1gIqMlrdH5
         2G+A==
X-Gm-Message-State: AOJu0Yw/fqw4KA7RMKwp5lDzEM3+6gruZ7wtE3P8p/2P7pZbFD5EWPRU
	FpN6ky06X4SZiwJXu8Dv9q07qrm3cBQlgJ5zSUiaMgXOdrtzdezyQnR9/VP/kg==
X-Gm-Gg: AR+sD10MRO2VijME4LuBKYPmS5/CDEKiloFc4ZjzQ4odZhAo4rpFyGx466ponmUZsqW
	TvnkeFgfyjXso5nhBRv9rYzuBwD2JMRSkEQN5b7ldJBAlSGua7911BE1eSKkpw9OpTt7qJMiWMI
	nAt2ZHZjj35wHACASVbjVkMm5h0tBSTS3YypDb0xi1EO7qLOTpe6qPk/WJO2xLOk9eQY/E3DPCp
	9o3qI+LkXtt9sPfj12U+OIEjvJqOFYpprlashcPOTeq0itUHnTeSD2CVm/C2ePxsDHbxQzs+pZM
	IqiOxVuMmSg7Kazv+SYeHfGbYZboSP86jqJNH0xKOBJr6oTAUCjDdKSw9odh1Kt3EywwKuVLWmO
	X6RE702ncMw9lKV9NP/199yLHaBrIsvTv9TIydSz9ZtFUjS3fgLdMxiwdhR/gTY2KPAS50iGWXN
	t5tPPH5S11ZU2yHQDffYIRcObwCHI8ePUu0+L47Q7TJltP/Jw6ncZktlqwrTnb3Ck+w7dpMnEYy
	9syYc9oKjeBLEGWPcsLprZPhL8nERz/GOmm6XQdyfb4OgZmTCaGYefV1vMpCtQY8GjWl9lPHwxy
	UmqIIYV1QYeGwOrLpn62cyK7km/bbbViHM7DQE++hByzr1v2oeSRZLLwgUEfRlaZFagRZNJNLjg
	r1FfZhoCuemXaRs8GpFnVMRBuuHuvJio8bzz+OnOkr3LK5w==
X-Received: by 2002:a05:6a21:178a:b0:3bf:e761:6285 with SMTP id adf61e73a8af0-3cc71de3fa5mr11824870637.29.1786747633448;
        Fri, 14 Aug 2026 15:47:13 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141387ac9b1sm14541588c88.2.2026.08.14.15.47.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 15:47:12 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 080/109] unattended-upgrades: upgrade 2.9.1 -> 2.13
Date: Fri, 14 Aug 2026 15:45:06 -0700
Message-ID: <20260814224539.1523174-80-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260814224539.1523174-1-khem.raj@oss.qualcomm.com>
References: <20260814224539.1523174-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 22:47:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129144

Minor release. Dropped 0001-setup.py-Disable-autodection-of-modules.patch:
2.13's setup.py already passes both packages=[] and py_modules=[] itself, so
re-adding py_modules=[] produced a "keyword argument repeated" SyntaxError.
Rebased 0001-unattended-upgrade-Remove-distro_info-usage-to-check.patch onto
the new import block and the shifted run() body.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...up.py-Disable-autodection-of-modules.patch | 28 -------------------
 ...de-Remove-distro_info-usage-to-check.patch | 19 ++++++-------
 ...s_2.9.1.bb => unattended-upgrades_2.13.bb} |  3 +-
 3 files changed, 9 insertions(+), 41 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/unattended-upgrades/files/0001-setup.py-Disable-autodection-of-modules.patch
 rename meta-oe/recipes-devtools/unattended-upgrades/{unattended-upgrades_2.9.1.bb => unattended-upgrades_2.13.bb} (90%)

diff --git a/meta-oe/recipes-devtools/unattended-upgrades/files/0001-setup.py-Disable-autodection-of-modules.patch b/meta-oe/recipes-devtools/unattended-upgrades/files/0001-setup.py-Disable-autodection-of-modules.patch
deleted file mode 100644
index ec70dd6570..0000000000
--- a/meta-oe/recipes-devtools/unattended-upgrades/files/0001-setup.py-Disable-autodection-of-modules.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 8fd80ead718ffc53d7182b9df6f49974113ff8fc Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 23 May 2022 11:23:58 -0700
-Subject: [PATCH] setup.py: Disable autodection of modules
-
-This helps to fix build with latest setuptools
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- setup.py | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/setup.py b/setup.py
-index 932bf01..fd5a092 100755
---- a/setup.py
-+++ b/setup.py
-@@ -12,6 +12,7 @@ if __name__ == "__main__":
-         name='unattended-upgrades',
-         version='0.1',
-         scripts=['unattended-upgrade'],
-+        py_modules=[],
-         data_files=[
-             ('../etc/logrotate.d/',
-                 ["data/logrotate.d/unattended-upgrades"]),
--- 
-2.36.1
-
diff --git a/meta-oe/recipes-devtools/unattended-upgrades/files/0001-unattended-upgrade-Remove-distro_info-usage-to-check.patch b/meta-oe/recipes-devtools/unattended-upgrades/files/0001-unattended-upgrade-Remove-distro_info-usage-to-check.patch
index d39427e9fd..317d0dfe4a 100644
--- a/meta-oe/recipes-devtools/unattended-upgrades/files/0001-unattended-upgrade-Remove-distro_info-usage-to-check.patch
+++ b/meta-oe/recipes-devtools/unattended-upgrades/files/0001-unattended-upgrade-Remove-distro_info-usage-to-check.patch
@@ -17,24 +17,20 @@ Signed-off-by: Aníbal Limón <anibal@rzerosystems.com>
 
 Upstream-Status: Inappropriate
 ---
- unattended-upgrade | 38 --------------------------------------
- 1 file changed, 38 deletions(-)
-
 diff --git a/unattended-upgrade b/unattended-upgrade
-index 802d4d5..3b4e83e 100755
+index b72e59e..8ff0c1c 100755
 --- a/unattended-upgrade
 +++ b/unattended-upgrade
-@@ -83,9 +83,6 @@ import apt
+@@ -89,8 +89,6 @@ import apt
  import apt_inst
  import apt_pkg
  
 -import distro_info
 -
--
- # the reboot required flag file used by packages
- REBOOT_REQUIRED_FILE = "/var/run/reboot-required"
- KEPT_PACKAGES_FILE = "var/lib/unattended-upgrades/kept-back"
-@@ -2061,41 +2058,6 @@ def run(options,             # type: Options
+ # workaround debian #1076097, it's unclear why we get the warning:
+ # "DeprecationWarning: This process (pid=3710789) is multi-threaded,
+ #  use of fork() may lead to deadlocks in the child."
+@@ -2436,42 +2434,6 @@ def run(options,             # type: Options
      if should_stop():
          return UnattendedUpgradesResult(False)
  
@@ -53,7 +49,8 @@ index 802d4d5..3b4e83e 100755
 -        except Exception as e:
 -            logging.warning("Could not figure out development release: %s" % e)
 -        else:
--            if ((devel.series == DISTRO_CODENAME
+-            if ((isinstance(devel, distro_info.DistroRelease)
+-                 and devel.series == DISTRO_CODENAME
 -                 and devel.release is not None
 -                 and devel.release - date.today() > DEVEL_UNTIL_RELEASE)):
 -                syslog.syslog((_("Not running on this development "
diff --git a/meta-oe/recipes-devtools/unattended-upgrades/unattended-upgrades_2.9.1.bb b/meta-oe/recipes-devtools/unattended-upgrades/unattended-upgrades_2.13.bb
similarity index 90%
rename from meta-oe/recipes-devtools/unattended-upgrades/unattended-upgrades_2.9.1.bb
rename to meta-oe/recipes-devtools/unattended-upgrades/unattended-upgrades_2.13.bb
index 3d92f59ff2..9534fd3197 100644
--- a/meta-oe/recipes-devtools/unattended-upgrades/unattended-upgrades_2.9.1.bb
+++ b/meta-oe/recipes-devtools/unattended-upgrades/unattended-upgrades_2.13.bb
@@ -7,10 +7,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe \
 
 SRC_URI = "git://github.com/mvo5/unattended-upgrades.git;protocol=https;branch=master \
            file://0001-unattended-upgrade-Remove-distro_info-usage-to-check.patch \
-           file://0001-setup.py-Disable-autodection-of-modules.patch \
            "
 
-SRCREV = "5aff8fa2b5b60b7c11bbfb39c884477e72d11d02"
+SRCREV = "221b1a688ee291fd7e0d116dccb57073b921619a"
 
 
 inherit setuptools3_legacy

