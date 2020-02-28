Return-Path: <andre.draszik@gmail.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 1376D608DE
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Feb 2020 09:34:38 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id v4so2133625wrs.8
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Feb 2020 01:34:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Tth3elQYs2SnKQV+c6K3LeLYzm+8dNZuJNRsP9TkfN8=;
	b=OZzH43VM+4RU+4rTy0UcFF/jIUOdDZ5fUHFxZfsAFOHHdANVWVc9h8mctDqwFFHQZr
	H7LH7wPW4fx44FigTCRp6h1tLXldD0PsvVxkaBvPnKLuAoWhjb3whZ0k2FLRGe1lnslb
	SHeT0F3E9B/8IuAfSTGUo/U5Bp06sV1/qmMOBHy4idJZ+t1dyNB58uguNBQ/mfScTLKe
	BIfj3OIXyr2euQ8pa4j9kY6ahOABM0VxSKtLQOOvgwkeMjhLKnirjyDfBDllZP8k1y0c
	WYjV2b3zLRfHd3vJgiEM1QTqtemZXxthksTqp3IZWBw5Fl0wn+qZBThMXTL55HnmssR1
	ZhhQ==
X-Gm-Message-State: APjAAAWOOVRHEqJS5LcR56YYj+LWNkEE1h/BvZ5L2KiAGo22TUyRqBtz
	mTSir+GPHbKoTeAEhIJJ0Jy38scC
X-Google-Smtp-Source: APXvYqxgVamYiSzO1taXqbb7vgaxtZo/RR8wEn9VWJwmtqqV7lChFQgIPqYPTYB4mXyJ7X5qMRSAoA==
X-Received: by 2002:a05:6000:106:: with SMTP id
	o6mr3983139wrx.120.1582882479316; 
	Fri, 28 Feb 2020 01:34:39 -0800 (PST)
Received: from 1aq-andre.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	e1sm11889572wrt.84.2020.02.28.01.34.38
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 28 Feb 2020 01:34:38 -0800 (PST)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 28 Feb 2020 09:34:37 +0000
Message-Id: <20200228093437.2877-1-git@andred.net>
X-Mailer: git-send-email 2.23.0.rc1
MIME-Version: 1.0
Subject: [meta-networking][PATCH] libowfat: fix sdk installation
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
X-List-Received-Date: Fri, 28 Feb 2020 09:34:39 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: André Draszik <andre.draszik@jci.com>

Building an SDK with this included fails:
 * calculate_dependencies_for: Cannot satisfy the following dependencies for ncp-dev:
 * 	libowfat (= 0.32-r0) *
 * opkg_solver_install: Cannot install package ncp-dev.

libowfat only provides a static library, so there no
${PN} package is created by default.

Add ALLOW_EMPTY_${PN} = "1" to allow creation of an empty
${PN} package.

Signed-off-by: André Draszik <andre.draszik@jci.com>
---
 meta-networking/recipes-support/ncp/libowfat_0.32.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-networking/recipes-support/ncp/libowfat_0.32.bb b/meta-networking/recipes-support/ncp/libowfat_0.32.bb
index 24f413555..d2f4df78e 100644
--- a/meta-networking/recipes-support/ncp/libowfat_0.32.bb
+++ b/meta-networking/recipes-support/ncp/libowfat_0.32.bb
@@ -26,4 +26,6 @@ do_install() {
         MAN3DIR=${mandir}/man3
 }
 
+ALLOW_EMPTY_${PN} = "1"
+
 BBCLASSEXTEND = "native nativesdk"
-- 
2.23.0.rc1


