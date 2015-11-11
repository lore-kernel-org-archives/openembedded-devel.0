Return-Path: <armccurdy@gmail.com>
Received: from mail-io0-f169.google.com (mail-io0-f169.google.com
	[209.85.223.169])
	by mail.openembedded.org (Postfix) with ESMTP id D340B770EF
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Nov 2015 04:48:28 +0000 (UTC)
Received: by iouu10 with SMTP id u10so15692143iou.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Nov 2015 20:48:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=YalYAsznMa8letuKzO42I0SV3NlhAK8OvDZKYfuSjH0=;
	b=NrQkutv6GEXj2lr9NjIq1whMcndtIS3bGPiF+b93cmikcOr1cmhzhMpVCjiG/3bmdw
	xQq26DZIZnpDmdej2MFT0/CZivA3cdfo5B4rv1akv7Luq6jeM4dzzhqGiRevys+I4FCq
	ZWremza7EHnndpSuKd+23hyF6YBb+5ECUqqTr8J+ubXWsk9LPsupwkGes0JFNcn3ZwUI
	hPqyxhqupZfXVEB/AJRAWk8zGoT00ZgF8PmsFf5j27UzTfBrvEq18WODlOEE2iwDiBVD
	WTImuiLByQqcaGiuCYLmjAmr/+YBPQmhkbdGz9Kc4aP4cmKLz0jaXhLYEznsgkEXgzeo
	c2hg==
X-Received: by 10.107.44.9 with SMTP id s9mr7221486ios.191.1447217308835;
	Tue, 10 Nov 2015 20:48:28 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id
	ie20sm2628295igb.10.2015.11.10.20.48.27
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 10 Nov 2015 20:48:27 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 10 Nov 2015 20:48:16 -0800
Message-Id: <1447217296-7145-2-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1447217296-7145-1-git-send-email-armccurdy@gmail.com>
References: <1447217296-7145-1-git-send-email-armccurdy@gmail.com>
Subject: [meta-browser][PATCH 2/2] chromium: use PARALLEL_MAKE to control build parallelism
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 11 Nov 2015 04:48:29 -0000

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 recipes-browser/chromium/chromium_40.0.2214.91.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-browser/chromium/chromium_40.0.2214.91.bb b/recipes-browser/chromium/chromium_40.0.2214.91.bb
index a9635cd..f20610c 100644
--- a/recipes-browser/chromium/chromium_40.0.2214.91.bb
+++ b/recipes-browser/chromium/chromium_40.0.2214.91.bb
@@ -196,7 +196,7 @@ do_configure_append() {
 
 do_compile() {
         # build with ninja
-        ninja -C ${S}/out/${CHROMIUM_BUILD_TYPE} -j${BB_NUMBER_THREADS} chrome chrome_sandbox
+        ninja -C ${S}/out/${CHROMIUM_BUILD_TYPE} ${PARALLEL_MAKE} chrome chrome_sandbox
 }
 
 
-- 
1.9.1


