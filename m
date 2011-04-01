Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Q5XMl-0006nY-Im
	for openembedded-devel@lists.openembedded.org;
	Fri, 01 Apr 2011 07:57:51 +0200
Received: by mail-iy0-f175.google.com with SMTP id 7so3442476iye.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Mar 2011 22:55:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=ol3KgIxdnaAVZH9ZRP2PLef8n3YIeEQcDiiGJZRoWE4=;
	b=YVFSNtIJWUwnNHGdf+3qfZp9oVwJz/1B2Ct6gnlPoUCICaOB9aLJncYcK0Caz9TjdV
	wz3lgnvkUPRn0oZw4PkIphlKPlVoET9vZ+9xg/MRae6xnNrKS3jmKsEWhUdowvJu1C+M
	yNo+VazdjgwYhG1xaiuLUISuSKsXF4VmGjZUE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=VOjdzIf5mXC8dq0wG/YAWoh0y6hOKlPGlR/lnb9sRfStkCPmIwK/rmiZsMCW/SCzgB
	CyagvsfiJeEp2cWk+skPuHMmCV5Din5VRf/7hmBt8b1f7ZjyHKmb2D5WHM9gKmgt/3T3
	q9HLX0wDZd+UqgOYastOwPpvxA1mNxqr5KP6Y=
Received: by 10.42.180.197 with SMTP id bv5mr4634605icb.86.1301637352774;
	Thu, 31 Mar 2011 22:55:52 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id xi12sm1086554icb.6.2011.03.31.22.55.51
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 31 Mar 2011 22:55:52 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 31 Mar 2011 22:55:27 -0700
Message-Id: <1301637327-26825-7-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <1301637327-26825-1-git-send-email-raj.khem@gmail.com>
References: <1301637327-26825-1-git-send-email-raj.khem@gmail.com>
Subject: [PATCH 7/7] libgpg-error_1.8.bb: Inherit gettext
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
X-List-Received-Date: Fri, 01 Apr 2011 05:57:51 -0000

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



