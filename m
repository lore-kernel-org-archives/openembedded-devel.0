Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id 626F773288
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  7 Mar 2017 07:14:00 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id o126so6046962pfb.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 06 Mar 2017 23:14:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=4+4n/KXxpFNV4fNgdxLefEQGvfP54u8VzZGCHeIqT20=;
	b=q9Eyvl+DlPLPXLPql5NMxFl4h6Rdb0a10J1cLVjmp0Ibwfva6WjzQeROajt3ucHNml
	a6Svze/+F6+V0KaiELmNDOjrL+eUmPnUyjvPqYVzE7yJGYIzigXouFjT/58xFJaSrA2r
	HqGSpve2K80UrF9UjxA1DKdaAckS0u/V4RDKZd4rIC9BOxeHnFqTTTq1K+IOZMsD6rGH
	Fm5Rr7w0bXE5PS0ZaKq7q0X7SsCLqW17+B8b99jpvPGi8fJPAtfiUeNfoYrtgeOjoSqx
	Ih9MtXH403FnOmg7ZkehsCvkOY9MdK03TywJpBrZTjpRUjnSyvvwaJrZ5AJc/+RY3NrI
	AP4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=4+4n/KXxpFNV4fNgdxLefEQGvfP54u8VzZGCHeIqT20=;
	b=LdVgGdikiYOggHdEBZD+cevKO36JhgFgztO2Nv3hbHucAznYVMSrDeo5ow43Jxw/8l
	9FFKgQNBGhv1WxKriXJfsJLs0NmGkVqYbPdHWs5Vka4otVXwamixM8X0ZoaKhWjVj6gV
	hHmSKK41MBylhdbLvs1Sp37a+kNGhXqTiNb6TgOrgZBVD2HxONorfNNOZ1l6Zf36vT2w
	Waq73mWE1rK9cXJw6Av3ifas8Dr3WbDF7h70oxTQVA7yDt2Yp3GAnXWG9stwVQmfubvk
	B60Etw/eELR6lD4uX+WCiwk9FASL8K0Y3hLLsF460O+EsOkMPq/tJAEZcD0ov8MtRQui
	8T5Q==
X-Gm-Message-State: AMke39l9jLaY60muf8uoMnkTQftRhSk7YKLa75rJbaJPx6MXNVqaIIB0c/jRExxkaBX1Bw==
X-Received: by 10.98.212.81 with SMTP id u17mr26658703pfl.75.1488870841754;
	Mon, 06 Mar 2017 23:14:01 -0800 (PST)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	r134sm43530858pfr.83.2017.03.06.23.14.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 06 Mar 2017 23:14:01 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  6 Mar 2017 23:13:37 -0800
Message-Id: <20170307071349.16444-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.12.0
In-Reply-To: <20170307071349.16444-1-raj.khem@gmail.com>
References: <20170307071349.16444-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 02/14] fftw: Update to 3.3.6 release
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
X-List-Received-Date: Tue, 07 Mar 2017 07:14:02 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/fftw/{fftw_3.3.5.bb => fftw_3.3.6.bb} | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-support/fftw/{fftw_3.3.5.bb => fftw_3.3.6.bb} (89%)

diff --git a/meta-oe/recipes-support/fftw/fftw_3.3.5.bb b/meta-oe/recipes-support/fftw/fftw_3.3.6.bb
similarity index 89%
rename from meta-oe/recipes-support/fftw/fftw_3.3.5.bb
rename to meta-oe/recipes-support/fftw/fftw_3.3.6.bb
index 71adb8905..559985169 100644
--- a/meta-oe/recipes-support/fftw/fftw_3.3.5.bb
+++ b/meta-oe/recipes-support/fftw/fftw_3.3.6.bb
@@ -4,11 +4,13 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
 
 SRC_URI = " \
-    http://www.fftw.org/fftw-${PV}.tar.gz \
+    http://www.fftw.org/fftw-${PV}-pl1.tar.gz \
     file://0001-NEON-autodetection-segfaults-assume-neon-present.patch \
 "
-SRC_URI[md5sum] = "6cc08a3b9c7ee06fdd5b9eb02e06f569"
-SRC_URI[sha256sum] = "8ecfe1b04732ec3f5b7d279fdb8efcad536d555f9d1e8fabd027037d45ea8bcf"
+SRC_URI[md5sum] = "682a0e78d6966ca37c7446d4ab4cc2a1"
+SRC_URI[sha256sum] = "1ef4aa8427d9785839bc767f3eb6a84fcb5e9a37c31ed77a04e7e047519a183d"
+
+S = "${WORKDIR}/fftw-${PV}-pl1"
 
 inherit autotools pkgconfig
 
-- 
2.12.0


