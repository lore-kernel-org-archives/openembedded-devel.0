Received: from mail-vw0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1QWWrb-0006RA-M7
	for openembedded-devel@lists.openembedded.org;
	Tue, 14 Jun 2011 18:53:15 +0200
Received: by mail-vw0-f47.google.com with SMTP id 2so5172754vws.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Jun 2011 09:49:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:sender:from:to:cc:subject:date:message-id
	:x-mailer:in-reply-to:references:in-reply-to:references;
	bh=mZV6Yov4eMklXg6Skt91ZFDTFlqGB/QVcW4pV581xbU=;
	b=KQKa5hdSAX1Enr4//EwVuWdTiLxTi4Wm0Ujbi3/3Sd72SRuUH7X/buaufYRkbu1fym
	bJkH951DZoootSUrfNqpVs6EbVUeAPnv6SxZaeYzP1PavmFgT9rzy0GvcHpeWYLhAkC6
	G1bMRqmxGO+kobI3CoBqKwN4tQRdwlMxMpZgk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references;
	b=AyR102nkH4LVSxVxCWgQdOcXJ/L9mpOb+HjGqfOJQC0sSXxsK+7Ms6DwgWWblLHr6h
	KRh7e7SqAgqdxxdbnZ2zf6qi2eGIo33Zi7iJh5WGBsZt/hz6YiCpO/SzTumdQIEEXxiX
	AsFelL8Bn1S/TZl4xvk6InIlXcWT9j8YrCbzY=
Received: by 10.52.96.98 with SMTP id dr2mr10243554vdb.3.1308070192285;
	Tue, 14 Jun 2011 09:49:52 -0700 (PDT)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id bt2sm2307123vdc.12.2011.06.14.09.49.49
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 14 Jun 2011 09:49:51 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 14 Jun 2011 16:49:33 +0000
Message-Id: <474e5750fa3a436e84d79ec64153310e3b0ee159.1308070134.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1308070134.git.otavio@ossystems.com.br>
References: <cover.1308070134.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1308070134.git.otavio@ossystems.com.br>
References: <cover.1308070134.git.otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [[meta-oe][PATCH 2/3] freerdp: bump SRCREV to gather fixes
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
X-List-Received-Date: Tue, 14 Jun 2011 16:53:15 -0000

This new version has many major refactorings that will be available on
0.9.0 release but the main fix is related to serial port redirection
that has got many fixes and improvements.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta-oe/recipes-support/freerdp/freerdp_git.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta-oe/recipes-support/freerdp/freerdp_git.bb b/meta-oe/recipes-support/freerdp/freerdp_git.bb
index a5f158a..a3f4a03 100644
--- a/meta-oe/recipes-support/freerdp/freerdp_git.bb
+++ b/meta-oe/recipes-support/freerdp/freerdp_git.bb
@@ -9,7 +9,7 @@ PV = "gitr${SRCPV}"
 PKGV = "${GITPKGVTAG}"
 PR = "${INC_PR}.2"
 
-SRCREV = "dd759622a097474114ce425021ef52d0aa5d3957"
+SRCREV = "d1eef40acc994d85cb78c0a98914edc097c9b44d"
 SRC_URI = "git://github.com/FreeRDP/FreeRDP.git;protocol=git"
 
 S = "${WORKDIR}/git"
-- 
1.7.2.5



