Return-Path: <fabio.berton@ossystems.com.br>
Received: from mail-qk0-f180.google.com (mail-qk0-f180.google.com
	[209.85.220.180])
	by mail.openembedded.org (Postfix) with ESMTP id B24A676ED5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 31 Aug 2015 19:08:38 +0000 (UTC)
Received: by qkbp67 with SMTP id p67so12052070qkb.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 31 Aug 2015 12:08:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=WGL1Xzg7pbPMPVSIggm3IT+G/JjW4zLkJ2agS69NWzY=;
	b=FXcL2XoFJoMyXAbxESp1RoNSpMT0aBQCuR+b5gw2kb8yvyCHbhpJImvbtM+KpHTudh
	Y30YAwvfBZGEvuZ+NVsw9wdjPmJZuBYmjdhdg2uFbSAfCCClxD1IgKkMQXNab9S2VKrO
	hnhsNERWA1PD/ht7I6PodDQop3RoJsZudlNw9lJUdDdAcV1lxBlXjuGVRYlkpCqMuLwe
	n8f8l1Ik5rtZgUY5ABcKQ4RwwfgY0yqApXdm743TWL0JTrxUmcKsoF/qeyU5Jc0h4Yhg
	4yXvkX65zxo8haMmOV9G1CfINfhHvqSmFFdPLyMs3DZ9bl2la3XrvbwG9zx6kFWhopnV
	UB4Q==
X-Gm-Message-State: ALoCoQnj8wclL7OZlBqwKlPEu+qewCiGNUWW9TvHkGf/h8QPwqwkdTJ8pdCDB8WKCjY7QpCbPYUm
X-Received: by 10.13.229.197 with SMTP id o188mr23513246ywe.30.1441048118289; 
	Mon, 31 Aug 2015 12:08:38 -0700 (PDT)
Received: from localhost.localdomain ([177.220.212.62])
	by smtp.gmail.com with ESMTPSA id
	x2sm15040031ywe.32.2015.08.31.12.08.36
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 31 Aug 2015 12:08:37 -0700 (PDT)
From: Fabio Berton <fabio.berton@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 31 Aug 2015 16:08:24 -0300
Message-Id: <1441048105-6440-1-git-send-email-fabio.berton@ossystems.com.br>
X-Mailer: git-send-email 2.1.4
Cc: Fabio Berton <fabio.berton@ossystems.com.br>
Subject: [meta-python][PATCH] python-pyroute2: Add recipe
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
X-List-Received-Date: Mon, 31 Aug 2015 19:08:39 -0000

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


