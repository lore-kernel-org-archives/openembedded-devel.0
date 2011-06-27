Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1QbHhP-0001BU-GN
	for openembedded-devel@lists.openembedded.org;
	Mon, 27 Jun 2011 21:42:23 +0200
Received: by mail-gx0-f175.google.com with SMTP id 3so1595989gxk.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Jun 2011 12:38:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:sender:from:to:cc:subject:date:message-id
	:x-mailer:in-reply-to:references:in-reply-to:references;
	bh=1xFQAjvtd/rZe9WAxpY9sHK4k8w3+wDBInWLvxH7GxE=;
	b=Fvc7w7lYhoZr+JGZ4Ezr1vOt+2MZizY9NYa7LSyO0jYACDL0eESIGsTc20l71dB9uA
	eMPSYyDTfH5zfi3EJIZlxpCVe0jHuF5OgjFJ7Bfl7m30waWTgRJTYZJGprgvUMLRk/u+
	syGQ3RBSGA9A9lQdbTar98nge7qqWvSp3uVQc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references;
	b=LLyzzGpcFNprjWwb/hoLfpx6tiNOtwNZl/jcgAIUxGm54/DkxCr0dQl5I1wdUPuNmv
	1OekijI3JI6c7qVRveOy5hMTYCAjcAsbURTUlORhPgF8wyW5scxpSGJDkyle6jDVjFb2
	f6NfFjMA1eYCxcxsqpdIPqTLZaEGvidzeu0Kc=
Received: by 10.150.95.5 with SMTP id s5mr6747514ybb.19.1309203525176;
	Mon, 27 Jun 2011 12:38:45 -0700 (PDT)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id e24sm3675890yhk.51.2011.06.27.12.38.43
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 27 Jun 2011 12:38:44 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 27 Jun 2011 19:38:24 +0000
Message-Id: <a3205029ac4ffa5b9b1431657f1fd63db37323f8.1309203431.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1309203431.git.otavio@ossystems.com.br>
References: <cover.1309203431.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1309203431.git.otavio@ossystems.com.br>
References: <cover.1309203431.git.otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [[meta-oe][PATCH 3/4] freerdp-extension-xpunlimited: bump SRCREV to fix a build failure
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
X-List-Received-Date: Mon, 27 Jun 2011 19:42:23 -0000

FreeRDP has renamed its library from libfreerdp to libfreerdp-core
thus this needed changes too.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 .../freerdp/freerdp-extension-xpunlimited_git.bb   |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta-oe/recipes-support/freerdp/freerdp-extension-xpunlimited_git.bb b/meta-oe/recipes-support/freerdp/freerdp-extension-xpunlimited_git.bb
index 4fc6928..c9721f4 100644
--- a/meta-oe/recipes-support/freerdp/freerdp-extension-xpunlimited_git.bb
+++ b/meta-oe/recipes-support/freerdp/freerdp-extension-xpunlimited_git.bb
@@ -14,7 +14,7 @@ PR = "r0"
 
 inherit pkgconfig cmake
 
-SRCREV = "d27f90a0128c687ce74cc922dba8b7eeb33f0654"
+SRCREV = "e952627ff4c116b4ce8541c91cb96bd5422c4a0d"
 SRC_URI = "git://github.com/OSSystems/FreeRDP-Extension-XPUnlimited.git;protocol=git"
 
 S = "${WORKDIR}/git"
-- 
1.7.2.5



