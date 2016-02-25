Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f49.google.com (mail-wm0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id 29DA577294
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Feb 2016 11:10:36 +0000 (UTC)
Received: by mail-wm0-f49.google.com with SMTP id c200so23232478wme.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Feb 2016 03:10:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=1qCit/VtaR7rqFX3kfEI4di4oiagT3GxpsAHqxfOPy8=;
	b=x2cry1sBEZCj247UdDtZIeMTKQCmChYi2SJI7A9YxMgLMXdAEwxX7/lPHNAiKfTiAl
	V7Yf0Pyb6gGA55QDTvL0p6x4SYpQEIR4LnoxaZgoMtTo7lo4Ml0ch6tk+vZfvWlYy1mK
	hDPA/U/x99DRicpxJNXhlg/bg72J0EtC3o9mG1Jj9/WmD9+iNkZvXyPpzsKcEK+TDPuj
	dKbmmTzGF6fGhktDCYE8vwSVyfml2oGz9nFfuAG9oh+llPHoCIlpt5Uui4+Fk3ZY9qX+
	2YRxp5jp2xbDjRc+jXls3HFCefAv1L/VkKrOyqqBruxnTIfVW9qZXPZbDAf0XWOKKIYy
	Ebzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=1qCit/VtaR7rqFX3kfEI4di4oiagT3GxpsAHqxfOPy8=;
	b=Bw+ijDrMQgGa+BpBPpJ1bBpPXVU/1JRUiymGhl2PcPV9bye1aS7Keh1ABgCvu48ZsB
	IYmCSS+5wh4WWe/vsXuAQdPZQB0NKbGpFSInCmbPUsq6e1Q3SD3NgYIKxVrvvnbk33ku
	/TYyP41NM0k1I9Bsk8LIKtFG9jS4Y1AgDWNkl9JO4bpGn0pK0xCHdPjbEpIN93pGxN7j
	P/b2QFTcLsM7OQ9TCXUOazViX3D2vHYzPlJBqLM+a3XVhsFITVVZtgB9inci2swJm2/D
	GUYTbFEibmqt/43u2UJjghrJ9O10Z1Tp28J6lkjS4sTH4aEoJvfDRxr9sNlDsQTqPask
	Uh7A==
X-Gm-Message-State: AG10YOQT7G0J/7a9XC3b7qJM2+9o94fclu2N9sKGYMYSAtK/Z09kq3biHgesMfy80aCUyA==
X-Received: by 10.28.225.8 with SMTP id y8mr2935788wmg.23.1456398637379;
	Thu, 25 Feb 2016 03:10:37 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	et11sm7415178wjc.30.2016.02.25.03.10.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 25 Feb 2016 03:10:35 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 25 Feb 2016 12:04:39 +0100
Message-Id: <1456398279-1954-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.7.1
Subject: [PATCH][meta-oe] efivar: BROKEN: blacklist until nvme_ioctl.h issues are resolved
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
X-List-Received-Date: Thu, 25 Feb 2016 11:10:38 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-extended/efivar/efivar_0.21.bb | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/meta-oe/recipes-extended/efivar/efivar_0.21.bb b/meta-oe/recipes-extended/efivar/efivar_0.21.bb
index 3c34a7b..692b2b7 100644
--- a/meta-oe/recipes-extended/efivar/efivar_0.21.bb
+++ b/meta-oe/recipes-extended/efivar/efivar_0.21.bb
@@ -29,3 +29,13 @@ do_install_class-native() {
 }
 
 BBCLASSEXTEND = "native"
+
+# See
+# http://lists.openembedded.org/pipermail/openembedded-core/2016-February/116564.html
+# http://lists.openembedded.org/pipermail/openembedded-core/2016-February/116571.html
+# http://lists.openembedded.org/pipermail/openembedded-devel/2016-February/105802.html
+# http://lists.openembedded.org/pipermail/openembedded-devel/2016-February/105786.html
+# but it's still broken:
+# http://lists.openembedded.org/pipermail/openembedded-devel/2016-February/105825.html
+# http://lists.openembedded.org/pipermail/openembedded-devel/2016-February/105830.html
+PNBLACKLIST[efivar] ?= "BROKEN: linux.c:27:30: fatal error: linux/nvme_ioctl.h: No such file or directory"
-- 
2.7.1


