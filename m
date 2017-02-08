Return-Path: <fabio.berton@ossystems.com.br>
Received: from mail-qk0-f170.google.com (mail-qk0-f170.google.com
	[209.85.220.170])
	by mail.openembedded.org (Postfix) with ESMTP id 7401960602
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  8 Feb 2017 18:12:48 +0000 (UTC)
Received: by mail-qk0-f170.google.com with SMTP id s140so131272755qke.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 08 Feb 2017 10:12:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:organization; bh=qcBQZhEsralMPXcMWiTZwWVK8qnojcjTee4P6JxQK7A=;
	b=SSflKIz5cESlqagGZpuNAyptNZREL3DFbr12/L07hnz+y7KMSiYCh5nFmU4W6WRnEW
	Ww0eYLGU2Bm8LSjG/pWQSRS7Dc5dRBwCzEWHztDj9LmCvI1auISprrQt6CCtyPUZ03Zb
	2+YrhAg9yW6kqRYSM03WwoksfAjhK5WwByCdOvgYiQ0itVWPDbZ5lZPKf9j3iyqAdgjV
	mRNHs+6mU0yL8zSbpIJOJnhsqoDhW+ExJObly9I9D5oQhi/lIIEyIwCcbjv9WMLKNK4k
	xa2gpQEz/hfSds4jsl09txNCQyyTkKvLn0f47HlQBZvpcOo3d/EooTJsfZ5hAHeoUmkA
	Hpaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=qcBQZhEsralMPXcMWiTZwWVK8qnojcjTee4P6JxQK7A=;
	b=ALjZCs2wGbUIXaj0rGMas76W5or+ylvyttR9hliddbFu2mJ72C4HddyISr11/ky85U
	b58DnpB5HM8tKDf7TYPomiuWHD3y/Vcv3hFJsHYr2XIc2ab2ihTG+hVr9GPGA0GXG1g5
	WmNa4sBaCtpXOiBmNOkLYtiYbpFqF1JgAlN4wKQJR1fnbsffXEPsLLZQY1IZg2a058pW
	Gjg2nQL5EJoXalEfTEWG2LbWxb805XtMQ3/3IiHElI22HzcNtdChoFNdjy/LECANCN9i
	ztJ18TAzIkWpMNom+HW+MyI3nc+UM8qHPCXG/uqKjj9tN6hCbqGXW5I/YpA3Cb/V2q+9
	qZYg==
X-Gm-Message-State: AMke39n6fm43X9wwiZRF42j6rez8+MvHr939PlJe6X1zDAS981/hw07X2PiQfisERUblAA==
X-Received: by 10.55.120.3 with SMTP id t3mr20798733qkc.0.1486577568894;
	Wed, 08 Feb 2017 10:12:48 -0800 (PST)
Received: from centrium.lab.ossystems.com.br ([189.114.111.135])
	by smtp.gmail.com with ESMTPSA id
	y23sm6792676qtc.38.2017.02.08.10.12.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 08 Feb 2017 10:12:47 -0800 (PST)
From: Fabio Berton <fabio.berton@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  8 Feb 2017 16:13:19 -0200
Message-Id: <20170208181320.21119-2-fabio.berton@ossystems.com.br>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170208181320.21119-1-fabio.berton@ossystems.com.br>
References: <20170208181320.21119-1-fabio.berton@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Subject: [meta-oe][PATCH v2 2/3] libuv: Add recipe for version 1.10.2
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
X-List-Received-Date: Wed, 08 Feb 2017 18:12:49 -0000

Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
---
 meta-oe/recipes-connectivity/libuv/libuv_1.10.2.bb | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/libuv/libuv_1.10.2.bb

diff --git a/meta-oe/recipes-connectivity/libuv/libuv_1.10.2.bb b/meta-oe/recipes-connectivity/libuv/libuv_1.10.2.bb
new file mode 100644
index 000000000..fbdbeaa89
--- /dev/null
+++ b/meta-oe/recipes-connectivity/libuv/libuv_1.10.2.bb
@@ -0,0 +1,19 @@
+SUMMARY = "A multi-platform support library with a focus on asynchronous I/O"
+HOMEPAGE = "https://github.com/libuv/libuv"
+BUGTRACKER = "https://github.com/libuv/libuv/issues"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=bb5ea0d651f4c3519327171906045775"
+
+SRC_URI = "https://github.com/libuv/${PN}/archive/v${PV}.tar.gz"
+
+SRC_URI[md5sum] = "6e16d1d1ca464add0730d637effb1c1c"
+SRC_URI[sha256sum] = "2d740a2adea0f1a19058626f55a076ac41a4ac1f95d4e57cae0c8a634a6cd63b"
+
+S = "${WORKDIR}/${PN}-${PV}"
+
+inherit autotools
+
+do_configure() {
+    ${S}/autogen.sh || bbnote "${PN} failed to autogen.sh"
+    oe_runconf
+}
-- 
2.11.0


