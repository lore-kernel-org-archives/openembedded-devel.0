Received: from mail-yh0-f45.google.com ([209.85.213.45])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mario.goulart@gmail.com>) id 1U32rr-0003g9-0Y
	for openembedded-devel@lists.openembedded.org;
	Wed, 06 Feb 2013 12:08:47 +0100
Received: by mail-yh0-f45.google.com with SMTP id 24so127766yhr.32
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 06 Feb 2013 02:52:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:sender:from:to:cc:subject:date:message-id:x-mailer;
	bh=rK40yiDKgnJ7IwX/nTYQpfHqXu0gNDadq0uz16kZsL4=;
	b=lTkEKzm3B+BfYRsgWm4BHZup13Gb4rBB6a//tG0wtnCAWY/6PBxQxxIm4j0NfJC2ir
	osRAYVZVwcJLQMvSt3rTvzliRyN0/5D5YozgpxhOyfrQL7uCK8zllv+ftTLoorpZ1U2w
	Qf9hk85yscHjq7WwVWn4/0kD3gl8gUE3GgkB/4iLgOkGzV5WBco69VflNHbdY/V25P3x
	LgaY1KB8TK0eGC3+IlYUVtS1srX35BHCdUbmQlnjYRE7zNElra0yOKi0RATixlOUrAIQ
	v1YQhAESwrgs6LTf4IVV8viG0vgTY9rUNu1WnNTGKEN5IRm1EY3H6RCKFMirWNUHY+g7
	bRDA==
X-Received: by 10.236.89.107 with SMTP id b71mr34646732yhf.86.1360147971710;
	Wed, 06 Feb 2013 02:52:51 -0800 (PST)
Received: from localhost.localdomain ([187.23.144.59])
	by mx.google.com with ESMTPS id k24sm40125121yhd.5.2013.02.06.02.52.49
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Wed, 06 Feb 2013 02:52:50 -0800 (PST)
Sender: Mario Domenech Goulart <mario.goulart@gmail.com>
From: Mario Domenech Goulart <mario@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  6 Feb 2013 08:52:30 -0200
Message-Id: <1360147950-19689-1-git-send-email-mario@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
Cc: Mario Domenech Goulart <mario@ossystems.com.br>
Subject: [meta-oe][PATCH v2] mg: add recipe for version 20110905
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
X-List-Received-Date: Wed, 06 Feb 2013 11:08:49 -0000

Signed-off-by: Mario Domenech Goulart <mario@ossystems.com.br>
---
 meta-oe/recipes-support/mg/mg_20110905.bb |   20 ++++++++++++++++++++
 1 files changed, 20 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-support/mg/mg_20110905.bb

diff --git a/meta-oe/recipes-support/mg/mg_20110905.bb b/meta-oe/recipes-support/mg/mg_20110905.bb
new file mode 100644
index 0000000..7a6a1c7
--- /dev/null
+++ b/meta-oe/recipes-support/mg/mg_20110905.bb
@@ -0,0 +1,20 @@
+DESCRIPTION = "A portable version of the mg maintained by the OpenBSD team"
+HOMEPAGE = "http://homepage.boetes.org/software/mg/"
+LICENSE = "PD"
+LIC_FILES_CHKSUM = "file://version.c;md5=811e1b67a5cd60c12b218a2b7c1adbf2"
+DEPENDS = "ncurses"
+SECTION = "console/editors"
+
+SRC_URI = "http://homepage.boetes.org/software/mg/mg-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "2de35316fa8ebafe6003efaae70b723e"
+SRC_URI[sha256sum] = "1cd37d7e6a3eecc890a5718c38b8f38495057ba93856762a756ccee2f9618229"
+
+do_configure () {
+    sed -i Makefile.in -e 's,^prefix=.*,prefix=${prefix},'
+    ./configure
+}
+
+do_install () {
+    oe_runmake install DESTDIR=${D}
+}
-- 
1.7.2.5



