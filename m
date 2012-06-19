Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Sgt8M-0005F9-L0
	for openembedded-devel@lists.openembedded.org;
	Tue, 19 Jun 2012 09:45:54 +0200
Received: by werg55 with SMTP id g55so4051106wer.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Jun 2012 00:35:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=dK19OleVG/dcoedbhEOFrSC995LvjejIOMSJl2zitxg=;
	b=EIrfFMPU59orzIf9C3P0FFH/T28kcuaREhJ4ca6QxwJlOFsPfi865WTz39mdDLpcHa
	HVDvkGilkZGi/4SDMDG1gti81Yewiay/l2MIDdjpWpbcz9yqX97c2h/CJUY5IdZDdD9S
	pq/TvEvrMUp+uorp6YMWei8BGx4lTpvKTxPxy/PE/G6e4LPXsZWAdeNdX4/l9Q3sxhOB
	x8ZEYJaiqUMeTU2ajCbNw+kBdJzl696S4pPXqtaFufuPGT0mVa830qzMfzjhHW0DLZaL
	kZ899sTXJluX1ONvg+NUCoCG/jTScr7hQsCQtlvJhKoXqc9je2YHnDVAXDMr2UA1idC/
	pJLQ==
Received: by 10.180.24.39 with SMTP id r7mr914309wif.9.1340091311542;
	Tue, 19 Jun 2012 00:35:11 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id d3sm55906158wiz.9.2012.06.19.00.35.10
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 19 Jun 2012 00:35:10 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 19 Jun 2012 09:34:56 +0200
Message-Id: <1340091296-5157-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
Subject: [meta-oe][PATCH] kernel.bbclass: pass KERNEL_VERSION to depmod calls in postinst
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
X-List-Received-Date: Tue, 19 Jun 2012 07:45:54 -0000

* without this, kernel upgrades where KERNEL_VERSION is changed
  e.g. 3.4.2 -> 3.4.3 generate .dep for running 3.4.2 and after reboot user ends
  up without any module loaded to make it worse after reboot nothing is upgraded
  to trigger another kernel(-module) postinst to generate .dep for now running 3.4.3

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/classes/kernel.bbclass |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/classes/kernel.bbclass b/meta-oe/classes/kernel.bbclass
index b431f8e..b30ed36 100644
--- a/meta-oe/classes/kernel.bbclass
+++ b/meta-oe/classes/kernel.bbclass
@@ -276,13 +276,13 @@ fi
 if [ -n "$D" ]; then
 	depmod -a -b $D -F ${STAGING_KERNEL_DIR}/System.map-${KERNEL_VERSION} ${KERNEL_VERSION}
 else
-	depmod -a
+	depmod -a ${KERNEL_VERSION}
 fi
 }
 
 pkg_postinst_modules () {
 if [ -z "$D" ]; then
-	depmod -a
+	depmod -a ${KERNEL_VERSION}
 	update-modules || true
 fi
 }
-- 
1.7.8.6



