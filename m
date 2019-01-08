Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
	[209.85.215.195])
	by mail.openembedded.org (Postfix) with ESMTP id DBED67BFAA
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  8 Jan 2019 22:05:18 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id s198so2343258pgs.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 08 Jan 2019 14:05:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=joDd5x1rkRXJKJXBtYBilKSUJ8qCuo7jQDkwua9ZxCc=;
	b=JTi2mmzjiY7+3NVze6Q64jG2asxuha3uSUK6yQUOuT2oHZIuda9AXb4KE5gkCHozDL
	ov4xQHO8Q14R50XcPheXQ2kohi0dly56p4CvZ27d1v2Hted8iwJ5owBS2jspstJTjJG6
	B3QavsAdXE6pOVASMIfNIGuxAcqBEqYMXC6SHd9U33tJOk02OQXbehEFxDv/jZH8I1cW
	S79G4+XvzFwrmt4DzhQskua8zeVxJz5uzP/ejNPPhRD2ba+dEUefusNupu+plu9J5QBM
	aR+OUbsCPD1PNJFKQJc5q9CT9+mWXPI+on0j1a5WbGW6s5BVszK7rremITi4/kgb+rjX
	phOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=joDd5x1rkRXJKJXBtYBilKSUJ8qCuo7jQDkwua9ZxCc=;
	b=ubDTk2UMSIR6MJ1K+Bs1bvD2cPAB+kfZYix03NciVLFzHdGY00wHTuYBML0umJwexD
	uEsfF0AbkNm3bhAqR+Q6OnydoDyybxEr7ESzbdQdRmCt+CqK+sM3FTAkX4bBr+ZmTLuG
	lj0ZIySfaBus65iJzF0LMzh7uZO+mbCYjJGtZDjfKsBMR+8hPJz/LAWn/b3PdZwaZTda
	48MLsijBlf/lpt3bdXTGBgwJ7IXFVnhiq8dHnXSshSgCKAUvBcz+X4VPGlO6HxoQGe4p
	xDIifOJ8rdAdvdekkxnHFeHgxg/miJDGjDwC5erAJw1EVKgRtpr2ySF9EQ5Cz4Ji+f6z
	3O/Q==
X-Gm-Message-State: AJcUukdDnnerJ5I3j/U1jiuc1ILa7a6NZg0YYSVSERRpFM/ttGioQmZj
	wl4FyWLixVPkryfwbC7jF9u0tA+wAGA=
X-Google-Smtp-Source: ALg8bN4bT07jrNig/mVXoVUmvZnSkO6gF97iDWA7Dj8iHqFpYTindUmXNj8aX3umyYH1jvA7ChRenQ==
X-Received: by 2002:a63:4002:: with SMTP id n2mr3034786pga.137.1546985119398; 
	Tue, 08 Jan 2019 14:05:19 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:877f:9499::6e98])
	by smtp.gmail.com with ESMTPSA id
	b27sm104995752pfh.113.2019.01.08.14.05.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 08 Jan 2019 14:05:18 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  8 Jan 2019 14:05:11 -0800
Message-Id: <20190108220512.44077-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: Ferry Toth <ftoth@exalondelft.nl>, Ferry <ftoth@telfort.nl>
Subject: [meta-oe][PATCH 1/2] libgpiod_1.2: add dependency on python when building python bindings
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
X-List-Received-Date: Tue, 08 Jan 2019 22:05:19 -0000
Content-Transfer-Encoding: 8bit

From: Ferry <ftoth@telfort.nl>

Commit ab54dd75 "libgpiod: Rrecommend python3 only for PN-python package" also removes the build dependency
on python3 however this results in fatal error: Python.h: No such file or directory #include <Python.h>

Signed-off-by: Ferry Toth <ftoth@exalondelft.nl>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/libgpiod/libgpiod_1.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/libgpiod/libgpiod_1.2.bb b/meta-oe/recipes-support/libgpiod/libgpiod_1.2.bb
index dd080ff9d2..93165a0c2d 100644
--- a/meta-oe/recipes-support/libgpiod/libgpiod_1.2.bb
+++ b/meta-oe/recipes-support/libgpiod/libgpiod_1.2.bb
@@ -7,7 +7,7 @@ SRC_URI[sha256sum] = "b6b9079c933f7c8524815437937dda6b795a16141bca202a9eec70ba58
 
 PACKAGECONFIG[cxx] = "--enable-bindings-cxx,--disable-bindings-cxx"
 
-PACKAGECONFIG[python3] = "--enable-bindings-python,--disable-bindings-python,"
+PACKAGECONFIG[python3] = "--enable-bindings-python,--disable-bindings-python,python3"
 inherit ${@bb.utils.contains('PACKAGECONFIG', 'python3', 'python3native', '', d)}
 
 PACKAGES =+ "${PN}-python"
-- 
2.20.1


