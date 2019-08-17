Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
	[209.85.128.53])
	by mail.openembedded.org (Postfix) with ESMTP id E18247F36B
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 17 Aug 2019 08:13:50 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id 207so5774102wma.1
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 17 Aug 2019 01:13:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=T9lIDpFJISJKGaYdhl1qD9g2vgIzUUY4aDsNFRjAkFU=;
	b=ptIR7go7Yn9EDUWSwLag0L0clIl9tJl4toaMDUjI6xWdnX4NdrjQtY/I9WQoXxEdIg
	lt8UniHUt6+g/nnlkbCRqoHk99mM3CbaVfqHUsVXLQxk1kIk0//H9tFlCGF4itlumNks
	LgrviZftGFJXLsGbm/NwxO6xosc/r7DOs88xbIbw4MMb0FbxAkxhUztQq0Hz/c9S2ZR6
	XWCPhvXT/iNPN/PCFixsy8anHy+wpXpSgPtE35cbEOBAu+Vvkv/jAy6+LLyWQtk+aYRC
	pkBDyKS1rIEUf4UOtWBC1xJEn/WY7KrCXoe1JY+BOzomtpCIrCt/cbFtpzJ5NgneS3ks
	dfng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=T9lIDpFJISJKGaYdhl1qD9g2vgIzUUY4aDsNFRjAkFU=;
	b=IFrvEz5YFyokzPT1Cxlp+2pHfjJ6l88lGvY/HPeZzcuTeqdZMD5Y7gelRf24a69QZb
	mpuKD607O3fL7hW6T8IVhnsoFd5aqIHuxd4Y9/fVfhVPB2fPLlSk23LoQZCbvQo3aeqB
	xnyIp0DaH37Fq0DgjffEd0Tcw66PyaOODlIz4IlmD8+ttckn4YzyPXuhUGCXSQYypa/D
	R8uyaY933hDCYclBbw+Rx3G+krbNrrDgkhTgRPZdlv5PY71vdZq/kRKU02hZXuz5P/pp
	PxWuNaEFcnjEbtvXr4CwqGWFocPZYH2JxR4Mpq7d4mtFTAeWpqMiBZ5xV8X3dwDIHzlu
	kwCQ==
X-Gm-Message-State: APjAAAX5wzFHxCQVTOWvSIQbr9QdrcvIfKuaNuMKCjHBFGLJMmi8Vwm7
	nNDNq8OPJDmragmO9UfxBX13ESHR
X-Google-Smtp-Source: APXvYqx+Uwny3F4AFeZxEo2kNkDsJKBHhVkW4LW5JU+Za64FpR77jW6+uRAPL0wS2i1lz93Lh9s3wg==
X-Received: by 2002:a7b:cb8e:: with SMTP id m14mr11014633wmi.10.1566029631495; 
	Sat, 17 Aug 2019 01:13:51 -0700 (PDT)
Received: from mueller-a-nb-linux.speedport.ip
	(p200300F07F2D875347F2BEDFD5FFA793.dip0.t-ipconnect.de.
	[2003:f0:7f2d:8753:47f2:bedf:d5ff:a793])
	by smtp.gmail.com with ESMTPSA id
	q124sm7592567wma.33.2019.08.17.01.13.50
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 17 Aug 2019 01:13:50 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	akuster808@gmail.com
Date: Sat, 17 Aug 2019 10:13:38 +0200
Message-Id: <20190817081339.22253-4-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190817081339.22253-1-schnitzeltony@gmail.com>
References: <20190817081339.22253-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Cc: bunk@stusta.de
Subject: [warrior][PATCH 3/4] vlc: notify switched to GTK+3 some time ago
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
X-List-Received-Date: Sat, 17 Aug 2019 08:13:51 -0000
Content-Transfer-Encoding: 8bit

From: Adrian Bunk <bunk@stusta.de>

Signed-off-by: Adrian Bunk <bunk@stusta.de>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-multimedia/recipes-multimedia/vlc/vlc.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-multimedia/recipes-multimedia/vlc/vlc.inc b/meta-multimedia/recipes-multimedia/vlc/vlc.inc
index 9bbc6685d..0bedc5da9 100644
--- a/meta-multimedia/recipes-multimedia/vlc/vlc.inc
+++ b/meta-multimedia/recipes-multimedia/vlc/vlc.inc
@@ -72,7 +72,7 @@ PACKAGECONFIG[dc1394] = "--enable-dc1394,--disable-dc1394,libdc1394"
 PACKAGECONFIG[dv1394] = "--enable-dv1394,--disable-dv1394,libraw1394 libavc1394"
 PACKAGECONFIG[svg] = "--enable-svg,--disable-svg,librsvg"
 PACKAGECONFIG[svgdec] = "--enable-svgdec,--disable-svgdec,librsvg cairo"
-PACKAGECONFIG[notify] = "--enable-notify,--disable-notify, libnotify gtk+"
+PACKAGECONFIG[notify] = "--enable-notify,--disable-notify, libnotify gtk+3"
 PACKAGECONFIG[fontconfig] = "--enable-fontconfig,--disable-fontconfig, fontconfig"
 PACKAGECONFIG[freetype] = "--enable-freetype,--disable-freetype, freetype"
 PACKAGECONFIG[dvdread] = "--enable-dvdread,--disable-dvdread, libdvdread libdvdcss"
-- 
2.20.1


