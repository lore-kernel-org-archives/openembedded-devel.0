Return-Path: <Yi.Zhao@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id D7AB5719C1
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  1 Nov 2016 09:23:18 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id uA19NJIF025884
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 1 Nov 2016 02:23:20 -0700
Received: from localhost (128.224.162.198) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.294.0;
	Tue, 1 Nov 2016 02:23:19 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 1 Nov 2016 17:23:02 +0800
Message-ID: <85f49851d91fe5994321541d42734e8ea51423a7.1477991825.git.yi.zhao@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1477991825.git.yi.zhao@windriver.com>
References: <cover.1477991825.git.yi.zhao@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.198]
Subject: [meta-networking][PATCH 3/6] zeroconf: fix QA warning for GNU_HASH
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 01 Nov 2016 09:23:19 -0000
Content-Type: text/plain

Add LDFLAGS variable to Makefile so that extra linker flags can be sent
via this variable.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../zeroconf/zeroconf/makefile-add-ldflags.patch      | 19 +++++++++++++++++++
 .../recipes-protocols/zeroconf/zeroconf_0.9.bb        |  1 +
 2 files changed, 20 insertions(+)
 create mode 100644 meta-networking/recipes-protocols/zeroconf/zeroconf/makefile-add-ldflags.patch

diff --git a/meta-networking/recipes-protocols/zeroconf/zeroconf/makefile-add-ldflags.patch b/meta-networking/recipes-protocols/zeroconf/zeroconf/makefile-add-ldflags.patch
new file mode 100644
index 0000000..c5a4414
--- /dev/null
+++ b/meta-networking/recipes-protocols/zeroconf/zeroconf/makefile-add-ldflags.patch
@@ -0,0 +1,19 @@
+Add LDFLAGS variable to Makefile, make sure the extra linker flags can be passed.
+
+Upstream-Status: Pending
+
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+
+diff --git a/Makefile b/Makefile
+index 77f3364..c98083f 100644
+--- a/Makefile
++++ b/Makefile
+@@ -18,7 +18,7 @@ clean:
+ 
+ zeroconf: zeroconf.o delay.o
+ 	$(Q)echo "Creating $@"
+-	$(Q)$(CC) $(CFLAGS) -o $@ $^ $(LIBS)
++	$(Q)$(CC) $(CFLAGS) ${LDFLAGS} -o $@ $^ $(LIBS)
+ 
+ 
+ # Automatic dependency generation
diff --git a/meta-networking/recipes-protocols/zeroconf/zeroconf_0.9.bb b/meta-networking/recipes-protocols/zeroconf/zeroconf_0.9.bb
index 9307263..13f9b9b 100644
--- a/meta-networking/recipes-protocols/zeroconf/zeroconf_0.9.bb
+++ b/meta-networking/recipes-protocols/zeroconf/zeroconf_0.9.bb
@@ -18,6 +18,7 @@ PR = "r1"
 
 SRC_URI = "http://www.progsoc.org/~wildfire/zeroconf/download/${BPN}-${PV}.tar.gz \
            file://compilefix.patch \
+           file://makefile-add-ldflags.patch \
            file://zeroconf-default \
            file://debian-zeroconf"
 
-- 
2.7.4


