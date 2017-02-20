Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 722A072F0D
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Feb 2017 23:07:29 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id c85so16892671wmi.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Feb 2017 15:07:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=3Na6PH51pjXmcJiY/YygwCck00JfPSacwrEWRG+E0hk=;
	b=bSplAKa0P6J0ZVXPyjpP93WF+7/sIpzq9CPNYxWDAXyDeQcRBGikgHzEy2AL1HHkPy
	VR/sMg/MqknH78jYLfNULgGl+uCKctTFBf1Fs1WbblqE/PqxkM78nL1l9AdaM4fbSC2i
	9mugnQtXyjnbni3cZIicI5wjsfmlCpWi355DxJA/ccQfhyAdVStmyzWort8QtIG2Pqgu
	qL8LAbUIS3z+czKcb8TdduohjDuzr1JAR9KWm2EQ+LVN3FOEaVvk05NK7TBwk3bmy68v
	IBispEVnoxJ3dCjiFQatZc8oCAew156rlI5oBz4/AcNwXmP+WlUIFA1w5iXpcm0sBlDB
	RvSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=3Na6PH51pjXmcJiY/YygwCck00JfPSacwrEWRG+E0hk=;
	b=RAHasLjSgbvEGTI+uX+DPNQOPtLmFaw0EykJhup2WtUZpK6g++pV5g8BrJWcDgeqve
	t2Nw4Rl9RESd+FIEHJlaKpsQ86JeKR/uusZM2/MxQ9SfYRjxe8T+UB4zBBaL932OD0Y0
	Iv05WUiAHYgwMxMbn23RO0vE0ucBCqDxXptf3wVwn9BUeVcCM4GMs4Htb59/evKsYbYF
	nmG0YodgAvmbSBXK558byL5nyROQrwTIS2/TtosybmxH66MpX4keXCo8yafTJ9SByXJk
	1MMnQJz8NLKX4YKUJNOF2JzfdwxHAXzQ72+iUUDFfrI7kaF64RbtjudQzEP37E1lwZ/N
	ShGg==
X-Gm-Message-State: AMke39lwV+361Lh3xGlEx5ED+3tCfRAg5xsCzZ/ytCL1SXd6Dgvk+227Xjf2aqeMCq2RVw==
X-Received: by 10.28.142.73 with SMTP id q70mr12916498wmd.3.1487632050921;
	Mon, 20 Feb 2017 15:07:30 -0800 (PST)
Received: from PC192-168-2-116.speedport.ip
	(p20030046E911DE631E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:46:e911:de63:1e6f:65ff:fe3e:7f61])
	by smtp.googlemail.com with ESMTPSA id
	i73sm15294743wmd.11.2017.02.20.15.07.30
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 20 Feb 2017 15:07:30 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 21 Feb 2017 00:07:16 +0100
Message-Id: <20170220230719.10066-3-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20170220230719.10066-1-schnitzeltony@googlemail.com>
References: <20170220230719.10066-1-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 3/6] gparted: add glib-2.0-native to DEPENDS and unblacklist
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
X-List-Received-Date: Mon, 20 Feb 2017 23:07:31 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-gnome/recipes-extended/gparted/gparted_0.27.0.bb | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta-gnome/recipes-extended/gparted/gparted_0.27.0.bb b/meta-gnome/recipes-extended/gparted/gparted_0.27.0.bb
index ac01829..c921065 100644
--- a/meta-gnome/recipes-extended/gparted/gparted_0.27.0.bb
+++ b/meta-gnome/recipes-extended/gparted/gparted_0.27.0.bb
@@ -13,7 +13,7 @@ SRC_URI = " \
 SRC_URI[md5sum] = "726f539f774b442670028af656f270bd"
 SRC_URI[sha256sum] = "208cf60c061b86bee4f658d568a3b5d843dce3ab9847f66b452298268799e7bd"
 
-DEPENDS = "glib-2.0 gtkmm parted gnome-doc-utils intltool-native"
+DEPENDS = "glib-2.0 glib-2.0-native gtkmm parted gnome-doc-utils intltool-native"
 
 do_install_append() {
     # Add a script which checks if polkit is installed.
@@ -36,5 +36,3 @@ FILES_${PN} += " \
 "
 
 RDEPENDS_${PN} = "dosfstools mtools e2fsprogs"
-
-PNBLACKLIST[gparted] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/131634/"
-- 
2.9.3


