Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.48541.1795411876141459492
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 22 Nov 2026 21:31:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=V9cQAZ3Y;
 spf=pass (domain: gmail.com, ip: 74.125.82.174, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-380c28f9e35so3962560eec.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 22 Nov 2026 21:31:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795411875; x=1796016675; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=R252T3l3rqMAq00iu/gPLjvKraG0mi9t1fswgzcUHS4=;
        b=V9cQAZ3Y+r+NjOCY54+WFigM8xh8KRn5Peo6Hf879952jWkiZM83uKrrD0iEL7TJb3
         EnoNhni2hppS64NwE7uy3QtDU5cbqn0oklpkIv/i+xKKTfQRx0BS0blzzfWvHLS6e0bZ
         G/hYPhwlm0YlMX565qZNtNvWX2oUt3w+rG1fhJTjDMdyGK1ZWkVWLZBe3CKMNWyWxtX2
         DtYfBrWJqAZy7t2C16isarAc7OnGm7gdfEloguG2legPQuQKqMiwvQaTEZPhtgwx12Cl
         ySQeYClqdSE7FoMyMM1q5YBkgRhculObXYJcKDVqAj/0IUBVmub6RoVoS2I4BkOjnT7U
         47Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795411875; x=1796016675;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R252T3l3rqMAq00iu/gPLjvKraG0mi9t1fswgzcUHS4=;
        b=EM53BncCYV69yNeKGKyUQJ8CM7wTlMjAoBVamIVZ6dnIxDzbFPWZi/jWQDjqT81URT
         +LWLG/ljglhnUpVXkZZ5vhsJi8JCKHLnJ7Om3OX9EeUfnd5l6W2vGl+aaQtsd87vOqPy
         alZN8dg+w7KFms9tmJKEYVFw1tL8duRKp97KuRsFFmXHjJnMmx2tgGASCoNzA0bMiwvd
         3WB78IhrgwVZxYVi1AzR5szyZXAt14zpVwqiuMFTWd09xvZLqpF8UeugfUJfB60MZy3F
         kD6cc5MnFHpo4TDMNFs+SwVv44FIlb64jN+3hLegj63g7ZzuAbRdGGpjbcbmp27HbFqR
         /EdQ==
X-Gm-Message-State: APuU4Z+d68I6RpPZ/UMvq2FK3CzLe13YQ/M8JioPrzYmO1A0iv5hESSw
	Oa9EJI/aoXlBHp1jfGjku0Sz0rUHKU5kFiZUxhUcIsWHS7RTylw5tJdRqYRiedOMLPQ=
X-Gm-Gg: AZFdTZf82wmZbsMvl3HcGkBtXb+JIZDga29AScaswG+udAdmE1V/zhFmUGKpn0qZ8E1
	os2gCTS7TqmIRDSUvzSmUrpgPHHtcree+Nh0/CzriI8cyldnk4ZzXBll2nFHxjIwSxDMzWiw/v+
	i9npQOOTQMHGuFP0gdPIoq7WwW+WJ5movNjGHHdfn+HspQ/uUVUBBGCFGdUFr+pXh6mO79qSOyd
	OqdwQaK5Qd1FDbIhGYvR0HWrsufDv3fDbhWuDwR2LW30eMd5itz9YKwy4UXnbbDevQQm8+BHaHy
	eaKYE5py8a6eCESUgib6C3s7ku6l0uz4chRnxV2QpkNcyneiQ7VmVodcmEL2vV3RBx2w6hk3nhh
	nS8XzMs0Q9/ofK3Q+MnDosZeDn4sc3qKpaiwxoCClT5hfG5Bk09GxU4NQzZiddS3zUjoYnk25Nv
	Q6MrZpDkQQB26xHjxLAoAOmjA9BbFtFyDany0YrxeVhDUPn+/3gzHi9IEYxgBmINP16Bq02RcY+
	8xYmlpij55pzdqCYoPilJOSSkZFPIAurKAjqPo+GTDQ4xxdOHyEJIpY5k27PQuBd+VTR5ufxcyM
	G5DM/QVvgyXOqBAXp1p2HAh4nt5IW1TmKxZCSetEcScd8TS4ZXo/5cstiE7aSDTP6ww4OsJ1ywh
	bHGs3N7GX+4/CD8wMKVOYCy6vKEPMDTRqru47Nak8ob2bjN6KDyl+K8oa1Vh3hP5xcPz63j2VBT
	j02BgmbSTaKUdgotcSvBb8r2RJoBQ0M9omr4/juHkfvI+wyjqJcHvzYKTxqrIuWPTtXJ0rE8vRE
	nb9SnqC1k+lAlwWt7QRFC3L85o3qRACZa644gr9I9GhgnfBVyqPpMAlr5Ndk4BKjuAeJRBbn69H
	XCnq
X-Received: by 2002:a05:7300:6b0a:b0:382:75b5:e77 with SMTP id 5a478bee46e88-384b4a80eeemr12986807eec.25.1795411875380;
        Sun, 22 Nov 2026 21:31:15 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567cafec4sm36573136eec.26.2026.11.22.21.31.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 21:31:14 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 37/42] unattended-upgrades: upgrade 2.13 -> 2.14
