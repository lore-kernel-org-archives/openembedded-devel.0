Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id 5C78C7D485
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  6 May 2019 08:30:03 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id y5so14101472wma.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 06 May 2019 01:30:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=D+lz7P5lSdLbtSvOCbOtV/36eudbDczS/XPBCQxHw9w=;
	b=J8FwcE0CbRoJPaowLYfSsEMEpHu6BnXBQ+JwHhwlsU05fbeAYIAZgapgW+dzJ9JWcV
	+ToGEW9x+ghvc3a5vufpdQ5IMxH/N3k4wZ4YHbS83krOA+VExcxE1n5RhReM0NeYO/Te
	fS+upYMnt3wTPwqDc8eUWpOCC+zfzBIJIHypWAdXBoykkuTO+omef/YnzfZ6SfYkS4su
	6M7moii1AuWsED19QHNEZYZ52VtJaTrd/gCN2QEuhtegCd3LWjSH4l+HmpWMmaojNYNS
	GhWOublnmHygynXCUUid/gMuZA+ul37ZT3AMQb6p6BtLW+cp/Y3ShDBmpgPc9NSFsIVf
	H5UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=D+lz7P5lSdLbtSvOCbOtV/36eudbDczS/XPBCQxHw9w=;
	b=Et6Zb5XcNsRuRpGBVwi//OJt1j37bKrfJVqqmNwkPnCRaiyKnGtPxGjFc5Zn+GEjTU
	JB2CBcyk4IRkBPdDYEXHU56C1mpmG0jK/RikQxnn/UEebDI1Znbokeg5zMuSCAw3HQkj
	K1Iq5/vWfEzgaug/G5QMtjW99uiFsG4PNg1OocoTSxLwglKOijlZfYY+iIOaU+NQPJIE
	6/4JStNjYhD0ye362is79LdN/JnQta5TO4Z6LW3uvZILhH4Nfj2anacv0M5/AXFdfknZ
	glSS6GPakk+ZQuyc5xktrByMW1n5k4/N8wY36/VKduTMck6mF/sXdeCmHenrf2UVIZRj
	UmEg==
X-Gm-Message-State: APjAAAUi7NGEUWjm9LRfgSTS9hK2bPfGV+F+Ilzn+CrqjY+gZ0S0/Qgx
	laUWlCDk+JPoqxWBThC+nxu1uTsY
X-Google-Smtp-Source: APXvYqybruZOhlkb+PKWExy9+2lT9NOtL4DC4Attbs431eiKV3GkbZdq4xGB9/RNED9DK5j7a6vNQA==
X-Received: by 2002:a1c:9942:: with SMTP id b63mr16242676wme.116.1557131403943;
	Mon, 06 May 2019 01:30:03 -0700 (PDT)
Received: from localhost.localdomain (p509737a3.dip0.t-ipconnect.de.
	[80.151.55.163]) by smtp.gmail.com with ESMTPSA id
	a22sm7526235wmb.47.2019.05.06.01.30.02
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 06 May 2019 01:30:03 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  6 May 2019 10:29:42 +0200
Message-Id: <20190506082948.22276-2-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190506082948.22276-1-schnitzeltony@gmail.com>
References: <20190506082948.22276-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 2/8] gtksourceview-classic-light: extend to gtksourceview4
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
X-List-Received-Date: Mon, 06 May 2019 08:30:03 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Adds classic-light to gtksourceview4. Classic-light enables dark text on white
background when using dark themes.
Tested with gedit V3.

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../gtksourceview/gtksourceview-classic-light_1.0.bb           | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-gnome/recipes-gnome/gtksourceview/gtksourceview-classic-light_1.0.bb b/meta-gnome/recipes-gnome/gtksourceview/gtksourceview-classic-light_1.0.bb
index e7dc0f865..7dabd1e39 100644
--- a/meta-gnome/recipes-gnome/gtksourceview/gtksourceview-classic-light_1.0.bb
+++ b/meta-gnome/recipes-gnome/gtksourceview/gtksourceview-classic-light_1.0.bb
@@ -13,9 +13,12 @@ do_install() {
     install -m 0644 ${WORKDIR}/classic-light.xml ${D}${datadir}/gtksourceview-2.0/styles/
     install -d ${D}${datadir}/gtksourceview-3.0/styles
     install -m 0644 ${WORKDIR}/classic-light.xml ${D}${datadir}/gtksourceview-3.0/styles/
+    install -d ${D}${datadir}/gtksourceview-4/styles
+    install -m 0644 ${WORKDIR}/classic-light.xml ${D}${datadir}/gtksourceview-4/styles/
 }
 
 FILES_${PN} = " \
     ${datadir}/gtksourceview-2.0/styles \
     ${datadir}/gtksourceview-3.0/styles \
+    ${datadir}/gtksourceview-4/styles \
 "
-- 
2.20.1


