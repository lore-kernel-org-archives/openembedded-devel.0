Received: from mail-px0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1P3fZL-0004dP-5R
	for openembedded-devel@lists.openembedded.org;
	Thu, 07 Oct 2010 03:46:54 +0200
Received: by pxi11 with SMTP id 11so36316pxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 06 Oct 2010 18:46:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=3fQd/tgaq44GJL+p5XQ5Vn1oCOgO3rs7slstMuw0S3g=;
	b=HeL9Tg/0q2XUEmgdhapisxkEou755tliuQJJmjtKOmBreB+FrEgUZn/5HWAsRynRUD
	rP3bIJUrTf5DYs5sf6CeOb6VwjE49i8J+bw/LaJR64GLQKxoetED3T2Za8VOjqhPOGuP
	t1o16iwXzBCpnLxAhy8ao+HjP8ZnIBcLVt4QM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=eEY1DkZv3VA1fJUs2oZINXmfp9XUoKHqmMk7L2yyzozXJ/XKS0p+WJBx+f4RiVyqCW
	yf85FKXP2bAUHOTPIUTJeo/uoVME6xZzsLnWrP19wj88rhVfFRLdzlQlMlS3/pMkR/aU
	02wF1L2FLlvI0SORkKR0ak2NVtuxzOQgtlcos=
Received: by 10.114.89.15 with SMTP id m15mr52729wab.203.1286415989302;
	Wed, 06 Oct 2010 18:46:29 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id q6sm2413207waj.10.2010.10.06.18.46.28
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 06 Oct 2010 18:46:28 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  6 Oct 2010 18:46:08 -0700
Message-Id: <1286415971-9960-4-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1286415971-9960-1-git-send-email-raj.khem@gmail.com>
References: <1286415971-9960-1-git-send-email-raj.khem@gmail.com>
X-SA-Exim-Connect-IP: 209.85.212.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH, V2 3/6] autotools.bbclass: Conditionally use autotools_prepackage_lamangler
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
X-List-Received-Date: Thu, 07 Oct 2010 01:46:54 -0000

* autotools_prepackage_lamangler is not needed with libtool 2.4+
* add --with-sysroot when using libtool 2.4+

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 classes/autotools.bbclass |    7 ++++---
 1 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/classes/autotools.bbclass b/classes/autotools.bbclass
index b2de2b1..ce4f66a 100644
--- a/classes/autotools.bbclass
+++ b/classes/autotools.bbclass
@@ -79,7 +79,9 @@ CONFIGUREOPTS = " --build=${BUILD_SYS} \
 
 oe_runconf () {
 	if [ -x ${S}/configure ] ; then
-		${S}/configure ${CONFIGUREOPTS} ${EXTRA_OECONF} "$@"
+		${S}/configure \
+		${@["","--with-sysroot"][bb.data.getVar('LIBTOOL_HAS_SYSROOT', d, 1) == "yes"]} \
+		${CONFIGUREOPTS} ${EXTRA_OECONF} "$@"
 	else
 		oefatal "no configure script found"
 	fi
@@ -170,8 +172,7 @@ autotools_do_install() {
 	oe_runmake 'DESTDIR=${D}' install
 }
 
-PACKAGE_PREPROCESS_FUNCS += "autotools_prepackage_lamangler"
-
+PACKAGE_PREPROCESS_FUNCS += "${@['autotools_prepackage_lamangler',''][bb.data.getVar('LIBTOOL_HAS_SYSROOT', d, 1) == "yes"]}"
 autotools_prepackage_lamangler () {
         for i in `find ${PKGD} -name "*.la"` ; do \
             sed -i -e 's:${STAGING_LIBDIR}:${libdir}:g;' \
-- 
1.7.1



