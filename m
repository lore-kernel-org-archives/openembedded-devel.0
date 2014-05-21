Return-Path: <Matthieu.CRAPET@ingenico.com>
Received: from smtp1.ingenico.com (unknown [217.108.148.240])
	by mail.openembedded.org (Postfix) with ESMTP id 17E43605B2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 May 2014 07:30:51 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="4.98,878,1392159600"; d="scan'208";a="51534264"
Received: from cosnadexc22.usr.ingenico.loc ([10.31.4.222])
	by antispam1.usr.ingenico.loc with ESMTP; 21 May 2014 09:30:52 +0200
Received: from COSNADEXC12.usr.ingenico.loc (10.31.4.212) by
	COSNADEXC22.usr.ingenico.loc (10.31.4.222) with Microsoft SMTP Server
	(TLS) id 14.2.318.1; Wed, 21 May 2014 09:30:52 +0200
Received: from u56.usr.ingenico.loc (10.23.7.56) by
	COSNADEXC12.usr.ingenico.loc (10.31.4.212) with Microsoft SMTP Server
	id 14.2.328.9; Wed, 21 May 2014 09:30:51 +0200
From: Matthieu Crapet <Matthieu.Crapet@ingenico.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 21 May 2014 09:30:58 +0200
Message-ID: <1400657458-32231-1-git-send-email-Matthieu.Crapet@ingenico.com>
X-Mailer: git-send-email 1.9.2
In-Reply-To: <CAMKF1sqfoiANL7jcnVA3Q7sWz8mzjcUfkCNE5FxQFweWd905Rw@mail.gmail.com>
References: <CAMKF1sqfoiANL7jcnVA3Q7sWz8mzjcUfkCNE5FxQFweWd905Rw@mail.gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH v2] faac: fix S!=B failure
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
X-List-Received-Date: Wed, 21 May 2014 07:30:55 -0000
Content-Type: text/plain

Also use ${BP} and ${BPN}.

Signed-off-by: Matthieu Crapet <Matthieu.Crapet@ingenico.com>
---
 meta-multimedia/recipes-multimedia/faac/faac_1.28.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-multimedia/recipes-multimedia/faac/faac_1.28.bb b/meta-multimedia/recipes-multimedia/faac/faac_1.28.bb
index c7dcdb9..d96c1a4 100644
--- a/meta-multimedia/recipes-multimedia/faac/faac_1.28.bb
+++ b/meta-multimedia/recipes-multimedia/faac/faac_1.28.bb
@@ -4,15 +4,15 @@ LICENSE = "LGPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7 \
                     file://libfaac/coder.h;beginline=5;endline=17;md5=fa1fd6a5fa8cdc877d63a12530d273e0"
 
-inherit autotools
+inherit autotools-brokensep
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/faac/${BPN}-${PV}.tar.gz \
+SRC_URI = "${SOURCEFORGE_MIRROR}/faac/${BP}.tar.gz \
            file://build-fix.patch"
 
 SRC_URI[md5sum] = "80763728d392c7d789cde25614c878f6"
 SRC_URI[sha256sum] = "c5141199f4cfb17d749c36ba8cfe4b25f838da67c22f0fec40228b6b9c3d19df"
 
-PACKAGES =+ "lib${PN} lib${PN}-dev"
+PACKAGES =+ "lib${BPN} lib${BPN}-dev"
 
 FILES_${PN} = " ${bindir}/faac "
 FILES_lib${PN} = " ${libdir}/libfaac.so.*"
-- 
1.8.1.2


