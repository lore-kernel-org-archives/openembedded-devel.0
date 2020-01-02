Return-Path: <rehsack@gmail.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id BC0647FC36
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  2 Jan 2020 13:37:33 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id z7so39165410wrl.13
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 02 Jan 2020 05:37:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id;
	bh=L7s9Ae0PoE2LdgWbz4pjA+T6unBEl6cc/mU3qfksFlk=;
	b=JjZhFtoCgvY0SX1VCfAk2q0EYHhRMt4Zdgc/ZCLN0wBvVbe7xCTiKFqRQFb/fcb3zy
	cEK09Ec/k5pp6wcpjWVtZC9w037jGnFL3FFY9z5Yi/1E7vHo5cZa/SjTszm4fRPCR0rw
	FIDXL0CPwi/oMV2jBqfWWxg8eOoLKqHzn0DNI64RFoNR3HqoL9SJfL5XWs9uhGA6I9i9
	YjD5+o9Mx5Pop4Usbgm56eQRKvrVmfacAli+RIO/8fO8WrCADv6KXmxrZkYmNmeXe2Jd
	UqVKoEt1R/sD+3dYdIjlniA6wY+4KZuXlE/ASkNaZcpWMQjgcAtgGxwoSMjhGCBP3QxY
	AeLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=L7s9Ae0PoE2LdgWbz4pjA+T6unBEl6cc/mU3qfksFlk=;
	b=XKgwEbGlSiNWD/z05gCMHEKGMdK5rtd32+3Lhnk/7iGpHKAjNqvEQdClidpB3gnzca
	sEk1Hwyqj5rOfeOP25uRbE5l+Bx/IeEoVq2kin58n0MAIYS+Wo6NtNkHjdnfCco17/0U
	LkLJiw95gRPLMGpvQKKRSZ99vItxJJfd3nJRTSnBmdIBtH6+WTyJrQ/UEqxFWwihlvuo
	kww8RPa84sqt4XoNAJ50WHj58mBe2ujlD28DLSy94iNNZLbZ6N76YiY7X17/b34rn5wU
	pBeuuicNoeCEjhtRQuF9MbSjoYyCQHEmBiQ6IGCzFx5KUMv0JcHWRoicNhcOXvg5ctnW
	rCZQ==
X-Gm-Message-State: APjAAAVI+hHCjFySoVswzqztcvibXNHtmM8j8cMoPhaZEFEtvipx2m6/
	qd4bQ6UA3OaarFRauyvIRhWtW6p22XA=
X-Google-Smtp-Source: APXvYqx26ckNWb/HJ+xDUOxiZPjKaQ98m9+X13Vj/9xX8v+d5reHbo5NKqP3O+Drtk+JfgAVtMSirQ==
X-Received: by 2002:adf:f54d:: with SMTP id j13mr82096440wrp.19.1577972254180; 
	Thu, 02 Jan 2020 05:37:34 -0800 (PST)
Received: from beaker.muppets.liwing.de (p5B25B970.dip0.t-ipconnect.de.
	[91.37.185.112]) by smtp.gmail.com with ESMTPSA id
	h2sm55859019wrv.66.2020.01.02.05.37.33
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 02 Jan 2020 05:37:33 -0800 (PST)
Sender: Jens Rehsack <rehsack@gmail.com>
From: Jens Rehsack <sno@netbsd.org>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  2 Jan 2020 14:37:24 +0100
Message-Id: <20200102133724.1383-1-sno@netbsd.org>
X-Mailer: git-send-email 2.17.1
Cc: Jens Rehsack <sno@netbsd.org>
Subject: [meta-perl][PATCH] libconfig-autoconf-perl: add recipe
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
X-List-Received-Date: Thu, 02 Jan 2020 13:37:34 -0000

Introduce Config::Autoconf module to meta-perl which will allow some
probes can be run without leaving perl5 context.

Signed-off-by: Jens Rehsack <sno@netbsd.org>
---
 .../libconfig-autoconf-perl_0.317.bb          | 41 +++++++++++++++++++
 1 file changed, 41 insertions(+)
 create mode 100644 meta-perl/recipes-perl/libconfig/libconfig-autoconf-perl_0.317.bb

diff --git a/meta-perl/recipes-perl/libconfig/libconfig-autoconf-perl_0.317.bb b/meta-perl/recipes-perl/libconfig/libconfig-autoconf-perl_0.317.bb
new file mode 100644
index 000000000..62983764f
--- /dev/null
+++ b/meta-perl/recipes-perl/libconfig/libconfig-autoconf-perl_0.317.bb
@@ -0,0 +1,41 @@
+# Copyright (C) 2020 Jens Rehsack <sno@netbsd.org>
+# Released under the MIT license (see COPYING.MIT for the terms)
+
+SUMMARY = "A module to implement some of AutoConf macros in pure perl"
+DESCRIPTION = "Config::AutoConf is intended to provide the same opportunities to Perl \
+developers as GNU Autoconf <http://www.gnu.org/software/autoconf/> does for \
+Shell developers."
+
+HOMEPAGE=       "https://metacpan.org/release/Config-AutoConf"
+
+SECTION = "libs"
+LICENSE = "Artistic-1.0 | GPL-1.0+"
+
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/Artistic-1.0;md5=cda03bbdc3c1951996392b872397b798 \
+file://${COMMON_LICENSE_DIR}/GPL-1.0;md5=e9e36a9de734199567a4d769498f743d"
+
+SRC_URI = "${CPAN_MIRROR}/authors/id/R/RE/REHSACK/Config-AutoConf-0.317.tar.gz"
+
+SRC_URI[md5sum] = "29f87fc7803f1725f6daafcf416089ce"
+SRC_URI[sha256sum] = "01e4b22d2fecb7cfd3cc1f4dabe95cd137cf249cc5e38184f88556e5c98a9ce1"
+RDEPENDS_${PN} += "libcapture-tiny-perl"
+RDEPENDS_${PN} += "perl-module-base"
+RDEPENDS_${PN} += "perl-module-carp"
+RDEPENDS_${PN} += "perl-module-config"
+RDEPENDS_${PN} += "perl-module-constant"
+RDEPENDS_${PN} += "perl-module-file-basename"
+RDEPENDS_${PN} += "perl-module-file-spec"
+RDEPENDS_${PN} += "perl-module-file-temp"
+RDEPENDS_${PN} += "perl-module-extutils-cbuilder"
+RDEPENDS_${PN} += "perl-module-extutils-cbuilder-unix"
+RDEPENDS_${PN} += "perl-module-scalar-util"
+RDEPENDS_${PN} += "perl-module-strict"
+RDEPENDS_${PN} += "perl-module-text-parsewords"
+RDEPENDS_${PN} += "perl-module-warnings"
+RRECOMMENDS_${PN} += "libfile-slurper-perl"
+
+S = "${WORKDIR}/Config-AutoConf-${PV}"
+
+inherit cpan ptest-perl allarch
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1


