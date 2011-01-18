Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1PfDLL-0006ES-LA
	for openembedded-devel@lists.openembedded.org;
	Tue, 18 Jan 2011 16:19:35 +0100
Received: by gxk20 with SMTP id 20so2364989gxk.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Jan 2011 07:18:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer;
	bh=jNBubbWtzd2ftNjS9uodK5PQlYvHgNyQ/ecIAzSwlpM=;
	b=GcizmDuBbXvpACVyteK7YmjKR7RzG9YlGxJBMTLuKlYjCvLCl5E6s9DAF0lLzNwEBA
	kN/MNDbU1gYobKFfhw0iKmOpeQeP3DpwM6F0nVxkgv8CuyIT2OWN4P0rHYPZXozCNqcd
	xQcQE1XX+to2JxzULo5JJAQMjkJmUxIYlV1lE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=WlHohtA2TX6voPQn+g3ygdoaOi9nuNHnS9axvkz6gGO78HsBm28DxqhmSKA1R5G+yf
	4zwF8yOEjsjznAuLat9RFZzj0UR0/p97fwYfTadmKcCq6y/ctaChiVCAgV1zU72jLKYZ
	j+b6Ms8Hv0+ArYXJKBMTYszWtIQK1xCKfYJM0=
Received: by 10.42.169.8 with SMTP id z8mr3815570icy.78.1295363935916;
	Tue, 18 Jan 2011 07:18:55 -0800 (PST)
Received: from localhost.localdomain (ip24-251-170-95.ph.ph.cox.net
	[24.251.170.95])
	by mx.google.com with ESMTPS id f5sm4564018icu.16.2011.01.18.07.18.53
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 18 Jan 2011 07:18:54 -0800 (PST)
From: Chris Larson <kergoth@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 18 Jan 2011 08:18:46 -0700
Message-Id: <1295363929-13246-1-git-send-email-kergoth@gmail.com>
X-Mailer: git-send-email 1.7.2.3
Cc: Chris Larson <chris_larson@mentor.com>
Subject: [PATCH 1/4] bitbake.conf: include bin dirs from BBPATH in PATH
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
X-List-Received-Date: Tue, 18 Jan 2011 15:19:35 -0000

From: Chris Larson <chris_larson@mentor.com>

Signed-off-by: Chris Larson <chris_larson@mentor.com>
---
 bin/{ => darwin}/cp                    |    0
 bin/{ => darwin}/sed                   |    0
 conf/bitbake.conf                      |    5 +++--
 conf/build/Power Macintosh-darwin.conf |    2 +-
 conf/build/i386-darwin.conf            |    2 +-
 5 files changed, 5 insertions(+), 4 deletions(-)
 rename bin/{ => darwin}/cp (100%)
 rename bin/{ => darwin}/sed (100%)

diff --git a/bin/cp b/bin/darwin/cp
similarity index 100%
rename from bin/cp
rename to bin/darwin/cp
diff --git a/bin/sed b/bin/darwin/sed
similarity index 100%
rename from bin/sed
rename to bin/darwin/sed
diff --git a/conf/bitbake.conf b/conf/bitbake.conf
index f1dc0ff..d03d7e3 100644
--- a/conf/bitbake.conf
+++ b/conf/bitbake.conf
@@ -421,8 +421,9 @@ EXTRA_IMAGEDEPENDS = ""
 
 LIBTOOL_HAS_SYSROOT ?= "no"
 
-PATH_prepend = "${STAGING_BINDIR_CROSS}:${STAGING_DIR_NATIVE}${sbindir_native}:${STAGING_BINDIR_NATIVE}:${STAGING_DIR_NATIVE}${base_sbindir_native}:${STAGING_DIR_NATIVE}/${base_bindir_native}:"
-export PATH
+BBPATH_BIN = "${@':'.join('%s/bin' % path for path in '${BBPATH}'.split(':'))}"
+PATH =. "${BBPATH_BIN}:${STAGING_BINDIR_CROSS}:${STAGING_DIR_NATIVE}${sbindir_native}:${STAGING_BINDIR_NATIVE}:${STAGING_DIR_NATIVE}${base_sbindir_native}:${STAGING_DIR_NATIVE}/${base_bindir_native}:"
+PATH[export] = "1"
 
 ##################################################################
 # Build utility info.
diff --git a/conf/build/Power Macintosh-darwin.conf b/conf/build/Power Macintosh-darwin.conf
index effddbf..b42051b 100644
--- a/conf/build/Power Macintosh-darwin.conf	
+++ b/conf/build/Power Macintosh-darwin.conf	
@@ -1,4 +1,4 @@
-PATH =. "${@bb.which('${BBPATH}', 'bin')}:"
+PATH =. "${@bb.which('${BBPATH}', 'bin')}/darwin:"
 BUILD_ARCH = "powerpc"
 
 require conf/build/darwin/utilities.inc
diff --git a/conf/build/i386-darwin.conf b/conf/build/i386-darwin.conf
index c9e81b9..bdcb075 100644
--- a/conf/build/i386-darwin.conf
+++ b/conf/build/i386-darwin.conf
@@ -1,4 +1,4 @@
-PATH =. "${@bb.which('${BBPATH}', 'bin')}:"
+PATH =. "${@bb.which('${BBPATH}', 'bin')}/darwin:"
 BUILD_CC_ARCH += "-m32"
 
 require conf/build/darwin/utilities.inc
-- 
1.7.2.3



