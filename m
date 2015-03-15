Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-we0-f171.google.com (mail-we0-f171.google.com
	[74.125.82.171])
	by mail.openembedded.org (Postfix) with ESMTP id 913AB7393F
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Mar 2015 23:34:35 +0000 (UTC)
Received: by webcq43 with SMTP id cq43so26864814web.2
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Mar 2015 16:34:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=2Fs1fRXfEG/bA5hhAxghJZ75mXgMTSGjvSasIAWq6ms=;
	b=XHwFiXXOGJ1uzQpNslobQou2Nkjk5B+u9NAAiLmtLN7M6eSHgynH8ug7RkIf4OGDhJ
	yGF0U7WpBPt3zAwlR7crumA/VZt0UDqUoYq4chKnPzgQo4JZGbMzCWY1KFbDO3FHDNmi
	q9sxZk9XRRn3q0hFktDShD5WVZSXCqi6sp9PXUPUFIWYVpnj8VrjM5qhxamTgdj1IN1d
	nSWy4gi+Zq52aold6uKKiXhPWI5vPzG1isfnkN7A/JH40Mrv3tgHXAPP8HjrcEV7dFEc
	sYtKyjVVcZq0kNwjSYEDATbI21rDdz0w33xFOpj/E4znOvl/2ZYQwPmv15u728HAOp2z
	lI1w==
X-Received: by 10.194.95.133 with SMTP id dk5mr26086386wjb.143.1426462476237; 
	Sun, 15 Mar 2015 16:34:36 -0700 (PDT)
Received: from localhost.localdomain (p54AA52CC.dip0.t-ipconnect.de.
	[84.170.82.204]) by mx.google.com with ESMTPSA id
	r14sm12804945wiv.13.2015.03.15.16.34.34
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 15 Mar 2015 16:34:35 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 16 Mar 2015 00:33:38 +0100
Message-Id: <1426462419-10173-30-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <1426462419-10173-1-git-send-email-schnitzeltony@googlemail.com>
References: <1426462419-10173-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH][meta-xfce 29/30] xfce4-closebutton-plugin: git repo was moved to github
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
X-List-Received-Date: Sun, 15 Mar 2015 23:34:35 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../recipes-panel-plugins/closebutton/xfce4-closebutton-plugin_git.bb   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-xfce/recipes-panel-plugins/closebutton/xfce4-closebutton-plugin_git.bb b/meta-xfce/recipes-panel-plugins/closebutton/xfce4-closebutton-plugin_git.bb
index f96009e..341107f 100644
--- a/meta-xfce/recipes-panel-plugins/closebutton/xfce4-closebutton-plugin_git.bb
+++ b/meta-xfce/recipes-panel-plugins/closebutton/xfce4-closebutton-plugin_git.bb
@@ -9,7 +9,7 @@ DEPENDS += "exo-native libwnck xfconf"
 
 PV = "0.1.0+gitr${SRCPV}"
 
-SRC_URI = "git://gitorious.org/xfce/xfce4-closebutton-plugin.git;branch=master"
+SRC_URI = "git://github.com/schnitzeltony/xfce4-closebutton-plugin.git;branch=master"
 SRCREV = "bd76154afe26ba8a5251a1887d88f9d855301850"
 S = "${WORKDIR}/git"
 
-- 
1.9.3


