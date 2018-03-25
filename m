Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 277D1786C1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Mar 2018 12:35:44 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id f125so10695902wme.4
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Mar 2018 05:35:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=kdkda3YLXHxwARgzSaC9z25Lt6KbCykB79gw9F/IDdY=;
	b=esNLhnl7g7wLnWZ13whetSHyOGrUH8BOJ6V8aWiin2/sEOCfZwU/nTstDbiWXx2zRl
	1o5pMILp5l/MrYp2HoTg6z57/xjL/wKaSLil0yoYekXrShEWL0Go5JFFUvEjwpfAo3dl
	WgRPCfPu1UtuDgdK2nS9lg5OhoCp6DV6JwjM4H+t5/uw9GMXL/9afArd0YIJjLL5QLb0
	9iHrQw54x8Vp+spijymTHYHQRrepn7S8GaNBZGpBSa3Mhhts1DucIhmlBTL9peWgR7JJ
	HiVUalcYh5wGo9cAa70MG9iYV6Sx2vX1defWRDbk0w25DbYNXBz/yLWVq/sDETKbTAnJ
	CfqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=kdkda3YLXHxwARgzSaC9z25Lt6KbCykB79gw9F/IDdY=;
	b=Hab3fubPhHINUuwZ2mizeY+6I7LGvRrw1oCQvxNih11DOtvy+KlCyosnwYJe/W8Rmy
	JDDTA1To+Xivee2sGemBVkeMP6rFE73xLu74X0nNPXzLAGPASNlSvp+dY17DlQr/R0jN
	EN6zVJsN0p07uw4HiRa3h3PUPvJey4GCkJetGfP9zGJfMEnWaRhDFjdejxfNMa+lw4nR
	9cMblKErHp29zpbYabzulLC8v8iZe5vU2J8nFITuXuDnnGylTkKQx/yTdestNG4MP6jr
	ZUAx9dGExdDymrGd96xKqCM54jrO0hCQyoSZB3/AunUxvgaVYds9hui2DQq6izIN0tcP
	raoQ==
X-Gm-Message-State: AElRT7GTYqsAzF5Zqx4WTo8nun0EdiCTqv8olwZyzofrdVpNvJjMINng
	QsazTUvmuP0HXq0PmBO7zpphRw==
X-Google-Smtp-Source: AG47ELu3WhOo/b7DyNLInXosCrFe0sEju50LdQ3gbl+DNOD7EcuOasKxZluXx4Gl2lQwQUMwCYciuw==
X-Received: by 10.28.153.75 with SMTP id b72mr13788193wme.127.1521981345133;
	Sun, 25 Mar 2018 05:35:45 -0700 (PDT)
Received: from PC192-168-2-116.speedport.ip
	(p200300F07BCB3D681E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:f0:7bcb:3d68:1e6f:65ff:fe3e:7f61])
	by smtp.gmail.com with ESMTPSA id
	v23sm11174719wmh.30.2018.03.25.05.35.44
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 25 Mar 2018 05:35:44 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 25 Mar 2018 14:35:14 +0200
Message-Id: <20180325123520.16452-15-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180325123520.16452-1-schnitzeltony@gmail.com>
References: <20180325123520.16452-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 14/20] hunspell: update 1.6.1 -> 1.6.2
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
X-List-Received-Date: Sun, 25 Mar 2018 12:35:44 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../recipes-support/hunspell/{hunspell_1.6.1.bb => hunspell_1.6.2.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/hunspell/{hunspell_1.6.1.bb => hunspell_1.6.2.bb} (75%)

diff --git a/meta-oe/recipes-support/hunspell/hunspell_1.6.1.bb b/meta-oe/recipes-support/hunspell/hunspell_1.6.2.bb
similarity index 75%
rename from meta-oe/recipes-support/hunspell/hunspell_1.6.1.bb
rename to meta-oe/recipes-support/hunspell/hunspell_1.6.2.bb
index 125729f2d..5feea8987 100644
--- a/meta-oe/recipes-support/hunspell/hunspell_1.6.1.bb
+++ b/meta-oe/recipes-support/hunspell/hunspell_1.6.2.bb
@@ -7,8 +7,8 @@ LIC_FILES_CHKSUM = " \
 "
 
 SRC_URI = "https://github.com/${BPN}/${BPN}/archive/v${PV}.tar.gz"
-SRC_URI[md5sum] = "0df1c18c1284f8625af5ae5a8d5c4cef"
-SRC_URI[sha256sum] = "30f593733c50b794016bb03d31fd2a2071e4610c6fa4708e33edad2335102c49"
+SRC_URI[md5sum] = "1a54504cb470aafa6530bb372a10dc04"
+SRC_URI[sha256sum] = "3cd9ceb062fe5814f668e4f22b2fa6e3ba0b339b921739541ce180cac4d6f4c4"
 
 inherit autotools pkgconfig gettext
 
-- 
2.14.3


