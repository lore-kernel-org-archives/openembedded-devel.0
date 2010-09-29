Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1P13Ro-0001bq-EV
	for openembedded-devel@lists.openembedded.org;
	Wed, 29 Sep 2010 22:40:17 +0200
Received: by eyb7 with SMTP id 7so487590eyb.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Sep 2010 13:40:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=iKZWICLT7zLhFQIV3ExyDjsYnsQKlW7M8wYSd8l97fs=;
	b=aaH4lbZAO1v5Z+5ySUAPMwzrw4b2/IJP9PPF9Df6OxmA2KBbC8VT7vtZj1upO49tKJ
	+0ggbCL+byCSVnYmWheaYeHRIR4V1sQw3QVFmecQhAFjAyyqJR8v8WI97NNi38iGvpiu
	qZY3x7cLEtDEvIJ3QGZUDGfJ+zJhPZeS3GJHE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=e05XwdAPXTqamzu4ug4Nn9wXfPZMNGv0D4d45LfGExWNKAL7+Eh57JASEWvSu50f/h
	1OYLDmmp1fQ5yqOcfjCnX4PD4Db4BBwg5bXCy+zShYPXh/FY7pJwiJXiMOCKDNX2RPWo
	rgGOKIMq8Kw+zMTYh9KYpwdJI52vYNILo3xs0=
Received: by 10.14.47.78 with SMTP id s54mr1304375eeb.2.1285792805205;
	Wed, 29 Sep 2010 13:40:05 -0700 (PDT)
Received: from localhost.localdomain (j200125.upc-j.chello.nl [24.132.200.125])
	by mx.google.com with ESMTPS id a48sm13025341eei.19.2010.09.29.13.40.03
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 29 Sep 2010 13:40:04 -0700 (PDT)
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 29 Sep 2010 22:39:58 +0200
Message-Id: <1285792798-6529-1-git-send-email-fransmeulenbroeks@gmail.com>
X-Mailer: git-send-email 1.6.4.2
X-SA-Exim-Connect-IP: 209.85.215.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] kernel.bbclass: avoid NOTE messages for files that are staged but not packaged
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
X-List-Received-Date: Wed, 29 Sep 2010 20:40:17 -0000

copy the files directly from the work area to staging. That way
there are no unpackaged files in image/ so no NOTE messages.
Additional advantage is that it is faster as we save the copy to the image dir.

See also http://thread.gmane.org/gmane.comp.handhelds.openembedded/37487

Signed-off-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
Acked-by: Roman I Khimov <khimov@altell.ru>
Tested-by: Petr ?tetiar <ynezz@true.cz>
Acked-by: Eric B?nard <eric@eukrea.com>
---

This is the formal patch, following up the discussion mentioned above
It really works like a charm. Kernel build time is greatly reduced.

If there are no objections, and since there are already 2 acks,
I will push tomorrow my evening (20 hrs or so after posting)
Feel free to add additional acks.

Frans

 classes/kernel.bbclass |   12 ++++++------
 1 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/classes/kernel.bbclass b/classes/kernel.bbclass
index 5f8bc8a..cfb4ad8 100644
--- a/classes/kernel.bbclass
+++ b/classes/kernel.bbclass
@@ -121,7 +121,12 @@ kernel_do_install() {
                 oe_runmake SUBDIRS="scripts/genksyms"
         fi
 
-	kerneldir=${D}/kernel/
+
+}
+
+sysroot_stage_all_append() {
+
+	kerneldir=${SYSROOT_DESTDIR}${STAGING_KERNEL_DIR}
 
 	if [ -e include/asm ] ; then
 		# This link is generated only in kernel before 2.6.33-rc1, don't stage it for newer kernels
@@ -200,11 +205,6 @@ kernel_do_install() {
 	cp -fR scripts $kerneldir/
 }
 
-sysroot_stage_all_append() {
-	sysroot_stage_dir ${D}/kernel ${SYSROOT_DESTDIR}${STAGING_KERNEL_DIR}
-	cp -fpPR ${D}/kernel/.config ${SYSROOT_DESTDIR}${STAGING_KERNEL_DIR}
-}
-
 kernel_do_configure() {
 	yes '' | oe_runmake oldconfig
 	if [ ! -z "${INITRAMFS_IMAGE}" ]; then
-- 
1.6.4.2



