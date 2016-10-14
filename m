Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by mail.openembedded.org (Postfix) with ESMTP id 8B356719EF
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Oct 2016 16:31:00 +0000 (UTC)
Received: by mail-qk0-f195.google.com with SMTP id n189so8987098qke.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Oct 2016 09:31:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=lU2kwwJ2CAbyoBP+5qGVwrSK9cuPnhAXQwSCp38DHUo=;
	b=eVShqB2VADXz+XnHkabxKC8nopGX8V9zpa+4zTuH/JB8wZnv4420EViT01qPzqm95e
	slIY24tWSF7hPLAleK3VgWvMYKBk+VTFeF7DQtSwiyuhu7MbswumngdSuZ6HLniOQ0vc
	O8jFvKLeBo3f6OLJb8xkF1xMATBq2YQ586gFvduH44ztPOAaLoY0X9WF7IA9pC4rVL9g
	waXotUd2P8g+l3XDLxXmwb7TaMw0hi/lRWAkBAET5JD36iVcaOBHdDe1vuIAF1cvF8lH
	4+iZBM614BcuIuwY0oG7xK+zvzq2nG5xu8e/C1XJ7frkUsoxntMgL8rD5DzMScE/Dzp+
	jTHw==
X-Gm-Message-State: AA6/9Rlsx55RYj5MFoZIONyHpElr/5j0Pga5iU0clSuG4eEQ6JqDANop1NIjxlOAypzqCQ==
X-Received: by 10.55.168.209 with SMTP id r200mr14398694qke.160.1476462662227; 
	Fri, 14 Oct 2016 09:31:02 -0700 (PDT)
Received: from sparta.ny.asterius.io (ool-457cd903.dyn.optonline.net.
	[69.124.217.3])
	by smtp.gmail.com with ESMTPSA id a26sm7919213qka.2.2016.10.14.09.30.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 14 Oct 2016 09:31:00 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 14 Oct 2016 12:30:45 -0400
Message-Id: <1476462645-15223-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-oe][PATCH] libsoc: update to version 0.8.2
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
X-List-Received-Date: Fri, 14 Oct 2016 16:31:02 -0000

 * License file changed to 'LICENCE' but the terms remain the same

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-oe/recipes-support/libsoc/{libsoc_0.8.1.bb => libsoc_0.8.2.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/libsoc/{libsoc_0.8.1.bb => libsoc_0.8.2.bb} (89%)

diff --git a/meta-oe/recipes-support/libsoc/libsoc_0.8.1.bb b/meta-oe/recipes-support/libsoc/libsoc_0.8.2.bb
similarity index 89%
rename from meta-oe/recipes-support/libsoc/libsoc_0.8.1.bb
rename to meta-oe/recipes-support/libsoc/libsoc_0.8.2.bb
index 9c1a520..01708df 100644
--- a/meta-oe/recipes-support/libsoc/libsoc_0.8.1.bb
+++ b/meta-oe/recipes-support/libsoc/libsoc_0.8.2.bb
@@ -5,11 +5,11 @@ DESCRIPTION = "libsoc is a C library to interface with common peripherals (gpio,
 HOMEPAGE = "https://github.com/jackmitch/libsoc"
 
 LICENSE = "LGPLv2.1"
-LIC_FILES_CHKSUM = "file://COPYING;md5=e0bfebea12a718922225ba987b2126a5"
+LIC_FILES_CHKSUM = "file://LICENCE;md5=e0bfebea12a718922225ba987b2126a5"
 
 inherit autotools pkgconfig python-dir
 
-SRCREV = "7fc953f980f4a51f0272ad691d3aa06b6aedbf16"
+SRCREV = "fd1ad6e7823fa76d8db0d3c5884faffa8ffddafb"
 SRC_URI = "git://github.com/jackmitch/libsoc.git"
 
 S = "${WORKDIR}/git"
-- 
2.7.4


