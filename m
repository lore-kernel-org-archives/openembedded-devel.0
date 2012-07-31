Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Sw1va-0007QV-0u
	for openembedded-devel@lists.openembedded.org;
	Tue, 31 Jul 2012 04:11:18 +0200
Received: by mail-wg0-f43.google.com with SMTP id dr1so4765359wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Jul 2012 18:59:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=T2QLg4cerW24b3NMrgVxToVzkZMO1biiayvLaKCvu5M=;
	b=oQqQbfBHsSL6xQZ39/8hMEqQRUCyp8W0uCzrblNsuYhx0xCLT6kJ9ifD9a8zCBFplz
	paW/LfPofhMjb9y/oKrKOpJLM5fJgpBTU+MD563rkxctOXmwHGCLY8BNTtr4QOG/mL1D
	PpGBYUZ1c3mLi/H9lNov6S4Xqmz8AKDibLK89kL3rVHu1grn4IutmqTQu+xdJdKWn/7q
	kAXXwy6xF18C2B9vXT/Qesf6zDWAsaefGZlFmv8n1xXan9N2RkNvOckYbp+lHBbIstMF
	V6ASX+3hhPhJyFPwFaWSuKxOfjSF3u90dxinPzrTlIHYTyHV0oJpQFCpkACAhXKI+gUj
	hC3w==
Received: by 10.216.53.193 with SMTP id g43mr6233593wec.67.1343699983914;
	Mon, 30 Jul 2012 18:59:43 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id b7sm28804449wiz.9.2012.07.30.18.59.42
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 30 Jul 2012 18:59:43 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 31 Jul 2012 03:58:37 +0200
Message-Id: <44118edc758683551cde0f700020823f53389c4f.1343699377.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
In-Reply-To: <cover.1343699377.git.Martin.Jansa@gmail.com>
References: <cover.1343478744.git.Martin.Jansa@gmail.com>
	<cover.1343699377.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1343699377.git.Martin.Jansa@gmail.com>
References: <cover.1343699377.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 12/24] meta-elf: e-module: add *.a to PN-staticdev
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
X-List-Received-Date: Tue, 31 Jul 2012 02:11:18 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/e17/e-module.inc |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/meta-efl/recipes-efl/e17/e-module.inc b/meta-efl/recipes-efl/e17/e-module.inc
index d3f6e1b..0923575 100644
--- a/meta-efl/recipes-efl/e17/e-module.inc
+++ b/meta-efl/recipes-efl/e17/e-module.inc
@@ -15,4 +15,5 @@ EXTRA_OECONF = "--with-edje-cc=${STAGING_BINDIR_NATIVE}/edje_cc"
 
 FILES_${PN} += "${libdir}/enlightenment/modules/${PN}"
 FILES_${PN}-dbg += "${libdir}/enlightenment/modules/${PN}/*/.debug"
+FILES_${PN}-staticdev += "${libdir}/enlightenment/modules/${PN}/*/*.a"
 
-- 
1.7.8.6



