Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PVI8l-0000Bw-MK
	for openembedded-devel@lists.openembedded.org;
	Wed, 22 Dec 2010 07:25:35 +0100
Received: by gyh20 with SMTP id 20so2070957gyh.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Dec 2010 22:25:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=7vRuO17x66w977sJre9xQKdoShwY1l24bL4V9PjYs2Q=;
	b=gpduC8CR/Y6EKyRMpZGQJ/izUuJGjFg4JNrbflSf/3MRssy9ZovVNXpjLUH0E8P1ir
	T/yRdy6+xUZrCGkhtksTcRk8mFc+mWl75b3rsN8/O43nZE2xWJct5nvqo7UOG7h3rPwM
	Jun/K0ZQ09iim7QqqkOIvso2iWaNEmLC2fk1g=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=jhmFdXQAdmPmerYNJvk/LMSP5QuhXKjUHQoDvVjdbgLquvxvSowegKPraehS7ghxbC
	bD49A5KaPKrmGyRdW0UEnaoPRa47V3Sg2nrQFGDowYF71s4sEctlzQB9po+Km1whF0rD
	562TsHKiPh0dButsC0we7c7GMilrMLJ+axIW4=
Received: by 10.100.201.15 with SMTP id y15mr3814028anf.259.1292999127828;
	Tue, 21 Dec 2010 22:25:27 -0800 (PST)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id f10sm10716127anh.25.2010.12.21.22.25.26
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 21 Dec 2010 22:25:27 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 21 Dec 2010 22:25:42 -0800
Message-Id: <1292999142-28338-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.0.4
Subject: [PATCH] sane-toolchain.inc: FEED_ARCH should be prepended to OVERRIDES
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
X-List-Received-Date: Wed, 22 Dec 2010 06:25:35 -0000

Currently it ends up after local override and hence appears first in FILESPATH
and for buiding uclibc_git.bb on qemuarm it picks wrong uClibc.machine file from
uclibc-git/armv5te where as it should have picked from uclibc-git/qemuarm

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 conf/distro/include/sane-toolchain.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/conf/distro/include/sane-toolchain.inc b/conf/distro/include/sane-toolchain.inc
index 6802eb2..f5ca22b 100644
--- a/conf/distro/include/sane-toolchain.inc
+++ b/conf/distro/include/sane-toolchain.inc
@@ -75,7 +75,7 @@ require conf/distro/include/toolchain-${TOOLCHAIN_TYPE}.inc
 # Add FEED_ARCH to the overrides list so that we can override the
 # ARM_INSTRUCTION_SET like below
 
-OVERRIDES .= ":${FEED_ARCH}"
+OVERRIDES =. "${FEED_ARCH}:"
 
 # ARM920T and up can use thumb mode to decrease binary size at the expense of speed
 # (the complete story is a bit more nuanced due to cache starvation)
-- 
1.7.0.4



