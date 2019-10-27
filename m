Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
	[209.85.128.46])
	by mail.openembedded.org (Postfix) with ESMTP id 90D3C7FA9D
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 27 Oct 2019 23:36:07 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id v3so8320467wmh.1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 27 Oct 2019 16:36:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=zoJxJ9/GqSo35iKk8FvGbe7eOgwVxZHwTgIxKmeBxpk=;
	b=UdR+hmrv0gYg0iX2rlayYRoTJMIFCxT8mA/GkAEwq3J6XxrhzHxk/sgTg9aF8Gheh5
	6XptV/mZPy5tPrY9UYih+M2OTAektnpZQzXWfiIBXfKiODGFCEZoBUAKDbSW58+uceBB
	VHSLSDKwhyjV3/EmF7ocpYccP+RVmF362KCzMWxUUUz5vsjFROawo3u4pgS+GC4Xey0d
	x4998k/rQCH7HGmenr/2IgqoJZa5CDZC9yfWkayxu8XygzPHspX061AnDjWfQVh6PpWC
	OeAuUEnoj4Cj7oVGWQnLmOSB17DJoJ72D4zAmBSz+WmPblo3cvG/kOhCwwzsPFxAeviP
	3Qxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=zoJxJ9/GqSo35iKk8FvGbe7eOgwVxZHwTgIxKmeBxpk=;
	b=KDJqV4yDR9dcQ7PtSLvYSrOmiqTJSa43/XZYOf3TjzNo5TkscITmIdO7mGRNCoL2L2
	yTs2dn4m6Q2+eu0UC77x2l8Fkwwu+BxGfqNB7pBDozOy4rJnSp1g7M+WlGVs40k9U08w
	COurU5O+ZB5OyAReVnCxlURMTC12zhNBfIJ39TRBSIs2qHYnIJamoc1GqNlWV1phLeH1
	Xs3Md1M12+DfJwoV0WzwY4tk0tco2T7WOh/yU7X7ZRfw4nINGu/MEltfaU/GL1SgxRnR
	9hf6/v5rwK9jm15Ykq7i16qdqoydt/YhqdvaWFBKB8j/moqy4i508g3625TlqMI50PuC
	lPrQ==
X-Gm-Message-State: APjAAAVuDr4I1X1368FynT5XV69TwFIZOEOLaL4jXHn51cns1x0sFCEA
	4y3sLgh2JNaTdueBiVClHcCZY4Fx
X-Google-Smtp-Source: APXvYqyhpQiWu6fLGy3oW0dn8T+6OwjcZwXybxYgVeiVRYe7AJGkZgqwZqgoWXGbnD8yjHrzVas/7A==
X-Received: by 2002:a1c:41c1:: with SMTP id o184mr12821434wma.57.1572219368134;
	Sun, 27 Oct 2019 16:36:08 -0700 (PDT)
Received: from superandy.speedport.ip
	(p200300F07F320614DE89D4DE1A96B15C.dip0.t-ipconnect.de.
	[2003:f0:7f32:614:de89:d4de:1a96:b15c])
	by smtp.gmail.com with ESMTPSA id a17sm8699929wmb.8.2019.10.27.16.36.07
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 27 Oct 2019 16:36:07 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 28 Oct 2019 00:35:36 +0100
Message-Id: <20191027233545.4146-11-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191027233545.4146-1-schnitzeltony@gmail.com>
References: <20191027233545.4146-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 10/19] dconf-editor: upgrade 3.32.0 -> 3.34.0
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
X-List-Received-Date: Sun, 27 Oct 2019 23:36:07 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../dconf/{dconf-editor_3.32.0.bb => dconf-editor_3.34.2.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-gnome/recipes-gnome/dconf/{dconf-editor_3.32.0.bb => dconf-editor_3.34.2.bb} (67%)

diff --git a/meta-gnome/recipes-gnome/dconf/dconf-editor_3.32.0.bb b/meta-gnome/recipes-gnome/dconf/dconf-editor_3.34.2.bb
similarity index 67%
rename from meta-gnome/recipes-gnome/dconf/dconf-editor_3.32.0.bb
rename to meta-gnome/recipes-gnome/dconf/dconf-editor_3.34.2.bb
index 999ed041a..699511f7a 100644
--- a/meta-gnome/recipes-gnome/dconf/dconf-editor_3.32.0.bb
+++ b/meta-gnome/recipes-gnome/dconf/dconf-editor_3.34.2.bb
@@ -8,8 +8,8 @@ DEPENDS = "dconf gtk+3"
 
 inherit gnomebase vala gettext gsettings bash-completion
 
-SRC_URI[archive.md5sum] = "331a3603c0f8a9913e3a3c0f178b5310"
-SRC_URI[archive.sha256sum] = "f19d1332ac27e23ef3dc2ed07ba4e4646d9d7f05e2e78748aa525a1320adbaba"
+SRC_URI[archive.md5sum] = "2907205ad1a0e2774c981932cb7ff25b"
+SRC_URI[archive.sha256sum] = "cecc2a5cb44af68be80e970e83fb9e3e92e2a74df7c90b63324e6da19a929d5f"
 
 FILES_${PN} += " \
     ${datadir}/dbus-1 \
-- 
2.21.0


