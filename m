Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web12.10282.1607441896055750664
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 08 Dec 2020 07:38:16 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: thomas.perrot@bootlin.com)
X-Originating-IP: 88.162.151.131
Received: from localhost.localdomain (unknown [88.162.151.131])
	(Authenticated sender: thomas.perrot@bootlin.com)
	by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id EB0524000A;
	Tue,  8 Dec 2020 15:38:12 +0000 (UTC)
From: thomas.perrot@bootlin.com
To: openembedded-devel@lists.openembedded.org
Cc: Thomas Perrot <thomas.perrot@bootlin.com>
Subject: [meta-oe][PATCH] openocd: disable the support of ccache
Date: Tue,  8 Dec 2020 16:38:08 +0100
Message-Id: <20201208153808.545977-1-thomas.perrot@bootlin.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Otherwise, when ccache is enabled the following error occurs, by adding
CCACHE_DISABLE = "1" in the recipe this is avoided.

| No installed jimsh or tclsh, building local bootstrap jimsh0
| Host System...x86_64-pc-linux-gnu
| Build System...x86_64-pc-linux-gnu
| C compiler...ccache ccache gcc  -isystem/src/build/tmp/work/x86_64-linux/openocd-native/0.10+gitrAUTOINC+ded6799025-r0/recipe-sysroot-native/usr/include -O2 -pipe
| C++ compiler...ccache ccache g++  -isystem/src/build/tmp/work/x86_64-linux/openocd-native/0.10+gitrAUTOINC+ded6799025-r0/recipe-sysroot-native/usr/include -O2 -pipe
| Build C compiler...ccache gcc
| Checking for stdlib.h...not found
| Error: Compiler does not work. See config.log
| Try: 'configure --help' for options
| configure: error: ./configure.gnu failed for jimtcl
| WARNING: exit code 1 from a shell command.
|

Signed-off-by: Thomas Perrot <thomas.perrot@bootlin.com>
---
 meta-oe/recipes-devtools/openocd/openocd_git.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-devtools/openocd/openocd_git.bb b/meta-oe/recipes-devtools/openocd/openocd_git.bb
index 4f6aaa8a6..05e06a25d 100644
--- a/meta-oe/recipes-devtools/openocd/openocd_git.bb
+++ b/meta-oe/recipes-devtools/openocd/openocd_git.bb
@@ -54,3 +54,6 @@ FILES_${PN} = " \
 PACKAGECONFIG[sysfsgpio] = "--enable-sysfsgpio,--disable-sysfsgpio"
 PACKAGECONFIG[remote-bitbang] = "--enable-remote-bitbang,--disable-remote-bitbang"
 PACKAGECONFIG ??= "sysfsgpio remote-bitbang"
+
+# Can't be built with ccache
+CCACHE_DISABLE = "1"
-- 
2.29.2

