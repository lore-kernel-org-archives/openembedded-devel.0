Return-Path: <kergoth@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id 245D377029
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 May 2016 16:10:32 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id 145so2351403pfz.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 May 2016 09:10:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=G33N8hWuUh3ZDjGc9YThxATO66F0cHCSEqpcWT/eTzI=;
	b=qgClNL273AOlViyzmtYYVtr6DkrTA4t2a2C2vuuZ0wBrS6FySzJ+OKwlwY3E+yigtT
	MdFGhq6wydwVgPEgxiS5zBMAmvZw/Y1qg4ug/3vs/UzKlTbWcd/Ky0FA4mDmngU+/dV6
	vUW/z37/Uia0efFjdgcX/JshWxyvMb2L/HQO2Ll05MaS7dFctYJsrKKOuLfu4dOjG8Bo
	XL8VXSmFPl01eRSzSJdlqv82vS/as9RQJcx9xM21SJIfuhsvEsCdPOUXjbyNydwajb3u
	12J2qHXvWiCM6UhILE7x0UAohhQfqBMvGxx6zSTbhVwahxpqKemETogGnx7yhpOi14fO
	WqcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=G33N8hWuUh3ZDjGc9YThxATO66F0cHCSEqpcWT/eTzI=;
	b=IyTJzN4t8ZC7LQlVe+Sz1slX78AQcpBDv6mBoPdMFPdXEiZrpLI1qRLPAlhx2W59i8
	3pnHxPQX02r55BWhNqkpGBzl0kekG8dIO0QbYomlijZZO3XvpABxe7gpcj5iz83UQZ+a
	+xW/l4bl2wuRRE02dnxvO2+scmrXa/kPzruWe6YkjfKCyIAFiv4sRyvr12KZHxfFrNiJ
	Vx1uMx7pU6NlvnbmuCG7N3KIkQdIZ4YHD3pDezhlXCZcd80t8+hIm1Xxo9kdJqiqA0Ip
	tjpUkS2+TzMVLjQGuuDtXHHSbovcgq+55Yw7ZCkt+hhS0Wkr4kC1d4TzfrfnLKFF6Hsx
	Ampg==
X-Gm-Message-State: AOPr4FWdTJ1CIf6SUU+HEp8P0LE4scby3jns1M2iru5XRPZJGBRrgeIm7XSnEyP4uaPWiA==
X-Received: by 10.98.97.67 with SMTP id v64mr3217926pfb.149.1463501433664;
	Tue, 17 May 2016 09:10:33 -0700 (PDT)
Received: from amyr.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by smtp.gmail.com with ESMTPSA id
	rw2sm5868665pab.30.2016.05.17.09.10.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 17 May 2016 09:10:32 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 17 May 2016 09:10:19 -0700
Message-Id: <684e281d2a69fbf64ced3831b355abbd3827c15f.1463501350.git.chris_larson@mentor.com>
X-Mailer: git-send-email 2.8.0
In-Reply-To: <3ab55100823a114a701c63eaa703d0352bca5513.1463501350.git.chris_larson@mentor.com>
References: <3ab55100823a114a701c63eaa703d0352bca5513.1463501350.git.chris_larson@mentor.com>
In-Reply-To: <cover.1463501350.git.chris_larson@mentor.com>
References: <cover.1463501350.git.chris_larson@mentor.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [meta-oe][PATCH 5/6] networkmanager: add missing dep on dbus-glib-native
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
X-List-Received-Date: Tue, 17 May 2016 16:10:33 -0000

From: Christopher Larson <chris_larson@mentor.com>

The networkmanager build runs dbus-binding-tool, which only exists if
dbus-glib-native has been built, and will fail otherwise.

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.10.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.10.bb b/meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.10.bb
index c8447e6..c18afff 100644
--- a/meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.10.bb
+++ b/meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.10.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=cbbffd568227ada506640fe950a4823b \
                     file://docs/api/html/license.html;md5=51d7fb67bde992e58533a8481cee070b \
 "
 
-DEPENDS = "intltool-native libnl dbus dbus-glib libgudev util-linux libndp libnewt polkit"
+DEPENDS = "intltool-native libnl dbus dbus-glib dbus-glib-native libgudev util-linux libndp libnewt polkit"
 
 inherit gnomebase gettext systemd bluetooth bash-completion vala gobject-introspection
 
-- 
2.8.0


