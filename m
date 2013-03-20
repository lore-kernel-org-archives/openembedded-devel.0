Received: from mail-pb0-f46.google.com ([209.85.160.46])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1UIF0T-0000ss-5B
	for openembedded-devel@lists.openembedded.org;
	Wed, 20 Mar 2013 10:08:34 +0100
Received: by mail-pb0-f46.google.com with SMTP id uo15so1177917pbc.19
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Mar 2013 01:51:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=ExMV1CJb+imgQ/IUsNJFuTEi+j5N1/bRmsGgdj0C5oY=;
	b=SSQE3HKHCihltn++jXl3U9uH+xLNAfux93sJiAARGMrQykeLBUiiP//1Z8ijxXLWQX
	p1ZlYN6zVjbghjLRrR6wXJ6gJs9MIdOSyZjekVw1y0OoJ5Zr7IeZck3t8ZHtfUlIhczn
	p4l5u54qWMkYJsCaAtzOv3+R7T6axt+9lmuVQMJoGx7SK8ErN0y2IfVz77eHpq1uO4Cr
	hwuKJ0wyYEo5rz+Cadukjr4IZKiGaBogiHAaJOd37ZIq/lIOO5n+fGCvaSjEZHhHl0st
	/gMZVKMkO6DPVieA3Fvo19dJSNrOWgcLnvmc/3eqb3fDP5ETb0vS1U+VQtXeyHPeD0Di
	kX+A==
X-Received: by 10.66.146.202 with SMTP id te10mr7922209pab.64.1363769493429;
	Wed, 20 Mar 2013 01:51:33 -0700 (PDT)
Received: from isis.gateway.2wire.net
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPS id ol7sm1369443pbb.14.2013.03.20.01.51.32
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 20 Mar 2013 01:51:32 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 20 Mar 2013 01:51:08 -0700
Message-Id: <1363769468-20321-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [meta-kde][PATCH] cyrus-sasl: Make pkg_postinst/rm package specfic
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
X-List-Received-Date: Wed, 20 Mar 2013 09:08:35 -0000

Fixes QA errors:

ERROR: QA Issue:
/b/kraj/angstrom/sources/meta-kde/recipes-misc-support/cyrus-sasl_2.1.19.bb:
Variable pkg_postinst is set as not being package specific, please fix
this.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 recipes-misc-support/cyrus-sasl_2.1.19.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-misc-support/cyrus-sasl_2.1.19.bb b/recipes-misc-support/cyrus-sasl_2.1.19.bb
index 2c9d359..da9a709 100644
--- a/recipes-misc-support/cyrus-sasl_2.1.19.bb
+++ b/recipes-misc-support/cyrus-sasl_2.1.19.bb
@@ -47,7 +47,7 @@ do_install () {
 FILES_${PN} += "${prefix}/lib/sasl2/*.so*"
 FILES_${PN}-dev += "${libdir}/sasl2/*.la ${libdir}/sasl2/*.a"
 
-pkg_postinst () {
+pkg_postinst_${PN} () {
         grep cyrus /etc/passwd || adduser --disabled-password --home=/var/spool/mail --ingroup mail -g "Cyrus sasl" cyrus
     echo "cyrus" | saslpasswd2 -p -c cyrus
     chgrp mail /etc/sasldb2
-- 
1.7.9.5



