Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f53.google.com (mail-ee0-f53.google.com [74.125.83.53])
	by mail.openembedded.org (Postfix) with ESMTP id D79086B961
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 Feb 2014 01:40:36 +0000 (UTC)
Received: by mail-ee0-f53.google.com with SMTP id t10so2385787eei.12
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 22 Feb 2014 17:40:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=GMPH4VQxg9BfsC+deW7cQ52tSJc5kLeJn10X2fQYMVg=;
	b=G3g1nc1Zjd5cIeHK6ECO5PyD8k4l97Z4ytnJlrEvVLOUvg89YPBN1ZLqMg9fV4wE4W
	RZnLlp9wsWNxP2vBpFSWRUahvIH3PPJ7Qfufnq1SyXak6yAHAeXhtpRaAf2BhPquOFkL
	Dmdqmmi85KTArM1jgl+hdEZ0efpjkU5KLVxkZNFi+xf6W6tCVQhfifcpl5/hz/QqF8kr
	+V+BnhfogXXdKhb1uUCP+8e3L3fgL0J1H3Aw9KmlJUlz6aPXImTgNj1gy5UFOBPaSXKH
	8pntTOvLQ/soG159C9OLXLZC0uIqqHwDfuHtLHpRsU5cJyspoOdyr8Plr3sRyOd+IUFR
	5Z7Q==
X-Received: by 10.14.98.66 with SMTP id u42mr17159499eef.18.1393119637766;
	Sat, 22 Feb 2014 17:40:37 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	n41sm45262126eeg.16.2014.02.22.17.40.36 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 22 Feb 2014 17:40:36 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 23 Feb 2014 02:41:07 +0100
Message-Id: <1393119668-22896-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.5.3
Subject: [meta-oe][meta-multimedia][PATCH 1/2] vlc: Add PACKAGECONFIG for jack
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
X-List-Received-Date: Sun, 23 Feb 2014 01:40:41 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-multimedia/recipes-multimedia/vlc/vlc.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-multimedia/recipes-multimedia/vlc/vlc.inc b/meta-multimedia/recipes-multimedia/vlc/vlc.inc
index f3d8a03..6400719 100644
--- a/meta-multimedia/recipes-multimedia/vlc/vlc.inc
+++ b/meta-multimedia/recipes-multimedia/vlc/vlc.inc
@@ -70,6 +70,7 @@ PACKAGECONFIG[mad] = "--enable-mad,--disable-mad,libmad"
 PACKAGECONFIG[id3tag] = "--enable-id3tag,--disable-id3tag,libid3tag"
 PACKAGECONFIG[a52] = "--enable-a52,--disable-a52,liba52"
 PACKAGECONFIG[mpeg2dec] = "--enable-mpeg2dec,--disable-mpeg2dec,mpeg2dec"
+PACKAGECONFIG[jack] = "--enable-jack,--disable-jack,jack"
 
 do_configure() {
     cp ${STAGING_DATADIR}/aclocal/libgcrypt.m4 ${S}/m4/ 
-- 
1.8.5.3


