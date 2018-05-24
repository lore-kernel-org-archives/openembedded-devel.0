Return-Path: <twoerner@gmail.com>
Received: from mail-it0-f44.google.com (mail-it0-f44.google.com
	[209.85.214.44])
	by mail.openembedded.org (Postfix) with ESMTP id BD528749F0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 May 2018 14:39:20 +0000 (UTC)
Received: by mail-it0-f44.google.com with SMTP id e20-v6so2672084itc.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 May 2018 07:39:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=QtGL2ePvUosk1yeBhl3HsUHhRANpZqAoRcMFab4DYBs=;
	b=m6Kt/9iJnFHx8OLR7PUwDBB2HF4on3yd+WoqepUmHmCXJyq6t2+WqoNYcyNQXyrqmb
	z1ZM/eL4CmiqmBsVhqo2h/yzqtvbolMiiGdZ7fqIpYgqIQMgWGSCpcJLgMYOuL1rHF8I
	IB/Np3XmWsR4mozQoYBl5NeX0mS0ty/NZY5XXiRe13kTT6Uesbp1ZSHib4LGeSDpxlsS
	Fde1xZ+2wL9uk8KeWWQZQJvkB1yZwLN3z7Gg4R/2Niy222TCkFDb7t1ul076FVtp0Uio
	oj/0psCza5LvdRtZlxYUqFTphMnbez+ivzLB7AskfRTAfsHZ8khZOYJZgDbzWyZJlW2f
	nUYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=QtGL2ePvUosk1yeBhl3HsUHhRANpZqAoRcMFab4DYBs=;
	b=qtlZL1Wio0+yuY5jNoZ3gjcEjQ0BI3w+UYaZPAZzqApgNXmVLRaaN7ibvbq/dMQGvg
	hMJMMCUnQlQ4/yD01903by6pXB4usYAYiwrHGlXANVCXKd8xGN3FS95K/a3sXmCil55o
	WDbX1h+beqrSTvAiX3bh6mpDzQQ3ApfyYGCGsRkA4PolYr2RXw0UMIcjyFCN0ZTVKKL0
	PCpfLfk9+gI6DvpIU4WkLKgoKwo973Sv2gRz3xj7UkTTGjlud423/Qa5NBxCRGOsCTUa
	aVK2ibV7NCLsmvCmwENiPl7P1AfZo3d3Z5/csTBV9mK9ZofABFWpurli37rgW3ac7rgp
	pVDw==
X-Gm-Message-State: ALKqPwfuoh4Nnm/cTUpVCRs0GVdSOXehwlofWezF9bGngVoTNL6T1OsA
	AFwjT9NW+IrToq7a5h1R70NYOs8n
X-Google-Smtp-Source: AB8JxZqc4WhudDGtMKhv9DKDpBu5voO00aLG3DfMs8z3qH4tPkj1fiaaC0wMsj7b8tfpMFCLyI5XWw==
X-Received: by 2002:a24:70d0:: with SMTP id
	f199-v6mr6684910itc.2.1527172761005; 
	Thu, 24 May 2018 07:39:21 -0700 (PDT)
Received: from linux-uys3.suse ([206.248.190.95])
	by smtp.gmail.com with ESMTPSA id
	a43-v6sm2435261itj.11.2018.05.24.07.39.19
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 24 May 2018 07:39:19 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 24 May 2018 10:38:46 -0400
Message-Id: <20180524143854.24096-10-twoerner@gmail.com>
X-Mailer: git-send-email 2.17.0.582.gccdcbd54c
In-Reply-To: <20180524143854.24096-1-twoerner@gmail.com>
References: <20180524143854.24096-1-twoerner@gmail.com>
Subject: [meta-oe][master-next][PATCH v3 09/17] openjpeg: rely on cmake.bbclass to put cmake package files in dev package
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
X-List-Received-Date: Thu, 24 May 2018 14:39:20 -0000

The cmake.bbclass in oe-core now ensures that ${libdir}/cmake and
${datadir}/cmake end up in the dev package, so recipes no longer need to
provide custom packaging rules to handles these files.

	http://git.openembedded.org/openembedded-core/commit/?id=d91dc4666683a96e9d03cbbd21b8a546f9069c93

Originally-conceived-by: Andre McCurdy <armccurdy@gmail.com>
Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 meta-oe/recipes-graphics/openjpeg/openjpeg_2.2.0.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta-oe/recipes-graphics/openjpeg/openjpeg_2.2.0.bb b/meta-oe/recipes-graphics/openjpeg/openjpeg_2.2.0.bb
index 4ef1c408fd..f749d62342 100644
--- a/meta-oe/recipes-graphics/openjpeg/openjpeg_2.2.0.bb
+++ b/meta-oe/recipes-graphics/openjpeg/openjpeg_2.2.0.bb
@@ -17,5 +17,3 @@ DEPENDS = "libpng tiff lcms zlib"
 # standard path for *.cmake
 EXTRA_OECMAKE += "-DOPENJPEG_INSTALL_PACKAGE_DIR=${baselib}/cmake \
                   -DOPENJPEG_INSTALL_LIB_DIR:PATH=${libdir}"
-
-FILES_${PN}-dev += "${libdir}/cmake/*.cmake"
-- 
2.17.0.582.gccdcbd54c


