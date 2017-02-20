Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 4491D71D87
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Feb 2017 18:07:35 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id c85so15748786wmi.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Feb 2017 10:07:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=FFvdt+4AjyCwSeL8QFaYkM5Y8ykKgc2p+dUinCYQW7U=;
	b=AOx5J6+J+5DuMqKIaZ0jfi4XMgl0SlXMdUmHnjz8w0kuYDP5/E9dmf1FMECFfZz+nz
	XjoIFbfVVa9h4+pJtoShU7qa8D/NfTXhiV1yhgBfUERHnm5o/axVeacZJjD8C3jMl19d
	CDHheW+XdJYnj0FopD2PVE+35EKs/Fn+zKoFDdivB+7z5udJBG+gAoQiba6T6td+liOn
	nnVCMy72PvZH9CgmHzqJiC/nzkdNNX9fzSr1DDbRq/+BD8a0rJamDpi6H8F9Zzhy2rqC
	pMrByhQFHonMZhEGPGOxKtSGshZ3dPwGSTYLoixq7kaQsWjw72RindLvJDDf+q7X9VB4
	M/WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=FFvdt+4AjyCwSeL8QFaYkM5Y8ykKgc2p+dUinCYQW7U=;
	b=FDds6b3sJxhVik8JbpdV1nTl03/U3a5NzuD9MvqFPDbFYAcTLejvjsUBYb4oUSEve5
	gJLBudI+RvEvsYeG4p3L48rqj7PyoKD+vzUyhpb/vNqOfxH8VMNHKKXmcfc2OaJTLmkQ
	/q6CO9bWoDAsqh5cLUw/6/m39WQfUZ7AL9PZOAfbPikXshyBgl9VeT4A1vQKKQW/7GwU
	dbBjwjCpOWLqgarULiHxDRYZg/Nb5PKsh/QQ6JvFKR6ZYvosDOetiLWNJam1wx1Nh6GS
	U+iJ7bDcL1nYqUz0kuG4P69D0eiFtwrCcdCS95/P4I8RKstPSPyHAkd6AbMcUPbRxC7R
	Dz0Q==
X-Gm-Message-State: AMke39lSxsOTGkNIK2Qbo2GtEek7Ty6pY6ApwCD0u8HgthrVg8xELAs3qdl4WkPcBdzgbA==
X-Received: by 10.28.24.5 with SMTP id 5mr11379366wmy.1.1487614055360;
	Mon, 20 Feb 2017 10:07:35 -0800 (PST)
Received: from PC192-168-2-116.speedport.ip
	(p20030046E911DE631E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:46:e911:de63:1e6f:65ff:fe3e:7f61])
	by smtp.googlemail.com with ESMTPSA id
	96sm2863710wrb.14.2017.02.20.10.07.34
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 20 Feb 2017 10:07:34 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 20 Feb 2017 19:06:35 +0100
Message-Id: <20170220180700.29836-20-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20170220180700.29836-1-schnitzeltony@googlemail.com>
References: <20170220180700.29836-1-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 19/44] menulibre: add intltool-native to DEPENDS and unblacklist
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
X-List-Received-Date: Mon, 20 Feb 2017 18:07:35 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

I cannot reproduce buzild error so this is just guesswork...

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-xfce/recipes-apps/menulibre/menulibre_2.1.3.bb | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta-xfce/recipes-apps/menulibre/menulibre_2.1.3.bb b/meta-xfce/recipes-apps/menulibre/menulibre_2.1.3.bb
index 73af1a8..69e52fe 100644
--- a/meta-xfce/recipes-apps/menulibre/menulibre_2.1.3.bb
+++ b/meta-xfce/recipes-apps/menulibre/menulibre_2.1.3.bb
@@ -4,7 +4,7 @@ SECTION = "x11/graphics"
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
-DEPENDS = "python3-distutils-extra-native"
+DEPENDS = "python3-distutils-extra-native intltool-native"
 
 inherit distutils3 gtk-icon-cache
 
@@ -34,5 +34,3 @@ RDEPENDS_${PN} += " \
     python3-unixadmin \
     python3-psutil \
 "
-
-PNBLACKLIST[menulibre] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130617/"
-- 
2.9.3


