Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1PPkGb-00049X-Tr
	for openembedded-devel@lists.openembedded.org;
	Tue, 07 Dec 2010 00:14:48 +0100
Received: by pwi8 with SMTP id 8so2078402pwi.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 06 Dec 2010 15:13:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=LWk+bsAv6rv9Fu9hBckhX9SBl/fRrlLUtZGIpkp+iHc=;
	b=tBbKo3FWHiz+NCJ6ly+zlCPv/P/IoH/k4LtPFhpx84IeV+/tpqOmYdWBlgVFLysXD5
	ow3G0hBTm0GppanfmIQ+vMAzaETW6ekdW7eG5cx5Pt/GV/WOgDxTOLSrbj+mVGVI/jpB
	1T+60rBAAoW9v1Vq+PhwRg5Kq4rJjYxUgGG3M=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=rqjWRYGaVh/TGXRrzwysYJ31gMjU71p+nuVD0zzmst1/wQNz2NiFwXnS8asHfZeovd
	0/L6k2VILhOqPyimYUKyEwhQcHgk9vP4d8EQE6rs5SDUaqSxLvf5DqwSdJH5qJfQ+c9D
	YLxKlWtE8XiRmjY1MwdpPAoE2kufCy0q1vnSA=
Received: by 10.143.85.3 with SMTP id n3mr6022804wfl.112.1291677197320;
	Mon, 06 Dec 2010 15:13:17 -0800 (PST)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id q13sm7959631wfc.17.2010.12.06.15.13.16
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 06 Dec 2010 15:13:16 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  6 Dec 2010 15:12:52 -0800
Message-Id: <1291677172-20939-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.0.4
X-SA-Exim-Connect-IP: 209.85.160.47
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW,SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] binutils_git.bb: Bump SRCREV to latest 2.21 branch
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
X-List-Received-Date: Mon, 06 Dec 2010 23:14:48 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 recipes/binutils/binutils_git.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes/binutils/binutils_git.bb b/recipes/binutils/binutils_git.bb
index 26583bb..1815f09 100644
--- a/recipes/binutils/binutils_git.bb
+++ b/recipes/binutils/binutils_git.bb
@@ -1,5 +1,5 @@
 FILESPATHPKG =. "binutils-git:"
-SRCREV = "63afe4ed46b5b8c21445192c9046d1c3de2859ec"
+SRCREV = "8e34e0b00b49977c905554ebd6e793b095ec2f05"
 require binutils.inc
 PR = "${INC_PR}.3"
 PR_append = "+gitr${SRCPV}"
-- 
1.7.0.4



