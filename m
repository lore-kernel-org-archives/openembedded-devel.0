Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wg0-f48.google.com (mail-wg0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id A672B73944
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Mar 2015 23:34:33 +0000 (UTC)
Received: by wgdm6 with SMTP id m6so27060718wgd.2
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Mar 2015 16:34:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=U9JZ7Ud2oNrr0Ihj0ydBbsFW9QLCkXhDRHoALUxwNA4=;
	b=XUBbGRqJ/pLnLKxryOq314U3YV3QeVUp+3lxrzg8B5rWrMGQ1pmJPAazWtmCiZg6Zx
	7SSnwXpM6/a8ffbp/ku8SmPT9gaJyAYoELG/i/gdftxWN3x2jZiFOKTuovn8fodkqi24
	p/npONVY07SDtQnTYtBAnbUK1e2lUbQK/wOFDKT+CdM+y0kyl9+QvhwoQKHB0EkQGd9a
	JpMGdTwOf224qp1xI2A1F9dsECduOjbFANzxZs6WPOUJGV+NwWU6b+/G2qkOCCIsVuuK
	Ou3Pld6rBsl67sk4cIYBWXP8ILiU9myYvI4sIs8G6msUBzR7O0mnhpIL633JhUFm7LCP
	pS5w==
X-Received: by 10.194.222.135 with SMTP id qm7mr68131579wjc.14.1426462474865; 
	Sun, 15 Mar 2015 16:34:34 -0700 (PDT)
Received: from localhost.localdomain (p54AA52CC.dip0.t-ipconnect.de.
	[84.170.82.204]) by mx.google.com with ESMTPSA id
	r14sm12804945wiv.13.2015.03.15.16.34.33
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 15 Mar 2015 16:34:34 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 16 Mar 2015 00:33:37 +0100
Message-Id: <1426462419-10173-29-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <1426462419-10173-1-git-send-email-schnitzeltony@googlemail.com>
References: <1426462419-10173-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH][meta-xfce 28/30] xarchiver: git repo was moved to github
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 15 Mar 2015 23:34:34 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-xfce/recipes-apps/xarchiver/xarchiver_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-xfce/recipes-apps/xarchiver/xarchiver_git.bb b/meta-xfce/recipes-apps/xarchiver/xarchiver_git.bb
index 9e4b696..ca29922 100644
--- a/meta-xfce/recipes-apps/xarchiver/xarchiver_git.bb
+++ b/meta-xfce/recipes-apps/xarchiver/xarchiver_git.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
 DEPENDS = "gtk+ glib-2.0 xfce4-dev-tools-native intltool-native"
 
-SRC_URI = "git://gitorious.org/xfce/xarchiver.git;branch=master"
+SRC_URI = "git://github.com/schnitzeltony/xarchiver.git;branch=master"
 SRCREV = "e80e90528c9aab2fe36d9078b945b44c05cc20d3"
 PV = "0.5.3"
 S = "${WORKDIR}/git"
-- 
1.9.3


