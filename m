Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wi0-f178.google.com (mail-wi0-f178.google.com
	[209.85.212.178])
	by mail.openembedded.org (Postfix) with ESMTP id 5690576E01
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Aug 2015 14:53:50 +0000 (UTC)
Received: by wicgk12 with SMTP id gk12so11293057wic.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Aug 2015 07:53:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=Xyh+OAH7gEml2mXjteNG2PNk1V625yYii+Ahm2Ergnc=;
	b=EK9LYRYuy1OaaRIVnSxz45K1X2OPGVsuBPj26bJLQwHnTNk/6g4N8TNG/RYayIJBvY
	G6WkwX406k99f5Bfnf4sumxJdGlM7uuMfi412/PLLo4pmYnGDv6S/JFpgCteIMfxQjAO
	9YlXLhxxy9qdaB0IK2ZyWQW6S30bexcOiLshqSfwzGHWZBuzCECZTuRVMDgJivmU2K3t
	QSk7cj7nLALiOLFQuq31ueXu8pQBn87f18I43KxjsapRGyUl0QiDUNz5x5niOWRE/9ht
	CJTyRLZjI0bXyqW6tomPWwlVJHxLizi3ejEVlSlO+UpEUpmm2S/GALdoxJ/lbjIxRLcy
	WX2A==
X-Received: by 10.194.108.232 with SMTP id hn8mr5358374wjb.154.1440687230170; 
	Thu, 27 Aug 2015 07:53:50 -0700 (PDT)
Received: from localhost.localdomain ([5.147.14.94])
	by smtp.googlemail.com with ESMTPSA id
	p5sm12973681wiy.17.2015.08.27.07.53.49
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 27 Aug 2015 07:53:49 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 27 Aug 2015 16:53:15 +0200
Message-Id: <1440687197-26742-4-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1440687197-26742-1-git-send-email-schnitzeltony@googlemail.com>
References: <1440687197-26742-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 3/5] rodent-icon-theme: add RPROVIDES/RREPLACE/RCONFLICTS for xfce4-icon-theme
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
X-List-Received-Date: Thu, 27 Aug 2015 14:53:51 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

rodent-icon-theme is successor of xfce4-icon-theme

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-xfce/recipes-art/rodent-icon-theme/rodent-icon-theme_5.0.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-xfce/recipes-art/rodent-icon-theme/rodent-icon-theme_5.0.bb b/meta-xfce/recipes-art/rodent-icon-theme/rodent-icon-theme_5.0.bb
index 130e032..40ba340 100644
--- a/meta-xfce/recipes-art/rodent-icon-theme/rodent-icon-theme_5.0.bb
+++ b/meta-xfce/recipes-art/rodent-icon-theme/rodent-icon-theme_5.0.bb
@@ -9,3 +9,8 @@ SRC_URI[md5sum] = "4b097d344a160d6497c6498985c8df15"
 SRC_URI[sha256sum] = "6ed00d16faa1f55b3bb7b13862de1d7f5cfd978b93e42487ded21595d0dbe208"
 
 FILES_${PN} += "${datadir}/icons"
+
+RREPLACES_${PN} += "xfce4-icon-theme"
+RPROVIDES_${PN} += "xfce4-icon-theme"
+RCONFLICTS_${PN} += "xfce4-icon-theme"
+
-- 
2.1.0


