Return-Path: <andre.draszik@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id 00F1C74490
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Apr 2018 15:17:40 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id v63so5916895pfk.8
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Apr 2018 08:17:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=xqqqUnolAisQ9Ege/psCfcO45vkck2J7nDpoaWaZ1Us=;
	b=tcUTtcabSmmReCZ++SLUwcuFYoJkGPzdc8i8zEkkfbvvJl+BV7d9L8g/5THZ2l7JU2
	8oNa6lADaFm+6Djt70uzvnyDl7w+21FuJrZichZP603t6D2yNQ+dHXfdFoPrtzTzxXLV
	QLCETa1Arh16eMs4/NQlxoavB3IzqaupriXjkGJQNL1hvc7uSZAgWht5qZBnmZJ0qfWK
	UYZG4oqytEsdlN30dEqoptIciY8Jaj9eWma3nholywV105GttJKlcD6yy8Av1Mjz5man
	/lOP1PPpcgztFS2eDHW+5PzwXFja6IeOdz5+JenMMSD6GWkvR2ndNC/WKY1NAwP1HyIo
	ldzQ==
X-Gm-Message-State: ALQs6tBdet+c6Vxp82vxtq+ShTcygjlw+7FB+KnN58NcHAgZ+sHQxdkQ
	SMK39AWjXjDY09ikEc6uQWZuzPkD
X-Google-Smtp-Source: AB8JxZqXDIL9fa5HGBmqFrTvmzlqFp/XfTnZlew3TlrbAx3uKSEDPBLo/UlNSnrxSFPyWzjpqfGFrw==
X-Received: by 10.98.182.16 with SMTP id j16mr5352219pff.17.1524669461597;
	Wed, 25 Apr 2018 08:17:41 -0700 (PDT)
Received: from tfsielt31850.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id n4sm30398062pfn.2.2018.04.25.08.17.39
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 25 Apr 2018 08:17:41 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 25 Apr 2018 16:17:35 +0100
Message-Id: <20180425151735.9983-1-git@andred.net>
X-Mailer: git-send-email 2.16.2
MIME-Version: 1.0
Subject: [meta-java][PATCH] openjdk-8: give downloaded files a more descriptive name
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
X-List-Received-Date: Wed, 25 Apr 2018 15:17:41 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: André Draszik <andre.draszik@jci.com>

Rather than using the HG (mercurial) changeset IDs directly,
add a more descriptive part to the file name. This can help
with download cache management.

Signed-off-by: André Draszik <andre.draszik@jci.com>
---
 recipes-core/openjdk/openjdk-8-common.inc         | 14 ++++++-------
 recipes-core/openjdk/openjdk-8-release-16xbyy.inc | 24 +++++++++++++++--------
 2 files changed, 23 insertions(+), 15 deletions(-)

diff --git a/recipes-core/openjdk/openjdk-8-common.inc b/recipes-core/openjdk/openjdk-8-common.inc
index d8b38f5..2c68462 100644
--- a/recipes-core/openjdk/openjdk-8-common.inc
+++ b/recipes-core/openjdk/openjdk-8-common.inc
@@ -30,13 +30,13 @@ SRC_URI = " \
 do_unpack_extract_submodules () {
     cd "${S}"
     # tar --transform
