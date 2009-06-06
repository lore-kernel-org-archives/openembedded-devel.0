Received: from [209.85.219.220] (helo=mail-ew0-f220.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <koen.kooi@gmail.com>) id 1MCsUz-00066Q-Sj
	for openembedded-devel@lists.openembedded.org;
	Sat, 06 Jun 2009 11:47:37 +0200
Received: by ewy20 with SMTP id 20so2921844ewy.12
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 06 Jun 2009 02:38:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=L3AbDbWxt1h6QGZdT3bUA6c6JxDRjBTM8/oIHZF3MrY=;
	b=GVdJUqyr1qK9GuPwkC3Px5NQaekf/tGB1XB5UzaO6CZ8DcHOGngvfftgR0lj6GvEh6
	lsWwxm971k93z56KUdB2ZOac8ERLOfIEhc0nQ638AS1UB7jifQJq8i84a6iKw6AZHYhE
	RqjXNSmRaeJG4aDwpsQ/6liYwv4lBkQH4NMMs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=gkwj1aNe/P3yG5TqUBGpPAgkqwGNYi9lLGXQ5a3JOcZvr+izx6KZPMx2OmZfg4joQS
	GhiB/PUdS9IiU5nH76u/2+OXzbYp4Tqv9Ra7RMzdjRrVPGPaOfHfbKbNEJi0tOxZRoaA
	e/9acJzVEHA9GzC2GGsZcdGOODmPf4+FvSQOo=
Received: by 10.216.44.211 with SMTP id n61mr1572761web.133.1244281100714;
	Sat, 06 Jun 2009 02:38:20 -0700 (PDT)
Received: from localhost (s55917625.adsl.wanadoo.nl [85.145.118.37])
	by mx.google.com with ESMTPS id f13sm58135gvd.23.2009.06.06.02.38.18
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sat, 06 Jun 2009 02:38:19 -0700 (PDT)
From: Koen Kooi <koen.kooi@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  6 Jun 2009 11:38:16 +0200
Message-Id: <1244281096-16000-1-git-send-email-k.kooi@student.utwente.nl>
X-Mailer: git-send-email 1.6.1
Cc: Koen Kooi <koen@openembedded.org>
Subject: [STABLE][PATCH] omapfbplay: update for 2.6.29 header location change
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
X-List-Received-Date: Sat, 06 Jun 2009 09:47:38 -0000

From: Koen Kooi <koen@openembedded.org>

Signed-off-by: Koen Kooi <koen@openembedded.org>
---
 recipes/ffmpeg/omapfbplay_git.bb |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/recipes/ffmpeg/omapfbplay_git.bb b/recipes/ffmpeg/omapfbplay_git.bb
index 202c29f..67189c5 100644
--- a/recipes/ffmpeg/omapfbplay_git.bb
+++ b/recipes/ffmpeg/omapfbplay_git.bb
@@ -20,6 +20,7 @@ CFLAGS += " -I. -I${STAGING_KERNEL_DIR}/include "
 do_compile() {
 	cp ${STAGING_KERNEL_DIR}/arch/arm/plat-omap/include/mach/omapfb.h ${S} || true
 	cp ${STAGING_KERNEL_DIR}/include/asm-arm/arch-omap/omapfb.h ${S} || true
+	cp ${STAGING_KERNEL_DIR}/include/linux/omapfb.h ${S} || true
 	oe_runmake -e
 }
 
-- 
1.6.1



