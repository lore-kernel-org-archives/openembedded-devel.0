Return-Path: <twoerner@gmail.com>
Received: from mail-it0-f68.google.com (mail-it0-f68.google.com
	[209.85.214.68])
	by mail.openembedded.org (Postfix) with ESMTP id 4341E75014
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  9 May 2018 21:22:58 +0000 (UTC)
Received: by mail-it0-f68.google.com with SMTP id y189-v6so674271itb.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 09 May 2018 14:22:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=AKEnG4K66NjXdgS+4JehubeISdSdOUaskZSBfVTkVZM=;
	b=vVnKkqXb1c/WZPKsSOoCECCG/piNlz2hDPgI2HTaLA8GsCw8i7AH/KO4bLWOycGXhm
	szxN4F4kTsIh2IsVjTpTUfJWmpspxadVfoVuzhnW/eu1lbsNm7tRkyiZ3xM6DWE5aF7G
	HZn6ZhxpPZxJBhiiXwhx/oGEtz6pNyULzb4sXzAtOwwgi5JcmMNAaxO/JIMwN/Mqj6S6
	MalXPDaoCbjqRhczrEJFDvLYjOpdHO2CMeJ5pJbyO3Tdzz2GEqogDuO+qGfqM5t+Qvab
	GZZmz0dhr/PiVu6pGLb1m5PkhdZRrkXE6mZGUjeSazSjSAO3cEjSnpS0zON6QcyZnFmD
	OWNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=AKEnG4K66NjXdgS+4JehubeISdSdOUaskZSBfVTkVZM=;
	b=LWem2uSU/dutWjEbSxTEskYlGIXm+1M1cOdIaO/5kN/elLqOHY2MnDHRvRuVPXZeFb
	7SfufHAu+dm9lKGkR7QxlWQ33qJw9S292q03UazKcHGAGusksITPwe3w+5YrLLUofkwk
	BNHFcg4U4+XE5aXMZwtxW7d27RGx/8sYitVeZCaFphK8qh17+pBhLqt/xSq8AkkpxY7c
	ZbwSUcwKgUwLvZuxdiEYsUM27qhv2Sw9RRvJ3PvVGtBDNYvm1b0BVb4paN3U+gDJsWxb
	Y2/Lq4+UBkCbxaA4d/MCzpKLNWI9PrzNPtRnztrFlQdVUMmr5NVCs/WOrkdXHRoF7+mU
	fErQ==
X-Gm-Message-State: ALKqPwdhz+zBcJ6J0bjt/6AgnDCFabjkCjFy72wzM2Rs3D5dXC/Z5X79
	XnyTYMh3TuyhVSi00lwO9NMVr09h
X-Google-Smtp-Source: AB8JxZrIV0Mr8GDgbZON79SibFtj5VLM5upS7MGbCOwWF6IsnuGsWph0+AlG4ny/KY2nmUTv0P+iGA==
X-Received: by 2002:a24:4c55:: with SMTP id
	a82-v6mr11390951itb.1.1525900978969; 
	Wed, 09 May 2018 14:22:58 -0700 (PDT)
Received: from linux-uys3.suse ([206.248.190.95])
	by smtp.gmail.com with ESMTPSA id
	c18-v6sm16093181ioa.16.2018.05.09.14.22.57
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 09 May 2018 14:22:57 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  9 May 2018 17:22:46 -0400
Message-Id: <20180509212246.15272-2-twoerner@gmail.com>
X-Mailer: git-send-email 2.17.0.rc2.3.gc2a499e6c
In-Reply-To: <20180509212246.15272-1-twoerner@gmail.com>
References: <20180509212246.15272-1-twoerner@gmail.com>
Subject: [meta-multimedia][PATCH 2/2] libsrtp: bump 1.5.2 -> 1.6.0
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
X-List-Received-Date: Wed, 09 May 2018 21:22:58 -0000

Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 .../libsrtp/{libsrtp_1.5.2.bb => libsrtp_1.6.0.bb}     | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)
 rename meta-multimedia/recipes-support/libsrtp/{libsrtp_1.5.2.bb => libsrtp_1.6.0.bb} (63%)

diff --git a/meta-multimedia/recipes-support/libsrtp/libsrtp_1.5.2.bb b/meta-multimedia/recipes-support/libsrtp/libsrtp_1.6.0.bb
similarity index 63%
rename from meta-multimedia/recipes-support/libsrtp/libsrtp_1.5.2.bb
rename to meta-multimedia/recipes-support/libsrtp/libsrtp_1.6.0.bb
index ee8c68bc1a..d3ab5b71c0 100644
--- a/meta-multimedia/recipes-support/libsrtp/libsrtp_1.5.2.bb
+++ b/meta-multimedia/recipes-support/libsrtp/libsrtp_1.6.0.bb
@@ -6,17 +6,11 @@ LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=15bc16b9d2e305974dde47e733883714"
 
 S = "${WORKDIR}/git"
-SRCREV = "e806a66bad35f4b215b7a825c24ef0ec4cc19569"
-SRC_URI = "git://github.com/cisco/libsrtp.git;protocol=https; \
+SRCREV = "2b091a4fb21c9b06fc5d4b5763bdaec97542fcd7"
+SRC_URI = "git://github.com/cisco/libsrtp.git;protocol=https;branch=1_6_x_throttle; \
            file://0001-Rename-conflicting-variable-mips.patch \
            "
 
 inherit autotools
 
-do_install[postfuncs] += " rm_unused_bindir "
-
-rm_unused_bindir() {
-    rmdir ${D}/${bindir}
-}
-
 ALLOW_EMPTY_${PN} = "1"
-- 
2.17.0.rc2.3.gc2a499e6c


