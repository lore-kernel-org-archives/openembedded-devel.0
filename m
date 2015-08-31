Return-Path: <biannm@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 62384762B7
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 31 Aug 2015 05:05:45 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.15,520,1432569600"; d="scan'208";a="100182434"
Received: from bogon (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 31 Aug 2015 13:08:49 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t7V55Z9F019969
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 31 Aug 2015 13:05:35 +0800
Received: from localhost.localdomain (10.167.226.31) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Mon, 31 Aug 2015 13:05:43 +0800
From: Bian Naimeng <biannm@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 31 Aug 2015 13:05:20 +0800
Message-ID: <1440997520-40495-1-git-send-email-biannm@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.167.226.31]
Subject: [meta-ruby][PATCH]libgxim: inherit gettext to fix build error in a non-gplv3 build.
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
X-List-Received-Date: Mon, 31 Aug 2015 05:05:47 -0000
Content-Type: text/plain

  | configure.ac:18: warning: AM_NLS is m4_require'd but not m4_defun'd
  | aclocal.m4:2363: IT_PROG_INTLTOOL is expanded from...
  | aclocal.m4:2545: AC_PROG_INTLTOOL is expanded from...
  | configure.ac:18: the top level
  | configure:12119: error: possibly undefined macro: AM_NLS
  |       If this token and others are legitimate, please use m4_pattern_allow.
  |       See the Autoconf documentation.

Signed-off-by: Bian Naimeng <biannm@cn.fujitsu.com>
---
 meta-ruby/recipes-extended/libgxim/libgxim_0.5.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-ruby/recipes-extended/libgxim/libgxim_0.5.0.bb b/meta-ruby/recipes-extended/libgxim/libgxim_0.5.0.bb
index 0b4b743..768bdaa 100644
--- a/meta-ruby/recipes-extended/libgxim/libgxim_0.5.0.bb
+++ b/meta-ruby/recipes-extended/libgxim/libgxim_0.5.0.bb
@@ -22,4 +22,4 @@ file://COPYING;md5=2d5025d4aa3495befef8f17206a5b0a1"
 EXTRA_OECONF = " --disable-static --disable-rebuilds"
 DEPENDS += "gtk+ glib-2.0 ruby-native"
 
-inherit autotools pkgconfig
+inherit autotools pkgconfig gettext
-- 
1.9.1


