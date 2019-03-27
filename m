Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
	[209.85.128.52])
	by mail.openembedded.org (Postfix) with ESMTP id 2ED0D7D14C
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Mar 2019 15:35:34 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id 4so488873wmf.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Mar 2019 08:35:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=NjVKhasI2FcWZ2EknmZhytdoBznQjjTtCH0GkQcnLB8=;
	b=CKkEjt54v1/o9vgx4HXddFtf3sz4N8Lki1lHU/IDQdbutDHPz4b3/rRSKSB18d4Jy8
	iELxLJ3OjzSqeFOweIS+6lKP5XH4aPUT60WdIpEn71ZUmO2npEdhAQdFNcqeLWAolHwI
	v11+1p/AjEcqXe9BACl7XN1fd98KnP5M9jIv+sCZy1+5yujDZvcaPXA9Fzow0TT09Ywe
	DN1DNwv4180LS5WMC0gXKwz+BrO/lxC257fvvjT6YsrVdAH1QXDqQAZiX+BH5wCfoxfZ
	6yan0Kmm5KKizs2plchpyud5gFh9UoFLf5CCB9TEt+VFZfDPF026YRm1SC2+0snGp39N
	DkJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=NjVKhasI2FcWZ2EknmZhytdoBznQjjTtCH0GkQcnLB8=;
	b=MCfluHaTOjqZvnZmRTckkFFaqYACztxipPXGbEULPRYqF6yIble1AhaTL8LBxha5Rg
	jRfEBpp+olxbCwv3VHPm41Nr+7kH0ihWuf/kCskcDSS7XqOKuOzv1mxlGoCQlU3Dfddc
	tfckbdQnAdCd0zHsy23MPZcgrSjq//9QEDYmraepCaw4qLkTQdaKuXnixS3BsE3YBylY
	boJ4Y32fozE5zHJQIIZFZ8OqUENllvnv+TACfsaFiVtQZkfVz+8JKq2bm+l5nKRT7RRh
	h93ZcJsMEzeoxcGQRBmLxtVV/b4ggex8DHLCU8hMApV19f14728VFv5XA47f+LqF2xFo
	IGzQ==
X-Gm-Message-State: APjAAAWqM2cS6xN/WnocRhgNV+/zpDKtivrbs1TlrWTvOOSx0rzuurg1
	Tm0SglqY0gM9y+djizecMcj90O7U
X-Google-Smtp-Source: APXvYqwQhGv+hB70kJ0MuT+Yd4C7flLgvnSqVSCC+EyEAsyCGmJbPfgNYHtOaXXBJWEQhZHn6Lpf6w==
X-Received: by 2002:a1c:e70b:: with SMTP id e11mr13943261wmh.17.1553700934737; 
	Wed, 27 Mar 2019 08:35:34 -0700 (PDT)
Received: from localhost.localdomain (p509737a3.dip0.t-ipconnect.de.
	[80.151.55.163])
	by smtp.gmail.com with ESMTPSA id q4sm7517518wrx.25.2019.03.27.08.35.33
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 27 Mar 2019 08:35:33 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 27 Mar 2019 16:35:00 +0100
Message-Id: <20190327153509.23928-6-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190327153509.23928-1-schnitzeltony@gmail.com>
References: <20190327153509.23928-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 06/15] enchant2: initial add 2.2.3
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
X-List-Received-Date: Wed, 27 Mar 2019 15:35:34 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

It can live in same image with enchant without causing conflicts.

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../recipes-support/enchant/enchant2_2.2.3.bb | 26 +++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100644 meta-oe/recipes-support/enchant/enchant2_2.2.3.bb

diff --git a/meta-oe/recipes-support/enchant/enchant2_2.2.3.bb b/meta-oe/recipes-support/enchant/enchant2_2.2.3.bb
new file mode 100644
index 000000000..42150c88f
--- /dev/null
+++ b/meta-oe/recipes-support/enchant/enchant2_2.2.3.bb
@@ -0,0 +1,26 @@
+SUMMARY = "Enchant Spell checker API Library v2"
+SECTION = "libs"
+HOMEPAGE = "https://abiword.github.io/enchant/"
+LICENSE = "LGPLv2.1+"
+LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=a916467b91076e631dd8edb7424769c7"
+
+DEPENDS = "glib-2.0"
+
+inherit autotools pkgconfig
+
+SRC_URI = "https://github.com/AbiWord/enchant/releases/download/v${PV}/enchant-${PV}.tar.gz"
+SRC_URI[md5sum] = "4b8abb58e00e93363591b3f5ea4f52d5"
+SRC_URI[sha256sum] = "abd8e915675cff54c0d4da5029d95c528362266557c61c7149d53fa069b8076d"
+
+S = "${WORKDIR}/enchant-${PV}"
+
+EXTRA_OEMAKE = "pkgdatadir=${datadir}/enchant-2"
+
+PACKAGECONFIG ??= "hunspell"
+PACKAGECONFIG[aspell]  = "--with-aspell,--without-aspell,aspell,aspell"
+PACKAGECONFIG[hunspell]  = "--with-hunspell,--without-hunspell,hunspell,hunspell"
+
+FILES_${PN} += " \
+    ${datadir}/enchant-2 \
+    ${libdir}/enchant-2 \
+"
-- 
2.20.1


