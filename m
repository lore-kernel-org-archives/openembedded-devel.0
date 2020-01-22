Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com
	[209.85.215.180])
	by mail.openembedded.org (Postfix) with ESMTP id DED667FDA2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Jan 2020 23:08:13 +0000 (UTC)
Received: by mail-pg1-f180.google.com with SMTP id k25so317659pgt.7
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Jan 2020 15:08:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=izjL6gp/+SNaEqCkbyYmfXylzdnYVNNiUAXVk1oFux4=;
	b=P4zFHnb7NC/luL3l/g4M3C4adtoR7bczxRd8hBps8rmuSWBbN/6NXpN27zLeRN+nR8
	nALd9RgKFuWT0CiEBMCYOLejsqwL41eN84chFOeVcxobahXpUAjxfXLZrg2OHzROiGue
	yV6gMDZKosOqiV+r9rupa4q9ksWY81rZGp4z3PDQzaivDJos1i7jxHuy04f6A/ONwLPw
	UEjZJHTS9ZIyUdvhWZcLl3qhbucR3uvXpGwhqdK8RRi2Pai/fIpvSxXqw3h2lmqLayDW
	cxz9GxtaBzUNOKgNvI6JCtH67ihMEeKVlAB1xfBbWsaalX4lpCQuAhtIP9mQGBTpzX5n
	sLxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=izjL6gp/+SNaEqCkbyYmfXylzdnYVNNiUAXVk1oFux4=;
	b=W3bpt+Vmu0l3eBRjvldLhOn8l3wvasi6TsIZFuNCbNcuCWPPZ9ISvfnYmAk9wTCmOD
	1zGz3Q08lGW8wTXtsFKT+Na/LzRNcqKPqJBqdEu/YGSYoTD90eRqgnhQBAddmkbfTCjp
	CQwrJlwVAegqnQ5KN03FaZ+qWROt2z2gN56NVwQv+Kay65QDTuQptZbD2y95Ao2mYLlS
	p+83F2dSfRFo042qMtUAvKEK/yCA8huhl85m/YwXwgcOCJSLGSBnT83EwwnTV5pgIKHV
	tF7hAy90dgVCwYyqlf8vgG3Z1Iq5oZsJWQ3ibcSfyL+6BkfiPpwmmC1RJ7kDGWCRTAsu
	2NMA==
X-Gm-Message-State: APjAAAWQaCI4u4EJy7LTukkRqAUAb2k5ipDnae9cLNpeUR/f68GlqD41
	6E/7WCgDwnos+wI7Qr3K8/dieEWhMGg=
X-Google-Smtp-Source: APXvYqwEsSF2ERZGonBqCXSIMLKMoQfPPeueHQUs5j7ReY5vXL7batQspgGLLhvHOe002NjvbGlfMg==
X-Received: by 2002:a62:1d87:: with SMTP id d129mr4714834pfd.87.1579734494361; 
	Wed, 22 Jan 2020 15:08:14 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::cab1])
	by smtp.gmail.com with ESMTPSA id z130sm136892pgz.6.2020.01.22.15.08.13
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 22 Jan 2020 15:08:13 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 22 Jan 2020 15:08:12 -0800
Message-Id: <20200122230812.2223255-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200122230812.2223255-1-raj.khem@gmail.com>
References: <20200122230812.2223255-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-python][PATCH 3/3] gateone: Delete, moved to meta-python2
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
X-List-Received-Date: Wed, 22 Jan 2020 23:08:14 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../gateone/gateone_git.bb                    | 85 -------------------
 1 file changed, 85 deletions(-)
 delete mode 100644 meta-python/recipes-connectivity/gateone/gateone_git.bb

diff --git a/meta-python/recipes-connectivity/gateone/gateone_git.bb b/meta-python/recipes-connectivity/gateone/gateone_git.bb
deleted file mode 100644
index 37d3564521..0000000000
--- a/meta-python/recipes-connectivity/gateone/gateone_git.bb
+++ /dev/null
@@ -1,85 +0,0 @@
-SUMMARY = "HTML5 (plugin-free) web-based terminal emulator and SSH client"
-LICENSE = "AGPL-3.0"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=834cbc6995db88433db17cdf8953a428"
-HOMEPAGE = "http://liftoffsoftware.com/Products/GateOne"
-
-PV = "1.2+git${SRCPV}"
-SRCREV = "f7a9be46cb90f57459ebd363d24702de0e651034"
-SRC_URI = "git://github.com/liftoff/GateOne.git;branch=master \
-           file://gateone-avahi.service \
-           file://80oe.conf.in \
-           file://gateone.service.in \
-           file://gateone-init.in \
-"
-
-S = "${WORKDIR}/git"
-
-inherit setuptools3 python3-dir systemd update-rc.d
-
-DISTUTILS_INSTALL_ARGS += " \
-    --install-data=${PYTHON_SITEPACKAGES_DIR} \
-    --install-scripts=${bindir} \
-    --skip_init_scripts"
-
-do_install_append() {
-
-    # fix up hardcoded paths
-    for file in gateone.service gateone-init 80oe.conf; do
-        sed -e s:@bindir@:${bindir}:g \
-            -e s:@localstate@:${localstatedir}:g \
-            < ${WORKDIR}/$file.in \
-            > ${WORKDIR}/$file
-    done
-
-    install -d ${D}${systemd_unitdir}/system
-    install -m 0644 ${WORKDIR}/gateone.service ${D}${systemd_unitdir}/system
-
-    install -d ${D}${sysconfdir}/init.d
-    install -m 0755 ${WORKDIR}/gateone-init ${D}${sysconfdir}/init.d/gateone
-
-    install -m 0755 -d ${D}${sysconfdir}/avahi/services/
-    install -m 0644 ${WORKDIR}/gateone-avahi.service ${D}${sysconfdir}/avahi/services/
-
-    install -m 0755 -d ${D}${sysconfdir}/gateone/conf.d/
-    install -m 0644 ${WORKDIR}/80oe.conf ${D}${sysconfdir}/gateone/conf.d/80oe.conf
-
-    install -d ${D}${localstatedir}/lib/gateone
-}
-
-FILES_${PN} = "${localstatedir}/lib ${bindir} ${base_libdir} ${sysconfdir} ${PYTHON_SITEPACKAGES_DIR}"
-RDEPENDS_${PN} = "mime-support \
-                  openssh-ssh \
-                  python-compression \
-                  python-contextlib \
-                  python-crypt \
-                  python-datetime \
-                  python-email \
-                  python-fcntl \
-                  python-futures \
-                  python-html \
-                  python-imaging \
-                  python-io \
-                  python-json \
-                  python-logging \
-                  python-misc \
-                  python-multiprocessing \
-                  python-netclient \
-                  python-pkgutil \
-                  python-pyopenssl \
-                  python-re \
-                  python-setuptools \
-                  python-shell \
-                  python-simplejson \
-                  python-subprocess \
-                  python-syslog \
-                  python-terminal \
-                  python-textutils \
-                  python-tornado \
-                  python-unixadmin \
-                  python-xml \
-                  python-html5lib \
-                  bash \
-"
-
-SYSTEMD_SERVICE_${PN} = "gateone.service"
-INITSCRIPT_NAME = "gateone"
-- 
2.25.0


