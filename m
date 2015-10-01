Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f175.google.com (mail-wi0-f175.google.com
	[209.85.212.175])
	by mail.openembedded.org (Postfix) with ESMTP id 77D39762A2
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 Oct 2015 15:29:05 +0000 (UTC)
Received: by wicfx3 with SMTP id fx3so34066976wic.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 Oct 2015 08:29:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=r4fBWqLvoZ7ZrnXa8QTyrh3Bd7Ewe2GfaozK78BJjQM=;
	b=0OGuNsYD3XRhshggiHvVmJgBcpjOTqMmROmflXy2DjA5RgCEtqftluYG/oaSNuPVe5
	HZ4Al7YKOORRxUDdJTmQfF6gfTF/tS9ejBUezmxBjyRdAN/BnsfeS7skTqoJh9Jr0TdY
	2Qf1PMFTNatl44is7Fu1cEaV6GwYIn1VFK6GwiDhktEOBXc/PFKw40y/DHu4LvWVJDOE
	UXmYWJbw3Rl1c/uy+bRVFnGgndElKJw4hBBWKlcyJBA7Ft/iI820482AefYGVODo0xtq
	ax5/MBmPeql6/94pHJ+UJRUACH/bNzP7FDTHC2vGvliqz5/osqb62w4aVpSdUid31RnC
	hcEw==
X-Received: by 10.180.182.116 with SMTP id ed20mr4063719wic.19.1443713345070; 
	Thu, 01 Oct 2015 08:29:05 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	f17sm6651832wjn.38.2015.10.01.08.29.04
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 01 Oct 2015 08:29:04 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  1 Oct 2015 17:29:58 +0200
Message-Id: <1443713401-8584-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.6.0
In-Reply-To: <20150918115458.GA11095@jama>
References: <20150918115458.GA11095@jama>
Subject: [PATCH][meta-oe 1/4] mkvtoolnix: Blacklist, fails to build with gcc-5
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
X-List-Received-Date: Thu, 01 Oct 2015 15:29:07 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-multimedia/recipes-mkv/mkvtoolnix/mkvtoolnix_git.bb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta-multimedia/recipes-mkv/mkvtoolnix/mkvtoolnix_git.bb b/meta-multimedia/recipes-mkv/mkvtoolnix/mkvtoolnix_git.bb
index dd613b3..d647cec 100644
--- a/meta-multimedia/recipes-mkv/mkvtoolnix/mkvtoolnix_git.bb
+++ b/meta-multimedia/recipes-mkv/mkvtoolnix/mkvtoolnix_git.bb
@@ -39,3 +39,9 @@ do_compile() {
 do_install() {
     ${S}/drake install DESTDIR=${D}
 }
+
+# | In file included from src/common/utf8_codecvt_facet.cpp:22:0:
+# | src/common/../../lib/boost/utf8_codecvt_facet/utf8_codecvt_facet.cpp:174:5: error: 'int mtx::utf8_codecvt_facet::do_length' is not a static data member of 'struct mtx::utf8_codecvt_facet'
+# |      BOOST_CODECVT_DO_LENGTH_CONST std::mbstate_t &,
+# |      ^
+PNBLACKLIST[mkvtoolnix] ?= "BROKEN: Failx to build with gcc-5"
-- 
2.6.0


