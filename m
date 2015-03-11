Return-Path: <David.Andrey@netmodule.com>
Received: from webmail.netmodule.com (webmail.netmodule.com [194.29.26.242])
	by mail.openembedded.org (Postfix) with ESMTP id DA79473A90
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Mar 2015 11:16:56 +0000 (UTC)
Received: from ebro.netmodule.intranet (172.16.92.40) by
	ebro.netmodule.intranet (172.16.92.40) with Microsoft SMTP Server (TLS)
	id 15.0.913.22; Wed, 11 Mar 2015 12:16:57 +0100
Received: from LOIRE.netmodule.intranet (172.16.92.120) by
	webmail.netmodule.com (172.16.92.40) with Microsoft SMTP Server id
	15.0.913.22 via Frontend Transport; Wed, 11 Mar 2015 12:16:57 +0100
From: David Andrey <david.andrey@netmodule.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 11 Mar 2015 12:16:53 +0100
Message-ID: <1426072613-28274-1-git-send-email-david.andrey@netmodule.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [meta-oe][PATCH] nano: use FTP as download method
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
X-List-Received-Date: Wed, 11 Mar 2015 11:16:57 -0000
Content-Type: text/plain

FTP was noticed as the prefered file access method for nano sources
after several HTTP server hang-up.

The nano-devel mailing list refers to this change

Signed-off-by: David Andrey <david.andrey@netmodule.com>
---
 meta-oe/recipes-support/nano/nano.inc |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/nano/nano.inc b/meta-oe/recipes-support/nano/nano.inc
index b73aae0..bdefe9b 100644
--- a/meta-oe/recipes-support/nano/nano.inc
+++ b/meta-oe/recipes-support/nano/nano.inc
@@ -12,7 +12,7 @@ INC_PR = "r3"
 
 PV_MAJOR = "${@d.getVar('PV',1).split('.')[0]}.${@d.getVar('PV',1).split('.')[1]}"
 
-SRC_URI = "http://www.nano-editor.org/dist/v${PV_MAJOR}/nano-${PV}.tar.gz"
+SRC_URI = "ftp://nano-editor.org/pub/nano/v${PV_MAJOR}/nano-${PV}.tar.gz"
 
 inherit autotools gettext
 
-- 
1.7.10.4


