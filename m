Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com
	[209.85.215.171])
	by mail.openembedded.org (Postfix) with ESMTP id D7ED07F4D5
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 31 Aug 2019 21:32:06 +0000 (UTC)
Received: by mail-pg1-f171.google.com with SMTP id 4so1740583pgm.12
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 31 Aug 2019 14:32:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=x2aEs+u+rHtvxG4ndSGjwk50RS56lckHKQ7BfDetUcA=;
	b=GbeC38DpYqiulcWqD8co9X8cN0VB6DAD2bgbyONjDgAC+4SrroNWc+zu5S+Q+vvcyr
	aqCcvq1ueGkuoWUZIsuPrsYyVkwN/qXQ/ImU1eZhViQqS6rq/mIoo1h2Ir0FB5b+wOd5
	Kuz+5KAQO1vALYNKqIpLLIMySBuJ2ALI7kd2CrwXDySCg64epEFUrioE9I4Gc93aJImi
	0fS5m95M8MKLruaZrAVhPlJh0CkqKzLZc7YEWSi1/pkGR8uZ6RF/Y07vajnkzmWYeeDa
	jGS8lg2Bg/VKLhv1kZKk/3feP4/WJs5iFnzrIVar3WUmTJ6YDBpMFKg7f82+YbsHm92Y
	sSJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=x2aEs+u+rHtvxG4ndSGjwk50RS56lckHKQ7BfDetUcA=;
	b=EFx6GRa9zdbaCLUppNIOh+ChzAwvCMsRfeBryV0Y/hEOBiaew9hgFYz+yMzIfAMhqU
	dgfQFytf1/dA5EjE9mrGTGFt+G0MUZnTI8li/TMMirMEn6h186mPQCjrsPndDMxR73Df
	6THkfdzXKhBP+vsGD+kASslSZkzdp8A4U/FhmgnqOAViJWZVe/73PZaGdX00RjifHXF4
	mpKojDwQCwNWYOHNI9E4SB1YrFZrkWiCd6s/18Gufuq7ll+bAIEjBneiCK+UNdsZfyNa
	Xi4Jk1le+dUbzQ5YVlHypaUHLIE+gVjnHCMu7L/95LsQ5OcKgdAkuXqhwTZtR8Y1Scxe
	X+CA==
X-Gm-Message-State: APjAAAXyXyZETSSjDEohkxlerUN56KJhyM2CjQK+vx4GHfK22uiGK/r0
	Fo/15gaaIFPXyflR+/FOoW5NMngE
X-Google-Smtp-Source: APXvYqxX1ejn6dEhaK/mFjXzhZCS/VbVTdCHUlOT+n8uww6fKNxc15+oAfF2p1gyzHjzYv1G3+Q7xQ==
X-Received: by 2002:a17:90a:8991:: with SMTP id
	v17mr5487287pjn.120.1567287127823; 
	Sat, 31 Aug 2019 14:32:07 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:c33:8107:6109:754a:f033])
	by smtp.gmail.com with ESMTPSA id
	a18sm8060827pgl.44.2019.08.31.14.32.07
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 31 Aug 2019 14:32:07 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 31 Aug 2019 14:31:43 -0700
Message-Id: <0b781c24eee714134f2a8a150b4bd50377ce0f8b.1567286967.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1567286967.git.akuster808@gmail.com>
References: <cover.1567286967.git.akuster808@gmail.com>
Subject: [warrior 22/23] vlc: notify switched to GTK+3 some time ago
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
X-List-Received-Date: Sat, 31 Aug 2019 21:32:07 -0000

From: Adrian Bunk <bunk@stusta.de>

Signed-off-by: Adrian Bunk <bunk@stusta.de>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-multimedia/recipes-multimedia/vlc/vlc.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-multimedia/recipes-multimedia/vlc/vlc.inc b/meta-multimedia/recipes-multimedia/vlc/vlc.inc
index 19ac820..e5102a3 100644
--- a/meta-multimedia/recipes-multimedia/vlc/vlc.inc
+++ b/meta-multimedia/recipes-multimedia/vlc/vlc.inc
@@ -67,7 +67,7 @@ PACKAGECONFIG[dc1394] = "--enable-dc1394,--disable-dc1394,libdc1394"
 PACKAGECONFIG[dv1394] = "--enable-dv1394,--disable-dv1394,libraw1394 libavc1394"
 PACKAGECONFIG[svg] = "--enable-svg,--disable-svg,librsvg"
 PACKAGECONFIG[svgdec] = "--enable-svgdec,--disable-svgdec,librsvg cairo"
-PACKAGECONFIG[notify] = "--enable-notify,--disable-notify, libnotify gtk+"
+PACKAGECONFIG[notify] = "--enable-notify,--disable-notify, libnotify gtk+3"
 PACKAGECONFIG[fontconfig] = "--enable-fontconfig,--disable-fontconfig, fontconfig"
 PACKAGECONFIG[freetype] = "--enable-freetype,--disable-freetype, freetype"
 PACKAGECONFIG[dvdread] = "--enable-dvdread,--disable-dvdread, libdvdread libdvdcss"
-- 
2.7.4


