Received: from static.88-198-71-155.clients.your-server.de ([88.198.71.155]
	helo=socrates.bennee.com) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kernel-hacker@bennee.com>) id 1PrpOU-0005Iw-5Q
	for openembedded-devel@lists.openembedded.org;
	Tue, 22 Feb 2011 11:23:08 +0100
Received: from localhost ([127.0.0.1] helo=sloy.cambridgebroadband.com)
	by socrates.bennee.com with esmtp (Exim 4.72)
	(envelope-from <kernel-hacker@bennee.com>)
	id 1PrpNY-0006RI-Qu; Tue, 22 Feb 2011 11:22:00 +0100
From: kernel-hacker@bennee.com
To: openembedded-devel@lists.openembedded.org
Date: Tue, 22 Feb 2011 10:21:31 +0000
Message-Id: <1298370092-31915-2-git-send-email-kernel-hacker@bennee.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <1298370092-31915-1-git-send-email-kernel-hacker@bennee.com>
References: <1298370092-31915-1-git-send-email-kernel-hacker@bennee.com>
X-SA-Exim-Connect-IP: 127.0.0.1
X-SA-Exim-Mail-From: kernel-hacker@bennee.com
X-SA-Exim-Scanned: No (on socrates.bennee.com); SAEximRunCond expanded to false
Cc: Alex Bennee <ajb@cbnl.com>
Subject: [PATCH 1/2] libnet: fake a libnet pkg to allow libnet-dev to be in SDK
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
X-List-Received-Date: Tue, 22 Feb 2011 10:23:12 -0000

From: Alex Bennee <ajb@cbnl.com>

I'm sure there is a better way than this but this works for now.
By default libnet-dev has a dependancy on libnet, however this is
not built as libnet is a static package. This makes it impossible
to add libnet-dev to a SDK.

Commenting out the FILES_${PN} for libnet means it does get built
and together with the -dev package can be added to the SDK

Signed-off-by: Alex Bennee <ajb@cbnl.com>
---
 recipes/libnet/libnet_1.1.2.1.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes/libnet/libnet_1.1.2.1.bb b/recipes/libnet/libnet_1.1.2.1.bb
index b09f56e..94c0418 100644
--- a/recipes/libnet/libnet_1.1.2.1.bb
+++ b/recipes/libnet/libnet_1.1.2.1.bb
@@ -32,7 +32,7 @@ do_install_append () {
 }
 
 #static build
-FILES_${PN} = ""
+#FILES_${PN} = ""
 FILES_${PN}-dev += "${bindir}/libnet-config"
 
 CPPFLAGS_prepend = "-I${S}/libnet/include "
-- 
1.7.4.1



