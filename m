Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f44.google.com (mail-yh0-f44.google.com
	[209.85.213.44])
	by mail.openembedded.org (Postfix) with ESMTP id AABEE6AFF4
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  5 Jul 2013 17:01:31 +0000 (UTC)
Received: by mail-yh0-f44.google.com with SMTP id t59so929842yho.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 05 Jul 2013 10:01:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:x-mailer;
	bh=khs12lyH//HmDtBsDGn5Nj1TLovQrYWTgyQIQN1HY4U=;
	b=tPJaKeqS7VO47NSCPEqWityYm6l3up/1gE9wV0+Wp5OKucOiaJdKrZpAFkIu0E4mR9
	PPUoPTjy8ke1mQV8t9CFiAngKQwXmMTr/EFgeZHslJbkZaUcFtg2jMXjiXlVyp5a5drE
	8PRXM9VkgaYNekLoZ40j0yI5OOyw/rPtq+cV1n5u2IAqmGXrkHmeOZv/oHM5oP+573B8
	/k30Xd8PD0/0wlV8ixgkd+tVTV7Y3/gvn64ELUQGPS0qrxTkznmYEoqb8CLM6R+GpDSh
	4XGRxPE/jXH1fkPuFEdhrfmTmxrtXO/Wtj7XySvpsm1H7CRL5B6WqOMVJ3FIcoGavqJP
	s8lg==
X-Received: by 10.236.19.164 with SMTP id n24mr6385138yhn.92.1373043691981;
	Fri, 05 Jul 2013 10:01:31 -0700 (PDT)
Received: from nano.lab.ossystems.com.br ([177.194.194.146])
	by mx.google.com with ESMTPSA id
	s80sm13836674yhe.27.2013.07.05.10.01.30 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 05 Jul 2013 10:01:31 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Meta-OpenEmbedded Mailing listing
	<openembedded-devel@lists.openembedded.org>
Date: Fri,  5 Jul 2013 14:01:16 -0300
Message-Id: <1373043676-5621-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.8.3.1
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-oe PATCH] busybox: Follow OE-Core update to 1.12.1 version
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
X-List-Received-Date: Fri, 05 Jul 2013 17:01:31 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 .../busybox/{busybox_1.20.2.bbappend => busybox_1.21.1.bbappend}        | 2 --
 1 file changed, 2 deletions(-)
 rename meta-oe/recipes-core/busybox/{busybox_1.20.2.bbappend => busybox_1.21.1.bbappend} (91%)

diff --git a/meta-oe/recipes-core/busybox/busybox_1.20.2.bbappend b/meta-oe/recipes-core/busybox/busybox_1.21.1.bbappend
similarity index 91%
rename from meta-oe/recipes-core/busybox/busybox_1.20.2.bbappend
rename to meta-oe/recipes-core/busybox/busybox_1.21.1.bbappend
index 721ef19..7a2f0c3 100644
--- a/meta-oe/recipes-core/busybox/busybox_1.20.2.bbappend
+++ b/meta-oe/recipes-core/busybox/busybox_1.21.1.bbappend
@@ -1,5 +1,3 @@
-PRINC := "${@int(PRINC) + 1}"
-
 # look for files in the layer first
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
-- 
1.8.3.1


