Return-Path: <Matthew.Zeng@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1E30B7FC4A
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Jan 2020 20:46:58 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 00DKl0YI000024
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Jan 2020 12:47:00 -0800 (PST)
Received: from mzeng (128.224.141.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.468.0;
	Mon, 13 Jan 2020 12:46:59 -0800
User-agent: mu4e 1.3.6; emacs 28.0.50
From: "Mingde (Matthew) Zeng" <matthew.zeng@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 13 Jan 2020 15:46:57 -0500
Message-ID: <87h80zozi6.fsf@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.141.67]
Subject: [meta-oe][PATCH] poppler/poppler-data: Add HOMEPAGE tags
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
X-List-Received-Date: Mon, 13 Jan 2020 20:46:59 -0000
Content-Type: text/plain


Add HOMEPAGE tags missing in the poppler and poppler-data recipes.

Signed-off-by: Matthew Zeng <Matthew.Zeng@windriver.com>
---
 meta-oe/recipes-support/poppler/poppler-data_0.4.9.bb | 1 +
 meta-oe/recipes-support/poppler/poppler_0.84.0.bb     | 1 +
 2 files changed, 2 insertions(+)

diff --git a/meta-oe/recipes-support/poppler/poppler-data_0.4.9.bb b/meta-oe/recipes-support/poppler/poppler-data_0.4.9.bb
index b2af09715..eda3f7ecd 100644
--- a/meta-oe/recipes-support/poppler/poppler-data_0.4.9.bb
+++ b/meta-oe/recipes-support/poppler/poppler-data_0.4.9.bb
@@ -1,6 +1,7 @@
 SUMMARY = "Encoding files for Poppler"
 DESCRIPTION = "Encoding files for use with poppler that enable poppler to \
                correctly render CJK and Cyrrilic."
+HOMEPAGE = "https://poppler.freedesktop.org/"
 LICENSE = "BSD & GPLv2 & GPLv3+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4870b98343f0bbb25fa43b9d2ba59448 \
                     file://COPYING.adobe;md5=63c6a8a9df204c00461fa5f163d8a663 \
diff --git a/meta-oe/recipes-support/poppler/poppler_0.84.0.bb b/meta-oe/recipes-support/poppler/poppler_0.84.0.bb
index 0f3e50571..5153868b6 100644
--- a/meta-oe/recipes-support/poppler/poppler_0.84.0.bb
+++ b/meta-oe/recipes-support/poppler/poppler_0.84.0.bb
@@ -1,4 +1,5 @@
 SUMMARY = "Poppler is a PDF rendering library based on the xpdf-3.0 code base"
+HOMEPAGE = "https://poppler.freedesktop.org/"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"

--
2.24.0

