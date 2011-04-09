Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <heroor@gmail.com>) id 1Q8RC3-0000yJ-Ur
	for openembedded-devel@lists.openembedded.org;
	Sat, 09 Apr 2011 07:58:48 +0200
Received: by yxn22 with SMTP id 22so1699227yxn.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 08 Apr 2011 22:56:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=wk7B23nB0B05ThR4MbpTLCiMCMDja0m81N1Wsz9puoQ=;
	b=bokHd2pnMU9FpWoZryIss0BFHufR5n2mUabdQNjfDuM7MZwQgn6MvchweGfReVCqIv
	3XjcNO25m99HS0hMM5Ar7qsm6cFBykpypXzuEauB7PBg6TNWSGHnV1jx+1W3o/nsjRHG
	e+FUujYPE4hGJYD/+VgYS5QPeP7+lZX0EoNrw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=lNQ9nQo+9jrVubj7ZexzdxeKhnMXBZPG5b1chWZLxw7Ym6Fn9HBPFwcTL/IVvZk9to
	Yr082h93STNstuHTewvjQBc4fPTE7YI3cxzUMfEgllJc34ybDDSuM85FIoGzgd9vlpEZ
	qLtU+Xzqj8HVGD1/Pa4FAOC69FEdXaxSyaXoo=
Received: by 10.150.62.1 with SMTP id k1mr2555709yba.382.1302328597044;
	Fri, 08 Apr 2011 22:56:37 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com [192.94.94.33])
	by mx.google.com with ESMTPS id p28sm280822ybk.0.2011.04.08.22.56.34
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 08 Apr 2011 22:56:36 -0700 (PDT)
From: Siddharth Heroor <heroor@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  9 Apr 2011 11:26:21 +0530
Message-Id: <1302328581-30367-3-git-send-email-heroor@gmail.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1302328581-30367-1-git-send-email-heroor@gmail.com>
References: <1302328581-30367-1-git-send-email-heroor@gmail.com>
Cc: Siddharth Heroor <heroor@ti.com>
Subject: [PATCH 3/3] libgles-omap3: Remove SGX Fixup for TI816x.
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
X-List-Received-Date: Sat, 09 Apr 2011 05:58:48 -0000

From: Siddharth Heroor <heroor@ti.com>

* Unlike OMAP3, the SGX core has not undergone revisions in TI816x.
  The libraries for TI816x are also fixed and do not need fixup based
  on revision of the SGX core.

Signed-off-by: Siddharth Heroor <heroor@ti.com>
---
 recipes/powervr-drivers/libgles-omap3/rc.pvr |   10 +++-------
 1 files changed, 3 insertions(+), 7 deletions(-)

diff --git a/recipes/powervr-drivers/libgles-omap3/rc.pvr b/recipes/powervr-drivers/libgles-omap3/rc.pvr
index 395d085..1b141a0 100755
--- a/recipes/powervr-drivers/libgles-omap3/rc.pvr
+++ b/recipes/powervr-drivers/libgles-omap3/rc.pvr
@@ -90,15 +90,11 @@ case $CPUTYPE in
 	devmem2 0x48180900 w 0x2
 	devmem2 0x48180920 w 0x2
 
+	sleep 2
+
 	ES_REVISION="$(devmem2 0x56000014 | sed -e s:0x00010205:5: -e s:0x00010201:3: -e s:0x00010003:2: | tail -n1 | awk -F': ' '{print $2}')"
 
-	if [ "${ES_REVISION}" != "${SAVED_ESREVISION}" ] ; then
-		echo -n "Starting SGX fixup for"
-		echo " ES${ES_REVISION}.x"
-		cp -a /usr/lib/ES${ES_REVISION}.0/* /usr/lib
-		cp -a /usr/bin/ES${ES_REVISION}.0/* /usr/bin	
-		echo "${ES_REVISION}" > /etc/powervr-esrev
-	fi
+	echo "${ES_REVISION}" > /etc/powervr-esrev
 	/usr/bin/pvrsrvinit
 
 	;;
-- 
1.7.0.4



