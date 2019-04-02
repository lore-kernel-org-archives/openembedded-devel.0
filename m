Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
	[209.85.221.45])
	by mail.openembedded.org (Postfix) with ESMTP id 755757D1F0
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  2 Apr 2019 00:29:48 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id y13so14308532wrd.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 01 Apr 2019 17:29:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=7AVcDRoKngUo6aE/FZaZxry86VW8t4kBMTorJXCh8aU=;
	b=ku4zjJRItuzDkys9yCkt960v2bIGua9adPKBpr4n6watSfF9ssIiqVxUDuQQXegH3S
	lmhu/Y6JpfnHG4te6bX2NZ2p9ZQPpJboORw9SK/XcSlXvpB0kBFomUJ/d8052mDFcSnm
	lvQYq5nO8XuzYReKwlCKhs8NSgab5JXQJiS/FSma8vpnAUK7N4uUdBXDDxuw42APRgsO
	VC3DOnjKBSNMzz/qjS5/FIELDuMLOoeuY3mbF3XcgBnki2wnPx8WPF+JGGsK0Uu9qOUx
	DE4Y4tLM2kowCRFcz/zetJOJuVI3icMk2LNPShq35JYu5/DsEgZyIxNXlB7O7DsfSxL8
	ME0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=7AVcDRoKngUo6aE/FZaZxry86VW8t4kBMTorJXCh8aU=;
	b=t1vd3lwUseHg1JQd6lMEw/M58BgesjvfRRUk31ayw57Kljf29gwXzZIxCb9LxGxCd7
	2DEmuAms00fcF3zds/PfOUIf2rKpOslFuFtI5pQvmtJ8CD3ghivNfOHuUX3IlnyblaQ3
	WIIYXdAKblaXToJuB39N3syYk6lM76fLotTAk0PsMxFNYrdyotbbMsAnjB5Sr+f7DoKP
	a4UbhB15iEUYG3JQ0isYn9mvmk17fy5QiOLgezlCjQWllPRdFEHg9AIm5YHQV1Jx6iAe
	Ns1wcMRo/XW0JANpr7o3maQu0YPMJ10Cno+FS3px99OS3PvlfrVOZLCIz632eYSiGq1X
	w40A==
X-Gm-Message-State: APjAAAWhNGNPMKh7/KDBsw9S9c1CiInx7rJkby+01ykxdhfCUyQnmqVT
	x0vLx5Y2M3CVyRALOiWS5F7HYm+o
X-Google-Smtp-Source: APXvYqwbTtRycaexDFGPYZm+Qo9RiUD2topnHa8LJe12LDfiRPQSfWpcZ2rpWQpAmLF1Nk3VH+oslQ==
X-Received: by 2002:a5d:4492:: with SMTP id j18mr36399025wrq.212.1554164988760;
	Mon, 01 Apr 2019 17:29:48 -0700 (PDT)
Received: from superandy.speedport.ip
	(p200300F07F2CB726864FD5BA05684929.dip0.t-ipconnect.de.
	[2003:f0:7f2c:b726:864f:d5ba:568:4929])
	by smtp.gmail.com with ESMTPSA id
	d6sm18305452wrx.62.2019.04.01.17.29.47
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 01 Apr 2019 17:29:47 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  2 Apr 2019 02:29:35 +0200
Message-Id: <20190402002937.10839-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH 1/3] xfce4-screenshooter: upgrade 1.9.4 -> 1.9.5
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
X-List-Received-Date: Tue, 02 Apr 2019 00:29:48 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This fixes a bug introduced in 1.9.4 [1]

[1] https://bugzilla.xfce.org/show_bug.cgi?id=15187

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 ...e4-screenshooter_1.9.4.bb => xfce4-screenshooter_1.9.5.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-apps/xfce4-screenshooter/{xfce4-screenshooter_1.9.4.bb => xfce4-screenshooter_1.9.5.bb} (80%)

diff --git a/meta-xfce/recipes-apps/xfce4-screenshooter/xfce4-screenshooter_1.9.4.bb b/meta-xfce/recipes-apps/xfce4-screenshooter/xfce4-screenshooter_1.9.5.bb
similarity index 80%
rename from meta-xfce/recipes-apps/xfce4-screenshooter/xfce4-screenshooter_1.9.4.bb
rename to meta-xfce/recipes-apps/xfce4-screenshooter/xfce4-screenshooter_1.9.5.bb
index 7c5848b92..9f8f61a4a 100644
--- a/meta-xfce/recipes-apps/xfce4-screenshooter/xfce4-screenshooter_1.9.4.bb
+++ b/meta-xfce/recipes-apps/xfce4-screenshooter/xfce4-screenshooter_1.9.5.bb
@@ -7,8 +7,8 @@ DEPENDS = "xfce4-panel libxfce4util libxfce4ui gdk-pixbuf gtk+ glib-2.0 libsoup-
 
 inherit xfce-app
 
-SRC_URI[md5sum] = "68321e50939fea3c66f0771d59845dab"
-SRC_URI[sha256sum] = "c4f3225b3f73f1feb1869807b8b27aec4c32a3e9c2954915a5fb39d18d3a60f2"
+SRC_URI[md5sum] = "0354811cd2622d3de92e342c7eaa184d"
+SRC_URI[sha256sum] = "bf35b5432cb920987c6d7ff193600e5dd4d73422b6aa02b4ec5288744053b38c"
 
 do_compile_prepend() {
     mkdir -p lib
-- 
2.20.1


