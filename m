Return-Path: <raj.khem@gmail.com>
Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com
	[209.85.216.68])
	by mail.openembedded.org (Postfix) with ESMTP id 2EF976143D
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Feb 2020 02:43:03 +0000 (UTC)
Received: by mail-pj1-f68.google.com with SMTP id 12so6518314pjb.5
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 16 Feb 2020 18:43:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=fMSjHORG3lr+5yfDIZ1sWc0PQ9SMv/DJnc7DtHjuDwo=;
	b=mQKNiezvJI7pVCPg8H4WqnS0obg41PFuIV6cpmg1dHI0O2gHFUg+sVSlBlasHF5bhr
	gRogF/pTstAbcMdg8y8rM/QnJoTdkHM2ffED7/IMgnjXpRtBzUqSrG3lSpuDrBb7DUKP
	U8GufFBByAUprz+jVUHk+ZdOdCiRSHdnCN7KwSARS3XumJ2XMunKzWtgsB+U/EarMncM
	TITDa2PIV92oKtF+lwwN1ZKXY2bxSmLh0R4+R6xGgadIovYd138fZ/5Xfq+iVlXm5dXM
	g/4DR5jgCmxP7JS3q8CNNzrHuhS9j6M/oFsf4UpTDpIi5q8Rp3NdZc9DhP7sRnmhg3ov
	G18Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=fMSjHORG3lr+5yfDIZ1sWc0PQ9SMv/DJnc7DtHjuDwo=;
	b=iG4BqNNw91fU9i5l9iy1Wu/tsqaVpW0fjXLnPRL86S6Yx8h6VbNQ4o1vQdD+sKLznN
	dMLTN/OPS1bR+CJ8oU00rQhYqZWAgL5K7If41gXXfse4qpcBuoOp6fDgvik0GYmBQp+t
	qUFBihS2F0/yBIyzhwdcUMm6KLpKDY/JKuXMbASMCy1dr7sQhfQuvo6oI4ENQokOTIZi
	PKKjEmM4ucx7Wm2/8zMzKjdmu5NnYMIg9ICtQBG0OukbPoKAw8PjzAoiIht8lpeYE0EU
	0if8cnrUxKDp/LKTdGD3PKel4aoEu9EjtRSXR54TAUPUn10glWNVyXDn8NCP0rxJu6vq
	K//w==
X-Gm-Message-State: APjAAAUnImfl67cvH4tMpM8yJZvXP+y+lDLuHrQ6cD5kTXc0Y1uHoHue
	WBGr3EsKkDHPfLrJQgg59MPltdsd5tc=
X-Google-Smtp-Source: APXvYqy2boRMVgwrt6i3ppMrOCm7RAmGFiOvQwRMh2Wm3qPxt7own15RC4f8yTlx1hgi9V+fdcw52g==
X-Received: by 2002:a17:902:a514:: with SMTP id
	s20mr14078656plq.300.1581907383916; 
	Sun, 16 Feb 2020 18:43:03 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::98a3])
	by smtp.gmail.com with ESMTPSA id
	64sm14141008pfd.48.2020.02.16.18.43.02
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 16 Feb 2020 18:43:03 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 16 Feb 2020 18:43:04 -0800
Message-Id: <20200217024304.1131392-7-raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200217024304.1131392-1-raj.khem@gmail.com>
References: <20200217024304.1131392-1-raj.khem@gmail.com>
MIME-Version: 1.0
Cc: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
Subject: [meta-gnome][PATCH 7/7] gimp: Depend on libexecinfo for musl
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
X-List-Received-Date: Mon, 17 Feb 2020 02:43:03 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

musl does not have internal backtrace implementation like glibc
but we can use external library

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-gnome/recipes-gimp/gimp/gimp_2.10.14.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-gnome/recipes-gimp/gimp/gimp_2.10.14.bb b/meta-gnome/recipes-gimp/gimp/gimp_2.10.14.bb
index 045958d0a6..30f0579e2d 100644
--- a/meta-gnome/recipes-gimp/gimp/gimp_2.10.14.bb
+++ b/meta-gnome/recipes-gimp/gimp/gimp_2.10.14.bb
@@ -29,6 +29,7 @@ DEPENDS = " \
     libmng \
     ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'libxmu libxpm', '', d)} \
 "
+DEPENDS_append_libc-musl = " libexecinfo"
 
 inherit features_check gnomebase gtk-icon-cache gtk-doc mime-xdg
 
-- 
2.25.0


