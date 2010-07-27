Received: from mailgw1.fjfi.cvut.cz ([147.32.9.3])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <zub@linux.fjfi.cvut.cz>) id 1OdYe9-0003ha-QA
	for openembedded-devel@lists.openembedded.org;
	Tue, 27 Jul 2010 03:08:07 +0200
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mailgw1.fjfi.cvut.cz (Postfix) with ESMTP id 439C843D17
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Jul 2010 03:07:37 +0200 (CEST)
X-DKIM: Sendmail DKIM Filter v2.8.2 mailgw1.fjfi.cvut.cz 439C843D17
DKIM-Signature: v=1; a=rsa-sha1; c=simple/simple; d=fjfi.cvut.cz; s=beta512;
	t=1280192857; i=@fjfi.cvut.cz; bh=yuJQQNeoQKkNqBhLEqPaicxgpTI=;
	h=From:Date:Subject:To:Message-Id;
	b=fthS6oHQOb7rFayLSC+jItF234ybWgsiRazooFz/ocWIl7rVNCTUqUdnoHHsWUEps
	8YbiZ/GAcCIH2IyTPMaTQ==
X-CTU-FNSPE-Virus-Scanned: amavisd-new at fjfi.cvut.cz
X-CTU-FNSPE: this_is_mailgw_for_ctu_fnspe_header
X-CTU-FNSPE-Helo: linux.fjfi.cvut.cz
X-CTU-FNSPE-Client-Address: 147.32.5.111
X-CTU-FNSPE-Client-Name: linux.fjfi.cvut.cz
X-CTU-FNSPE-Sender: zub@linux.fjfi.cvut.cz
X-CTU-FNSPE-Recip: openembedded-devel@lists.openembedded.org
Received: from mailgw1.fjfi.cvut.cz ([127.0.0.1])
	by localhost (mailgw1.fjfi.cvut.cz [127.0.0.1]) (amavisd-new,
	port 10026) with ESMTP id uOh35pluYZGb
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Jul 2010 03:07:33 +0200 (CEST)
Received: from linux.fjfi.cvut.cz (linux.fjfi.cvut.cz [147.32.5.111])
	by mailgw1.fjfi.cvut.cz (Postfix) with ESMTP id 779D843D14
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Jul 2010 03:07:33 +0200 (CEST)
X-DKIM: Sendmail DKIM Filter v2.8.2 mailgw1.fjfi.cvut.cz 779D843D14
X-DomainKeys: Sendmail DomainKeys Filter v1.0.2 mailgw1.fjfi.cvut.cz 779D843D14
Received: by linux.fjfi.cvut.cz (Postfix, from userid 1001)
	id 27CB746777; Tue, 27 Jul 2010 03:07:33 +0200 (CEST)
From: David Kozub <zub@linux.fjfi.cvut.cz>
Date: Tue, 27 Jul 2010 02:25:39 +0200
To: openembedded-devel@lists.openembedded.org
Message-Id: <20100727010733.27CB746777@linux.fjfi.cvut.cz>
X-SA-Exim-Connect-IP: 147.32.9.3
X-SA-Exim-Mail-From: zub@linux.fjfi.cvut.cz
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 2/3] cmake.bbclass: add CMAKE_SYSTEM_PROCESSOR into generated toolchain file
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
X-List-Received-Date: Tue, 27 Jul 2010 01:08:09 -0000

Needed for packages that check this value, e.g. recent webkit.

Signed-off-by: David Kozub <zub@linux.fjfi.cvut.cz>
---
 classes/cmake.bbclass |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/classes/cmake.bbclass b/classes/cmake.bbclass
index 2376012..32ada35 100644
--- a/classes/cmake.bbclass
+++ b/classes/cmake.bbclass
@@ -28,6 +28,7 @@ cmake_do_generate_toolchain_file() {
 # CMake system name must be something like "Linux".
 # This is important for cross-compiling.
   echo "set( CMAKE_SYSTEM_NAME" `echo ${SDK_OS} | sed 's/^./\u&/'` ")" > ${WORKDIR}/toolchain.cmake
+  echo "set( CMAKE_SYSTEM_PROCESSOR ${TARGET_ARCH} )" >> ${WORKDIR}/toolchain.cmake
   echo "set( CMAKE_C_COMPILER ${OECMAKE_C_COMPILER} )" >> ${WORKDIR}/toolchain.cmake
   echo "set( CMAKE_CXX_COMPILER ${OECMAKE_CXX_COMPILER} )" >> ${WORKDIR}/toolchain.cmake
   echo "set( CMAKE_C_FLAGS \"${OECMAKE_C_FLAGS}\" CACHE STRING \"OpenEmbedded CFLAGS\" )" >> ${WORKDIR}/toolchain.cmake
-- 
1.7.1



