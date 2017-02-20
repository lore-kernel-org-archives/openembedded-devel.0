Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 490B0730BB
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Feb 2017 18:07:34 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id u63so15683364wmu.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Feb 2017 10:07:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=SNpVubGD5fIWGHT3Ck607fJXtFnp+ZZ9+ZPfkBHukJU=;
	b=g7MkohkunKZ3RwR36JcqCPBIqBiEMV5F2W+wsRfE3iZd1Nql8zA2EVekdJHtCZ4fFU
	aoDLcqU9q0o3E6JPfzs2sKaZg/LgpwmsGlwa29dnMctUjLNkE3ApMSyXmKskeSksxJ3F
	ztobOBiJ6WYykbCszBu+//H4fdYI/vwNd705rQ8+LuXZe8CjmZbt5S5ZxTEwyig4tT6C
	d+YnJtWDOFnsdY04u8RNdj1sAcG4+PWvnAda8HuvnwShC8R+opv/dSI/3g9YBrDik1wn
	VG9gsvFwmphOIyASxw2Y3vDc/n3fz4D2cbHM2zrDElDa84Fw92DGIYOaPo1k/aQFljZk
	sIqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=SNpVubGD5fIWGHT3Ck607fJXtFnp+ZZ9+ZPfkBHukJU=;
	b=j0XW0QFq1DHxfJj/Nyuv6OS1w/k+lN1SNr2LbGFED83/JNBwmlub8zpACHkYNHE5WV
	sJfPRIRJjCDApwfyUwEfE4IdSolcAhSr9r9nVbQdAwCzs3U7Qo4V5Tl9CmWBH60YWZDL
	arVab/8fFz+hwORkzIDgYBFwab9a1oxKrOdXhAWVoLNMeDbUJHw9A93Q1IPOl9RFR2yI
	c57ctmLgL46w1oMCs47V3d78GWP0j5p9g6NjwwQIqNLAlwVJ8T9I4zGG20cXo0D4teip
	54U6pM4Xj58fQknBqKG63ogHdjJjzxYqepbzdzOwxHZMFq/irR0494svMZaa0fyFec7y
	IHcQ==
X-Gm-Message-State: AMke39kSjC/pMIVxpbnyApnIQQN/RoVkQ6VcbmT9RqoCug1eQuQRi4G7dd8mTB6LqS8AuQ==
X-Received: by 10.28.198.139 with SMTP id w133mr20184344wmf.80.1487614054375; 
	Mon, 20 Feb 2017 10:07:34 -0800 (PST)
Received: from PC192-168-2-116.speedport.ip
	(p20030046E911DE631E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:46:e911:de63:1e6f:65ff:fe3e:7f61])
	by smtp.googlemail.com with ESMTPSA id
	96sm2863710wrb.14.2017.02.20.10.07.33
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 20 Feb 2017 10:07:33 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 20 Feb 2017 19:06:34 +0100
Message-Id: <20170220180700.29836-19-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20170220180700.29836-1-schnitzeltony@googlemail.com>
References: <20170220180700.29836-1-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 18/44] ristretto: update 0.8.1 -> 0.8.2
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
X-List-Received-Date: Mon, 20 Feb 2017 18:07:34 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../ristretto/{ristretto_0.8.1.bb => ristretto_0.8.2.bb}            | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-xfce/recipes-apps/ristretto/{ristretto_0.8.1.bb => ristretto_0.8.2.bb} (70%)

diff --git a/meta-xfce/recipes-apps/ristretto/ristretto_0.8.1.bb b/meta-xfce/recipes-apps/ristretto/ristretto_0.8.2.bb
similarity index 70%
rename from meta-xfce/recipes-apps/ristretto/ristretto_0.8.1.bb
rename to meta-xfce/recipes-apps/ristretto/ristretto_0.8.2.bb
index 7abf186..c4baa72 100644
--- a/meta-xfce/recipes-apps/ristretto/ristretto_0.8.1.bb
+++ b/meta-xfce/recipes-apps/ristretto/ristretto_0.8.2.bb
@@ -3,13 +3,13 @@ HOMEPAGE = "http://goodies.xfce.org/projects/applications/ristretto"
 SECTION = "x11/application"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=35d145429ad3cbf5308d1dc93f66376b"
-DEPENDS = "exo libexif gtk+ dbus-glib libxfce4ui libxfce4util xfconf cairo"
+DEPENDS = "exo libexif gtk+ dbus-glib libxfce4ui libxfce4util xfconf cairo file"
 
 inherit xfce-app
 
 RRECOMMENDS_${PN} += "tumbler"
 
-SRC_URI[md5sum] = "5332876b627b3237eebb76db66e2fb11"
-SRC_URI[sha256sum] = "0b4c90c585166c958d479075b98da6e28ca500bda6f4d3443f20e0a2172030ee"
+SRC_URI[md5sum] = "a8d8bb6b8fa7f868cfa3ae778630946e"
+SRC_URI[sha256sum] = "f8f3b77ca6fc77ddf8cff1bb52e5c5802c462663f72f324393b3a0360f6901b8"
 
 FILES_${PN} += "${datadir}/appdata"
-- 
2.9.3


