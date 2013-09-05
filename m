Return-Path: <joe@deserted.net>
Received: from mail-ea0-f175.google.com (mail-ea0-f175.google.com
	[209.85.215.175])
	by mail.openembedded.org (Postfix) with ESMTP id D257F6147B
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Sep 2013 21:10:09 +0000 (UTC)
Received: by mail-ea0-f175.google.com with SMTP id m14so1184957eaj.34
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Sep 2013 14:10:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=nVMQARgri3G8ZnvsIS9e0d0nEKSp2JDf4AQ9r32fjFs=;
	b=G9pzQVNhMS8yl0RO06OAFQQEZCXBn7tEYpJZBaCJCUMhY+vB3nV/S032S784lEDoa1
	9zN87mE8QEXfcfNtgZXBLbri0ztIM4LwN5bRp/b+c/c9Fo5HkfSrEsC1xfP4QDm76SSm
	4bbXZRL+bBAx6+iYMPP7bec2yz+Vk4vHO/ByqMDbIolFlmIfFa175mdsYxN0ZXUDL4SW
	pQfbc010Jrt5lq8COjaOVCcdxyhqy/FKjhUh7eOl7WWmapM40mkZNdhzL3gJEr21kl03
	9LD3jE0FePm83FYrRK54OTgXz6YysCkVe2JDiPGiIZy70kxUCWyx39nrz439FxjRSSEO
	zcRQ==
X-Gm-Message-State: ALoCoQn3KmtZA8w3Tcmup3uvZEz53yGM/CVPx4jUrwHmF2Z7/pIvF9iuimFrPWKoN30FnKPsdqYL
X-Received: by 10.15.43.13 with SMTP id w13mr16369192eev.37.1378415410990;
	Thu, 05 Sep 2013 14:10:10 -0700 (PDT)
Received: from burninator.wrs.com ([128.224.252.2])
	by mx.google.com with ESMTPSA id j7sm51862656eeo.15.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 05 Sep 2013 14:10:09 -0700 (PDT)
From: Joe MacDonald <joe@deserted.net>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  5 Sep 2013 17:10:06 -0400
Message-Id: <1378415406-31225-1-git-send-email-joe@deserted.net>
X-Mailer: git-send-email 1.7.10.4
Subject: [meta-networking][PATCH] quagga: fix info-related QA warning
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 05 Sep 2013 21:10:11 -0000

Correct the warning:

   quagga-0.99.21: The /usr/share/info/dir file is not meant to be shipped in a particular package.

Simply remove the installed 'dir' file if info docs are installed.

Signed-off-by: Joe MacDonald <joe@deserted.net>
---
 meta-networking/recipes-protocols/quagga/quagga.inc |    4 ++++
 2 file changed, 4 insertions(+)

One of two quick hacks I've thrown together to address the issue.  Neither is
all that pretty, but this one seems to be less destructive.

Roy:  if you have a better solution in the works, please let me know, I'm just
taking a quick patch to addressing the QA issue Martin asked about several weeks
back.

-J

diff --git a/meta-networking/recipes-protocols/quagga/quagga.inc b/meta-networking/recipes-protocols/quagga/quagga.inc
index 89b9f7a..8720876 100644
--- a/meta-networking/recipes-protocols/quagga/quagga.inc
+++ b/meta-networking/recipes-protocols/quagga/quagga.inc
@@ -85,6 +85,10 @@ do_install () {
     sed -i 's!/etc/!${sysconfdir}/!g' ${D}${sysconfdir}/init.d/* ${D}${sysconfdir}/default/watchquagga
     sed -i 's!/var/!${localstatedir}/!g' ${D}${sysconfdir}/init.d/* ${D}${sysconfdir}/default/volatiles/volatiles.03_quagga
     sed -i 's!^PATH=.*!PATH=${base_sbindir}:${sbindir}:${base_bindir}:${bindir}!' ${D}${sysconfdir}/init.d/*
+
+    # Remove generated info dir file, it doesn't belong in the generated
+    # package.
+    rm -f ${D}${infodir}/dir
 }
 
 # Split into a main package and separate per-protocol packages
-- 
1.7.10.4


