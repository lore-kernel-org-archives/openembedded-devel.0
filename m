Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
	[209.85.221.42])
	by mail.openembedded.org (Postfix) with ESMTP id 98EC37E40D
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 May 2019 06:49:11 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id l2so4870626wrb.9
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 May 2019 23:49:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=Wo4xjvuZy6Umg6cVIxS2qBm/ZX1SKviUVH/NhlKcHX4=;
	b=pezSZvnEsCEbCTc/ykqzKg7xaQP9YWaoD/WGMUutckW/UIMj5nwUD6/Mt8N5YnBMS4
	iC6PlTFfp3I24ovsbvYO50KkZiEuS6+CoOjbp13Rf6kdhRJsBVrgxv/8+KKMvZJZzkpt
	jjKSBT6skWl6RwjfIUMYP605mC4zt86K4botCmgJ4p7CTUOuALndxlvL/LMkXFGikmB0
	jBXtI1Izv6seT086F+NVF+1Kqhxvk9uPKfjqQbbccet70yY2KGajtK0/Ce4jzH12F0rq
	IW9Rl7YMKUbgixMHn6No8AwMjw7adP2OBHUNszbwcZNsXFAg88RXt1g38BbwKfqNHg9Q
	UhpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=Wo4xjvuZy6Umg6cVIxS2qBm/ZX1SKviUVH/NhlKcHX4=;
	b=rLbjH3v/+JTNUWeAKZy17+lUy+Wmqs7LZy+bVC/TcTY3ZNdeCr55quHMtDm5i8j6Eb
	yVLceA3PHypPwOxhnzgbvkIHdfRrQKpMa3VCykGMJ3zHhAy79PAFyq49CfHU+ds4Oi86
	IilKc4DK1BxxXYQVUpTgy4SjIgmy0oFu8dr+BJFMHZqwU3lsYmVTj79CeqImsSMcqwgr
	9WQKjz7QjuBGI2vrpP6/OCjfTyv3Fa2MqZ1qYOCuvjrwaYh7eII/dz1418sk4BEWa3cL
	8cLYjWg0YnvB07ytIvY2gV70VNntGxx9B6VEz5xQxCzV3UCaFqCc0jM/DT20MyPERNWn
	5i7Q==
X-Gm-Message-State: APjAAAWoqj+qon9kM3o5T9NuCPMRjBBhzZaUSGWniJMQEhAm5t7bjYgW
	SZHxSuSkW0ujqcIhAgVTefs8WrXKPBI=
X-Google-Smtp-Source: APXvYqyVUwPN91rAFQgu1AmwkYpbvcJB/cBIJQP+ogxSU/HF2P78d72YEO0AURWxADtGRtT0BJNagQ==
X-Received: by 2002:adf:ef83:: with SMTP id d3mr47135626wro.253.1558594152107; 
	Wed, 22 May 2019 23:49:12 -0700 (PDT)
Received: from mueller-a-nb-linux.speedport.ip
	(p200300F07F04E634002574DE25662558.dip0.t-ipconnect.de.
	[2003:f0:7f04:e634:25:74de:2566:2558])
	by smtp.gmail.com with ESMTPSA id
	d9sm33827524wro.26.2019.05.22.23.49.11
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 22 May 2019 23:49:11 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 23 May 2019 08:48:23 +0200
Message-Id: <20190523064859.24336-6-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190523064859.24336-1-schnitzeltony@gmail.com>
References: <20190523064859.24336-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 05/41] yelp-tools: initial add 3.32.0
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
X-List-Received-Date: Thu, 23 May 2019 06:49:12 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

It is not yet used by any recipe but will be used for help file generation
on recipes for actual gnome.

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../recipes-gnome/yelp/yelp-tools_3.32.0.bb   | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)
 create mode 100644 meta-gnome/recipes-gnome/yelp/yelp-tools_3.32.0.bb

diff --git a/meta-gnome/recipes-gnome/yelp/yelp-tools_3.32.0.bb b/meta-gnome/recipes-gnome/yelp/yelp-tools_3.32.0.bb
new file mode 100644
index 000000000..8ddc00393
--- /dev/null
+++ b/meta-gnome/recipes-gnome/yelp/yelp-tools_3.32.0.bb
@@ -0,0 +1,21 @@
+SUMMARY = "Collection of scripts and build utilities for documentation"
+LICENSE = "GPLv2+"
+LIC_FILES_CHKSUM = " \
+    file://COPYING;md5=d67c6f9f1515506abfea4f0d920c0774 \
+    file://COPYING.GPL;md5=eb723b61539feef013de476e68b5c50a \
+"
+
+inherit gnomebase
+
+DEPENDS += " \
+    libxml2-native \
+    itstool-native \
+    yelp-xsl \
+"
+
+SRC_URI[archive.md5sum] = "f65cb652553600faa8d8bddf1b0221da"
+SRC_URI[archive.sha256sum] = "bfdd40d10d837d1a170c7fe70b3436d30e6698db809d5be459ea0f7fbb69ee0c"
+
+RDEPENDS_${PN} += "yelp-xsl"
+
+BBCLASSEXTEND = "native"
-- 
2.20.1


