Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OdTsh-0007Hb-2s
	for openembedded-devel@lists.openembedded.org;
	Mon, 26 Jul 2010 22:02:36 +0200
Received: by pwi10 with SMTP id 10so229845pwi.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Jul 2010 13:02:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=Bqevs+U/9AXIqtFBH9d25NhaBonbhxIiUBobRxvFcQQ=;
	b=UlSa2WGqj4sJJ7bmHJLcUoh41mcLU+u7UIQU9D/PVchrKoEpMA3D5fUXO5dZQe6OYo
	Wko4G6ZXCWK4bI5OpOUG3bmQhGc4m0eSc35c2B4072BzG/vvzFj1vvujUH0FVynLPS5U
	M3KfsnLc+r3qhwsL4xRdUoYBsS4fN5M91rD9g=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=MlUQJUU0QUmctZj1OCAytVCnnakSPDdykqY2m98kQpgqV2tRxzwG2hQVur43YkZR1j
	13f9ssz+C6eZt5H7caBFGDJWQ7RNpf5xilHgmPioMGYBuTZEOTn+JhHa5EXzmQM5Ujqp
	S4+Ip0RSAkMFC4i9bvS1UMqiVdXoqFeG4Cuac=
Received: by 10.142.201.6 with SMTP id y6mr6695959wff.78.1280174537900;
	Mon, 26 Jul 2010 13:02:17 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id q27sm4573766wfc.18.2010.07.26.13.02.17
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 26 Jul 2010 13:02:17 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 26 Jul 2010 13:02:05 -0700
Message-Id: <1280174528-27682-5-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1280174528-27682-1-git-send-email-raj.khem@gmail.com>
References: <1280174528-27682-1-git-send-email-raj.khem@gmail.com>
X-SA-Exim-Connect-IP: 209.85.160.47
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS,
	UPPERCASE_50_75 autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 4/7] sdk.bbclass: override BASEPKG_HOST_SYS as it is used to make TARGET_SYS
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
X-List-Received-Date: Mon, 26 Jul 2010 20:02:37 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 classes/sdk.bbclass |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/classes/sdk.bbclass b/classes/sdk.bbclass
index 198d147..049fda1 100644
--- a/classes/sdk.bbclass
+++ b/classes/sdk.bbclass
@@ -15,6 +15,7 @@ PACKAGE_ARCH = "${BUILD_ARCH}-${OLD_PACKAGE_ARCH}-sdk"
 # Also save BASE_PACKAGE_ARCH since HOST_ARCH can influence it
 OLD_BASE_PACKAGE_ARCH := "${BASE_PACKAGE_ARCH}"
 BASE_PACKAGE_ARCH = "${OLD_BASE_PACKAGE_ARCH}"
+BASEPKG_HOST_SYS = "${BUILD_ARCH}-${HOST_OS}"
 
 STAGING_DIR_HOST = "${STAGING_DIR}/${HOST_SYS}-sdk"
 STAGING_DIR_TARGET = "${STAGING_DIR}/${OLD_MULTIMACH_ARCH}${TARGET_VENDOR}-${TARGET_OS}"
-- 
1.7.1



