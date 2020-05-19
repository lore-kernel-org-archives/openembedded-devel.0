Received: from esa1.hgst.iphmx.com (esa1.hgst.iphmx.com [68.232.141.245])
 by mx.groups.io with SMTP id smtpd.web10.1371.1589926673639334821
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 May 2020 15:17:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@wdc.com header.s=dkim.wdc.com header.b=djcAHDM+;
 spf=pass (domain: wdc.com, ip: 68.232.141.245, mailfrom: prvs=401675184=alistair.francis@wdc.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1589926673; x=1621462673;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=mLc4w3jO04BEb3El+06PTldTX24zBiQIe0pIOWA579M=;
  b=djcAHDM+e/TUTa7MQbZxmwy8L/p0CZNEPvUtNdofdFE82QSJuHKrKUff
   i5MwyFkSIdM5M+2hAAIOANbVMFdpn8dM+hdeX+iXpF9VLW03CyVO+IRMi
   4DsIY8kmg8ES+UbroAM+bJNxYZVvvRaZt19g3zjjZvoZrQE3u9IKzeOPS
   kM7INb3iVZ1mdP+yWpGL/aCOL87QPV+WRizyhrpnyDWkx05HbKkqOyRq9
   L+4b+MagFupSXgvSQqXfXSFNXWyQ1RoBAWDFaQEakl/0YbFQtrJUSh1Oj
   31C24tbCG00X4M9A0JGxaWLxm8hUlydCnFingErQe5nwlvmKce1xYcjD9
   Q==;
IronPort-SDR: L+RxZC0vEI03PFFSzL/EzUqlPlOujqaD1toVzXmrz2wDTY3dryA1vAn0OA0nZT9iKc7FZJbOFI
 Ch29C2J8OJlaiirCKE2QYtWhfJbs60FlbJ7+5XoFLY5h2Zzj1gLlw+AK5oEqOiRyATcP7TIqg1
 mT4ZhkHY+79gJ8Hx1ZFgaU7jFfTd/LsGPYBF6Rh8/T8MqUAi6DpKXirVZblksA7cu6rC1Qh/IO
 8ridyppdAhDeGwAarInbL16TOASqrhd2FnpbqfUHnrAAUa0lGikOWo4xRIi3Iq3glO9bI4pRWt
 fyo=
X-IronPort-AV: E=Sophos;i="5.73,411,1583164800"; 
   d="scan'208";a="247064550"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com) ([199.255.45.15])
  by ob1.hgst.iphmx.com with ESMTP; 20 May 2020 06:17:52 +0800
IronPort-SDR: XVz5J6gU+BSuc8zR293REw4pdkV12PziCW+dY+dUci9D5rTL3HELQzh7600/24LraYm5aPpAuF
 Nurf1ZsGeXYMe/7eenpXWEOYDT4+5XKAY=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
  by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2020 15:07:23 -0700
IronPort-SDR: 3Lii2Cz3qK9wi9zu3ZDnybbWGUE2oX9VNI3m57CKs5Q29B/MekGxoRMzUSxZEDyHG292h7hhlf
 qQt+QU4o918A==
WDCIronportException: Internal
Received: from usa003971.ad.shared (HELO risc6-mainframe.hgst.com) ([10.86.56.231])
  by uls-op-cesaip01.wdc.com with ESMTP; 19 May 2020 15:17:53 -0700
From: "Alistair Francis" <alistair.francis@wdc.com>
To: openembedded-devel@lists.openembedded.org
Cc: alistair23@gmail.com,
	Alistair Francis <alistair.francis@wdc.com>
Subject: [OE][PATCH] openocd: Update libjaylink
Date: Tue, 19 May 2020 15:09:25 -0700
Message-Id: <20200519220925.1447384-1-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update the libjaylink SHA to the latest commit.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 meta-oe/recipes-devtools/openocd/openocd_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/openocd/openocd_git.bb b/meta-oe/recipes-devtools/openocd/openocd_git.bb
index e95f1cfa5..f01b224fa 100644
--- a/meta-oe/recipes-devtools/openocd/openocd_git.bb
+++ b/meta-oe/recipes-devtools/openocd/openocd_git.bb
@@ -16,7 +16,7 @@ SRCREV_FORMAT = "openocd"
 SRCREV_openocd = "ded67990255cc1e63c77832ffd6e6bef9120873d"
 SRCREV_git2cl = "8373c9f74993e218a08819cbcdbab3f3564bbeba"
 SRCREV_jimtcl = "dc4ba7770d580800634f90b67a24e077b4a26d98"
-SRCREV_libjaylink = "cfccbc9d6763733f1d14dff3c2dc5b75aaef136b"
+SRCREV_libjaylink = "3322dfa5e7aa56f5b12b7f2197e3e6b850b7b66e"
 
 PV = "0.10+gitr${SRCPV}"
 S = "${WORKDIR}/git"
-- 
2.26.2

