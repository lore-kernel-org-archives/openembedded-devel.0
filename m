Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
	[209.85.214.194])
	by mail.openembedded.org (Postfix) with ESMTP id 3DA466C1B4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Nov 2018 16:55:54 +0000 (UTC)
Received: by mail-pl1-f194.google.com with SMTP id k8so7014039pls.11
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Nov 2018 08:55:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=nfbEYLgRyXjiE0PYUPB7Zi5wKfmljN6S554yqVHTQEI=;
	b=DU43Y+GJbStzQ5WhUj38UzQZSoyCPehTgaccelGfp6s9IljDtMXewq+y6EeJ+W9Uyx
	/7KcvTfVBdtVWrP3lx3XXpAK1bzr6NRNH3lr+ou/2FNl31l4q+gvaM0idfIbpXYWdvGd
	YVQi9sIk3nGl7OdGkjvuqGqPvcxoC2q9B60nLpkvlFMU3h5Y9uJB8h3XVugqzI780G5R
	NTUwHWoHzrUNm3zaT84kDt00oaBqwOawSc8H1TglwRPzML59OSH4elUy4RJ92pQ0Wu8D
	2YniqAHLyVA7PjeR2lllVL9Zsq1XIzr23e3h1WruMCNYP9yDYMVkRvlC1iAbNr2ksue8
	6/SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=nfbEYLgRyXjiE0PYUPB7Zi5wKfmljN6S554yqVHTQEI=;
	b=CnCdB62m/U+ngNPHds8HobaHKVbUkC2AVsCtcW9UcNZ5f445UcHl0KMYz9zJXniXW1
	rebmKHzCgxZVvOhJlOrjZQJU7enE1B/RaNcHHyEtYjf6ADVxYcJVdpwoufdoqji3HsAL
	Inb/8dzCzQqqlVReh+i241Zpk8XKdtprmNqHk6qZ83yxxmr84kIEkYYmoJfCsLr01QZy
	AzxQbZF6sWX6Z0YgolMo1wAtK3rW4oT8VZzenqLx7bATvcBJ50xkKA2OHHqIPia5IDfu
	DSL0oz3pUj7pq8wQwII6GX9V/kssrXqErIMPs3Z8pczHQQjSVxwpnStiJ7ZtMlS5fuUC
	K1tA==
X-Gm-Message-State: AA+aEWaP+uOcSMJ8EKArg5zQMWZH3MGdqjgxbdLydss7p5sPTMCgwGMj
	/+zGf2i2PZBSZdHB2amQqIOxVYF8how=
X-Google-Smtp-Source: AFSGD/UDEO7EEgS8ankR+gecoGRAMjamxoZ+r7EenpRJEPNmwHdvdbyeLoPeEv6KV/XOh0wAZD+pDg==
X-Received: by 2002:a17:902:503:: with SMTP id
	3mr29556496plf.233.1543424155581; 
	Wed, 28 Nov 2018 08:55:55 -0800 (PST)
Received: from localhost.localdomain ([2601:646:877f:9499::26ab])
	by smtp.gmail.com with ESMTPSA id
	e86sm10518440pfb.6.2018.11.28.08.55.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 28 Nov 2018 08:55:54 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 28 Nov 2018 08:55:46 -0800
Message-Id: <20181128165546.5265-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.19.2
MIME-Version: 1.0
Subject: [meta-multimedia][PATCH] libdvbcsa: Add recipe
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
X-List-Received-Date: Wed, 28 Nov 2018 16:55:55 -0000
Content-Transfer-Encoding: 8bit

tvheadend needs this library

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../libdvbcsa/libdvbcsa/libdvbcsa.pc          | 10 ++++++++++
 .../libdvbcsa/libdvbcsa_1.1.0.bb              | 19 +++++++++++++++++++
 2 files changed, 29 insertions(+)
 create mode 100644 meta-multimedia/recipes-multimedia/libdvbcsa/libdvbcsa/libdvbcsa.pc
 create mode 100644 meta-multimedia/recipes-multimedia/libdvbcsa/libdvbcsa_1.1.0.bb

diff --git a/meta-multimedia/recipes-multimedia/libdvbcsa/libdvbcsa/libdvbcsa.pc b/meta-multimedia/recipes-multimedia/libdvbcsa/libdvbcsa/libdvbcsa.pc
new file mode 100644
index 0000000000..57e74668eb
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/libdvbcsa/libdvbcsa/libdvbcsa.pc
@@ -0,0 +1,10 @@
+prefix=/usr
+libdir=${prefix}/lib
+includedir=${prefix}/include
+
+Name: libdvbcsa
+Description:  is a free implementation of the DVB Common Scrambling Algorithm - DVB/CSA - with encryption and decryption capabilities.
+Version: 1.1.0
+Requires:
+Libs: -L${libdir} -ldvbcsa
+
diff --git a/meta-multimedia/recipes-multimedia/libdvbcsa/libdvbcsa_1.1.0.bb b/meta-multimedia/recipes-multimedia/libdvbcsa/libdvbcsa_1.1.0.bb
new file mode 100644
index 0000000000..7f042c382f
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/libdvbcsa/libdvbcsa_1.1.0.bb
@@ -0,0 +1,19 @@
+SUMMARY = "Open implementation of the DVB Common Scrambling Algorithm, encrypt and decrypt "
+SECTION = "libs/multimedia"
+LICENSE = "LGPLv2.1+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
+
+SRCREV = "bc6c0b164a87ce05e9925785cc6fb3f54c02b026"
+
+SRC_URI = "git://code.videolan.org/videolan/libdvbcsa.git;protocol=https \
+           file://libdvbcsa.pc \
+"
+
+S = "${WORKDIR}/git"
+
+inherit autotools lib_package pkgconfig
+
+do_install_append() {
+    install -D -m 0644 ${S}/src/dvbcsa/dvbcsa.h ${D}${includedir}/dvbcsa/dvbcsa.h
+    install -D -m 0644 ${WORKDIR}/libdvbcsa.pc ${D}${libdir}/pkgconfig/libdvbcsa.pc
+}
-- 
2.19.2


