Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f172.google.com (mail-qk0-f172.google.com
	[209.85.220.172])
	by mail.openembedded.org (Postfix) with ESMTP id 32EEB7808D
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Dec 2017 20:43:41 +0000 (UTC)
Received: by mail-qk0-f172.google.com with SMTP id 8so19990450qkj.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Dec 2017 12:43:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=8eaMYaBiR3QTFT/oOMkYSxf3eyNNOE9ua5rgOtLnbrs=;
	b=G81mMA5b4v/z+SJwzF8fhSbmlnTpcv/eMo0fGVNq2ME7N/WkvOLegPM6VliJ22iDPM
	Fpoz04HHOTNgxhrh0w5pV8NanAkGOWixEe90fbScs5eBPpzMufb654K0leR0UN2Uy2bs
	HUF1D4TMmcH142o5ZWlIQtUKO6sgJ2CppcKBmmK4aVjM7eB3CNfo1z+Vt2V3JSe1NQyw
	PH+j2IZ3NLqRKeQz3fyHKc/WFGSPQW67zSq//oAj86rPE1ayBP66q7aRISGyWAKBokL/
	lADUU5UkbaMT1u6iD6ht85SmCmt0FrTjXUktENmrFSjTpc1PS5gO+B9TJszrVCotTQvd
	TL+g==
X-Gm-Message-State: AKGB3mJk7KFED6h6q4G93Q1vDLh+s+edWe5+YkGPp1Yqa+hXb6RIvUoB
	wXe5r7GvA4evC4AWCqeT4xFFPpLs
X-Google-Smtp-Source: ACJfBouBfYS+NhfH8xjYCTHbiidg1CsxP8ygT/ga5e7vuW+KXCyPyV6QKddq/YOiqYeTrG0ZWiC7bg==
X-Received: by 10.55.175.135 with SMTP id y129mr1608159qke.128.1513629822634; 
	Mon, 18 Dec 2017 12:43:42 -0800 (PST)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id
	y62sm3919659qkb.54.2017.12.18.12.43.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 18 Dec 2017 12:43:42 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 18 Dec 2017 15:43:21 -0500
Message-Id: <1513629801-30098-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-webserver][PATCH] phpmyadmin: update to version 4.7.6
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
X-List-Received-Date: Mon, 18 Dec 2017 20:43:42 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../recipes-php/phpmyadmin/phpmyadmin_4.7.6.bb     | 38 ++++++++++++++++++++++
 1 file changed, 38 insertions(+)
 create mode 100644 meta-webserver/recipes-php/phpmyadmin/phpmyadmin_4.7.6.bb

diff --git a/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_4.7.6.bb b/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_4.7.6.bb
new file mode 100644
index 0000000..672db58
--- /dev/null
+++ b/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_4.7.6.bb
@@ -0,0 +1,38 @@
+SUMMARY = "Web-based MySQL administration interface"
+HOMEPAGE = "http://www.phpmyadmin.net"
+# Main code is GPLv2, vendor/tecnickcom/tcpdf is under LGPLv3, js/jquery is under MIT
+LICENSE = "GPLv2 & LGPLv3 & MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
+                    file://vendor/tecnickcom/tcpdf/LICENSE.TXT;md5=5c87b66a5358ebcc495b03e0afcd342c \
+                    file://js/jquery/MIT-LICENSE.txt;md5=e43aa437a6a1ba421653bd5034333bf9 \
+"
+
+SRC_URI = "https://files.phpmyadmin.net/phpMyAdmin/${PV}/phpMyAdmin-${PV}-all-languages.tar.xz \
+           file://apache.conf \
+"
+
+SRC_URI[md5sum] = "a9aec05d44c68b4ac5e4987118d70cd7"
+SRC_URI[sha256sum] = "5fab6b92336386646bbb189d55817799487b5c27b06cab0cdfdcab3c88f5988f"
+
+S = "${WORKDIR}/phpMyAdmin-${PV}-all-languages"
+
+inherit allarch
+
+do_install() {
+    install -d ${D}${datadir}/${BPN}
+    cp -R --no-dereference --preserve=mode,links -v * ${D}${datadir}/${BPN}
+    chown -R root:root ${D}${datadir}/${BPN}
+    # Don't install patches to target
+    rm -rf ${D}${datadir}/${BPN}/patches
+
+    install -d ${D}${sysconfdir}/apache2/conf.d
+    install -m 0644 ${WORKDIR}/apache.conf ${D}${sysconfdir}/apache2/conf.d/phpmyadmin.conf
+
+    # Remove a few scripts that explicitly require bash (!)
+    rm -f ${D}${datadir}/phpmyadmin/libraries/transformations/*.sh
+}
+
+FILES_${PN} = "${datadir}/${BPN} \
+               ${sysconfdir}/apache2/conf.d"
+
+RDEPENDS_${PN} += "bash"
-- 
2.7.4


