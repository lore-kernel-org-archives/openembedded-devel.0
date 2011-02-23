Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1PsEZl-0001g3-D2
	for openembedded-devel@lists.openembedded.org;
	Wed, 23 Feb 2011 14:16:17 +0100
Received: by yxn22 with SMTP id 22so1124937yxn.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Feb 2011 05:14:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:sender:from:to:cc:subject:date:message-id
	:x-mailer:in-reply-to:references;
	bh=0NaNa3oZW4OhekZukqJJxD0w6MxJZu1Cwi6DJj75ssE=;
	b=Bi+1hhq59hrntjpQtnCqhezveKvVcJ8vj2CFRVU4JJSz54O5S3Js7eNPLv1pRw15pB
	1QT9BqXRDmj6VBffz3pBzrgO29/u8YEo7mNhlIFoab7X5ism3Il13KEQ108wLibO5HWx
	U9Iq8Q3KL3KKQnhpYxZz1zTeaznOLnDqwgvgA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references;
	b=s/fqEwUCtU0fRcZADOd5OF6sowyPN3wYRQ0lz8uEFsLua+nwbujQSP1sJ/euVklGYf
	XIWyNoi7eoK01T1I0779JZ5s8otILqSPNNZkM2Zniq8p37q9aPj4r+wprhZKhhUrtZTT
	EvSg01j7xaeyyrpT8KGrm18HKlY35uMb7WcyM=
Received: by 10.236.110.133 with SMTP id u5mr7240065yhg.26.1298466478804;
	Wed, 23 Feb 2011 05:07:58 -0800 (PST)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id n10sm2276929yhb.38.2011.02.23.05.07.55
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 23 Feb 2011 05:07:57 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 23 Feb 2011 13:07:16 +0000
Message-Id: <1298466445-16486-6-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.3
In-Reply-To: <1298466445-16486-5-git-send-email-otavio@ossystems.com.br>
References: <1298466445-16486-1-git-send-email-otavio@ossystems.com.br>
	<1298466445-16486-2-git-send-email-otavio@ossystems.com.br>
	<1298466445-16486-3-git-send-email-otavio@ossystems.com.br>
	<1298466445-16486-4-git-send-email-otavio@ossystems.com.br>
	<1298466445-16486-5-git-send-email-otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 05/14] cmake.bbclass: use 2.8 modules
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
X-List-Received-Date: Wed, 23 Feb 2011 13:16:17 -0000

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



