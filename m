Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1P8Hd9-0000OL-WA
	for openembedded-devel@lists.openembedded.org;
	Tue, 19 Oct 2010 21:13:53 +0200
Received: by gwb17 with SMTP id 17so1562438gwb.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Oct 2010 12:13:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=b0QJq8tdGp4lLJN/ezWc8kHJ0572XWy47wnSbv/hFmY=;
	b=dFh7gbzeiu3OC9aOpzZ0neanEKBnGU/HPoEDu/vwJx4XrawhPy4tkdROL4ingfWJv4
	grN6blJRriRrG7VnEAwtNIWXYVkH9AJJAgUm4BNM/DZUHnfwyLFsZ2qcMrniIe5W6VlV
	U9F4Yz3Y7KCYGr3s0X0J2iAICivwjAp5EFTPk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=YeRIzifwsSjf0EDkeXnwBqSrkiPMzPGi7phje6ljLo+5c/uGVgqV+VVAHpcnM/rQgA
	0B3RsgsMIqzErw1K+h0JxHDi2FaIqWKm0tbD1quD9Mcvvgz0o/y8KkfReaIOth7eMw7h
	E7TPFMSGZmWYWDz4Dtygc9pLs86+quyjZQmU4=
Received: by 10.150.204.18 with SMTP id b18mr9742539ybg.318.1287515595961;
	Tue, 19 Oct 2010 12:13:15 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id p38sm6032035ybk.4.2010.10.19.12.13.14
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 19 Oct 2010 12:13:15 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 19 Oct 2010 12:13:08 -0700
Message-Id: <1287515589-25224-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.1
X-SA-Exim-Connect-IP: 74.125.83.47
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 1/2] autotools.bbclass: Move --with-sysroot to CONFIGUREOPTS
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
X-List-Received-Date: Tue, 19 Oct 2010 19:13:53 -0000

* This is added to CONFIGUREOPTS so it can be filtered out
  when needed. Recipes like gcc need this to be filtered

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 classes/autotools.bbclass |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/classes/autotools.bbclass b/classes/autotools.bbclass
index ce4f66a..a634201 100644
--- a/classes/autotools.bbclass
+++ b/classes/autotools.bbclass
@@ -75,12 +75,13 @@ CONFIGUREOPTS = " --build=${BUILD_SYS} \
 		  --includedir=${includedir} \
 		  --oldincludedir=${oldincludedir} \
 		  --infodir=${infodir} \
-		  --mandir=${mandir}"
+		  --mandir=${mandir} \
+		  ${@["","--with-sysroot"][bb.data.getVar('LIBTOOL_HAS_SYSROOT', d, 1) == "yes"]} \
+		"
 
 oe_runconf () {
 	if [ -x ${S}/configure ] ; then
 		${S}/configure \
-		${@["","--with-sysroot"][bb.data.getVar('LIBTOOL_HAS_SYSROOT', d, 1) == "yes"]} \
 		${CONFIGUREOPTS} ${EXTRA_OECONF} "$@"
 	else
 		oefatal "no configure script found"
-- 
1.7.1



