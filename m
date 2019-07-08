Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lf1-f68.google.com (mail-lf1-f68.google.com
	[209.85.167.68])
	by mail.openembedded.org (Postfix) with ESMTP id A855C60685
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  8 Jul 2019 00:47:52 +0000 (UTC)
Received: by mail-lf1-f68.google.com with SMTP id 62so9675382lfa.8
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 07 Jul 2019 17:47:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=rqxjgm4uV4s0YeeWFflMvb1Z4o/GbL0TPBOLDahV0uY=;
	b=iJ2EIz0kiuxjY6bgzanXHeuWrppetIEQmN1IfCdCmBj+4RsKO3hdrPpDjYnJN5rMM8
	GXuq0i4+hGTrm06U3Ja7p16X7BP3+CM9Gns0LXDlMTO9td3/RKyNxBOgQMJW3jlmIZQp
	4/Fy0Yu8+uGlM1vh+zvJ47/D0Zb/EP+I5jbbmeFkxMmEZy9RwiFWoXzay5uJR75VexTJ
	TB4d91Hnp8EXI0HcpDNEpcT2b7neDPV/txDerl0eJHHpxYWrul82Hqr4DnhX9pjYDvy5
	lCs4IB5xf8HeZT4zuPMVtAmfUkUErdLIxXGuVyjj3ZEqSYx9NxwwN/dzXyL2a1nT/xTH
	L4YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=rqxjgm4uV4s0YeeWFflMvb1Z4o/GbL0TPBOLDahV0uY=;
	b=t6bfPrOnjviTO8E2EkxVaFSHrMzJ/Pw+Y/eOoGjk0UbGZk34eF6oBOIQkyjd+pJb/k
	x6e/ZjXvxPC7pjYTF88W2EfYF1RUGokew8P60tDcEUbczJwUqpbohsvgtTiWi/tkEiDQ
	oHUXlmCE+J17uxNvy+pKBKm7cOBiNPIDkLbgweTYtGIdw4Xwv8l++VXlXYMMJV3vxQvu
	9Egkvu/ItXYmPoG042u6rM4R22A+Y7ZlRwQ4LmnLQmjVMSA2XVqshX/KTO7+6mjH8SNq
	pKYY1MhGoGO4UjMTbjTS2oxUF8XgqhB+uKBEUx1OUfSvM7k6Oro2WSwQO74UieI3Lqj6
	cCzA==
X-Gm-Message-State: APjAAAVYMGOJRquRQ3yAnGbaxaGX1oAsCaXhP9IHhmZdzTxLpYktJJT6
	8CPtnln+tlSwNJNizLckTvtsiZIfFqk=
X-Google-Smtp-Source: APXvYqx7L4rYec15lXwi9dLTrYlaqdQp/Mfti++qL2BOoBBBoUcNt7+QQ4nAC+UCW5hWaT6A4+7l7w==
X-Received: by 2002:ac2:4c3c:: with SMTP id u28mr7410065lfq.136.1562546872742; 
	Sun, 07 Jul 2019 17:47:52 -0700 (PDT)
Received: from localhost.localdomain (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108])
	by smtp.gmail.com with ESMTPSA id m8sm2421362lfh.35.2019.07.07.17.47.51
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Sun, 07 Jul 2019 17:47:52 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  8 Jul 2019 02:47:49 +0200
Message-Id: <20190708004749.11268-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH][meta-networking] uftp: update to 4.9.11
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
X-List-Received-Date: Mon, 08 Jul 2019 00:47:53 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../recipes-support/tnftp/tnftp_20190602.bb   | 39 +++++++++++++++++++
 .../uftp/{uftp_4.9.9.bb => uftp_4.9.11.bb}    |  4 +-
 2 files changed, 41 insertions(+), 2 deletions(-)
 create mode 100644 meta-networking/recipes-support/tnftp/tnftp_20190602.bb
 rename meta-networking/recipes-support/uftp/{uftp_4.9.9.bb => uftp_4.9.11.bb} (77%)

diff --git a/meta-networking/recipes-support/tnftp/tnftp_20190602.bb b/meta-networking/recipes-support/tnftp/tnftp_20190602.bb
new file mode 100644
index 000000000..83ad11b0e
--- /dev/null
+++ b/meta-networking/recipes-support/tnftp/tnftp_20190602.bb
@@ -0,0 +1,39 @@
+SUMMARY = "Enhanced NetBSD ftp client"
+DESCRIPTION = "tnftp (formerly known as lukemftp) is a port of the NetBSD FTP client \
+to other systems. It offers many enhancements over the traditional \
+BSD FTP client, including command-line editing, command-line fetches \
+of FTP and HTTP URLs (including via proxies), command-line uploads of \
+FTP URLs, context-sensitive word completion, dynamic progress bar, \
+IPv6 support, modification time preservation, paging of local and \
+remote files, passive mode support (with fallback to active mode), \
+SOCKS support, TIS FWTK gate-ftp server support, and transfer rate \
+throttling."
+
+SECTION = "net"
+LICENSE = "BSD-4-Clause"
+
+DEPENDS = "ncurses"
+
+SRC_URI = "ftp://ftp.netbsd.org/pub/NetBSD/misc/tnftp/${BPN}-${PV}.tar.gz \
+    file://tnftp-autotools.patch \
+"
+
+inherit autotools update-alternatives pkgconfig
+
+ALTERNATIVE_PRIORITY = "100"
+
+ALTERNATIVE_${PN} = "ftp"
+ALTERNATIVE_LINK_NAME_${PN} = "${bindir}/ftp"
+ALTERNATIVE_TARGET_${PN}  = "${bindir}/tnftp"
+
+FILES_${PN} = "${bindir}/tnftp"
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=6d6796cb166a9bb050958241dad9479e"
+SRC_URI[md5sum] = "a49fbe752318d5a7893f900046ea00d5"
+SRC_URI[sha256sum] = "c94a8a49d3f4aec1965feea831d4d5bf6f90c65fd8381ee0863d11a5029a43a0"
+
+PACKAGECONFIG ?= "openssl \
+    ${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)} \
+"
+PACKAGECONFIG[openssl] = "--enable-ssl, --disable-ssl --with-ssl=no, openssl"
+PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,"
diff --git a/meta-networking/recipes-support/uftp/uftp_4.9.9.bb b/meta-networking/recipes-support/uftp/uftp_4.9.11.bb
similarity index 77%
rename from meta-networking/recipes-support/uftp/uftp_4.9.9.bb
rename to meta-networking/recipes-support/uftp/uftp_4.9.11.bb
index a64d081cf..8b47bd16f 100644
--- a/meta-networking/recipes-support/uftp/uftp_4.9.9.bb
+++ b/meta-networking/recipes-support/uftp/uftp_4.9.11.bb
@@ -7,8 +7,8 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=d32239bcb673463ab874e80d47fae504"
 UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/uftp-multicast/files/source-tar/"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/uftp-multicast/source-tar/uftp-${PV}.tar.gz"
-SRC_URI[md5sum] = "154e2c82a33fd4999040f8836e2dca2c"
-SRC_URI[sha256sum] = "c04bc75a88fc3d57504269f260be4d0b1bc440508b5a5ca587df6c16b771aa48"
+SRC_URI[md5sum] = "c0bc86b3067825a3866de9ef80c7451a"
+SRC_URI[sha256sum] = "2ddc835a35f669d55df27ab6883ba19bb00bc8e4b66897ceaedb160b02246b1a"
 
 DEPENDS = "openssl"
 
-- 
2.17.1


