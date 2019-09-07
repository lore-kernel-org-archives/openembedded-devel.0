Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com
	[209.85.215.169])
	by mail.openembedded.org (Postfix) with ESMTP id D46477F4D4
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  7 Sep 2019 19:41:54 +0000 (UTC)
Received: by mail-pg1-f169.google.com with SMTP id n190so5432601pgn.0
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 07 Sep 2019 12:41:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=VfHKZWUDYW8vTWDC/L60PdkbjJuLYEQpSrEPqAEPouc=;
	b=FCBJBqVZ5Eni8ZDtcUHWtodA4Fm1YCnEZtN924z/6W5WOVQeKwrjb4jzQKYjcaiV9L
	ro5hxvKO7lHpCmpbqZZNreANxaL0qGpy5juZwuvyW2eepyygzA6BkEBro2EqKkGGWu1i
	rTODDHpP701zZSR7mbpAYkCggVgF64qR1/X0T/UcGLnVv1HxTcfxaeIkV+bS8vEpj8BR
	2cCGIJCwbPS/KOD1QlHGGQsBEj4qelyt8xEB7qbXRzZcrtEpTVNQVc1EydD+VdMTn/9H
	71ANAG546QOFOQ6+gIzY8xADq+dxmv3vRrqoKauBJG0jLjs7Ba9nYHavp4ExhuU1NL25
	PwJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=VfHKZWUDYW8vTWDC/L60PdkbjJuLYEQpSrEPqAEPouc=;
	b=KXyTq9ScX46a87KDrtp1mROTgbyAVOwDvOGiWRr6SLwyV8wbYumfaVLGlu7jMQxZBW
	fMq8wdsSgY1EtlL6JpG8AIU7+nGxLXqZIm6Bf7iY/LnOqCyps322q0hiCTAA251bcex3
	UQRH4eDioRhGNmKLyRyUI5LSsu+R/lxtBpZlnX4Fp3mYL6zHY2+jRo2RXIH5Z1Hkbhjs
	ErL4BctLMzXDkdYuMbZVQA4XKt3aI2TJ7T+qLV5tUEgwPcNYrZSGPgD3i8EORjRJWqvA
	eDnB9+iiNc8RbymnH+roEvd+9S9uvOK5E/MZrFFIM0VSGAW06pg4Fu3OK93+gglnPI4J
	krUA==
X-Gm-Message-State: APjAAAWrn5FhUVJzwb57O0tEthEsmUWSRJEhxlhYnLJJrNkbGfvO0h2W
	RubznEhEHzUYX5jOjPFkOgdCcto99y0=
X-Google-Smtp-Source: APXvYqydL0pjgLRIeaBOPDHxErtiqlGvWpLITMQdd/QP/8tg/uB9BC8gATaCTIxqEKUXcbEtcCAiPw==
X-Received: by 2002:a17:90a:fa3:: with SMTP id
	32mr16930982pjz.35.1567885315553; 
	Sat, 07 Sep 2019 12:41:55 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net (c-73-71-176-3.hsd1.ca.comcast.net.
	[73.71.176.3])
	by smtp.gmail.com with ESMTPSA id j1sm9364631pgl.12.2019.09.07.12.41.54
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 07 Sep 2019 12:41:55 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  7 Sep 2019 12:41:45 -0700
Message-Id: <20190907194145.35720-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190907194145.35720-1-raj.khem@gmail.com>
References: <20190907194145.35720-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH V2 2/2] vboxguestdrivers, can-isotp, bpftool: Add to Blacklist
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
X-List-Received-Date: Sat, 07 Sep 2019 19:41:55 -0000
Content-Transfer-Encoding: 8bit

They need forward porting to kernel 5.2+

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Drop from packagegroups and squash vboxguestdrivers change

 meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb  | 6 +++---
 meta-oe/recipes-extended/socketcan/can-isotp_git.bb         | 2 ++
 meta-oe/recipes-kernel/bpftool/bpftool.bb                   | 1 +
 .../vboxguestdrivers/vboxguestdrivers_5.2.22.bb             | 3 +++
 4 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index 84a0df1d25..5bb0beb7a3 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -138,7 +138,7 @@ RDEPENDS_packagegroup-meta-oe-extended ="\
     p7zip p8platform libfile-fnmatch-perl \
     rarpd redis rrdtool libfastjson librelp rsyslog sanlock \
     sblim-cmpi-devel sblim-sfc-common sblim-sfcc \
-    scsirastools sgpio smartmontools snappy can-isotp \
+    scsirastools sgpio smartmontools snappy \
     can-utils libsocketcan tipcutils tiptop \
     tmux uml-utilities upm vlock volume-key wipe zlog zram \
     ${@bb.utils.contains("DISTRO_FEATURES", "x11 wayland opengl", "boinc-client", "", d)} \
@@ -181,10 +181,10 @@ RDEPENDS_packagegroup-meta-oe-graphics ="\
     "
 
 RDEPENDS_packagegroup-meta-oe-kernel ="\
-    agent-proxy bpftool broadcom-bt-firmware cpupower \
+    agent-proxy broadcom-bt-firmware cpupower \
     crash ipmitool minicoredumper oprofile \
     "
-RDEPENDS_packagegroup-meta-oe-kernel_remove_libc-musl = "bpftool crash minicoredumper"
+RDEPENDS_packagegroup-meta-oe-kernel_remove_libc-musl = "crash minicoredumper"
 
 RDEPENDS_packagegroup-meta-oe-kernel_remove_mips64 = "crash"
 RDEPENDS_packagegroup-meta-oe-kernel_remove_mips64el = "crash"
diff --git a/meta-oe/recipes-extended/socketcan/can-isotp_git.bb b/meta-oe/recipes-extended/socketcan/can-isotp_git.bb
index 5df44f21f4..e40e1cd263 100644
--- a/meta-oe/recipes-extended/socketcan/can-isotp_git.bb
+++ b/meta-oe/recipes-extended/socketcan/can-isotp_git.bb
@@ -10,3 +10,5 @@ S = "${WORKDIR}/git"
 inherit module
 
 EXTRA_OEMAKE += "KERNELDIR=${STAGING_KERNEL_DIR}"
+
+PNBLACKLIST[can-isotp] = "Kernel module Needs forward porting to kernel 5.2+"
diff --git a/meta-oe/recipes-kernel/bpftool/bpftool.bb b/meta-oe/recipes-kernel/bpftool/bpftool.bb
index e58bdd4933..6683eccf2d 100644
--- a/meta-oe/recipes-kernel/bpftool/bpftool.bb
+++ b/meta-oe/recipes-kernel/bpftool/bpftool.bb
@@ -32,3 +32,4 @@ python do_package_prepend() {
 }
 
 B = "${WORKDIR}/${BPN}-${PV}"
+PNBLACKLIST[bpftool] = "Needs forward porting to kernel 5.2+"
diff --git a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_5.2.22.bb b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_5.2.22.bb
index e394f34c76..0f8d7af3fa 100644
--- a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_5.2.22.bb
+++ b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_5.2.22.bb
@@ -78,3 +78,6 @@ FILES_${PN} = "${base_sbindir}"
 
 # autoload if installed
 KERNEL_MODULE_AUTOLOAD += "vboxguest vboxsf vboxvideo"
+
+PNBLACKLIST[vboxguestdrivers] = "Needs forward porting to kernel 5.2+"
+
-- 
2.23.0


