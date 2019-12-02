Return-Path: <alex.kiernan@gmail.com>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id 12D537F67E
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  2 Dec 2019 19:32:36 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id p17so790958wma.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 02 Dec 2019 11:32:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=+uRDk8BwVSjA/hogQzkXAZamkjqtc2Z3lXdz6aMo1Ww=;
	b=bURCveFYmU49B/U4HJDPjSReMV39GaIhfIIFQNktgUpqqMarsS9k+ky/Wtyiqd3mRZ
	lwo8Oz4kGeg9xh7js0Tf+hhoW3SRgVkxPjmZnsHLZ6vxFTznU0XZSQRks0W7VEHppisP
	i9ZgxBaJpZkrMwhRN67vIKXumVhSWSsPLXbFhsnZYlRIS1h099NCL2xsGM68JKaIyLmd
	PhKd31Z5hMbOkVqc3i6jNly8LpYkwixS4Pj1OCdvG3OdgefZUiu7h5kS8jpbN43bUeZ/
	Hda2DE4S/xFsecHwMbzPWPwmjOAs2Z5C39IrgY/khvuEz5B1LTOJ3tn1Bi6r2AT0IXMW
	+WSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=+uRDk8BwVSjA/hogQzkXAZamkjqtc2Z3lXdz6aMo1Ww=;
	b=uYTOW8x4yAba49fe3w4uBtj3h/hejMUOkJ/49ymfHXT41N+0seOu0P9xuJCl8wYQtw
	iQlkL+SGZsUARQakd4J4QWVqFZs36HfGREk8r2YjwrggxcTRU/Dx1wsiUoh6nhsNdKIV
	AQXcZbMwXkgcTl5AJ9FAP6IzKNcKinXYNV7/8lj1bGudbVxAXFrtCpEVaskCr6BM4nkm
	uHy+KyZiBVQxzUQhWHN6Gx3GQUlBwlzXmwCNxt0MFECs0/eiKzX8BKrwpnKAIuOJVKy1
	dU1PWt8jMPSStMJJcy4ZpupcXmsT9/caZvfslniF3tZ/LwNPq+QuiDxKUkiMLU+2+bL6
	ih/w==
X-Gm-Message-State: APjAAAXcWnbFVfrVzNZJ19tEltTMaPtQC1zNkKB1QxRTM1KaCbYcqJpl
	V29qGVVN9eR0ez/foP9zs8YAl55W
X-Google-Smtp-Source: APXvYqz86mgXXb92wyg8oLbEn24EGYcvxPIdYzHqw7K60TnsP+A49934KBeRWfdAciLyAxWoQPTshg==
X-Received: by 2002:a1c:7217:: with SMTP id n23mr14775051wmc.129.1575315157516;
	Mon, 02 Dec 2019 11:32:37 -0800 (PST)
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net.
	[91.135.6.246])
	by smtp.gmail.com with ESMTPSA id l17sm432167wro.77.2019.12.02.11.32.36
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 02 Dec 2019 11:32:37 -0800 (PST)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  2 Dec 2019 19:32:34 +0000
Message-Id: <20191202193234.12221-1-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe][PATCH] ldns: Add recipe
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
X-List-Received-Date: Mon, 02 Dec 2019 19:32:37 -0000

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

 meta-oe/recipes-devtools/ldns/ldns_1.7.1.bb | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/ldns/ldns_1.7.1.bb

diff --git a/meta-oe/recipes-devtools/ldns/ldns_1.7.1.bb b/meta-oe/recipes-devtools/ldns/ldns_1.7.1.bb
new file mode 100644
index 000000000000..2a52dd688a53
--- /dev/null
+++ b/meta-oe/recipes-devtools/ldns/ldns_1.7.1.bb
@@ -0,0 +1,18 @@
+SUMMARY = "LDNS is a DNS library that facilitates DNS tool programming"
+HOMEPAGE = "https://nlnetlabs.nl/ldns"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=34330f15b2b4abbbaaa7623f79a6a019"
+
+SRC_URI = "https://www.nlnetlabs.nl/downloads/ldns/ldns-${PV}.tar.gz"
+SRC_URI[md5sum] = "166262a46995d9972aba417fd091acd5"
+SRC_URI[sha256sum] = "8ac84c16bdca60e710eea75782356f3ac3b55680d40e1530d7cea474ac208229"
+
+DEPENDS = "openssl"
+
+inherit autotools-brokensep
+
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[drill] = "--with-drill,--without-drill"
+
+EXTRA_OECONF = "--with-ssl=${STAGING_EXECPREFIXDIR} \
+                libtool=${TARGET_PREFIX}libtool"
-- 
2.17.1


