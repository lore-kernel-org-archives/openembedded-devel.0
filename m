Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QGozZ-0007xV-Sx
	for openembedded-devel@lists.openembedded.org;
	Mon, 02 May 2011 11:00:34 +0200
Received: by bwz5 with SMTP id 5so4912103bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 02 May 2011 01:57:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=Zjn1Mrjn9wvPgZihtDKsvFAhuh70u9idLn+BO3QpzZs=;
	b=afJd1n8ElwIm5k7Y5ULg7r+Wrr0XpoL/T/CcV99/+qv4QVgY/pwd2Rk6yXWBGy7aSb
	rCTXTFKHcPMS+lpO+LjOBMixdny/5r/Lu5Zy/m6k5TtVN/Engd9B35TdRU/aQ+UBFPax
	q5OOvmT6ebR+N25dNUWx/+UoOd0ezewnbm6Sc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=SqWsjPXz0mfT4X4ouIRDlnogZnheVqkD1mp1BuOSjOQGq+d50B+Fq/AO6Njj+BwucR
	kHgjL1ymT5eoKLUMd2kz/qeZSFV+zw0tdRD4E3tjAEV6HCrTgS6cbxVNsJJ8R1MQ8h79
	V8PorA6or8VjCODszEbihveLPE999/JVFeGAU=
Received: by 10.204.154.215 with SMTP id p23mr447251bkw.113.1304326677379;
	Mon, 02 May 2011 01:57:57 -0700 (PDT)
Received: from localhost ([94.230.152.115])
	by mx.google.com with ESMTPS id x6sm3151868bkv.0.2011.05.02.01.57.55
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 02 May 2011 01:57:56 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  2 May 2011 10:57:51 +0200
Message-Id: <1304326672-16975-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.5.rc3
In-Reply-To: <1304191610-31723-1-git-send-email-raj.khem@gmail.com>
References: <1304191610-31723-1-git-send-email-raj.khem@gmail.com>
Subject: [PATCH 1/2] gcc-4.5: drop comment from SRC_URI
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
X-List-Received-Date: Mon, 02 May 2011 09:00:34 -0000

* bitbake from poky doesn't like comments in variables and bitbake from oe doesn't work with AUTOREV

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-devtools/gcc/gcc-4.5.inc |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5.inc b/meta-oe/recipes-devtools/gcc/gcc-4.5.inc
index 4067d73..80e0d37 100644
--- a/meta-oe/recipes-devtools/gcc/gcc-4.5.inc
+++ b/meta-oe/recipes-devtools/gcc/gcc-4.5.inc
@@ -173,7 +173,6 @@ SRC_URI = "${GNU_MIRROR}/gcc/gcc-${BINV}/gcc-${BINV}.tar.bz2 \
        file://linaro/gcc-4.5-linaro-r99494.patch \
        file://linaro/gcc-4.5-linaro-r99495.patch \
        file://linaro/gcc-4.5-linaro-r99498.patch \
-#      file://linaro/gcc-4.5-linaro-r99499.patch \
        file://linaro/gcc-4.5-linaro-r99502.patch \
        file://more-epilogues.patch \
        file://gcc-scalar-widening-pr45847.patch \
-- 
1.7.5.rc3



