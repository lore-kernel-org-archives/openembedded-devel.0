Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f178.google.com (mail-wi0-f178.google.com
	[209.85.212.178])
	by mail.openembedded.org (Postfix) with ESMTP id D90866FA8D
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  1 Apr 2014 17:15:12 +0000 (UTC)
Received: by mail-wi0-f178.google.com with SMTP id bs8so5583230wib.17
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Apr 2014 10:15:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=FWyAVnQ/UkzwDgAtWsdmEnuteR3y4nLltuAmIF5cSv4=;
	b=CJ9vUQMLjfFGDv2mjqPl3YcpUL9zIYu7fcudsxuHSvdeikFsVtpVCYUKHKfMKpcglP
	t8hRemOmP9Cp6bdJKzrPHbBfBKiMfEKGTEsgnI8QugGsE1g0RudL9oxRmzQpIS3gavcI
	RoHXZcB34UJWOHC72crs9tEkB0lXetR8m9nwnQnUL2E/xmEi1BrT2XFGVKe/K+nyJo2q
	LfVTkHXT4QjWbo0wJdi5s4y++oGmB0oMfuxim7BU83MgEFiRV0PdSPI1mW7Utcx0jVeH
	3vAd1LWCISwRA3XU/6Q0hc7/1j6dbXPtoPg+n55oLSlwEt2o0EXZqqx8owfGi3eajhb2
	ZiYQ==
X-Received: by 10.194.19.161 with SMTP id g1mr24075550wje.20.1396372513475;
	Tue, 01 Apr 2014 10:15:13 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	s46sm41877674ees.3.2014.04.01.10.15.09 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 01 Apr 2014 10:15:10 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  1 Apr 2014 19:13:41 +0200
Message-Id: <1396372434-10710-33-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1396372434-10710-1-git-send-email-Martin.Jansa@gmail.com>
References: <1396372434-10710-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 33/46] gtksourceview2: inherit only gnomebase
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
X-List-Received-Date: Tue, 01 Apr 2014 17:15:13 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-gnome/recipes-gnome/gtksourceview/gtksourceview2_2.10.5.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/gtksourceview/gtksourceview2_2.10.5.bb b/meta-gnome/recipes-gnome/gtksourceview/gtksourceview2_2.10.5.bb
index 877b1c1..df4d472 100644
--- a/meta-gnome/recipes-gnome/gtksourceview/gtksourceview2_2.10.5.bb
+++ b/meta-gnome/recipes-gnome/gtksourceview/gtksourceview2_2.10.5.bb
@@ -10,7 +10,7 @@ PNAME = "gtksourceview"
 
 S = "${WORKDIR}/${PNAME}-${PV}"
 
-inherit gnome lib_package gettext
+inherit gnomebase lib_package gettext
 
 # overrule SRC_URI from gnome.conf
 SRC_URI = "${GNOME_MIRROR}/${PNAME}/${@gnome_verdir("${PV}")}/${PNAME}-${PV}.tar.bz2;name=archive \
-- 
1.9.1


