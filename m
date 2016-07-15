Return-Path: <michael@walle.cc>
Received: from ssl.serverraum.org (ssl.serverraum.org [213.133.101.245])
	by mail.openembedded.org (Postfix) with ESMTP id A40DD606D0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Jul 2016 09:58:39 +0000 (UTC)
Received: from mwalle01.kse.adk.loc (unknown [194.25.174.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	by ssl.serverraum.org (Postfix) with ESMTPSA id 8FE1C22380;
	Fri, 15 Jul 2016 11:58:37 +0200 (CEST)
Authentication-Results: ssl.serverraum.org; dmarc=none header.from=walle.cc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
	s=mail2016061301; t=1468576718;
	bh=9xAia/pLSiaWA+/WttpsiwZ3t3UskG7R1S+rwR3qIVg=;
	h=From:To:Cc:Subject:Date:From;
	b=MUUucHJkm95CxRVvYFYYfh606k8SWsTaSTA8oK4ki9hyCuTqmXui25Q0j+24U4X/v
	fE5FsTPEzeHLyJEipprrJ/tauKeIinWsxcEsXK2Fpde0+8WpO5l9sbb6541zUWPOVX
	jlWtGqpXfOpHPlS33AbjJx8nBHBglcVa1SwPVlmo=
From: Michael Walle <michael@walle.cc>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 15 Jul 2016 11:58:30 +0200
Message-Id: <1468576710-25964-1-git-send-email-michael@walle.cc>
X-Mailer: git-send-email 2.1.4
X-Virus-Scanned: clamav-milter 0.99.2 at web
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on web.serverraum.org
Cc: Michael Walle <michael@walle.cc>
Subject: [PATCH] klibc: fix install destination in 64bit env
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
X-List-Received-Date: Fri, 15 Jul 2016 09:58:39 -0000

klibc installs everything into /usr/lib by default. But the recipe assumes
it installs to ${libdir} which is /usr/lib64 in 64bit environment. Package
generation fails badly in this case. Set INSTALLDIR to fix this.

Signed-off-by: Michael Walle <michael@walle.cc>
---
 meta-initramfs/recipes-devtools/klibc/klibc.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-initramfs/recipes-devtools/klibc/klibc.inc b/meta-initramfs/recipes-devtools/klibc/klibc.inc
index 65ee868..f00e31a 100644
--- a/meta-initramfs/recipes-devtools/klibc/klibc.inc
+++ b/meta-initramfs/recipes-devtools/klibc/klibc.inc
@@ -27,6 +27,7 @@ EXTRA_OEMAKE = "'KLIBCARCH=${KLIBC_ARCH}' \
                 'KLIBCLIBGCC=${STAGING_DIR_TARGET}${libdir}/${TARGET_SYS}/*/libgcc.a' \
                 'prefix=${exec_prefix}' \
                 'INSTALLROOT=${D}' \
+                'INSTALLDIR=${libdir}/klibc' \
                 'SHLIBDIR=${libdir}' \
                 "
 
-- 
2.1.4


