Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr0-f195.google.com (mail-wr0-f195.google.com
	[209.85.128.195])
	by mail.openembedded.org (Postfix) with ESMTP id 38E0D75296
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 May 2018 16:14:26 +0000 (UTC)
Received: by mail-wr0-f195.google.com with SMTP id h5-v6so2574567wrm.4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 May 2018 09:14:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=cbsg6WAcbnmr1egmFgsYvh6gG91DpwPwlW6UYbP8ing=;
	b=Aa82UyTIEehxX1f+9PmfWcThc80WD6Q7w9VSF3cBak+B5oOwZbCjH6uVgTKO/nPv6O
	pFz3MR38u50CemZXmjXY9OOxQZfg2Z1fHrcPiI7xMZVp00cLB1uj2SeSZ9+PbVFvY1VT
	m6KYRjXyxY7xJOlxi1hGEkE3USrd7STMOrwFhyJ7d/mrFVnEQpH3ua+H371FByYP/mSr
	KLnJLFywN08KumFovxvayQkbSacsS/AH88AP7lRzBjKja+aiAVz7miYGuVJlc93J4R+G
	gxOCu2q58XrBBlMztken2+/sgiV/9LeLMjL+4Icq/AwUQGaXrCdsJnsnPktDlEx6pjR9
	htfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=cbsg6WAcbnmr1egmFgsYvh6gG91DpwPwlW6UYbP8ing=;
	b=jqZIHA8sy6oBGxoPrI8VGbR+kJvGZyzEJ+qjwuSYqQxcRW0jdTedzUZz557CG5seFG
	TysyOW2yeFAYRTPSpXUBtT0fLNwwo+UPEb9bP+JzJdiaz29bv9epni8PdJ4FGqa1Vojw
	SkDFG367IvbPkgUXyB61xn0II7rqYPKiOyTpCFSExA20ptx7g4uDAIKDJ2kHNOr/kQKL
	kS7m+UqjfP/WCSMKg4KAxSSyVCvKKR31G0am1EJk9wCbNf/s3ls00jFYxeZF21etgjge
	AV8K1+GVxaDvYPsNkzs5RLCngoVcJDH3A44NIprFkbDo9dfaEYwz9cj8nnGCynLKJKG5
	3pBA==
X-Gm-Message-State: ALKqPwdUVL8xorhsls3ORovk+aGXwG/dC8gqt/ZviTyaG6FM0W89mK7S
	xFY7n04hkqEWja9r+qttCsqckQ==
X-Google-Smtp-Source: AB8JxZrCbz1dtHPv5iS7Zpl8vuvBuE1RfVH2l21GyGZTpYdmX0tN7lHrkqnJrpsPjeMlPeDcW8DZjw==
X-Received: by 2002:adf:e642:: with SMTP id
	b2-v6mr1717289wrn.172.1525968866575; 
	Thu, 10 May 2018 09:14:26 -0700 (PDT)
Received: from mueller-a-nb-linux.speedport.ip
	(p200300F07BC0732689B6120586BBC15E.dip0.t-ipconnect.de.
	[2003:f0:7bc0:7326:89b6:1205:86bb:c15e])
	by smtp.gmail.com with ESMTPSA id
	f143-v6sm1679595wme.43.2018.05.10.09.14.25
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 10 May 2018 09:14:25 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 10 May 2018 18:14:11 +0200
Message-Id: <20180510161415.12827-4-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180510161415.12827-1-schnitzeltony@gmail.com>
References: <20180510161415.12827-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 4/8] xfce4-screenshooter: update 1.9.1 -> 1.9.2
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
X-List-Received-Date: Thu, 10 May 2018 16:14:26 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../{xfce4-screenshooter_1.9.1.bb => xfce4-screenshooter_1.9.2.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-apps/xfce4-screenshooter/{xfce4-screenshooter_1.9.1.bb => xfce4-screenshooter_1.9.2.bb} (79%)

diff --git a/meta-xfce/recipes-apps/xfce4-screenshooter/xfce4-screenshooter_1.9.1.bb b/meta-xfce/recipes-apps/xfce4-screenshooter/xfce4-screenshooter_1.9.2.bb
similarity index 79%
rename from meta-xfce/recipes-apps/xfce4-screenshooter/xfce4-screenshooter_1.9.1.bb
rename to meta-xfce/recipes-apps/xfce4-screenshooter/xfce4-screenshooter_1.9.2.bb
index e449dceed..554fc444a 100644
--- a/meta-xfce/recipes-apps/xfce4-screenshooter/xfce4-screenshooter_1.9.1.bb
+++ b/meta-xfce/recipes-apps/xfce4-screenshooter/xfce4-screenshooter_1.9.2.bb
@@ -7,8 +7,8 @@ DEPENDS = "xfce4-panel libxfce4util libxfce4ui gdk-pixbuf gtk+ glib-2.0 libsoup-
 
 inherit xfce-app
 
-SRC_URI[md5sum] = "75e1501418f904769e4fd25eff6a3946"
-SRC_URI[sha256sum] = "e62b31d9cf06a7414a26400c2ebe7a2ae7c2b22aa60f997f25145ea9ebe6e0db"
+SRC_URI[md5sum] = "901b2c1fb1dd30940c94aaea3e35c540"
+SRC_URI[sha256sum] = "904f3a61417ace55a3b144187565335f8ad5e530ca23b397ce90ed61708c6091"
 
 do_compile_prepend() {
     mkdir -p lib
-- 
2.14.3


