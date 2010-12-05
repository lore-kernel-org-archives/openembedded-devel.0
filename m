Received: from mail-gw0-f41.google.com ([74.125.83.41])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <matthewbot@gmail.com>) id 1PPH4a-0006Dv-6m
	for openembedded-devel@lists.openembedded.org;
	Sun, 05 Dec 2010 17:04:24 +0100
Received: by gwj22 with SMTP id 22so3793157gwj.28
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 05 Dec 2010 08:02:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=qo5TKeqxea3QzofzfIMhimXQzyx1kkqL09nxb0UPToM=;
	b=WrfYbcB8mswQ4QQ3px8Im1Dl0u6eZvm9M5PwaakE1DBs2hqh6j/rrw4jskG4tqcnHp
	l3fywvqmQJWELVd2t8FPCaVmDO5ZhfPzdV6FLpMSmiZm3QIeXoPp6siLYaAV06CUm9Gu
	L03FEVKXkezKpY2n4aTQkzojDwHIwzTJb4y6Y=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=sEla6P9ABoOHAYOQuTG1ajPTDC6ww3QeXrtEdjPLRZfjcPQ1kysBm2SZu5UaGv5tKE
	5V6eNt6fqhTgg//v4ZoWJ7Phq3kdJlXWjrGB7XCL/WATx9ZJEr5lyYTAEpCz3BmP/6WW
	WvdR5Z6NG4BBQ7RQw2US4XR3yHnw0OSJpeP2c=
Received: by 10.150.200.18 with SMTP id x18mr7545267ybf.142.1291564975606;
	Sun, 05 Dec 2010 08:02:55 -0800 (PST)
Received: from localhost.localdomain (n128-227-48-245.xlate.ufl.edu
	[128.227.48.245])
	by mx.google.com with ESMTPS id r31sm2458538yhc.24.2010.12.05.08.02.54
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sun, 05 Dec 2010 08:02:54 -0800 (PST)
From: Matt Thompson <matthewbot@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  5 Dec 2010 11:02:48 -0500
Message-Id: <1291564968-3502-1-git-send-email-matthewbot@gmail.com>
X-Mailer: git-send-email 1.7.1
X-SA-Exim-Connect-IP: 74.125.83.41
X-SA-Exim-Mail-From: matthewbot@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] wxwidgets: added libxinerama to DEPENDS
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
X-List-Received-Date: Sun, 05 Dec 2010 16:04:24 -0000

Signed-off-by: Matt Thompson <matthewbot@gmail.com>
---
 recipes/wxwidgets/wxwidgets.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes/wxwidgets/wxwidgets.inc b/recipes/wxwidgets/wxwidgets.inc
index 2fb2bef..4c4f77f 100644
--- a/recipes/wxwidgets/wxwidgets.inc
+++ b/recipes/wxwidgets/wxwidgets.inc
@@ -2,7 +2,7 @@ DESCRIPTION = "wxWidgets is a cross platform application framework utilizing nat
 HOMEPAGE = "http://www.wxwidgets.org"
 SECTION = "x11/libs"
 LICENSE = "wxWindows"
-DEPENDS = "gtk+ jpeg tiff libpng zlib expat"
+DEPENDS = "gtk+ jpeg tiff libpng zlib expat libxinerama"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/wxwindows/wxWidgets-${PV}.tar.bz2"
 
-- 
1.7.1



