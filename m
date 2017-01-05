Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 2D90B71A92
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Jan 2017 17:11:47 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id c85so59404050wmi.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Jan 2017 09:11:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=Vl5DU7enEIVyltSMdP4ovKd/O2EtOvfnAfYD5+++r2U=;
	b=KSsst3mEmmD/0C6dWmHx4IWITtX0dEPFYL+gfgMWVUg1xdohyQIIYzSaPRotjw0tbM
	+wAq4aLWNEAr9pHv/GJBLwfilovpKI1hvk5WsxoCSRV7I49P4RIphEEjWuK91t51q8dt
	iZ1/gpGfg3UUPZoEQbePjU7pnAqEPsvg4FMFsQ99PjhsbENEpt9CoyPeE5xeCMss9b2a
	JdVcYeKIa4FpoU8f9zzy5l/KefA8Cxpz0mqQq3r4CiI8qZHRy53WqfqFdTJmBdVKONWb
	T5OVox9taVl9kV/KgIuKidOZqk3iXY2itweQOrYIiU4m6atnIn0vafOsPCfoMKvcdeqy
	x8+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=Vl5DU7enEIVyltSMdP4ovKd/O2EtOvfnAfYD5+++r2U=;
	b=WqvbVb5mF8bN3dCzI27NG9Q6DA3Vd9lD38U5ssJ3XFPuVpBPZVw2KfVaEB+mGfPTvk
	40M/aoSMrUBQVt/Oy3bFM1fOAbEwReBNXRcXBJIvxeCa5HfC8INYar5WAw29NlMATjvd
	mhUTq3s8wgK6WZuhkVXwbA/phOOfKk6o4AjfFLj3+Uune8B8X/sS+xodUN4MCrs72G38
	JypIsjGL6bUn/JZ++YK7MawGh0jJE+j3ugLWCQr4fe3ErctXNFgPr/JwZm0dNSbhos4O
	fVjshglQtK0kH6XpY6iphWJSQWq/udGgrREMEB7zhNP7TawdNsPwbqcQdQGJlC/MiXM1
	ko+Q==
X-Gm-Message-State: AIkVDXLFGPmT82D4lT98RoyZvt5TIak/y5m28KjDXFlI6vTP35t8KQXPwKXvoTpl9fyT1w==
X-Received: by 10.223.176.93 with SMTP id g29mr119444wra.12.1483636307210;
	Thu, 05 Jan 2017 09:11:47 -0800 (PST)
Received: from localhost.localdomain (p579F79CC.dip0.t-ipconnect.de.
	[87.159.121.204]) by smtp.googlemail.com with ESMTPSA id
	81sm101153107wmw.7.2017.01.05.09.11.45
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 05 Jan 2017 09:11:45 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  5 Jan 2017 18:11:23 +0100
Message-Id: <1483636284-6351-7-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <1483636284-6351-1-git-send-email-schnitzeltony@googlemail.com>
References: <1483636284-6351-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 7/8] gtkmm: update 2.24.3 -> 2.24.5
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
X-List-Received-Date: Thu, 05 Jan 2017 17:11:47 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-oe/recipes-gnome/gtk+/{gtkmm_2.24.3.bb => gtkmm_2.24.5.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-gnome/gtk+/{gtkmm_2.24.3.bb => gtkmm_2.24.5.bb} (77%)

diff --git a/meta-oe/recipes-gnome/gtk+/gtkmm_2.24.3.bb b/meta-oe/recipes-gnome/gtk+/gtkmm_2.24.5.bb
similarity index 77%
rename from meta-oe/recipes-gnome/gtk+/gtkmm_2.24.3.bb
rename to meta-oe/recipes-gnome/gtk+/gtkmm_2.24.5.bb
index f4e0865..195bb21 100644
--- a/meta-oe/recipes-gnome/gtk+/gtkmm_2.24.3.bb
+++ b/meta-oe/recipes-gnome/gtk+/gtkmm_2.24.5.bb
@@ -14,8 +14,8 @@ REQUIRED_DISTRO_FEATURES = "x11"
 
 GNOME_COMPRESS_TYPE = "xz"
 
-SRC_URI[archive.md5sum] = "42fc5a3feeb33ea59b7660200e2a5465"
-SRC_URI[archive.sha256sum] = "c564a438677174b97d69dd70467cb03c933481006398dc9377417aa6abe02a39"
+SRC_URI[archive.md5sum] = "6c59ae8bbff48fad9132f23af347acf1"
+SRC_URI[archive.sha256sum] = "0680a53b7bf90b4e4bf444d1d89e6df41c777e0bacc96e9c09fc4dd2f5fe6b72"
 
 EXTRA_OECONF = " --disable-documentation "
 
-- 
2.5.5


