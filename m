Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
	[209.85.221.51])
	by mail.openembedded.org (Postfix) with ESMTP id CE1FA7F27C
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 18 Aug 2019 22:33:40 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id j16so6703809wrr.8
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 18 Aug 2019 15:33:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=Tip+npxBWjswQq3ETqHTtdMUl0CUBp0TsAc7u29zi80=;
	b=Tg812Y+0bRRtvTKsynoMAjJBOIg9zN373pscd8Qc7W8vwp7jkgZ/kfFN3ELAbs+r/2
	WyW98jtLiWXgiqnxDMGOqgIBfqudab8Rw40R4Uz6Yg+TPNO77lCuBgc0newpi4mLuQjU
	TYbZ8+ErHCsvSeIb9bRnhV3S5yvqIAhZ/wURIiRR0FiP1r1ckncTkngtI1q1Htpb1vlV
	UFudIPbAqv46tg4ILA8Wi4vwDpfMCa6hLBTj3t3nAtek4mY3J5W/yuTu/Y7NDmAVUqet
	UaPpMthkhwqKGjlohIIQwaQ91nA70sTjr8cEts/1n+1qmRx1EPfJifpbS+++VOwiOfnn
	Fccw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=Tip+npxBWjswQq3ETqHTtdMUl0CUBp0TsAc7u29zi80=;
	b=plQMH6ND8oHzuDhoxgfG7QldJPt92POJT4AcErnL6wDj8aDkMvYFxfmin3cGNqWntT
	uptEb6PXhBkp+afxUr81LiSTE2gltQoqKmXdQvkxGtfIn9p21ewS/PyVVdx8q9SwDP8k
	V7V7KKlO+TxDTeyMZU03EGXmek96RtJCWY/ZEkavRWCmpTS2S3t+gIjWkJUuYpOuuxJd
	6dOi29/RSNQ2GfK0GmrhZ4V6YGxO/5yY4V/5uNau8Wmdbza9QUnO3AdpMdjCMmOvRU2G
	shkJDB27/oMzbW5yF97AnDdlUb3DU4qmHpxenuahTIqJ9UIzvbFN4jqlaaEAjqS2Wfbt
	EN9g==
X-Gm-Message-State: APjAAAXecetp/VWEXCT3oO3fLjeScy1QxjsL6azynZVgY99aVEiwxubk
	Pj4v52xgdlKPaTfyh8qvQh43EJ6e
X-Google-Smtp-Source: APXvYqztS+0N+ruGtVYWy02vXbRxksjCPcntN++mOqe9hdOzthlF83TWoMtrkkIFkqGAElFcQ/KlHg==
X-Received: by 2002:adf:dd88:: with SMTP id x8mr24543527wrl.331.1566167621294; 
	Sun, 18 Aug 2019 15:33:41 -0700 (PDT)
Received: from superandy.speedport.ip
	(p200300F07F2D8718C84C5511B02F056F.dip0.t-ipconnect.de.
	[2003:f0:7f2d:8718:c84c:5511:b02f:56f])
	by smtp.gmail.com with ESMTPSA id
	k124sm30390814wmk.47.2019.08.18.15.33.40
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 18 Aug 2019 15:33:40 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	kai.kang@windriver.com
Date: Mon, 19 Aug 2019 00:33:11 +0200
Message-Id: <20190818223316.19772-6-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190818223316.19772-1-schnitzeltony@gmail.com>
References: <20190818223316.19772-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [meta-xfce][PATCH 05/10] xfce4-netload-plugin: upgrade 1.3.1 -> 1.3.2
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
X-List-Received-Date: Sun, 18 Aug 2019 22:33:41 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* release changed layout and fixed minor bugs
* patch applied with fuzz warning. Looking into showed that it changes
  unrelated parts of code and upstream did change file already in correct way

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 ...ys-sysctl.h-its-unused-on-linux-port.patch | 25 -------------------
 ...1.3.1.bb => xfce4-netload-plugin_1.3.2.bb} | 10 +++-----
 2 files changed, 4 insertions(+), 31 deletions(-)
 delete mode 100644 meta-xfce/recipes-panel-plugins/netload/xfce4-netload-plugin/0001-Do-not-include-sys-sysctl.h-its-unused-on-linux-port.patch
 rename meta-xfce/recipes-panel-plugins/netload/{xfce4-netload-plugin_1.3.1.bb => xfce4-netload-plugin_1.3.2.bb} (42%)

