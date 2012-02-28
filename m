Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1S2Nyj-0001cG-Jc
	for openembedded-devel@lists.openembedded.org;
	Tue, 28 Feb 2012 15:24:33 +0100
Received: by mail-ey0-f175.google.com with SMTP id e1so881086eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Feb 2012 06:16:08 -0800 (PST)
Received-SPF: pass (google.com: domain of martin.jansa@gmail.com designates
	10.14.136.139 as permitted sender) client-ip=10.14.136.139; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of martin.jansa@gmail.com
	designates 10.14.136.139 as permitted sender)
	smtp.mail=martin.jansa@gmail.com;
	dkim=pass header.i=martin.jansa@gmail.com
Received: from mr.google.com ([10.14.136.139])
	by 10.14.136.139 with SMTP id w11mr11221293eei.1.1330438568557
	(num_hops = 1); Tue, 28 Feb 2012 06:16:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=2EgL5iaIIw+84ZhYYeLRCQXQwBaUUijBL8UH94tUb4U=;
	b=CifBmO2q+buY93fOAxSm8VqBZyiutFtAyXBTqN+jxRaRC1zuZ9gBUvdkKQHDnf5dQ9
	NA2BnuOnDKYkuANosLtMU0V2O1P/LUAHXz2EOXK3ihw2GQMAlGszgGU/rik64IstIa2E
	AkSjvBUVxO2x8mxinREABTvNocXeVfshcoFwQ=
Received: by 10.14.136.139 with SMTP id w11mr8392953eei.1.1330438568483;
	Tue, 28 Feb 2012 06:16:08 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id z7sm24019174eef.9.2012.02.28.06.16.07
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 28 Feb 2012 06:16:07 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 28 Feb 2012 15:14:42 +0100
Message-Id: <02a78ade61e9f193b7089fa9859c6b23ec07e7d0.1330438403.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.5
In-Reply-To: <6999c8bfc7f9aefbaba4f93d26e7540dc74e3472.1330438403.git.Martin.Jansa@gmail.com>
References: <6999c8bfc7f9aefbaba4f93d26e7540dc74e3472.1330438403.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1330438403.git.Martin.Jansa@gmail.com>
References: <cover.1330438403.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][meta-efl][PATCH 11/14] lcms: bump PR to rebuild after libtiff3->libtiff5 change
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
X-List-Received-Date: Tue, 28 Feb 2012 14:24:33 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/lcms/lcms_1.17.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta-oe/recipes-support/lcms/lcms_1.17.bb b/meta-oe/recipes-support/lcms/lcms_1.17.bb
index 8ec516d..efa6402 100644
--- a/meta-oe/recipes-support/lcms/lcms_1.17.bb
+++ b/meta-oe/recipes-support/lcms/lcms_1.17.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=156745cad721a8783cb847e82b79f586"
 SRC_URI = "${SOURCEFORGE_MIRROR}/lcms/lcms-${PV}.tar.gz"
 
-PR = "r2"
+PR = "r3"
 
 BBCLASSEXTEND = "native"
 
-- 
1.7.8.5



