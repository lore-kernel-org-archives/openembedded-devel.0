Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1PpfQu-0002cc-DU
	for openembedded-devel@lists.openembedded.org;
	Wed, 16 Feb 2011 12:20:32 +0100
Received: by mail-yw0-f47.google.com with SMTP id 6so534879ywi.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Feb 2011 03:19:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:sender:from:to:cc:subject:date:message-id
	:x-mailer:in-reply-to:references;
	bh=w/GnGoA+InZJrno4P65lUj+d4OWDHVQNnTqJT2Kq6Eo=;
	b=BzKgmKnp6/h9R4zNv5eoU6spYs255F6Ewy9lXZuuEUkEwxnszIq9c8MTo7vagjeSsh
	6mWkJogFlKoD/qDJ0zLYG23mCC2CqXEp/fsxl5TuNw03Q2ODb/1T3ISlVOtXw8sGiIXI
	iuZSd+BhS2Ujv3C4TwnxYbsOPOhAmL7NhDS/A=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references;
	b=CSK9K5zM6iN38j+347hGj0FOfmnzhzq2FhHGbS2+6RsKk8sE+ZJf4E2IuSTd/N4dLP
	eOHHocP4SCFu3UFch7iN8vauosCMbvEt3Wmka4y95UZJ3VgP3ix4jbBSc8Efv9hwioC4
	SrXCsqeCC7lhyypjsKw37pJAZKlaybpx7tS6k=
Received: by 10.236.105.226 with SMTP id k62mr757809yhg.53.1297855163135;
	Wed, 16 Feb 2011 03:19:23 -0800 (PST)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id 68sm3057927yhl.19.2011.02.16.03.19.21
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 16 Feb 2011 03:19:22 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 16 Feb 2011 11:18:48 +0000
Message-Id: <1297855134-19216-7-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.3
In-Reply-To: <1297855134-19216-1-git-send-email-otavio@ossystems.com.br>
References: <1297855134-19216-1-git-send-email-otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 07/13] libinih: add
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
X-List-Received-Date: Wed, 16 Feb 2011 11:20:32 -0000

This provides a C and C++ INI library that can be statically linked
into projects.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
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



