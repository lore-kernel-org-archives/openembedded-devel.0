Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-we0-f173.google.com (mail-we0-f173.google.com
	[74.125.82.173])
	by mail.openembedded.org (Postfix) with ESMTP id A12176B720
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  1 Apr 2014 15:22:06 +0000 (UTC)
Received: by mail-we0-f173.google.com with SMTP id w61so6538040wes.32
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Apr 2014 08:22:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=HbGrVkyqa1DhDmmg1c4gDzO41d/1/hzF1czMJEB9TyA=;
	b=nDIICRhhgbp4IlwHi9GUu6SzEPuod2usLuGSidqj20zDnHCKjem+wHvJZ5Q9QeBc/i
	2DxOHrb64nmA3fI36guIaBMvnz98aXQlLGzpNcxDLlN53dMPHeuFEAmeqPz7YKkRrna7
	NbxpOgNEiOj7RfWmb4cHTVLhufkG2kWnWHATJn3PbYetmk9dHvXpfd/jGD+Y7KOxU4wu
	TBuDjUwZ+PP3AUlQ3SO0JkEiT5wA3OMDAoTQ010bP3QYBa8H5HwdBGqzXBTuq7hq4WZH
	jdDbXWDkOksZjmpNO1wzgKcdogALKzkfZ8xWmHdg9s6XUQOkeF0DzMmykgV74k3AcxtY
	4xgA==
X-Received: by 10.194.63.46 with SMTP id d14mr23297117wjs.24.1396365726719;
	Tue, 01 Apr 2014 08:22:06 -0700 (PDT)
Received: from localhost.localdomain (ip-176-198-252-199.unitymediagroup.de.
	[176.198.252.199])
	by mx.google.com with ESMTPSA id 48sm41246865eee.2.2014.04.01.08.22.05
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 01 Apr 2014 08:22:06 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  1 Apr 2014 17:21:44 +0200
Message-Id: <1396365706-14220-9-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1396365706-14220-1-git-send-email-schnitzeltony@googlemail.com>
References: <1396365706-14220-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH][meta-xfce/meta-gnome 08/10] xfce4-dev-tools: update to 4.11.0
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
X-List-Received-Date: Tue, 01 Apr 2014 15:22:07 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../{xfce4-dev-tools_4.10.0.bb => xfce4-dev-tools_4.11.0.bb}          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-xfce/xfce4-dev-tools/{xfce4-dev-tools_4.10.0.bb => xfce4-dev-tools_4.11.0.bb} (78%)

diff --git a/meta-xfce/recipes-xfce/xfce4-dev-tools/xfce4-dev-tools_4.10.0.bb b/meta-xfce/recipes-xfce/xfce4-dev-tools/xfce4-dev-tools_4.11.0.bb
similarity index 78%
rename from meta-xfce/recipes-xfce/xfce4-dev-tools/xfce4-dev-tools_4.10.0.bb
rename to meta-xfce/recipes-xfce/xfce4-dev-tools/xfce4-dev-tools_4.11.0.bb
index 68e848a..3312fbd 100644
--- a/meta-xfce/recipes-xfce/xfce4-dev-tools/xfce4-dev-tools_4.10.0.bb
+++ b/meta-xfce/recipes-xfce/xfce4-dev-tools/xfce4-dev-tools_4.11.0.bb
@@ -10,8 +10,8 @@ inherit autotools
 BBCLASSEXTEND = "native"
 
 SRC_URI = "http://archive.xfce.org/src/xfce/${BPN}/${@'${PV}'[0:4]}/${BPN}-${PV}.tar.bz2"
-SRC_URI[md5sum] = "372b74f432e7e02d946c2ea9d3de2805"
-SRC_URI[sha256sum] = "f79649bbfbbf16881494ee9f67035063765aec12e23ab9bac31de2c8a4f32bf8"
+SRC_URI[md5sum] = "36112d0256092c30bd1b47105c547edf"
+SRC_URI[sha256sum] = "2dccdd4935716a97db28464ba2403572ce03134fd7adf294e1a59eaf297e6555"
 
 do_install_append() {
     install -d ${D}${datadir}/aclocal
-- 
1.8.3.1


