Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
	[209.85.128.41])
	by mail.openembedded.org (Postfix) with ESMTP id A886E7F37D
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  1 Sep 2019 18:44:39 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id t9so12395552wmi.5
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 01 Sep 2019 11:44:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=8AiIf/olL3OKFKSrqzxJvDkPW8fiQ9x4047mx8ufbRQ=;
	b=VF901ezorHOmkTz0oUAWDoSfry6inJKtGtSvdniSKOXi4JFu8TjHwrtZ35XUd0Dlci
	DPWJznxJegBPZH4crIOT+GHa6IpfZoZ8M1KGM2PaepmrRnvuIV/LDD1uBNRm+guQzviZ
	5edd3RcR1qKBhgvDQZ9CjF55TyYAcpR//rAYAQxbyEyagiNxJuK7IBKHrkcCtpXpWMsM
	aCIy2tURU6I68pLDqfdXPZs2UFsHbLxTguSWLc0a0MGRRtK7l0K/e2uQB+mcqPA9C6ti
	4li2c15If4tu4WiRT0So4ol47Ot5OEvl1EhRyFKyjGPdZAe0vVqLrAOPlYf5JU5Ao33P
	lZoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=8AiIf/olL3OKFKSrqzxJvDkPW8fiQ9x4047mx8ufbRQ=;
	b=Y9laMM+t83hnLDd+diBrKO/gAUs19I8w8Mi3ISL43YgF5b0tbyEEz6dQEy+9N9PQWj
	kYeJFW78z3/65auAYu/aAbK7KsCSqOmjUd8Q7crFwVBNfIiTnFO2bphN/5KaYa3rpJn4
	D+px2uqthjW1y2hQwLB6gZttcx1oDtB7wVT2Esu5bfXHz5WtQUB4mOFRmztGhck4jmSn
	0BnPdJs5P5jU2IWXqMaJMhR2/kjA8J9B1Uv/DntGKfes+5OYtMAAag+SSJ4qdkG8rsP3
	ObIohwFcyHEh7bW/iMNNZgOCke61B8A1SClWrJD7972SrxNHyHonkJ3cNUlFRC1NP4RG
	sb7A==
X-Gm-Message-State: APjAAAWz/nE7e/GCBLfz4ShWzrKwKtk5PbAxZrKS8zEamAs0VMDJ7AGf
	FSxbHw72sMU0iSEPz2cZkCETF13H
X-Google-Smtp-Source: APXvYqwC+cytGnzs+YCNc2gSD5NuWEVKc6D+db/Enf33/20ZEv4m5WCs1t/U2docTVhN2Gw5RfVLNQ==
X-Received: by 2002:a7b:cf37:: with SMTP id m23mr4196080wmg.53.1567363480012; 
	Sun, 01 Sep 2019 11:44:40 -0700 (PDT)
Received: from superandy.speedport.ip
	(p200300F07F0291044A88851516F8950F.dip0.t-ipconnect.de.
	[2003:f0:7f02:9104:4a88:8515:16f8:950f])
	by smtp.gmail.com with ESMTPSA id
	a17sm13594593wmm.47.2019.09.01.11.44.39
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 01 Sep 2019 11:44:39 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  1 Sep 2019 20:44:30 +0200
Message-Id: <20190901184431.9227-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [PATCH] fluidsynth: upgrade 2.0.5 -> 2.0.6
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
X-List-Received-Date: Sun, 01 Sep 2019 18:44:40 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This is a bugfix maintenance release

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth.inc b/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth.inc
index 234be02ca..9e1c323fe 100644
--- a/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth.inc
+++ b/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth.inc
@@ -5,8 +5,8 @@ LICENSE = "LGPL-2.1"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=fc178bcd425090939a8b634d1d6a9594"
 
 SRC_URI = "git://github.com/FluidSynth/fluidsynth.git"
-SRCREV = "7f11a9bf5c7304e04309a6ec9fc515ee815524bf"
+SRCREV = "f78486a50bd785200412ea16434b38edc4a45a6c"
 S = "${WORKDIR}/git"
-PV = "2.0.5"
+PV = "2.0.6"
 
 inherit cmake pkgconfig lib_package
-- 
2.21.0


