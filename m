Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1T9aNR-0002Pu-EM
	for openembedded-devel@lists.openembedded.org;
	Thu, 06 Sep 2012 13:36:05 +0200
Received: by mail-wi0-f171.google.com with SMTP id hq4so5499674wib.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 06 Sep 2012 04:23:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=OSglF1AndFTRf+r1VsDQL2nAOASmNgrXs2ZoQeVsUTM=;
	b=bHSG/7PVApOYXnDGOTAJIlY8lh3AFhLZ5NGnrxqs0yjjmFy7hLg1iwIiC5jtlASvRn
	RKvYdYiK/zjzymVGrweLsB8NeUaYXXTBEuTvpte/MDjtvKYrxaOy2yYfhbYHkghFy4OZ
	+U+RHxhLQl9ku6U91M76rBltLpE9AGVPUS7huXv0JvmoGpRpcU4l7cOcwR9qeUlyZhih
	spiHV9q2J4TY/TyXwQ/JK3TiZIx5ws1dCg7xtMMPO3CURmRHeJ3NqnryiEqvZkxTOx/F
	T7wjSR2ggwPXHQIPcSrtPdkMviSwTrYcZjU/wAoma60LPoneKBm/fTLh9p/G8nIVRW6i
	OUqw==
Received: by 10.216.198.10 with SMTP id u10mr1065403wen.80.1346930623475;
	Thu, 06 Sep 2012 04:23:43 -0700 (PDT)
Received: from localhost.localdomain (ip4da2a5ae.direct-adsl.nl.
	[77.162.165.174])
	by mx.google.com with ESMTPS id hv8sm3682950wib.0.2012.09.06.04.23.41
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 06 Sep 2012 04:23:42 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  6 Sep 2012 13:23:29 +0200
Message-Id: <1346930610-2977-7-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <1346930610-2977-1-git-send-email-koen@dominion.thruhere.net>
References: <1346930610-2977-1-git-send-email-koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQlqbA7rfe1jgQvi2y3kuvrHJw8dZU/m3E1GFynEkcX1+kSPCQ0I4YYx4jjrpBmR/yuqS99T
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	=?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
Subject: [meta-oe][for-denzil][PATCH 7/8] kernel.bbclass: fix external module building
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
X-List-Received-Date: Thu, 06 Sep 2012 11:36:05 -0000

From: Denis Carikli <GNUtoo@no-log.org>

Without that fix we have the following while compiling compat-wireless.
  include/linux/mmzone.h:18:30: fatal error: generated/bounds.h: No such file or directory

Note that the compat-wireless recipe will be added in another commit.

Signed-off-by: Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>
Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta-oe/classes/kernel.bbclass |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/meta-oe/classes/kernel.bbclass b/meta-oe/classes/kernel.bbclass
index d5b3914..19fc4c6 100644
--- a/meta-oe/classes/kernel.bbclass
+++ b/meta-oe/classes/kernel.bbclass
@@ -192,6 +192,9 @@ kernel_do_install() {
 		cp arch/powerpc/lib/crtsavres.o $kerneldir/arch/powerpc/lib/crtsavres.o
 	fi
 
+	# Necessary for building modules like compat-wireless.
+	cp include/generated/bounds.h $kerneldir/include/generated/bounds.h
+
 	# Remove the following binaries which cause strip or arch QA errors
 	# during do_package for cross-compiled platforms
 	bin_files="arch/powerpc/boot/addnote arch/powerpc/boot/hack-coff \
-- 
1.7.7.6



