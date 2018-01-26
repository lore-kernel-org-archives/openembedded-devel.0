Return-Path: <prvs=5572ecbe2=Martin.Hundeboll@prevas.dk>
X-Greylist: delayed 599 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 26 Jan 2018 12:46:06 UTC
Received: from mail02.prevas.se (mail02.prevas.se [62.95.78.10])
	by mail.openembedded.org (Postfix) with ESMTP id 2FED87871B
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Jan 2018 12:46:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=prevas.dk; i=@prevas.dk; l=1389; q=dns/txt;
	s=ironport2; t=1516970770; x=1548506770;
	h=from:to:cc:subject:date:message-id:mime-version:
	content-transfer-encoding;
	bh=kXjgsQLPjbj/q3koEHoT+jwi8Lk4opZ+P7r7JnVgdIY=;
	b=NizYVpq+iD9BBMaMnOGj0kSGfL54fnMy0O3C914fjlN41ePPe9UwN/e9
	tCA0yRfdaQD708tm+3bvcOAfDrFU5gmLnfuR8+W38oZKdAllXynRrUHoN
	H4h3EVUxFrglm6QJqDq+tK/o3TvQAsPt0IFykhz09V41AfoG34hijezL6 I=;
X-IronPort-AV: E=Sophos;i="5.46,416,1511823600"; 
   d="scan'208";a="2968699"
Received: from vmprevas4.prevas.se (HELO smtp.prevas.se) ([172.16.8.104])
	by ironport2.prevas.se with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	26 Jan 2018 13:36:07 +0100
Received: from mnhu.prevas.se (172.16.8.31) by smtp.prevas.se (172.16.8.104)
	with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Fri, 26 Jan 2018 13:36:06 +0100
From: =?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <mnhu@prevas.dk>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 26 Jan 2018 13:35:58 +0100
Message-ID: <20180126123558.12940-1-mnhu@prevas.dk>
X-Mailer: git-send-email 2.16.1
MIME-Version: 1.0
X-Originating-IP: [172.16.8.31]
Cc: skny@prevas.dk
Subject: [PATCH] libgpiod: fix packaging of tools
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 26 Jan 2018 12:46:08 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

The default packaging adds files from ${bindir} to the primary package,
so that following packages don't see any files in ${bindir}. This causes
the libgpiod-tools package to empty, as it is appended (+=) to PACKAGES.

Change the assignment to PACKAGES to a prepend (=+) to populate the
libgpiod-tools package with the gpio{detect,find,get,info,mon,set}
executables.

To avoid missing tools for existing installations of libgpiod, the
libgpiod-tools package is setup as a recommendation by libgpiod when the
tools package config is enabled.

Signed-off-by: Martin Hundebøll <mnhu@prevas.dk>
---
 meta-oe/recipes-support/libgpiod/libgpiod.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/libgpiod/libgpiod.bb b/meta-oe/recipes-support/libgpiod/libgpiod.bb
index 6aa27ad57..b2e3bae69 100644
--- a/meta-oe/recipes-support/libgpiod/libgpiod.bb
+++ b/meta-oe/recipes-support/libgpiod/libgpiod.bb
@@ -18,6 +18,9 @@ PACKAGECONFIG ?= "tools"
 PACKAGECONFIG[tests] = "--enable-tests,--disable-tests,kmod udev"
 PACKAGECONFIG[tools] = "--enable-tools,--disable-tools,"
 
-PACKAGES += " ${PN}-tools"
+PACKAGES =+ " ${PN}-tools"
 
 FILES_${PN}-tools = "${bindir}/*"
+
+RRECOMMENDS_TOOLS = "${@bb.utils.contains('PACKAGECONFIG', 'tools', '${PN}-tools', '',d)}"
+RRECOMMENDS_${PN} += "${RRECOMMENDS_TOOLS}"
-- 
2.16.1


