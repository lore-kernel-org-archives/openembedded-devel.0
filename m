Received: from mail-da0-f43.google.com ([209.85.210.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1UdDuv-0007QM-IX
	for openembedded-devel@lists.openembedded.org;
	Fri, 17 May 2013 08:13:32 +0200
Received: by mail-da0-f43.google.com with SMTP id u7so2142640dae.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 May 2013 22:54:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=+ep49rN9xT9eu9sgRqT//BbUC7cw7cB8UhdDhwvs1kY=;
	b=dK0ag7s5BN5JMWKrsfNirOk4B6WtDLCUCqLnHY0Hl3q9Tj8QYR9XdiZ5s0YCuHbCnO
	GOXETLuet6m1woERIlretEV9xxjU3jWb53J9HwkroZLEjkzi1zo2U4PRR2WagrsRGZNU
	xPzSUQ3nQZCKyVpMoNf64FM/pPo796GqyQHrH2s+4lCNxH7drynkwbDlNVyPAVjhuSLi
	IYec2gA3pUnVFunGuCLn3c0kFTGN6wOpDiAY+mt99y9ePMdlANEfOurcLbag6b/c3Ese
	++ds59hoLldCyIgQOHOxmDqH81Vu/6JbsooVZlJb9LnSQiYrGeR7CpZAdGq77cWGgBLv
	XZeQ==
X-Received: by 10.68.129.10 with SMTP id ns10mr46821929pbb.13.1368770094917;
	Thu, 16 May 2013 22:54:54 -0700 (PDT)
Received: from isis.gateway.2wire.net
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPSA id sg4sm9843997pbc.7.2013.05.16.22.54.53
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 16 May 2013 22:54:54 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 16 May 2013 22:53:15 -0700
Message-Id: <1368769995-29266-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [meta-oe][PATCH] pangomm: Add missing dependency on pango
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
X-List-Received-Date: Fri, 17 May 2013 06:13:51 -0000

Fixes errors like

| configure:15678: error: Package requirements (glibmm-2.4 >= 2.14.1
cairomm-1.0 >= 1.2.2 pangocairo >= 1.23.0) were not met:
|
| No package 'pangocairo' found

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-graphics/pango/pangomm_2.28.2.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/pango/pangomm_2.28.2.bb b/meta-oe/recipes-graphics/pango/pangomm_2.28.2.bb
index 4419113..302062c 100644
--- a/meta-oe/recipes-graphics/pango/pangomm_2.28.2.bb
+++ b/meta-oe/recipes-graphics/pango/pangomm_2.28.2.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d8045f3b8f929c1cb29a1e3fd737b499 \
 
 PR = "r2"
 
-DEPENDS = "mm-common cairomm glibmm"
+DEPENDS = "mm-common cairomm glibmm pango"
 
 SHRT_VER = "${@d.getVar('PV',1).split('.')[0]}.${@d.getVar('PV',1).split('.')[1]}"
 
-- 
1.7.9.5



