Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1PxguM-00074P-61
	for openembedded-devel@lists.openembedded.org;
	Thu, 10 Mar 2011 15:32:40 +0100
Received: by ywg8 with SMTP id 8so684004ywg.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Mar 2011 06:30:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:sender:from:to:cc:subject:date:message-id
	:x-mailer:in-reply-to:references;
	bh=+s85qUdluPzeQyHPqp+id1OQFoosc79ZttprRaS+xMM=;
	b=LqRu+dxo6M+A1sBx+i8/gZPpqZJyKO6+4I1SaDKUbOt6nXddwM+FiAwbAfQNourB4N
	OKPFz0Id38xWQbF7k9rb3wdL5a6TTV5WYDSfyEgSAEf6DBDLWwBewOMSLhG4lrSyFy8j
	aLQEmiF3QjtLYnU6ywsC1ZYYCxjzWASjWTLRY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references;
	b=hYZcde4YO4ziuhdu5nQEy9WRju+OQThnE4IZZZ7UoO4WadIFTsO3GPg+xdHKpWiLn9
	OhjvES6vUUJcYwjyU315jvLj4NDCTLnGUVSXnuO95Xt8KYdRHp8K17KO7EhHXsK4YQ6f
	wz05i8oSlP9ZCw+9ePwQycAAMmT/mhjJ4PNcM=
Received: by 10.150.93.15 with SMTP id q15mr1119537ybb.211.1299767429541;
	Thu, 10 Mar 2011 06:30:29 -0800 (PST)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id w6sm3962040anf.26.2011.03.10.06.30.27
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 10 Mar 2011 06:30:28 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 10 Mar 2011 14:30:05 +0000
Message-Id: <1299767410-969-3-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.3
In-Reply-To: <1299767410-969-1-git-send-email-otavio@ossystems.com.br>
References: <1299767410-969-1-git-send-email-otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 3/8] cmake.bbclass: drop CMAKE_MODULE_PATH as it works fine without it
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
X-List-Received-Date: Thu, 10 Mar 2011 14:32:43 -0000

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



