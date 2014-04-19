Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f42.google.com (mail-ee0-f42.google.com [74.125.83.42])
	by mail.openembedded.org (Postfix) with ESMTP id 0EB2765D58
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 19 Apr 2014 16:47:57 +0000 (UTC)
Received: by mail-ee0-f42.google.com with SMTP id d17so2509359eek.29
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 19 Apr 2014 09:47:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=eZZaNqZ4xj6UZ/SOrhWu7ZnGkPoKbbn6ZujdPcO9SV8=;
	b=zay5SbJf1/Qtd0f/AdhqvzzqXBJTkZAUQqlipyIzt6f4VkYFhTEHMjlQTAWP/3CGWv
	3en91//jQVtwXN1+OO53WlmwtJBN4+vujQHRf2oxoi9FszXsgqCgbJvnn1BcVJDxb1XL
	wJuuQC/qxvCbTGHcZsttW5D7L/5GxiL6aFGvtfH+eCHwNfpi7U83V8ujheD7DQMfoXLB
	EG9QOJc6zcuJSEev+9dMv4+ohzvRjvC1Da44Y6Am34o10rNH/UPrEWZ78eBIhvl5rV2S
	r7oSW3tTjga4NY88F1LCACFMPer9Eys6CuP8dLMC3RB6i7tNOHGxTEX1MgHOHVY6AiUb
	lSVQ==
X-Received: by 10.14.176.193 with SMTP id b41mr31670015eem.55.1397926078478;
	Sat, 19 Apr 2014 09:47:58 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	y51sm87030923eeu.0.2014.04.19.09.47.57 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 19 Apr 2014 09:47:57 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 19 Apr 2014 18:47:49 +0200
Message-Id: <1397926070-7453-4-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1397926070-7453-1-git-send-email-Martin.Jansa@gmail.com>
References: <1397926070-7453-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 4/5] libbonobo: add dependency on dbus, dbus-glib
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 19 Apr 2014 16:48:00 -0000

* | configure:14835: error: Package requirements (	gmodule-2.0 >=
  2.0.1 	ORBit-2.0 >= 2.4.0 	ORBit-CosNaming-2.0 >= 2.4.0 	dbus-1
  >= 1.0.0 dbus-glib-1 >= 0.74 	libxml-2.0 >= 2.4.20) were not met:
  |
  | No package 'dbus-1' found
  | No package 'dbus-glib-1' found

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-gnome/recipes-gnome/bonobo/libbonobo.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/bonobo/libbonobo.inc b/meta-gnome/recipes-gnome/bonobo/libbonobo.inc
index db1db5d..43e034b 100644
--- a/meta-gnome/recipes-gnome/bonobo/libbonobo.inc
+++ b/meta-gnome/recipes-gnome/bonobo/libbonobo.inc
@@ -3,7 +3,7 @@ LICENSE = "GPLv2 & LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
                     file://COPYING.LIB;md5=7fbc338309ac38fefcd64b04bb903e34"
 SECTION = "x11/gnome/libs"
-DEPENDS = "glib-2.0 orbit2 intltool-native libxml2"
+DEPENDS = "glib-2.0 orbit2 intltool-native libxml2 dbus dbus-glib"
 
 inherit gnomebase
 
-- 
1.9.1


