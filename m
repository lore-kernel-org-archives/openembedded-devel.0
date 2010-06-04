Received: from mail-pz0-f193.google.com ([209.85.222.193])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1OKgG0-0007uO-Qu
	for openembedded-devel@lists.openembedded.org;
	Sat, 05 Jun 2010 01:24:57 +0200
Received: by pzk31 with SMTP id 31so866802pzk.16
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 04 Jun 2010 16:20:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:sender:from:to:cc:subject
	:date:message-id:x-mailer;
	bh=7o2uauNyU9PQe12ClPijbkSS+6YZn/e66L9nY2/CHFk=;
	b=XyQ28JJKpPzK2ijWv046U9TCmDW9ew8/tdD/iS7ETR21VjpKGiXUFSKfATubTByPXA
	NK3kSjhfB62LlxNvVJpKs+ho3CiYGYW6/gaFACeL+i5vWzYEixGPnU3rJ28Ga9ii1p8J
	0NSdxs0tsgmgBPTc0CcGPZuMZiGP++bH5DHTE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer;
	b=KhXASeIwfFokf41tuXnJUxUp5l8OJnFfR5UmVjEG/FkdFOmAQtxb95wzdpUbFYTyCp
	Kg4keoNsxhYEr1/5wrXapmhu3KRjp2603vnL1Yd8KOxTkFZD2k6+nQpAJIG2OROmRrMV
	3uZnRtDrhhMiugHT8JUbC6QehlKwW8OMRN78U=
Received: by 10.115.81.7 with SMTP id i7mr9154511wal.115.1275693638649;
	Fri, 04 Jun 2010 16:20:38 -0700 (PDT)
Received: from localhost.localdomain (ip24-251-170-95.ph.ph.cox.net
	[24.251.170.95])
	by mx.google.com with ESMTPS id c14sm12750636waa.1.2010.06.04.16.20.37
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 04 Jun 2010 16:20:37 -0700 (PDT)
Sender: Chris Larson <kergoth@gmail.com>
From: Chris Larson <clarson@kergoth.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  4 Jun 2010 16:20:29 -0700
Message-Id: <1275693629-26516-1-git-send-email-clarson@kergoth.com>
X-Mailer: git-send-email 1.7.0.4
X-SA-Exim-Connect-IP: 209.85.222.193
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Chris Larson <chris_larson@mentor.com>
Subject: [PATCH] Drop some unnecessary immediate assignments
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
X-List-Received-Date: Fri, 04 Jun 2010 23:24:57 -0000

From: Chris Larson <chris_larson@mentor.com>

Signed-off-by: Chris Larson <chris_larson@mentor.com>

diff --git a/classes/openmoko-base.bbclass b/classes/openmoko-base.bbclass
index 8cbf7df..f1ca536 100644
--- a/classes/openmoko-base.bbclass
+++ b/classes/openmoko-base.bbclass
@@ -13,7 +13,7 @@ def openmoko_base_get_subdir(d):
 
 SUBDIR = "${@openmoko_base_get_subdir(d)}"
 
-SRC_URI := "${OPENMOKO_MIRROR}/src/target/${OPENMOKO_RELEASE}/${SUBDIR};module=${PN};proto=http"
+SRC_URI = "${OPENMOKO_MIRROR}/src/target/${OPENMOKO_RELEASE}/${SUBDIR};module=${PN};proto=http"
 S = "${WORKDIR}/${PN}"
 
 FILES_${PN} += "${datadir}/icons"
diff --git a/classes/openmoko2.bbclass b/classes/openmoko2.bbclass
index 233c721..1dfef64 100644
--- a/classes/openmoko2.bbclass
+++ b/classes/openmoko2.bbclass
@@ -22,7 +22,7 @@ def openmoko_two_get_subdir(d):
 LICENSE = "${@openmoko_two_get_license(d)}"
 SUBDIR = "${@openmoko_two_get_subdir(d)}"
 
-SRC_URI := "${OPENMOKO_MIRROR}/src/target/${OPENMOKO_RELEASE}/${SUBDIR};module=${PN};proto=http"
+SRC_URI = "${OPENMOKO_MIRROR}/src/target/${OPENMOKO_RELEASE}/${SUBDIR};module=${PN};proto=http"
 S = "${WORKDIR}/${PN}"
 
 FILES_${PN} += "${datadir}/icons"
diff --git a/classes/qmake_base.bbclass b/classes/qmake_base.bbclass
index 4fbe21f..577c0fa 100644
--- a/classes/qmake_base.bbclass
+++ b/classes/qmake_base.bbclass
@@ -1,6 +1,6 @@
 
 OE_QMAKE_PLATFORM = "${TARGET_OS}-oe-g++"
-QMAKESPEC := "${QMAKE_MKSPEC_PATH}/${OE_QMAKE_PLATFORM}"
+QMAKESPEC = "${QMAKE_MKSPEC_PATH}/${OE_QMAKE_PLATFORM}"
 
 # We override this completely to eliminate the -e normally passed in
 EXTRA_OEMAKE = ' MAKEFLAGS= '
-- 
1.7.0.4



