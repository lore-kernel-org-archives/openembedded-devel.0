Return-Path: <brendank310@gmail.com>
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com
	[209.85.222.194])
	by mail.openembedded.org (Postfix) with ESMTP id 6941C7990B
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Oct 2018 16:41:46 +0000 (UTC)
Received: by mail-qk1-f194.google.com with SMTP id u68so1374346qkg.9
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Oct 2018 09:41:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=j6vgzsFms7ZExBjrHCAWNktvLpaxddGM+SI7tiYN+yw=;
	b=aD1zv2IXtiBdUYZEAEXGHgGwyoPZLMD0eIJg8GDMEJu5wGQBbSnBcY3Act7eFQZdvE
	auTCcm+53VoMo1D/KYXCuHvHL8gSPXRnZGEmqBKG1K4T2gWqe2mJq0X7x3AWEmlEj5Wg
	85INk/ViXJ3EkR+0WG/ghs9DSAfst9MUUylfNINi/Xg/iEcihMW9PfUS8bVR9TYF3YkK
	ylzCeO5YP9ZZsQBYn7wPt4MN6AJSQNixZiD6I4gAbiDaQid12qJunl1hElAc/G3hb2F0
	A4jka0Z5aUvEdC9/ZMKAr6utCCyJJQK/iXuC4VFeuxuaqc1ThESJfphHkCXNG8LvLMFV
	TxLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=j6vgzsFms7ZExBjrHCAWNktvLpaxddGM+SI7tiYN+yw=;
	b=fALm6FvaxZ6MdmwjHb2Isuu5pm19Kxtrvj4KTJ34JUVvYODdpQ6Ra1d0He5YChFVyD
	eVfRWeXogAzwQPgV3X9ThxsFqqEp55l6TyRN4BAcYkMGl4+CWlibg6xcb1MQJ6s0sZ8K
	uJGygCBUiHI/CConnE8vreFt7mv0V/lVltv+MnHPUZpo/ae5CDx6Q04Q0jdV7oEPMa3j
	0GTvHnObLx8gRATSQ3H52LHbR0xA//sl7gUbO/NBOlDRQ6fW+bvy9qchiGuFFkOvYUpG
	LpuxVp/pzPnbEswJXmwBCzlUVT3YtnkP2jOgbexrEoCfFBfrBkL6wqe4vi9jT6cR29jB
	lu0g==
X-Gm-Message-State: AGRZ1gI7NExPTO8GR/M9E+3MpUye58mywhufhL626Y+xsS3rWfLw71Is
	0zuVTWmIbog9DANWfl160gHjYk1Y
X-Google-Smtp-Source: AJdET5fzvXJ7r8I+nBFbW6mr+ociGTybZOVbxSvTfpwkCXzG+o18XtUCr4kFOcgutV4Ax7EYg6ryoA==
X-Received: by 2002:a37:86c1:: with SMTP id
	i184-v6mr12842649qkd.209.1540831307154; 
	Mon, 29 Oct 2018 09:41:47 -0700 (PDT)
Received: from localhost.localdomain (209-217-208-226.northland.net.
	[209.217.208.226]) by smtp.gmail.com with ESMTPSA id
	i2-v6sm13471476qkf.42.2018.10.29.09.41.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 29 Oct 2018 09:41:45 -0700 (PDT)
From: brendank310 <brendank310@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 29 Oct 2018 12:41:02 -0400
Message-Id: <068fb23bf91af2a10eacc81156dc72dfb5d8ee79.1540830650.git.brendank310@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1540830650.git.brendank310@gmail.com>
References: <cover.1540830650.git.brendank310@gmail.com>
Cc: schnitzeltony@googlemail.com
Subject: [RFC meta-gnome][PATCH 05/16] lcms2: add recipe for Little Color Management System
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
X-List-Received-Date: Mon, 29 Oct 2018 16:41:46 -0000

From: Brendan Kerrigan <kerriganb@ainfosec.com>

Signed-off-by: Brendan Kerrigan <kerriganb@ainfosec.com>
---
 meta-gnome/recipes-gnome/gnome3/lcms2_2.9.bb | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 meta-gnome/recipes-gnome/gnome3/lcms2_2.9.bb

diff --git a/meta-gnome/recipes-gnome/gnome3/lcms2_2.9.bb b/meta-gnome/recipes-gnome/gnome3/lcms2_2.9.bb
new file mode 100644
index 000000000..29947ae76
--- /dev/null
+++ b/meta-gnome/recipes-gnome/gnome3/lcms2_2.9.bb
@@ -0,0 +1,14 @@
+DESCRIPTION = "Little Color Management System"
+LICENSE = "MIT"
+#DEPENDS = " glib-2.0 gettext-native "
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=6c786c3b7a4afbd3c990f1b81261d516"
+
+SRC_URI = "https://sourceforge.net/projects/lcms/files/lcms/${PV}/${PN}-${PV}.tar.gz \
+           "
+
+SRC_URI[md5sum] = "8de1b7724f578d2995c8fdfa35c3ad0e"
+SRC_URI[sha256sum] = "48c6fdf98396fa245ed86e622028caf49b96fa22f3e5734f853f806fbc8e7d20"
+
+inherit autotools pkgconfig distro_features_check 
+
-- 
2.17.1


