Return-Path: <Yi.Zhao@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7707A719C1
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  1 Nov 2016 09:23:23 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id uA19NOfj003051
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 1 Nov 2016 02:23:24 -0700 (PDT)
Received: from localhost (128.224.162.198) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.294.0;
	Tue, 1 Nov 2016 02:23:22 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 1 Nov 2016 17:23:03 +0800
Message-ID: <f40e6a78fb140a0d8fe0bbfc756cc23221ccfc1f.1477991825.git.yi.zhao@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1477991825.git.yi.zhao@windriver.com>
References: <cover.1477991825.git.yi.zhao@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.198]
Subject: [meta-networking][PATCH 4/6] tsocks: fix QA warning for GNU_HASH
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
X-List-Received-Date: Tue, 01 Nov 2016 09:23:23 -0000
Content-Type: text/plain

Add LDFLAGS variable to Makefile.in so that extra linker flags can be sent
via this variable.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../tsocks/tsocks/makefile-add-ldflags.patch          | 19 +++++++++++++++++++
 .../recipes-protocols/tsocks/tsocks_1.8beta5.bb       |  4 +++-
 2 files changed, 22 insertions(+), 1 deletion(-)
 create mode 100644 meta-networking/recipes-protocols/tsocks/tsocks/makefile-add-ldflags.patch

diff --git a/meta-networking/recipes-protocols/tsocks/tsocks/makefile-add-ldflags.patch b/meta-networking/recipes-protocols/tsocks/tsocks/makefile-add-ldflags.patch
new file mode 100644
index 0000000..2146418
--- /dev/null
+++ b/meta-networking/recipes-protocols/tsocks/tsocks/makefile-add-ldflags.patch
@@ -0,0 +1,19 @@
+Add LDFLAGS variable to Makefile.in, make sure the extra linker flags can be passed.
+
+Upstream-Status: Pending
+
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+
+diff --git a/Makefile.in b/Makefile.in
+index cad6706..0ed55c5 100644
+--- a/Makefile.in
++++ b/Makefile.in
+@@ -50,7 +50,7 @@ ${SAVE}: ${SAVE}.c
+ 	${SHCC} ${CFLAGS} ${INCLUDES} -static -o ${SAVE} ${SAVE}.c
+ 
+ ${SHLIB}: ${OBJS} ${COMMON}.o ${PARSER}.o
+-	${SHCC} ${CFLAGS} ${INCLUDES} -nostdlib -shared -o ${SHLIB} ${OBJS} ${COMMON}.o ${PARSER}.o ${DYNLIB_FLAGS} ${SPECIALLIBS} ${LIBS}
++	${SHCC} ${CFLAGS} ${LDFLAGS} ${INCLUDES} -nostdlib -shared -o ${SHLIB} ${OBJS} ${COMMON}.o ${PARSER}.o ${DYNLIB_FLAGS} ${SPECIALLIBS} ${LIBS}
+ 	ln -sf ${SHLIB} ${LIB_NAME}.so
+ 
+ %.so: %.c
diff --git a/meta-networking/recipes-protocols/tsocks/tsocks_1.8beta5.bb b/meta-networking/recipes-protocols/tsocks/tsocks_1.8beta5.bb
index b3a9620..22287ce 100644
--- a/meta-networking/recipes-protocols/tsocks/tsocks_1.8beta5.bb
+++ b/meta-networking/recipes-protocols/tsocks/tsocks_1.8beta5.bb
@@ -9,7 +9,9 @@ SECTION = "net"
 LICENSE = "GPL-2.0"
 LIC_FILES_CHKSUM = "file://COPYING;md5=18810669f13b87348459e611d31ab760"
 
-SRC_URI = "http://downloads.sourceforge.net/tsocks/tsocks-${PV}.tar.gz"
+SRC_URI = "http://downloads.sourceforge.net/tsocks/tsocks-${PV}.tar.gz \
+           file://makefile-add-ldflags.patch \
+          "
 
 SRC_URI[md5sum] = "51caefd77e5d440d0bbd6443db4fc0f8"
 SRC_URI[sha256sum] = "849d7ef5af80d03e76cc05ed9fb8fa2bcc2b724b51ebfd1b6be11c7863f5b347"
-- 
2.7.4


