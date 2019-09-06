Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
	[209.85.214.196])
	by mail.openembedded.org (Postfix) with ESMTP id 43A287F3F6
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  6 Sep 2019 16:32:53 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id m9so3398862pls.8
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 06 Sep 2019 09:32:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=J036LRRWFP5Y8ESvtRb5/Ysn/lctUKnlgfpWnOEK30g=;
	b=H5Gw16OlYK9EiruOgHLHjqwXdufxcUZzw1H67pMyuCH7CIOjgR2zs6xsQFq8G+kM7Q
	FXZhI+iROVohTVXG1V/1Q9q0g4CxXB0Lp5u2sG28Oi6OmSDtIP/xJBEBlZG4bJgjyPJB
	r1X4fZSyb7C7xHaYFBv49eL1rDT5VD6YOU8h8suKHUDVs/GLb7N8uhrqaF23ccqeInNX
	/lMwJ2mbZ4AmuFfHxKzKEVye7RRPCmVGPqBVUvqCFWCQvbqGaR11yTHgFQtifvF3BiAa
	kQqX5oeuQ3fDYfPV4pSg9yy7ct1/KFzQNJ4+Csqxjlm+KiYGjQ2uaAW6yVzV6OqyB9Ik
	oGfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=J036LRRWFP5Y8ESvtRb5/Ysn/lctUKnlgfpWnOEK30g=;
	b=c06xNJYeEJUY5kBUhTxyIR0/ilsttvQdIPmC1fqFATgbZM1R6eLalcbQuNsDHBV7NQ
	96j4/aNJJy9ZM3qaK0pjC95hKQFjXOW6X3ffOqZfa1K4CZH6rNJnk1JfJCeLEr1Z44Xu
	Ejfkt8BPcXLrtQEMbwMMAMWhXizb+E0Fpnex+gufyBDtd8MvAve2UzjiRkBox3Nt+lyl
	mMYzEoXN4/1Omoa2jVLO9JMXSbpPagY8HJIeZ1/WfP9WtI2EbXE6AjzjPA/DKSocftpy
	VNWxoqlEorACDBGUI8n0Ors71qRqY3sE1aQLRlNPenESdjGL6g9dKVRG6H8wMWoHSCxc
	8y9w==
X-Gm-Message-State: APjAAAWpPzRHnh6yyQiqxe0KYUnMIT+4RUQ6dmn0KaVR9n8y6KnONHtI
	aJw0JWasFflqjwa++pqE5C1iOWCVMWs=
X-Google-Smtp-Source: APXvYqzFY0wK6VGeGH471kVWRTUViJn8Kcxk03NW+wiFbMRlT2nsgeAoPm9kBQo5UBb+voL7XbmCPw==
X-Received: by 2002:a17:902:fe09:: with SMTP id
	g9mr9352002plj.99.1567787573645; 
	Fri, 06 Sep 2019 09:32:53 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net (c-73-71-176-3.hsd1.ca.comcast.net.
	[73.71.176.3])
	by smtp.gmail.com with ESMTPSA id t8sm2218205pjq.30.2019.09.06.09.32.52
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 06 Sep 2019 09:32:53 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  6 Sep 2019 09:32:40 -0700
Message-Id: <20190906163242.4770-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Subject: [meta-oe][PATCH V2 1/3] remmina: Add recipe for the remmina remote desktop client
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
X-List-Received-Date: Fri, 06 Sep 2019 16:32:53 -0000
Content-Transfer-Encoding: 8bit

From: "aehs29@gmail.com" <aehs29@gmail.com>

Remmina has become one of the most widely used RDP clients,
it uses freeRDP 2.0 as a backend and also supports multiple
network protocols like RSP, VNC, SPICE, NX, and SSH.

Signed-off-by: Alejandro Enedino Hernandez Samaniego <aehs29@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Rebased

 .../recipes-support/remmina/remmina_1.3.6.bb  | 28 +++++++++++++++++++
 1 file changed, 28 insertions(+)
 create mode 100644 meta-oe/recipes-support/remmina/remmina_1.3.6.bb

diff --git a/meta-oe/recipes-support/remmina/remmina_1.3.6.bb b/meta-oe/recipes-support/remmina/remmina_1.3.6.bb
new file mode 100644
index 0000000000..a14a2592cd
--- /dev/null
+++ b/meta-oe/recipes-support/remmina/remmina_1.3.6.bb
@@ -0,0 +1,28 @@
+DESCRIPTION = "A feature rich Remote Desktop Application written in GTK+"
+HOMEPAGE = "https://remmina.org"
+SECTION = "Support"
+LICENSE = "GPLv2 & openssl"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=dab7215512044d49037272ce1ac4ea8f file://LICENSE.OpenSSL;md5=c1eb3cee0a4dea27503c531267a69769"
+DEPENDS += "openssl freerdp gtk+3 gdk-pixbuf atk libgcrypt avahi-ui libsodium libssh vte json-glib libsoup-2.4 libvncserver spice spice-protocol libsecret"
+
+SRC_URI = "https://gitlab.com/Remmina/Remmina/-/archive/v${PV}/Remmina-v${PV}.tar.bz2 \
+"
+SRC_URI[md5sum] = "6da599c3a5cab2df37a70f8fba2f5438"
+SRC_URI[sha256sum] = "fbed745438bb0c21467b60cbd67c8148a9289b5ebc7482d06db443bea556af1a"
+
+S = "${WORKDIR}/Remmina-v${PV}"
+
+inherit cmake
+
+EXTRA_OECMAKE += "-DWITH_APPINDICATOR=OFF -DWITH_GETTEXT=OFF -DWITH_TRANSLATIONS=OFF"
+
+do_install_append(){
+    # We dont need the extra stuff form other desktop environments
+    rm -rf ${D}/${datadir}/xsessions
+    rm -rf ${D}/${datadir}/metainfo
+    rm -rf ${D}/${datadir}/gnome-session
+}
+
+RDEPENDS_${PN} = "bash"
+
+FILES_${PN}_append = " ${datadir}/icons/hicolor/*"
-- 
2.23.0


