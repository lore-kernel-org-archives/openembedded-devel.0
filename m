Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com
	[209.85.210.180])
	by mail.openembedded.org (Postfix) with ESMTP id 427CF7F270
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 17 Aug 2019 19:20:30 +0000 (UTC)
Received: by mail-pf1-f180.google.com with SMTP id 196so4833415pfz.8
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 17 Aug 2019 12:20:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=zct7F/xJ+w0etGa7EIXrlVd17UpFgURqAwVVPDCKnY0=;
	b=aB9jnhBqxOciOH/ZscBJYKE//kgIWHTCcZbnij2uT8z1bifTdndKf3kaeDQykQqPFz
	WHrsjX+OYrdDLu64Vq3Np4BgNE7Iue7Vo7khBUvG9Ypu9kjVM5YQ2qKJwfnAsGdvYJAF
	ax84ln05OsYqqCT95DAkEWbxa4QWGb/uMorF/oznGGbc/TdET0X8syUXQ2YmVk9uSVsY
	9caALHAP21VrBAvcYdRmrbUo8kd7R1FemoB5LxcmN71O9z4wXu7u0B2uwz4PzZf9oLMW
	7K7gnN1PvC+TCdzf2sUv+JZcERqwLCpjeCBt+7j2Ipexhm0REJJc0LIgUDA28IaFyuJt
	uL+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=zct7F/xJ+w0etGa7EIXrlVd17UpFgURqAwVVPDCKnY0=;
	b=PIO6681vaGiIUoDgI3JdlkvrlhOmrUayNl2FvcQj92uc8zKenUsgClIYn/OwB8/3YE
	cIAZ0HV2+tDfEuRP0bx9swWSQF/KKZW7pMF4fDu3q9fHptbQ7c1kf/sQWPLWdCNk2shr
	Qekixv/Jclgr4jlPsAjL53WgbmrBw7BmHMcULTHEfIoGOC9BkJvTtznfy7k0y1DdGehz
	CBszDg6bVMdjhjxk7NL7L5ucidipWKNpi7maDYckt1Jux1j++NG99L24MWjX69HnX9YO
	MYQS34R5CVms8oum/uLDj6hZYT/n5J6uzeuUIDQeNcMg8WzWZNWgnRy1rmuWSdQrebYs
	0qvQ==
X-Gm-Message-State: APjAAAXWu+u+J2eAF76sJDweMdsLiiPE/zV7N/L4EXSzx+9gsOWyZR2l
	qmsICYeNe4MxWnXtLaXoiL7pOsVdfgw=
X-Google-Smtp-Source: APXvYqy7nGbIstCfKQMVC28h7KzQG/XLJOk/zZYdwgO5dxhcp+uP9UK5y5KeXfeKS2TAZ+XR2CHe6Q==
X-Received: by 2002:a17:90a:4485:: with SMTP id
	t5mr13022470pjg.65.1566069630849; 
	Sat, 17 Aug 2019 12:20:30 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net (c-73-71-176-3.hsd1.ca.comcast.net.
	[73.71.176.3]) by smtp.gmail.com with ESMTPSA id
	y23sm11409238pfr.86.2019.08.17.12.20.29
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 17 Aug 2019 12:20:30 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 17 Aug 2019 12:20:20 -0700
Message-Id: <20190817192020.31315-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.22.1
MIME-Version: 1.0
Subject: [meta-initramfs][PATCH] klibc: Disable bcmp builtin for clang on glibc as well
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
X-List-Received-Date: Sat, 17 Aug 2019 19:20:30 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-initramfs/recipes-devtools/klibc/klibc.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-initramfs/recipes-devtools/klibc/klibc.inc b/meta-initramfs/recipes-devtools/klibc/klibc.inc
index 7faf0cabbf..86aae33407 100644
--- a/meta-initramfs/recipes-devtools/klibc/klibc.inc
+++ b/meta-initramfs/recipes-devtools/klibc/klibc.inc
@@ -34,7 +34,7 @@ ARMPATCHES_arm = "file://klibc-config-eabi.patch \
 S = "${WORKDIR}/git"
 
 OPTFLAGS = "${TUNE_CCARGS} -Os"
-OPTFLAGS_append_libc-musl_toolchain-clang = " -fno-builtin-bcmp"
+OPTFLAGS_append_toolchain-clang = " -fno-builtin-bcmp"
 
 PARALLEL_MAKE = ""
 EXTRA_OEMAKE = "'KLIBCARCH=${KLIBC_ARCH}' \
-- 
2.22.1


