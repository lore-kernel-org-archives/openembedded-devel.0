Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com
	[209.85.208.178])
	by mail.openembedded.org (Postfix) with ESMTP id A1C287ED5A
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Sep 2019 23:42:58 +0000 (UTC)
Received: by mail-lj1-f178.google.com with SMTP id s19so1351333lji.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Sep 2019 16:43:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=jnOuscH5y+x2/Nu4S3bDIuqRPNtceLsfFasGpSHODkw=;
	b=HxhOBJLMx67sNrht7U9QUpJQKCgvsCePtHp9KAmtu5587A4qLILTdiLLlerGJMytae
	tlxpSo2XmZlhy2kEuR0TcADVPuG4rhfFYQsSoF5BKsYUIYMftFitT3G1WxEewPuGJrgK
	KvyMbuDq6zuVlWh7iaXdJB6npGc6HGuio/RSVquVGFs25Um7W5vhaCZqLU/s2G/tDKAV
	flVQGTgBfqY8ZiLrXLcw+P5X19o2kI6oCPSamee5iXSeymRVdT0TVZ8qxbFfYkNc89yt
	SR7F/kImHnsQ9dkA2AReMfZrSQLTWYY4F7nEbFp6MXAsEgnUu5h2t84cr/EhZ3KWFpFX
	i0HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=jnOuscH5y+x2/Nu4S3bDIuqRPNtceLsfFasGpSHODkw=;
	b=RT3CFhu70FShPhfyI9txYPca2HnqDBSXx1AUw4ELDes7JSpiDauwE0zpWOHb8mEpKo
	YuWmIEQVM/5OhJvaBzMkFFGxofQOjhXSdtr/Z0Rt92VJR1Zq0gg/aFLRSet6FP+/6fdU
	YLBPpEghySWRJmS+tCadUncE4Dq26DhAaA85MCIzgicJvAsifw1S/vC1TyQRfnTxp2Yo
	P4TUFDa9lkg35SZN7d2jYasf5QmUHJWXHmT1bwNNP3JwStnUvB0hW25MYXm3nkkzoPkv
	zkOf9bUsmbiKQCnFG3bCWljLKRdtEMBw7ufi0D0Optm36HYDKx/IE2l0khWCXtsclLeN
	gKlw==
X-Gm-Message-State: APjAAAUY3xsAQz6YBSBPGfLBfDiRvaouzYP60arzIrxM2SzUCTgLKvHN
	r6Iwn32H7b9YomxrDdfOMOmRHIshyVA=
X-Google-Smtp-Source: APXvYqxGQ0lC8ltdDDnPf7cR/1fCsrYbP82HUy0va/OLeymNdpK/GUaf9qXZOGMkYT8Jho8TTb5DEg==
X-Received: by 2002:a2e:8802:: with SMTP id x2mr345668ljh.113.1568590979059;
	Sun, 15 Sep 2019 16:42:59 -0700 (PDT)
Received: from localhost.localdomain (c213-89-0-115.bredband.comhem.se.
	[213.89.0.115])
	by smtp.gmail.com with ESMTPSA id 81sm8143154lje.70.2019.09.15.16.42.58
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 15 Sep 2019 16:42:58 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 16 Sep 2019 01:42:57 +0200
Message-Id: <20190915234257.13921-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH][meta-oe] flatbuffers: update to 1.11.0
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
X-List-Received-Date: Sun, 15 Sep 2019 23:42:59 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../{flatbuffers_1.10.0.bb => flatbuffers_1.11.0.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/flatbuffers/{flatbuffers_1.10.0.bb => flatbuffers_1.11.0.bb} (94%)

diff --git a/meta-oe/recipes-devtools/flatbuffers/flatbuffers_1.10.0.bb b/meta-oe/recipes-devtools/flatbuffers/flatbuffers_1.11.0.bb
similarity index 94%
rename from meta-oe/recipes-devtools/flatbuffers/flatbuffers_1.10.0.bb
rename to meta-oe/recipes-devtools/flatbuffers/flatbuffers_1.11.0.bb
index 452e1e65a..4a76b9273 100644
--- a/meta-oe/recipes-devtools/flatbuffers/flatbuffers_1.10.0.bb
+++ b/meta-oe/recipes-devtools/flatbuffers/flatbuffers_1.11.0.bb
@@ -10,7 +10,7 @@ RDEPENDS_${PN}-dev += "${PN}-compiler"
 
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=a873c5645c184d51e0f9b34e1d7cf559"
 
-SRCREV = "c0698cc33f1e534bb59c455909b88cc2726089af"
+SRCREV = "9e7e8cbe9f675123dd41b7c62868acad39188cae"
 
 SRC_URI = "git://github.com/google/flatbuffers.git"
 
-- 
2.17.1


