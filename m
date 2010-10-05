Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1P32CV-0003Aw-9Q
	for openembedded-devel@lists.openembedded.org;
	Tue, 05 Oct 2010 09:44:41 +0200
Received: by pvg6 with SMTP id 6so1513421pvg.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 05 Oct 2010 00:44:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=QVxGTmLqlGonO6KO4I73QSS8DK73/0+Ukqmq8LtxtFI=;
	b=MqIGN5JXHDIlEpuYveDB5K5JeSUatApVH3eW6S3rMqmQIcOVDgh8Ql5TaVvl/xmSgh
	fjpZvbv6V/l9uxM89GSSWbBqT9GGts+qik5RqOucpkl09tDiRE5zi7DoezXWxcreEZHZ
	+erOf5D1zNSLBr9zU9WuV/ussUyGlEXmaGDCM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=JU/naUARBqE7cOMqVq05xSIBNX7JEORy/8UkLnNw/FZqCwGchpFvLy13gN7PPdYgiH
	c53vlgZ+4XR6yN0tX6FCPNMMpZG9pN4gyC8/gmbONvw408+HYlS0HwGO3OeEewjeRSG+
	XeaB7KSgmxSRc3JjPi0JBA1QSvFKaYW84VfW0=
Received: by 10.143.19.4 with SMTP id w4mr9893968wfi.51.1286264659975;
	Tue, 05 Oct 2010 00:44:19 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id 9sm7531414wfd.0.2010.10.05.00.44.18
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 05 Oct 2010 00:44:19 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  5 Oct 2010 00:44:00 -0700
Message-Id: <1286264643-6352-4-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1286264643-6352-1-git-send-email-raj.khem@gmail.com>
References: <1286264643-6352-1-git-send-email-raj.khem@gmail.com>
X-SA-Exim-Connect-IP: 74.125.83.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 3/6] autotools.bbclass: Add --with-sysroot to configure
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
X-List-Received-Date: Tue, 05 Oct 2010 07:44:42 -0000

* --with-sysroot is needed for a package to use the sysroot support
  enabled in libtool
* .la files are not needed to be mangled anymore

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 classes/autotools.bbclass |   14 +-------------
 1 files changed, 1 insertions(+), 13 deletions(-)

diff --git a/classes/autotools.bbclass b/classes/autotools.bbclass
index b2de2b1..0902a98 100644
--- a/classes/autotools.bbclass
+++ b/classes/autotools.bbclass
@@ -79,7 +79,7 @@ CONFIGUREOPTS = " --build=${BUILD_SYS} \
 
 oe_runconf () {
 	if [ -x ${S}/configure ] ; then
-		${S}/configure ${CONFIGUREOPTS} ${EXTRA_OECONF} "$@"
+		${S}/configure --with-sysroot ${CONFIGUREOPTS} ${EXTRA_OECONF} "$@"
 	else
 		oefatal "no configure script found"
 	fi
@@ -170,18 +170,6 @@ autotools_do_install() {
 	oe_runmake 'DESTDIR=${D}' install
 }
 
-PACKAGE_PREPROCESS_FUNCS += "autotools_prepackage_lamangler"
-
-autotools_prepackage_lamangler () {
-        for i in `find ${PKGD} -name "*.la"` ; do \
-            sed -i -e 's:${STAGING_LIBDIR}:${libdir}:g;' \
-                   -e 's:${D}::g;' \
-                   -e 's:-I${WORKDIR}\S*: :g;' \
-                   -e 's:-L${WORKDIR}\S*: :g;' \
-                   $i
-	done
-}
-
 # STAGE_TEMP_PREFIX is used for a speedup by packaged-staging
 STAGE_TEMP="${WORKDIR}/temp-staging"
 STAGE_TEMP_PREFIX = ""
-- 
1.7.1



