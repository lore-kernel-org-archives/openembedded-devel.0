Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1PqUOM-0007ES-1p
	for openembedded-devel@lists.openembedded.org;
	Fri, 18 Feb 2011 18:45:18 +0100
Received: by gyd8 with SMTP id 8so1654063gyd.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Feb 2011 09:44:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:sender:from:to:cc:subject:date:message-id
	:x-mailer:in-reply-to:references;
	bh=4uz5jf2PwCuDaxM6y1uKIoSZ38OujE799n/1q95I+uY=;
	b=UcvPT6e+vxTLZ87POPjCGRxgA/k9DoQ1ab/4XHSVaKMdcZ2oHuLJHctduKL0ZW3WLC
	rDRGzFpXGAMrLSPjdnICQ4YSc9KSNXqoNuZ1qPtJk/hawbh7dzDeLtPSOpyjkCH0inx8
	Xl+5KvxBTK4i8wgwkHnTWYhOyx3gdR5d0vvwI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references;
	b=SPGkodb2Gmi9/30ATGn9lxTR+490fXuVPgOokGpJIS5fkP2HPafRrAluWYRv6HnRvT
	DOCDFZa8rXl819QMi0i2L7BRTrtgWcFBERw3Ixhkz4U9zayC7tHv0lAthe39BwA9DAuz
	C6U7AnsnKTv7dvSaI4fYhYlKWzyLIN75dYakI=
Received: by 10.150.177.16 with SMTP id z16mr1391689ybe.422.1298051043946;
	Fri, 18 Feb 2011 09:44:03 -0800 (PST)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id 23sm1480538yhl.23.2011.02.18.09.44.01
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 18 Feb 2011 09:44:02 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 18 Feb 2011 17:43:22 +0000
Message-Id: <1298051011-10445-8-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.3
In-Reply-To: <1298051011-10445-1-git-send-email-otavio@ossystems.com.br>
References: <1298051011-10445-1-git-send-email-otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 07/16] libinih: add
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
X-List-Received-Date: Fri, 18 Feb 2011 17:45:18 -0000

This provides a C and C++ INI library that can be statically linked
into projects.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
Acked-by: Khem Raj <raj.khem@gmail.com>
---
 recipes/libinih/libinih_git.bb |   14 ++++++++++++++
 1 files changed, 14 insertions(+), 0 deletions(-)
 create mode 100644 recipes/libinih/libinih_git.bb

diff --git a/recipes/libinih/libinih_git.bb b/recipes/libinih/libinih_git.bb
new file mode 100644
index 0000000..e9f811f
--- /dev/null
+++ b/recipes/libinih/libinih_git.bb
@@ -0,0 +1,14 @@
+DESCRIPTION = "C and C++ INI Library"
+PRIORITY = "optional"
+PV = "0.0+gitr${SRCPV}"
+PKGV = "${GITPKGVTAG}"
+PR = "r0"
+LICENSE = "BSD"
+RDEPENDS_${PN}-dev = ""
+
+SRCREV = "${AUTOREV}"
+SRC_URI = "git://projetos.ossystems.com.br/git/libinih.git;protocol=git"
+
+S = "${WORKDIR}/git"
+
+inherit gitpkgv cmake
-- 
1.7.2.3



