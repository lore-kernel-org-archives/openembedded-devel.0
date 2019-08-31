Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com
	[209.85.215.170])
	by mail.openembedded.org (Postfix) with ESMTP id 101D57F4D6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 31 Aug 2019 21:37:43 +0000 (UTC)
Received: by mail-pg1-f170.google.com with SMTP id n9so5307847pgc.1
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 31 Aug 2019 14:37:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=WF0BMM/OQeDkSkYkzIfDGhW7qTcqQVb/eDVxasWFMpU=;
	b=Es16MiHBzb+TYsLKV5DlK7mSuIErq2Qfy1JNgqyYmEtk1MKkLZt8lodVwwEF9Idgxh
	XtwhruiaH0WHJ+dURUw6zt5GdpXPwyXhU8CE8W98RZwRmsMw3SwG2hmy5r3VeEEMtfc9
	5AgLWKPoNe9sPiXwE6sMvgghIzYBUZo5W6qVJfR6yyaGSnDBf5AHnGkUinjTw2CG3QUF
	KexU5oiDsi/GjBzMv1d3t7xat7YforzzCRhAbjxyG+zRJGQIQ7V0jfNPlM/4xHcuAeGv
	cm+qLPmNMiTIOW0VgCDo6y0jheTNI6uk1RMoceOAwkcXJe82gOBxRc+5Q4myPfZDuLKL
	Dzzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=WF0BMM/OQeDkSkYkzIfDGhW7qTcqQVb/eDVxasWFMpU=;
	b=L9irofW4wK518OOLo90/Y2u7BZgzkZrcQkmGK/nSb7BpjJhvoJv+QzRWTjQ1hw/qHf
	AanLFBGAvR4dzNvP6INFDAeBZ9IwUoHHomIbkWoGA/TF9IKZg1jnUprvB7JBobkueDpc
	MEINRs/yhR7Dakc6/xXLroY1AeMSQlcFm6tR0xcKmEU79e6jN8U3l2TkiUIM//NLeo5c
	iR2XSvjnu1WL/B5j2sLHBQe9eh6dh6cIHNSiyX/IU5+8mz2T5gTsq1LGDMbriNtqIWmZ
	GADThbwtCTkhHuShGC6x5P6ecVq8ueT7tucSVu+VViiFHhrg7/UN2quKmRNW6crg0e2g
	cR/Q==
X-Gm-Message-State: APjAAAUQ4wW3PJpUhSXkTTaxV0dCefXubze5jOryGNGS0HlCHepCJYVB
	IdoH5fQ3dzCgXPps7EGpIw+zAa5+
X-Google-Smtp-Source: APXvYqy6troc1rou1e27NtxQ86w7QGxeSufTzGvMKMz7DWvtMF5jzNQDkZ19F1lCO7fs4rGTVWWiFA==
X-Received: by 2002:a17:90a:cf8d:: with SMTP id
	i13mr5596612pju.63.1567287464920; 
	Sat, 31 Aug 2019 14:37:44 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:c33:8107:6109:754a:f033])
	by smtp.gmail.com with ESMTPSA id d6sm9443836pgf.55.2019.08.31.14.37.44
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 31 Aug 2019 14:37:44 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 31 Aug 2019 14:37:38 -0700
Message-Id: <c97ed3bee0229dcae5cbf34d287c85009aa6e655.1567287402.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1567287402.git.akuster808@gmail.com>
References: <cover.1567287402.git.akuster808@gmail.com>
Subject: [thud 4/4] apache2: upgrade 2.4.39 -> 2.4.41
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
X-List-Received-Date: Sat, 31 Aug 2019 21:37:44 -0000

From: Yi Zhao <yi.zhao@windriver.com>

Security fixes:
  CVE-2019-10081
  CVE-2019-9517
  CVE-2019-10098
  CVE-2019-10092
  CVE-2019-10097
  CVE-2019-10082

See: http://www.apache.org/dist/httpd/CHANGES_2.4.41

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Armin Kuster <akuster@mvista.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../recipes-httpd/apache2/{apache2_2.4.39.bb => apache2_2.4.41.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-webserver/recipes-httpd/apache2/{apache2_2.4.39.bb => apache2_2.4.41.bb} (98%)

diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.39.bb b/meta-webserver/recipes-httpd/apache2/apache2_2.4.41.bb
similarity index 98%
rename from meta-webserver/recipes-httpd/apache2/apache2_2.4.39.bb
rename to meta-webserver/recipes-httpd/apache2/apache2_2.4.41.bb
index c6961ef..543d124 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2_2.4.39.bb
+++ b/meta-webserver/recipes-httpd/apache2/apache2_2.4.41.bb
@@ -24,8 +24,8 @@ SRC_URI_append_class-target = " \
            "
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d52d0fd0bc788f068e647116c01ddfcd"
-SRC_URI[md5sum] = "930e217ba2d71e708a3f1521ecae7ec0"
-SRC_URI[sha256sum] = "b4ca9d05773aa59b54d66cd8f4744b945289f084d3be17d7981d1783a5decfa2"
+SRC_URI[md5sum] = "dfc674f8f454e3bc2d4ccd73ad3b5f1e"
+SRC_URI[sha256sum] = "133d48298fe5315ae9366a0ec66282fa4040efa5d566174481077ade7d18ea40"
 
 S = "${WORKDIR}/httpd-${PV}"
 
-- 
2.7.4


