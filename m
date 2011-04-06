Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Q7Mwd-0005o1-Eh
	for openembedded-devel@lists.openembedded.org;
	Wed, 06 Apr 2011 09:14:28 +0200
Received: by mail-fx0-f47.google.com with SMTP id 19so886040fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 06 Apr 2011 00:12:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=AF8ABYkH8WeNJBSkkNFAKn94kZZ0RSH+jWamfOh8GD0=;
	b=wBGqp0ydxfzTk/UguY+yE5LZrrtMabl2aUVpxEWbAhpsdSNlQY7fxax/74iGY4Ou1L
	yct8hC3bkza6ua6L4A6IP92koj9xvlirdPBiDrnocy5HTisYDjdVMSiutJ4SDHyOBiU9
	4vc0uChQrDo3s/WuOkV+7pHylaIcA3Z8yoOSo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=mFVEEDDtmG85rO4V6nF5BQnR/shXGaAN45yQMUYmlkRZjyf6GejVq0yZBlLm18DIZ6
	yV2zPl2jHcZN5aViSTmvnu37pkJMh3FK+AulLiRB9tRKZf2fil4eenQxzrOr6N9ojk1X
	Kkxn0+F8Q6ijK65RyntbaW30RbQ6pUbu3jSLA=
Received: by 10.223.106.76 with SMTP id w12mr643203fao.104.1302073943214;
	Wed, 06 Apr 2011 00:12:23 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id l2sm81138fam.5.2011.04.06.00.12.22
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 06 Apr 2011 00:12:22 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  6 Apr 2011 09:12:16 +0200
Message-Id: <e2b2fe2b41c7e2c761025242f75be68ba7d96d57.1302073753.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1302073753.git.Martin.Jansa@gmail.com>
References: <cover.1302073753.git.Martin.Jansa@gmail.com>
Subject: [PATCH 1/1] ttf-arphic-uming: fix LICENSE and add LIC_FILES_CHKSUM
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 06 Apr 2011 07:14:28 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../ttf-fonts/ttf-arphic-uming_20080216.bb         |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-arphic-uming_20080216.bb b/meta-oe/recipes-graphics/ttf-fonts/ttf-arphic-uming_20080216.bb
index bb259b9..877953f 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/ttf-arphic-uming_20080216.bb
+++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-arphic-uming_20080216.bb
@@ -1,6 +1,7 @@
 DESCRIPTION = "Unicode Mingti (printed) TrueType Font"
 HOMEPAGE = "http://www.freedesktop.org/wiki/Software/CJKUnifonts"
-LICENSE = "${PN}"
+LICENSE = "Arphic Public License"
+LIC_FILES_CHKSUM = "file://README;md5=62be011094b7865ddc4d1a648444d31a"
 SRC_DISTRIBUTE_LICENSES += "${PN}"
 RPROVIDES_${PN} = "virtual-chinese-font"
 PR = "r2"
-- 
1.7.4.1



