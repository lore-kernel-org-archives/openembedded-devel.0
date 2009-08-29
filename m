Received: from [209.85.222.197] (helo=mail-pz0-f197.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1MhBf0-0008Ib-5O
	for openembedded-devel@lists.openembedded.org;
	Sat, 29 Aug 2009 02:19:14 +0200
Received: by pzk35 with SMTP id 35so2132484pzk.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Aug 2009 17:00:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=om2QVbS+VeJ+0g0aSBfcXGkOeK37stwg1PTSxWE0QuA=;
	b=qUVJ/v1T8ZgIaDAlNlXFupPW2rj1l3ycuRvafR7cDzFqOT8NKzxs6USYOkAvbcuBEG
	foJ/+MCxHCcS2MLGE+XOAKHmwrYGdDY7PXdbTobth33I4isFoT4vtp9zj78pWtrnvvP/
	qOzX5bLASP2JVMowIOtGhVMkRBdSFYKi9yBkY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=odzPvYi1SEsSew5lFUn0mMs8pby5OVcxuHYKdhXGlrvaEfVxVbE5JhoMlG5WriPwEM
	oGWJ6boa4M1E08R6ggrJQvo6JyPvZwJp5YON/IC997KBaqdrKvcWf4K+fJHfzpwBidV4
	KN+O3s2Mp+Guqt6wQOVfca4zywX0O61ZiKBzc=
Received: by 10.141.41.3 with SMTP id t3mr848969rvj.93.1251504056747;
	Fri, 28 Aug 2009 17:00:56 -0700 (PDT)
Received: from localhost (adsl-71-146-29-169.dsl.pltn13.sbcglobal.net
	[71.146.29.169])
	by mx.google.com with ESMTPS id 22sm830138pzk.10.2009.08.28.17.00.55
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 28 Aug 2009 17:00:56 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 28 Aug 2009 17:00:44 -0700
Message-Id: <1251504044-2315-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.6.3.3
Subject: [PATCH] sane-toolchain-eglibc.inc: Set TARGET_OS = linux-gnuspe for e500
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
X-List-Received-Date: Sat, 29 Aug 2009 00:19:15 -0000

Target triplet powerpc-*-linux-gnuspe is chosen for machines with SPE
which is e500 cores.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 conf/distro/include/sane-toolchain-eglibc.inc |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/conf/distro/include/sane-toolchain-eglibc.inc b/conf/distro/include/sane-toolchain-eglibc.inc
index 88719f5..6b66679 100644
--- a/conf/distro/include/sane-toolchain-eglibc.inc
+++ b/conf/distro/include/sane-toolchain-eglibc.inc
@@ -5,6 +5,8 @@
 
 TARGET_OS = "linux${@['','-gnueabi'][bb.data.getVar('TARGET_ARCH',d,1) in ['arm', 'armeb'] and bb.data.getVar('MACHINE',d) not in ['collie','h3600', 'h3800', 'simpad', 'htcwallaby']]}"
 
+TARGET_OS = "linux${@['','-gnuspe'][bb.data.getVar('TARGET_ARCH',d,1) in ['ppc', 'powerpc'] and bb.data.getVar('MACHINE',d) in ['calamari', 'tqm8540']]}"
+
 FULL_OPTIMIZATION = "-fexpensive-optimizations -fomit-frame-pointer -frename-registers -Os"
 FULL_OPTIMIZATION_pn-perl = "-fexpensive-optimizations -fomit-frame-pointer -frename-registers -O1"
 FULL_OPTIMIZATION_sparc = "-fexpensive-optimizations -fomit-frame-pointer -frename-registers -O2"
-- 
1.6.3.3



