Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OddyL-0001OS-5J
	for openembedded-devel@lists.openembedded.org;
	Tue, 27 Jul 2010 08:49:13 +0200
Received: by iwn34 with SMTP id 34so3565389iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Jul 2010 23:48:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=Bqevs+U/9AXIqtFBH9d25NhaBonbhxIiUBobRxvFcQQ=;
	b=eDgfKn4kpGCuPeEpHqMpC0hPu56ZBJLST7UCKQiltDHcQrUVwu6MwfkfLkbx4l9ssd
	4MdRbMkY7+dzygPu5RS0f7PSyVdSUSz2iwOadvhn9GWJ3nPkbePH314pPox0QufP2EaS
	ikThgEk2Qp8vPQHe7B/CSrKLDz7C/U0048URQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=gn0zKJVc4EWr+BB0gTtrJGoi3FXLZhFnF296K5BYOHNPkmzAsgtl/tBiKsH1SIYHKi
	OumxNr0HclL47v+hKuM9a6sylypVMTsGvNUolp/3mwrQYCup2zeN6eNB/2HVUmqYrjFR
	JROJyBxYhAPzn5Ni5jfBMU/aseofwvchMsC/8=
Received: by 10.231.182.204 with SMTP id cd12mr9938239ibb.101.1280213329876;
	Mon, 26 Jul 2010 23:48:49 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id n20sm4506941ibe.5.2010.07.26.23.48.48
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 26 Jul 2010 23:48:49 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 26 Jul 2010 23:48:31 -0700
Message-Id: <1280213315-5513-5-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1280213315-5513-1-git-send-email-raj.khem@gmail.com>
References: <1280213315-5513-1-git-send-email-raj.khem@gmail.com>
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS,
	UPPERCASE_50_75 autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 4/8] sdk.bbclass: override BASEPKG_HOST_SYS as it is used to make TARGET_SYS
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
X-List-Received-Date: Tue, 27 Jul 2010 06:49:14 -0000

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



