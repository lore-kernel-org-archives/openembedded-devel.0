Received: from mail-ew0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1P3bF5-00026J-Ux
	for openembedded-devel@lists.openembedded.org;
	Wed, 06 Oct 2010 23:09:40 +0200
Received: by mail-ew0-f47.google.com with SMTP id 7so4192ewy.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 06 Oct 2010 14:09:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=nxJwpIEF7Lun2P3Ybngaf9d/3k/lvue7eKcT0wcvCHA=;
	b=WYsIFMG4ZR0gueKclMXKZ2x3Qhc48mwLIEdkl2hRJZnais2BYhzVAD6HHuT1OfDVi3
	aUh3ed3ETe7KYkQ0dJPAn/6XntpV5zni9qocPxBWiDCQDAT96hToaK36PjCX/KBNaQNd
	jZvollIXFj87GltR3X3Wb/tRx7m22l/EAM4ZQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=QBMFRDY1W/3IHq0hPKyu7EEwQy890ez5kncaRXhncIUHlM407inL1BED94IpwmN3Tw
	s1iO9doiEd2+ppsirQhkF1WVxnKrJ4xXMf0xnUuUjJBBfs9NcJGw1UUVZhkbk3X7tKl8
	zB3TGnVbKepXs8z0z1dBWHD/b5Au5z7C6i/BU=
Received: by 10.213.43.80 with SMTP id v16mr1019836ebe.80.1286399359954;
	Wed, 06 Oct 2010 14:09:19 -0700 (PDT)
Received: from localhost.localdomain (j200125.upc-j.chello.nl [24.132.200.125])
	by mx.google.com with ESMTPS id a48sm2171654eei.1.2010.10.06.14.09.18
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 06 Oct 2010 14:09:18 -0700 (PDT)
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  6 Oct 2010 23:08:59 +0200
Message-Id: <1286399340-15927-4-git-send-email-fransmeulenbroeks@gmail.com>
X-Mailer: git-send-email 1.6.4.2
In-Reply-To: <1286399340-15927-3-git-send-email-fransmeulenbroeks@gmail.com>
References: <1286399340-15927-1-git-send-email-fransmeulenbroeks@gmail.com>
	<1286399340-15927-2-git-send-email-fransmeulenbroeks@gmail.com>
	<1286399340-15927-3-git-send-email-fransmeulenbroeks@gmail.com>
X-SA-Exim-Connect-IP: 209.85.215.47
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS,
	SUBJ_ALL_CAPS autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 3/4] RDEPENDS -> RDEPENDS_${PN}
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
X-List-Received-Date: Wed, 06 Oct 2010 21:09:40 -0000

Signed-off-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
---
 classes/image.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/classes/image.bbclass b/classes/image.bbclass
index 2105195..49924d7 100644
--- a/classes/image.bbclass
+++ b/classes/image.bbclass
@@ -29,7 +29,7 @@ ${IMAGE_DEV_MANAGER} \
 ${IMAGE_INIT_MANAGER} \
 ${IMAGE_LOGIN_MANAGER} "
 
-RDEPENDS += "${IMAGE_INSTALL} ${IMAGE_BOOT}"
+RDEPENDS_${PN} += "${IMAGE_INSTALL} ${IMAGE_BOOT}"
 
 # "export IMAGE_BASENAME" not supported at this time
 IMAGE_BASENAME[export] = "1"
-- 
1.6.4.2



