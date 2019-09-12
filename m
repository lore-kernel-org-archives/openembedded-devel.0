Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
	[209.85.167.53])
	by mail.openembedded.org (Postfix) with ESMTP id 514917E3BC
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Sep 2019 22:07:36 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id u26so2859368lfg.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Sep 2019 15:07:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=fZ4oPZ7QkT7aymUuQlPSbZgcks7OeZqZWu1NwLkfYps=;
	b=2KQo1cPC7g3fF5rmh4PqKLby0TwjJhaxgXno4pUaz6Y4gzy7yc64XpGLTAovDr/UbX
	jTUpjU2RWhD+CKU/uwRJhtES1RvnQiTwcKMADEbgodFh8FgYfmv1YZdMX7iA5qlqmCDs
	PBedPU2LB9h6UG0WrCX511hhXJo/KsNHeoAnIXd6bVd4Paf6/6Ds09v1NPxpCr/RBTVH
	dSa+gugGpD8QDE1ki8MMVJf+++RzCVVM0fyceaaM3Hk6kqbPf/73QzMXbUoHCZ/Q3AGe
	R3HvvmIL9wGyDkoKsVHzu7inQqrZ7SI6crgVzjlm7BkdLiUWp09zmKIN4R+K68oW7NOW
	zOQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=fZ4oPZ7QkT7aymUuQlPSbZgcks7OeZqZWu1NwLkfYps=;
	b=JXa+AJ0tKnfFhQC1OKkCqpalwA+rHE5Vtw2wMWHztc993CnznwpZ4DZqgoUvknHvA9
	IUimyvR+pw7eHPuH/Fb/2KV5PGrnhfIT6UBynkFaEemzqqMTS4AVSu/ptrDQcyEGHI/q
	WeORxiC03xjRHywu2JaWCtwnSjbw5K+eGebNgUuu/0RsSVtq0YcoSTziZlvGPF78DIdP
	FD1CN/IGvAkEy7Io9bZeJLegtSThZJ59Y5mXNjuvHIvXSahCPezpUw2l5CdRVjX5CQs1
	4oxEHNAOA8CeO+Dx4lmV3d6yRmw6OTsCyMFj50h6Ge1maQCOkDT9fe1GQHgkVv7q4+Mw
	96Ug==
X-Gm-Message-State: APjAAAWQ/1lkBzG2sdNoHp9L95V/ubi+foSqYIKPqrCMXwGDYthEnBgP
	f+jlCA8S/PhMcVgXOHjs7pA1TFaisEs=
X-Google-Smtp-Source: APXvYqwtRrEaIdEaxREKT8MRGsn0ShmcYJlgxFwN6Tv13MtXB2/OV9cwebcTSNb4w7zRTzQTP6+fUA==
X-Received: by 2002:a19:ae0b:: with SMTP id f11mr30434395lfc.28.1568326056912; 
	Thu, 12 Sep 2019 15:07:36 -0700 (PDT)
Received: from localhost.localdomain (c213-89-0-115.bredband.comhem.se.
	[213.89.0.115])
	by smtp.gmail.com with ESMTPSA id t8sm1095018lfc.80.2019.09.12.15.07.35
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 12 Sep 2019 15:07:36 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 13 Sep 2019 00:07:33 +0200
Message-Id: <20190912220733.30921-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH][meta-oe] libsass: update to 3.6.1
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
X-List-Received-Date: Thu, 12 Sep 2019 22:07:38 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../sass/{libsass_git.bb => libsass_3.6.1.bb}               | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-support/sass/{libsass_git.bb => libsass_3.6.1.bb} (65%)

diff --git a/meta-oe/recipes-support/sass/libsass_git.bb b/meta-oe/recipes-support/sass/libsass_3.6.1.bb
similarity index 65%
rename from meta-oe/recipes-support/sass/libsass_git.bb
rename to meta-oe/recipes-support/sass/libsass_3.6.1.bb
index 4c229cdb7..480e984fc 100644
--- a/meta-oe/recipes-support/sass/libsass_git.bb
+++ b/meta-oe/recipes-support/sass/libsass_3.6.1.bb
@@ -5,9 +5,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=8f34396ca205f5e119ee77aae91fa27d"
 
 inherit autotools
 
-SRC_URI = "git://github.com/sass/libsass.git;branch=3.5-stable"
-SRCREV = "39e30874b9a5dd6a802c20e8b0470ba44eeba929"
+SRC_URI = "git://github.com/sass/libsass.git;branch=master"
+SRCREV = "4d229af5500be1023883c38c4a675f0ed919839d"
+
 S = "${WORKDIR}/git"
-PV = "3.5.5"
 
 BBCLASSEXTEND = "native"
-- 
2.17.1


