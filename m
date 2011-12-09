Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RYw0E-0005ce-CL
	for openembedded-devel@lists.openembedded.org;
	Fri, 09 Dec 2011 09:40:22 +0100
Received: by eaal1 with SMTP id l1so2333eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 09 Dec 2011 00:33:31 -0800 (PST)
Received: by 10.213.8.73 with SMTP id g9mr6330ebg.42.1323419611353;
	Fri, 09 Dec 2011 00:33:31 -0800 (PST)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id x12sm28359616eef.9.2011.12.09.00.33.30
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 09 Dec 2011 00:33:30 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  9 Dec 2011 09:33:22 +0100
Message-Id: <1323419602-13546-2-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1323419602-13546-1-git-send-email-koen@dominion.thruhere.net>
References: <1323419602-13546-1-git-send-email-koen@dominion.thruhere.net>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-efl 2/2] expedite: update runtime dependencies to match evas update
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
X-List-Received-Date: Fri, 09 Dec 2011 08:40:22 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta-efl/recipes-efl/e17/expedite_svn.bb |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/meta-efl/recipes-efl/e17/expedite_svn.bb b/meta-efl/recipes-efl/e17/expedite_svn.bb
index ee91c98..dfcbcde 100644
--- a/meta-efl/recipes-efl/e17/expedite_svn.bb
+++ b/meta-efl/recipes-efl/e17/expedite_svn.bb
@@ -1,9 +1,10 @@
 DESCRIPTION = "Expedite is a comprehensive benchmarking suite for Evas"
 DEPENDS = "eet evas"
-RDEPENDS_${PN} = "expedite-themes evas-engine-buffer evas-engine-fb evas-engine-software-generic evas-engine-software-x11 evas-engine-gl-x11 evas-loader-png"
 LICENSE = "MIT BSD"
+
 SRCREV = "${EFL_SRCREV_1.1.0}"
 PV = "1.1.0+svnr${SRCPV}"
+PR = "r1"
 
 inherit e
 SRC_URI = "${E_SVN}/trunk;module=${SRCNAME};proto=http;scmdata=keep"
@@ -27,3 +28,5 @@ EXTRA_OECONF = "\
 "
 
 FILES_${PN} += "${datadir}"
+RDEPENDS_${PN} = "expedite-themes evas-engine-fb evas-engine-software-generic evas-engine-software-x11 evas-engine-gl-x11 evas-loader-png"
+
-- 
1.7.2.5



