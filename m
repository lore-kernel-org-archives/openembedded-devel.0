Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wr0-f195.google.com (mail-wr0-f195.google.com
	[209.85.128.195])
	by mail.openembedded.org (Postfix) with ESMTP id 48DE271D9D
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Feb 2017 23:07:32 +0000 (UTC)
Received: by mail-wr0-f195.google.com with SMTP id z61so12736343wrc.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Feb 2017 15:07:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=EZsyfNiAklZBlOUkC9KtO03gQpIyA0az+DZuoYMwN20=;
	b=pJTNiSBJI2OOjlPxvRhEW0cf5K00rrag99Iado3VeaDvL6UpnqIARX52ddbS8Fi6Xy
	TNBLLlQhcvy7S3C7B/uZLdrwC6mqoMSazIxjW6B4ku8UfCENRDJZMsYcmyogNgcgdk2t
	XqNVLs1tDZN7Z79Wi/afVfrqscZry6p7uO40L3Ylna0SFekr5EkT3a0dnDgALsfGBTKx
	ABdAEo95STJXTto5aGWqZvNTq/WL75amTzGuFfXKU0bkf90AHp1J5R+8bsiO/FtUrUU0
	5bNGyQ+GH+2+nuNiB8sQ5Cfz3QJQUIgBbR3eKf/K8k68Mrd5JudrgztPXHMszBeUMpth
	ME6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=EZsyfNiAklZBlOUkC9KtO03gQpIyA0az+DZuoYMwN20=;
	b=Av/6fiMsr3Zc1JIAwmoIFstluUIMDC31nJtXXsjVc+MEbPM2TAMDRidq5+7VZKtdYV
	Foimsi9ZFbMR2tvHIiOUerL92YuujUihFc9UNIEuoEk8dkhk5oKdPzfUADpzn/QTSYlx
	T7EZ1t0Mxr7zPO6VgQl0VNpAUlWR/ecqMElBj3WltBS31NnZa4oCgnkireXJ70dfjFzE
	MsxR4mtzLDv7kZN/nakeTpeZt6AGL0CAA74cbrwOTx0SfgHeCcfGwAWYuFV81Og5hycX
	pI1kDCQlfr1k5G9xF63HEKF4mdEyvLqefdvyIRa7AiEjBZNsYnT3/kkLfJuRZRAvh9/h
	58Kw==
X-Gm-Message-State: AMke39kVEkbny4FKJba9gWKqsuDA/pinH8OMNbDBYXF+uyeB6/u6yMIhnfVh2ssDKS9MZw==
X-Received: by 10.223.156.2 with SMTP id f2mr11583097wrc.4.1487632053337;
	Mon, 20 Feb 2017 15:07:33 -0800 (PST)
Received: from PC192-168-2-116.speedport.ip
	(p20030046E911DE631E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:46:e911:de63:1e6f:65ff:fe3e:7f61])
	by smtp.googlemail.com with ESMTPSA id
	i73sm15294743wmd.11.2017.02.20.15.07.32
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 20 Feb 2017 15:07:32 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 21 Feb 2017 00:07:19 +0100
Message-Id: <20170220230719.10066-6-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20170220230719.10066-1-schnitzeltony@googlemail.com>
References: <20170220230719.10066-1-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 6/6] gimp: add libxslt-native to DEPENDS and unblacklist
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
X-List-Received-Date: Mon, 20 Feb 2017 23:07:32 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-oe/recipes-graphics/gimp/gimp_2.8.18.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta-oe/recipes-graphics/gimp/gimp_2.8.18.bb b/meta-oe/recipes-graphics/gimp/gimp_2.8.18.bb
index 428cc27..070fab8 100644
--- a/meta-oe/recipes-graphics/gimp/gimp_2.8.18.bb
+++ b/meta-oe/recipes-graphics/gimp/gimp_2.8.18.bb
@@ -7,6 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 DEPENDS = " \
     gdk-pixbuf-native \
     intltool-native \
+    libxslt-native \
     gtk+ \
     babl \
     gegl \
@@ -47,5 +48,3 @@ CFLAGS += "-fPIC"
 
 FILES_${PN}-dbg += "${libdir}/gimp/2.0/*/.debug"
 FILES_${PN}  += "${datadir}/appdata"
-
-PNBLACKLIST[gimp] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/132825/"
-- 
2.9.3


