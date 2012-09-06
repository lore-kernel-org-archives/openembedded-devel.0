Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1T9aNO-0002QD-Aq
	for openembedded-devel@lists.openembedded.org;
	Thu, 06 Sep 2012 13:36:02 +0200
Received: by wgbdr1 with SMTP id dr1so1269535wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 06 Sep 2012 04:23:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=Er6yhf/nm8mikMkuixg4M2IBgHsmY4Gz2qepBFB9hXI=;
	b=hvukzo/7gFwXXS/8oLfTEj7BDNuX9xMt88YjT0F7NbqILoZXVXRZxsxVF4P03AEUpA
	tnxUBYH8dv4WkQ5GU1e/3xpCN3R2MiFwr6uphbbPdT7ObINpOZjlFVXYBSXSqrSPf/9Z
	a+oXxTjfhbn6RJJ7SR3bQSwx/eLLFC8d7CElJ/zSDPrdedGZBfCW7bFbCo3pOEIKpETK
	w3X0RJsBocTc+NclqO9wTipZJfBYXQ+YsaR+ofEl2SI6PH05ILTvvqUI4Usr1HaLE4Yv
	I+JRfmYmR5UGDo6i+WJST6vRK7Rm0N+eX8vEEUlH1hB9OnQkRF70hG6Ttp+HckfswZM7
	ng4Q==
Received: by 10.180.107.163 with SMTP id hd3mr4179417wib.19.1346930618308;
	Thu, 06 Sep 2012 04:23:38 -0700 (PDT)
Received: from localhost.localdomain (ip4da2a5ae.direct-adsl.nl.
	[77.162.165.174])
	by mx.google.com with ESMTPS id hv8sm3682950wib.0.2012.09.06.04.23.36
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 06 Sep 2012 04:23:37 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  6 Sep 2012 13:23:26 +0200
Message-Id: <1346930610-2977-4-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <1346930610-2977-1-git-send-email-koen@dominion.thruhere.net>
References: <1346930610-2977-1-git-send-email-koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQnxhHklB9I7B1CX+1X9HkvvYodFgen+FyNoqk/KikbsChcyTOL7VtBrI9/UkwBfB2y284y8
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	=?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
Subject: [meta-oe][for-denzil][PATCH 4/8] kernel.bbclass: Dont package kxgettext.o
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 06 Sep 2012 11:36:02 -0000

From: Khem Raj <raj.khem@gmail.com>

kxgettext.o is generated when building ppc kernels
so we end up with packaging errors like

> ERROR: QA Issue: Architecture did not match (20 to 62) on
> /work/virtex5-poky-linux/linux-xilinx-2.6.38-r00/packages-split/kernel-dev/usr/src/kernel/scripts/kconfig/kxgettext.o

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Saul Wold <sgw@linux.intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta-oe/classes/kernel.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta-oe/classes/kernel.bbclass b/meta-oe/classes/kernel.bbclass
index d7e42f6..b2f7d0c 100644
--- a/meta-oe/classes/kernel.bbclass
+++ b/meta-oe/classes/kernel.bbclass
@@ -196,7 +196,7 @@ kernel_do_install() {
 	# during do_package for cross-compiled platforms
 	bin_files="arch/powerpc/boot/addnote arch/powerpc/boot/hack-coff \
 	           arch/powerpc/boot/mktree scripts/kconfig/zconf.tab.o \
-		   scripts/kconfig/conf.o"
+		   scripts/kconfig/conf.o scripts/kconfig/kxgettext.o"
 	for entry in $bin_files; do
 		rm -f $kerneldir/$entry
 	done
-- 
1.7.7.6



