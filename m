Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Sv6O4-0002Ck-Vg
	for openembedded-devel@lists.openembedded.org;
	Sat, 28 Jul 2012 14:44:53 +0200
Received: by weyr6 with SMTP id r6so2407918wey.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 28 Jul 2012 05:33:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=bMevSISfRSOMDBJGJqPEHkQTbsd+Y+0THZDFCkP5TFY=;
	b=yoFtG5MxzvjuJAs4mKyE5IipdDk4/ObiOXhWodsTkGIeN/Fa2Fp+2rwqETPSkZjQG1
	V/L2U9UAhv7MQd06Nkl66UFIoPB+PqVXa3ryqC0MqVJdyRoPV7NxJFKqNCqg6sKy+xSO
	vCFqtq+V8ar/hUN9mgM465bhiPFEmN7Td94ye67DNP8ZVKWFpuwhDc1bev7Ng6HqWV4F
	XHE9/MqvDVeHN9VQygXRhYZ/bBK3YRpzx6z2juOTFXBBMU4khD1YNKv/Eyo9z2NuHuW4
	GafBzXs4pTA0Qb/W4UnAatpSXnqE7eQw1ZzAeKhlMSnKmfLFWbX7u7lhHoT9hVHCcbZy
	nQuQ==
Received: by 10.180.81.66 with SMTP id y2mr13253915wix.22.1343478799989;
	Sat, 28 Jul 2012 05:33:19 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id l5sm6056066wix.5.2012.07.28.05.33.18
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 28 Jul 2012 05:33:19 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 28 Jul 2012 14:33:11 +0200
Message-Id: <4438b2cc31435f690f1824140e1c157ec7afdc44.1343478744.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
In-Reply-To: <cover.1343478744.git.Martin.Jansa@gmail.com>
References: <cover.1343478744.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1343478744.git.Martin.Jansa@gmail.com>
References: <cover.1343478744.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 1/5] tcpdump: bump PR to rebuild against libpcap1 instead libpcap
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
X-List-Received-Date: Sat, 28 Jul 2012 12:44:53 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/tcpdump/tcpdump_4.1.1.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta-oe/recipes-support/tcpdump/tcpdump_4.1.1.bb b/meta-oe/recipes-support/tcpdump/tcpdump_4.1.1.bb
index 9fd0ac0..46b19a1 100644
--- a/meta-oe/recipes-support/tcpdump/tcpdump_4.1.1.bb
+++ b/meta-oe/recipes-support/tcpdump/tcpdump_4.1.1.bb
@@ -4,7 +4,7 @@ LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1d4b0366557951c84a94fabe3529f867"
 SECTION = "console/network"
 DEPENDS = "libpcap"
-PR = "r1"
+PR = "r2"
 
 SRC_URI = " \
 	http://www.tcpdump.org/release/tcpdump-${PV}.tar.gz \
-- 
1.7.8.6



