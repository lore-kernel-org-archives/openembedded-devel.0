Return-Path: <andrea.adami@gmail.com>
Received: from mail-wg0-f45.google.com (mail-wg0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id 8971F707B0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Jul 2014 21:28:01 +0000 (UTC)
Received: by mail-wg0-f45.google.com with SMTP id x12so3334835wgg.4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Jul 2014 14:28:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=eXnPKU/aj9kyDLmGiUoEIRZsbvn4Kh4+x0I5HabgHh8=;
	b=cys4UXXH0PfNZLmLeisYlyCe1dSKAqaAdisZxtD/kpuUM7/frh1YblTd9tNk+lPu7x
	chglnZ/NAFRGZ1AumrRV7VntDlmLbr/u0Jfhf2xESSNHwZyjIHVZlwD39agE26wgatgP
	riXKhKmYXuy0F8BKac7QuX3Jfsg/6tUw1ITDdlhKBS8hM3Mp3dYxR6EH6lVsXW4FaxIn
	xCsDGw954zqA52zoK12Q8kjxGV+fSaFKgrBqrt2pPjx32RqAuqBvhgdxauudd6ZZGzKe
	rf2Kl1QyVsTWdhr+hXE+Wep2TDW+y0bOcSkMl3CiBMgXaLAMBcjSGOi6JUk48sBJioE4
	5OSw==
X-Received: by 10.194.90.79 with SMTP id bu15mr16081492wjb.17.1406237282646;
	Thu, 24 Jul 2014 14:28:02 -0700 (PDT)
Received: from mizar.208.67.220.220
	(host253-222-dynamic.20-79-r.retail.telecomitalia.it.
	[79.20.222.253])
	by mx.google.com with ESMTPSA id ub11sm9613wib.1.2014.07.24.14.28.01
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 24 Jul 2014 14:28:01 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 24 Jul 2014 23:27:37 +0200
Message-Id: <1406237257-13724-2-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1406237257-13724-1-git-send-email-andrea.adami@gmail.com>
References: <1406237257-13724-1-git-send-email-andrea.adami@gmail.com>
Subject: [meta-initramfs][PATCH] klibc-utils: add explicit dependency on klibc for the shared utils
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
X-List-Received-Date: Thu, 24 Jul 2014 21:28:05 -0000

The two recipes for klibc-utils (static and shared) have been split-off
from a single original recipe for more granular packaging and share the
same SRC_URI set in the .inc file so there is an implicit dependency.
Make it explicit for the utils needing the shared klibc lib at runtime.

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 meta-initramfs/recipes-devtools/klibc/klibc-utils_2.0.4.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-initramfs/recipes-devtools/klibc/klibc-utils_2.0.4.bb b/meta-initramfs/recipes-devtools/klibc/klibc-utils_2.0.4.bb
index fc53bec..06e71cb 100644
--- a/meta-initramfs/recipes-devtools/klibc/klibc-utils_2.0.4.bb
+++ b/meta-initramfs/recipes-devtools/klibc/klibc-utils_2.0.4.bb
@@ -10,3 +10,5 @@ KLIBC_UTILS_PKGNAME = "klibc-utils"
 
 require klibc-utils.inc
 require klibc.inc
+
+DEPENDS = "klibc"
-- 
1.9.1


