Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f46.google.com (mail-pl0-f46.google.com
	[209.85.160.46])
	by mail.openembedded.org (Postfix) with ESMTP id 4891C744AE
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 May 2018 23:21:11 +0000 (UTC)
Received: by mail-pl0-f46.google.com with SMTP id v24-v6so3435198plo.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 May 2018 16:21:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=LBkfHXTlOD0XGeTKZ+4IEuiojEa1jnbQWzuDGIiqngg=;
	b=nsWsDjYt1Uj7rWTTljP/auVWt15UDcbx13Kj2YgdUQjjkAGOv+SU5Gs30qRpabju2x
	3pinwxxStTmZ24/SsMyaE9etDLQs0THS0PD5j+J2MXeET7qR1oWBjGbEm3hYXzh7opt4
	X4RvdtP48G4Ydr+ipJ6woTBtYDkl6kTMlHj724MccHFP9R3qDo26oUGnLUzpe/aRoXBu
	vOBdbx4ycxUu5jtU8TY3zsIudiJHuGSEVZBLiJbrkCaEvMR+Ep8//U+hNasL51Kbzyog
	7ahXUKCSUYYiLiDZMJONBDkOpIvrqMdehHpp4Ym8vMJbSZdGAi9cuk3ITQlsf3uHq7kP
	kung==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=LBkfHXTlOD0XGeTKZ+4IEuiojEa1jnbQWzuDGIiqngg=;
	b=tPWMn+qr+9X/Iqifp9utPri6WrYlZckHEadMDorXXsVLzXmzsw2oxyaLSQYduL05L/
	3OokZLAHK8aAM+EfnECJTitT1X8VbC6ZHfVrgSyX0hUX9WZ9qTyo4ryChEEfbrQiyjxC
	1J7F5tRfKFmstg29rC7umJucHMlEhE2c1wxMR/c0WYSk0/HwQsaypr+O7POIyDMvTuRV
	A6jFyj3vbuANuu2pyLosbsc6NACYLOjGahYY7Yzvl8SC5+fHITZ4b7jhlGFZedkz+DfV
	3WqgzLaDh3JSGwOpHBP0mQdqX033LlJA86/6dDn4bOGj3tZnGrbWw7u5SGA6yuZdocid
	I0rw==
X-Gm-Message-State: ALKqPwfW3W6NQKP94Wl3PJq5iD4OEyjfW5bUQZLz9PoeqdvIN1TG23ul
	PFVzkU1auQmtOEM3NHZhvJfdkg==
X-Google-Smtp-Source: AB8JxZq0bgaesIo31g4Z3f5sOxXeM11GzDJwgZdXj00wTUIWGmEzNN3ZbhxHmroHJvZmQQkAPYoJnQ==
X-Received: by 2002:a17:902:8d81:: with SMTP id
	v1-v6mr6748670plo.383.1526599272568; 
	Thu, 17 May 2018 16:21:12 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::c68])
	by smtp.gmail.com with ESMTPSA id
	u70-v6sm13828212pfk.121.2018.05.17.16.21.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 17 May 2018 16:21:11 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 17 May 2018 16:21:06 -0700
Message-Id: <20180517232110.22663-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.17.0
Subject: [meta-gnome][PATCH 1/5] evince: Reset PR to 0
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
X-List-Received-Date: Thu, 17 May 2018 23:21:12 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-gnome/recipes-gnome/evince/evince_3.28.1.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/evince/evince_3.28.1.bb b/meta-gnome/recipes-gnome/evince/evince_3.28.1.bb
index ce73620b09..97fe769c5d 100644
--- a/meta-gnome/recipes-gnome/evince/evince_3.28.1.bb
+++ b/meta-gnome/recipes-gnome/evince/evince_3.28.1.bb
@@ -3,7 +3,6 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=96f2f8d5ee576a2163977938ea36fa7b"
 SECTION = "x11/office"
 DEPENDS = "gtk+3 libsecret ${@bb.utils.contains('DISTRO_FEATURES','x11','gnome-desktop3','',d)} poppler gstreamer1.0-plugins-base orc adwaita-icon-theme intltool-native gnome-common-native"
-PR = "r5"
 
 inherit gnome pkgconfig gtk-icon-cache gsettings gobject-introspection distro_features_check systemd
 
-- 
2.17.0


