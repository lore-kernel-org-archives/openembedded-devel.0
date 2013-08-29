Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f181.google.com (mail-ea0-f181.google.com
	[209.85.215.181])
	by mail.openembedded.org (Postfix) with ESMTP id 436DA6BE60
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Aug 2013 15:51:59 +0000 (UTC)
Received: by mail-ea0-f181.google.com with SMTP id d10so339542eaj.40
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Aug 2013 08:52:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=mOIvhE1bqmj7+kd8ExkzIUkrL2ncDfneHQwG0CO5tBg=;
	b=E9EAZE40SHBo8iukUe1si0Lx0ffowkG5YUGejyP6Z0leXST2tQFT99Bl8hpvMQTw4b
	Ro1bRbfbUtFH38ySM3uAz5MYXmtgOTQYnSWcKw/UAAcU4vL1gshIG2amftGAx2UCnCHH
	30rcA8dq41BoKoAvjOcVU6S4x6gNGRLcLhv2Ex9kl89jZJNfb6J95cK9gPZmg4q3xUlV
	Pc4LjAA2Epxf7aXHPX5L407DAJlbbs49gdN+oYy9Ya09Ty95a/hLchN1GKuUGblrHSDB
	MTl6N65vtEQbIcgzQpRg3Ho0dm1YPokW5rcenVhQDBQW+9pCCWWrehIP1MmyaXmoRRRs
	61Lw==
X-Received: by 10.14.94.133 with SMTP id n5mr4335212eef.71.1377791520299;
	Thu, 29 Aug 2013 08:52:00 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	i1sm47163002eeg.0.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 29 Aug 2013 08:51:59 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 29 Aug 2013 17:51:46 +0200
Message-Id: <f2c7d233b9a563eb38bf4abcfa495ea7a257cbbb.1377791378.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1377791377.git.Martin.Jansa@gmail.com>
References: <cover.1377791377.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1377791377.git.Martin.Jansa@gmail.com>
References: <cover.1377791377.git.Martin.Jansa@gmail.com>
Subject: [WIP][PATCH 53/66] maliit-framework: Add dependency on gtk+3
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
X-List-Received-Date: Thu, 29 Aug 2013 15:52:00 -0000

* it's autodetected and configure doesn't allow to explicitly disable it

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/maliit/maliit-framework_git.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-support/maliit/maliit-framework_git.bb b/meta-oe/recipes-support/maliit/maliit-framework_git.bb
index 15719f4..ae20fa3 100644
--- a/meta-oe/recipes-support/maliit/maliit-framework_git.bb
+++ b/meta-oe/recipes-support/maliit/maliit-framework_git.bb
@@ -23,6 +23,7 @@ PR = "r1"
 PACKAGES =+ "${PN}-gtk"
 GTKIMMODULES_PACKAGES = "${PN}-gtk"
 
+DEPENDS = "gtk+3"
 RDEPENDS_${PN} = "qt4-plugin-inputmethod-imsw-multi libqtsvg4"
 
 RRECOMMENDS_${PN} = "maliit-plugins"
-- 
1.8.3.2


