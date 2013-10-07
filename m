Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ee0-f45.google.com (mail-ee0-f45.google.com [74.125.83.45])
	by mail.openembedded.org (Postfix) with ESMTP id 4346260FCA
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  7 Oct 2013 23:04:29 +0000 (UTC)
Received: by mail-ee0-f45.google.com with SMTP id c50so3605557eek.32
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 07 Oct 2013 16:04:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=AZMmGIwDT7/8qICNrkcQlN2IeVnDmZaxxGnBlueCrp0=;
	b=S2dReKtNWfUYBwshRXr83WBj7UkTSDAXl/Pq3Fjh+k5cPbzMop9Cv854B6WGVS1vXE
	vwT6Al81umgiwSByVgmU5//y5XaMeIh2z0iB3beBl9TGqQqZuFiEaH3TGIffq4G+svap
	+OT0UFr7AOe4MjTapyzuuKgZwn0wwcASOz47QaIPw5NU8tPJWKW/0+YIdk4H2d8+S6Mu
	pcXNuAH/fdxr8l5YVEq9NdJguhqfQStoKs/NsZZeGFmP6+97ehwLi9JJx3NzFKi0a5yo
	zGoxIEQNPynGBjADOrp7LYBd1Zl+mG/RpZA8DnkGOXKyUOmfqcqSJtrZbjwrSgVvw2VK
	fNpQ==
X-Received: by 10.15.54.199 with SMTP id t47mr8550414eew.46.1381187070741;
	Mon, 07 Oct 2013 16:04:30 -0700 (PDT)
Received: from localhost.localdomain (p5B0A2967.dip0.t-ipconnect.de.
	[91.10.41.103])
	by mx.google.com with ESMTPSA id m54sm68507239eex.2.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Mon, 07 Oct 2013 16:04:30 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  8 Oct 2013 01:03:56 +0200
Message-Id: <1381187036-3005-7-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1381187036-3005-1-git-send-email-schnitzeltony@googlemail.com>
References: <1381187036-3005-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-oe/meta-xfce 6/6] xfce4-icon-theme: add xfce4-dev-tools-native to DEPENDS
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
X-List-Received-Date: Mon, 07 Oct 2013 23:04:29 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

fixes (detected in Martin's world build):

| /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/xfce4-icon-theme/4.4.3-r0/xfce4-icon-theme-4.4.3/configure: line 4836: syntax error near unexpected token `am'
| /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/xfce4-icon-theme/4.4.3-r0/xfce4-icon-theme-4.4.3/configure: line 4836: `XDT_I18N(am ar ca cs da de dz el en_GB eo et eu fi fr he hu id ja ka ko lt lv mk nb_NO pl pt_BR pt_PT ro ru si sk sq tr uk ur zh_CN zh_TW)'
| Configure failed. The contents of all config.log files follows to aid debugging

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-xfce/recipes-art/xfce4-icon-theme/xfce4-icon-theme_4.4.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-xfce/recipes-art/xfce4-icon-theme/xfce4-icon-theme_4.4.3.bb b/meta-xfce/recipes-art/xfce4-icon-theme/xfce4-icon-theme_4.4.3.bb
index f6a9d2b..6777cec 100644
--- a/meta-xfce/recipes-art/xfce4-icon-theme/xfce4-icon-theme_4.4.3.bb
+++ b/meta-xfce/recipes-art/xfce4-icon-theme/xfce4-icon-theme_4.4.3.bb
@@ -3,7 +3,7 @@ SECTION = "x11/wm"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
-DEPENDS = "intltool-native"
+DEPENDS = "intltool-native xfce4-dev-tools-native"
 
 inherit xfce
 
-- 
1.8.3.1


