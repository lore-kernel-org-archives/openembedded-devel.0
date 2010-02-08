Received: from mail-fx0-f227.google.com ([209.85.220.227])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rep.dot.nop@gmail.com>) id 1Neax7-0004Sv-Q8
	for openembedded-devel@lists.openembedded.org;
	Mon, 08 Feb 2010 22:15:33 +0100
Received: by fxm27 with SMTP id 27so1137679fxm.27
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 08 Feb 2010 13:12:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:received:from:to:cc:subject
	:date:message-id:x-mailer:in-reply-to:references;
	bh=BQ8q9kd66GV0K+waYmn1W4aB2vsP4ayIWD7yp0k69zQ=;
	b=hJFTfpOZUE5SnQwWqHPZVz2MJVktu6Ak5JBtN499ZyOQxutipSv/DuAOeCLbmeTfPz
	nFx4unktCJ3Ps9P6HyNoLRuOWl4vYe3ao2t0dERPBBa3mGzLTkwsld9/0C0i+y6XEuhN
	TjXpGxDFrLv15BOKBncXAj9nBYCXO996t2KgY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=J9NajEarHEmasjA7VIlCFmkkXiDIFLmKN4MzYMcif1FuocdBRZ+7q0v2aKMWHMF6Ca
	+0ETCO2iF+UqmjwAB4elZSvZM0xn1uXr3tDjI892lQ/SE1H5c/WfnPL+g/PjKcp+/r6W
	d60Ou+kGPHB4owhQOmLia9uWCtrv4C+hZiQtI=
Received: by 10.223.17.19 with SMTP id q19mr1685367faa.75.1265663577630;
	Mon, 08 Feb 2010 13:12:57 -0800 (PST)
Received: from s42.loc ([84.119.103.202])
	by mx.google.com with ESMTPS id f31sm7243908fkf.42.2010.02.08.13.12.56
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 08 Feb 2010 13:12:56 -0800 (PST)
Received: from cow by s42.loc with local (Exim 4.71)
	(envelope-from <rep.dot.nop@gmail.com>)
	id 1NeawH-0004GY-Im; Mon, 08 Feb 2010 22:14:37 +0100
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  8 Feb 2010 22:14:32 +0100
Message-Id: <1265663673-16312-12-git-send-email-rep.dot.nop@gmail.com>
X-Mailer: git-send-email 1.6.5
In-Reply-To: <1265663673-16312-11-git-send-email-rep.dot.nop@gmail.com>
References: <1265663673-16312-1-git-send-email-rep.dot.nop@gmail.com>
	<1265663673-16312-2-git-send-email-rep.dot.nop@gmail.com>
	<1265663673-16312-3-git-send-email-rep.dot.nop@gmail.com>
	<1265663673-16312-4-git-send-email-rep.dot.nop@gmail.com>
	<1265663673-16312-5-git-send-email-rep.dot.nop@gmail.com>
	<1265663673-16312-6-git-send-email-rep.dot.nop@gmail.com>
	<1265663673-16312-7-git-send-email-rep.dot.nop@gmail.com>
	<1265663673-16312-8-git-send-email-rep.dot.nop@gmail.com>
	<1265663673-16312-9-git-send-email-rep.dot.nop@gmail.com>
	<1265663673-16312-10-git-send-email-rep.dot.nop@gmail.com>
	<1265663673-16312-11-git-send-email-rep.dot.nop@gmail.com>
X-SA-Exim-Connect-IP: 209.85.220.227
X-SA-Exim-Mail-From: rep.dot.nop@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH 11/12] fix binutils patch to apply to 2.20
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
X-List-Received-Date: Mon, 08 Feb 2010 21:15:33 -0000

Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
---
 .../binutils-x86_64_i386_biarch.patch              |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes/binutils/binutils-2.20/binutils-x86_64_i386_biarch.patch b/recipes/binutils/binutils-2.20/binutils-x86_64_i386_biarch.patch
index 6054434..4cd9e22 100644
--- a/recipes/binutils/binutils-2.20/binutils-x86_64_i386_biarch.patch
+++ b/recipes/binutils/binutils-2.20/binutils-x86_64_i386_biarch.patch
@@ -11,9 +11,9 @@
 --- binutils/ld/emulparams/elf_i386.sh
 +++ binutils/ld/emulparams/elf_i386.sh
 @@ -12,3 +12,13 @@
- NO_SMALL_DATA=yes
  SEPARATE_GOTPLT=12
  SHARABLE_SECTIONS=yes
+ IREL_IN_PLT=
 +
 +# Linux modify the default library search path to first include
 +# a 32-bit specific directory.
-- 
1.6.5



