Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id C45D56102E
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 Feb 2020 12:18:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 48QPNn24jDz4J
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 Feb 2020 13:18:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1582460297;
	bh=/NfMLQwO1PrVe1Xciry+HLhPNSja/UbAYeMp4mRKgFI=;
	h=From:To:Subject:Date:From;
	b=YD9ZRw7A5jsUbhh0nheIBOAwZbj7p+aHyGqt8XoaWQwgUUR8snYueO3NqkY/ms82n
	+Bj7KlatxE1NqxSHvGz0GBLEwSLuBY+0wuABg92rGAMVq039walVR+h9itW31XSfGP
	bZuT6bLJGWa7gw66qDErjJOQoFXPFAY7gtMHMl75TFYSqB28L+GDV1t3sJWmj1SKTI
	HK+sJGk1NswvZzjy3EIzBTk5NIHaRKwWOulLikMeFuPfR0Ud86fOyY3C4Iq1p2jobp
	w5Sw3x2SfaqAqqM4hvcPb2rXm43IT70vwOeX7zhqa6BmXopI4mRuqfJUVXxduv7u9f
	glyFC9BPo5qBOJbx45C+RZkspE8b7BF3X2KoWXBeUmI1VifUYFzeS4Ui+h085C5PDx
	+ElBPYIQyXCpnlv336pjJFlglIVDlkeg+hZNxJLyYBtV/LgdgRahwCgywup0z22YCQ
	dHmI0ktR/rfURHxzj486/kM+ZZBZLViaMRyu3W4/NGzuhz2XD6hOkoSmtguMsH1OeQ
	gA0jytuBw4JL8U/6slOUakuXljT3ZEFrgEcmbzs9KUyaIgpKG+Wp+II+cpV9Kx6Nyz
	/+fzLN2SlLlzkGqXVbl1ukPjA0yV9SMBA7kMDz0OBY/b12Dn0ozETEz+yMIu8bk1Hh
	GMCdJgjFq/6ZpoNP+5fmz3ws=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 23 Feb 2020 14:18:14 +0200
Message-Id: <20200223121814.7941-2-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe][PATCH] modemmanager: Upgrade 1.12.4 -> 1.12.6
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
X-List-Received-Date: Sun, 23 Feb 2020 12:18:19 -0000

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 .../{modemmanager_1.12.4.bb => modemmanager_1.12.6.bb}        | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-connectivity/modemmanager/{modemmanager_1.12.4.bb => modemmanager_1.12.6.bb} (93%)

diff --git a/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.12.4.bb b/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.12.6.bb
similarity index 93%
rename from meta-oe/recipes-connectivity/modemmanager/modemmanager_1.12.4.bb
rename to meta-oe/recipes-connectivity/modemmanager/modemmanager_1.12.6.bb
index 1f64be09e..ef6ba6bb4 100644
--- a/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.12.4.bb
+++ b/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.12.6.bb
@@ -14,8 +14,8 @@ DEPENDS = "glib-2.0 libgudev intltool-native libxslt-native"
 SRC_URI = "http://www.freedesktop.org/software/ModemManager/ModemManager-${PV}.tar.xz \
            "
 
-SRC_URI[md5sum] = "22280110d75c87a89786a317aa9cee04"
-SRC_URI[sha256sum] = "852d61755e0c1a8d0c609b17192d742b324fdd2e513f3ed64b228befb859a95b"
+SRC_URI[md5sum] = "796bf7bfc156c4229cef1a9cb8c79f37"
+SRC_URI[sha256sum] = "2eb3353ee5518005c51d429308695c69d8c38cf2fd9102b04f785c03a0cc624c"
 
 S = "${WORKDIR}/ModemManager-${PV}"
 
-- 
2.17.1


