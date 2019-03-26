Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com
	[209.85.210.180])
	by mail.openembedded.org (Postfix) with ESMTP id 1EECB7CFEE
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Mar 2019 02:19:35 +0000 (UTC)
Received: by mail-pf1-f180.google.com with SMTP id y13so1215785pfm.11
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Mar 2019 19:19:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=1tC7VnnrDH5Q3Wgj9zY1Fl9r24KhPQVGLZNEvRl57Rg=;
	b=hgk4lMIAuRm/wU4YJOaa0bMZxRIzaMpqT79n8xgDIWVK4xsK8SR5lyqfIaBkzk2GyY
	i7JOpkXrGXqFaFAVYc7CpZIzX+IH8HsepNMSVaf1ZOnzeC7PVmS3aEcx92KCP1vEwc0+
	L3yexAdEkfNwVwWDRcjzaUFVvItrKyYSEu8nolqP/Yappl7vOuXK8NBsz2SGb0Tj68qY
	VVZ3RSAPHeWXiEU1Ru6L31un0+NbNym/E8NPYHztARJAqwkWN3WA/t0R6phiKqT7Lchb
	yjS7fDGMSbgM2Fl1zpUo1pbjehKmYt6EAX7PdGj0z0iejE/Ho3cYyRizLw8i37Cswx02
	UdoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=1tC7VnnrDH5Q3Wgj9zY1Fl9r24KhPQVGLZNEvRl57Rg=;
	b=gvbaVtlR3FngYVOWxvyWyUQ0W/ie5PwGiMad1Z06Sw2CcigED4JDN59/9BWEz5XD0A
	5scu/kD4diLZKPOB/ljAfgdSCY016R5WSTEkbiK3V1BIN6Exr8mzUbtF9zFPQO4on4qs
	iF25/u/R52Fc/S8KZJ9bHGake9qrVAJoz1AGRwl3v4K2DRUVNiP13EGvNK5PIedROP3f
	sTXd/uaNQ8xN9B1lp5ISPK7UaQHPL2TuQms3XKEVzGvYl7dTzn9Phr6WQ7uGbgAxOE2C
	5rJ+TXG42aJs17jgKAoAK/WjJkP78Hu+lyB3EBDUzQXzpkrwsqfwUzvwPpQ3LNKjuH2E
	TG9g==
X-Gm-Message-State: APjAAAUl+A4C+p0lvmhQNh655CbrnoVI/ZOaE61kobFIJ3maanmZ+tAn
	FAQxofiibA3yeCwrLB/w/xIalvoA
X-Google-Smtp-Source: APXvYqxgZgAM0jGS23CM7hgGpBdbxTqUk+NZzgleKrUtgp7cyCIP41ueOevP+gkDNqnzgSfLSamrCA==
X-Received: by 2002:a65:6203:: with SMTP id d3mr26609510pgv.109.1553566776072; 
	Mon, 25 Mar 2019 19:19:36 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:c33:3dea:ddac:f0ad:db91])
	by smtp.gmail.com with ESMTPSA id
	j4sm25931896pfn.132.2019.03.25.19.19.35
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 25 Mar 2019 19:19:35 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 25 Mar 2019 19:19:33 -0700
Message-Id: <1553566774-8056-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH 1/2] ftgl: package requires openql add DISTRO_CHECK
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
X-List-Received-Date: Tue, 26 Mar 2019 02:19:35 -0000

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-graphics/ftgl/ftgl_2.1.3-rc5.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/ftgl/ftgl_2.1.3-rc5.bb b/meta-oe/recipes-graphics/ftgl/ftgl_2.1.3-rc5.bb
index b291159..c5eaf42 100644
--- a/meta-oe/recipes-graphics/ftgl/ftgl_2.1.3-rc5.bb
+++ b/meta-oe/recipes-graphics/ftgl/ftgl_2.1.3-rc5.bb
@@ -3,7 +3,9 @@ HOMEPAGE = "https://sourceforge.net/projects/ftgl/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=527a83e92c7bf363025380eec05df6e4"
 
-inherit autotools pkgconfig
+inherit autotools pkgconfig distro_features_check
+
+REQUIRED_DISTRO_FEATURES = "opengl"
 
 DEPENDS += " \
     freetype \
-- 
2.7.4


