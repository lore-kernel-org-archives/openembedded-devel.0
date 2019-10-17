Return-Path: <fabio.berton@ossystems.com.br>
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com
	[209.85.160.169])
	by mail.openembedded.org (Postfix) with ESMTP id C3E7D7F577
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Oct 2019 14:14:58 +0000 (UTC)
Received: by mail-qt1-f169.google.com with SMTP id n17so3793682qtr.4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Oct 2019 07:15:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:mime-version:organization
	:content-transfer-encoding;
	bh=Ql3htMBwXIUk/Nu7Y0lIPPXIMVffHOn8p/tcVb6LgUg=;
	b=YsRXbumVvbw0Lm1dX+u2Pf5KexzGHaWezkVDSNw36Ls+/6X/goqsIAJEcPX3Vk2/bd
	8dDDVy6hig4HBMkXH1baYXDocs50VgwWpfyDRBOPQ1d05rEbmr1GOdN8jw1acDeOaKxi
	kRH52aV+7/+pfc46n4+gxnxFLTVlABUZR7kFRNdEE6qetrF0tjVPo7qsgdYgkYdb1+re
	YCeBHbhUxT3859i46qHf3HzPiVNpVDoqYZwdfn6hkU9Azn1xwiT4f3eu9413w1aHtDSo
	txQOHSYM4O/Yf9e4AXciZOcXjsCIsXpXtW0dUk2xX4MgwgYV76LlaaGrCxOihlRA3iB4
	8N9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:organization:content-transfer-encoding;
	bh=Ql3htMBwXIUk/Nu7Y0lIPPXIMVffHOn8p/tcVb6LgUg=;
	b=BCnHGcZtVwc/LdIue3Q54ZTFE5NxGzlrN+fA6mKO/EFgPqQEH7wn0ULJUPgvdxUTIt
	3No6nhyXLusVrNu/t8xrzJti993N/xWbe2we4CLeuDBD+jqGbcBlqzQP+mMOG2R7ckSk
	+DpR1Q1l/Y/GELa0cfpqP+qtI0f8uO79NO+UbTDpLuX3SJJvSJndI3O1iC/savdZ1lqQ
	3Yfl0txVl3RVqeM649EZiHVEaZCTFGRlY3VstF1dxzPEi7sBZeLh9qdWCQL/pKuW94Xv
	GwAGN5AfapGyjnAt16Omm1SBCZZB9pGq+Y+OdP/MW9MNHxAhVylYX8LhaHDNrTuOFatd
	R82Q==
X-Gm-Message-State: APjAAAWaKobcFJfKNONtnb3VYI34wMYRfcnwSMD96g2y4va/Bk7v9c00
	L3IkEiZbrqjWMRsTDwGnNbhBI2QmtComog==
X-Google-Smtp-Source: APXvYqymi1L1jcIRW4vXTKEYo5fGoMGCrQ5sYTpYXK1XCpfjWjF8c95enkfZz7fjUYmJsF3ytQcmRw==
X-Received: by 2002:ad4:524b:: with SMTP id s11mr3958045qvq.112.1571321699295; 
	Thu, 17 Oct 2019 07:14:59 -0700 (PDT)
Received: from centrium.lab.ossystems ([181.220.83.67])
	by smtp.gmail.com with ESMTPSA id
	p53sm2156619qtk.23.2019.10.17.07.14.57
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 17 Oct 2019 07:14:58 -0700 (PDT)
From: Fabio Berton <fabio.berton@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 17 Oct 2019 11:14:45 -0300
Message-Id: <20191017141445.6944-1-fabio.berton@ossystems.com.br>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Organization: O.S. Systems Software LTDA.
Subject: [meta-oe][PATCH] ifplugd: Add recipe for version 0.28
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
X-List-Received-Date: Thu, 17 Oct 2019 14:14:59 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
---
 .../ifplugd/ifplugd/Fix-build-with-musl.patch | 31 +++++++++++++++++++
 .../ifplugd/ifplugd_0.28.bb                   | 25 +++++++++++++++
 2 files changed, 56 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/ifplugd/ifplugd/Fix-build-with-musl.patch
 create mode 100644 meta-oe/recipes-connectivity/ifplugd/ifplugd_0.28.bb

diff --git a/meta-oe/recipes-connectivity/ifplugd/ifplugd/Fix-build-with-musl.patch b/meta-oe/recipes-connectivity/ifplugd/ifplugd/Fix-build-with-musl.patch
new file mode 100644
index 000000000..4bd40606b
--- /dev/null
+++ b/meta-oe/recipes-connectivity/ifplugd/ifplugd/Fix-build-with-musl.patch
@@ -0,0 +1,31 @@
+From 3f2fc79385398f213a9bd3c99616d749d699f2bb Mon Sep 17 00:00:00 2001
+From: Fabio Berton <fabio.berton@ossystems.com.br>
+Date: Thu, 14 Mar 2019 19:26:14 -0300
+Subject: [PATCH] Fix build with musl
+Organization: O.S. Systems Software LTDA.
+
+Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
+---
+ src/ethtool-local.h | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/src/ethtool-local.h b/src/ethtool-local.h
+index 200476b..0edc7a9 100644
+--- a/src/ethtool-local.h
++++ b/src/ethtool-local.h
+@@ -22,9 +22,9 @@
+  */
+ 
+ typedef unsigned long long u64;
+-typedef __uint32_t u32;        
+-typedef __uint16_t u16;        
+-typedef __uint8_t u8;          
++typedef uint32_t u32;
++typedef uint16_t u16;
++typedef uint8_t u8;
+ 
+ #include "ethtool-kernel.h"
+ 
+-- 
+2.20.1
+
diff --git a/meta-oe/recipes-connectivity/ifplugd/ifplugd_0.28.bb b/meta-oe/recipes-connectivity/ifplugd/ifplugd_0.28.bb
new file mode 100644
index 000000000..0b5c5a6ce
--- /dev/null
+++ b/meta-oe/recipes-connectivity/ifplugd/ifplugd_0.28.bb
@@ -0,0 +1,25 @@
+DESCRIPTION = "ifplugd is a Linux daemon which will automatically configure your ethernet device \
+when a cable is plugged in and automatically unconfigure it if the cable is pulled."
+HOMEPAGE = "http://0pointer.de/lennart/projects/ifplugd/"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=94d55d512a9ba36caa9b7df079bae19f"
+
+DEPENDS = "libdaemon"
+
+SRC_URI = "http://0pointer.de/lennart/projects/ifplugd/ifplugd-${PV}.tar.gz"
+
+SRC_URI_append_libc-musl = " file://Fix-build-with-musl.patch"
+
+SRC_URI[md5sum] = "df6f4bab52f46ffd6eb1f5912d4ccee3"
+SRC_URI[sha256sum] = "474754ac4ab32d738cbf2a4a3e87ee0a2c71b9048a38bdcd7df1e4f9fd6541f0"
+
+inherit autotools update-rc.d pkgconfig
+
+EXTRA_OECONF = "--disable-lynx --with-initdir=${sysconfdir}/init.d"
+
+INITSCRIPT_NAME = "ifplugd"
+INITSCRIPT_PARAMS = "defaults"
+
+CONFFILES_${PN} = "${sysconfdir}/ifplugd/ifplugd.conf"
+
+RDEPENDS_${PN} += "bash"
-- 
2.20.1


