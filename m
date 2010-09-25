Received: from mail-px0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OzdvU-0006vm-J9
	for openembedded-devel@lists.openembedded.org;
	Sun, 26 Sep 2010 01:13:19 +0200
Received: by pxi11 with SMTP id 11so1118067pxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 25 Sep 2010 16:12:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=DjekVDci2u/lsfZQn88fdr0dAYXDMPesUbmoHp32tc8=;
	b=xuivfgjngxbW9RwLhRuNxloiqc2lNS60dtSYNl2TG8YylE3Uo5veFDhrcjt3HHNSqv
	mBtKRg95nPyYpfZOJPHUgwGdVyepvzq3IJfC4UriCY4mCuMh25Y4texEY8f0Lpl3bR2K
	e+sZdExbT5PpFqwutX6LRQS0X8PIqkBbY+pfw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=vW7NN2mWAEz7Nh9HHZOjwYEd5dtVJiSJEnUNyNv5EsztT8QYdPOqZwcRm6R7Erb1q8
	GeyyOl48OBvSDTmmV9FGBigB/sCDAs18imaihzXEJMoKeYoWYq2ogF85PEAyH7/FN/Mb
	fwWe76gk0ku7y9DSsT0H4BHN1lOrESjyFvmIA=
Received: by 10.114.123.4 with SMTP id v4mr5943868wac.0.1285456375535;
	Sat, 25 Sep 2010 16:12:55 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id r37sm6791851wak.23.2010.09.25.16.12.54
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sat, 25 Sep 2010 16:12:54 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 25 Sep 2010 16:12:28 -0700
Message-Id: <1285456353-27457-8-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1285456353-27457-1-git-send-email-raj.khem@gmail.com>
References: <1285456353-27457-1-git-send-email-raj.khem@gmail.com>
X-SA-Exim-Connect-IP: 209.85.212.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=unavailable version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 07/12] binutils-cross.inc: Enable 64-bit bfd when configured for mips64/mips64el
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
X-List-Received-Date: Sat, 25 Sep 2010 23:13:27 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 recipes/binutils/binutils-cross.inc |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/recipes/binutils/binutils-cross.inc b/recipes/binutils/binutils-cross.inc
index ba3e6b5..5801962 100644
--- a/recipes/binutils/binutils-cross.inc
+++ b/recipes/binutils/binutils-cross.inc
@@ -7,6 +7,8 @@ EXTRA_OECONF = "--with-sysroot=${STAGING_DIR_TARGET} \
 		--program-prefix=${TARGET_PREFIX} \
 		--disable-werror \
 	       "
+EXTRA_OECONF_append_mips64 = " --enable-64-bit-bfd"
+EXTRA_OECONF_append_mips64el = " --enable-64-bit-bfd"
 
 do_install () {
 	oe_runmake 'DESTDIR=${D}' install
-- 
1.7.0.4



