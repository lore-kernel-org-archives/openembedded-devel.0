Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rep.dot.nop@gmail.com>) id 1PZqc8-0004Xw-Em
	for openembedded-devel@lists.openembedded.org;
	Mon, 03 Jan 2011 21:02:44 +0100
Received: by fxm17 with SMTP id 17so12728004fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 03 Jan 2011 12:02:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:received:from:to:cc:subject
	:date:message-id:x-mailer:in-reply-to:references;
	bh=LlI5DFtnzZLnl12UzHO9AmpzDYQNjqeOsy/2kqQaOMM=;
	b=utuVtJB2dITkMEgv8/QCSvx17kiQUqX82+a1j4M8NoNDW8l11Yd6dg4VLcnCfzhYgn
	f2D5zfIUHz+yUcLW8lHCmb6IFC6HeEuvUuOy+Io2VOEHu2a/8cVW5ttvOArerdvNjD6R
	EqInYQnQaL9aBcwIoZzf+h4/wm7IbuHIBhVJg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=BiBBJ0sHppj+tvxJoWkFxb4hmY/Cpzu0++tigW1a+xqv72NBvJVJ90ftRe24MH2lAq
	T7JEcZIelMiGcZFmiCdibOywMPNuYVGu1W5XdvwZENXUNQ5iv05vabWJbim0/WTKMP+w
	9bh581qYMlVgMRBSq/5XiifgPGMzv0hUrvCj4=
Received: by 10.103.215.12 with SMTP id s12mr1690203muq.47.1294084939295;
	Mon, 03 Jan 2011 12:02:19 -0800 (PST)
Received: from s42.loc (85-127-155-31.dynamic.xdsl-line.inode.at
	[85.127.155.31])
	by mx.google.com with ESMTPS id a6sm3129447fak.1.2011.01.03.12.02.16
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 03 Jan 2011 12:02:17 -0800 (PST)
Received: from cow by s42.loc with local (Exim 4.72)
	(envelope-from <rep.dot.nop@gmail.com>)
	id 1PZqbf-0000ou-NJ; Mon, 03 Jan 2011 21:02:15 +0100
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  3 Jan 2011 21:01:59 +0100
Message-Id: <1294084926-3115-5-git-send-email-rep.dot.nop@gmail.com>
X-Mailer: git-send-email 1.7.2.3
In-Reply-To: <1294084926-3115-1-git-send-email-rep.dot.nop@gmail.com>
References: <1294084926-3115-1-git-send-email-rep.dot.nop@gmail.com>
Subject: [PATCH 05/12] uclibc: shared-flat: put crtreloc.o into -dev package
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
X-List-Received-Date: Mon, 03 Jan 2011 20:02:44 -0000

Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
---
 recipes/uclibc/uclibc.inc |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/recipes/uclibc/uclibc.inc b/recipes/uclibc/uclibc.inc
index 09f5af7..1c7dfc3 100644
--- a/recipes/uclibc/uclibc.inc
+++ b/recipes/uclibc/uclibc.inc
@@ -52,6 +52,7 @@ FILES_uclibc-dev_append = "\
         ${libdir}/lib*.so \
         ${libdir}/*_nonshared.a \
         ${libdir}/[S]*crt[1in].o \
+        ${libdir}/crtreloc*.o \
         ${libdir}/lib*.a \
         ${includedir}/*.h ${includedir}/*/*.h \
        "
@@ -60,7 +61,7 @@ FILES_uclibc-utils-dbg += "${bindir}/.debug ${sbindir}/.debug"
 FILES_uclibc-gconv = "${libdir}/gconv"
 FILES_uclibc-thread-db = "/lib/libthread_db*"
 RPROVIDES_uclibc-dev += "libc-dev virtual-libc-dev"
-# uclibc does not really has libsegfault but then using the one from glibc is also not
+# uclibc does not really have libsegfault but then using the one from glibc is also not
 # going to work. So we pretend that we have it to make bitbake not pull other recipes
 # to satisfy this dependency for the images/tasks
 RPROVIDES_${PN} += "libsegfault"
-- 
1.7.2.3



