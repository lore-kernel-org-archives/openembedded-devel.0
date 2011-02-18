Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1PqUPZ-0007Gp-JO
	for openembedded-devel@lists.openembedded.org;
	Fri, 18 Feb 2011 18:46:33 +0100
Received: by gyd8 with SMTP id 8so1654524gyd.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Feb 2011 09:45:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:sender:from:to:cc:subject:date:message-id
	:x-mailer:in-reply-to:references;
	bh=0NaNa3oZW4OhekZukqJJxD0w6MxJZu1Cwi6DJj75ssE=;
	b=NO6Q4bYcplOeFY7TJBn2+gFundDryUg4bsd0emxXDxU+AVhBpvO9cebB6TR8t4ItzV
	SNo6vTvzQ7twQOOlumIYjInOH0QK3Va3+PlocDuntFdQzMafoXtWhzV+Rg0BUNsPFiPI
	KTjk8MEGK/BqaPOug6G3tzfvG/kz4huOPkprs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references;
	b=mYTITWwRBUGWDsGlDDOWuTaWBUL3PPe4Y2/yNyPOt6R1Ui612fMLuv83o0BBtBal5R
	rpaY0C5uBwTgBZvPzDb0kshdK3mHJsHxmKpAYFIBqjs16YqYD/nR6qrSSIalfVJgyyYZ
	kIG9nbcD8JVC/Jp/noq7pTSrlpoSLNCD7vPM8=
Received: by 10.236.108.167 with SMTP id q27mr502675yhg.36.1298051061468;
	Fri, 18 Feb 2011 09:44:21 -0800 (PST)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id 23sm1480538yhl.23.2011.02.18.09.44.19
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 18 Feb 2011 09:44:20 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 18 Feb 2011 17:43:29 +0000
Message-Id: <1298051011-10445-15-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.3
In-Reply-To: <1298051011-10445-1-git-send-email-otavio@ossystems.com.br>
References: <1298051011-10445-1-git-send-email-otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 14/16] cmake.bbclass: use 2.8 modules
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
X-List-Received-Date: Fri, 18 Feb 2011 17:46:33 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 classes/cmake.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/classes/cmake.bbclass b/classes/cmake.bbclass
index 29248e6..97347f2 100644
--- a/classes/cmake.bbclass
+++ b/classes/cmake.bbclass
@@ -43,7 +43,7 @@ cmake_do_generate_toolchain_file() {
   echo "set( CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY )" >> ${WORKDIR}/toolchain.cmake
   echo "set( CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY )" >> ${WORKDIR}/toolchain.cmake
 # Use native cmake modules
-  echo "set( CMAKE_MODULE_PATH ${STAGING_DIR_NATIVE}/usr/share/cmake-2.6/Modules/ )" >> ${WORKDIR}/toolchain.cmake
+  echo "set( CMAKE_MODULE_PATH ${STAGING_DIR_NATIVE}/usr/share/cmake-2.8/Modules/ )" >> ${WORKDIR}/toolchain.cmake
 }
 
 addtask generate_toolchain_file after do_patch before do_configure
-- 
1.7.2.3



