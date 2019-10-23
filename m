Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
	[209.85.214.176])
	by mail.openembedded.org (Postfix) with ESMTP id 562C07F844
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Oct 2019 16:14:06 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id c16so6576623plz.9
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Oct 2019 09:14:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=4GttEKtjLgLh3Dq8HmRJ2twnF64wj6axnvClfwESFd0=;
	b=Gzy9AC63aQl/YNHaTYulsSKuMRYKymbnCOBNGLf9NFbH7KH1hrY2Cw6gePTK4sQPQN
	O5H1s+ohYnZRbKYJVQ/pRtJvaYfDXPOyql1p2b0pBVp+uNJDc/DxAeaxv2x/GnypwOwV
	60tVQvT45a1xBaePQ4Cp3INXP+NzDWj0ikv58Wf9Dacwi1uRub8P/WyBlysO3hPIbhC+
	kPESNQksRfAksA98Lemg0OVO0M5u6atEzz/4U0GQ++WC86XJnyEEWGfqrufzkh2J8D2S
	7kmc1MyVuj5g+6KRslaCa8ThbgeH8twOHzU5hzr57rPXtAMn7nE9JVbYVj8F+R8yZhDC
	SB7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=4GttEKtjLgLh3Dq8HmRJ2twnF64wj6axnvClfwESFd0=;
	b=banEOGq79Lk0p9baIJTVEdvkld0SKRov1Z37qrBdPaJX+JcsrIQefco9IH3eJAZ5tY
	w13mw8SlF1bNIpj21mLGCewTi7GnJ4LnGKvOzeMIbSzCTqNcpiT8eOqMthGwmuGsv5Jz
	N8Sy9a8oMR7/oNiJB5pNzWWRvWsrdyAXzslA8SlB55asV0v75w38vC9n4i4mXvTUIJ++
	1l7uJgrgXVMJB3pGGVbHIqaHO1jOCQFxPCjMrcHHWcEzj8bCO8rup98tjveLNYEij0y2
	eEflwa3TqYnBz/aiUMLlRsfL3dqary2rHFVo3SfYiVR9fjxEWkQcRQmCCqjU60qQvdwt
	6ViQ==
X-Gm-Message-State: APjAAAX4pRi28TUchgJCv5F++fgfWoqCmzCF2/N5mzbC/5alrB3im1Rf
	+rTeuhWDhC5D2tYKUpEzVlY5SEgv
X-Google-Smtp-Source: APXvYqwqjtNWXFDWJt5ArSlyB2W/Rek/r2CLMIzWkuzn1Lkz6Z96VcM73jAho84cq2PI4+O330tW+w==
X-Received: by 2002:a17:902:8d8e:: with SMTP id
	v14mr10580916plo.312.1571847247108; 
	Wed, 23 Oct 2019 09:14:07 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:d998:942e:6613:6ef4])
	by smtp.gmail.com with ESMTPSA id
	d19sm23179067pjz.5.2019.10.23.09.14.06
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 23 Oct 2019 09:14:06 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 23 Oct 2019 09:13:53 -0700
Message-Id: <b71e3bb1db813bf4bfdf45492ed5f69b643d9587.1571847041.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1571847041.git.akuster808@gmail.com>
References: <cover.1571847041.git.akuster808@gmail.com>
Subject: [warrior 08/10] xorg-fonts-100dpi: Change License Custom -> MIT
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
X-List-Received-Date: Wed, 23 Oct 2019 16:14:06 -0000

From: Khem Raj <raj.khem@gmail.com>

This is a meta package which collects a bunch of 100dpi font packages
together which all are also under MIT license, Custom is not a known
type moreover MIT is well suited for this recipe for compatibility

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit c95c94d689f3b4972db72f511a60bcef52b8080d)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-graphics/xorg-font/xorg-fonts-100dpi.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/xorg-font/xorg-fonts-100dpi.bb b/meta-oe/recipes-graphics/xorg-font/xorg-fonts-100dpi.bb
index 45e3f7b..ae97040 100644
--- a/meta-oe/recipes-graphics/xorg-font/xorg-fonts-100dpi.bb
+++ b/meta-oe/recipes-graphics/xorg-font/xorg-fonts-100dpi.bb
@@ -1,5 +1,5 @@
 SUMMARY = "Xorg 100 DPI font set"
-LICENSE = "Custom"
+LICENSE = "MIT"
 
 inherit packagegroup distro_features_check
 # rdepends on font recipes with this restriction
-- 
2.7.4


