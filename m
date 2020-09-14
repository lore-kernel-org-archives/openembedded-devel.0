Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.56480.1600074270272641168
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 14 Sep 2020 02:04:30 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=52584 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kHkPU-0007z1-17; Mon, 14 Sep 2020 12:04:28 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 02/10] python3-traitlets: Upgrade 5.0.3 -> 5.0.4
Date: Mon, 14 Sep 2020 12:04:11 +0300
Message-Id: <20200914090419.19171-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200914090419.19171-1-leon.anavi@konsulko.com>
References: <20200914090419.19171-1-leon.anavi@konsulko.com>
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

Upgrade to release 5.0.4:

- Support deprecated use of byte-literals for bytes on the
  command-line: ipython kernel --Session.key="b'abc'". The b
  prefix is no longer needed in traitlets 5.0, but is supported
  for backward-compatibility
- Improve output of configuration errors, especially when help
  output would make it hard to find the helpful error message

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...{python3-traitlets_5.0.3.bb => python3-traitlets_5.0.4.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-traitlets_5.0.3.bb => python3-traitlets_5.0.4.bb} (72%)

diff --git a/meta-python/recipes-devtools/python/python3-traitlets_5.0.3.bb b/meta-python/recipes-devtools/python/python3-traitlets_5.0.4.bb
similarity index 72%
rename from meta-python/recipes-devtools/python/python3-traitlets_5.0.3.bb
rename to meta-python/recipes-devtools/python/python3-traitlets_5.0.4.bb
index 02908dea9..194193f63 100644
--- a/meta-python/recipes-devtools/python/python3-traitlets_5.0.3.bb
+++ b/meta-python/recipes-devtools/python/python3-traitlets_5.0.4.bb
@@ -6,8 +6,8 @@ LIC_FILES_CHKSUM = "file://COPYING.md;md5=eec4de4d599518742e54e75954e33b46"
 
 PYPI_PACKAGE = "traitlets"
 
-SRC_URI[md5sum] = "66b76cfffd590c39861bc11c247725a5"
-SRC_URI[sha256sum] = "a2e91709a0330b6c5d497ed470b2feb1ed8da5c9dd807c6daab41f727b9391c9"
+SRC_URI[md5sum] = "592dde72b6b706d09ea624cce9af3cf5"
+SRC_URI[sha256sum] = "86c9351f94f95de9db8a04ad8e892da299a088a64fd283f9f6f18770ae5eae1b"
 
 RDEPENDS_${PN} = "\
     ${PYTHON_PN}-ipython-genutils \
-- 
2.17.1

