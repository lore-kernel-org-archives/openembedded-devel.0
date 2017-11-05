Return-Path: <pbarker@toganlabs.com>
Received: from mail-wm0-f52.google.com (mail-wm0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id 631BE78379
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  5 Nov 2017 22:08:24 +0000 (UTC)
Received: by mail-wm0-f52.google.com with SMTP id s66so10286156wmf.5
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 05 Nov 2017 14:08:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=toganlabs-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=HsvkAborLAo34kmov21XsUhSKwwcAkIGo3TZ4yWef1c=;
	b=gSkzKuZl209PDUIS6tt2zphEYfMtd5jB0i133w1WeoEd+Tr9bLnTjZtETgyJmBOtr9
	VXhoQHzYcSmh0pG7yd5opl2L0ff6eaAwTJBzrA1zLg5lldLwg736ecy4SIuxQiLshQQ5
	VnBhDYdDAnytciI/IZR69bPonGNueIzk83ACdI9PkEQFzzVtM7mWv8RJAnqbUhoJYypC
	8p7f+S2ca773VmaoMsKLpI2wmDT0exrr/IfUCtbmqxJ2OyzwPJ9VDWNx8Fmw/9y8i3Dm
	mcHW0hcQg7TlR+52iofCYjVHfxVoRiQfQFCcDJaJsgqEXLUniHzTRF8671wmUPtSDaMW
	dorA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=HsvkAborLAo34kmov21XsUhSKwwcAkIGo3TZ4yWef1c=;
	b=QUAomrhNQa7E7BAF6PPSCssNhUJ36jdkF4KxHBbXtvJwi41NnwMSXMGATT1U0b2nsB
	kIGAA89qvEeZpTLkuwW47/Z2C13WRgKK4gQ8vcX9LuzA8mbF8daEdt873o5B9WSlH7MV
	sQY/GEoeLaJmxRs3IbeXjX91c98T2fwQwjGlHKQwoKUnDMnGYv3/bkbD2EtZ7NlterBx
	2NgA0actuNwnbrv7BRfYAVBpegOSlPjB3cZI7Qn47sYAMlvzWYtBApsIak5ldq2HsETg
	aW2nlmXZaUwZUAiuCSa5MhmrrR5dW7rKtgNb0oV6581kE1ev9fBY/hxTCx/VT9hJ4fl9
	W9Kw==
X-Gm-Message-State: AJaThX60bYGWWONcDLCBzLWzZWo88dZADrAIQd/0J+jxGHzWLVKQAdr+
	ks3luLlAwdkket5PmaPJS0/lPNQ2
X-Google-Smtp-Source: ABhQp+QAm7dxToIeFZz9u/SWzZJMGtQsR4U63cwP0O+b2Cq0OdKoFR5Cc/jSMuqPbztnRgakwgKYUg==
X-Received: by 10.28.225.84 with SMTP id y81mr3302561wmg.12.1509919705974;
	Sun, 05 Nov 2017 14:08:25 -0800 (PST)
Received: from build1.toganlabs.com (build1.toganlabs.com. [88.99.240.167])
	by smtp.gmail.com with ESMTPSA id
	q124sm13845688wmg.18.2017.11.05.14.08.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 05 Nov 2017 14:08:25 -0800 (PST)
From: Paul Barker <pbarker@toganlabs.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  5 Nov 2017 22:07:32 +0000
Message-Id: <1509919652-31388-9-git-send-email-pbarker@toganlabs.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1509919652-31388-1-git-send-email-pbarker@toganlabs.com>
References: <1509919652-31388-1-git-send-email-pbarker@toganlabs.com>
Subject: [meta-oe][PATCH 8/8] dumb-init: New recipe
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
X-List-Received-Date: Sun, 05 Nov 2017 22:08:25 -0000

This is a really simple init replacement for lightweight container images.

See https://engineeringblog.yelp.com/2016/01/dumb-init-an-init-for-docker.html
for more info.

Signed-off-by: Paul Barker <pbarker@toganlabs.com>
---
 meta-oe/recipes-extended/dumb-init/dumb-init_1.2.0.bb | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 meta-oe/recipes-extended/dumb-init/dumb-init_1.2.0.bb

diff --git a/meta-oe/recipes-extended/dumb-init/dumb-init_1.2.0.bb b/meta-oe/recipes-extended/dumb-init/dumb-init_1.2.0.bb
new file mode 100644
index 0000000..e1a6d95
--- /dev/null
+++ b/meta-oe/recipes-extended/dumb-init/dumb-init_1.2.0.bb
@@ -0,0 +1,15 @@
+SUMMARY = "Simple wrapper script which proxies signals to a child"
+HOMEPAGE = "https://github.com/Yelp/dumb-init/"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=5940d39995ea6857d01b8227109c2e9c"
+
+SRC_URI = "https://github.com/Yelp/dumb-init/archive/v${PV}.tar.gz"
+SRC_URI[md5sum] = "4eb7f43d7823686723ff7ac1bad097cb"
+SRC_URI[sha256sum] = "74486997321bd939cad2ee6af030f481d39751bc9aa0ece84ed55f864e309a3f"
+
+EXTRA_OEMAKE = "CC='${CC}' CFLAGS='${CFLAGS} ${LDFLAGS}'"
+
+do_install() {
+    install -d ${D}${base_sbindir}
+    install ${S}/dumb-init ${D}${base_sbindir}/
+}
-- 
2.7.4


