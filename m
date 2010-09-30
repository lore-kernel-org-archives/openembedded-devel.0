Received: from proxy.dresearch.de ([87.193.137.100] helo=mail.dresearch.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sledz@dresearch.de>) id 1P1EDx-0002Uf-Um
	for openembedded-devel@lists.openembedded.org;
	Thu, 30 Sep 2010 10:10:42 +0200
Received: from exchange.intern.dresearch.de (owa.xfer-intern.dresearch.de
	[192.168.32.16])
	by mail.dresearch.de (Postfix) with ESMTP id 9E263491278
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Sep 2010 10:10:30 +0200 (CEST)
Received: from mobil-400-586.intern.dresearch.de ([10.32.11.62]) by
	exchange.intern.dresearch.de with Microsoft SMTPSVC(6.0.3790.4675); 
	Thu, 30 Sep 2010 10:10:30 +0200
Received: by mobil-400-586.intern.dresearch.de (Postfix, from userid 1000)
	id 2D15F2DAC8; Thu, 30 Sep 2010 10:10:28 +0200 (CEST)
From: Steffen Sledz <sledz@dresearch.de>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 30 Sep 2010 10:10:19 +0200
Message-Id: <1285834219-17132-1-git-send-email-sledz@dresearch.de>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <4CA44597.5070300@dresearch.de>
References: <4CA44597.5070300@dresearch.de>
X-OriginalArrivalTime: 30 Sep 2010 08:10:30.0233 (UTC)
	FILETIME=[F2932C90:01CB6076]
X-SA-Exim-Connect-IP: 87.193.137.100
X-SA-Exim-Mail-From: sledz@dresearch.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] epiphany-2.30.2: unbreak build by disabling CA files
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
X-List-Received-Date: Thu, 30 Sep 2010 08:10:42 -0000

Signed-off-by: Steffen Sledz <sledz@dresearch.de>
---
 recipes/gnome/epiphany_2.30.2.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes/gnome/epiphany_2.30.2.bb b/recipes/gnome/epiphany_2.30.2.bb
index 426d468..38798f7 100644
--- a/recipes/gnome/epiphany_2.30.2.bb
+++ b/recipes/gnome/epiphany_2.30.2.bb
@@ -9,7 +9,7 @@ SRC_URI[archive.md5sum] = "29b084acfa016540d91d3601ec3dff5c"
 SRC_URI[archive.sha256sum] = "cd0124e71e72142593cfeb442d58d97e99ba94ace6e31d94717fe977c0bfb98a"
 
 
-EXTRA_OECONF = "--disable-nss --with-engine=webkit --with-distributor-name=${DISTRO}"
+EXTRA_OECONF = "--disable-nss --with-engine=webkit --with-distributor-name=${DISTRO} --without-ca-file"
 
 do_configure_prepend() {
         touch ${S}/gnome-doc-utils.make
-- 
1.7.1