Date: Sun, 22 Nov 2026 21:29:21 -0800
Message-ID: <20261123052953.3658549-65-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261123052953.3658549-1-khem.raj@oss.qualcomm.com>
References: <20261123052953.3658549-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 23 Nov 2026 05:31:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132852
Content-Type: text/plain; charset="utf-8"

- Minimal-steps mode reworked to be greedy, so the first download and
  install start much sooner
- Fix Package-Whitelist being ignored unless the whitelist is strict
- New MinBatteryLevel option (default 40%) and MailReport values
  on-new-change and on-upgrade
- Use os-release instead of lsb-release; minimum Python is now 3.8
- Honor APT::Get::Purge; AutoFixInterruptedDpkg now actually runs

Refresh the distro_info patch for the reworked development release
check.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...d-upgrade-Remove-distro_info-usage-to-check.patch | 12 ++++++------
 ...-upgrades_2.13.bb => unattended-upgrades_2.14.bb} |  2 +-
 2 files changed, 7 insertions(+), 7 deletions(-)
 rename meta-oe/recipes-devtools/unattended-upgrades/{unattended-upgrades_2.13.bb => unattended-upgrades_2.14.bb} (95%)

diff --git a/meta-oe/recipes-devtools/unattended-upgrades/files/0001-unattended-upgrade-Remove-distro_info-usage-to-check.patch b/meta-oe/recipes-devtools/unattended-upgrades/files/0001-unattended-upgrade-Remove-distro_info-usage-to-check.patch
index 1ad092c66a..d296eba796 100644
--- a/meta-oe/recipes-devtools/unattended-upgrades/files/0001-unattended-upgrade-Remove-distro_info-usage-to-check.patch
+++ b/meta-oe/recipes-devtools/unattended-upgrades/files/0001-unattended-upgrade-Remove-distro_info-usage-to-check.patch
@@ -17,11 +17,9 @@ Signed-off-by: Aníbal Limón <anibal@rzerosystems.com>
 
 Upstream-Status: Inappropriate [OE specific: python3-distro-info is not available]
 ---
-diff --git a/unattended-upgrade b/unattended-upgrade
-index b72e59e..8ff0c1c 100755
 --- a/unattended-upgrade
 +++ b/unattended-upgrade
-@@ -89,8 +89,6 @@ import apt
+@@ -78,8 +78,6 @@
  import apt_inst
  import apt_pkg
  
@@ -30,7 +28,7 @@ index b72e59e..8ff0c1c 100755
  # workaround debian #1076097, it's unclear why we get the warning:
  # "DeprecationWarning: This process (pid=3710789) is multi-threaded,
  #  use of fork() may lead to deadlocks in the child."
-@@ -2436,42 +2434,6 @@ def run(options,             # type: Options
+@@ -2704,44 +2702,6 @@
      if should_stop():
          return UnattendedUpgradesResult(False)
  
@@ -63,7 +61,9 @@ index b72e59e..8ff0c1c 100755
 -                                 - datetime.timedelta(days=1)))
 -                return UnattendedUpgradesResult(True)
 -
--            logging.debug("Running on the development release")
+-            if (isinstance(devel, distro_info.DistroRelease)
+-                    and devel.series == DISTRO_CODENAME):
+-                logging.debug("Running on the development release")
 -    elif "(development branch)" in DISTRO_DESC and not\
 -            apt_pkg.config.find_b("Unattended-Upgrade::DevRelease", True):
 -        syslog.syslog(_("Not running on the development release."))
@@ -72,4 +72,4 @@ index b72e59e..8ff0c1c 100755
 -
      logging.info(_("Starting unattended upgrades script"))
  
-     # check and get lock
+     # check if its configured for install on shutdown, if so, the
diff --git a/meta-oe/recipes-devtools/unattended-upgrades/unattended-upgrades_2.13.bb b/meta-oe/recipes-devtools/unattended-upgrades/unattended-upgrades_2.14.bb
similarity index 95%
rename from meta-oe/recipes-devtools/unattended-upgrades/unattended-upgrades_2.13.bb
rename to meta-oe/recipes-devtools/unattended-upgrades/unattended-upgrades_2.14.bb
index a352a2b9a5..e86dbc82a7 100644
--- a/meta-oe/recipes-devtools/unattended-upgrades/unattended-upgrades_2.13.bb
+++ b/meta-oe/recipes-devtools/unattended-upgrades/unattended-upgrades_2.14.bb
@@ -9,7 +9,7 @@ SRC_URI = "git://github.com/mvo5/unattended-upgrades.git;protocol=https;branch=m
            file://0001-unattended-upgrade-Remove-distro_info-usage-to-check.patch \
            "
 
-SRCREV = "221b1a688ee291fd7e0d116dccb57073b921619a"
+SRCREV = "1cba54a8ee9b7706e09f57937f1de251900a992e"
 
 
 inherit setuptools3_legacy
