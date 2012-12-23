Received: from mail-ea0-f182.google.com ([209.85.215.182])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Tmko6-0000oS-Pl
	for openembedded-devel@lists.openembedded.org;
	Sun, 23 Dec 2012 13:37:37 +0100
Received: by mail-ea0-f182.google.com with SMTP id a14so2611107eaa.13
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 Dec 2012 04:22:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=ZWy5pyO4PZwxw4gQ1HIwvlSNLtPD5gEZI8/6YdLX888=;
	b=NTczgPd1nGiXmdYXhQJBqrxvpAuSZjFh+86/CB+a/kc2gxuWwrcWx26GMTZSmxuePt
	W5dLJTnNQ4aU0UFGfCw7ny+NxS5tAwfba6AuBQ5yo+/rgLd+1cbr0Xa+isJBHBGDBOeD
	KFqqJ/Rl0x0V6Wn6SzFKVecu3Nk5Quw6Ne3ZNYfLP0BhLfmgx6ZxkcyQ+xlvTaj5/9zT
	Xou1jgkGqWWo6FzwmLDBf9N1PkrTRHwJWsTOzhRKt0qUr+HAtN1z3rIH3BLyU7NwN6Ek
	K/fEJRibldaRXmZ2/5ywLo5oeab473kKwAEAagugGUMm2thzMMI9KyKfq0sHitqr3AzS
	MNEA==
X-Received: by 10.14.173.65 with SMTP id u41mr47815337eel.13.1356265362525;
	Sun, 23 Dec 2012 04:22:42 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id r1sm34552335eeo.2.2012.12.23.04.22.41
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 23 Dec 2012 04:22:42 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 23 Dec 2012 13:21:30 +0100
Message-Id: <b415fe7782e0f0579ab539829b803b97d785a194.1356264861.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0.2
In-Reply-To: <cover.1356264861.git.Martin.Jansa@gmail.com>
References: <cover.1356264861.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1356264861.git.Martin.Jansa@gmail.com>
References: <cover.1356264861.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 05/30] edbus2: include edbus-codegen in PN-utils
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
X-List-Received-Date: Sun, 23 Dec 2012 12:37:38 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/efl/edbus2_svn.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-efl/recipes-efl/efl/edbus2_svn.bb b/meta-efl/recipes-efl/efl/edbus2_svn.bb
index 58ef853..15e7002 100644
--- a/meta-efl/recipes-efl/efl/edbus2_svn.bb
+++ b/meta-efl/recipes-efl/efl/edbus2_svn.bb
@@ -2,10 +2,13 @@ require ${BPN}.inc
 
 SRCREV = "${EFL_SRCREV}"
 PV = "1.7.99+svnr${SRCPV}"
-PR = "${INC_PR}.0"
+PR = "${INC_PR}.1"
 DEFAULT_PREFERENCE = "-1"
 
 SRC_URI = "\
   ${E_SVN}/trunk;module=${SRCNAME};protocol=http;scmdata=keep \
 "
 S = "${WORKDIR}/${SRCNAME}"
+
+PACKAGES =+ "${PN}-utils"
+FILES_${PN}-utils = "${bindir}/edbus-codegen"
-- 
1.8.0.2



