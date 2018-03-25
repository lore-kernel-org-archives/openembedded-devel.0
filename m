Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr0-f173.google.com (mail-wr0-f173.google.com
	[209.85.128.173])
	by mail.openembedded.org (Postfix) with ESMTP id AD4C57860F
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Mar 2018 12:35:32 +0000 (UTC)
Received: by mail-wr0-f173.google.com with SMTP id p53so8708410wrc.10
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Mar 2018 05:35:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=nu1KYdXEmqrgNznVf7TxjTpZzKtZAf8PhFPgUGVcgoA=;
	b=WsddjHYLrSBb0y9PL9ncSv2V3X+0u8rj2Q1UT753tR3+egqkf5TJ+uI4x08DVVsZ6t
	tcWTCFcGDIXZ7zjUJ88U/iucnbMCOIvBrOo65KGhygiN7o8JRdLS2qncNId+YXU8LeEs
	1LAUV2oqHnibxto+YvTEf3sfybZc3WNNx2pf0VlqDmgSsYJXHcLtrXHlz6lM/oIIu+Lw
	BjGxDNaWLi9qLFVfMVMWAI1te/Pv9mxSWyi0190rBOk7TSzaNJn/MPbNID1eAV01jtTv
	Et7lEYY4fNoeRaNMCKlb5m7TTZMHZFxR8X1qVxIcCBWaqR9E4buhhfR9smB3Xvndsevq
	HuEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=nu1KYdXEmqrgNznVf7TxjTpZzKtZAf8PhFPgUGVcgoA=;
	b=Xyruj9L3E6mHj4KAGhP20ll/KNRY3M7k76UXBTehJqs45+sveFSWSawSdh7izZsFzR
	zrQo3xNLpb97u+RTk/qUxFezllGlxv/mCMwzl+JrBoBoKOJK2Jms43wP6+JumWJf3ned
	AOa+ZJRB9sCleqJXuANyIKuu9GF9tAU8nHs9aGom74NyopFVFzb4ZUZ+vRIfymL/sjBo
	CxsYrrIrfkRpMMzJnTlWY3+zF3PHqc1RK2njUFeO/p6AdHoMgMhiESC3m5YP96/ccJgu
	c1lB5leAVv3+th2b1VZJ6F80qUAWb9iiLeK+V5gIVuUaW8o+YcHR/lYD33V8tYxzrid4
	g+Hw==
X-Gm-Message-State: AElRT7GWq8Kpd73bnW02YBIF+kiCHr/KyQmRtRdhNYisAsjlJS1QiwcX
	lPEieQ4CoBW/1QmEfbJdlh/kJw==
X-Google-Smtp-Source: AG47ELt8V3MvfUJnV9qA+rftVq908wem0dNz+4dQ+8YxdOoDo+NmMd9bplfLvVoTBmuAIF3U2Hf/2A==
X-Received: by 10.223.130.194 with SMTP id 60mr23751930wrc.46.1521981333400;
	Sun, 25 Mar 2018 05:35:33 -0700 (PDT)
Received: from PC192-168-2-116.speedport.ip
	(p200300F07BCB3D681E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:f0:7bcb:3d68:1e6f:65ff:fe3e:7f61])
	by smtp.gmail.com with ESMTPSA id
	v23sm11174719wmh.30.2018.03.25.05.35.32
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 25 Mar 2018 05:35:32 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 25 Mar 2018 14:35:01 +0200
Message-Id: <20180325123520.16452-2-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180325123520.16452-1-schnitzeltony@gmail.com>
References: <20180325123520.16452-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 01/20] gtkmm3: add initial 3.22.2
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
X-List-Received-Date: Sun, 25 Mar 2018 12:35:33 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This is gtk3 version of gtkmm. There are no cnflicts with gtkmm for gtk2.

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-oe/recipes-gnome/gtk+/gtkmm3_3.22.2.bb | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 meta-oe/recipes-gnome/gtk+/gtkmm3_3.22.2.bb

diff --git a/meta-oe/recipes-gnome/gtk+/gtkmm3_3.22.2.bb b/meta-oe/recipes-gnome/gtk+/gtkmm3_3.22.2.bb
new file mode 100644
index 000000000..e4bd27e58
--- /dev/null
+++ b/meta-oe/recipes-gnome/gtk+/gtkmm3_3.22.2.bb
@@ -0,0 +1,22 @@
+SUMMARY = "C++ bindings for the GTK+ toolkit V3"
+HOMEPAGE = "http://www.gtkmm.org/"
+SECTION = "libs"
+
+LICENSE = "LGPLv2.1 & GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
+                    file://COPYING.tools;md5=751419260aa954499f7abaabaa882bbe"
+
+DEPENDS = "atkmm pangomm glibmm gtk+3 cairomm"
+
+BPN = "gtkmm"
+
+inherit gnomebase distro_features_check
+
+REQUIRED_DISTRO_FEATURES = "x11"
+
+SRC_URI[archive.md5sum] = "883e9046768b3a5afc8e365988823e77"
+SRC_URI[archive.sha256sum] = "91afd98a31519536f5f397c2d79696e3d53143b80b75778521ca7b48cb280090"
+
+EXTRA_OECONF = " --disable-documentation "
+
+FILES_${PN}-dev += "${libdir}/*/include ${libdir}/*/proc/m4"
-- 
2.14.3


