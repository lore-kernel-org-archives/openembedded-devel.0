Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr0-f193.google.com (mail-wr0-f193.google.com
	[209.85.128.193])
	by mail.openembedded.org (Postfix) with ESMTP id 18C0974737
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Mar 2018 13:32:33 +0000 (UTC)
Received: by mail-wr0-f193.google.com with SMTP id d1so8047294wrj.13
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Mar 2018 06:32:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=kdkda3YLXHxwARgzSaC9z25Lt6KbCykB79gw9F/IDdY=;
	b=qMmSOVfmZlggTWKgxggW/ruEH4nHLnyugLkVioMbpVw5Wh9rqIWLBnTz7xCjwW6g3l
	llf4KFa5c0YAdd38xHq8D4dCMGtjD4tEXbVDvF0I6kNpi2jWi3hQw3rUn2BFoegsnkCX
	D6aerXfPRhkatAMFOjNrQWJ2mhoQw+xIuqJAcubWflQ2PSfjCgnVmrVHPJa59UB74lMt
	oij1qNYHrtijbUqLghOhLhP4JubeK7qJDGvy6W+UUugCmNhl0OtkhMTlFOL4HbOhv7c5
	cv/oiaxD0K+VyC37Jmz4jdLC1keS2XKygo1WO1bhyyZdJgsFhH0nwYTHzWVC1wZaxqil
	TSmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=kdkda3YLXHxwARgzSaC9z25Lt6KbCykB79gw9F/IDdY=;
	b=S+IacbaLyNPn0glG6nOOCXdg79O4cKDWaDQdnkra8Mb4SK4Gtw8wkzhaU2z+LSrJlu
	0H8/0GAch41VIXZIN47flQG7EY3uV570PNYmI34PCDT9UnYQMy4vxl9fX10cejCotkkU
	35HsgughuCvG4zIy/IZPD0G5wHN+Vfb5o9zd40tcSqvlAAI6jEwD+OXPbL6BtDvFIiwY
	acAHN4QJSdPVTxDjSN6qLzi89d1sJ6lwXBJdbllWM62ftDS536N2Wsv+tldGkkU+Ed4s
	QTUaB8ruG2HMhD5acnEP8TjsSghQCusfUAmVA84pWybGxpJm/u1wWXdABphXnLVj5m2S
	VHyQ==
X-Gm-Message-State: AElRT7F5nUpWGzwgdJG3KMMDiBFxAFPQ1+Mq41gNqLYWNcDdC7JxNgU0
	1WMnZ9c7KsIcgkVnG2O8FTVvMw==
X-Google-Smtp-Source: AIpwx4/NEpsCOt32UobVE1uvBRk5g2lfBhjuUgEASxTaWR2dPf6ZLW8uVBofujSQ8xyp/y/z+DOKrA==
X-Received: by 10.223.196.204 with SMTP id o12mr9650861wrf.121.1522416754280; 
	Fri, 30 Mar 2018 06:32:34 -0700 (PDT)
Received: from PC192-168-2-116.speedport.ip
	(p200300F07BC180221E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:f0:7bc1:8022:1e6f:65ff:fe3e:7f61])
	by smtp.gmail.com with ESMTPSA id
	93sm10468396wrh.46.2018.03.30.06.32.33
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 30 Mar 2018 06:32:33 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 30 Mar 2018 15:31:42 +0200
Message-Id: <20180330133151.25882-31-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180330133151.25882-1-schnitzeltony@gmail.com>
References: <20180330133151.25882-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 30/39] hunspell: update 1.6.1 -> 1.6.2
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
X-List-Received-Date: Fri, 30 Mar 2018 13:32:34 -0000
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


