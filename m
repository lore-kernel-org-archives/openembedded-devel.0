Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id E8F85789E6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Mar 2018 20:29:34 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id l9so8434773wmh.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Mar 2018 13:29:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=KEaMyS2qwKP/rcljoVY+vkfHxb+6GOJVLZcHiNAI2Sw=;
	b=OlJqgz1Uqsd2wOCiO746YfAAkjcsbjLRPugr56iao+Jo/Fz7FUKdZmgH4LBx3hP8lK
	uspIl20nFFEwFOgukgSogXlhQSdWQE81GoUzH5f1cWuwBkbGQEU7IdaKnf5Esu6VlE8U
	Gd8om5Oy9wqUwnXdP+ElW/PbPGnVWzmcH1fnmcXQYHiQeaxesSVInyiRNyJ7PuO8bG//
	loEWw0C28Fq0KVmGjq5J4XQZwBX/+y9+QQQdH5VfHdm338LxcUv9Ge/nJcibIQnoogfp
	JB4EPpuKsq7kfByZ45tUW1LkMHG3SXnrfCg82Zke8NPNRO9oYHKeaN5t1ouBWl3SAFY4
	NoeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=KEaMyS2qwKP/rcljoVY+vkfHxb+6GOJVLZcHiNAI2Sw=;
	b=DBc7zYz5q1f2AdwM67S5UqrlY+HTIiNmHa5JZziNgiYDUyoNK2w5z0B2vHU25zzYCD
	+rJOHw2z2FcQv863QHPHRUYhizKqqkL6ON7rj/75SrfVoBQWSnJIi57HLWZVCVWKC/bU
	sY1BNqS/McAc8Ut/Bxt/l0MpDSz2rjGHVwAS6jkyhzpyJU75dpKGeB8v/Xf8TGOYEM5K
	Y3c5Yd4x8/nQBH8/ErGMAF80n2cumY1qng5n3JnsqFSeLgzR9JqLXzKi5s+qorgsA/zl
	Ax6NYeQhYdcIh47zyvsyKBr1NlLP7r9WKG3kHE98NcJhpc/HjJRAI1IBOgCmdoMaltfB
	/5Ug==
X-Gm-Message-State: AElRT7GS4KzqCTAoLPPyTfAhfxYIxqLR0DQFbxDnQ68PhPioK3L5Bi9W
	u0ioc3VwdesnMSY0RV1c/KcTkA==
X-Google-Smtp-Source: AG47ELvmiLl/W4coAUqn1diGGe2N/IMdHnIp65r2pDnDJQChs3VCdQWAcgvymVN5PDohNUaFztBQgA==
X-Received: by 10.28.91.195 with SMTP id p186mr86890wmb.3.1521491375281;
	Mon, 19 Mar 2018 13:29:35 -0700 (PDT)
Received: from PC192-168-2-116.speedport.ip
	(p200300F07BC08B501E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:f0:7bc0:8b50:1e6f:65ff:fe3e:7f61])
	by smtp.gmail.com with ESMTPSA id j42sm47589wre.55.2018.03.19.13.29.34
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 19 Mar 2018 13:29:34 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 19 Mar 2018 21:29:05 +0100
Message-Id: <20180319202911.30760-12-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180319202911.30760-1-schnitzeltony@gmail.com>
References: <20180319202911.30760-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 11/17] vlc: remove gnome-vfs packageconfig
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
X-List-Received-Date: Mon, 19 Mar 2018 20:29:35 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

gnome-vfs is gone

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-multimedia/recipes-multimedia/vlc/vlc.inc | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-multimedia/recipes-multimedia/vlc/vlc.inc b/meta-multimedia/recipes-multimedia/vlc/vlc.inc
index acb3ccd1d..8e82b3bd3 100644
--- a/meta-multimedia/recipes-multimedia/vlc/vlc.inc
+++ b/meta-multimedia/recipes-multimedia/vlc/vlc.inc
@@ -57,7 +57,6 @@ PACKAGECONFIG[vpx] = "--enable-vpx,--disable-vpx, libvpx"
 PACKAGECONFIG[qt4] = "--enable-qt,--disable-qt, qt4-x11-free"
 PACKAGECONFIG[freerdp] = "--enable-freerdp,--disable-freerdp, freerdp"
 PACKAGECONFIG[dvbpsi] = "--enable-dvbpsi,--disable-dvbpsi, libdvbpsi"
-PACKAGECONFIG[gnome-vfs] = "--enable-gnomevfs,--disable-gnomevfs, gnome-vfs"
 PACKAGECONFIG[samba] = "--enable-smbclient,--disable-smbclient, samba"
 PACKAGECONFIG[upnp] = "--enable-upnp,--disable-upnp,libupnp"
 PACKAGECONFIG[dvdnav] = "--enable-dvdnav,--disable-dvdnav,libdvdnav libdvdcss"
-- 
2.14.3


