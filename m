Received: from mail-vw0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1OHkVZ-0006nm-Sx
	for openembedded-devel@lists.openembedded.org;
	Thu, 27 May 2010 23:20:55 +0200
Received: by mail-vw0-f47.google.com with SMTP id 20so453482vws.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 May 2010 14:16:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:sender:from:to:cc:subject
	:date:message-id:x-mailer:in-reply-to:references;
	bh=ymm5IupB4wzKO9pA2/wO3APhpDx7CKh/yxqZBCd6z5c=;
	b=XQmK0Uk1QIRBD8orwh35IUfbM1i2X7Nsa39a6DeqFy233MCyk46w1U6Id42mYZSKZW
	XCbgIhjyt3RUg1o4/seB8rlZiHsjyuqOEiOvyUiLzvNvokkJWLyqFL9RdDctze7mN9V1
	bnsBXZvKRsoxXl2yrWn+os70MoP13JKnO9RZw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references;
	b=wiyAdxHziejowPwA7t46i9nR6VwppagvlVSQObVw5SVDmrgo+C0htWA3vO9HLGo8SU
	ndee/h07YeN4p3YJrPdtI3eXxcsIYfSxjFQRm2h49zM9P68GmT1G31CDgo3vvFFHuZq2
	8U3jkD4GfEvgdAatP0CFEJvLmM9dfm6NtjOA4=
Received: by 10.220.107.5 with SMTP id z5mr7919458vco.243.1274995006268;
	Thu, 27 May 2010 14:16:46 -0700 (PDT)
Received: from localhost.localdomain (ip24-251-170-95.ph.ph.cox.net
	[24.251.170.95])
	by mx.google.com with ESMTPS id z22sm6593023vco.10.2010.05.27.14.16.44
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 27 May 2010 14:16:45 -0700 (PDT)
Sender: Chris Larson <kergoth@gmail.com>
From: Chris Larson <clarson@kergoth.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 27 May 2010 14:16:28 -0700
Message-Id: <1274994988-5750-4-git-send-email-clarson@kergoth.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1274994988-5750-1-git-send-email-clarson@kergoth.com>
References: <1274994988-5750-1-git-send-email-clarson@kergoth.com>
X-SA-Exim-Connect-IP: 209.85.212.47
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Chris Larson <chris_larson@mentor.com>
Subject: [PATCH 4/4] bitbake.conf: Drop some unnecessary getVar usage in python snippets
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
X-List-Received-Date: Thu, 27 May 2010 21:20:57 -0000

From: Chris Larson <chris_larson@mentor.com>

Signed-off-by: Chris Larson <chris_larson@mentor.com>

diff --git a/conf/bitbake.conf b/conf/bitbake.conf
index 1980f43..397dbc2 100644
--- a/conf/bitbake.conf
+++ b/conf/bitbake.conf
@@ -128,7 +128,8 @@ EXEEXT = "${HOST_EXEEXT}"
 BASE_PACKAGE_ARCH = "${HOST_ARCH}"
 PACKAGE_ARCH = "${BASE_PACKAGE_ARCH}"
 PACKAGE_EXTRA_ARCHS ?= ""
-MACHINE_ARCH = "${@[bb.data.getVar('BASE_PACKAGE_ARCH', d, 1), bb.data.getVar('MACHINE', d, 1)][bool(bb.data.getVar('MACHINE', d, 1))]}"
+MACHINE_ARCH = "${@oe.utils.ifelse(bool(d.getVar('MACHINE', True)), '${MACHINE}', \
+                                   'BASE_PACKAGE_ARCH')}"
 PACKAGE_ARCHS = "all any noarch ${TARGET_ARCH} ${PACKAGE_EXTRA_ARCHS} ${MACHINE}"
 
 MULTIMACH_ARCH = "${PACKAGE_ARCH}"
@@ -174,9 +175,9 @@ ASSUME_PROVIDED = "\
 ##################################################################
 # Package default variables.
 ##################################################################
-PN = "${@bb.parse.BBHandler.vars_from_file(bb.data.getVar('FILE',d),d)[0] or 'defaultpkgname'}"
-PV = "${@bb.parse.BBHandler.vars_from_file(bb.data.getVar('FILE',d),d)[1] or '1.0'}"
-PR = "${@bb.parse.BBHandler.vars_from_file(bb.data.getVar('FILE',d),d)[2] or 'r0'}"
+PN = "${@bb.parse.BBHandler.vars_from_file('${FILE}', d)[0] or 'defaultpkgname'}"
+PV = "${@bb.parse.BBHandler.vars_from_file('${FILE}', d)[1] or '1.0'}"
+PR = "${@bb.parse.BBHandler.vars_from_file('${FILE}', d)[2] or 'r0'}"
 PF = "${PN}-${EXTENDPE}${PV}-${PR}"
 PE ?= "0"
 EXTENDPE = "${@int('${PE}') and '${PE}_' or ''}"
@@ -192,7 +193,7 @@ MACHINE_KERNEL_PR = ""
 # Automatically derives "foo" from "foo-native", "foo-cross" or "foo-initial"
 # otherwise it is the same as PN and P
 SPECIAL_PKGSUFFIX = "-native -cross -initial -intermediate -nativesdk -crosssdk -cross-canadian -sdk"
-BPN = "${@base_prune_suffix(bb.data.getVar('PN', d, True), bb.data.getVar('SPECIAL_PKGSUFFIX', d, True).split(), d)}"
+BPN = "${@base_prune_suffix('${PN}', '${SPECIAL_PKGSUFFIX}'.split(), d)}"
 BP = "${BPN}-${PV}"
 
 # Package info.
-- 
1.7.0.4



