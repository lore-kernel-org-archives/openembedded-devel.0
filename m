Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SedBq-0007Nf-Lg
	for openembedded-devel@lists.openembedded.org;
	Wed, 13 Jun 2012 04:20:11 +0200
Received: by dalh21 with SMTP id h21so260621dal.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Jun 2012 19:09:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=Kruj0zkaz/V+kHBWE/0jqchdMZn6gecl4R012gZogJE=;
	b=O355Hz+q4/EshSQ8T3BRrv4zT3Ds0DaD8A6hNT6zNcoOB6i7UpoVM5j0uNwGo3ynL2
	00MJXyktABQ5TvUTTETtSH0f2jOlxxTQrWyboaeuItJ7GEfrdoLnOrY+mOlDuLYE5yAQ
	QRtknbpGYmQwhQu2o67ypD7I/VUAAu44vxQ5DQ+hBIG2DjzaIf63cpoUvr8opaqT4RyS
	R/W+gTVwkiDqhQsowtiBaumM7WgZX5J+LOMEO4MqQSehXAXME7m1a63HJjxG/WHMkuny
	ODXpyE9rVbWmuMgCqvu47r1SMev9RFaurJQB14Jo413vqEe9quhzoRIQSK1e1CBWebx1
	mjyA==
Received: by 10.68.201.9 with SMTP id jw9mr10340339pbc.28.1339553374596;
	Tue, 12 Jun 2012 19:09:34 -0700 (PDT)
Received: from leo.gateway.2wire.net
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPS id qn1sm3979804pbc.9.2012.06.12.19.09.32
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 12 Jun 2012 19:09:33 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 12 Jun 2012 19:09:14 -0700
Message-Id: <1339553354-14747-3-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1339553354-14747-1-git-send-email-raj.khem@gmail.com>
References: <1339553354-14747-1-git-send-email-raj.khem@gmail.com>
Subject: [2011.03-maintenance][PATCH 3/3] classes/mirrors.bbclass: update debian snapshot mirror url
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
X-List-Received-Date: Wed, 13 Jun 2012 02:20:11 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 classes/mirrors.bbclass |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/classes/mirrors.bbclass b/classes/mirrors.bbclass
index 71ee5f6..bb4f1ec 100644
--- a/classes/mirrors.bbclass
+++ b/classes/mirrors.bbclass
@@ -1,6 +1,6 @@
 MIRRORS[func] = "0"
 MIRRORS () {
-${DEBIAN_MIRROR}/main	http://snapshot.debian.net/archive/pool
+${DEBIAN_MIRROR}/main   http://snapshot.debian.org/archive/debian-archive/20120328T092752Z/debian/pool
 ${DEBIAN_MIRROR}	ftp://ftp.de.debian.org/debian/pool
 ${DEBIAN_MIRROR}	ftp://ftp.au.debian.org/debian/pool
 ${DEBIAN_MIRROR}	ftp://ftp.cl.debian.org/debian/pool
-- 
1.7.9.5



