Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QGoze-0007xV-Fn
	for openembedded-devel@lists.openembedded.org;
	Mon, 02 May 2011 11:00:38 +0200
Received: by mail-bw0-f47.google.com with SMTP id 5so4912103bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 02 May 2011 01:58:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=tZ2IInCjvTFtNzI6wjsXUC2H0boU4rWV1fwf6iMisp0=;
	b=JE+ZlDURhGtXpd6sn/aB7EzaPv2BAFgEXFnEPN/01LLWFOlpkLJCk7x6wZM7TQ/+0v
	+eTjZIp32A/7f3DMBKW5PsP9htxiVSaayVdWCUdAOBqzn1RM47qKkYhgojXw6Wo/WW1o
	wDE2+ZN1Krfd7Pq9XxbaCzbRc2sR7ErNQ/PiA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=Br3wFZncQNnezEN0MJY60ha5UU3HMS77o+vda+GdyRq95QkuckniDiGEnCckZrcyak
	azXY9dERHRxZIzsanwsF87cVQIcyX5eCXXp70Q8Re6aFEc8JRH0wQ/n8amgSbSx5B84+
	zu2SijAIyLtv1ukr+H4IeXaq48YstGFffjr0U=
Received: by 10.204.171.65 with SMTP id g1mr7093250bkz.45.1304326684665;
	Mon, 02 May 2011 01:58:04 -0700 (PDT)
Received: from localhost ([94.230.152.115])
	by mx.google.com with ESMTPS id d11sm3149667bka.7.2011.05.02.01.58.03
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 02 May 2011 01:58:04 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  2 May 2011 10:57:52 +0200
Message-Id: <1304326672-16975-2-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.5.rc3
In-Reply-To: <1304326672-16975-1-git-send-email-Martin.Jansa@gmail.com>
References: <1304191610-31723-1-git-send-email-raj.khem@gmail.com>
	<1304326672-16975-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCH 2/2] gcc-4.5: add checksums
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
X-List-Received-Date: Mon, 02 May 2011 09:00:38 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-devtools/gcc/gcc-4.5.inc |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.5.inc b/meta-oe/recipes-devtools/gcc/gcc-4.5.inc
index 80e0d37..7c166f2 100644
--- a/meta-oe/recipes-devtools/gcc/gcc-4.5.inc
+++ b/meta-oe/recipes-devtools/gcc/gcc-4.5.inc
@@ -18,6 +18,9 @@ INC_PR = "r36"
 # BINV should  point to minor release 
 BINV = "${PV}.3"
 
+SRC_URI[md5sum] = "8e0b5c12212e185f3e4383106bfa9cc6"
+SRC_URI[sha256sum] = "0a8847af44a9b33813b199997a73139517c96adfd519eaf24c79d4d9d09f65de"
+
 SRC_URI = "${GNU_MIRROR}/gcc/gcc-${BINV}/gcc-${BINV}.tar.bz2 \
        file://gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch \
        file://100-uclibc-conf.patch \
-- 
1.7.5.rc3



