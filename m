Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SOkKd-0004Pt-Ez
	for openembedded-devel@lists.openembedded.org;
	Mon, 30 Apr 2012 08:43:35 +0200
Received: by wera1 with SMTP id a1so1806017wer.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 Apr 2012 23:33:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=Xo/RM+V4eZP0Vg65UIKMDer/0UBQOnjHmPB5Rj0skOA=;
	b=zGoTErHMaVYg86fxpnctsLjkWwEFaWIca6Z9UHd6W+dRXncQ5vxEYZX/JbMfHki0o0
	scDoZ9MZmbTsHbSND2KONlYnMtngfNIOYtqXdV++79vW71yNMUAsFFZuNDQL4ci5b3C2
	wTPkzsSrrS4sbHtWX4+613+pqCqRHzHd/1k93JmKxGeXHsjVhyHTQVe8dfk518yT2CDw
	G6CUfK74mlooVwZA0OaceaCwDwOOkTUuSVeCaIByJan2TSTfsRh/bRkGt8cq9kaYvtj5
	/aHKDrGCBZP2lNeM4o6pkqpfn7hftRiRsOpXOyZXaSz2Vd0yAvqoe3gQvDViNvCRGN7j
	NkFg==
Received: by 10.180.97.4 with SMTP id dw4mr26008230wib.18.1335767633709;
	Sun, 29 Apr 2012 23:33:53 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id ca3sm26396543wib.6.2012.04.29.23.33.52
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 29 Apr 2012 23:33:53 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 30 Apr 2012 08:33:01 +0200
Message-Id: <bf0abb70b022b006ae372d2a09c9b9f6eda96550.1335767139.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
In-Reply-To: <cover.1335767139.git.Martin.Jansa@gmail.com>
References: <cover.1335767139.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1335767139.git.Martin.Jansa@gmail.com>
References: <cover.1335767139.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 04/16] gpsd-3.4: drop pkgconfig=''
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
X-List-Received-Date: Mon, 30 Apr 2012 06:43:35 -0000

* this is wrong, it's used as path where to install .pc files
  and we expect them in  not directly in sysroot

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-navigation/gpsd/gpsd_3.4.bb |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/meta-oe/recipes-navigation/gpsd/gpsd_3.4.bb b/meta-oe/recipes-navigation/gpsd/gpsd_3.4.bb
index 0e67555..9584e55 100644
--- a/meta-oe/recipes-navigation/gpsd/gpsd_3.4.bb
+++ b/meta-oe/recipes-navigation/gpsd/gpsd_3.4.bb
@@ -34,7 +34,6 @@ EXTRA_OESCONS = " \
   debug='true' \
   strip='false' \
   systemd='true' \
-  pkgconfig='${PKG_CONFIG_DIR}' \
 "
 
 do_compile_prepend() {
-- 
1.7.8.6



