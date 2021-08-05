Received: from mail3.bemta25.messagelabs.com (mail3.bemta25.messagelabs.com [195.245.230.83])
 by mx.groups.io with SMTP id smtpd.web08.6291.1628152519766529001
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 05 Aug 2021 01:35:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=ImkkZEEc;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.83, mailfrom: zhengrq.fnst@fujitsu.com)
Return-Path: <zhengrq.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1628152517; i=@fujitsu.com;
	bh=szOoPqMaSh6CPpePWirlmN97iK8JRae1+j7lFGUare0=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=ImkkZEEcr8g2JypoTjaBDIW3/InOXVnafA5OIE70AAngu7DKwEs1MMc1rs/kNMiHA
	 AJUPvO4mNVKfirXEMDfquyldPDNQ7rrycEF9qImHrBEmx1IvjXX59KuJTKcTjyemfe
	 kHhg0j5k8M2O/rqMIrRKl1oatTMe3aHH2/W3ss+uo0SFJh9mj5QltfcashoCaK394T
	 UD3AA/BABV10oay9PwRgpqZy83J9lykYO9Q+RzMCsB52gIUlou5V1iJ0lBaq4zBSqO
	 GXeoTjfs1kcCsfCVumCDggqHakUno7l/rePR+MC1XJKts44FUCGO+MMKxe1zySliQf
	 bLu7hy+XGRb8A==
Received: from [100.112.198.129] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-b.eu-west-1.aws.symcld.net id A2/94-07821-5C2AB016; Thu, 05 Aug 2021 08:35:17 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupmkeJIrShJLcpLzFFi42Kxs+EI0T2yiDv
  RYOUNS4uLh5cyOzB6nNu4gjGAMYo1My8pvyKBNePe1vtMBRcEKi5deM7ewDift4uRi0NIYBaT
  xKcpT5ghnN2MEl2f+5m6GDk52AR0Jc49XssOYosI6Essnb2HGcQWFnCWeHFnNyuIzSKgIrHz4
  gSwGl4BD4m1P1azgdgSAgoSUx6+Z4aIC0qcnPmEBcRmFpCQOPjiBVCcA6hGUWL2dHmI8gqJ14
  cvMU9g5JmFpGMWko4FjEyrGC2SijLTM0pyEzNzdA0NDHQNDY10DS3NdQ2NzfUSq3ST9FJLdct
  Ti0t0DfUSy4v1iitzk3NS9PJSSzYxAsMopeBo5w7GX68+6B1ilORgUhLl1e/lThTiS8pPqcxI
  LM6ILyrNSS0+xCjDwaEkwVuxACgnWJSanlqRlpkDDGmYtAQHj5IILzNImre4IDG3ODMdInWKU
  VFKnFd1IVBCACSRUZoH1waLo0uMslLCvIwMDAxCPAWpRbmZJajyrxjFORiVhHnVQabwZOaVwE
  1/BbSYCWjxhVhOkMUliQgpqQambet3Wj7YHcXo+E9V21xRyeWJxn2ex/u68llKUiUs2BWK17e
  9DCu78kTwyIQ965a83HrMX/DKx8qMTxt9TDbNzkm5tG3dh+LqRMPDBZPuzTvQ/tv94La5ec1e
  h+a5Bi7jPBqw1vvbiWXn9z7vjfI583vTdh23YxotwavW7AjeuPlU7+e7ory3d+66oD9BavtxJ
  z+plsNl6k+un1R4u9tUa2OIAkP+fedV605NWfRsZ4zvkeoHiz4Fdx3kOqH1c4635sq5P9wXGB
  pfWRjHE/dkkvO+E1VdARcFs/3iNANcbjut+rMxyXj7w79SeWkfplrU291J5F3+qO+shNLvPGZ
  ZX83XK59e0sx9WL7C8fWWkllKLMUZiYZazEXFiQBZ6uv0HgMAAA==
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-17.tower-285.messagelabs.com!1628152516!619485!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 29489 invoked from network); 5 Aug 2021 08:35:16 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-17.tower-285.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 5 Aug 2021 08:35:16 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 1758Z8rk020609
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Thu, 5 Aug 2021 09:35:16 +0100
Received: from localhost.localdomain (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Thu, 5 Aug 2021 09:35:06 +0100
From: "zhengruoqin" <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] poppler: upgrade 21.07.0 -> 21.08.0
Date: Thu, 5 Aug 2021 16:34:15 +0800
Message-ID: <1628152455-23107-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Release 21.08.0:
        core:
         * Add API to allow addition and modification of outlines into a PDF
         * Use additional samples to test for constant parts of an axial gradient
         * forms: Create fallback fonts for some well known font names
         * Support reading the PDF Version from the Catalog
         * Fix XRef::copy when there are modified objects
         * Take into account that Date string may be in unicode
         * JBIG2Stream: Fix regression in "Do not consider a size-0 to be an error"
         * Replace a local bubble sort implementation by std::sort
         * Fix issues with malformed files

        build system:
         * Better error message when libjpeg is not found
         * Better error messages when libopenjpeg2 is not found

        qt5/qt6:
         * Document that a document has to outlive its pages
         * Make getPdfVersion return a dedicated version object

        glib:
         * mimick TextSelectionDumper logic change for spaceAfter

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 .../poppler/{poppler_21.07.0.bb => poppler_21.08.0.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/poppler/{poppler_21.07.0.bb => poppler_21.08.0.bb} (96%)

diff --git a/meta-oe/recipes-support/poppler/poppler_21.07.0.bb b/meta-oe/recipes-support/poppler/poppler_21.08.0.bb
similarity index 96%
rename from meta-oe/recipes-support/poppler/poppler_21.07.0.bb
rename to meta-oe/recipes-support/poppler/poppler_21.08.0.bb
index cfbd394bc..d3135a44c 100644
--- a/meta-oe/recipes-support/poppler/poppler_21.07.0.bb
+++ b/meta-oe/recipes-support/poppler/poppler_21.08.0.bb
@@ -7,7 +7,7 @@ SRC_URI = "http://poppler.freedesktop.org/${BP}.tar.xz \
            file://0001-Do-not-overwrite-all-our-build-flags.patch \
            file://basename-include.patch \
            "
-SRC_URI[sha256sum] = "e26ab29f68065de4d6562f0a3e2b5435a83ca92be573b99a1c81998fa286a4d4"
+SRC_URI[sha256sum] = "e9cf5dc5964bce4bb0264d1c4f8122706c910588b421cfc30abc97d6b23e602d"
 
 DEPENDS = "fontconfig zlib cairo lcms glib-2.0"
 
-- 
2.25.1

