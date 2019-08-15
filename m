Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
	[209.85.221.53])
	by mail.openembedded.org (Postfix) with ESMTP id DC7C97F2F6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Aug 2019 21:56:22 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id c3so3513101wrd.7
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Aug 2019 14:56:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=55ver2gZe+bzWy3/083kJ+wPhSrmylKeg0QZ3trDSvo=;
	b=ibLYjesInaEkNDjsi08e9jkS8k3yNFxUFraUY5ewV/mpzxpQ+J5nMGbTao2ayAbSbt
	zi2GoWeAaAwcZ79OK9tV/XmDOhQCULCyyALVtZiIKPVDArQjty5ZI3DMgZlWriUwWuTo
	iYuJWHpubTfUe430R99I9l1TBGfLojf/H5xvhVeOjxNBtAk7YH7WoTSzhlG/s6XbfujY
	aREmBBn42/g7LDwFZvjrkpRVy1Wj6757VhLznurFJx13/0F/F7qg3B1L+hynUV5dMzau
	c6YvMlYO/4RcUnYsH59OzN1dWsgi+QxL287HO1m6dK9vgPH2HhYjgdzI+XAuyGf2QJsr
	DHKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=55ver2gZe+bzWy3/083kJ+wPhSrmylKeg0QZ3trDSvo=;
	b=kKWOYIZgsw3FIeVid43d6cmBT7Q5cHYvof4w2m+SekHLiQCA3/tGKSbe3TGd/gBnTE
	1pjZuPouxKXOTi4Gb+fzxe/AzJaMKpJXgi6coUGSFB6m4AHBlsuKYUU7++WuVEMWeish
	cT6MZHdCbem5v3bCPemFWwwFw1PP2R7FRzJPB2HOWQct87hJSzfuD9HIFxLTN8br9XyS
	O/snCLP0CY3c4e1TSwgM5mKx88s+E/8JDozmHDkGouBfgUJwEGehlMBoTgDfvVSnEP2C
	9AGMbc0Bn8QHrjXuJx4ze9wCjy+5HoYQ6dInF219y4djGA41349c+MrljMPEVN2eVoqI
	c6uQ==
X-Gm-Message-State: APjAAAVabviU+J+qZx4pfD5CqLQBbunOVq6K09tjvmf8QiSmPz47o7YX
	ZbR7N6WMS3K5HxEtG6SfTzcBiiD5
X-Google-Smtp-Source: APXvYqzVav66UU6HaFHCi/zbSXI4e1ji8zEflY5SqCUh+tQks3Z2rnAeckwkWN4NU1vmC8vNBUzVzA==
X-Received: by 2002:adf:ef07:: with SMTP id e7mr7629184wro.242.1565906183393; 
	Thu, 15 Aug 2019 14:56:23 -0700 (PDT)
Received: from superandy.speedport.ip
	(p200300F07F042332D9169E9166842542.dip0.t-ipconnect.de.
	[2003:f0:7f04:2332:d916:9e91:6684:2542])
	by smtp.gmail.com with ESMTPSA id
	h97sm10555192wrh.74.2019.08.15.14.56.22
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 15 Aug 2019 14:56:22 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	kai.kang@windriver.com
Date: Thu, 15 Aug 2019 23:56:01 +0200
Message-Id: <20190815215605.19600-10-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190815215605.19600-1-schnitzeltony@gmail.com>
References: <20190815215605.19600-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 09/13] catfish: upgrade 1.4.7 -> 1.4.8
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
X-List-Received-Date: Thu, 15 Aug 2019 21:56:23 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This is a minor bugfix release

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../catfish/{catfish_1.4.7.bb => catfish_1.4.9.bb}            | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-apps/catfish/{catfish_1.4.7.bb => catfish_1.4.9.bb} (72%)

diff --git a/meta-xfce/recipes-apps/catfish/catfish_1.4.7.bb b/meta-xfce/recipes-apps/catfish/catfish_1.4.9.bb
similarity index 72%
rename from meta-xfce/recipes-apps/catfish/catfish_1.4.7.bb
rename to meta-xfce/recipes-apps/catfish/catfish_1.4.9.bb
index 84d5692ef..eec525b88 100644
--- a/meta-xfce/recipes-apps/catfish/catfish_1.4.7.bb
+++ b/meta-xfce/recipes-apps/catfish/catfish_1.4.9.bb
@@ -9,8 +9,8 @@ DEPENDS += "python3-distutils-extra-native"
 
 B = "${S}"
 
-SRC_URI[md5sum] = "f4c1c2b2c560824cab8d7f6c7bd624ca"
-SRC_URI[sha256sum] = "48caaac872d29e2762e31e59ade1310cb860af55f1a36f2520ce1d90c39227e9"
+SRC_URI[md5sum] = "829824fba33e86d03345bbc718e7b2d9"
+SRC_URI[sha256sum] = "29a39b85804336e4819dceff203693a5904b7e11d7e024b49b5aab2649ed944e"
 
 FILES_${PN} += "${datadir}/metainfo"
 
-- 
2.21.0


