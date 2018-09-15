Return-Path: <armccurdy@gmail.com>
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
	[209.85.215.196])
	by mail.openembedded.org (Postfix) with ESMTP id 411247989A
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 15 Sep 2018 01:10:05 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id 2-v6so5140018pgo.4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Sep 2018 18:10:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=nrvmso9DhTSyL6AsVAuRr+YeMKEoXzpFqZOzXaFd9PU=;
	b=RXZ2FgmgsHiA+JPNLcSpdkFb9PcUXaarOAMk1AGD0DhL2mVMfRmlUmZw3ZPYICDA6w
	QIQNhLVIEhMug6fo5puEUxWNf0nDZSLHMoixr/8LNxWh+7T233jiOY4SVpPSl2vB7lug
	tyvPFtsiyHV7vrxDDZjuIechAu/IW/QFl4p2XeZtzRiYIR8/82PExF28sNkvyksY3PjH
	SB7XBlpT8e8tal6eQXmcSV6uOmlwDh51x7WbDKPaj72vHGiY2FXZG2On4K0L3Tp1hvlP
	YkNvoZEHLp59zxYnUQv9DS9GP/JkB1BU6l9wsFWJEvVOj373xdZ4I2fa9S1oqsioWKDD
	hfnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=nrvmso9DhTSyL6AsVAuRr+YeMKEoXzpFqZOzXaFd9PU=;
	b=ASDGbu4aK/1/DZeQ++bPSVjhQPCWr1yvz15M1L6C5FQUOxVvF8rU9w+oXG1tJNncx3
	kDeDW2qurvQpaLXIwSRtDJ5yCkoVaE43rrU8vKnnTY+mrjn4uU1IDQ2E/GP1mOnsqDXM
	kK796lJp/vbwnPENoH21C49CyfB/T70ZfAGpi/zSUSrD0B7+OV5O8qS/5SKQg8/drL8n
	5bu7aZ8chpJ7hZ0ZD+mdcfwRk4J77VL3gVdWWSDn1xhfjvi+IHDh0YstzyIdWqc1Xnax
	eo+/ZNmUaD8oKmIHLvMAaUENmrmkUfyKrf2ZhdfRfDHtgVLucFSkar5bnTauVmfRmNOO
	99eA==
X-Gm-Message-State: APzg51AdlWgYOUC3DMx4QMyc73v+ASzHYykCMaHKCv8vDUJMbCHcohzx
	wuId+8F93dwPi6/TRkU34yLXfcGA
X-Google-Smtp-Source: ANB0VdZk5FuYeR7L5fqhB/VuWkMuOJ94pzeHSgKqDQ1a4Ze6QG1nEL7PVTi5gywldf8Ib8MocQykIA==
X-Received: by 2002:a65:5286:: with SMTP id
	y6-v6mr13187733pgp.65.1536973806027; 
	Fri, 14 Sep 2018 18:10:06 -0700 (PDT)
Received: from e6520.guest-wifi.scl.liberty.com ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	f75-v6sm13263424pfk.85.2018.09.14.18.10.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 14 Sep 2018 18:10:05 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 14 Sep 2018 18:09:59 -0700
Message-Id: <1536973799-961-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-networking][PATCH] stunnel: update 5.35 -> 5.49
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
X-List-Received-Date: Sat, 15 Sep 2018 01:10:05 -0000

 - Update LIC_FILES_CHKSUM due to change in COPYING copyright year
 - Fix dependency on libnsl2 (previously provided indirectly by tcp-wrappers)
 - Drop obsolete dependency on zlib
 - Add PACKAGECONFIG control for libwrap
 - Move legacy stunnel3 wrapper (and its perl dependency) into separate package

For a full list of changes between stunnel 5.35 and 5.49 see:

  https://www.stunnel.org/sdf_ChangeLog.html

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 .../recipes-support/stunnel/stunnel_5.35.bb        | 26 ---------------
 .../recipes-support/stunnel/stunnel_5.49.bb        | 37 ++++++++++++++++++++++
 2 files changed, 37 insertions(+), 26 deletions(-)
 delete mode 100644 meta-networking/recipes-support/stunnel/stunnel_5.35.bb
 create mode 100644 meta-networking/recipes-support/stunnel/stunnel_5.49.bb

