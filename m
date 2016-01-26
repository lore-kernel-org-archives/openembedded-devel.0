Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id D17D17318D
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Jan 2016 11:55:52 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id 123so16948728wmz.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Jan 2016 03:55:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=bgyD5+yySTnMRlp/JhwGI9e4bMbBYcQFao3epl5l36o=;
	b=XF4F0espa8qG8smTuQWAebBZLKhKBv3X5tlITygP8kHdIBIUpDUUETvBY6zxQiiYet
	KIoL71ihiFsFN2HCNkqy8HKdfet8bjmwm6giso5B+00RIA/GoWmj2UH6ouRa9jJdz6E0
	pIXboggvCl05jy8vCeiCQUovJ8XoHgT2c4+soYTwFmtGfEuyLTfHx6mlbysWS6caATm6
	kEHo+clVCX+OcelPDXwlvjYs1qK5VOZkeM4xC66zVMCjXdXilXWD/7+4mB4fRwZ29MzQ
	1JQefM8Hs9INiCVAubibgSpLsf11ZPbl/sqvLsaAUCqY+1hc9Xr2p6KPgrnNUoviZLmH
	nL2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-type:content-transfer-encoding;
	bh=bgyD5+yySTnMRlp/JhwGI9e4bMbBYcQFao3epl5l36o=;
	b=Q/TNep4azqNszf4chHt2Mc/FOKo1XbIbKDdrAPzJam/ZHFwiZyqd6K/3D/Gkwnr18c
	/7+0/+lms4rTveqSOxjbz9oLPfIddv9RpwIde4n9HFwyLGYlMl8syW3yIloxfykxER/l
	jdWF+LubsqtFAIbtenXsYO0QydUoIv9qpLcrS1CP25ITGHjxl1NRHtTMzqJlb9kF57Rz
	QuXmtI95XdcLDCgkr6b2jWrajPjaR2F3VL8jaydudFg5Kda8bz6MkXyqnnE7JGn8k0kw
	rrlpDxMDpUabPA/z98BjPYA9csi7tTj/e9CoJRx2PMGvrnqIaMhu3vJlqFfAZlpXpDUp
	pdOg==
X-Gm-Message-State: AG10YORoBaWsvfmd/jn3SMpQktNiwvC4aHDTRMscnJwku0Dxzonj2VOqG3NkmRyn4Ag0DQ==
X-Received: by 10.28.195.212 with SMTP id t203mr25564366wmf.46.1453809352784; 
	Tue, 26 Jan 2016 03:55:52 -0800 (PST)
Received: from localhost.localdomain
	(ip-176-198-253-155.hsi05.unitymediagroup.de. [176.198.253.155])
	by smtp.googlemail.com with ESMTPSA id
	m143sm2532503wma.17.2016.01.26.03.55.51
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 26 Jan 2016 03:55:52 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 26 Jan 2016 12:55:20 +0100
Message-Id: <1453809321-10937-2-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1453809321-10937-1-git-send-email-schnitzeltony@googlemail.com>
References: <1453809321-10937-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 2/3] grail: initial add 3.1.0
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
X-List-Received-Date: Tue, 26 Jan 2016 11:55:54 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../canonical-multitouch/grail_3.1.0.bb            | 23 ++++++++++++++++++++++
 1 file changed, 23 insertions(+)
 create mode 100644 meta-oe/recipes-support/canonical-multitouch/grail_3.1.0.bb

diff --git a/meta-oe/recipes-support/canonical-multitouch/grail_3.1.0.bb b/meta-oe/recipes-support/canonical-multitouch/grail_3.1.0.bb
new file mode 100644
index 0000000..6ea10d6
--- /dev/null
+++ b/meta-oe/recipes-support/canonical-multitouch/grail_3.1.0.bb
@@ -0,0 +1,23 @@
+SUMMARY = "Gesture Recognition And Instantiation Library"
+
+HOMEPAGE = "https://launchpad.net/grail"
+
+LICENSE = "GPLv3 & LGPLv3"
+LIC_FILES_CHKSUM = " \
+    file://COPYING;md5=e6a600fd5e1d9cbde2d983680233ad02 \
+    file://COPYING.GPL3;md5=d32239bcb673463ab874e80d47fae504 \
+"
+
+inherit autotools pkgconfig
+
+DEPENDS = "frame"
+
+SRC_URI = "https://launchpad.net/${BPN}/trunk/${PV}/+download/${BPN}-${PV}.tar.bz2"
+SRC_URI[md5sum] = "2ac56af5f6f466b433c99ca12f34c34f"
+SRC_URI[sha256sum] = "c26dced1b3f4317ecf6af36db0e90294d87e43966d56aecc4e97b65368ab78b9"
+
+PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}"
+PACKAGECONFIG[x11] = "--with-x11, --without-x11, libxi"
+
+PACKAGE_BEFORE_PN += "${PN}-test"
+FILES_${PN}-test = "${bindir}/grail-test*"
-- 
2.5.0


