Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
	[209.85.221.52])
	by mail.openembedded.org (Postfix) with ESMTP id 8A9E47FC93
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 18 Jan 2020 11:28:08 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id y17so25059286wrh.5
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 18 Jan 2020 03:28:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=SCyNjUAEXTYBtmgjoEU1yp/grffJ1zIE+VPHzNCk4RM=;
	b=rpvBudKhzoYTnkGW/cyNC593Nz82qoUQlB9smd0Z789etSysQ3T0WDFBYgZQWJXI0K
	laM/1LGs95I/mXilrn4IY0Oxa3CCJOD5gvLawoBBNLrzjBeyiDk9xZplCLi9zsyk9A2z
	iTcUqb0M2eVntSyDHPN8Xfj2/HF0aK7Voy/BXurgLVvRIzHmSdEr3vVSRKmwmU5bw4BP
	KNtcM+IQ2qhOm3slOvDuFpGw4+OUhgOgGUmi/wxLW6Rs4W8vsKQCaD2c7vX3CBjLGt0v
	5cDpl1n4VOF8sF79PKNeO21wVh3CZJR5qeDontlXKeJCJLo/oAv/aP2n62Yxe//I3vou
	vG1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=SCyNjUAEXTYBtmgjoEU1yp/grffJ1zIE+VPHzNCk4RM=;
	b=XdMurhZhyn4oO71lphKh+jL0I8oM30V0yH1+D4iJqDngsvNdH5J2tagjPbz653Agyc
	PkYF1/xceXcddDRIm2YjPK0VLfYNKYKtpQvWrO7mc0LCGjpWlcPYVE0Y8B+Q07I7C5sd
	fcRcJdkmQ20v8IUaAcUFjwlWM8rx39qFm7gZPUgmvxBu6BDf+T3ol3pMIhTLsXaC6qOO
	fvljXv8ybxkEgvW+HTrLHn39E4vydw0IoCv3vH1bkU+ok15BB4FR30/fYkEhi0GuNecc
	3fkTo4WUadVdQ381PnxTN3HJQ6JFKGw6x7jJsZqUFFdFf3xiVx9O3yOf3M8eZnu/LTQb
	q0Hw==
X-Gm-Message-State: APjAAAUESM42HMDfU6iqL4JXm5T1Q9oB0PGie6g5EOOed/8niXoTqgIC
	kKNSoiRRpyeOwSCB4IFiLxzqB5zog5Y=
X-Google-Smtp-Source: APXvYqwY5j74vL/5r5gxjUhtFyZP/8TvKs2wq5ZpEjuVL5RksiaBLYEpgC3ECtJKb6BPIW2G6kBIpA==
X-Received: by 2002:adf:e74f:: with SMTP id c15mr7912157wrn.274.1579346888997; 
	Sat, 18 Jan 2020 03:28:08 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F3CA15804DD3CACFED9DBE9.dip0.t-ipconnect.de.
	[2003:f0:7f3c:a158:4dd:3cac:fed9:dbe9])
	by smtp.gmail.com with ESMTPSA id
	b15sm2965720wmj.13.2020.01.18.03.28.07
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 18 Jan 2020 03:28:08 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 18 Jan 2020 12:27:37 +0100
Message-Id: <20200118112757.5287-4-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200118112757.5287-1-schnitzeltony@gmail.com>
References: <20200118112757.5287-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 03/23] evince: add mime-xdg to inherit
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
X-List-Received-Date: Sat, 18 Jan 2020 11:28:09 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-gnome/recipes-gnome/evince/evince_3.34.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/evince/evince_3.34.2.bb b/meta-gnome/recipes-gnome/evince/evince_3.34.2.bb
index 8f669c9db..b792d4fcb 100644
--- a/meta-gnome/recipes-gnome/evince/evince_3.34.2.bb
+++ b/meta-gnome/recipes-gnome/evince/evince_3.34.2.bb
@@ -16,7 +16,7 @@ DEPENDS = " \
     ${@bb.utils.contains('DISTRO_FEATURES','x11','gnome-desktop3','',d)} \
 "
 
-inherit gnomebase itstool gnome-help pkgconfig gsettings gobject-introspection upstream-version-is-even gettext features_check
+inherit gnomebase itstool gnome-help pkgconfig gsettings gobject-introspection upstream-version-is-even gettext features_check mime-xdg
 
 SRC_URI[archive.md5sum] = "9e9e82fa8f6045ad7817157d9335d185"
 SRC_URI[archive.sha256sum] = "3cc0955f11204e3a2db1c7ab99b866692749592257485b87304134ad69da0617"
-- 
2.21.0


