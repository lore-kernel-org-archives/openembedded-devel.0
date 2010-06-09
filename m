Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rep.dot.nop@gmail.com>) id 1OMOsW-0001Mi-OJ
	for openembedded-devel@lists.openembedded.org;
	Wed, 09 Jun 2010 19:15:50 +0200
Received: by bwz14 with SMTP id 14so1788325bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 09 Jun 2010 10:11:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:received:from:to:cc:subject
	:date:message-id:x-mailer:in-reply-to:references;
	bh=pCoBUf+QEKyn+E4BbThNJdY8ViDGlfjX+Wu1zTaU6tg=;
	b=dJwlkuED9/RfFOHkfEU1k4qDs0bGnnHiyGe8Sg9C5Jv0eaHCpWkYvuyWjXTDRJIvp2
	ozrVbD2KtMxVcO2vTstv/V4pWa3N0WlFZnvjhZRWlGam3Ddc6jPxVGKo31EBkjlaTX3C
	Z4guDVXELawKUBYy2/NwtEpLe01JBC/yvgeT0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=r+0MV6TvBSNGkYllBb8QG1Xm1NApc2BjCGtu/D4m87q60wx3wWRdWNITV6H/5EWfB3
	Cme7igHjqtevZ+f7rnFn/SHyULcIDsxzLk//448Pzms3pEaycInIELlwbNHUUr6DHCNF
	8scD82ow+zpkwg0819lXnPFxSjAzTHdOdWoZg=
Received: by 10.204.139.218 with SMTP id f26mr6202929bku.180.1276103488689;
	Wed, 09 Jun 2010 10:11:28 -0700 (PDT)
Received: from s42.loc (85-127-249-17.dynamic.xdsl-line.inode.at
	[85.127.249.17])
	by mx.google.com with ESMTPS id v14sm30391313bkz.2.2010.06.09.10.11.27
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 09 Jun 2010 10:11:28 -0700 (PDT)
Received: from cow by s42.loc with local (Exim 4.71)
	(envelope-from <rep.dot.nop@gmail.com>)
	id 1OMOoS-0000kW-PH; Wed, 09 Jun 2010 19:11:36 +0200
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: raj.khem@gmail.com
Date: Wed,  9 Jun 2010 19:10:36 +0200
Message-Id: <1276103437-2755-3-git-send-email-rep.dot.nop@gmail.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <19c1b8a91002212154y766540d9vb091badff1198e0e@mail.gmail.com>
References: <19c1b8a91002212154y766540d9vb091badff1198e0e@mail.gmail.com>
X-SA-Exim-Connect-IP: 209.85.214.47
X-SA-Exim-Mail-From: rep.dot.nop@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openembedded-devel@lists.openembedded.org
Subject: [PATCH 2/3] uclibc_git: keep PV at "git"
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
X-List-Received-Date: Wed, 09 Jun 2010 17:15:50 -0000

With this change, you can put
PREFERRED_UCLIBC_VERSION="git" into your conf/local.conf
once or set PREFERRED_VERSION_uclibc{*}="git" and need
not adjust local.conf if the git revision was changed.

Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
---
 recipes/uclibc/uclibc_git.bb |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes/uclibc/uclibc_git.bb b/recipes/uclibc/uclibc_git.bb
index 6be96b0..f026ae9 100644
--- a/recipes/uclibc/uclibc_git.bb
+++ b/recipes/uclibc/uclibc_git.bb
@@ -7,14 +7,14 @@
 # on whether the base patches apply to the selected (SRCDATE) svn release.
 #
 UCLIBC_BASE ?= "0.9.31"
-SRCREV="94a99ff6131111381e7f803e10638ab547c40c2f"
-PV = "${UCLIBC_BASE}+gitr${SRCREV}"
+SRCREV="0ee65752ee4c023a70d134919ec7604273e46cdb"
+PR_append = "+gitr${SRCPV}"
 DEFAULT_PREFERENCE = "-1"
 #DEFAULT_PREFERENCE is 0 (empty), releases have a preference of 1 so take
 # precedence.
 
 require uclibc.inc
-PR = "${INC_PR}.0"
+PR = "${INC_PR}.1"
 PROVIDES += "virtual/${TARGET_PREFIX}libc-for-gcc"
 
 #recent versions uclibc require real kernel headers
-- 
1.7.1



