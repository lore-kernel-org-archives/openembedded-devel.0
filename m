Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wi0-f178.google.com (mail-wi0-f178.google.com
	[209.85.212.178])
	by mail.openembedded.org (Postfix) with ESMTP id 00FD3766DF
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Aug 2015 15:59:37 +0000 (UTC)
Received: by wicne3 with SMTP id ne3so150053563wic.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Aug 2015 08:59:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=n/3DL8PlHoFOvE9Gs135xL9cuY5FUXcwlQ9nt2IFiPI=;
	b=fUoj5+mIHY+SO/6/oihkbCv0aO9l94JslsITG4SKDeVL3R9iL0kUq/nLGAK57yKMJA
	zVFS5OztRso9nq2gng8C+Qas7Du7sXtykRqGpklcG4eWrSX/Zc8BPJovPtjp+cc1VFfF
	Cu3zPCp36Mvh/B+Qnfv7PvWXjJLAn1wfZoLZX9+FytyUpRdXKw4Ev6i18ECIC7EnYLa2
	qsmBAuIHzkFSWwzLoB5cfwEGvKgwQ78DvVqAgwM9X7pmaWxHnF07IxXKQAXEMRVUoZUp
	TqlZUBr9ONRCfUzMAcSp5VwG09To0Ip9QNFrmFU9v711KEatg/XaZZPDhuES17wthVCb
	NLXA==
X-Gm-Message-State: ALoCoQkCgonPyMDjKS/ACIThuPFfXZt9moyD9HhmpBDfNFgjHerO9nJ2/OvT0cyUXAl44nqOwDpN
X-Received: by 10.180.97.41 with SMTP id dx9mr14640646wib.34.1440086377302;
	Thu, 20 Aug 2015 08:59:37 -0700 (PDT)
Received: from localhost ([2001:610:612:0:beee:7bff:fe9e:ae56])
	by smtp.gmail.com with ESMTPSA id
	fa8sm6714025wib.14.2015.08.20.08.59.36
	(version=TLS1_2 cipher=AES128-SHA256 bits=128/128);
	Thu, 20 Aug 2015 08:59:36 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 20 Aug 2015 17:59:25 +0200
Message-Id: <1440086369-3321-2-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 2.0.1
In-Reply-To: <1440086369-3321-1-git-send-email-koen@dominion.thruhere.net>
References: <1440086369-3321-1-git-send-email-koen@dominion.thruhere.net>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-oe][PATCH 1/5] waf-samba: add new class
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
X-List-Received-Date: Thu, 20 Aug 2015 15:59:39 -0000

From: Bian Naimeng <biannm@cn.fujitsu.com>

waf-samba is a build system used by samba related software

Signed-off-by: Bian Naimeng <biannm@cn.fujitsu.com>
Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta-oe/classes/waf-samba.bbclass | 51 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 51 insertions(+)
 create mode 100644 meta-oe/classes/waf-samba.bbclass

diff --git a/meta-oe/classes/waf-samba.bbclass b/meta-oe/classes/waf-samba.bbclass
new file mode 100644
index 0000000..b8e010a
--- /dev/null
+++ b/meta-oe/classes/waf-samba.bbclass
@@ -0,0 +1,51 @@
+# waf is a build system which is used by samba related project.
+# Obtain details from https://wiki.samba.org/index.php/Waf
+# 
+inherit qemu pythonnative
+
+DEPENDS += "qemu-native libxslt-native docbook-xsl-stylesheets-native python"
+
+CONFIGUREOPTS = " --prefix=${prefix} \
+                  --bindir=${bindir} \
+                  --sbindir=${sbindir} \
+                  --libexecdir=${libexecdir} \
+                  --datadir=${datadir} \
+                  --sysconfdir=${sysconfdir} \
+                  --sharedstatedir=${sharedstatedir} \
+                  --localstatedir=${localstatedir} \
+                  --libdir=${libdir} \
+                  --includedir=${includedir} \
+                  --oldincludedir=${oldincludedir} \
+                  --infodir=${infodir} \
+                  --mandir=${mandir} \
+                "
+
+do_configure() {
+    qemu_binary="${@qemu_target_binary(d)}"
+    if [ ${qemu_binary} == "qemu-allarch" ]; then
+        qemu_binary="qemuwrapper"
+    fi
+
+    libdir_qemu="${STAGING_DIR_HOST}/${libdir}"
+    base_libdir_qemu="${STAGING_DIR_HOST}/${base_libdir}"
+    oldest_kernel_qemu=${OLDEST_KERNEL}
+
+    CROSS_EXEC="${qemu_binary} \
+                -r ${oldest_kernel_qemu} \
+                -L ${STAGING_DIR_HOST} \
+                -E LD_LIBRARY_PATH=${libdir_qemu}:${base_libdir_qemu}"
+
+    export BUILD_SYS=${BUILD_SYS}
+    export HOST_SYS=${HOST_SYS}
+    export BUILD_ARCH=${BUILD_ARCH}
+    export HOST_ARCH=${HOST_ARCH}
+    export STAGING_LIBDIR=${STAGING_LIBDIR}
+    export STAGING_INCDIR=${STAGING_INCDIR}
+    export PYTHONPATH=${STAGING_DIR_HOST}${PYTHON_SITEPACKAGES_DIR}
+
+    ./configure ${CONFIGUREOPTS} ${EXTRA_OECONF} --cross-compile --cross-execute="${CROSS_EXEC}" --cross-answers=${B}/cross-answers-${TARGET_ARCH}.txt
+}
+
+do_install() {
+    oe_runmake install DESTDIR=${D}
+}
-- 
2.0.1


