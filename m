Return-Path: <philip.balister@gmail.com>
Received: from mail-qg0-f50.google.com (mail-qg0-f50.google.com
	[209.85.192.50])
	by mail.openembedded.org (Postfix) with ESMTP id 835E26B6F5
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  1 Dec 2015 17:26:28 +0000 (UTC)
Received: by qgcc31 with SMTP id c31so10759060qgc.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Dec 2015 09:26:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=GcLJH6xhS4dkoucBAAdsQNPi6euPcZ/SDKQB/q66Aro=;
	b=UcowSlgXhjybIFyyFMOD4p6tF93B5BXOPg1GHWMKYyl53/ZIVCzMzK7qU+TpFS7paF
	pAlzm445AC+Yvu2tP4fKiTZVP7zmQQDtc15Kw1BA0qS1dKr3klb2DV8gly3BRltjBXAq
	mMlqmUgxkwz5dEh/ucm7zZnhpMMAivW63N5TvcZQ5nwzZ2K3bVioEvcGUEi0JnaoL2Wt
	JkgUXkOcvKzcFMUEx1o4TzDu1hQzKN/caJr/Fc6KTSnKv5I3JdV1r7qegQ6OLBj9Ymsu
	FEbu6nIeT5nds3poPg1NdxPgHAsdU83GEUcxl8/JVHxHk5bdFttSE9219AfRwynR9p7X
	isgA==
X-Received: by 10.140.96.76 with SMTP id j70mr82735296qge.100.1448990788824;
	Tue, 01 Dec 2015 09:26:28 -0800 (PST)
Received: from thuvia.localdomain (pool-108-44-110-59.ronkva.east.verizon.net.
	[108.44.110.59])
	by smtp.gmail.com with ESMTPSA id s105sm88022qge.40.2015.12.01.09.26.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 01 Dec 2015 09:26:28 -0800 (PST)
Sender: Philip Balister <philip.balister@gmail.com>
From: Philip Balister <philip@balister.org>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  1 Dec 2015 12:26:20 -0500
Message-Id: <1448990780-11060-3-git-send-email-philip@balister.org>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1448990780-11060-1-git-send-email-philip@balister.org>
References: <1448990780-11060-1-git-send-email-philip@balister.org>
Subject: [meta-python][PATCH 3/3] python-bitarray: Add new recipe.
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
X-List-Received-Date: Tue, 01 Dec 2015 17:26:29 -0000

Signed-off-by: Philip Balister <philip@balister.org>
---
 .../recipes-devtools/python/python-bitarray_0.8.1.bb | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-bitarray_0.8.1.bb

diff --git a/meta-python/recipes-devtools/python/python-bitarray_0.8.1.bb b/meta-python/recipes-devtools/python/python-bitarray_0.8.1.bb
new file mode 100644
index 0000000..dd79e2c
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-bitarray_0.8.1.bb
@@ -0,0 +1,20 @@
+SUMMARY = "A high-level Python efficient arrays of booleans -- C extension"
+HOMEPAGE = "https://github.com/ilanschnell/bitarray"
+SECTION = "devel/python"
+LICENSE = "PSF"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=3ba469353f9f2a244b2075902351e37d"
+
+SRCNAME = "bitarray"
+
+SRC_URI = "https://pypi.python.org/packages/source/b/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "3825184f54f4d93508a28031b4c65d3b"
+SRC_URI[sha256sum] = "7da501356e48a83c61f479393681c1bc4b94e5a34ace7e08cb29e7dd9290ab18"
+
+S = "${WORKDIR}/${SRCNAME}-${PV}"
+
+inherit setuptools
+
+FILES_${PN} += "${datadir}/bitarray"
+
+BBCLASSEXTEND = "nativesdk"
-- 
2.1.0


