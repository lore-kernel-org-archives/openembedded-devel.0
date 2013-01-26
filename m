Received: from mail-pb0-f49.google.com ([209.85.160.49])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1TyzlF-0002kK-2P
	for openembedded-devel@lists.openembedded.org;
	Sat, 26 Jan 2013 08:01:15 +0100
Received: by mail-pb0-f49.google.com with SMTP id xa12so604931pbc.8
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Jan 2013 22:45:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=DN5+uaMq7R/5Dsv7BW2lIRwfDL+gsUgosbulqSYR62w=;
	b=IVgswPwG/S44C6I5Ktvz4azTvZUz6K9hko/zonu2veAs8Hm0IuKCOlc3VPI40mdTEf
	6rts9I98SNbjRXjO6g2eQz+bRFcBc3l5JhZy3SdOxczUvmMMvaQFpXO8MjTNwU47cIJI
	l+pnWWU9Q5pYZJY5pLc4bILjMXjo4HiiiMNUjLGCHys/XpxPIRKttuW5PtVxMywFFbEZ
	9+nU/K0hRSC8HQg5pFADtSJWln28trtJLkwuUfAqrCVOS3DcPxazdbMgfCD6TOo2jho+
	7Ac2ffWJoFU1Wr99Dyt4HG/j+jLRnctIqreEkJVg+oSeTuwujC70puIc65YXVIpwX7B2
	oOzw==
X-Received: by 10.66.80.65 with SMTP id p1mr19342747pax.20.1359182733250;
	Fri, 25 Jan 2013 22:45:33 -0800 (PST)
Received: from isis.gateway.2wire.net
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPS id ux4sm2086673pbc.25.2013.01.25.22.45.32
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 25 Jan 2013 22:45:32 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 25 Jan 2013 22:45:15 -0800
Message-Id: <1359182715-3063-2-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1359182715-3063-1-git-send-email-raj.khem@gmail.com>
References: <1359182715-3063-1-git-send-email-raj.khem@gmail.com>
Subject: [meta-networking][PATCH 2/2] ebtables, arptables: add perl as runtime dependency
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
X-List-Received-Date: Sat, 26 Jan 2013 07:01:20 -0000

Fixes errors like

| Computing transaction...error: Can't install
arptables-0.0.3+4-r0.0@ppce500v2: no package provides /usr/bin/perl

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-filter/ebtables/ebtables_2.0.10-4.bb   |    2 ++
 .../recipes-support/arptables/arptables_0.0.3-4.bb |    2 ++
 2 files changed, 4 insertions(+)

diff --git a/meta-networking/recipes-filter/ebtables/ebtables_2.0.10-4.bb b/meta-networking/recipes-filter/ebtables/ebtables_2.0.10-4.bb
index 2596d2f..4e9b0bc 100644
--- a/meta-networking/recipes-filter/ebtables/ebtables_2.0.10-4.bb
+++ b/meta-networking/recipes-filter/ebtables/ebtables_2.0.10-4.bb
@@ -4,6 +4,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=53b4a999993871a28ab1488fdbd2e73e"
 SECTION = "console/network"
 PR = "r1"
 
+RDEPENDS += "perl"
+
 SRC_URI = "${SOURCEFORGE_MIRROR}/ebtables/ebtables-v${PV}.tar.gz \
            file://installnonroot.patch \
            file://01debian_defaultconfig.patch \
diff --git a/meta-networking/recipes-support/arptables/arptables_0.0.3-4.bb b/meta-networking/recipes-support/arptables/arptables_0.0.3-4.bb
index 71e2600..8da9bb7 100644
--- a/meta-networking/recipes-support/arptables/arptables_0.0.3-4.bb
+++ b/meta-networking/recipes-support/arptables/arptables_0.0.3-4.bb
@@ -3,6 +3,8 @@ PRIORITY = "optional"
 LICENSE = "GPL-2.0"
 SECTION = "console/network"
 
+RDEPENDS += "perl"
+
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
 SRC_URI = " \
 	${SOURCEFORGE_MIRROR}/ebtables/arptables-v${PV}.tar.gz;name=arptables \
-- 
1.7.9.5



