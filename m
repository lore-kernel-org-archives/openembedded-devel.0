Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id CD9ED77E33
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Mar 2017 16:43:20 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id g2so18478276pge.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Mar 2017 09:43:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=HdN6Q2bqMJz8gOEzsqa//Pmc3lHmqa626QFIEHQTwd0=;
	b=CdHYNo1GDdWu5TqbkB20Qt5p7L3WUXsXoA46tgkFzQI9Ifrany32oabENyqH0LtV1V
	cBqN82QWFAndNWgr+x1WRW9/B6OsbYmmVz5FxaRL9XHMpu3jR7YkH+hdgdZE3vIbwDFw
	hqn7STbZX93NrOzfF+sTqTf7QLBksO1BqXkWti2Zj5Tc38dMZy0UbZPeUFNma0g1HmkM
	H+aNJ242g+vqKvj+16lmBdskme1j6wuWOVjKNgTTWA8hYQmf9u/yvskbIRuW4voWljvq
	E5OqfYJut5vYnT3MVFrxzeimPStffJAICdftR07AEZEbHuMR+z1uZyfeXXWsmYnpMI99
	DxDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=HdN6Q2bqMJz8gOEzsqa//Pmc3lHmqa626QFIEHQTwd0=;
	b=gdcJlZGLSI1jQ912DfBtjVrZLnqEi+tlajODezYxAQXRU3+hZMxb1JLpAm6PBIyDfd
	VYeQ6YCcDhK5eEqe2pNzedJG57x/8HLeiQj1sWZAPuwT+WfHtcczSU8VOmqIJ/fsKqdP
	RWrqh38DA1sOTCFbwKNYKYQZu32jg7nm2e87L3JmtMXVbbaDnJKr8yUALQCSyABEnfQc
	asoJLqshda+TWSSHczbfy93pe3za7Ekx6OsF9v1rrC+R9J8Wd1H0xj89GgxXhAOrl+CD
	xT/TuwK7650M9g7AGLrbUORNJ2gu14+pi0ZU8i6i9akbNjscwEMcA68YxffVbcpg8Mty
	DEjA==
X-Gm-Message-State: AFeK/H3SziBI44fJ/rgM/2GVwp2zIjFAqJK0DjHlrmDXuafzXh2HKGQ8uDoW0UpYeM3LVg==
X-Received: by 10.99.123.72 with SMTP id k8mr4203480pgn.139.1490978602363;
	Fri, 31 Mar 2017 09:43:22 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	a5sm11569706pfh.124.2017.03.31.09.43.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 31 Mar 2017 09:43:21 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 31 Mar 2017 09:42:23 -0700
Message-Id: <20170331164247.5052-19-raj.khem@gmail.com>
X-Mailer: git-send-email 2.12.1
In-Reply-To: <20170331164247.5052-1-raj.khem@gmail.com>
References: <20170331164247.5052-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 19/43] libraw1394: Update to 2.1.2 release
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
X-List-Received-Date: Fri, 31 Mar 2017 16:43:20 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../libraw1394/{libraw1394_2.1.0.bb => libraw1394_2.1.2.bb}           | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/libraw1394/{libraw1394_2.1.0.bb => libraw1394_2.1.2.bb} (71%)

diff --git a/meta-oe/recipes-support/libraw1394/libraw1394_2.1.0.bb b/meta-oe/recipes-support/libraw1394/libraw1394_2.1.2.bb
similarity index 71%
rename from meta-oe/recipes-support/libraw1394/libraw1394_2.1.0.bb
rename to meta-oe/recipes-support/libraw1394/libraw1394_2.1.2.bb
index 811829ebc..337780789 100644
--- a/meta-oe/recipes-support/libraw1394/libraw1394_2.1.0.bb
+++ b/meta-oe/recipes-support/libraw1394/libraw1394_2.1.2.bb
@@ -5,7 +5,7 @@ LICENSE = "LGPL-2.1"
 LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=d8045f3b8f929c1cb29a1e3fd737b499"
 
 SRC_URI = "https://www.kernel.org/pub/linux/libs/ieee1394/${BPN}-${PV}.tar.gz"
-SRC_URI[md5sum] = "d06cccb776b240b6ab5efdee33b87af2"
-SRC_URI[sha256sum] = "a83cff16fb8885831bc29d7d17f3c570dc39251d89e20795c08e87720de0ba70"
+SRC_URI[md5sum] = "45031ab15ca93e50c19886a38bc1814a"
+SRC_URI[sha256sum] = "ddc4e32721cdfe680d964aaede68ac606a20cd17dd2ba70e2d7e0692086ab57c"
 
 inherit autotools
-- 
2.12.1


