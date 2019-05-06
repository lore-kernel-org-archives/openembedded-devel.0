Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
	[209.85.221.48])
	by mail.openembedded.org (Postfix) with ESMTP id BEA7A7D593
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  6 May 2019 08:30:07 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id h4so16096734wre.7
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 06 May 2019 01:30:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=b2d9OEHLpNAdI1Zh1nU+hck2pDScf3bYgkZa58/Kk9E=;
	b=Seijcj8yUsn9KK0lbJABX4gS/cM9XQLSSWCX60YhEVWp9uY/ZLNHAFavlzUpj7Gc4J
	zJe6maFAro6QXFN/FK4r5s5MrDDFCLJSyvOmoNH0qhaY21fwWBpfepM+EFwc2oiDq2ky
	k35SyL0EbeE5ejO4ZFE3ha1584JPZLyiOapcoZcAdzYGZIxl9bZEpJNY+FuOnOwx+leJ
	z4pYF1g2LzpA4DceXAZ4azKW1hOoJK9SCW/DBRAtaRggj0dtLjZX2oD4FgU1c79y53Ey
	iAchSCMIeKhp6P/YGmYIhXJaVlKvkf1Km+kD6lAP4rO1NtcLSL61WMfFBQNtwG8BlFpD
	1nHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=b2d9OEHLpNAdI1Zh1nU+hck2pDScf3bYgkZa58/Kk9E=;
	b=QcCQyo5iMFYan07LLOugaBBlG8pqYxfPOeFiOQxqt4DKlHBwta37oS2ZIM7DPVrv3C
	Z6gU5lOBo1I/cD4ZgP9CGET7sfR3yGKVJtdVo7cXnLWiTZejRMZF0IuJxGTwC0AlpLnu
	Wke6Sd6E2n2ZG8EKdLqn3UJK5nZYgIf4f7Ibdln2SuAh6u2jKwkN0J65LWVraOzsd4Pt
	fT+v+assHOKMwJITfcb7CFrYitIsIX8KX8wWuse6oyYDVBSlZJDwm911/UgnZEPXGnte
	RbdH8/TfE2oBK1p9v7zYad/Og7kChdEvqBCvTQcNdVvJ39tCSgrhXtqrfVJ6IEZ/w2eu
	yv0Q==
X-Gm-Message-State: APjAAAXsYB4T0WUtyfye0vEoeqBdL1VtXVq7WBGm21rYjOxl4w4QRnFW
	jySU9kptmMxEqTXDfbBbnE+nXwFq
X-Google-Smtp-Source: APXvYqyhJVgg0H5HGqYBKzLG0Gte8fsxKc9fr3viLtxVPXxZkFuKVHnhFtWy4HQpDTh/4VMByssvRg==
X-Received: by 2002:a05:6000:12cf:: with SMTP id
	l15mr14775127wrx.323.1557131408132; 
	Mon, 06 May 2019 01:30:08 -0700 (PDT)
Received: from localhost.localdomain (p509737a3.dip0.t-ipconnect.de.
	[80.151.55.163]) by smtp.gmail.com with ESMTPSA id
	a22sm7526235wmb.47.2019.05.06.01.30.07
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 06 May 2019 01:30:07 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  6 May 2019 10:29:46 +0200
Message-Id: <20190506082948.22276-6-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190506082948.22276-1-schnitzeltony@gmail.com>
References: <20190506082948.22276-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 6/8] xfce4-places-plugin: upgrade 1.7.0 -> 1.8.0
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
X-List-Received-Date: Mon, 06 May 2019 08:30:08 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* Most notable change is port to GTK3. Futher info at [1]
* Added SUMMARY and reworked DESCRIPTION slightly

[1] https://mail.xfce.org/pipermail/xfce/2019-May/036394.html

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 ...places-plugin_1.7.0.bb => xfce4-places-plugin_1.8.0.bb} | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)
 rename meta-xfce/recipes-panel-plugins/places/{xfce4-places-plugin_1.7.0.bb => xfce4-places-plugin_1.8.0.bb} (58%)

diff --git a/meta-xfce/recipes-panel-plugins/places/xfce4-places-plugin_1.7.0.bb b/meta-xfce/recipes-panel-plugins/places/xfce4-places-plugin_1.8.0.bb
similarity index 58%
rename from meta-xfce/recipes-panel-plugins/places/xfce4-places-plugin_1.7.0.bb
rename to meta-xfce/recipes-panel-plugins/places/xfce4-places-plugin_1.8.0.bb
index 16be09dca..698152bae 100644
--- a/meta-xfce/recipes-panel-plugins/places/xfce4-places-plugin_1.7.0.bb
+++ b/meta-xfce/recipes-panel-plugins/places/xfce4-places-plugin_1.8.0.bb
@@ -1,12 +1,13 @@
-DESCRIPTION = "Panel plugin displaying menu with quick access to folders, documents, and removable media"
+SUMMARY = "Menu for quick access to folders, documents and removable media"
+DESCRIPTION = "Panel plugin displaying menu with quick access to folders, documents and removable media"
 HOMEPAGE = "http://goodies.xfce.org/projects/panel-plugins/xfce4-places-plugin"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b6952d9a47fc2ad0f315510e1290455f"
 
 inherit xfce-panel-plugin
 
-SRC_URI[md5sum] = "fcae9b38a8affcd82699a94991bba29b"
-SRC_URI[sha256sum] = "4175c614749abbb5bcf6f49c88125fb0dd36db69f4c374df23563907b16e2c3f"
+SRC_URI[md5sum] = "e3a306d927befb8afcb5212f8ab0b8c9"
+SRC_URI[sha256sum] = "7ba3f46f88c2845cbf413efeefaed29157f8b98571856c6e2bf35e4de5d8ecce"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[notify] = "--enable-notifications,--disable-notifications,libnotify"
-- 
2.20.1


