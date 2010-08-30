Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <chasemaupin03@gmail.com>) id 1OqALF-0006TU-Uy
	for openembedded-devel@lists.openembedded.org;
	Mon, 30 Aug 2010 21:48:32 +0200
Received: by ywa8 with SMTP id 8so2288922ywa.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Aug 2010 12:47:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=EPWPMA0vPuyTRxCQyaBrdGj89V1vCSNusmfYHxt3RAU=;
	b=XNIELTj9iGwChMQidhVWPOp33AoHr7UFK0GOaty9plBwQLKcWrzDaH4feZqyz+9ENG
	OP+vU3JoQPEJ5CZZOwHQbhAKR2mt1Q0UXgJJldcBL9Yx4ujIlqnZaXFd4jJyZsKOvA6O
	rv7LTiHSk0hpPOmlCKiaGQppt/RoBdXpoDLW4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=bPreCtxeEhApLYf3RXcxYRdqD8PQfJ3SZe1Gl9fyCb1qk05CBHmTF2QkAhFTTaT4ax
	ux76B36sHqpJVzHDg7bZTAj1kPel0PQJss5s5Bjm8RB2a1p/YA2qq9TdxZxherbh3T/r
	WvmHHJoax8shaIihw/t4RzX2O21Rlwt0d6pM4=
Received: by 10.151.6.5 with SMTP id j5mr481915ybi.332.1283197674267;
	Mon, 30 Aug 2010 12:47:54 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com [192.94.94.33])
	by mx.google.com with ESMTPS id e7sm164658ybe.4.2010.08.30.12.47.52
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 30 Aug 2010 12:47:53 -0700 (PDT)
From: Chase Maupin <chasemaupin03@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 30 Aug 2010 14:39:16 -0500
Message-Id: <1283197156-22017-1-git-send-email-chase.maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
X-SA-Exim-Connect-IP: 209.85.213.47
X-SA-Exim-Mail-From: chasemaupin03@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] matrix-tui: add dependency on ncurses and zlib
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
X-List-Received-Date: Mon, 30 Aug 2010 19:48:32 -0000

* The matrix-tui application depends on the ncurses libraries
  and header files during build time.
* The matrix-tui application depends on the zlib libraries
  and header files during build time.
* Add ncurses and zlib to the DEPENDS list for matrix-tui

Signed-off-by: Chase Maupin <chase.maupin@ti.com>
---
 recipes/ti/matrix-tui_svn.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes/ti/matrix-tui_svn.bb b/recipes/ti/matrix-tui_svn.bb
index 13ec5c5..1e4f7ea 100644
--- a/recipes/ti/matrix-tui_svn.bb
+++ b/recipes/ti/matrix-tui_svn.bb
@@ -3,11 +3,11 @@ HOMEPAGE = "https://gforge.ti.com/gf/project/matrix_tui/"
 LICENSE = "BSD"
 SECTION = "multimedia"
 PRIORITY = "optional"
-DEPENDS = "libxml2"
+DEPENDS = "libxml2 ncurses zlib"
 
 SRCREV = "29"
 PV = "1.0"
-PR = "r2+svnr${SRCPV}"
+PR = "r3+svnr${SRCPV}"
 
 INSANE_SKIP_${PN} = "True"
 
-- 
1.7.0.4



