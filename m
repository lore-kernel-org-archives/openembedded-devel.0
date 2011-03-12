Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1PyUXP-0004jD-NC
	for openembedded-devel@lists.openembedded.org;
	Sat, 12 Mar 2011 20:31:48 +0100
Received: by gxk3 with SMTP id 3so537798gxk.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 12 Mar 2011 11:27:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:sender:from:to:cc:subject:date:message-id
	:x-mailer:in-reply-to:references;
	bh=+s85qUdluPzeQyHPqp+id1OQFoosc79ZttprRaS+xMM=;
	b=fHDi97t7eZcFFPD6cfv7Zn0U3x0VF+QoQmly3Lt0fNHuzm73cWBi7QgQA7XF4x+oKf
	2X315sx8apLSE9A/gMOVGKtP/5OE9aaZufVV0aYRqn0WlEszfPWaGR+pbZR6afOIZtBA
	XH4gyZY//IkGBD9o3kSVLUh+lMF4xeIai12e4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references;
	b=Tc79r/+ha+EYHU8kqI38e6oDdlfxA7yxtcuqQ2MaEpUIeC6O2TnnRGzqqtr+Rad0fj
	1q5GsQWzmqfeBbyFOP8TSAmDjf6yDP/XbH7S+uj7zm2s43aHNViyGCREIeeZbMin3BgR
	r8QCdG089+MWJ7QXZpCYcwIREo7fjA1bAb8Bk=
Received: by 10.90.38.7 with SMTP id l7mr1435947agl.133.1299958057308;
	Sat, 12 Mar 2011 11:27:37 -0800 (PST)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id c38sm4812832anc.38.2011.03.12.11.27.35
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 12 Mar 2011 11:27:36 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 12 Mar 2011 19:27:10 +0000
Message-Id: <1299958038-25216-4-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.3
In-Reply-To: <1299958038-25216-1-git-send-email-otavio@ossystems.com.br>
References: <1299958038-25216-1-git-send-email-otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 03/11] cmake.bbclass: drop CMAKE_MODULE_PATH as it works fine without it
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
X-List-Received-Date: Sat, 12 Mar 2011 19:31:48 -0000

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



