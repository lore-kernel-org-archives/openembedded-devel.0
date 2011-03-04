Received: from mail-yi0-f47.google.com ([209.85.218.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1PvYRu-0002o0-OK
	for openembedded-devel@lists.openembedded.org;
	Fri, 04 Mar 2011 18:05:54 +0100
Received: by yia13 with SMTP id 13so843765yia.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 04 Mar 2011 09:04:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:sender:from:to:cc:subject:date:message-id
	:x-mailer:in-reply-to:references;
	bh=+s85qUdluPzeQyHPqp+id1OQFoosc79ZttprRaS+xMM=;
	b=shfoJoyKLdKRMrrXA+hGGxecOC+Hry+YZelor7E75po+dELrj84kLUJxTZl8QL2knu
	pS6AqqR16KHRZxqeFXp/fhEIdZjSvyluf4Y5MfyBgWaiSxuik4NxfnX6F2yBdB5/Laa8
	Apiy3QG7ku33BY+fVqV0tRNS+8gECj83EqRMI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references;
	b=XgHOP9cXP29M+xSiArVfyaK/5EXEQmBCnLlvK8k9ax9CX9sb+qWxMYEwbW+9e5yhkz
	cIb7rb3jvrK0r8r2yjl6SnSBCxMDZCGFy0sifBDns0ZMw0MJpvTOs+dE9usa6gDfj/pY
	aVtNrF7xrUW1L27yAB5vBMkcxcQYLuxkcJiyA=
Received: by 10.101.41.14 with SMTP id t14mr314023anj.257.1299258264508;
	Fri, 04 Mar 2011 09:04:24 -0800 (PST)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id i10sm1164437anh.12.2011.03.04.09.04.22
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 04 Mar 2011 09:04:23 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  4 Mar 2011 17:04:07 +0000
Message-Id: <1299258247-13554-3-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.3
In-Reply-To: <1299258247-13554-1-git-send-email-otavio@ossystems.com.br>
References: <1299258247-13554-1-git-send-email-otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 3/3] cmake.bbclass: drop CMAKE_MODULE_PATH as it works fine without it
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
X-List-Received-Date: Fri, 04 Mar 2011 17:05:54 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 classes/cmake.bbclass |    2 --
 1 files changed, 0 insertions(+), 2 deletions(-)

diff --git a/classes/cmake.bbclass b/classes/cmake.bbclass
index d2d1c66..40fadea 100644
--- a/classes/cmake.bbclass
+++ b/classes/cmake.bbclass
@@ -42,8 +42,6 @@ cmake_do_generate_toolchain_file() {
   echo "set( CMAKE_FIND_ROOT_PATH_MODE_PROGRAM ONLY )" >> ${WORKDIR}/toolchain.cmake
   echo "set( CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY )" >> ${WORKDIR}/toolchain.cmake
   echo "set( CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY )" >> ${WORKDIR}/toolchain.cmake
-# Use native cmake modules
-  echo "set( CMAKE_MODULE_PATH ${STAGING_DIR_NATIVE}/usr/share/cmake-2.8/Modules/ )" >> ${WORKDIR}/toolchain.cmake
 # Use qt.conf settings
   echo "set( ENV{QT_CONF_PATH} ${WORKDIR}/qt.conf )" >> ${WORKDIR}/toolchain.cmake
 }
-- 
1.7.2.3



