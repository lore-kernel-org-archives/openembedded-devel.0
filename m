Return-Path: <ticotimo@gmail.com>
Received: from mail-pd0-f177.google.com (mail-pd0-f177.google.com
	[209.85.192.177])
	by mail.openembedded.org (Postfix) with ESMTP id E244F6A362
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Oct 2014 05:02:26 +0000 (UTC)
Received: by mail-pd0-f177.google.com with SMTP id v10so5036419pde.36
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 12 Oct 2014 22:02:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=0hgyniUT9Qniah73NXFGxaQZqYS+3/mhkIZd5huG2dw=;
	b=as6n9GBG5sKkaBe5lBRCL+yWIjOYa+Wa+Et+5pa3G5V8o4ci2HuFEvkG77d3m8Qa4O
	L7q4FDntvb1j4atHTzF5/rvsXiDN+YN1P6vRdoZjlWSlNad3Rc2hcWocT4mie7A0cj0Y
	rRa+qnvxgI9FdnfHcxCekrWxyoMeXuHIRWrmDQ847u/SKqCqcPNcZwl6UjJ6AHgCclOX
	QU0isXNJZvaqjNHNVvkBUnnmfQUgQAKGRvpDe99gErzRnQrzzR7K8Mou2esaz4lwsMlH
	tsBA43ivnbgkF+uWq8qZ9Y9zkyabFcMUi+4YOuAun/1UAoTqZ16V5JGNHux4tR3Pg48f
	Ad3g==
X-Received: by 10.66.179.140 with SMTP id dg12mr21172382pac.76.1413176547640; 
	Sun, 12 Oct 2014 22:02:27 -0700 (PDT)
Received: from localhost.localdomain (75-128-22-150.dhcp.snlo.ca.charter.com.
	[75.128.22.150])
	by mx.google.com with ESMTPSA id ic3sm8985045pbc.26.2014.10.12.22.02.25
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 12 Oct 2014 22:02:26 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <TicoTimo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 12 Oct 2014 22:02:21 -0700
Message-Id: <1413176542-20885-1-git-send-email-TicoTimo@gmail.com>
X-Mailer: git-send-email 1.9.3
Subject: [meta-python][PATCH 1/2] python-pytz: add 2014.7
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
X-List-Received-Date: Mon, 13 Oct 2014 05:02:29 -0000

python-matplotlib is providing its own pytz and dateutil.
Provide our own pytz (and then fix matplotlib).

Signed-off-by: Tim Orling <TicoTimo@gmail.com>
---
 .../recipes-devtools/python/python-pytz_2014.7.bb     | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-pytz_2014.7.bb

diff --git a/meta-python/recipes-devtools/python/python-pytz_2014.7.bb b/meta-python/recipes-devtools/python/python-pytz_2014.7.bb
new file mode 100644
index 0000000..92d0796
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-pytz_2014.7.bb
@@ -0,0 +1,19 @@
+SUMMARY = "World timezone definitions, modern and historical"
+HOMEPAGE = " http://pythonhosted.org/pytz"
+SECTION = "devel/python"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=22b38951eb857cf285a4560a914b7cd6"
+SRCNAME = "pytz"
+
+SRC_URI = "https://pypi.python.org/packages/source/p/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
+S = "${WORKDIR}/${SRCNAME}-${PV}"
+
+inherit setuptools
+
+RDEPENDS_${PN} = "\
+    python-core \
+    python-datetime \
+"
+
+SRC_URI[md5sum] = "8940ddae309e44b593c75a9e05dd2a0b"
+SRC_URI[sha256sum] = "bfc2bd00147e5ecf75399f4a94cb84cc00ce9b511a15f9958bb6c85a455f76eb"
-- 
1.9.3


