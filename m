Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr0-f193.google.com (mail-wr0-f193.google.com
	[209.85.128.193])
	by mail.openembedded.org (Postfix) with ESMTP id 82E4974732
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Mar 2018 13:32:34 +0000 (UTC)
Received: by mail-wr0-f193.google.com with SMTP id c24so8069454wrc.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Mar 2018 06:32:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=d48NNfJ6UiIatOA7gVPwL3N8BCYIX7JV5LzhYRNkCiA=;
	b=HJwYK/PZfJgZKtmDlWzlPcrwlZAhgGQb+ZW+1tEhKnVoeaQ1A0GUVyM1NPTrgNTNM+
	HRAszh9NglU5llql7heL5U/s8Q+0iYt7gO5Aoz4RxfK+yXTzRHOZOh9zHRUtIMhmSuiT
	J6XnX+40lbbui6oaP7zo6kA/xRLo/xIrz0DcERGrVeuBm4q/oxcNxlFx0RHyumzQngXJ
	Rd2s07VB4Z/1ii7D2N0ofjc49j8oFQWb7fcd7XoZCmJ/PhgwoGUDVn0vCpdk8F2DHC69
	J4fQxuOUM/K0YA8KURSFM5BLQF7VZhn8p9bBPhAIcjy7AUUGtvwqbjTn+uPuEThZNilL
	Ryig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=d48NNfJ6UiIatOA7gVPwL3N8BCYIX7JV5LzhYRNkCiA=;
	b=WVRRy7ZWhGrNer3dxvLZcSD0fTm2VPwF2SvwpHg2F2sSUbf305ZVzvrwN/KccTgkxq
	WZghPB1/O8aALf5NOvmDYZfzdEGHwwcpXwYnijyk/jU+wfs9sMSjUGPBhBuY5+Mphfde
	oGbKK91uCdo0uaHtzhtaiRr3yy7r8c7QWoaf0ViW1Spu/b7yzfV0PgBvYmhxIhjuLnWe
	qR+yyeR1evy0F+EBMzDd2v/dAGwbs8zYYumquUrBiD5Gm09xYFuHxNZeuPaZZqw8uNqG
	X2lHxWq5nQKFdmjHSvx2BdIi+2YOz/uLj5xqW8sZri+ZQLy+fQCtwPkHoqkZK9XeGd1t
	PpmQ==
X-Gm-Message-State: AElRT7Fh9ZScAmJg1zSI8gmWRVRcGBp8FD4KLh9DHFEYHoU+LT3GWFwU
	y+wEL5UcvU3XLxNF8ide6TpQ+Q==
X-Google-Smtp-Source: AIpwx4/IjDqapLoYFHixKgr8c8IwuKFWrxL0oDAyBX3yU8jmr61NJ/gwWHA3G9lMKOdInnQ7UOAg1w==
X-Received: by 10.223.150.56 with SMTP id b53mr10248003wra.79.1522416755161;
	Fri, 30 Mar 2018 06:32:35 -0700 (PDT)
Received: from PC192-168-2-116.speedport.ip
	(p200300F07BC180221E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:f0:7bc1:8022:1e6f:65ff:fe3e:7f61])
	by smtp.gmail.com with ESMTPSA id
	93sm10468396wrh.46.2018.03.30.06.32.34
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 30 Mar 2018 06:32:34 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 30 Mar 2018 15:31:43 +0200
Message-Id: <20180330133151.25882-32-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180330133151.25882-1-schnitzeltony@gmail.com>
References: <20180330133151.25882-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 31/39] libgphoto2: 2.5.14 -> 2.5.16
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
 .../gphoto2/{libgphoto2_2.5.14.bb => libgphoto2_2.5.16.bb}            | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-graphics/gphoto2/{libgphoto2_2.5.14.bb => libgphoto2_2.5.16.bb} (92%)

diff --git a/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.14.bb b/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.16.bb
similarity index 92%
rename from meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.14.bb
rename to meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.16.bb
index d7290fa6f..7a691c611 100644
--- a/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.14.bb
+++ b/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.16.bb
@@ -16,8 +16,8 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/gphoto/libgphoto2-${PV}.tar.bz2;name=libgphoto2
            file://0001-configure.ac-remove-AM_PO_SUBDIRS.patch \
 "
 
-SRC_URI[libgphoto2.md5sum] = "65acb6cbd2b4f3f46829599f5dabd89c"
-SRC_URI[libgphoto2.sha256sum] = "d3ce70686fb87d6791b9adcbb6e5693bfbe1cfef9661c23c75eb8a699ec4e274"
+SRC_URI[libgphoto2.md5sum] = "084d220d078d28c0c7a3ba13f4476128"
+SRC_URI[libgphoto2.sha256sum] = "e757416d1623e01a9d0d294b2e790162e434c0964f50d3b7ff1a3424b62a2906"
 
 inherit autotools pkgconfig gettext lib_package
 
-- 
2.14.3


