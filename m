Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.10058.1603702953401735466
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 26 Oct 2020 02:02:33 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=55296 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kWyOY-0003YJ-L6; Mon, 26 Oct 2020 11:02:28 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/5] python3-psutil: Upgrade 5.7.2 -> 5.7.3
Date: Mon, 26 Oct 2020 11:02:13 +0200
Message-Id: <20201026090217.21174-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
X-OutGoing-Spam-Status: No, score=-0.2
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - voyager.icnhost.net
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - konsulko.com
X-Get-Message-Sender-Via: voyager.icnhost.net: authenticated_id: leon@anavi.org
X-Authenticated-Sender: voyager.icnhost.net: leon@anavi.org
X-Source: 
X-Source-Args: 
X-Source-Dir: 

Upgrade to release 5.7.3:

- [FreeBSD] add support for Process.rlimit().
- [BSD] add support for Process.environ()
- [UNIX] net_if_stats()'s isup also checks whether the NIC is
  running (meaning Wi-Fi or ethernet cable is connected)
- [Linux] improved battery detection and charge "secsleft"
  calculation
- [Linux] physical cpu_count() result is incorrect on systems with
  more than one CPU socket
- [macOS] Process.exe() may raise FileNotFoundError if process is
  still alive but the exe file which launched it got deleted
- [macOS] fix missing include for getpagesize()
- [Windows] Process.open_files() may cause a segfault due to a
  NULL pointer
- [Linux] sensors_battery(): if percent can be determined but not
  the remaining values, still return a result instead of None.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-psutil_5.7.2.bb => python3-psutil_5.7.3.bb}     | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-psutil_5.7.2.bb => python3-psutil_5.7.3.bb} (64%)

diff --git a/meta-python/recipes-devtools/python/python3-psutil_5.7.2.bb b/meta-python/recipes-devtools/python/python3-psutil_5.7.3.bb
similarity index 64%
rename from meta-python/recipes-devtools/python/python3-psutil_5.7.2.bb
rename to meta-python/recipes-devtools/python/python3-psutil_5.7.3.bb
index d61d501e9c..2f927d2da2 100644
--- a/meta-python/recipes-devtools/python/python3-psutil_5.7.2.bb
+++ b/meta-python/recipes-devtools/python/python3-psutil_5.7.3.bb
@@ -2,9 +2,8 @@ SUMMARY = "A cross-platform process and system utilities module for Python"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=e35fd9f271d19d5f742f20a9d1f8bb8b"
 
-PYPI_SRC_URI = "https://files.pythonhosted.org/packages/aa/3e/d18f2c04cf2b528e18515999b0c8e698c136db78f62df34eee89cee205f1/psutil-${PV}.tar.gz"
-SRC_URI[md5sum] = "50bf39b4faa268ba1da8a9730bb38bb6"
-SRC_URI[sha256sum] = "90990af1c3c67195c44c9a889184f84f5b2320dce3ee3acbd054e3ba0b4a7beb"
+SRC_URI[md5sum] = "b07a067e6a930608235f4e5d9b1f90f5"
+SRC_URI[sha256sum] = "af73f7bcebdc538eda9cc81d19db1db7bf26f103f91081d780bbacfcb620dee2"
 
 inherit pypi setuptools3
 
-- 
2.17.1

