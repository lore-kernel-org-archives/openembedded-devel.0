Return-Path: <andrea.adami@gmail.com>
Received: from mail-ee0-f51.google.com (mail-ee0-f51.google.com [74.125.83.51])
	by mail.openembedded.org (Postfix) with ESMTP id E31E36D5A4
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  8 Nov 2013 01:02:51 +0000 (UTC)
Received: by mail-ee0-f51.google.com with SMTP id t10so666126eei.38
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Nov 2013 17:02:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=53jklRXH4yZoG7jWvcDBeockocUuCRzaFqbcHYU3tQs=;
	b=SgCZCg07z8IeHRr0a2Ey6P8FmpXfIWZP/xz/thmFomp5T3LQoM6xKJmvW/dQxqdoFv
	T70wxT1P7rRkI3k/Qa6nwFhWg3ooS3EyOm4QvON6zt6Zg3e1GhDKG30oPvL7pXA234sP
	sJ8QRSjMnpZLdUpDPUftGmxrM+hF8iOF1iQa8VCwgdpeNFZfWwfiARfl73Zf7Q2KdWWk
	x1SyMSAo/YjiDH+AUjYds2xwzcdarLSlijEHNYMERGTAZhOu/PRiJ7VHqAF1D84acaaF
	QQ85aqBdGV9MdWPyhiUfeXjM/N9m+hrHQjI3LTLKF0dvThhtxENratynhtspRlje0NeB
	S2UA==
X-Received: by 10.14.183.130 with SMTP id q2mr50146eem.64.1383872573455;
	Thu, 07 Nov 2013 17:02:53 -0800 (PST)
Received: from mizar.localdomain
	(host33-1-dynamic.51-79-r.retail.telecomitalia.it. [79.51.1.33])
	by mx.google.com with ESMTPSA id
	v45sm15949739eef.11.2013.11.07.17.02.52 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 07 Nov 2013 17:02:53 -0800 (PST)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  8 Nov 2013 02:02:30 +0100
Message-Id: <7b5e5b33dbfaf3b93d05838b4d1cfa0a4bb710d0.1383870605.git.andrea.adami@gmail.com>
X-Mailer: git-send-email 1.8.1.5
In-Reply-To: <cover.1383870605.git.andrea.adami@gmail.com>
References: <cover.1383870605.git.andrea.adami@gmail.com>
In-Reply-To: <cover.1383870605.git.andrea.adami@gmail.com>
References: <cover.1383870605.git.andrea.adami@gmail.com>
Subject: [meta-handheld][PATCH 3/6] linux-yocto: collie: revert jedec_probe patch
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
X-List-Received-Date: Fri, 08 Nov 2013 01:02:52 -0000

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 recipes-kernel/linux/linux-yocto-3.10/collie/collie.scc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-kernel/linux/linux-yocto-3.10/collie/collie.scc b/recipes-kernel/linux/linux-yocto-3.10/collie/collie.scc
index 2ce8650..4f60d81 100644
--- a/recipes-kernel/linux/linux-yocto-3.10/collie/collie.scc
+++ b/recipes-kernel/linux/linux-yocto-3.10/collie/collie.scc
@@ -6,5 +6,5 @@ patch ../patches/patches-locomokbd/locomo_kbd_tweak-r2.patch
 patch ../patches/patches-power/collie_battery-dev-pm.patch
 patch ../patches/patches-mfd/mcp-device.patch
 patch ../patches/patches-mfd/ucb1x00-device.patch
-patch ../patches/patches-mtd/collie-jedec-probe.patch
+//patch ../patches/patches-mtd/collie-jedec-probe.patch
 patch ../patches/patches-mtd/collie-eraseinfo.patch
-- 
1.8.1.5


