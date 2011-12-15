Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1Rb9RF-0002tw-NH
	for openembedded-devel@lists.openembedded.org;
	Thu, 15 Dec 2011 12:25:25 +0100
Received: by mail-yw0-f47.google.com with SMTP id o47so2013067yho.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Dec 2011 03:18:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=74WrD7PYG6uyh9unI/0C9GQ0RkZPgrA2R/eXuEs+2G8=;
	b=Nf0MX2Zvb8l/lzXu3oVmqg7CzF0bZ3/wnZK1Ou22Jc7kAnhIDvWQ+kcj1AKaeFjub6
	zkxE1j08FEiK/ofCFN6w4uPDrPtRvJxKuG5f1TebBhVUzWYvPzCrzke0woTdS4OTg15t
	Sn6/61uY/E8hGDPAtJEJHnRW8DZ0my3q+BFXo=
Received: by 10.236.157.10 with SMTP id n10mr4527467yhk.41.1323947908099;
	Thu, 15 Dec 2011 03:18:28 -0800 (PST)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id c44sm8652593yhm.5.2011.12.15.03.18.26
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 15 Dec 2011 03:18:27 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 15 Dec 2011 11:18:05 +0000
Message-Id: <54d71d79332893c6ff38089753cfdecd564be82a.1323947853.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1323947853.git.otavio@ossystems.com.br>
References: <cover.1323947853.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1323947853.git.otavio@ossystems.com.br>
References: <cover.1323947853.git.otavio@ossystems.com.br>
Subject: [meta-oe][PATCH 4/5] sessreg: fix checksum
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
X-List-Received-Date: Thu, 15 Dec 2011 11:25:25 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta-oe/recipes-graphics/xorg-app/sessreg_1.0.6.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-graphics/xorg-app/sessreg_1.0.6.bb b/meta-oe/recipes-graphics/xorg-app/sessreg_1.0.6.bb
index 05d701d..702bac7 100644
--- a/meta-oe/recipes-graphics/xorg-app/sessreg_1.0.6.bb
+++ b/meta-oe/recipes-graphics/xorg-app/sessreg_1.0.6.bb
@@ -6,5 +6,5 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=07e6423e8815e6b372cd45da76faacd0"
 
 PR = "r6"
 
-SRC_URI[archive.md5sum] = "8c8fcda19f4cffe573d43ec9b8255f8e"
-SRC_URI[archive.sha256sum] = "73f31670842b7d969504a61f3c694bf1911f844831c390396971ae2b74de7190"
+SRC_URI[md5sum] = "8c8fcda19f4cffe573d43ec9b8255f8e"
+SRC_URI[sha256sum] = "73f31670842b7d969504a61f3c694bf1911f844831c390396971ae2b74de7190"
-- 
1.7.2.5



