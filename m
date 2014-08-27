Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wi0-f175.google.com (mail-wi0-f175.google.com
	[209.85.212.175])
	by mail.openembedded.org (Postfix) with ESMTP id BDD1465E94
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Aug 2014 07:24:27 +0000 (UTC)
Received: by mail-wi0-f175.google.com with SMTP id ho1so5321075wib.14
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Aug 2014 00:24:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=bXwrj2xSKBgn4FQUkO6duVWpSSKZH+zAeyRX7ct1FYU=;
	b=MBQOBznblQU6V03+zovHv0J3DCIeP9iQKEtW5GWfv9cCY1mQQZH+ocvIEb0aXhYwtJ
	Pv6gR411tQBx6SzJhtchg/WybQYCvlNfNvyhZ8osPBDRg19xrdBR7hdHrtYLjYETWYII
	peM8b8dMnrLyiXjMybZ9EovRSWr6dm/TllzhWmnYIlK41GW7e3j4vhkvDjvEhtRTAciO
	yN90zS5ss1il6DKdE5uUxIwm5ppmmzV3nOJPoY+MGus4wSe0FjqtSVRm78eq7lMQVpvw
	/ETJIfBoodLJWVwZVmQMOHEjFz06Xp8X/YttYNFu+WJs3R4EoSffTXoRn2E2qmorxucu
	jfnw==
X-Gm-Message-State: ALoCoQlgHLvyb+JPg2xwMyl4tsScO/muCQbOBVtkY/PKB/igmzCMMWZBSfFFDrirJhNILaNnV6KG
X-Received: by 10.194.77.212 with SMTP id u20mr35034935wjw.27.1409124268662;
	Wed, 27 Aug 2014 00:24:28 -0700 (PDT)
Received: from localhost ([2001:610:612:0:beee:7bff:fe9e:ae56])
	by mx.google.com with ESMTPSA id ju1sm14736222wjc.1.2014.08.27.00.24.27
	for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Wed, 27 Aug 2014 00:24:27 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 27 Aug 2014 09:24:25 +0200
Message-Id: <1409124265-9548-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.9.0
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-oe][PATCH] mkvtoolnix: update to 7.1.0+git
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
X-List-Received-Date: Wed, 27 Aug 2014 07:24:31 -0000

This fixes compilation with boot 1.56+

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 .../mkvtoolnix/{mkvtoolnix_7.0.0.bb => mkvtoolnix_git.bb}         | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)
 rename meta-multimedia/recipes-mkv/mkvtoolnix/{mkvtoolnix_7.0.0.bb => mkvtoolnix_git.bb} (84%)

diff --git a/meta-multimedia/recipes-mkv/mkvtoolnix/mkvtoolnix_7.0.0.bb b/meta-multimedia/recipes-mkv/mkvtoolnix/mkvtoolnix_git.bb
similarity index 84%
rename from meta-multimedia/recipes-mkv/mkvtoolnix/mkvtoolnix_7.0.0.bb
rename to meta-multimedia/recipes-mkv/mkvtoolnix/mkvtoolnix_git.bb
index bd752af..8d77024 100644
--- a/meta-multimedia/recipes-mkv/mkvtoolnix/mkvtoolnix_7.0.0.bb
+++ b/meta-multimedia/recipes-mkv/mkvtoolnix/mkvtoolnix_git.bb
@@ -6,9 +6,11 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 DEPENDS = "curl boost expat zlib libebml libmatroska libogg libvorbis bzip2 lzo file ruby-native"
 
-SRC_URI = "http://www.bunkus.org/videotools/mkvtoolnix/sources/mkvtoolnix-${PV}.tar.xz"
-SRC_URI[md5sum] = "ddd5ce6288d2fdaa6b79cb6d7bfffb04"
-SRC_URI[sha256sum] = "2bbdf060e193d4a7f961f84d28b28d67d859be66e3f2cdf8ee4ae380f8d15725"
+PV = "7.1.0+git${SRCPV}"
+SRCREV = "0c89ff941bfdd9f3378312f293a84f13cf3e2a96"
+SRC_URI = "git://github.com/mbunkus/mkvtoolnix.git"
+
+S = "${WORKDIR}/git"
 
 inherit autotools-brokensep gettext
 
-- 
1.9.0


