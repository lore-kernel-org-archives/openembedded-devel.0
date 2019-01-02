Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
	[209.85.214.195])
	by mail.openembedded.org (Postfix) with ESMTP id 57AB56BDB2
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  2 Jan 2019 19:25:15 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id p8so14887742plo.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 02 Jan 2019 11:25:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=0ovadp66phppGU69HYCCXWGfW7LwV0j/uS7CMQkDoM0=;
	b=OZqX9byd8/bVtuFl5fvLUe6P5SnLzm3yEGhY9x/kzuCYO4WRwQ2FOWZuHpNkP/DN5C
	IiaZU8IeHc4OreMwN7AbLHavNC54KABK1L85K2XzqnRVCCyieCV+fr3PpIW8wvoFQ+MM
	9zWpJBy6/d3YuGJDtGVwF0DNrXtyTOaSEJMqnu1GRJDlALDrqKJetU98AUt4w/o6FDM8
	ahUMRGp/C5hBD7kN34w/dGWKnh0E6U+FaZ6n4bqJvMjWW8OvUC5hBNHRl4yUgPikjhQm
	2XnDoaSl+HLxYI4ps/BmEEOLq8muj4eLg0llsi0/S9mlThQ6EWh8NaHNSwdVDmg12Bgo
	JehA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=0ovadp66phppGU69HYCCXWGfW7LwV0j/uS7CMQkDoM0=;
	b=WyZlOqYQpSsI3EfUjArP3bnORudNO3lZ9cEi6eImTkAK4C60TaXb3w8fvErz1i8mzZ
	j0qHqZ/tuCY93+zXuvzqS5h3BgtA0i8JyFQvrWUf7/7mDZSK68zZV3z6fFLAKjWSuIrr
	wz3G/vVQp3nmGqgaH2tuQ887i7wzgC8CSUfnJP4ADj7OJhwaYJKjRpORX/SktPZbqcL5
	sLET7zYidoC1dkq61IvU1tXK8lmYAMjoZ1Ujv5kyOwMaHiCFwYJamfsG3EgeJosB/LNi
	GUuaRkN0sZSx0QDU0Nvh1FR6yuBZJ1CZ5Ri0D9qbaEyGKHS1/Pj4aqvzZrlrQX9n5E1l
	KFkw==
X-Gm-Message-State: AJcUukd5UPoksySw/EemtW84s9GAxJySYMLNP5c7u3C4zLRgcYK+oA+j
	gvxjXhN9K/tAfRASGYaBxtvri5ZnTzw=
X-Google-Smtp-Source: ALg8bN5OuY03C4vqgioXV0xbozbrPIy412Iuif6ZvkVsFXohErqAYIVrKtogSlws5zBQNYz0olC6HQ==
X-Received: by 2002:a17:902:d83:: with SMTP id 3mr43558561plv.43.1546457115989;
	Wed, 02 Jan 2019 11:25:15 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:877f:9499::6ee7])
	by smtp.gmail.com with ESMTPSA id
	l5sm65096423pgp.82.2019.01.02.11.25.15
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 02 Jan 2019 11:25:15 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  2 Jan 2019 11:25:08 -0800
Message-Id: <20190102192508.11764-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH] luajit: Disable for mips64 hosts
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
X-List-Received-Date: Wed, 02 Jan 2019 19:25:15 -0000
Content-Transfer-Encoding: 8bit

mips64 port does not exist

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-devtools/luajit/luajit_2.0.5.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/luajit/luajit_2.0.5.bb b/meta-oe/recipes-devtools/luajit/luajit_2.0.5.bb
index 3052eb0484..897b26dd95 100644
--- a/meta-oe/recipes-devtools/luajit/luajit_2.0.5.bb
+++ b/meta-oe/recipes-devtools/luajit/luajit_2.0.5.bb
@@ -90,5 +90,6 @@ FILES_${PN}-dev += "${libdir}/libluajit-5.1.a \
 "
 FILES_luajit-common = "${datadir}/${BPN}-${PV}"
 
-# Aarch64 is not supported in this release 
+# Aarch64/mips64 is not supported in this release 
 COMPATIBLE_HOST = "^(?!aarch64).*"
+COMPATIBLE_HOST = "^(?!mips64).*"
-- 
2.20.1


