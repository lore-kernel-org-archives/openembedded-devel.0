Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id C79FE607DE
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Apr 2018 17:00:12 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id m21so13364891pgv.8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Apr 2018 10:00:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=+tWefrvTIxpG0o00j+fniiTEEiaZvECanjyQ+4bVTgE=;
	b=KN6KSk3llLlOKFsfro98WjyPI9Z+Db1cFUymcfWv9YOlmLAzdJDIWtBExPbL1xfvfE
	eSX0lrSmxcsjVSmsIptqpRpLwFxc/UFDxEEQBJjJbxBTSClZKnKBOQFwEHNz8aNoCUAk
	NmyDBl0/YJ15Wi/MMGBkY7eatlaUxWPioRaDlUkBLNfrg2ukBp7H93KqDcz4EDncbow3
	PGFx8qdhIm1WylkJ+CnJG3yQi/BhbOhUW1M0/Bzo8Gb+431AEA0fAPujPJlBxmhvHLcp
	fk8onf3AlNL4UGgLoxM4R7+qYwqkljyUetJvJKaMPTKqyhNKB4fJpLy1J1QdnVQ6o/tk
	HoiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=+tWefrvTIxpG0o00j+fniiTEEiaZvECanjyQ+4bVTgE=;
	b=NcZBmdMs6ytK7DEhlpsR2UMBDlzUbjnrrbZ7HgUdzyvN+/99MAin0bhBVIuIsIZZKE
	FJ6fl33hUb8I0bNdOBkhQ0GKeFaUrUFPCdpOs9PF5HAxbZkx79H1Sn9A4sQu/DRHRI3/
	wfzRetcw2xYPcLo7golBdtnspi6GmRVpCzOHXQTVelQ1aol6xOhl1CiADVV6xUx4ayd7
	L1rAlwcB0SDypklf/A9K4kikn5dcLySw09xMx17w0kvcGIPb9CE1OeT4TiyTZwEzWeTs
	/PN3qKIqUKPOWdcN0JnCYyL8iemNgDEcHVt/jI6dO0fNnsQbNiWwLtTG1Seuu0aPZ8Ed
	38Jg==
X-Gm-Message-State: ALQs6tDteFKv6qbvGsfQnXNeX6x/fZlG/qkjTqy6lxrTgxG9kP7Nzb+D
	u+eMW6ly/rF1Ih24YINHMo+NBw==
X-Google-Smtp-Source: AB8JxZoJ9U2J/mmeqmd85XUgmY6wMzC/cfrrHtpHEa2A8XitEPbslBhGfafdlTKNXEUdi/R1Fgk56g==
X-Received: by 10.167.133.131 with SMTP id w3mr13190333pfn.197.1524762013368; 
	Thu, 26 Apr 2018 10:00:13 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8880:466c::ddd5])
	by smtp.gmail.com with ESMTPSA id
	w134sm41690845pfd.132.2018.04.26.10.00.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 26 Apr 2018 10:00:12 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 26 Apr 2018 10:00:03 -0700
Message-Id: <20180426170004.20602-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180426170004.20602-1-raj.khem@gmail.com>
References: <20180426170004.20602-1-raj.khem@gmail.com>
Subject: [meta-networking][PATCH 3/4] lftp: Upgrade to 4.8.3
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
X-List-Received-Date: Thu, 26 Apr 2018 17:00:13 -0000

Drop libidn packageconfig, this is no more an option in configure.ac
Package the icon files

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../lftp/{lftp_4.7.7.bb => lftp_4.8.3.bb}                | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)
 rename meta-networking/recipes-connectivity/lftp/{lftp_4.7.7.bb => lftp_4.8.3.bb} (81%)

diff --git a/meta-networking/recipes-connectivity/lftp/lftp_4.7.7.bb b/meta-networking/recipes-connectivity/lftp/lftp_4.8.3.bb
similarity index 81%
rename from meta-networking/recipes-connectivity/lftp/lftp_4.7.7.bb
rename to meta-networking/recipes-connectivity/lftp/lftp_4.8.3.bb
index b6b65da73..08d89b8c5 100644
--- a/meta-networking/recipes-connectivity/lftp/lftp_4.7.7.bb
+++ b/meta-networking/recipes-connectivity/lftp/lftp_4.8.3.bb
@@ -9,8 +9,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 SRC_URI = "http://lftp.yar.ru/ftp/lftp-${PV}.tar.bz2 \
            file://fix-gcc-6-conflicts-signbit.patch \
           "
-SRC_URI[md5sum] = "3701e7675baa5619c92622eb141c8301"
-SRC_URI[sha256sum] = "fe441f20a9a317cfb99a8b8e628ba0457df472b6d93964d17374d5b5ebdf9280"
+SRC_URI[md5sum] = "12b1fcbf13f41e9cdb0903fc670fa1f1"
+SRC_URI[sha256sum] = "c4159f056afee41866a6c2d639655bc351e6d3486bbe7758eaedb24f6a4239d5"
 
 inherit autotools gettext pkgconfig
 
@@ -18,8 +18,7 @@ acpaths = "-I ./m4"
 
 EXTRA_OECONF += "--with-modules"
 
-PACKAGECONFIG ??= "libidn openssl zlib gnutls readline expat"
-PACKAGECONFIG[libidn] = "--with-libidn, --without-libidn, libidn"
+PACKAGECONFIG ??= "openssl zlib gnutls readline expat"
 PACKAGECONFIG[openssl] = "--with-openssl, --without-openssl, openssl"
 PACKAGECONFIG[zlib] = "--with-zlib=${STAGING_INCDIR}/.., --without-zlib, zlib"
 PACKAGECONFIG[gnutls] = "--with-gnutls, --without-gnutls, gnutls"
@@ -29,6 +28,6 @@ PACKAGECONFIG[expat] = "--with-expat=${STAGING_INCDIR}/.. --with-expat-inc=${STA
 do_install_append() {
 	rm -rf ${D}${libdir}/charset.alias
 }
-
+FILES_${PN} += "${datadir}/icons/hicolor"
 FILES_${PN}-dbg += "${libdir}/lftp/${PV}/.debug"
 RDEPENDS_${PN} = "perl bash readline"
-- 
2.17.0


