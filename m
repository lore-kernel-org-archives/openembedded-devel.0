Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web09.10200.1603702956737508704
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 26 Oct 2020 02:02:37 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=55296 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kWyOd-0003YJ-6a; Mon, 26 Oct 2020 11:02:32 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/5] python3-pyparted: Upgrade 3.11.6 -> 3.11.7
Date: Mon, 26 Oct 2020 11:02:14 +0200
Message-Id: <20201026090217.21174-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201026090217.21174-1-leon.anavi@konsulko.com>
References: <20201026090217.21174-1-leon.anavi@konsulko.com>
X-OutGoing-Spam-Status: No, score=-0.5
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

Upgrade to release 3.11.7:

- Set PY_SSIZE_T_CLEAN for the build
- add nvme support
- Update RELEASE file to make last step be "make pypi"

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...{python3-pyparted_3.11.6.bb => python3-pyparted_3.11.7.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-extended/python-pyparted/{python3-pyparted_3.11.6.bb => python3-pyparted_3.11.7.bb} (83%)

diff --git a/meta-python/recipes-extended/python-pyparted/python3-pyparted_3.11.6.bb b/meta-python/recipes-extended/python-pyparted/python3-pyparted_3.11.7.bb
similarity index 83%
rename from meta-python/recipes-extended/python-pyparted/python3-pyparted_3.11.6.bb
rename to meta-python/recipes-extended/python-pyparted/python3-pyparted_3.11.7.bb
index 63f4933667..8909aa11f4 100644
--- a/meta-python/recipes-extended/python-pyparted/python3-pyparted_3.11.6.bb
+++ b/meta-python/recipes-extended/python-pyparted/python3-pyparted_3.11.7.bb
@@ -9,8 +9,8 @@ LIC_FILES_CHKSUM = "\
     file://src/_pedmodule.c;beginline=10;endline=22;md5=9e53304db812b80d0939e11bb69dcab2 \
 "
 
-SRC_URI[md5sum] = "b85dcaecc3106eb6e9a117270b09615e"
-SRC_URI[sha256sum] = "727ccdf308c194069aa9797f7a6a973bc95b2e407cdf5d58d6c8bc4c9dec92dc"
+SRC_URI[md5sum] = "69284f943982f54ded76960c92098a02"
+SRC_URI[sha256sum] = "61cde7b096bccd69ddc75c85b17f8baed45c3687d404706d91403a319453b903"
 
 inherit pypi distutils3
 
-- 
2.17.1

