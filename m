Received: from mail-yi0-f47.google.com ([209.85.218.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1PqUOd-0007Dq-Oi
	for openembedded-devel@lists.openembedded.org;
	Fri, 18 Feb 2011 18:45:37 +0100
Received: by mail-yi0-f47.google.com with SMTP id 16so1651053yie.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Feb 2011 09:44:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:sender:from:to:cc:subject:date:message-id
	:x-mailer:in-reply-to:references;
	bh=S67YCRSC96FEm5vVGUldT+715IWHW6bNeeOdCl4Oqk4=;
	b=Krw5x28cVp0Y3kweAXebE+w2wMKRT0O69obQSMq2laJLkrkKK6fJJzoHve46mNmOYB
	5NoAkOmy9ZTseevZPfE6lRZA6B9MwElgPihawPz8c2pq/4he5mttnUqP4VrfdGFHDGsE
	Fs0K/4VTr2uuXQj63LXnXv9MEintY0ODfduVs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references;
	b=wjbWsBtkrNxWYKQ3D3nAH65/EeHG2yx7ktlyZRWu5xk/15nVfZ6Kvks4w1GtNWwfhG
	IwY62YcbyZJ5rzG0toaG1cgj7LjboJliNNDcZu9t3xl7TxYQeLvVkfj2hCAu8AIoe1TZ
	kLoYM5gpG1x9xXvCA2P5fCp8ULVbuuEyMdApE=
Received: by 10.236.95.140 with SMTP id p12mr1864109yhf.38.1298051063763;
	Fri, 18 Feb 2011 09:44:23 -0800 (PST)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id 23sm1480538yhl.23.2011.02.18.09.44.21
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 18 Feb 2011 09:44:22 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 18 Feb 2011 17:43:30 +0000
Message-Id: <1298051011-10445-16-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.3
In-Reply-To: <1298051011-10445-1-git-send-email-otavio@ossystems.com.br>
References: <1298051011-10445-1-git-send-email-otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 15/16] cmake.bbclass: use QT_CONF_PATH to support Qt4 projects
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
X-List-Received-Date: Fri, 18 Feb 2011 17:45:37 -0000

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



