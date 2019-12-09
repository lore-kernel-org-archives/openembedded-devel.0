Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
	[209.85.221.54])
	by mail.openembedded.org (Postfix) with ESMTP id 219787FC16
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  9 Dec 2019 08:36:34 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id z7so15059273wrl.13
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 Dec 2019 00:36:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=Ae+yJeqRCcaB8cV4PZiurbQHbxUFctyCJXo5YM52WZA=;
	b=DL5aW02+wWc929FbkJyDEvTJihyj5OBoBg+h7uMrUmptTCm0YYM6uKN0dmEzifNT4j
	gOutLK/QKp/z4bjpt+tdOsG5ZB1MDBDVwozgEbSHXTAfLMYyFrjRSFty+FCFvNcVCj8f
	nwijjLABO555PqjdPs/i1u2zGOipxbxCSXsk4FGBNo8gYyum7x9aVoo1tfYR4o8HlZJO
	nV9HV3YMu/ZWarsCIQspIwbkjXLd9dkrcRNLjht1XT7YSx1RWi9UhwkcCS62+TNw+ETG
	oia0V/yhN2ZdPBCvDzxpb71hTeUw8DD7HReds4D96rxEPo74mid4QZvmGukJjJC0chBp
	yAPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=Ae+yJeqRCcaB8cV4PZiurbQHbxUFctyCJXo5YM52WZA=;
	b=hUbtXfGflVgiJ0YnhGtgpWjpeeylus6Gg7zSiorwTQiO87Qiy8xpY3fO6FmfqWMPsn
	OokDR32yr2TReZY2AhpecymECR8m+gJu0XT2GflD59lBXA40klNCbVR+Zu+k18OdSLuu
	tAxqm4Pe5+4PVe6bJuQkY1d+8AilMUUUoDauQ91P2ULYd60Z6lGiF7VNkK/BkQ2eK71S
	T4C8VMlab2XCzuXNDm2DK2P9jzgC8SL2okQx3syQY623TDky6WnG3QWaEel3pfgImiPb
	0E8PjTUXpGHT051DfHbs2ZqT0nCBVfAzO7NQPDM2Sehxo2qzz18AWrnzKCoyAXuYnXsX
	Y9kg==
X-Gm-Message-State: APjAAAX7h9spPq7M3m1MazZouKEpni7uGw2zvjuIS+SJWzYpwEO2WctB
	LCx4DLpFZu98IN7Nw+ZH8Obcf0IC
X-Google-Smtp-Source: APXvYqw3iVNre4I0VA3Ta8I8cODvnLv0VeyiGq1wpfOgirv2CRdLzsRx8ZE5iA7QYZuEaDXK03rlvg==
X-Received: by 2002:adf:e5cb:: with SMTP id a11mr706841wrn.28.1575880595598;
	Mon, 09 Dec 2019 00:36:35 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F05A251D39764436B44384E.dip0.t-ipconnect.de.
	[2003:f0:7f05:a251:d397:6443:6b44:384e])
	by smtp.gmail.com with ESMTPSA id
	e18sm29450149wrw.70.2019.12.09.00.36.34
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 09 Dec 2019 00:36:34 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  9 Dec 2019 09:36:05 +0100
Message-Id: <20191209083612.23922-14-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191209083612.23922-1-schnitzeltony@gmail.com>
References: <20191209083612.23922-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH][v3 13/20] glfw: add features_check to inherit
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
X-List-Received-Date: Mon, 09 Dec 2019 08:36:35 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Without this REQUIRED_DISTRO_FEATURES is a noop

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-oe/recipes-core/glfw/glfw_3.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-core/glfw/glfw_3.3.bb b/meta-oe/recipes-core/glfw/glfw_3.3.bb
index e3853a201..da2bae37a 100644
--- a/meta-oe/recipes-core/glfw/glfw_3.3.bb
+++ b/meta-oe/recipes-core/glfw/glfw_3.3.bb
@@ -8,7 +8,7 @@ LICENSE  = "Zlib"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=98d93d1ddc537f9b9ea6def64e046b5f"
 SECTION = "lib"
 
-inherit pkgconfig cmake
+inherit pkgconfig cmake features_check
 
 S = "${WORKDIR}/git"
 SRC_URI = "git://github.com/glfw/glfw.git"
-- 
2.21.0


