Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RSTKR-0001LO-FJ
	for openembedded-devel@lists.openembedded.org;
	Mon, 21 Nov 2011 13:50:31 +0100
Received: by ghy10 with SMTP id 10so2674566ghy.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Nov 2011 04:44:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=VmyVJTTrpWCnMDONp82Cd6pyHuh5euSc8y7Htclh72o=;
	b=UbOcczv7KqBC8o7hAY+FMdniNtbwF/D2Do9JB0+JUY3CsPQ5u1qdz+/9c4INx+qO5w
	mz+rh0bodMxw14XUMkcgOx01TX3uHVkMRNrKM63keDyTdSSUl+KySDucW101KWYsSfHy
	1LzIDrjq3ILO3WLJAp8y8p9BHUxTKrGhd0Wtg=
Received: by 10.147.60.9 with SMTP id n9mr526495yak.2.1321879441655;
	Mon, 21 Nov 2011 04:44:01 -0800 (PST)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id v5sm29146205anf.3.2011.11.21.04.43.59
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 21 Nov 2011 04:44:00 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 21 Nov 2011 12:43:50 +0000
Message-Id: <8fd05e938bfa3c69e1deaa73cd13bea067e1d2ca.1321879157.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1321879157.git.otavio@ossystems.com.br>
References: <cover.1321879157.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1321879157.git.otavio@ossystems.com.br>
References: <cover.1321879157.git.otavio@ossystems.com.br>
Subject: [meta-oe][PATCH 1/1] freerdp: use FreeRDP-old repository as 1.0 release is not stable yet
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
X-List-Received-Date: Mon, 21 Nov 2011 12:50:33 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta-oe/recipes-support/freerdp/freerdp_git.bb |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-support/freerdp/freerdp_git.bb b/meta-oe/recipes-support/freerdp/freerdp_git.bb
index 3df1e07..2a3affd 100644
--- a/meta-oe/recipes-support/freerdp/freerdp_git.bb
+++ b/meta-oe/recipes-support/freerdp/freerdp_git.bb
@@ -7,9 +7,9 @@ inherit gitpkgv
 
 PV = "gitr${SRCPV}"
 PKGV = "${GITPKGVTAG}"
-PR = "${INC_PR}.2"
+PR = "${INC_PR}.3"
 
-SRCREV = "b05747b55ccea8d2f2b830f89d3c0eb622d66784"
-SRC_URI = "git://github.com/FreeRDP/FreeRDP.git;protocol=git"
+SRCREV = "b3eb650c919c4b3b1e5bc12cea6afb05282a7232"
+SRC_URI = "git://github.com/FreeRDP/FreeRDP-old.git;protocol=git"
 
 S = "${WORKDIR}/git"
-- 
1.7.2.5



