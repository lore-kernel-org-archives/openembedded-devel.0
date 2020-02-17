Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
	[209.85.210.195])
	by mail.openembedded.org (Postfix) with ESMTP id D93D46151A
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Feb 2020 19:08:15 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id 84so9383129pfy.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Feb 2020 11:08:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=S0FE9z1FsR1AnGWvT6FauNE37Xf5727edzZASvN48+c=;
	b=eSXUaYGvXcuebd7i7nOwK8ebxWnjEvYKxDaN/HvFsPgmYQlvx11s8OM4ZK6cRIXnbr
	3osGsQ0ynukZiGz3zV6GhgbcvRvSKNY4cM+284vQ2LujiLTOg3Tb8JovSVWjNi8OPNcF
	rJyYcLOg77JzM3Z/WcTgZZ+DfYRO4TwAgVoxpGPqLbt/xCOBVXpm+gISQRBs8U6ZG7ph
	uaH4VUykXSHxo8YMbD86rrrNguCXx/pGCzuEJMIp5ov1WZ3OQEBwibYePRrSo13p3zxF
	wBCxEb21bKB2Ovu+TJ+A+qxF7iIlZ1nY8HUk8wAmTp2woXuPRl1A3YuW73b+xKX9qfTa
	3B1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=S0FE9z1FsR1AnGWvT6FauNE37Xf5727edzZASvN48+c=;
	b=p7ggg4LpV1DFY46r1DGLpBOYXGlaW+pZAnsBX9u16gRWo2wcEoWQH43Tb4dmao0x9B
	RwNzADbcF0vHN7UxS7p7BWTjbe5c9s6qc2hJSU+2PDYuodj9P+1HBPUwvrFzybyJKnxu
	7XYuXBrWIazA4wPL6oMz5hvnAXu+cn8QY3X3w1jjVxisWVuErQQL8wXf8FH8E+iDKwZW
	HkC7uw+yKR8AjLa31D/nQrzPAKyqrpzLd9BkZ2fQd9+I2e2OfMTZDzOBCYX9AKtLkXn5
	6ELTWH+sJINM2fDZL586wU6WrcNyU5hdr2SITO128em/hizsHdWoSe52qONj1mQoOsqj
	K5YA==
X-Gm-Message-State: APjAAAU3FNNee/aiuZxVZ35OGAXtcBkIv/rHRJ8BHS8+yaqdakBBzTm5
	1gd39eRi1CEdCuDkg6En2fbc98Mf/Oc=
X-Google-Smtp-Source: APXvYqzDhEij3PPMgM7s+/PZyCdI48fi0JG7p6zgXMysYsBTkvjsGS8cdmmGwOBheSrw5jSo9o6yeQ==
X-Received: by 2002:a17:90a:bc41:: with SMTP id
	t1mr516403pjv.137.1581966496165; 
	Mon, 17 Feb 2020 11:08:16 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::98a3])
	by smtp.gmail.com with ESMTPSA id 4sm1239028pfn.90.2020.02.17.11.08.15
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 17 Feb 2020 11:08:15 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 17 Feb 2020 11:08:17 -0800
Message-Id: <20200217190817.1798159-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Subject: [meta-oe][PATCH] mpv: Disable lua support for riscv
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
X-List-Received-Date: Mon, 17 Feb 2020 19:08:16 -0000
Content-Transfer-Encoding: 8bit

luajit port of risc-v does not exist yet

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-multimedia/mplayer/mpv_0.32.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-multimedia/mplayer/mpv_0.32.0.bb b/meta-oe/recipes-multimedia/mplayer/mpv_0.32.0.bb
index 066e18aa86..3d325e24e6 100644
--- a/meta-oe/recipes-multimedia/mplayer/mpv_0.32.0.bb
+++ b/meta-oe/recipes-multimedia/mplayer/mpv_0.32.0.bb
@@ -28,6 +28,8 @@ LUA_mips64  = ""
 LUA_aarch64  = ""
 LUA_powerpc64  = ""
 LUA_powerpc64le  = ""
+LUA_riscv64  = ""
+LUA_riscv32  = ""
 LUA_powerpc  = ""
 
 # Note: both lua and libass are required to get on-screen-display (controls)
-- 
2.25.0


