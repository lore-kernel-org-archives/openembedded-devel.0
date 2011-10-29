Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RK6Gc-0006fd-H8
	for openembedded-devel@lists.openembedded.org;
	Sat, 29 Oct 2011 12:35:59 +0200
Received: by mail-fx0-f47.google.com with SMTP id s16so4799631faa.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 29 Oct 2011 03:29:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=TsBEbEqi6i+YzYP+gkW3QbBvt4ovrf3FhUW86N81Hdo=;
	b=T1dwSzO4jLqGx4ZBC0NZOVKKXv7KtG0idMi90GbMAm9jNVkQLPahbLtmSFSJCppQSp
	wtJw/EacrQav072Ha31bs6ynynXJbAYrqP8qbRH5AtG/Amrv2EXxIKnWKPp/5fPSATld
	Gm8nVDENVwXrHLvmRQdiioiSqrfTWVSj1Bq18=
Received: by 10.223.1.137 with SMTP id 9mr12940258faf.19.1319884196369;
	Sat, 29 Oct 2011 03:29:56 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id g25sm23342485fae.16.2011.10.29.03.29.55
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 29 Oct 2011 03:29:55 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 29 Oct 2011 12:29:02 +0200
Message-Id: <ff2c3e6a8645c6120d4770be1592e7644ab72ad2.1319884094.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.7.1
In-Reply-To: <eeffc3b2de8e5277ef3184874b88e4e382fa72c8.1319884094.git.Martin.Jansa@gmail.com>
References: <eeffc3b2de8e5277ef3184874b88e4e382fa72c8.1319884094.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1319884094.git.Martin.Jansa@gmail.com>
References: <cover.1319884094.git.Martin.Jansa@gmail.com>
Subject: [meta-efl][meta-oe 06/12] liblinebreak: import from openembedded classic
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
X-List-Received-Date: Sat, 29 Oct 2011 10:36:00 -0000

From: Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>

The License was verified and LIC_FILES_CHKSUM was added

Signed-off-by: Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../liblinebreak/liblinebreak_1.2.bb               |   13 +++++++++++++
 1 files changed, 13 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-support/liblinebreak/liblinebreak_1.2.bb

diff --git a/meta-oe/recipes-support/liblinebreak/liblinebreak_1.2.bb b/meta-oe/recipes-support/liblinebreak/liblinebreak_1.2.bb
new file mode 100644
index 0000000..03c4352
--- /dev/null
+++ b/meta-oe/recipes-support/liblinebreak/liblinebreak_1.2.bb
@@ -0,0 +1,13 @@
+DESCRIPTION = "Liblinebreak is an implementation of the line breaking algorithm as described in Unicode 5.1.0 Standard Annex 14, Revision 22"
+HOMEPAGE = "http://vimgadgets.sourceforge.net/liblinebreak/"
+SECTION = "libs"
+PRIORITY = "optional"
+LICENSE = "zlib"
+LIC_FILES_CHKSUM = "file://LICENCE;md5=3715191da62bafb5cfc4ff36195b2ec3"
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/project/vimgadgets/liblinebreak/${PV}/liblinebreak-${PV}.tar.gz"
+
+inherit autotools
+
+SRC_URI[md5sum] = "d18039259001ccb24b5dd4648c49c5ad"
+SRC_URI[sha256sum] = "9efcb0cb1afc75ad1e92d2b2dbf4d9c77b072d6656c5f1a150af8b718d0c7b76"
-- 
1.7.7.1



