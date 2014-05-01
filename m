Return-Path: <andrea.adami@gmail.com>
Received: from mail-ee0-f53.google.com (mail-ee0-f53.google.com [74.125.83.53])
	by mail.openembedded.org (Postfix) with ESMTP id B34A765E23
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 May 2014 23:13:44 +0000 (UTC)
Received: by mail-ee0-f53.google.com with SMTP id b15so1484702eek.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 May 2014 16:13:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=9rZqGY4LWWGcpWlFf8fIotK3QJAhWuLqOvYCWIW4FcU=;
	b=gi0y7fAgRd5H/jygLDOsdb4NO60dO/7SmMcE7bC7mteKfwSw8H7oN67nCGwnNvBKrv
	dddOzLlxXTwn6YfA2U/m5xUeMY2Nd2poX8XPQVB8abZrVycie/gaJESRaEIIefJKZLAQ
	G5n7ybnqJb6S3pRHxbyx8CJ21CNPbNstaoFWrbxgaf7iMErRaDeTmLxG6NFWSdhsis9d
	XFgFK0MONKssOU00Ha1H6cKM+V7YNAObepmKC429aEokNFUEufM3sofEfIBYx7k07Bxb
	PqboVXjtBhmkPF33FsS2AORrtkfedc8yYhPx8+aSO7C6aRJKaYjW5ce0RfNFXVY0ljud
	bJLg==
X-Received: by 10.14.219.137 with SMTP id m9mr11747254eep.77.1398986024823;
	Thu, 01 May 2014 16:13:44 -0700 (PDT)
Received: from mizar.208.67.220.220
	(host182-253-dynamic.10-79-r.retail.telecomitalia.it.
	[79.10.253.182])
	by mx.google.com with ESMTPSA id u46sm79804495eel.1.2014.05.01.16.13.43
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 01 May 2014 16:13:44 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  2 May 2014 01:13:29 +0200
Message-Id: <1398986009-20163-2-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1398986009-20163-1-git-send-email-andrea.adami@gmail.com>
References: <1398986009-20163-1-git-send-email-andrea.adami@gmail.com>
Subject: [meta-initramfs][PATCH] kexecboot: fix build when S != B
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
X-List-Received-Date: Thu, 01 May 2014 23:13:45 -0000

* temporarily inherit autotools-brokensep
* proper fix sent upstream

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 meta-initramfs/recipes-bsp/kexecboot/kexecboot_0.6.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-initramfs/recipes-bsp/kexecboot/kexecboot_0.6.bb b/meta-initramfs/recipes-bsp/kexecboot/kexecboot_0.6.bb
index 4657505..d0176c5 100644
--- a/meta-initramfs/recipes-bsp/kexecboot/kexecboot_0.6.bb
+++ b/meta-initramfs/recipes-bsp/kexecboot/kexecboot_0.6.bb
@@ -42,7 +42,7 @@ SRC_URI = "https://github.com/kexecboot/kexecboot/archive/v${PV}.tar.gz"
 SRC_URI[md5sum] = "46b7c1a6f20531be56445ebb8669a2b8"
 SRC_URI[sha256sum] = "6b360b8aa59bc5d68a96705349a0dd416f8ed704e931fa0ac7849298258f0f15"
 
-inherit autotools
+inherit autotools-brokensep
 
 EXTRA_OECONF = "--enable-delay=2 --enable-evdev-rate=1000,250"
 
-- 
1.9.1


