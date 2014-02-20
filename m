Return-Path: <raj.khem@gmail.com>
Received: from mail-pb0-f48.google.com (mail-pb0-f48.google.com
	[209.85.160.48])
	by mail.openembedded.org (Postfix) with ESMTP id 546406E6F0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Feb 2014 06:10:15 +0000 (UTC)
Received: by mail-pb0-f48.google.com with SMTP id rr13so1454622pbb.35
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Feb 2014 22:10:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=GGii/l6FvXbWvU0HCxx9lzpUyGl1YDjjaY4mlo08ul4=;
	b=DDgOIxxG0PisrvHG3h01/WsHDtdL8REpUTLVoadsymIo3vxbzugSTmSTc6JPEjc8Qv
	qT2gJM2Zy83/dhNoBnWw/wVB8miYVWHzFGibB+rJSSX0zsu+cJ7gJxRcVHNsecul9VMn
	is7jHaZ1apgMHWdfSrbFiRP29nObFLzGHGrMpG8bcblBrogmiwHj/rOMBIjIg5XhMNPs
	MUnHmzg2wg/pFsrUmTjjSn/DfVsfwuRvWDFNVSqi2md5Lsfl7KYQdjt8vMqLmQ4Vcf3W
	dl+HSPhg4BEsz4yeFHZyl9+BXhGRDT56nVkFnQn/zOAERreSHvDfOpw6OoIXhq8O6CiF
	pmvA==
X-Received: by 10.66.129.133 with SMTP id nw5mr40355pab.98.1392876616178;
	Wed, 19 Feb 2014 22:10:16 -0800 (PST)
Received: from localhost.localdomain
	(99-57-140-30.lightspeed.sntcca.sbcglobal.net. [99.57.140.30])
	by mx.google.com with ESMTPSA id ns7sm7007572pbc.32.2014.02.19.22.10.14
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 19 Feb 2014 22:10:15 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 19 Feb 2014 22:11:24 -0800
Message-Id: <1392876684-2422-2-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.9.0
In-Reply-To: <1392876684-2422-1-git-send-email-raj.khem@gmail.com>
References: <1392876684-2422-1-git-send-email-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/2] python-cloudeebus: DEPEND on python-distribute instead of python-setuptools
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
X-List-Received-Date: Thu, 20 Feb 2014 06:10:15 -0000

python-setuptools has been removed in OE-Core

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-devtools/python/python-cloudeebus_0.6.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/python/python-cloudeebus_0.6.0.bb b/meta-oe/recipes-devtools/python/python-cloudeebus_0.6.0.bb
index 5c1fa9c..120a8a7 100644
--- a/meta-oe/recipes-devtools/python/python-cloudeebus_0.6.0.bb
+++ b/meta-oe/recipes-devtools/python/python-cloudeebus_0.6.0.bb
@@ -11,7 +11,7 @@ S = "${WORKDIR}/git"
 
 inherit distutils 
 
-DEPENDS_${PN} = "python python-setuptools"
+DEPENDS_${PN} = "python python-distribute"
 RDEPENDS_${PN} = "python python-dbus python-json python-argparse python-pygobject python-autobahn python-twisted python-subprocess"
 
 do_install_prepend() {
-- 
1.9.0


