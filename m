Received: from mail-gh0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1SxLfF-0003MZ-0I
	for openembedded-devel@lists.openembedded.org;
	Fri, 03 Aug 2012 19:27:53 +0200
Received: by ghbz2 with SMTP id z2so1013790ghb.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 03 Aug 2012 10:16:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:x-mailer;
	bh=szvE7RcEZ35Gh0vLBPLXxjZ3loaQ5XTXbenydbdq/4Y=;
	b=0vT7OWvPjPZH1oWL2HYMD+z4SU5fPcYtMH9p19QkfsQcS+aGq+AXEh7HXtuzs+Uch1
	TwbrwAtYN/m8Jvdos1Gr2buERQRwWzJvQKHK9JsmFLLNBDOc3ElmJ2u7VQhh67xWf/+l
	QM85Ntuf+GWrGVQP+8Ty0oHeWUajsdBPiA1e8EGfeRhOxTjO2ZiMXrSkCdBPT7qyJiE1
	ZSdpaRmVxb7G9VLKpDzgSPLCVmjbR/3ziQUKIZCMAkzOMZ4Ku57yqt7PBrnyXV9TNn5J
	lzqBiZDS8lX4NnyT66yNOlU9gPQfa6JlYFz00PT2PWJWymTwZSKXGbbOrG/cJs4MnHC8
	c4hA==
Received: by 10.236.185.201 with SMTP id u49mr2766667yhm.28.1344014171454;
	Fri, 03 Aug 2012 10:16:11 -0700 (PDT)
Received: from localhost.localdomain ([177.100.163.15])
	by mx.google.com with ESMTPS id s12sm2250534anh.2.2012.08.03.10.16.09
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 03 Aug 2012 10:16:09 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  3 Aug 2012 14:15:56 -0300
Message-Id: <1344014157-26570-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-oe][PATCH 1/2] postgresql: Fix redundant rpath for '/usr/lib'
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
X-List-Received-Date: Fri, 03 Aug 2012 17:27:53 -0000

This patch fixes the following QA issue:

,----[ Fragment of build error log ]
| ...
| ERROR: QA Issue: postgresql-client:
|   /work/.../usr/bin/pg_dumpall contains probably-redundant
|   RPATH /usr/lib
| ...
`----

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
Reported-by: Nathan West <nate.ewest@gmail.com>
Reported-by: Rogerio Pimentel <rogerio.pimentel@freescale.com>
---
 meta-oe/recipes-support/postgresql/postgresql.inc |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/postgresql/postgresql.inc b/meta-oe/recipes-support/postgresql/postgresql.inc
index ab6aea4..01c41c1 100644
--- a/meta-oe/recipes-support/postgresql/postgresql.inc
+++ b/meta-oe/recipes-support/postgresql/postgresql.inc
@@ -2,7 +2,7 @@ DESCRIPTION = "PostgreSQL is a powerful, open source relational database system.
 HOMEPAGE = "http://www.postgresql.com"
 LICENSE = "BSD"
 DEPENDS = "zlib readline tzcode-native"
-INC_PR = "r6"
+INC_PR = "r7"
 
 ARM_INSTRUCTION_SET = "arm"
 
@@ -17,7 +17,8 @@ export LDFLAGS_SL = "${LDFLAGS}"
 
 inherit autotools pkgconfig
 
-EXTRA_OECONF_sh4 = "--disable-spinlocks"
+EXTRA_OECONF = "--disable-rpath"
+EXTRA_OECONF_sh4 = "--disable-spinlocks --disable-rpath"
 
 do_compile_append() {
          cp /usr/sbin/zic ${S}/src/timezone/
-- 
1.7.2.5



