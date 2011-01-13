Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rep.dot.nop@gmail.com>) id 1PdVPR-0001Vw-P1
	for openembedded-devel@lists.openembedded.org;
	Thu, 13 Jan 2011 23:12:45 +0100
Received: by fxm17 with SMTP id 17so2115873fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Jan 2011 14:12:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=IXdMY3y9PtrEy0YbzWKQPVJCLllGPa8HddWFlUMWT/4=;
	b=S24pRO8DFx6vYNZHKtx2wAgZXjPGiukFrP2JBkXpu5EaK0/A6HI+Fb+zN3l0BCNzmg
	swnPJUBFBBKZC7XGL2OqFmxIzt0FgNduP3CvCap0LAgqjs/zyhL3TianGLZ+GFAczZlz
	43Q0HqTMAMHU1HT7cLHl5lYzgUzxT0ShasPiY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=iVLij4mdS2gTt8syFFj3PLOsgauYgrP0Haz1o/Du7MRldjIi2dH5hQ08VG9fuNp2Mc
	jaJ1oin0/IVENlLfc6erVvMmhP6nxR9bq6CVaiH4P1IAB7TL3hr5OLZuPWg4Dtua19yb
	bwvh99xgLMzhPDHdYii/x/Mk9EH573mXlVxBM=
Received: by 10.223.86.199 with SMTP id t7mr80246fal.29.1294956732369;
	Thu, 13 Jan 2011 14:12:12 -0800 (PST)
Received: from s42.loc (85-127-155-31.dynamic.xdsl-line.inode.at
	[85.127.155.31])
	by mx.google.com with ESMTPS id k6sm271682faa.6.2011.01.13.14.12.11
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 13 Jan 2011 14:12:11 -0800 (PST)
Received: from cow by s42.loc with local (Exim 4.72)
	(envelope-from <rep.dot.nop@gmail.com>)
	id 1PdVOr-0008Qz-TA; Thu, 13 Jan 2011 23:12:09 +0100
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 13 Jan 2011 23:12:07 +0100
Message-Id: <1294956728-32390-3-git-send-email-rep.dot.nop@gmail.com>
X-Mailer: git-send-email 1.7.2.3
In-Reply-To: <1294956728-32390-1-git-send-email-rep.dot.nop@gmail.com>
References: <1294956728-32390-1-git-send-email-rep.dot.nop@gmail.com>
Subject: [PATCH 2/3] sane-toolchain-uclinux-uclibc: use -pipe
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
X-List-Received-Date: Thu, 13 Jan 2011 22:12:45 -0000

Use -pipe for FULL_OPTIMIZATION

Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
---
 .../include/sane-toolchain-uclinux-uclibc.inc      |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/conf/distro/include/sane-toolchain-uclinux-uclibc.inc b/conf/distro/include/sane-toolchain-uclinux-uclibc.inc
index fbb239a..a1e7df0 100644
--- a/conf/distro/include/sane-toolchain-uclinux-uclibc.inc
+++ b/conf/distro/include/sane-toolchain-uclinux-uclibc.inc
@@ -9,7 +9,7 @@ USE_NLS_gcc-cross = "no"
 
 #mess with compiler flags to use -Os instead of -O2
 #Please see http://free-electrons.com/doc/embedded_linux_optimizations/img47.html for some more info
-FULL_OPTIMIZATION = "-fexpensive-optimizations -fomit-frame-pointer -frename-registers -Os"
+FULL_OPTIMIZATION = "-fexpensive-optimizations -fomit-frame-pointer -frename-registers -Os -pipe"
 BUILD_OPTIMIZATION = "-Os"
 
 #Gcc will die with 'internal consistency error when using the above optimizations
-- 
1.7.2.3



