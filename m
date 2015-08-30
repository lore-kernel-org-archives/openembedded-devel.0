Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wi0-f169.google.com (mail-wi0-f169.google.com
	[209.85.212.169])
	by mail.openembedded.org (Postfix) with ESMTP id 062EF761C6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 30 Aug 2015 10:34:14 +0000 (UTC)
Received: by wicpl12 with SMTP id pl12so5601607wic.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 30 Aug 2015 03:34:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=Xyh+OAH7gEml2mXjteNG2PNk1V625yYii+Ahm2Ergnc=;
	b=Bg9UMq+mSn5rCrlSdAT24DXwDjfWaixqKhuIByXhVGsO6QsLFwav4O/0ItUZefvrkp
	hqHVW9cT9BD3XlsoRiG2srdCMvw44nhNBgUW6agzcoY38cgdRpkPs/45kaDkNFrNB5W4
	w9iylrl9gew7t1F80+SMoEzoLIH3ymgWakUsHuj2uyhRK6jiIr9myDxjN766r9LCFbzv
	GpnkF4F4atS8gC7FjE6K4t99JkdS0yv4GGD9EDdVUz/R9fEukYdujwpakbrw5axcXMYu
	QK7eTEjYtSPBdu+EgJTX0Lbp+wXVKjqF2WpFC4T16SjF6mLHlYPJJjEkkMiTchNV9z63
	t92g==
X-Received: by 10.180.82.162 with SMTP id j2mr14750706wiy.10.1440930854442;
	Sun, 30 Aug 2015 03:34:14 -0700 (PDT)
Received: from localhost.localdomain (p54AA5C5E.dip0.t-ipconnect.de.
	[84.170.92.94]) by smtp.googlemail.com with ESMTPSA id
	h9sm16778522wjx.20.2015.08.30.03.34.13
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 30 Aug 2015 03:34:13 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 30 Aug 2015 12:33:57 +0200
Message-Id: <1440930840-3459-4-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1440930840-3459-1-git-send-email-schnitzeltony@googlemail.com>
References: <1440930840-3459-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCHv2 3/6] rodent-icon-theme: add RPROVIDES/RREPLACE/RCONFLICTS for xfce4-icon-theme
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
X-List-Received-Date: Sun, 30 Aug 2015 10:34:16 -0000
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


