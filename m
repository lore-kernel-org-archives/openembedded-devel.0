Received: from mail-gx0-f179.google.com ([209.85.161.179])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1PPlKD-0005Jg-JH
	for openembedded-devel@lists.openembedded.org;
	Tue, 07 Dec 2010 01:22:34 +0100
Received: by gxk21 with SMTP id 21so6888205gxk.10
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 06 Dec 2010 16:21:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=XM4PADf5zlbj2uKzlG18GJg+s8TWNqVMEGSxSPY2UhY=;
	b=cbyFyxCAVnm2+NLeJOm7h9NSlKq/y9AYeEYz/oPCYaw2Awv07W4LwHF99yb6DsLfen
	bfVldMDh7A6Y07ehYIiqg47hYQ9+V95RXXBtPfqvRwTHKHiTACGt9GO1fl/TKC8I4QDN
	WWdnwLKURyTTnFizny75x7eT3hkbWsOjRwsVI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=hjaByjWUD926bO84lWG/669vSDtORyxK3PWzNKJj1VCtFfzxELxTQqsVNv/r0aC6bQ
	yE8nvM4H8J2redZhM0cmU6CdtHQRfekONdbG2uVBWPI+6snBcz22EbI9ZI9aGEiWv2R6
	P60EJlG1I4SHt0jBQP8R74LnmtghGxzVgLOH0=
Received: by 10.42.241.135 with SMTP id le7mr1397054icb.247.1291681264432;
	Mon, 06 Dec 2010 16:21:04 -0800 (PST)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id x18sm8040823wfa.23.2010.12.06.16.21.03
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 06 Dec 2010 16:21:03 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  6 Dec 2010 16:20:39 -0800
Message-Id: <1291681239-21167-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.0.4
X-SA-Exim-Connect-IP: 209.85.161.179
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW,SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] eglibc_svn.bb/eglibc_2.12.bb/eglibc_2.11.bb: Bump SRCREV
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
X-List-Received-Date: Tue, 07 Dec 2010 00:22:34 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 recipes/eglibc/eglibc_2.11.bb |    2 +-
 recipes/eglibc/eglibc_2.12.bb |    2 +-
 recipes/eglibc/eglibc_svn.bb  |    2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes/eglibc/eglibc_2.11.bb b/recipes/eglibc/eglibc_2.11.bb
index 57cf89b..37905eb 100644
--- a/recipes/eglibc/eglibc_2.11.bb
+++ b/recipes/eglibc/eglibc_2.11.bb
@@ -6,7 +6,7 @@ FILESPATHPKG =. "eglibc-svn:"
 PV = "2.11"
 PR = "${INC_PR}.8"
 PR_append = "+svnr${SRCPV}"
-SRCREV="11983"
+SRCREV="12231"
 EGLIBC_BRANCH="eglibc-2_11"
 SRC_URI = "svn://svn.eglibc.org/branches;module=${EGLIBC_BRANCH};proto=svn \
            file://eglibc-svn-arm-lowlevellock-include-tls.patch \
diff --git a/recipes/eglibc/eglibc_2.12.bb b/recipes/eglibc/eglibc_2.12.bb
index 0d871dc..8c019a1 100644
--- a/recipes/eglibc/eglibc_2.12.bb
+++ b/recipes/eglibc/eglibc_2.12.bb
@@ -6,7 +6,7 @@ FILESPATHPKG =. "eglibc-svn:"
 PV = "2.12"
 PR = "${INC_PR}.7"
 PR_append = "+svnr${SRCPV}"
-SRCREV="11982"
+SRCREV="12230"
 EGLIBC_BRANCH="eglibc-2_12"
 SRC_URI = "svn://svn.eglibc.org/branches;module=${EGLIBC_BRANCH};proto=svn \
            file://eglibc-svn-arm-lowlevellock-include-tls.patch \
diff --git a/recipes/eglibc/eglibc_svn.bb b/recipes/eglibc/eglibc_svn.bb
index 9fd1f4b..fb4d3ba 100644
--- a/recipes/eglibc/eglibc_svn.bb
+++ b/recipes/eglibc/eglibc_svn.bb
@@ -1,7 +1,7 @@
 require eglibc.inc
 
 DEPENDS += "gperf-native"
-SRCREV = "11981"
+SRCREV = "12229"
 DEFAULT_PREFERENCE = "-1"
 FILESPATHPKG =. "eglibc-svn:"
 PV = "2.12+svnr${SRCPV}"
-- 
1.7.0.4



