Return-Path: <ticotimo@gmail.com>
Received: from mail-pa0-f51.google.com (mail-pa0-f51.google.com
	[209.85.220.51])
	by mail.openembedded.org (Postfix) with ESMTP id 76F866FCE0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 24 Aug 2014 01:37:52 +0000 (UTC)
Received: by mail-pa0-f51.google.com with SMTP id ey11so18311329pad.24
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 23 Aug 2014 18:37:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=YsFdKXWuHUtw2YsVcUb9H4fMqMufp4BmQsVHrhcwYT4=;
	b=zSXV6NkcZiFUkbmSHg4WrSLBNt3cpAtiEE4Jvvws018WkwXlhN98LRRC4QJmzr8OJm
	tdyPD1qXPSb+D5ihQUp8UmlizXCTjlxfyHijqWz2Q7WaAxeZrllvoC/eHc1JdluD4mZk
	0ozWZ/HOFLF3vxWJ7pZFYe1fWOm5uTjMwaeu+k+5QHs+dohmYPLzbX+whHyYZVTP9rM4
	zzZUIDKZEvsC8sboZlPFdn8qISFNxqwmz4WurHfLMP7RXh5KBRdUELp69m3eMoIEoMrg
	3Ota0o57YjXVKBLDKefKx13X4MyKa3yZCKxBVKht4W/pOqLnadiFnHFlwLvkIoLFOlll
	wmWQ==
X-Received: by 10.68.69.46 with SMTP id b14mr12023021pbu.70.1408844273336;
	Sat, 23 Aug 2014 18:37:53 -0700 (PDT)
Received: from localhost.localdomain (75-128-22-150.dhcp.snlo.ca.charter.com.
	[75.128.22.150])
	by mx.google.com with ESMTPSA id e2sm50481859pdk.54.2014.08.23.18.37.44
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 23 Aug 2014 18:37:52 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <TicoTimo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 23 Aug 2014 18:36:17 -0700
Message-Id: <1408844177-15282-1-git-send-email-TicoTimo@gmail.com>
X-Mailer: git-send-email 1.9.3
Subject: [meta-python][PATCH] python-pyparted: fix rdeps for native
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
X-List-Received-Date: Sun, 24 Aug 2014 01:37:58 -0000

Signed-off-by: Tim Orling <TicoTimo@gmail.com>
---
 meta-python/recipes-extended/python-pyparted/python-pyparted_3.9.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-extended/python-pyparted/python-pyparted_3.9.bb b/meta-python/recipes-extended/python-pyparted/python-pyparted_3.9.bb
index 919b301..bfb4f6f 100644
--- a/meta-python/recipes-extended/python-pyparted/python-pyparted_3.9.bb
+++ b/meta-python/recipes-extended/python-pyparted/python-pyparted_3.9.bb
@@ -18,4 +18,6 @@ S = "${WORKDIR}/pyparted-${PV}"
 inherit distutils
 
 RDEPENDS_${PN} += "python-stringold python-codecs python-math"
+RDEPENDS_${PN}_class-native = ""
+
 BBCLASSEXTEND += "native"
-- 
1.9.3


