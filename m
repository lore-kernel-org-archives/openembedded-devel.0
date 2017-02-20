Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f196.google.com (mail-qt0-f196.google.com
	[209.85.216.196])
	by mail.openembedded.org (Postfix) with ESMTP id E358D71DA3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Feb 2017 18:44:43 +0000 (UTC)
Received: by mail-qt0-f196.google.com with SMTP id n13so15038453qtc.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Feb 2017 10:44:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=VlJJjGuA7Qh5CjxDCkJdd0eKr4VEEXp279nt4ELz94Q=;
	b=jdew3gqyuxg19kP3SFs0vQUdKJ4nnhEHZYxvrJuv16jxqYWk+9X35VajyjVV6vbkT/
	lt/zuXlLEHADC+aWXrqBtz9q4EBMiek67S9f7VKvZe/HEmx7nR1DkjyVNDhs7s8gfXiG
	sSzum9pqk2BU9/Wto8819YqMkAxQSm1OOY0ZYMzgJxX9JP8yQIYvlEhr/LZXrRIdpAr7
	c8ZQfDFivW3bR46Eesvu4uzwDNo1VTmaMSpyKRhYjFLpDC2Pnck1WaMyE9TL9htSIYHV
	sIGOCducUAAad9XkAiLinzPsXh3kUoP4d0qjOs4VkX8etQKlSdjgS7HxTiNtz6La7fLL
	3Omw==
X-Gm-Message-State: AMke39mY0qnfqjX1tVpXy69IoH2ebpfXXaYmIXkEzyvl+nVdaK7KbtcNYlCW6PGLkD8YjQ==
X-Received: by 10.237.55.169 with SMTP id j38mr19761735qtb.286.1487616283702; 
	Mon, 20 Feb 2017 10:44:43 -0800 (PST)
Received: from sparta.ny.asterius.io (ool-435561e0.dyn.optonline.net.
	[67.85.97.224]) by smtp.gmail.com with ESMTPSA id
	h40sm12504158qtb.6.2017.02.20.10.44.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 20 Feb 2017 10:44:43 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 20 Feb 2017 13:44:25 -0500
Message-Id: <1487616265-24853-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-oe][PATCH] nodejs: update to version 4.7.3
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
X-List-Received-Date: Mon, 20 Feb 2017 18:44:44 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-oe/recipes-devtools/nodejs/{nodejs_4.7.2.bb => nodejs_4.7.3.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-devtools/nodejs/{nodejs_4.7.2.bb => nodejs_4.7.3.bb} (96%)

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_4.7.2.bb b/meta-oe/recipes-devtools/nodejs/nodejs_4.7.3.bb
similarity index 96%
rename from meta-oe/recipes-devtools/nodejs/nodejs_4.7.2.bb
rename to meta-oe/recipes-devtools/nodejs/nodejs_4.7.3.bb
index 4f4b43a..d4166f5 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_4.7.2.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_4.7.3.bb
@@ -12,8 +12,8 @@ COMPATIBLE_MACHINE_mips64 = "(!.*mips64).*"
 SRC_URI = "http://nodejs.org/dist/v${PV}/node-v${PV}.tar.xz \
     file://no-registry.patch \
 "
-SRC_URI[md5sum] = "eb55fc7700acb7d65fa8cbbbecf4ebb0"
-SRC_URI[sha256sum] = "ad1b8309a621f725b5d8205f0fc5bbb7b396a438c108e6fba417c1a914932dfc"
+SRC_URI[md5sum] = "80db1fad0224f6f44a630ef4abea333a"
+SRC_URI[sha256sum] = "7f35dc7adf0b348857b98e543a54c2b2cafb92c27d9d32799a81ac66cbf035f0"
 
 S = "${WORKDIR}/node-v${PV}"
 
-- 
2.7.4