diff --git a/meta-networking/recipes-support/stunnel/stunnel_5.35.bb b/meta-networking/recipes-support/stunnel/stunnel_5.35.bb
deleted file mode 100644
index 427c8dd..0000000
--- a/meta-networking/recipes-support/stunnel/stunnel_5.35.bb
+++ /dev/null
@@ -1,26 +0,0 @@
-SUMMARY = "Program for providing universal TLS/SSL tunneling service"
-HOMEPAGE = "http://www.stunnel.org/"
-DESCRIPTION = "SSL encryption wrapper between remote client and local (inetd-startable) or remote server."
-SECTION = "net"
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=866cdc7459d91e092b174388fab8d283"
-DEPENDS = "openssl zlib tcp-wrappers"
-
-RDEPENDS_${PN} += "perl"
-
-SRC_URI = "ftp://ftp.stunnel.org/stunnel/archive/5.x/${BP}.tar.gz \
-           file://fix-openssl-no-des.patch \
-"
-
-SRC_URI[md5sum] = "9079f5fafbccaf88b7d92b227d78249a"
-SRC_URI[sha256sum] = "ffa386ae4c825f35f35157c285e7402a6d58779ad8c3822f74a9d355b54aba1d"
-
-inherit autotools
-
-EXTRA_OECONF += "--with-ssl='${STAGING_EXECPREFIXDIR}' --disable-fips"
-# When cross compiling, configure defaults to nobody, but provides no option to change it.
-EXTRA_OEMAKE += "DEFAULT_GROUP='nogroup'"
-
-PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6 systemd', d)}"
-PACKAGECONFIG[systemd] = "--enable-systemd,--disable-systemd,systemd"
-PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,"
diff --git a/meta-networking/recipes-support/stunnel/stunnel_5.49.bb b/meta-networking/recipes-support/stunnel/stunnel_5.49.bb
new file mode 100644
index 0000000..eca77cf
--- /dev/null
+++ b/meta-networking/recipes-support/stunnel/stunnel_5.49.bb
@@ -0,0 +1,37 @@
+SUMMARY = "Program for providing universal TLS/SSL tunneling service"
+DESCRIPTION = "SSL encryption wrapper between remote client and local (inetd-startable) or remote server."
+HOMEPAGE = "https://www.stunnel.org/"
+SECTION = "net"
+# Note: Linking stunnel statically or dynamically with other modules is making
+# a combined work based on stunnel. Thus, the terms and conditions of the GNU
+# General Public License cover the whole combination.
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=f6b7fe7379c9c2d7db6c80f7bd41e06d"
+
+DEPENDS = "autoconf-archive libnsl2 openssl"
+
+SRC_URI = "ftp://ftp.stunnel.org/stunnel/archive/5.x/${BP}.tar.gz \
+           file://fix-openssl-no-des.patch \
+"
+
+SRC_URI[md5sum] = "0b41240e5585ec7d55ca343feed5530f"
+SRC_URI[sha256sum] = "3d6641213a82175c19f23fde1c3d1c841738385289eb7ca1554f4a58b96d955e"
+
+inherit autotools
+
+PACKAGECONFIG ?= "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6 systemd', d)} libwrap"
+
+PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,"
+PACKAGECONFIG[libwrap] = "--enable-libwrap,--disable-libwrap,tcp-wrappers"
+PACKAGECONFIG[systemd] = "--enable-systemd,--disable-systemd,systemd"
+
+EXTRA_OECONF += "--with-ssl='${STAGING_EXECPREFIXDIR}' --disable-fips"
+
+# When cross compiling, configure defaults to nobody, but provides no option to change it.
+EXTRA_OEMAKE += "DEFAULT_GROUP='nogroup'"
+
+# stunnel3 is a Perl wrapper to allow use of the legacy stunnel 3.x commandline
+# syntax with stunnel >= 4.05
+PACKAGES =+ "stunnel3"
+FILES_stunnel3 = "${bindir}/stunnel3"
+RDEPENDS_stunnel3 += "${PN} perl"
-- 
1.9.1


