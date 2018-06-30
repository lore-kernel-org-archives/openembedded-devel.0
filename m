Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr0-f181.google.com (mail-wr0-f181.google.com
	[209.85.128.181])
	by mail.openembedded.org (Postfix) with ESMTP id 6FA7774EE5
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 30 Jun 2018 12:03:28 +0000 (UTC)
Received: by mail-wr0-f181.google.com with SMTP id a12-v6so11172719wro.1
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 30 Jun 2018 05:03:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=brA6QRtXrdPWegd2XliKHBlcd8bBUyErh29qzaoEoQY=;
	b=O+I9Mv2GNG+c1AE0X0VPhswFauwNcb24JeWZG3MknMlQSyM/dKwHFwr4yP5bCQuNSR
	WWUBKGqAjIz4CO75rEkM/QOpZ9541aRJZkdkGTi7nrAHYOyGLk+IrCvuJ+1FEDJdNC0g
	pn1EIguyoj5qRjrX/lKTJ5h4ClxFlvFvhqzgWnJwz9r28V6rmLH26sIBbDHC9oX2nFit
	y1Pv0tJmGqmKhnZZqlmy41BJWZ27QM1v4tFIvfmMbckRc5nxi5ObXMtrYjwAeRY1t2Wy
	qeiPmEChNZx5VtCAdxI5XXl52/fjhSBFC+m7IReUJ96vmqTYDg/lRZlEj/uq7KPA9nnG
	EuLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=brA6QRtXrdPWegd2XliKHBlcd8bBUyErh29qzaoEoQY=;
	b=anw9r5mC4CMabS9v3oLIxvLFbPITdFsHtx6Q7emPRX800w91B0G579es3wXlpgOT/0
	aK7u6WAzLIecCOBoJCNRYL3RdY0vDsMNlnvfgFWkEJrBFgJ4IT8uLojqENQ3c0Y32tj+
	cZvp7JbD38qIdYeqsZ1R+GX1BWNUmjMAX3mokIADnk4Vmb2GWiCHIFMpgdYlc/vU+NqU
	Yrek5b5+5OneBVEOx5C0TrIZVssda/PRJprG34VRCDmoeZufdgg7L1Iho1+XEoKsoQQe
	BppZWochFTz1EgQu649IO3eVmX9+d0qWRsR1RFkJx8O5VO8xvFS0tXhd4cbBGZiOGCWC
	hfnw==
X-Gm-Message-State: APt69E0+0nr61HVfnEZNUOvQIC/jgxQY+lBODd00rg19tmRWxtnfPUiM
	93TYEcy/Ve0WzJc1z24fL6L2nw==
X-Google-Smtp-Source: AAOMgpfun2RQwWefbzFtNim3Bf/a+RbmKVysBWDG906wDnBXqmuhBckokPCGF69FagX50DcyqjTHQg==
X-Received: by 2002:adf:f210:: with SMTP id
	p16-v6mr2343508wro.184.1530360208779; 
	Sat, 30 Jun 2018 05:03:28 -0700 (PDT)
Received: from mueller-a-nb-linux.speedport.ip
	(p200300F07BD2A250E47512CF7CAE17AC.dip0.t-ipconnect.de.
	[2003:f0:7bd2:a250:e475:12cf:7cae:17ac])
	by smtp.gmail.com with ESMTPSA id
	p12-v6sm2096602wrn.31.2018.06.30.05.03.27
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 30 Jun 2018 05:03:27 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 30 Jun 2018 14:03:06 +0200
Message-Id: <20180630120315.29414-3-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.14.4
In-Reply-To: <20180630120315.29414-1-schnitzeltony@gmail.com>
References: <20180630120315.29414-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 02/11] exo: upgrade 0.12.0 -> 0.12.1
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
X-List-Received-Date: Sat, 30 Jun 2018 12:03:28 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-xfce/recipes-xfce/exo/{exo_0.12.0.bb => exo_0.12.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-xfce/exo/{exo_0.12.0.bb => exo_0.12.1.bb} (87%)

diff --git a/meta-xfce/recipes-xfce/exo/exo_0.12.0.bb b/meta-xfce/recipes-xfce/exo/exo_0.12.1.bb
similarity index 87%
rename from meta-xfce/recipes-xfce/exo/exo_0.12.0.bb
rename to meta-xfce/recipes-xfce/exo/exo_0.12.1.bb
index 85c95faf2..1210e256d 100644
--- a/meta-xfce/recipes-xfce/exo/exo_0.12.0.bb
+++ b/meta-xfce/recipes-xfce/exo/exo_0.12.1.bb
@@ -20,8 +20,8 @@ SRC_URI_append_class-native = " \
     file://reduce-build-to-exo-csource-only.patch \
 "
 
-SRC_URI[md5sum] = "724afcca224f5fb22b510926d2740e52"
-SRC_URI[sha256sum] = "64b88271a37d0ec7dca062c7bc61ca323116f7855092ac39698c421a2f30a18f"
+SRC_URI[md5sum] = "a7bb4e61c54f5168ee21902b0ed70533"
+SRC_URI[sha256sum] = "6b7e00d8cb24e0b3472c2514736d3aaf7c46d2a4eea0e07755d64f20d8666741"
 
 PACKAGES =+ "exo-csource"
 
-- 
2.14.4


