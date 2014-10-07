Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f175.google.com (mail-wi0-f175.google.com
	[209.85.212.175])
	by mail.openembedded.org (Postfix) with ESMTP id 40B2F717C4
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  7 Oct 2014 00:50:00 +0000 (UTC)
Received: by mail-wi0-f175.google.com with SMTP id d1so6296557wiv.8
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 06 Oct 2014 17:50:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=B69WrUFo+TSqdaOaZwPNvqTQLkNzmDi4l3gxQr7QgCc=;
	b=ruJlmSVJ2Tk3M7yX9uIbcagQ+grtW3RBXXFb7Tw8GcqZNdBD7j+aSnSmShH5tenLSw
	cwfiQWHFhtn1MA4bLp8NDUjJ2kqed96cls0A/093oPtDOBsGhpZfSbPA3y1qahWCCpxr
	LGrpiZgDqgv3rlLxFcn/XhoNLb8lCfLcIub3Ws15SiGb8FGfobOPq2HYepWJqF5/tH/m
	YmBt38T6FulhhRz7xjDUV/4417VHKYfhJxfqujQlDTaapcz6ej2W/5DbEk8QmKYn2gDL
	gymHISzhMmup/fePnqjIsajZh+8yqnsLwPrJFAUvpimlHYTli+/BSsFSBBb0KNdteBTg
	OKMQ==
X-Received: by 10.194.184.111 with SMTP id et15mr423328wjc.14.1412643001963;
	Mon, 06 Oct 2014 17:50:01 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	fa7sm18856031wjd.27.2014.10.06.17.50.01 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 06 Oct 2014 17:50:01 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  7 Oct 2014 02:51:01 +0200
Message-Id: <1412643061-14339-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.1.1
Subject: [meta-oe][PATCH] python-matplotlib: blacklist because of conflict with python-dateutil
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
X-List-Received-Date: Tue, 07 Oct 2014 00:50:11 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-python/recipes-devtools/python/python-matplotlib_1.1.0.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python-matplotlib_1.1.0.bb b/meta-python/recipes-devtools/python/python-matplotlib_1.1.0.bb
index 7bb61fd..6c8a202 100644
--- a/meta-python/recipes-devtools/python/python-matplotlib_1.1.0.bb
+++ b/meta-python/recipes-devtools/python/python-matplotlib_1.1.0.bb
@@ -7,6 +7,9 @@ PR = "r1"
 DEPENDS += "python-numpy freetype libpng"
 RDEPENDS_${PN} = "python-core python-distutils python-numpy freetype libpng"
 
+PNBLACKLIST[python-matplotlib] = "CONFLICT: 34 files with python-dateutil"
+# e.g. sysroots/qemux86-64/usr/lib/python2.7/site-packages/dateutil/tzwin.pyc
+
 SRC_URI = "${SOURCEFORGE_MIRROR}/matplotlib/matplotlib-${PV}.tar.gz \
            file://fix_setup.patch \
            file://fix_setupext.patch \
-- 
2.1.1


