Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1P3fZJ-0004dL-NE
	for openembedded-devel@lists.openembedded.org;
	Thu, 07 Oct 2010 03:46:50 +0200
Received: by pvg6 with SMTP id 6so36730pvg.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 06 Oct 2010 18:46:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=JFpwauq6/TfOwq6wu3euNTbnWljYLbLVgIxaQe71czY=;
	b=AvH/OtUimVVDKRZ263LL3pVlWaFI3zrc4QD3/7jK4feM+TVOlKfnKWQuyapCQrmNoK
	3yss1gvZcez+Wp3E5Jx2xFcH17vqlmNSmgEiz0igHQ7Z9ySejqqtv/VFUdQihUs5C5iL
	z3d9VhjYwHwGy3CmBqL09/VSI6F2j2A///LOA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=nK2gbuIxAYbOr18J51nFEeg99Q/Fjy6QII1jHXTJkcHgx0+40XEeRSP2At42yMaE6A
	uVn5QXTc+YRhbhRk2+YtFUr2BnX7supQvaZ6V6SgNGvf4GCs2iFDffzJx4cT83RnTit6
	c6qSXBf6EcxJJ/j1j3Eai0NvIeh2SAPZ6h8lQ=
Received: by 10.114.15.5 with SMTP id 5mr53122wao.200.1286415988177;
	Wed, 06 Oct 2010 18:46:28 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id q6sm2413207waj.10.2010.10.06.18.46.27
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 06 Oct 2010 18:46:27 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  6 Oct 2010 18:46:07 -0700
Message-Id: <1286415971-9960-3-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1286415971-9960-1-git-send-email-raj.khem@gmail.com>
References: <1286415971-9960-1-git-send-email-raj.khem@gmail.com>
X-SA-Exim-Connect-IP: 74.125.83.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH,V2 2/6] bitbake.conf: Define LIBTOOL_HAS_SYSROOT
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
X-List-Received-Date: Thu, 07 Oct 2010 01:46:50 -0000

* Set default weak to "no"
* Use in TARGET_LDFLAGS

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 conf/bitbake.conf |   13 +++++++++----
 1 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/conf/bitbake.conf b/conf/bitbake.conf
index 4e80d97..7f01f8f 100644
--- a/conf/bitbake.conf
+++ b/conf/bitbake.conf
@@ -414,6 +414,13 @@ EXTRA_IMAGEDEPENDS = ""
 ##################################################################
 # Toolchain info.
 ##################################################################
+
+# This variable is needed to set to 'yes' in conjuction with 
+# PREFERRED_VERSION for libtool when choosing libtool >= 2.4
+# by default this is unset and should be so for libtools < 2.4
+
+LIBTOOL_HAS_SYSROOT ?= "no"
+
 PATH_prepend = "${STAGING_BINDIR_CROSS}:${STAGING_DIR_NATIVE}${sbindir_native}:${STAGING_BINDIR_NATIVE}:${STAGING_DIR_NATIVE}${base_sbindir_native}:${STAGING_DIR_NATIVE}/${base_bindir_native}:"
 export PATH
 
@@ -484,10 +491,8 @@ export BUILD_LDFLAGS = "-L${STAGING_LIBDIR_NATIVE} \
                         -Wl,-rpath,${STAGING_LIBDIR_NATIVE} -Wl,-O1"
 
 export LDFLAGS = "${TARGET_LDFLAGS}"
-export TARGET_LDFLAGS = "-L${STAGING_DIR_TARGET}${libdir} \
-                         -Wl,-rpath-link,${STAGING_DIR_TARGET}${libdir} \
-                         -Wl,-O1 \
-                         ${TARGET_LINK_HASH_STYLE}"
+export TARGET_LDFLAGS = '${@["-L${STAGING_DIR_TARGET}${libdir} -Wl,-rpath-link,${STAGING_DIR_TARGET}${libdir} -Wl,-O1 ${TARGET_LINK_HASH_STYLE}", "-Wl,-O1 ${TARGET_LINK_HASH_STYLE}"][bb.data.getVar('LIBTOOL_HAS_SYSROOT', d, 1) == "yes"]}'
+
 export SDK_LDFLAGS = "-L${STAGING_DIR_SDK}${libdir} \
                          -Wl,-rpath-link,${STAGING_DIR_SDK}${libdir} \
                          -Wl,-O1"
-- 
1.7.1



