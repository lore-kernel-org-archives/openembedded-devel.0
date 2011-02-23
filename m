Received: from mail-gw0-f50.google.com ([74.125.83.50])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1PsEVw-0000wY-Bb
	for openembedded-devel@lists.openembedded.org;
	Wed, 23 Feb 2011 14:12:20 +0100
Received: by gwaa20 with SMTP id a20so1109584gwa.9
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Feb 2011 05:11:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:sender:from:to:cc:subject:date:message-id
	:x-mailer:in-reply-to:references;
	bh=S67YCRSC96FEm5vVGUldT+715IWHW6bNeeOdCl4Oqk4=;
	b=HXa26JvQoFwBH+0Cn1Pu/chyMyEItDz1lPin/TxuNirLiT2qpmuxtcsCvjg6pZO/b0
	y2qLTfXGCs1ciF0G+wGNJSwVGX7wizlGaA89p/WtJ3Eh/oxRyEEVwvKa0+AUuknd04wJ
	bpdeGj1tzswq3btLyebBMHxEJUlQnt7os+Qm8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references;
	b=r3WYFY3jU8m9fNxUrtDAZuB+OzpmWddCqHBfcZq9bZqeF9Y/tEMwRJJ9UD/I9Bq+k7
	cdt9Xj2sKJpSagBbeQxZECqU4QNEhrCAjvCsoDUEvSk1oA4NH5Jwp5HHdsyiAXz1EwtB
	CRBQDZ3z05seM1ZEPlFuOtKXmJpMOJzMK1VHc=
Received: by 10.236.95.41 with SMTP id o29mr7298334yhf.29.1298466481271;
	Wed, 23 Feb 2011 05:08:01 -0800 (PST)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id n10sm2276929yhb.38.2011.02.23.05.07.59
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 23 Feb 2011 05:08:00 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 23 Feb 2011 13:07:17 +0000
Message-Id: <1298466445-16486-7-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.3
In-Reply-To: <1298466445-16486-6-git-send-email-otavio@ossystems.com.br>
References: <1298466445-16486-1-git-send-email-otavio@ossystems.com.br>
	<1298466445-16486-2-git-send-email-otavio@ossystems.com.br>
	<1298466445-16486-3-git-send-email-otavio@ossystems.com.br>
	<1298466445-16486-4-git-send-email-otavio@ossystems.com.br>
	<1298466445-16486-5-git-send-email-otavio@ossystems.com.br>
	<1298466445-16486-6-git-send-email-otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 06/14] cmake.bbclass: use QT_CONF_PATH to support Qt4 projects
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
X-List-Received-Date: Wed, 23 Feb 2011 13:12:20 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 classes/cmake.bbclass |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/classes/cmake.bbclass b/classes/cmake.bbclass
index 97347f2..d2d1c66 100644
--- a/classes/cmake.bbclass
+++ b/classes/cmake.bbclass
@@ -44,6 +44,8 @@ cmake_do_generate_toolchain_file() {
   echo "set( CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY )" >> ${WORKDIR}/toolchain.cmake
 # Use native cmake modules
   echo "set( CMAKE_MODULE_PATH ${STAGING_DIR_NATIVE}/usr/share/cmake-2.8/Modules/ )" >> ${WORKDIR}/toolchain.cmake
+# Use qt.conf settings
+  echo "set( ENV{QT_CONF_PATH} ${WORKDIR}/qt.conf )" >> ${WORKDIR}/toolchain.cmake
 }
 
 addtask generate_toolchain_file after do_patch before do_configure
-- 
1.7.2.3



