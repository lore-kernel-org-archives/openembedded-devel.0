Return-Path: <oleksandr.kravchuk@pelagicore.com>
Received: from mail-wm0-f47.google.com (mail-wm0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id 52C456FF84
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Dec 2016 06:41:02 +0000 (UTC)
Received: by mail-wm0-f47.google.com with SMTP id a197so316137184wmd.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Dec 2016 22:41:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=pelagicore-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=ZiVGjsR8fEuLjdZyBu00CvlYkzNrTTeC0GFBbLMaow0=;
	b=VqK5RI1npeZ4F1zb0b1lmjGXOe+AaQaZepnTwprpudaBo1vMnCn8lZuXCpz5WVgTyX
	+OE7C7T0zoSB+mh6Ud6zEcMy8/+Tc61/0KbrltgphHcSZoIOjK0zRGgBkleKsRRkPHOg
	JAzANLEDTtc3zwphBwDxNFjYVGkEZmKjwCeDxddGqVdirMnsC49JD/CAR+MStYfnqTQr
	18XemMNXdfinLapuUThi5COT1r882WrriVkNRcYJIcoID7ES5sqlZGaZOgGfvMc1p5Fy
	54gSl8hBdMNefr8NbrReh8G6ur5Ioh17xPt/Zn5ik9P7GT6/jOp+SCkivZNMbG3AHzeh
	Xwmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=ZiVGjsR8fEuLjdZyBu00CvlYkzNrTTeC0GFBbLMaow0=;
	b=EvzoQ+dcFnrv/l6sPsDyXMCcVKEtJOh20ccnmG9k7H7Rk5HX97c2ewTkEkByVtS0Os
	NSczyizLsi685+N2KXhD6LQUb2EZ5R64j31xDHeJavo6B4E+5pS+3P9b3N5SEqbRwJxk
	O2QZvpAOlEAZi0J4TUF/i1xVUGt/z7gs2rxQel1J8SB/PVgpyRiJdju1ZvWO8iUP8V9s
	JSEM+JfCSKHC8hh9odIlxElhZf/AIEVlEMMsrxm3+l+Rn3QYSqqppOUqtg4oA25lY9fY
	5vqOd9o7j9CHy5rZ9D1+dxczXa8ngSkzD208wvZ4IiZLqWDJny4z7fRQ2pLBxQZJoYWA
	aORw==
X-Gm-Message-State: AIkVDXLaPs+nQ4lnehKa1amxmE4e6NSCoTxuhmCkiu9RHQW8IKyQ14ufl3T/hva6zXE0IqGw
X-Received: by 10.28.168.12 with SMTP id r12mr26949946wme.16.1483080064132;
	Thu, 29 Dec 2016 22:41:04 -0800 (PST)
Received: from stout.office.pelagicore.net ([83.218.80.242])
	by smtp.gmail.com with ESMTPSA id
	c187sm68518462wmd.13.2016.12.29.22.41.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 29 Dec 2016 22:41:03 -0800 (PST)
From: Oleksandr Kravchuk <oleksandr.kravchuk@pelagicore.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 30 Dec 2016 07:40:28 +0100
Message-Id: <1483080028-31265-1-git-send-email-oleksandr.kravchuk@pelagicore.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-networking][PATCH] strongswan: update to 5.5.1
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
X-List-Received-Date: Fri, 30 Dec 2016 06:41:03 -0000

Signed-off-by: Oleksandr Kravchuk <oleksandr.kravchuk@pelagicore.com>
---
 .../strongswan/{strongswan_5.5.0.bb => strongswan_5.5.1.bb}           | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-support/strongswan/{strongswan_5.5.0.bb => strongswan_5.5.1.bb} (94%)

diff --git a/meta-networking/recipes-support/strongswan/strongswan_5.5.0.bb b/meta-networking/recipes-support/strongswan/strongswan_5.5.1.bb
similarity index 94%
rename from meta-networking/recipes-support/strongswan/strongswan_5.5.0.bb
rename to meta-networking/recipes-support/strongswan/strongswan_5.5.1.bb
index 8941cf6..9c11904 100644
--- a/meta-networking/recipes-support/strongswan/strongswan_5.5.0.bb
+++ b/meta-networking/recipes-support/strongswan/strongswan_5.5.1.bb
@@ -11,8 +11,8 @@ SRC_URI = "http://download.strongswan.org/strongswan-${PV}.tar.bz2 \
         file://fix-funtion-parameter.patch \
 "
 
-SRC_URI[md5sum] = "a96fa7eb6c62b40143dadb064b6bd586"
-SRC_URI[sha256sum] = "58463998ac6725eac3687e8a20c1f69803c3772657076d06c43386a24b4c8454"
+SRC_URI[md5sum] = "4eba9474f7dc6c8c8d7037261358e68d"
+SRC_URI[sha256sum] = "720b301991f77bdedd8d551a956f52e2d11686a0ec18e832094f86cf2b842ab7"
 
 EXTRA_OECONF = " \
         --without-lib-prefix \
-- 
2.7.4