diff --git a/meta-xfce/recipes-panel-plugins/netload/xfce4-netload-plugin/0001-Do-not-include-sys-sysctl.h-its-unused-on-linux-port.patch b/meta-xfce/recipes-panel-plugins/netload/xfce4-netload-plugin/0001-Do-not-include-sys-sysctl.h-its-unused-on-linux-port.patch
deleted file mode 100644
index e35418192..000000000
--- a/meta-xfce/recipes-panel-plugins/netload/xfce4-netload-plugin/0001-Do-not-include-sys-sysctl.h-its-unused-on-linux-port.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-From 7fcc7352ec11644ac8be4e9ec1584a5be3333684 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 12 Jul 2017 18:18:30 -0700
-Subject: [PATCH] Do not include sys/sysctl.h its unused on linux port
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- panel-plugin/os.h | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/panel-plugin/os.h b/panel-plugin/os.h
-index 473c2a4..9a5c544 100644
---- a/panel-plugin/os.h
-+++ b/panel-plugin/os.h
-@@ -170,7 +170,6 @@
- #elif __linux__             /* L I N U X */
- #  include <stdio.h>
- #  include <sys/param.h>
--#  include <sys/sysctl.h>
- #  include <stdlib.h>
- #  include <stdarg.h>
- #  include <unistd.h>
--- 
-2.13.2
-
diff --git a/meta-xfce/recipes-panel-plugins/netload/xfce4-netload-plugin_1.3.1.bb b/meta-xfce/recipes-panel-plugins/netload/xfce4-netload-plugin_1.3.2.bb
similarity index 42%
rename from meta-xfce/recipes-panel-plugins/netload/xfce4-netload-plugin_1.3.1.bb
rename to meta-xfce/recipes-panel-plugins/netload/xfce4-netload-plugin_1.3.2.bb
index 35c8861bc..13e7b1db7 100644
--- a/meta-xfce/recipes-panel-plugins/netload/xfce4-netload-plugin_1.3.1.bb
+++ b/meta-xfce/recipes-panel-plugins/netload/xfce4-netload-plugin_1.3.2.bb
@@ -1,12 +1,10 @@
 SUMMARY = "Panel plugin displaying current load of the network interfaces"
-HOMEPAGE = "http://goodies.xfce.org/projects/panel-plugins/xfce4-netload-plugin"
+HOMEPAGE = "https://goodies.xfce.org/projects/panel-plugins/xfce4-netload-plugin"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=35a7203c41b86d15546dddc05995f97f"
 
 inherit xfce-panel-plugin
 
-SRC_URI = "http://archive.xfce.org/src/panel-plugins/${BPN}/${@'${PV}'[0:3]}/${BPN}-${PV}.tar.bz2 \
-           file://0001-Do-not-include-sys-sysctl.h-its-unused-on-linux-port.patch \
-           "
-SRC_URI[md5sum] = "f25aa3242e3119b49f259a3e4a1af08b"
-SRC_URI[sha256sum] = "99762781099d1e0ab9aa6a7b30c2bd94d8f658dbe61c760410d5d42d0766391c"
+SRC_URI = "http://archive.xfce.org/src/panel-plugins/${BPN}/${@'${PV}'[0:3]}/${BPN}-${PV}.tar.bz2"
+SRC_URI[md5sum] = "ae4652711812a77a58c3dc96650a74dc"
+SRC_URI[sha256sum] = "22e40425cfe1e07b01fe275b1afddc7c788af34d9c2c7e2842166963cb41215d"
-- 
2.21.0