-    tar xjf ${WORKDIR}/${CORBA_FILE} --transform "s,-${CORBA_CHANGESET},,g"
-    tar xjf ${WORKDIR}/${HOTSPOT_FILE} --transform "s,-${HOTSPOT_CHANGESET},,g"
-    tar xjf ${WORKDIR}/${JAXP_FILE} --transform "s,-${JAXP_CHANGESET},,g"
-    tar xjf ${WORKDIR}/${JAXWS_FILE} --transform "s,-${JAXWS_CHANGESET},,g"
-    tar xjf ${WORKDIR}/${JDK_FILE} --transform "s,-${JDK_CHANGESET},,g"
-    tar xjf ${WORKDIR}/${LANGTOOLS_FILE} --transform "s,-${LANGTOOLS_CHANGESET},,g"
-    tar xjf ${WORKDIR}/${NASHORN_FILE} --transform "s,-${NASHORN_CHANGESET},,g"
+    tar xjf ${WORKDIR}/${CORBA_FILE_LOCAL} --transform "s,-${CORBA_CHANGESET},,g"
+    tar xjf ${WORKDIR}/${HOTSPOT_FILE_LOCAL} --transform "s,-${HOTSPOT_CHANGESET},,g"
+    tar xjf ${WORKDIR}/${JAXP_FILE_LOCAL} --transform "s,-${JAXP_CHANGESET},,g"
+    tar xjf ${WORKDIR}/${JAXWS_FILE_LOCAL} --transform "s,-${JAXWS_CHANGESET},,g"
+    tar xjf ${WORKDIR}/${JDK_FILE_LOCAL} --transform "s,-${JDK_CHANGESET},,g"
+    tar xjf ${WORKDIR}/${LANGTOOLS_FILE_LOCAL} --transform "s,-${LANGTOOLS_CHANGESET},,g"
+    tar xjf ${WORKDIR}/${NASHORN_FILE_LOCAL} --transform "s,-${NASHORN_CHANGESET},,g"
 }
 
 do_unpack_remove_X11_wrappers() {
diff --git a/recipes-core/openjdk/openjdk-8-release-16xbyy.inc b/recipes-core/openjdk/openjdk-8-release-16xbyy.inc
index bd4a349..c1fcda4 100644
--- a/recipes-core/openjdk/openjdk-8-release-16xbyy.inc
+++ b/recipes-core/openjdk/openjdk-8-release-16xbyy.inc
@@ -64,25 +64,33 @@ OPENJDK_HG_U = "jdk8u"
 OPENJDK_HG_URL = "http://hg.openjdk.java.net/${OPENJDK_ARCH_PORT}/${OPENJDK_HG_U}"
 
 OPENJDK_FILE = "${OPENJDK_CHANGESET}.tar.bz2"
-OPENJDK_URI = "${OPENJDK_HG_URL}/archive/${OPENJDK_FILE};name=openjdk"
+OPENJDK_FILE_LOCAL = "openjdk8-${PV}-jdk8u-${OPENJDK_FILE}"
+OPENJDK_URI = "${OPENJDK_HG_URL}/archive/${OPENJDK_FILE};downloadfilename=${OPENJDK_FILE_LOCAL};name=openjdk"
 
 HOTSPOT_FILE = "${HOTSPOT_CHANGESET}.tar.bz2"
-HOTSPOT_URI = "${OPENJDK_HG_URL}/hotspot/archive/${HOTSPOT_FILE};name=hotspot;unpack=false"
+HOTSPOT_FILE_LOCAL = "openjdk8-${PV}-hotspot-${HOTSPOT_FILE}"
+HOTSPOT_URI = "${OPENJDK_HG_URL}/hotspot/archive/${HOTSPOT_FILE};downloadfilename=${HOTSPOT_FILE_LOCAL};name=hotspot;unpack=false"
 
 CORBA_FILE = "${CORBA_CHANGESET}.tar.bz2"
-CORBA_URI = "${OPENJDK_HG_URL}/corba/archive/${CORBA_FILE};name=corba;unpack=false"
+CORBA_FILE_LOCAL = "openjdk8-${PV}-corba-${CORBA_FILE}"
+CORBA_URI = "${OPENJDK_HG_URL}/corba/archive/${CORBA_FILE};downloadfilename=${CORBA_FILE_LOCAL};name=corba;unpack=false"
 
 JAXP_FILE = "${JAXP_CHANGESET}.tar.bz2"
-JAXP_URI = "${OPENJDK_HG_URL}/jaxp/archive/${JAXP_FILE};name=jaxp;unpack=false"
+JAXP_FILE_LOCAL = "openjdk8-${PV}-jaxp-${JAXP_FILE}"
+JAXP_URI = "${OPENJDK_HG_URL}/jaxp/archive/${JAXP_FILE};downloadfilename=${JAXP_FILE_LOCAL};name=jaxp;unpack=false"
 
 JAXWS_FILE = "${JAXWS_CHANGESET}.tar.bz2"
-JAXWS_URI = "${OPENJDK_HG_URL}/jaxws/archive/${JAXWS_FILE};name=jaxws;unpack=false"
+JAXWS_FILE_LOCAL = "openjdk8-${PV}-jaxws-${JAXWS_FILE}"
+JAXWS_URI = "${OPENJDK_HG_URL}/jaxws/archive/${JAXWS_FILE};downloadfilename=${JAXWS_FILE_LOCAL};name=jaxws;unpack=false"
 
 JDK_FILE = "${JDK_CHANGESET}.tar.bz2"
-JDK_URI = "${OPENJDK_HG_URL}/jdk/archive/${JDK_FILE};name=jdk;unpack=false"
+JDK_FILE_LOCAL = "openjdk8-${PV}-jdk-${JDK_FILE}"
+JDK_URI = "${OPENJDK_HG_URL}/jdk/archive/${JDK_FILE};downloadfilename=${JDK_FILE_LOCAL};name=jdk;unpack=false"
 
 LANGTOOLS_FILE = "${LANGTOOLS_CHANGESET}.tar.bz2"
-LANGTOOLS_URI = "${OPENJDK_HG_URL}/langtools/archive/${LANGTOOLS_FILE};name=langtools;unpack=false"
+LANGTOOLS_FILE_LOCAL = "openjdk8-${PV}-langtools-${LANGTOOLS_FILE}"
+LANGTOOLS_URI = "${OPENJDK_HG_URL}/langtools/archive/${LANGTOOLS_FILE};downloadfilename=${LANGTOOLS_FILE_LOCAL};name=langtools;unpack=false"
 
 NASHORN_FILE = "${NASHORN_CHANGESET}.tar.bz2"
-NASHORN_URI = "${OPENJDK_HG_URL}/nashorn/archive/${NASHORN_FILE};name=nashorn;unpack=false"
+NASHORN_FILE_LOCAL = "openjdk8-${PV}-nashorn-${NASHORN_FILE}"
+NASHORN_URI = "${OPENJDK_HG_URL}/nashorn/archive/${NASHORN_FILE};downloadfilename=${NASHORN_FILE_LOCAL};name=nashorn;unpack=false"
-- 
2.16.2


