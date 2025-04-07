Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AA8CC3601E
	for <webhook@archiver.kernel.org>; Mon,  7 Apr 2025 16:17:22 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.web11.51617.1744042635763682285
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Apr 2025 09:17:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=Gzg8NRTq;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-256628-202504071617134e212035d75cdf90c1-nnx_fk@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 202504071617134e212035d75cdf90c1
        for <openembedded-devel@lists.openembedded.org>;
        Mon, 07 Apr 2025 18:17:13 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=nlnFbrYx2hGAjrhReDqz54DktQeLiw43jOjmiAn3BbM=;
 b=Gzg8NRTqx3HOwCDe+jm47/lUqvlqO+bUsq6UWgrPOcxRl4JNBIkaQP77NGEP10KujnOGcN
 nA55o/hQxJ5U8fGKWdkdIxlkDpO0r7YeRfyePLhfhGbS4gQZ3rEdZ73P5PzbhV1IG7jtVjOA
 RJ8tQsP8o4hSYhToBbKRDtArFmUfP83TjjwBdIBkxHMLPWUUO9mrQ6wFCwmduaaXNrMram8S
 64nGtEiaHoujla0nwrNKaPhEa8dpuHGbtLTMgqDHhMkbsdl3q9HcAbs9q26YoPoeJu/QhMCr
 ijdcUCekYD2XxadvMBtlPAj3JCKnpvD/L9US/hb0kQGfbq5BawXtGrXA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-oe][PATCH v2 1/3] 7zip: install headers
Date: Mon,  7 Apr 2025 18:16:24 +0200
Message-Id: <20250407161626.8501-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Apr 2025 16:17:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116672

From: Peter Marko <peter.marko@siemens.com>

This is needed for bit7z recipe.
But in general, using 7-zip as a library also requires headers.

Leave our Windows headers.

Install also readme as it contains version information and is used by
bit7z.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta-oe/recipes-extended/7zip/7zip_24.09.bb | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/meta-oe/recipes-extended/7zip/7zip_24.09.bb b/meta-oe/recipes-extended/7zip/7zip_24.09.bb
index 719a160b66..4b6c7a613c 100644
--- a/meta-oe/recipes-extended/7zip/7zip_24.09.bb
+++ b/meta-oe/recipes-extended/7zip/7zip_24.09.bb
@@ -59,6 +59,15 @@ do_install() {
 	install -d ${D}${libdir}
 	install -m 0755 ${S}/CPP/7zip/Bundles/Format7zF/b/${INSTALLDIR}/7z.so ${D}${libdir}/lib7z.so
 	ln -rsn ${D}${libdir}/lib7z.so ${D}${bindir}/7z.so
+
+	# install headers (for development) and readme (for version information)
+	for header_file in $(find ${S}/CPP/${BPN} ${S}/CPP/Common ${S}/C -name "*.h"); do
+		header_dir=$(dirname $(echo $header_file | sed "s|${S}/||"))
+		install -d ${D}${includedir}/${BPN}/$header_dir
+		install -m 0644 $header_file ${D}${includedir}/${BPN}/$header_dir
+	done
+	install -d ${D}${includedir}/${BPN}/DOC
+	install -m 0644 ${S}/DOC/readme.txt ${D}${includedir}/${BPN}/DOC
 }
 
 PROVIDES += "p7zip"

