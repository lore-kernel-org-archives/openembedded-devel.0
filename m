Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1Q5dJv-0008I2-ET
	for openembedded-devel@lists.openembedded.org;
	Fri, 01 Apr 2011 14:19:19 +0200
Received: by gwb11 with SMTP id 11so1391052gwb.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 01 Apr 2011 05:17:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:sender:from:to:cc:subject:date:message-id
	:x-mailer:in-reply-to:references;
	bh=j1j/QOifspDcNqC9IqjRw4zQYS1UKBpUyz2/FbhLNrg=;
	b=lYenyV6oDDYlbnI7sdTpPSIqXobIlwNLIImZHmjDqHWsXnqMhQHHzigviP0Hc9ro+g
	7cyjQjYuVL2FiRCl21+dr7K2nqRPxWXet/PoBKh+7VMoJv/Qe59dv1OsVYlrd4ukxz9E
	XJWu7jSleRd2X/MdfKhfuTVtL7hoGyPG/puGU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references;
	b=pAncSmfrB1+JXBrH7oZkmlAu5bfAn1cmTrUsBTC1crkcpA7NPOKirmSyqe5kbiVXXd
	r3qwQDYhFD/HPBOVJfZQ4+zpcWy5eTHTjFmm+tmcYW6j0ay/aGptGkx2anT1qs/CLYh8
	uFzjfkjydPaLEgDDacaTIGanSERyt39K7t/I8=
Received: by 10.150.14.4 with SMTP id 4mr3715169ybn.434.1301660236826;
	Fri, 01 Apr 2011 05:17:16 -0700 (PDT)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id d3sm948462ybi.20.2011.04.01.05.17.14
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 01 Apr 2011 05:17:15 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  1 Apr 2011 12:16:45 +0000
Message-Id: <1301660208-31105-3-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.3
In-Reply-To: <1301660208-31105-1-git-send-email-otavio@ossystems.com.br>
References: <1301660208-31105-1-git-send-email-otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 3/6] xorg-xserver-common.inc: drop .la files from packages
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
X-List-Received-Date: Fri, 01 Apr 2011 12:19:19 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 recipes/xorg-xserver/xorg-xserver-common.inc |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/recipes/xorg-xserver/xorg-xserver-common.inc b/recipes/xorg-xserver/xorg-xserver-common.inc
index 29e3b10..8f59b0b 100644
--- a/recipes/xorg-xserver/xorg-xserver-common.inc
+++ b/recipes/xorg-xserver/xorg-xserver-common.inc
@@ -2,7 +2,7 @@ HOMEPAGE = "http://www.x.org"
 SECTION = "x11/base"
 LICENSE = "MIT-X"
 
-INC_PR = "r18"
+INC_PR = "r19"
 
 PROVIDES = "virtual/xserver"
 
@@ -108,4 +108,5 @@ FILES_${PN}-multimedia-modules = "${libdir}/xorg/modules/multimedia/*drv*"
 
 do_install_append () {
 	ln -sf ${datadir}/fonts/X11 ${D}/${libdir}/X11/fonts
+	find ${D}/${libdir} -name '*.la' -exec rm '{}' ';'
 }
-- 
1.7.2.3



