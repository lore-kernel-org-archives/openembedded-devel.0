Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
	[209.85.128.54])
	by mail.openembedded.org (Postfix) with ESMTP id 66F2D7FBFC
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  9 Dec 2019 00:39:14 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id b11so13549526wmj.4
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 08 Dec 2019 16:39:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=Ae+yJeqRCcaB8cV4PZiurbQHbxUFctyCJXo5YM52WZA=;
	b=XkswMtiaG1nrz3j0T40pktNJS1A0zrA2dps9HjTwvGuvsG145+8hGl0zpYYQFmKob2
	1a3RqcrD7l7b3rFDGeK61Q8X9pN+yDpIPLbttZ5eDPXGLBRVtwyn7sTgYc0QDhBhifA8
	kX4aMo+jHIsobHSI6a/NiGaqae4ObaR9thEVDORPcLEtHJI2dV8nNm2u0NdgELfhRCyh
	z9o718GGj5zcyCBYwWbLfaMTk/NRREx1zqQQwgWHxyYgBUiSYZS8swaMeZ+LBDRuGKBt
	oGdOtQBZLp3NT9Fsqp3rPM2MH2Dgmxcf9E1WnXVHy9jfP1zU4SsjEWwJdICYUXm/lhrD
	L6zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=Ae+yJeqRCcaB8cV4PZiurbQHbxUFctyCJXo5YM52WZA=;
	b=KPzUjVWPT3ZDBmjFfoG2cDqgvE1pDE1nfP3xkbTxVmS8xB+9eX4A3RH2YKHW8RwZNJ
	oXKKTXFdNzbQ/0L1vdHQ0qhyw4QXlppLn7y6p9UVZzJzbDHkn+3aGLmROfLSL9W3HAgc
	R9nPSWrJPq1AniDzwaMTIFfsjxUoEz7hr7Vs3B9mUPQAPL6TXBgwIgAYR/W5wRfRyiUd
	7IGJn6FYhtjoUgRgdqvqA4dmq4uOUsANAl1khbGRORv4W3HnTvGODb352HJfJ3CndRWK
	Z3Ek8boPjOim2Q1nSShguIhPbnCwfZWWOQakU3yvUKm6bdQI/YCO4D5wfggBsDQfyw6f
	mEkw==
X-Gm-Message-State: APjAAAXqTDR5C8zaNSMtQY1vo64Rl2pJzjLJrWFdxsAYpJApaKoSs7Mg
	fXAKBlbE2C8sff5faOcVYGtqF+mU
X-Google-Smtp-Source: APXvYqzM/t7AYCaK4EFMCbsqsPd3OBtO6bjyaJ1ycfOaq6kzp4BLu28D+ogEGmIejEuh5WSW3yQFOQ==
X-Received: by 2002:a1c:f213:: with SMTP id s19mr22863146wmc.42.1575851955013; 
	Sun, 08 Dec 2019 16:39:15 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F0A9021072C1E15EE839E10.dip0.t-ipconnect.de.
	[2003:f0:7f0a:9021:72c:1e15:ee83:9e10])
	by smtp.gmail.com with ESMTPSA id
	n30sm11403575wmd.3.2019.12.08.16.39.14
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 08 Dec 2019 16:39:14 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  9 Dec 2019 01:38:33 +0100
Message-Id: <20191209003840.3383-23-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191209003840.3383-1-schnitzeltony@gmail.com>
References: <20191209003840.3383-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 22/29] glfw: add features_check to inherit
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
X-List-Received-Date: Mon, 09 Dec 2019 00:39:14 -0000
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


