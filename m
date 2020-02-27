Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
	[209.85.221.43])
	by mail.openembedded.org (Postfix) with ESMTP id AAEE761879
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Feb 2020 22:12:57 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id c13so670206wrq.10
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Feb 2020 14:12:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=MPq+xYSyjj+aEpoDVT8dBk2b7NWdEU+dkdleeo8az38=;
	b=WOEA5YvQpDq2+16Cud7yjTb5n9tIv3og2hG1ccxHu14g86QY9PFrs+0hRiXy0l0gVo
	XXSKLV4W8OLhayB7rqmlUYvKX3FV9wmEwG/fC/dVeSoYUp1ht5UtQLEBNTmf1j/IAlH5
	gFnwvc+XkOG8dsGL+PlHMNPOr072+X/XTpgaPejxjgNvQ0FULfEamCC/2fLqGU1z7imN
	oD41THA5E3MCTT0WrtddIc7KEuCZVJnlWBlZMrh/ZV6y2artUtoxyzUu1C5AyWlEaQfR
	Dk/qaXouFCegp9ad9kdAPAJOUyC6dRbc6Vy7doYh8YuDOhvnqIqswomMczG79pYNfwax
	mgyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=MPq+xYSyjj+aEpoDVT8dBk2b7NWdEU+dkdleeo8az38=;
	b=j3qBP0dVSyNMWRifGy+WuUcEAMrDMZsN7QJNL06SFDtCYYaq5BYCQZ6k2yZyVHm/FJ
	4i8c/dzhwoVrHRmZpr0JTt8hAJNN2ETE0RU7l8dAKyBSbghmQbEnUCIDTGiJSnRirHJi
	fbBl3Md6epnc1IrEFOn0d2zWeXGRFQfdao6brTzq/lqSSb7seRUOxUgp9ekfVtv/ITsN
	GImR0z7sMA1X7qSELrDU76Uy3DUXm8H5mnMNF8FNrVMR9W3XYwH6LzqLaZ8bzPZxqqJn
	MwK+UhdjZN2SaN2nlHD9dgAULNlm7+W05cgfi5i910ulrnPi56tOY30GJcZRbd2l08YQ
	RDXw==
X-Gm-Message-State: APjAAAV+a+9v0aP1tsSIFE1S44QlOUm9ZxVY19Kn6gGqSiWU3pK0Y/tc
	av5j2cA9zL5oqhdYEDj3ecAVWDdV
X-Google-Smtp-Source: APXvYqwcSuf6f4ulPAiedVjQirDO7OSa3t3k5zJB7Im+UVSWMQWg3GW+6IcMaXISu4SshQbPdSI91w==
X-Received: by 2002:a5d:4204:: with SMTP id n4mr956515wrq.123.1582841578119;
	Thu, 27 Feb 2020 14:12:58 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F102C9262505CD5EB98F253.dip0.t-ipconnect.de.
	[2003:f0:7f10:2c92:6250:5cd5:eb98:f253])
	by smtp.gmail.com with ESMTPSA id y8sm8911422wma.10.2020.02.27.14.12.57
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 27 Feb 2020 14:12:57 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 27 Feb 2020 23:12:39 +0100
Message-Id: <20200227221245.22944-2-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200227221245.22944-1-schnitzeltony@gmail.com>
References: <20200227221245.22944-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 2/8] file-roller: upgrade 3.32.3 -> 3.32.4
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
X-List-Received-Date: Thu, 27 Feb 2020 22:12:57 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../{file-roller_3.32.3.bb => file-roller_3.32.4.bb}          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-gnome/recipes-gnome/file-roller/{file-roller_3.32.3.bb => file-roller_3.32.4.bb} (77%)

diff --git a/meta-gnome/recipes-gnome/file-roller/file-roller_3.32.3.bb b/meta-gnome/recipes-gnome/file-roller/file-roller_3.32.4.bb
similarity index 77%
rename from meta-gnome/recipes-gnome/file-roller/file-roller_3.32.3.bb
rename to meta-gnome/recipes-gnome/file-roller/file-roller_3.32.4.bb
index f6b045786..0e57848c5 100644
--- a/meta-gnome/recipes-gnome/file-roller/file-roller_3.32.3.bb
+++ b/meta-gnome/recipes-gnome/file-roller/file-roller_3.32.4.bb
@@ -13,8 +13,8 @@ DEPENDS = " \
 
 inherit gnomebase gsettings itstool gnome-help gettext upstream-version-is-even mime-xdg
 
-SRC_URI[archive.md5sum] = "5e098bb254d34f48a9b5761b468f4240"
-SRC_URI[archive.sha256sum] = "be111fb877dc1eb487ec5d6e2b72ba5defe1ab8033a6a6b9b9044a2a7787e22a"
+SRC_URI[archive.md5sum] = "21982b8d298cb2994a99494399dcb2d5"
+SRC_URI[archive.sha256sum] = "1b3b2cbfcb444e0d150bfd063add9d5181c8ab24f0593e5a8894399297214017"
 
 PACKAGECONFIG[nautilus] = "-Dnautilus-actions=true,-Dnautilus-actions=false,nautilus"
 
-- 
2.21.0


