Return-Path: <3sRElXQMKAFgM0A6EE6B4.2EC@flex--wak.bounces.google.com>
Received: from mail-ua1-f73.google.com (mail-ua1-f73.google.com
	[209.85.222.73])
	by mail.openembedded.org (Postfix) with ESMTP id B8B957EC44
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  9 Jul 2019 22:14:08 +0000 (UTC)
Received: by mail-ua1-f73.google.com with SMTP id r11so57364uao.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 09 Jul 2019 15:14:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
	h=date:message-id:mime-version:subject:from:to:cc;
	bh=Wp5WbsVuVDxXIELLmabN8igz/YDIq8eaZWQkUCEE3nI=;
	b=N4JSq2Ojyu9eZTw/lTO1YCBNjRaXlXUpj7uKUu8+HJXreQyXGvWEBM2fZocvGP7bzq
	QWxmm91eOst6MyOiZ7s3fSOO9evwZ6b3Z7NRbcOoEGUZt2CI2LOUgTgCJcugvyEv6iHR
	jaVpcoDjcQO/ViqylOdfuWIrIoDEq0J1dkohHeQz3TySHRY2buU23QtwsAdB+KtZzvbX
	v33xL9OkNi8X/AbBh0dHc11JfryTnNluVOBK87oZXA5rAl249JGteaMPDcbTJUZhrpPC
	6TpvhbZp0clOv80bkHpWWR4W0gNEOovmc/W2EIMETyF++e/QbAvcBRJKlsmywp+sWlGN
	xdFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
	bh=Wp5WbsVuVDxXIELLmabN8igz/YDIq8eaZWQkUCEE3nI=;
	b=qH1pJKjT5hMieQ3t5h887tGqXulQD/VcdEy8LwLG43HBfLoqTcBGSsex/t5V64VGrY
	WHsSbeKqVaK4Gct5O6llYau5tkAGR3mt2EV6mG7In+nNgl1qMTI/ANXAQWdkSneAK2BD
	x+jUN5SnGeqGbfD7yDp/RAtRn1FErjR7kjryLNibLz7kyQFwUaBu/unbkhVC4h5G9RxN
	axRWbG8VyAwoQRVujvp2B0aWhNFX9/cdbhaChFcQTzaGU7D9FMkBkJd67HqTummm/O+l
	SCYf4jNRNx/Nd44cT0AadjPRncKsyY5AHAYyDpacqowkX/r63IZNBVe/E5zSAHFOLQZU
	3N8A==
X-Gm-Message-State: APjAAAXvECF98agUh1OCNAxb4QNGztfb6k2BeiA1gUCT0EOVCjE4sxcb
	Uvun5iWUI4kYQrxZEgY9SiLeoURSCY0WK7Kc36yOKvyGhzUaS2XjkK8rDArTRXH+Ih+amrBatoa
	dUQPyzVafmxMf0/DyOnxlpBJ7f7MCSxfyvihN7X4DM6Ba2H1ZeFGNu/XRdq1djraG0v9Zkucv6s
	T8egQ=
X-Google-Smtp-Source: APXvYqyJWmFbMEjF/aDcTwymaAy3KaBTzWx3kmCMt4XWeHrc1FA2alakyng3r4raqJmei86htvRt7ps=
X-Received: by 2002:ab0:7442:: with SMTP id p2mr401923uaq.92.1562710449588;
	Tue, 09 Jul 2019 15:14:09 -0700 (PDT)
Date: Tue,  9 Jul 2019 15:14:03 -0700
Message-Id: <20190709221403.114088-1-wak@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.22.0
From: "William A. Kennington III" <wak@google.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] fmt: Init at 5.3.0
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
X-List-Received-Date: Tue, 09 Jul 2019 22:14:09 -0000
Content-Type: text/plain; charset="UTF-8"

Signed-off-by: William A. Kennington III <wak@google.com>
---
 meta-oe/recipes-support/fmt/fmt_5.3.0.bb | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 meta-oe/recipes-support/fmt/fmt_5.3.0.bb

diff --git a/meta-oe/recipes-support/fmt/fmt_5.3.0.bb b/meta-oe/recipes-support/fmt/fmt_5.3.0.bb
new file mode 100644
index 000000000..be33bb863
--- /dev/null
+++ b/meta-oe/recipes-support/fmt/fmt_5.3.0.bb
@@ -0,0 +1,16 @@
+SUMMARY = "open-source formatting library for C++"
+DESCRIPTION = "{fmt} is an open-source formatting library for C++. It can be used as a safe and fast alternative to (s)printf and iostreams."
+HOMEPAGE = "https://fmt.dev"
+LICENSE = "BSD-2-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=c2e38bc8629eac247a73b65c1548b2f0"
+SRCREV = "9e554999ce02cf86fcdfe74fe740c4fe3f5a56d5"
+PV .= "+git${SRCPV}"
+
+SRC_URI += "git://github.com/fmtlib/fmt"
+
+S = "${WORKDIR}/git"
+
+inherit cmake
+inherit ptest
+
+EXTRA_OECMAKE += "-DBUILD_SHARED_LIBS=ON"
-- 
2.22.0


