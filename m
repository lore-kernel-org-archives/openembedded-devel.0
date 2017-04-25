Return-Path: <raj.khem@gmail.com>
Received: from mail-io0-f194.google.com (mail-io0-f194.google.com
	[209.85.223.194])
	by mail.openembedded.org (Postfix) with ESMTP id 8516877A65
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Apr 2017 03:47:32 +0000 (UTC)
Received: by mail-io0-f194.google.com with SMTP id d203so52527424iof.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Apr 2017 20:47:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=xT0IFuoOmrEAGMe+0VTAbazoiIKJTMubnkCwMu6JoBk=;
	b=MYHmzvmB3cnGvB7bm1VX+DXa/M0uuqQwes5M/pEvk4qw5gGGwc6CvgZC6yhdoITTyi
	QYAEFl/vgZ8As3CcqJryGugl1izNkbNdFuCEffUATCI+jqY+8kr0chuyXS5e59iX7e8e
	Aiw6itgtWop6fh4+Gqpv6cOuC0TMWPUZTdLc53Oe0v5IOusgSe1izWc5nIGXgNbOO6tf
	WQaDrSn1hFFNyeAIIdBN/zO5xXy8OXBgdEoLKo42bgAw/2ovyG90u+PZPKTeDeFzwwdk
	mlPYV7Rh8sbn+uRDTt/7IAf9t1Uo9iYQkJjPnL6Kd9jRSCo87IoukQ6S5nU/iYt4+DlW
	0Qjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=xT0IFuoOmrEAGMe+0VTAbazoiIKJTMubnkCwMu6JoBk=;
	b=fsD+QXBFzOKOXaqUrTu73MXz/nO06+MCC/0/9NknT3dJxkbbZ2+XlOJaYEyvN/s1Lc
	peDwoGJMcA6gRjXaTnf+5WbCAcT9ir2MrPa+sN/CPrLpnBO6sHE7bxipgVMq0AzT9AHA
	mN1LvYxNpLVzh/FG1NNsJARyZNyMy22KZB0iCkce3NPvz0gfwdaKcn21HL10MNEg38id
	npqE+c2bAZSvsR5oOx/RmFQKDjz6W6IEVoKNcFyxGkryT2QRmelIxBoDmlHbtolfEWt1
	YcTlc5znt5CWvYWaonvnEi+1d/J/gpiveA3RNHyxhp9Sir+o9YnpEGhZ1WPANd0zadkr
	+FbQ==
X-Gm-Message-State: AN3rC/5O/JB1PuF6l/SUtmKiVNxViRBJvPw0ZCAWDGwG6hxUOktSzRKG
	ue2T/gsl+40yGw==
X-Received: by 10.107.134.76 with SMTP id i73mr11392031iod.0.1493092053497;
	Mon, 24 Apr 2017 20:47:33 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192])
	by smtp.gmail.com with ESMTPSA id 9sm1244118itm.6.2017.04.24.20.47.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 24 Apr 2017 20:47:32 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 24 Apr 2017 20:47:09 -0700
Message-Id: <20170425034719.8630-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.12.2
Subject: [meta-oe][ 01/11] mpv: Add libxkbcommon when configuring with wayland
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
X-List-Received-Date: Tue, 25 Apr 2017 03:47:35 -0000

Fixes

Package xkbcommon was not found in the pkg-config search path.
Perhaps you should add the directory containing `xkbcommon.pc'
to the PKG_CONFIG_PATH environment variable
No package 'xkbcommon' found

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-multimedia/mplayer/mpv_0.24.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-multimedia/mplayer/mpv_0.24.0.bb b/meta-oe/recipes-multimedia/mplayer/mpv_0.24.0.bb
index ce7b3d1e1..b1da2175d 100644
--- a/meta-oe/recipes-multimedia/mplayer/mpv_0.24.0.bb
+++ b/meta-oe/recipes-multimedia/mplayer/mpv_0.24.0.bb
@@ -37,7 +37,7 @@ PACKAGECONFIG[libarchive] = "--enable-libarchive,--disable-libarchive,libarchive
 PACKAGECONFIG[jack] = "--enable-jack, --disable-jack, jack"
 PACKAGECONFIG[vaapi] = "--enable-vaapi, --disable-vaapi,libva"
 PACKAGECONFIG[vdpau] = "--enable-vdpau, --disable-vdpau,libvdpau"
-PACKAGECONFIG[wayland] = "--enable-wayland, --disable-wayland,wayland"
+PACKAGECONFIG[wayland] = "--enable-wayland, --disable-wayland,wayland libxkbcommon"
 
 SIMPLE_TARGET_SYS = "${@'${TARGET_SYS}'.replace('${TARGET_VENDOR}', '')}"
 
-- 
2.12.2


