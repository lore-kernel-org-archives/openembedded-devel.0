Received: from 3a.49.1343.static.theplanet.com
	([67.19.73.58] helo=pug.o-hand.com ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <josh@linux.intel.com>) id 1NnT23-0006OH-Nn
	for openembedded-devel@lists.openembedded.org;
	Fri, 05 Mar 2010 09:37:17 +0100
Received: from [192.168.0.2] (unknown [78.151.121.11])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by pug.o-hand.com (Postfix) with ESMTP id 3778A12EC2B0
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  5 Mar 2010 02:57:01 -0600 (CST)
From: Joshua Lock <josh@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <b6ebd0a51003041142n1e407a7elc8e16bcf57d0d9c5@mail.gmail.com>
References: <1267725265.28881.9.camel@localhost.localdomain>
	<b6ebd0a51003041142n1e407a7elc8e16bcf57d0d9c5@mail.gmail.com>
Date: Fri, 05 Mar 2010 08:34:20 +0000
Message-ID: <1267778060.3095.38.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.2 (2.28.2-1.fc12) 
X-SA-Exim-Connect-IP: 67.19.73.58
X-SA-Exim-Mail-From: josh@linux.intel.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] Fix packaged staging for cross packages
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
X-List-Received-Date: Fri, 05 Mar 2010 08:37:17 -0000
X-Groupsio-MsgNum: 17348
Content-Type: multipart/mixed; boundary="=-aRhCRO4uIN1enBwhXV9f"

--=-aRhCRO4uIN1enBwhXV9f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi Chris,

On Thu, 2010-03-04 at 13:42 -0600, Chris Larson wrote:
> It looks like this does fix the problem, and good job in spotting the
> problem, but this fix assumes that the basename of CROSS_DIR is
> BASE_PACKAGE_ARCH.  If that ever changes for whatever reason, it will break.
>  I'd suggest instead changing it to continue to copy the contents of the
> dir, but to change the destination to match the destination used in the
> postamble (${PSTAGE_TMPDIR_STAGE}/cross/${BASE_PACKAGE_ARCH}).

Thanks for the quick review, I've attached a modified patch to account
for potential changes in the base name of CROSS_DIR as suggested.

Regards,
Joshua
-- 
Joshua Lock
        Intel Open Source Technology Centre

--=-aRhCRO4uIN1enBwhXV9f
Content-Disposition: attachment; filename="0001-packaged-staging-Fix-packagaging-of-cross-packages.patch"
Content-Type: text/x-patch; name="0001-packaged-staging-Fix-packagaging-of-cross-packages.patch"; charset="UTF-8"
Content-Transfer-Encoding: 7bit

From f40c45b8cba055d698e22c2b7444bc21c5a47eb8 Mon Sep 17 00:00:00 2001
From: Joshua Lock <josh@linux.intel.com>
Date: Fri, 5 Mar 2010 08:23:39 +0000
Subject: [PATCH] packaged-staging: Fix packagaging of cross packages

packagedstaging_fastpath() was only copying the contents of CROSS_DIR to
PSTAGE_TMPDIR resulting in the folders contents being packaged and then
installed incorrectly at the top level of CROSS_DIR rather than in HOST_ARCH
specific sub directories.

This patch fixes that issue by copying the directory and its contents rather
than just the directory contents.

Signed-off-by: Joshua Lock <josh@linux.intel.com>
---
 classes/packaged-staging.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/classes/packaged-staging.bbclass b/classes/packaged-staging.bbclass
index 1ede25c..f50ccad 100644
--- a/classes/packaged-staging.bbclass
+++ b/classes/packaged-staging.bbclass
@@ -289,7 +289,7 @@ packagedstaging_fastpath () {
 		mkdir -p ${PSTAGE_TMPDIR_STAGE}/staging/
 		mkdir -p ${PSTAGE_TMPDIR_STAGE}/cross/
 		cp -fpPR ${SYSROOT_DESTDIR}${STAGING_DIR}/* ${PSTAGE_TMPDIR_STAGE}/staging/ || /bin/true
-		cp -fpPR ${SYSROOT_DESTDIR}${CROSS_DIR}/* ${PSTAGE_TMPDIR_STAGE}/cross/ || /bin/true
+		cp -fpPR ${SYSROOT_DESTDIR}${CROSS_DIR}/* ${PSTAGE_TMPDIR_STAGE}/cross/${BASE_PACKAGE_ARCH}/ || /bin/true
 	fi
 }
 
-- 
1.6.6.1


--=-aRhCRO4uIN1enBwhXV9f--
