Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1S12Ix-0002Ls-Nh
	for openembedded-devel@lists.openembedded.org;
	Fri, 24 Feb 2012 22:03:52 +0100
Received: by yhfq46 with SMTP id q46so1342621yhf.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Feb 2012 12:55:28 -0800 (PST)
Received-SPF: pass (google.com: domain of otavio.salvador@gmail.com designates
	10.101.177.39 as permitted sender) client-ip=10.101.177.39; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	otavio.salvador@gmail.com designates 10.101.177.39 as permitted
	sender) smtp.mail=otavio.salvador@gmail.com;
	dkim=pass header.i=otavio.salvador@gmail.com
Received: from mr.google.com ([10.101.177.39])
	by 10.101.177.39 with SMTP id e39mr2395497anp.54.1330116928565
	(num_hops = 1); Fri, 24 Feb 2012 12:55:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=HUzTFS+pETQ1MzReFKbHIfO4ynNsc+636Wwxk321Tl0=;
	b=E7isD6YGDtzkeG5lnw5XUUx/Y9VNwpIhZ9InmTpIecVmpcuof8p08xZQgcopKzxePj
	5COL3H2CKweLftgDkA4Fnzof2nuwNNYRoOm6E1EB3Etpg1UNQXZ6yw2gEvdKVeAblOKn
	1jAaBoNoREWrygNyf86U125bB21zBy0jH1VNs=
Received: by 10.101.177.39 with SMTP id e39mr1834622anp.54.1330116928423;
	Fri, 24 Feb 2012 12:55:28 -0800 (PST)
Received: from localhost.localdomain ([186.218.100.214])
	by mx.google.com with ESMTPS id d66sm15203291yhh.12.2012.02.24.12.55.27
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 24 Feb 2012 12:55:27 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 24 Feb 2012 20:55:16 +0000
Message-Id: <77cbb77bc03b5f213381e94278e94f986dc153f3.1330116875.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1330116875.git.otavio@ossystems.com.br>
References: <cover.1330116875.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1330116875.git.otavio@ossystems.com.br>
References: <cover.1330116875.git.otavio@ossystems.com.br>
Subject: [PATCH][meta-oe 1/2] openbox: add missing depends
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
X-List-Received-Date: Fri, 24 Feb 2012 21:03:52 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 .../recipes-graphics/openbox/openbox_3.4.11.2.bb   |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/meta-oe/recipes-graphics/openbox/openbox_3.4.11.2.bb b/meta-oe/recipes-graphics/openbox/openbox_3.4.11.2.bb
index 65349a1..e5d645d 100644
--- a/meta-oe/recipes-graphics/openbox/openbox_3.4.11.2.bb
+++ b/meta-oe/recipes-graphics/openbox/openbox_3.4.11.2.bb
@@ -1,8 +1,11 @@
 DESCRIPTION = "openbox Window Manager"
 SECTION = "x11/wm"
+DEPENDS = "glib-2.0 pango libxml2 virtual/libx11"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
+PR = "r1"
+
 SRC_URI = "http://icculus.org/openbox/releases/openbox-${PV}.tar.gz \
            file://fix-dialog-buttons.patch;patch=1 \
            file://fix-decorations.patch;patch=1"
-- 
1.7.2.5



