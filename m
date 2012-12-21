Received: from mail-ea0-f178.google.com ([209.85.215.178])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Tm3OH-00050U-Jj
	for openembedded-devel@lists.openembedded.org;
	Fri, 21 Dec 2012 15:16:16 +0100
Received: by mail-ea0-f178.google.com with SMTP id k11so1939285eaa.37
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Dec 2012 06:01:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references:x-gm-message-state;
	bh=PVYxCojUqgFbGecUig2tPCsXGS/lEuY5Kt/SIldxk/I=;
	b=U0YEHM2SPGa/jrAyvjuMFyNmnLyJgI3x+tLx5UQ3rSN39j0d5hAQJftwBBQ2dli4Lp
	2c+9Mq3wuKTl6Y1TbZMlQRgp6gI3ff+n8XyDOmIogWZUxb0Rthrj5o1iXOXJlq/jAM9z
	wVGDjV6wAOVRuWQqk1qw8WCy4o0UKq7xNkLzZyvIDwJjZ0HXdFv2Gs4ohl6u5mFAmjva
	BIx7Vu/FltohAsRrEoKE5iYPTmLMnO2DvaLmUNuJDEiL47YdDhn0WjUA4TdDoSfXL9BY
	J5+gpdcjgnqncxgXCD+Z3j9ia6Vq4zfvJ2OZAyWhK+4FxJOBKuFrje4xX63n3LXnSu9I
	gCnw==
X-Received: by 10.14.205.199 with SMTP id j47mr32081260eeo.26.1356098471897;
	Fri, 21 Dec 2012 06:01:11 -0800 (PST)
Received: from localhost.localdomain (ip4da2a5ae.direct-adsl.nl.
	[77.162.165.174])
	by mx.google.com with ESMTPS id w44sm21810573eep.6.2012.12.21.06.01.10
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 21 Dec 2012 06:01:11 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 21 Dec 2012 15:00:49 +0100
Message-Id: <1356098450-27475-5-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <1356098450-27475-1-git-send-email-koen@dominion.thruhere.net>
References: <1356098450-27475-1-git-send-email-koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQn4KMs5ijU5Q3sm3mRRuoA7Z8WZ3FJkz5jSaxoRzRGkRKaF/nyyueDsH7nT5NZ7A7v78IaZ
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-oe][meta-multimedia][PATCH 5/6] wscan: add 20121111
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
X-List-Received-Date: Fri, 21 Dec 2012 14:16:28 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 .../recipes-dvb/wscan/wscan_20121111.bb            |   16 ++++++++++++++++
 1 files changed, 16 insertions(+), 0 deletions(-)
 create mode 100644 meta-multimedia/recipes-dvb/wscan/wscan_20121111.bb

diff --git a/meta-multimedia/recipes-dvb/wscan/wscan_20121111.bb b/meta-multimedia/recipes-dvb/wscan/wscan_20121111.bb
new file mode 100644
index 0000000..9254c43
--- /dev/null
+++ b/meta-multimedia/recipes-dvb/wscan/wscan_20121111.bb
@@ -0,0 +1,16 @@
+SUMMARY = "Wscan is an ATSC/DVB-C/S/T channel scanner that doesn't require an initial frequency table"
+HOMEPAGE = "http://wirbel.htpc-forum.de/w_scan/index2.html"
+
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=892f569a555ba9c07a568a7c0c4fa63a"
+
+SRC_URI = "http://wirbel.htpc-forum.de/w_scan/w_scan-${PV}.tar.bz2"
+SRC_URI[md5sum] = "30da05747fed9988e11ebc7745f5e71f"
+SRC_URI[sha256sum] = "5e51e5f1c124a8ed70608b4dbf7376adb2b1bf6a48a65b746076263b2589afe5"
+
+S = "${WORKDIR}/w_scan-${PV}"
+
+inherit autotools
+
+FILES_${PN} += "${datadir}"
+
-- 
1.7.7.6



