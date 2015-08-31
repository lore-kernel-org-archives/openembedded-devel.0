Return-Path: <fabio.berton@ossystems.com.br>
Received: from mail-qk0-f179.google.com (mail-qk0-f179.google.com
	[209.85.220.179])
	by mail.openembedded.org (Postfix) with ESMTP id 233C376F58
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 31 Aug 2015 19:08:40 +0000 (UTC)
Received: by qkbp67 with SMTP id p67so12053797qkb.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 31 Aug 2015 12:08:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=WGL1Xzg7pbPMPVSIggm3IT+G/JjW4zLkJ2agS69NWzY=;
	b=flTagtENNt0ec5oev58f/uMd7uq6/jaBOKt/4dMspuFFRDop1JWZaHekaBJGAPMieH
	DNGMcesY+pvzRJqTdSBve8G3pComQ3vAnNPJN4a20K/hdIifrdE2edk4kFHvpTEAcHBh
	igB/WFzJADRtVHAbFLsJ8eTpuNeeudc1wB1Gm3soq55vKZiXIEhjmkBoGFsNCHtLZSuj
	BZmNkhymEdoRDpvQSIFKQV6/CmISlChSPbCD7WIC0+eFstnc9zn6I2/c19JR22+9QNae
	Ef078Op7rd7V+rLna0Bv3dieRd8WlfX4WXfCksAQf4H0TYW47jxbIBbT1DMcb830Z2mg
	4bRA==
X-Gm-Message-State: ALoCoQk03khbVDu78pZ4AeApsYyiZokLKfuZUEF6+kHwGneDXShW/egN3MbmLwiqUWA4Qj1pDuUV
X-Received: by 10.129.99.6 with SMTP id x6mr22329355ywb.66.1441048120032;
	Mon, 31 Aug 2015 12:08:40 -0700 (PDT)
Received: from localhost.localdomain ([177.220.212.62])
	by smtp.gmail.com with ESMTPSA id
	x2sm15040031ywe.32.2015.08.31.12.08.38
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 31 Aug 2015 12:08:39 -0700 (PDT)
From: Fabio Berton <fabio.berton@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 31 Aug 2015 16:08:25 -0300
Message-Id: <1441048105-6440-2-git-send-email-fabio.berton@ossystems.com.br>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1441048105-6440-1-git-send-email-fabio.berton@ossystems.com.br>
References: <1441048105-6440-1-git-send-email-fabio.berton@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: Fabio Berton <fabio.berton@ossystems.com.br>
Subject: [meta-oe][PATCH] python-pyroute2: Add recipe
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 31 Aug 2015 19:08:42 -0000

Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
---
 .../import-simplejson-as-json.patch                | 26 ++++++++++++++++++++++
 .../python/python-pyroute2_0.3.12.bb               | 14 ++++++++++++
 2 files changed, 40 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-pyroute2/import-simplejson-as-json.patch
 create mode 100644 meta-python/recipes-devtools/python/python-pyroute2_0.3.12.bb

diff --git a/meta-python/recipes-devtools/python/python-pyroute2/import-simplejson-as-json.patch b/meta-python/recipes-devtools/python/python-pyroute2/import-simplejson-as-json.patch
new file mode 100644
index 0000000..d73da07
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-pyroute2/import-simplejson-as-json.patch
@@ -0,0 +1,26 @@
+Upstream-Status: Inappropriate [wrong dependency]
+
+Subject: [PATCH] import simplejson as json
+
+At runtime python-pyroute2 tries to import json, but the module is not 
+available, import simplejson as json solve the issue.
+
+Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
+---
+ pyroute2/netlink/rtnl/ifinfmsg.py | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/pyroute2/netlink/rtnl/ifinfmsg.py b/pyroute2/netlink/rtnl/ifinfmsg.py
+index 4f14f25..55643eb 100644
+--- a/pyroute2/netlink/rtnl/ifinfmsg.py
++++ b/pyroute2/netlink/rtnl/ifinfmsg.py
+@@ -1,5 +1,5 @@
+ import os
+-import json
++import simplejson as json
+ import errno
+ import select
+ import struct
+-- 
+2.1.4
+
diff --git a/meta-python/recipes-devtools/python/python-pyroute2_0.3.12.bb b/meta-python/recipes-devtools/python/python-pyroute2_0.3.12.bb
new file mode 100644
index 0000000..d809d97
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-pyroute2_0.3.12.bb
@@ -0,0 +1,14 @@
+DESCRIPTION = "A pure Python netlink and Linux network configuration library"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://PKG-INFO;md5=270323035ef766597dabd91747c36e3d"
+
+SRC_URI[md5sum] = "5d83ec82acb54ab88c98f0d25d13308b"
+SRC_URI[sha256sum] = "c0e1637a75e099104f14d9e03fd5a698dfcc923a22fbfac4a19bd7e94d1fcaa5"
+
+SRC_URI += "file://import-simplejson-as-json.patch"
+
+inherit pypi
+
+RDEPENDS_${PN} = "python-distutils \
+                  python-simplejson \
+                  "
-- 
2.1.4


