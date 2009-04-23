Received: from [209.85.221.124] (helo=mail-qy0-f124.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1LwneJ-0001Mp-BI
	for openembedded-devel@lists.openembedded.org;
	Thu, 23 Apr 2009 03:22:47 +0200
Received: by qyk30 with SMTP id 30so632187qyk.24
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Apr 2009 18:18:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:sender:received:from:to:cc
	:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=wmxwaWFNSI80BxKRp6G8uNrCHY58t3PsZWKuhF6u9Sg=;
	b=qprxhsEOviOL+aTExvIBVwTC5tzfKWWY8lP1upbD3oBtYKORYouCK/Dx3CYo2Tt0yu
	tm8LCbY7j8OYFa4PGNJzu/N7xaHmMIcyWTRexPo9stN9GiY76XEdYYIUWodps978dtod
	gqUkddt+8N2rBCjUx1BE9KbJnT2hMltx2iyjI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references;
	b=XW/94FOrIq7tCdcqbHSxT5IV1nSVmC9M7cA66RRABa+crxwSqEfuziHTyi6g3fs8QI
	ufU0pnPFZDUQRuUbhkWQ84DVbLpDIGcZ5pTyONB5x5bRda6VNb+xptoz7M5+BsLp/SED
	PlfbmErxmfM285sD7GghV2MuzNa7nFeC+a3+Q=
Received: by 10.220.99.6 with SMTP id s6mr780474vcn.96.1240449490582;
	Wed, 22 Apr 2009 18:18:10 -0700 (PDT)
Received: from ossystems.com.br (201-40-162-47.cable.viacabocom.com.br
	[201.40.162.47])
	by mx.google.com with ESMTPS id 6sm1741135ywp.14.2009.04.22.18.18.05
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 22 Apr 2009 18:18:07 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
Received: by ossystems.com.br (Postfix, from userid 1000)
	id 92C36610087; Wed, 22 Apr 2009 22:17:54 -0300 (BRT)
From: Otavio Salvador <otavio@debian.org>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 22 Apr 2009 22:17:36 -0300
Message-Id: <1240449461-26116-2-git-send-email-otavio@debian.org>
X-Mailer: git-send-email 1.6.2.1.303.g63699
In-Reply-To: <1240449461-26116-1-git-send-email-otavio@debian.org>
References: <1240449461-26116-1-git-send-email-otavio@debian.org>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 1/6] qt4.inc: add translation packages to the dynamic list
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
X-List-Received-Date: Thu, 23 Apr 2009 01:22:48 -0000

From: Otavio Salvador <otavio@ossystems.com.br>

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 recipes/qt4/qt4.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes/qt4/qt4.inc b/recipes/qt4/qt4.inc
index fb44e58..50ff013 100644
--- a/recipes/qt4/qt4.inc
+++ b/recipes/qt4/qt4.inc
@@ -62,7 +62,7 @@ OTHER_PACKAGES = "\
              ${QT_BASE_NAME}-pixeltool"
 
 PACKAGES += "${LIB_PACKAGES} ${DEV_PACKAGES} ${DBG_PACKAGES} ${OTHER_PACKAGES}"
-PACKAGES_DYNAMIC = "${QT_BASE_NAME}-plugin-*"
+PACKAGES_DYNAMIC = "${QT_BASE_NAME}-plugin-* ${QT_BASE_NAME}-translation-*"
 
 ALLOW_EMPTY_${PN} = "1"
 FILES_${PN}     = ""
-- 
1.6.2.1.303.g63699



