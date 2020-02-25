Return-Path: <scott.branden@broadcom.com>
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
	[209.85.215.195])
	by mail.openembedded.org (Postfix) with ESMTP id 59D8C6062A
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Feb 2020 00:09:38 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id d9so5979667pgu.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Feb 2020 16:09:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=broadcom.com; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=7x9Jrp7mr+MciOc/RCKzZqJVPkqGgpZJey9+8qzI15I=;
	b=cEPyiQX+wqFh80S40P65sHj9wLw6N5zr3Qd5OXFo9jyJVeal3VBPVA7v+CR+xCeDGd
	BTTX/ffkUDHq2LejbDcld948uD+OLCRNe0gUeHBlVEQlj9FD66bks939u2KvQwP9tbU2
	602bkxP8VQhKZoWq5gU+DR4sxQ6BR2PMRELVU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=7x9Jrp7mr+MciOc/RCKzZqJVPkqGgpZJey9+8qzI15I=;
	b=jC0tsO6nXG5nsDGDzGHQKh4NJnrXkFasXx1kW1/4R9uef4hbuKi1+9AcXhdaqdtnl+
	dBBX8LN64thFYoVimbBFInKl13CWgGetEY0Z7E/7cN0NKUH4bDADhOoN5Rxjze0TTLvu
	fOdvBSci+a5ZSNGWcRerE+Slg699MG/txbDj5MJlzGpUV0RWYdxWdktqK0LCwFttYJV+
	9Nzlfp3f8r/jGLd0oRgeOh6Aq/TCX2hDnD1ZZw2gH8M13SCYt5kCHfn6MBeTWHXeCeiI
	lJfyWq90wtnDbBQJ93m3PA2eFJa1IzLvdAxj7Zpc5TTkN8BLnBQda0oHveASIzd5uKvB
	RlLQ==
X-Gm-Message-State: APjAAAUUA4TT4t5WUq8SCXabDrgVoPrP9Y9WoiPe2mzW8bU7hrCVOIVP
	avA7szHA8gaohi6oUt612Gt6n95s5x7Hp+5hxU09EZNUf6b6rOr3PXeeC4SKJjphYNE3GR+TZDV
	FgPKjVyFXpRM6kSJYP5n6Oog/OT1cRC2PQZCsDJYGGcyKueu+XJyM06net9b5Mwn55V0/vQinA7
	EfW9arC2c4qcwVoFVKH+YAiQDoOsNN
X-Google-Smtp-Source: APXvYqyyFtIcK48yhYJtit2FrATJKYbCzYHkrFx3vZ03yXH+5tq2s9nO1PSZI0Z9son1u19c9AXckw==
X-Received: by 2002:a62:1958:: with SMTP id 85mr52098931pfz.221.1582589378991; 
	Mon, 24 Feb 2020 16:09:38 -0800 (PST)
Received: from lbrmn-lnxub113.broadcom.net ([192.19.228.250])
	by smtp.gmail.com with ESMTPSA id
	a36sm13951567pga.32.2020.02.24.16.09.37
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 24 Feb 2020 16:09:38 -0800 (PST)
From: Scott Branden <scott.branden@broadcom.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 24 Feb 2020 16:09:27 -0800
Message-Id: <20200225000927.17849-1-scott.branden@broadcom.com>
X-Mailer: git-send-email 2.17.1
Cc: Mircea Carausu <mircea.carausu@broadcom.com>
Subject: [meta-multi-media][PATCH] fdk-aac: add initial fdk-aac recipe
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
X-List-Received-Date: Tue, 25 Feb 2020 00:09:38 -0000

From: Mircea Carausu <mircea.carausu@broadcom.com>

Add Fraunhofer FDK AAC Codec Library recipe.

Signed-off-by: Mircea Carausu <mircea.carausu@broadcom.com>
Signed-off-by: Scott Branden <scott.branden@broadcom.com>
---
 .../fdk-aac/fdk-aac_2.0.1.bb                  | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 meta-multimedia/recipes-multimedia/fdk-aac/fdk-aac_2.0.1.bb

diff --git a/meta-multimedia/recipes-multimedia/fdk-aac/fdk-aac_2.0.1.bb b/meta-multimedia/recipes-multimedia/fdk-aac/fdk-aac_2.0.1.bb
new file mode 100644
index 000000000..d7911681c
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/fdk-aac/fdk-aac_2.0.1.bb
@@ -0,0 +1,22 @@
+SUMMARY = "FDK-AAC audio codec"
+
+DESCRIPTION = "The Fraunhofer FDK AAC Codec Library for Android \
+(\"FDK AAC Codec\") is software that implements the MPEG \
+Advanced Audio Coding (\"AAC\") encoding and decoding scheme \
+for digital audio."
+
+HOMEPAGE = "https://www.iis.fraunhofer.de/en/ff/amm/impl.html"
+
+LICENSE = "Fraunhofer_FDK_AAC_Codec_Library_for_Android"
+LICENSE_FLAGS = "commercial"
+LIC_FILES_CHKSUM = "file://NOTICE;md5=5985e1e12f4afa710d64ed7bfd291875"
+
+SRC_URI = "git://github.com/mstorsjo/fdk-aac.git;protocol=git;branch=master"
+SRCREV = "d387d3b6ed79ff9a82c60440bdd86e6e5e324bec"
+
+S = "${WORKDIR}/git"
+
+SRC_URI[md5sum] = "fef453b5d6ee28ff302c600b8cded3e7"
+SRC_URI[sha256sum] = "07c2a64b098eb48b2e9d729d5e778c08f7d22f28adc8da7c3f92c58da1cbbd8e"
+
+inherit autotools
-- 
2.17.1


