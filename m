Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <joaohf@gmail.com>) id 1OTlTR-0002HR-0P
	for openembedded-devel@lists.openembedded.org;
	Wed, 30 Jun 2010 02:48:27 +0200
Received: by gwj18 with SMTP id 18so145040gwj.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Jun 2010 17:43:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=Ip4afbtOtudX/YzgzBPyxx5zR2g50KYWpjx0w5Etjm4=;
	b=P7RZ/zhMi2abWBg2/qCASJ2BPn9VFkEK8UaNwn3tNsHRHlrisn0LXutY2RvW//wBbZ
	rTiaOB7MmW8opHTrg8Xy+D8cBGuytv/HZ/4SsSNdbLUzOXSbo+uKNgEp3T9QWudAbwgI
	KiKNItO7LTmRvFNM49Q4vbK1ZI13Dp+LFcb/s=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=B24pbV0+VyWw+zQ6RHb8R9U55SdWz3+stQ2bv1y9TV5LbUGtzfBDLEQimAwwSl50kb
	FxciTxQ4VXDMiA/JDaN9It+6GCoucbGvShp8dPMeT/p0ld08H1WbGI8rKaP+YmAP3qxt
	xEUiwyJ8XpwzOrjGKi0o1CNtSpclYfSiTKnnU=
Received: by 10.101.201.37 with SMTP id d37mr9423766anq.56.1277858617359;
	Tue, 29 Jun 2010 17:43:37 -0700 (PDT)
Received: from localhost.localdomain ([201.53.204.31])
	by mx.google.com with ESMTPS id b11sm10624359ana.6.2010.06.29.17.43.35
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 29 Jun 2010 17:43:36 -0700 (PDT)
From: "Joao H. Freitas" <joaohf@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 29 Jun 2010 21:43:19 -0300
Message-Id: <1277858599-27400-3-git-send-email-joaohf@gmail.com>
X-Mailer: git-send-email 1.7.0.2
In-Reply-To: <1277858599-27400-1-git-send-email-joaohf@gmail.com>
References: <1277858599-27400-1-git-send-email-joaohf@gmail.com>
X-SA-Exim-Connect-IP: 74.125.83.47
X-SA-Exim-Mail-From: joaohf@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 2/2] replace sdk -> nativesdk
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
X-List-Received-Date: Wed, 30 Jun 2010 00:48:30 -0000

---
 recipes/cmake/cmake.inc      |    2 +-
 recipes/cmake/cmake_2.8.1.bb |    2 --
 2 files changed, 1 insertions(+), 3 deletions(-)

diff --git a/recipes/cmake/cmake.inc b/recipes/cmake/cmake.inc
index 5601ddb..e53cd35 100644
--- a/recipes/cmake/cmake.inc
+++ b/recipes/cmake/cmake.inc
@@ -10,7 +10,7 @@ PR = "r3"
 CMAKE_MAJOR_VERSION = "${@bb.data.getVar('PV',d,1).split('.')[0]}.${@bb.data.getVar('PV',d,1).split('.')[1]}"
 SRC_URI = "http://www.cmake.org/files/v${CMAKE_MAJOR_VERSION}/cmake-${PV}.tar.gz"
 
-BBCLASSEXTEND = "native sdk"
+BBCLASSEXTEND = "native nativesdk"
 
 inherit autotools
 
diff --git a/recipes/cmake/cmake_2.8.1.bb b/recipes/cmake/cmake_2.8.1.bb
index 845ea7c..279495c 100644
--- a/recipes/cmake/cmake_2.8.1.bb
+++ b/recipes/cmake/cmake_2.8.1.bb
@@ -1,7 +1,5 @@
 require cmake.inc
 
-#inherit cmake
-
 do_configure_append() {
 	sed -i -e 's,HAVE_GLIBC_STRERROR_R__TRYRUN_OUTPUT-ADVANCED:INTERNAL=1,HAVE_GLIBC_STRERROR_R__TRYRUN_OUTPUT-ADVANCED:INTERNAL=0,' CMakeCache.txt
 }
-- 
1.7.0.2



