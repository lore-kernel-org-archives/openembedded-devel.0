Return-Path: <3DxIlXQMKALYsWgckkcha.Yki@flex--wak.bounces.google.com>
Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com
	[209.85.214.202])
	by mail.openembedded.org (Postfix) with ESMTP id 6E66C7EC44
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  9 Jul 2019 22:15:42 +0000 (UTC)
Received: by mail-pl1-f202.google.com with SMTP id y9so147214plp.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 09 Jul 2019 15:15:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
	h=date:message-id:mime-version:subject:from:to:cc;
	bh=2BuQz5UHtHqnshiNkSAJrffI9L/D1IVKYObSofYchVU=;
	b=agI4pE0QkJpWWT6V8YSpkU2fGbcjjSvy7ux7KjBgIryuS2HHIKGFrp2QvBBnKTnxZd
	GBARlWdUPyKK0l2Bbboi5rj55xaY1cq2e5YZLjt1H7D7VoiscUVB56Y3N1NhWW4xBZoQ
	oGbX/qvp5mO4penFP3PoXU2gclp9a5Sop/UouMS/SbnwpTPdcetw0QmjChZMTMPQ4cDr
	BOXvedUs0naevyrGm/BFwwXKh4xGBiuEadxtg9fLey458xOnGVu/VsAeHR7XSjM4zvEl
	jUY6EH84INudyPC1sulDl2StfsfLMXpIGXzZF3lX+s/UjXANBF1hTBADGLZQiknJHtvQ
	IbFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
	bh=2BuQz5UHtHqnshiNkSAJrffI9L/D1IVKYObSofYchVU=;
	b=HQp/0kFQUWs8fAmcDje1nBMAp5B+KdIMDmGHaeyGZIeHuM4NFViIJUt9mNAbFlaB5T
	nWMXsRK5be65453XEU/2PiWTldHkesmrGVt/+XnX8Cw5lYOoj8OFwXbKXO/J1DRAqjp5
	8gxpMoPU4ks2a2sayUpHL0OB37f8KgkK3ugv+pDpnXl6do8faZYpAKT6NuO0gaXj0bdG
	jPlQnuOwGPWlmAhYrW3ck622GpwkZyulrbh8umJ6Y8U8jLhTjU1G+A3X5qWGV9X1OcjP
	b1MD3NNzwLgqaKZuuNEYmxHfqb5PylqKAKMLmd3MNPd8e+ScGdbxGONMBDl4DOSKw2Wt
	LHuw==
X-Gm-Message-State: APjAAAXJDpojGSCXbDSkcyhsuqMxbCpChw/HWfCIuVVG8dveNUeLyISd
	5+aj4XTmQCJS2lgrwA3EfC3wNPeXggE1rz7w45hOdXkVtJOFT6ROR2f9gJBwdktbjAiKmekwBJ4
	Lp1M/XygqhmNDArPn0sBnuWvNOoyyyZlNIDVxrBq7x7j/hHF38KAkodFqfbPCabdtplT5dOrHJZ
	XlJss=
X-Google-Smtp-Source: APXvYqzp5nrci0TyNdr04OHz9UmUkis+m9fuf3xgmw0TNhc4kq0BNFl0bwpv80Ucswl71xPr6z+volA=
X-Received: by 2002:a63:56:: with SMTP id 83mr33611669pga.145.1562710543209;
	Tue, 09 Jul 2019 15:15:43 -0700 (PDT)
Date: Tue,  9 Jul 2019 15:15:38 -0700
Message-Id: <20190709221538.116780-1-wak@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.22.0
From: "William A. Kennington III" <wak@google.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] cli11: 1.7.1 -> 1.8.0
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
X-List-Received-Date: Tue, 09 Jul 2019 22:15:42 -0000
Content-Type: text/plain; charset="UTF-8"

Signed-off-by: William A. Kennington III <wak@google.com>
---
 .../recipes-support/cli11/{cli11_1.7.1.bb => cli11_1.8.0.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/cli11/{cli11_1.7.1.bb => cli11_1.8.0.bb} (79%)

diff --git a/meta-oe/recipes-support/cli11/cli11_1.7.1.bb b/meta-oe/recipes-support/cli11/cli11_1.8.0.bb
similarity index 79%
rename from meta-oe/recipes-support/cli11/cli11_1.7.1.bb
rename to meta-oe/recipes-support/cli11/cli11_1.8.0.bb
index 1ed97a27e..b6a434159 100644
--- a/meta-oe/recipes-support/cli11/cli11_1.7.1.bb
+++ b/meta-oe/recipes-support/cli11/cli11_1.8.0.bb
@@ -2,8 +2,8 @@ SUMMARY = "C++11 command line parser"
 DESCRIPTION = "A command line parser for C++11 and beyond that provides a rich feature set with a simple and intuitive interface."
 HOMEPAGE = "https://github.com/CLIUtils/CLI11"
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=8489f3831fc7b75264c1d5e346251a74"
-SRCREV = "49ac989a9527ee9bb496de9ded7b4872c2e0e5ca"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=b73927b18d5c6cd8d2ed28a6ad539733"
+SRCREV = "13becaddb657eacd090537719a669d66d393b8b2"
 PV .= "+git${SRCPV}"
 
 SRC_URI += "gitsm://github.com/CLIUtils/CLI11 \
-- 
2.22.0


