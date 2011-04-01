Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Q5mT7-00033V-Qd
	for openembedded-devel@lists.openembedded.org;
	Sat, 02 Apr 2011 00:05:26 +0200
Received: by mail-iy0-f175.google.com with SMTP id 7so4322131iye.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 01 Apr 2011 15:03:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=ol3KgIxdnaAVZH9ZRP2PLef8n3YIeEQcDiiGJZRoWE4=;
	b=NgaBprYTm4G0jB+IHhdRp7lalOLg4fGrmQI3SRhHewWzDDHQu3rvgMOiuReHrvZKMv
	SCNePdgtcI5TLVurTnpF+p/u01aTv9/pbZjtJ2lphVivR/D6KWaCQX2Eiv/Z3mEWmnHN
	7JYN4hUYZTeShTl6dd08669PBxZ2Ot5qfq+DY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=QtuvhA3s0kUVcHkPWlwyTvGWnfi2qpQphZK87vU6X/s29QYA+d56qQ7RGscIE9mEEf
	wCeoQUOV0OYINqFZgfqJWNcIBzw+UXTJ15kJowidv4hc/GshVh+558huF5De95AH9Onh
	pW3T6ufdcDHy5CPiZZLnrKnzwXriX6pX1/auA=
Received: by 10.42.220.67 with SMTP id hx3mr5218961icb.173.1301695405151;
	Fri, 01 Apr 2011 15:03:25 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id wu1sm1544394icb.22.2011.04.01.15.03.23
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 01 Apr 2011 15:03:24 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  1 Apr 2011 15:03:15 -0700
Message-Id: <90a6ce7d6def19cdd72b7f6f5d98f175d4723839.1301695158.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1301695158.git.raj.khem@gmail.com>
References: <cover.1301695158.git.raj.khem@gmail.com>
Subject: [meta-oe][PATCH 7/7] libgpg-error_1.8.bb: Inherit gettext
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
X-List-Received-Date: Fri, 01 Apr 2011 22:05:26 -0000

It uses gettext but was not specifying the dependency

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../libgpg-error/libgpg-error_1.8.bb               |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta-oe/recipes-support/libgpg-error/libgpg-error_1.8.bb b/meta-oe/recipes-support/libgpg-error/libgpg-error_1.8.bb
index 19a3c26..2c17e53 100644
--- a/meta-oe/recipes-support/libgpg-error/libgpg-error_1.8.bb
+++ b/meta-oe/recipes-support/libgpg-error/libgpg-error_1.8.bb
@@ -24,4 +24,4 @@ SRC_URI = "ftp://ftp.gnupg.org/gcrypt/libgpg-error/libgpg-error-${PV}.tar.bz2 \
 FILES_${PN} = "${libdir}/lib*.so.*"
 FILES_${PN}-dev += "${bindir}/*"
 
-inherit autotools binconfig pkgconfig
+inherit autotools binconfig pkgconfig gettext
-- 
1.7.4.1



