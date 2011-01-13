Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rep.dot.nop@gmail.com>) id 1PdVPT-0001Vx-Oq
	for openembedded-devel@lists.openembedded.org;
	Thu, 13 Jan 2011 23:12:47 +0100
Received: by fxm17 with SMTP id 17so2115902fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Jan 2011 14:12:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=L24yS/F1js9TYZrpRAiZ0kjvGfRBw8dd8wjpk34lt/M=;
	b=TbXYVY3i9kqERy//5sJ9dyJ0N0FAYolhRrxF2o1KyRCIgs5hzi64xoqy81PhQlS8gK
	pN21m7WmojFubXX20jEXadIAl5GdN1ZliFHrWfH+aARtV1QC3upJLRgOjD2U25MA1/Wx
	ece/ULaHw91sSlpLKucQeiTHgsLzMFlh5jW38=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=LUGRhuhvUZeLTf5umtpj7L6RKwRY/nM3f5NRlSLYK3nGq63wxpkxUKcnKfVCge6ivu
	gigsf8YE8FIzIhkfEg5CK7ULpGnOGYdpBL197hSP47u2uUnAJSYKQm4cY8EM8liEwruY
	bWTeLKleWdRK+8KzLSa6bDyLN5/N6Fq4Ob+z0=
Received: by 10.223.100.15 with SMTP id w15mr2924927fan.121.1294956733426;
	Thu, 13 Jan 2011 14:12:13 -0800 (PST)
Received: from s42.loc (85-127-155-31.dynamic.xdsl-line.inode.at
	[85.127.155.31])
	by mx.google.com with ESMTPS id y3sm267901fai.38.2011.01.13.14.12.11
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 13 Jan 2011 14:12:11 -0800 (PST)
Received: from cow by s42.loc with local (Exim 4.72)
	(envelope-from <rep.dot.nop@gmail.com>)
	id 1PdVOr-0008Qx-SZ; Thu, 13 Jan 2011 23:12:09 +0100
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 13 Jan 2011 23:12:06 +0100
Message-Id: <1294956728-32390-2-git-send-email-rep.dot.nop@gmail.com>
X-Mailer: git-send-email 1.7.2.3
In-Reply-To: <1294956728-32390-1-git-send-email-rep.dot.nop@gmail.com>
References: <1294956728-32390-1-git-send-email-rep.dot.nop@gmail.com>
Subject: [PATCH 1/3] sane-toolchain-uclibc: use -pipe
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
X-List-Received-Date: Thu, 13 Jan 2011 22:12:47 -0000

Use -pipe for both BUILD_OPTIMIZATION and FULL_OPTIMIZATION

Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
---
 conf/distro/include/sane-toolchain-uclibc.inc |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/conf/distro/include/sane-toolchain-uclibc.inc b/conf/distro/include/sane-toolchain-uclibc.inc
index bfe0bc8..ed7f5f1 100644
--- a/conf/distro/include/sane-toolchain-uclibc.inc
+++ b/conf/distro/include/sane-toolchain-uclibc.inc
@@ -23,7 +23,8 @@ PREFERRED_VERSION_uclibc-cross-intermediate ?= "${PREFERRED_UCLIBC_VERSION}"
 
 #mess with compiler flags to use -Os instead of -O2
 #Please see http://free-electrons.com/doc/embedded_linux_optimizations/img47.html for some more info
-FULL_OPTIMIZATION = "-fexpensive-optimizations -fomit-frame-pointer -frename-registers -Os"
+FULL_OPTIMIZATION = "-fexpensive-optimizations -fomit-frame-pointer -frename-registers -Os -pipe"
+BUILD_OPTIMIZATION += "-pipe"
 
 #Gcc will die with 'internal consistency error when using the above optimizations
 #with gcc-4.2.1-atmel.1.0.3 (and probably most other avr32 gcc ports).
-- 
1.7.2.3



