Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
	[209.85.221.51])
	by mail.openembedded.org (Postfix) with ESMTP id 2D8167FA80
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 27 Oct 2019 23:35:59 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id e11so7994658wrv.4
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 27 Oct 2019 16:36:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=h3E2LBK/JWZTq+E/ZRM8vR7u8wMcSd5MA5r8ajYno+Q=;
	b=sKGIaTnemJtOxUay5u6iZ/icblvWv2J3aCwMdasMhmnkU1o1hTU557CkU6z8NoynJG
	r48dXDd/KXQEhIQFaUL9VjE64ahJgq0TYjz89v6l0dOzXW+jL/u7mGy5qzveDaVjqhhs
	9TfXZd3ZgJGriosDYW3W+g5Nbwh9aVcC7mYGlr1xcAKXbEj+2W7jZkRiR7sAp+LJGLOH
	jP8nuOsR6AAiMuTmrN+yF0nUvMOO4iiuARMpAdXp420eZOHTYeSPHrg9UB7UxOT0M1jM
	uhYu3cg2R0W1VPCQs0hKVhd14cvcjTrg8n/H1vOB0C0hiWa9QzAQrhHNVUipVeaXqJav
	8Syw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=h3E2LBK/JWZTq+E/ZRM8vR7u8wMcSd5MA5r8ajYno+Q=;
	b=rBkN4q7v8G8IA8h5ZjxatVSFHjtL/FTA9IBANj6Bzn1NvBf48/XiToODjeafCVKKwT
	1E+h6afWpgHl24RKgRRErp5jTnVZGcpaf+SSslsOv0SsBz1k69COJQsJXk5iWn+CQEKl
	Pd9PGVg1i5/PmzeDBAYt5NliAprZ/zhjHfFNX10ezVSOeaMsUhVoP1HiKAPQxygM0sz9
	9WlBleitBJVQAKps+A7Tyh9vk/TU1Gr+gAD1uR7YM6ZS3IBoa+FSBuhoujm6p9FEVoW1
	ZI3Ino6ydP+20XJXjZH+wVBpZQF6I2HUkiyxrdaD+APMFR8bnMfVzIZ4e1SiDsBZpa/6
	jstA==
X-Gm-Message-State: APjAAAUYtJoIGEH+FIrBU++RSSg7AL+YRHBwTN5efZwMwQ2m9LQJ2MMu
	HIf7UvdODKNeV5EciKddcPQYxJWL
X-Google-Smtp-Source: APXvYqwyrxA0pIvjBMaT4O9MW8ydgmkS6QgYUiogouYVPKJGkkmTIz6VcSKc+Btzb92AVGt5GxNpjQ==
X-Received: by 2002:adf:8088:: with SMTP id 8mr12182626wrl.230.1572219359560; 
	Sun, 27 Oct 2019 16:35:59 -0700 (PDT)
Received: from superandy.speedport.ip
	(p200300F07F320614DE89D4DE1A96B15C.dip0.t-ipconnect.de.
	[2003:f0:7f32:614:de89:d4de:1a96:b15c])
	by smtp.gmail.com with ESMTPSA id a17sm8699929wmb.8.2019.10.27.16.35.58
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 27 Oct 2019 16:35:58 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 28 Oct 2019 00:35:28 +0100
Message-Id: <20191027233545.4146-3-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191027233545.4146-1-schnitzeltony@gmail.com>
References: <20191027233545.4146-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 02/19] yelp-tools: use itstools.bbclass
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
X-List-Received-Date: Sun, 27 Oct 2019 23:35:59 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-gnome/recipes-gnome/yelp/yelp-tools_3.32.2.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta-gnome/recipes-gnome/yelp/yelp-tools_3.32.2.bb b/meta-gnome/recipes-gnome/yelp/yelp-tools_3.32.2.bb
index 6a6397cee..af2bab380 100644
--- a/meta-gnome/recipes-gnome/yelp/yelp-tools_3.32.2.bb
+++ b/meta-gnome/recipes-gnome/yelp/yelp-tools_3.32.2.bb
@@ -5,12 +5,11 @@ LIC_FILES_CHKSUM = " \
     file://COPYING.GPL;md5=eb723b61539feef013de476e68b5c50a \
 "
 
-inherit gnomebase
+inherit gnomebase itstool
 
 DEPENDS += " \
     libxslt-native \
     libxml2-native \
-    itstool-native \
     yelp-xsl \
 "
 
-- 
2.21.0


