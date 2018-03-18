Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id E1B77606A8
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 18 Mar 2018 19:08:45 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id t6so11685070wmt.5
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 18 Mar 2018 12:08:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=v3O4tkEXParNHwi5Hs0kQXhiUpWCuTAdpAqq6r69KxI=;
	b=Ud0WKc7mSitA6LEYCEBA3+kfGua02N2VIe2ngOeIj2wke6Nkd8TAhNv7nDNxEQEE4C
	MMLmyB80srebcUjfbZESmhLYsLNtA8TLEgdPBzD7uGUuXnEbj3D7tOyyGJCTWGsWY1fT
	eT91WNdnX6y9iPAhH1JnF4UKeM2WdW83S905JuKoRPSD2xf/6PPsotkjc7UNe/l4M/gl
	9MFd0uw7FTL2YfvssjXOXGG5YBEP/eckbwyly0BakPbrb9dG8sW9vES9PZkYuqsSOR5G
	1YviJRIlVYyrLvMwKyVafuBqipVCF+gstXpW835UNRTaXFKFqGwnpu8uWAV46I+gnnBT
	XVSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=v3O4tkEXParNHwi5Hs0kQXhiUpWCuTAdpAqq6r69KxI=;
	b=sf16QX7Y7b82nS4zAZXPD5FsVtKq09dBJ5v4g/ZjmZPpIOz5C3l/0TFoTUO4RO98Ua
	XlVo3vF+7PDpqIMPsqUXYyW8BgWYQinJvgDn1c4AHxH4xH0qjsCKCwofMNNowPwsMgbk
	RMeRjSaj49tLzM7POv0KIfTWV0T+YArIhQrhkM2BmMB3FpbIHqQY4a+TWupdcuD1P2tT
	vwTvXH0rNcLSwCSaV9W92YJSFrUvmbFiqeP10oHL9asO4wy2Nfyz+5BBz16VzEc3PYlj
	j2+dnEmWSK5ciC5UCD8SbBNIsxYMXzoc2ChfCFRFJ3qlrQu+2elWPaPLEHdFJG5yajUY
	ERig==
X-Gm-Message-State: AElRT7HuZEB7QiH9xt3sjZ5C3YwnQDlVAdF5hA2qtGjnr2n0+4vsLFRA
	MHCSRXy1W4Xd4n7Jsj39QQ9MRA==
X-Google-Smtp-Source: AG47ELuMODD4Bq5VZmxlD1dVnnnCLoziTJcxa86pi2b69hWr5rfIVHbz2T8tnxTMUS1DEzULvNzsnA==
X-Received: by 10.28.141.131 with SMTP id p125mr6664064wmd.0.1521400126402;
	Sun, 18 Mar 2018 12:08:46 -0700 (PDT)
Received: from PC192-168-2-116.speedport.ip
	(p200300F07BC08B781E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:f0:7bc0:8b78:1e6f:65ff:fe3e:7f61])
	by smtp.gmail.com with ESMTPSA id
	b8sm11614531wrf.29.2018.03.18.12.08.45
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 18 Mar 2018 12:08:45 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 18 Mar 2018 20:08:26 +0100
Message-Id: <20180318190833.1393-2-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180318190833.1393-1-schnitzeltony@gmail.com>
References: <20180318190833.1393-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 1/8] glm: update 0.9.8.5 -> 0.9.9-a2 to fix x86_64 (sse-simd) build
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
X-List-Received-Date: Sun, 18 Mar 2018 19:08:46 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* Commit log shows many commints fixing sse e.g. [1-3]. Instead of creating a
  heavy patch series here let's move to the latest version tagged.
* License file 'copying.txt' was removed in [4]. License information is now
  found in 'readme.md'. License is still MIT.

[1] https://github.com/g-truc/glm/commit/8bcf9b5ae791fce37a86764b8acfd68424ac544b
[2] https://github.com/g-truc/glm/commit/1bbf2dafb9f67b14507dc37e4ee885464c5ffc78
[3] https://github.com/g-truc/glm/commit/fdfd03ffaf0e312ce0bab604982f50790e71b09f
[4] https://github.com/g-truc/glm/commit/a23911a5e9d8c631023c62be6f0cf0bf855ca482

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-oe/recipes-graphics/glm/{glm_0.9.8.5.bb => glm_0.9.9-a2.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-graphics/glm/{glm_0.9.8.5.bb => glm_0.9.9-a2.bb} (68%)

diff --git a/meta-oe/recipes-graphics/glm/glm_0.9.8.5.bb b/meta-oe/recipes-graphics/glm/glm_0.9.9-a2.bb
similarity index 68%
rename from meta-oe/recipes-graphics/glm/glm_0.9.8.5.bb
rename to meta-oe/recipes-graphics/glm/glm_0.9.9-a2.bb
index a174f2af0..ed050a148 100644
--- a/meta-oe/recipes-graphics/glm/glm_0.9.8.5.bb
+++ b/meta-oe/recipes-graphics/glm/glm_0.9.9-a2.bb
@@ -8,10 +8,10 @@ BUGTRACKER = "https://github.com/g-truc/glm/issues"
 SECTION = "libs"
 
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://copying.txt;md5=4431606d144252143c9c3df384a74cad"
+LIC_FILES_CHKSUM = "file://readme.md;beginline=21;endline=22;md5=3075b5727d36f29edccf97b93e72b790"
 
-SRC_URI = "git://github.com/g-truc/glm;branch=0.9.8"
-SRCREV = "6fa203eeb7fbcbb6f620501fad40359c8a456049"
+SRC_URI = "git://github.com/g-truc/glm;branch=master"
+SRCREV = "fcbedf5058ef8613dd02aac62ef00d55dcfeadd7"
 S = "${WORKDIR}/git"
 
 inherit cmake
-- 
2.14.3


