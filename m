Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Q2twN-0004AQ-7q
	for openembedded-devel@lists.openembedded.org;
	Fri, 25 Mar 2011 00:27:43 +0100
Received: by mail-bw0-f47.google.com with SMTP id 10so577628bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Mar 2011 16:25:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=yjSE7zLLrS8/eixcHsf/RQFTkUHSEc0SO02uQ09znGM=;
	b=Rlz7q57XHy0L7xRiSO1lBlTMimpm7ZJzfoWE2VEORjJWmcDZcf8bxY+kxFA7zi82JL
	bqKwl/mRCOa8rxL/xPR9t3zxc2Jh6t9bterJ3QEz+HzHmo21Rtng/cAApKTxcBlDy38D
	s0k3gae//Br4L0GME4PHY1xRJIZnpT4dmzmmw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=q3LeEKR8eQnMsLUZDiB1QT2nTmTuTafWwTtp//u2ZXR1t+Km3xAqrn4DHkg+7DOOt2
	co8S735rRkLLzI/heLjDK9Jw17wsohxv/7nLMHr/t2bZMmo0KplvHGlLrPWoYG8RRyqh
	MZENYiBhjny+0zsBsDJcfMc4kaPw9GwAMaJsA=
Received: by 10.204.23.81 with SMTP id q17mr83004bkb.2.1301009152883;
	Thu, 24 Mar 2011 16:25:52 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id l1sm326255bkl.1.2011.03.24.16.25.51
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 24 Mar 2011 16:25:52 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 25 Mar 2011 00:25:45 +0100
Message-Id: <00e187a52747c75ed2856770533e3f5ab1d1bdd1.1301008354.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1301008354.git.Martin.Jansa@gmail.com>
References: <cover.1301008354.git.Martin.Jansa@gmail.com>
Subject: [PATCH 3/8] ecore: add LIC_FILES_CHKSUM and inherit gettext
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
X-List-Received-Date: Thu, 24 Mar 2011 23:27:43 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/efl/ecore.inc |    7 ++++---
 1 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta-efl/recipes-efl/efl/ecore.inc b/meta-efl/recipes-efl/efl/ecore.inc
index 6ff455f..89e578e 100644
--- a/meta-efl/recipes-efl/efl/ecore.inc
+++ b/meta-efl/recipes-efl/efl/ecore.inc
@@ -1,12 +1,13 @@
 DESCRIPTION = "Ecore is the Enlightenment application framework library"
 LICENSE = "MIT BSD"
-DEPENDS = "gettext-native virtual/libiconv tslib curl eet evas glib-2.0 \
+LIC_FILES_CHKSUM = "file://COPYING;md5=cb293be68319f9fcb179d7f3daae5fbe"
+DEPENDS = "virtual/libiconv tslib curl eet evas glib-2.0 \
            libxtst libxcomposite libxinerama libxscrnsaver libxdamage libxrandr libxcursor libxprintutil"
-DEPENDS_virtclass-native = "eet-native evas-native"	   
+DEPENDS_virtclass-native = "eet-native evas-native gettext-native"
 # optional
 # DEPENDS += "directfb virtual/libsdl openssl virtual/libiconv"
 
-inherit efl
+inherit efl gettext
 
 BBCLASSEXTEND = "native"
 INC_PR = "r0"
-- 
1.7.4.1



