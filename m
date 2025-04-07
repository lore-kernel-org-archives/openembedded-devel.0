Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58242C36010
	for <webhook@archiver.kernel.org>; Mon,  7 Apr 2025 16:09:42 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.web10.51908.1744042180591559610
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Apr 2025 09:09:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=MoP2Ds8F;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-256628-20250407160937fb9dfc2f27b8e897cf-4fbidn@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 20250407160937fb9dfc2f27b8e897cf
        for <openembedded-devel@lists.openembedded.org>;
        Mon, 07 Apr 2025 18:09:38 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=nlnFbrYx2hGAjrhReDqz54DktQeLiw43jOjmiAn3BbM=;
 b=MoP2Ds8FHI1oNg4tbz26vHXEtqEqYuAdvmr4TQ9tGPGX6h7ouuu/wgt5i4zaA6fcoe1P00
 lCiU1NpI8mMZ6lmzSMjXqu4me6d67WxEYm/dV8OjXLBYoAWPC8Y6G1/aGBQvOoyb1D/pzyKb
 6VCSghlOP7DjlrscMh5rsFA/O8aiDA+gpI2Al/hrSBsH0v72QP344FbZ2mEIhL/mz2Ynjb1w
 3Br768xX1mAwnM7FsmMW9XXy/sdvcZyxVp3LbSnCCjcgfm7LOcKMOD7VBhpoA9x9kvPIhZzU
 2/1vsS5ZV37KctctyAvRpuLF4sn5F2ZAYj/YR7v+mqBWaLBWwu8hrktQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-oe][PATCH 1/3] 7zip: install headers
Date: Mon,  7 Apr 2025 18:08:43 +0200
Message-Id: <20250407160845.7615-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Apr 2025 16:09:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116669

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

