Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OpRxx-0001ry-0b
	for openembedded-devel@lists.openembedded.org;
	Sat, 28 Aug 2010 22:25:30 +0200
Received: by pvg6 with SMTP id 6so1648354pvg.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 28 Aug 2010 13:24:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=LKlyqdRuRTxi/KpvmzIINJsGet/Pa/TDnyKEtexo3AU=;
	b=fjfLybJ/wgkL7dWTzpTNRxRB6oy3KLQRpjkbdZbcobh376eOOgB/E3SyikuH3zDwnt
	ySuQSbXObbDhUQkIbPWybGmi7wfl3MgQ/etZEEMOMPVz2WqG8qV7okQn9Hw2ROSX48XS
	CZzofQ8qQIZ/aT7y+kJOqgZkzz7pq/rmoc/3s=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=TIZ/HdyE63K8HdgHDlCahsZuD1Mnhir9TAtLbXowzPwm4xc+g5YcrR+mXUNIxjmqD+
	WRI0zsd9v2Vz+sfq3aDOlDBBY3wF/Tg5iTtlee/P2snJ0z+tFPzSUKONpvWjhdvIGGfr
	iJ2ZgJHtDFPBPkg0QXr+/eQUA0OTucjlElXb8=
Received: by 10.142.48.18 with SMTP id v18mr2644455wfv.337.1283027098270;
	Sat, 28 Aug 2010 13:24:58 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id n2sm6649371wfl.13.2010.08.28.13.24.57
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sat, 28 Aug 2010 13:24:57 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 28 Aug 2010 13:24:23 -0700
Message-Id: <1283027073-12308-14-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1283027073-12308-1-git-send-email-raj.khem@gmail.com>
References: <1283027073-12308-1-git-send-email-raj.khem@gmail.com>
X-SA-Exim-Connect-IP: 74.125.83.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 13/23] bt950-cs_0.1.bb: Dont override PACKAGES but append to it.
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
X-List-Received-Date: Sat, 28 Aug 2010 20:25:32 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 recipes/bt950-cs/bt950-cs_0.1.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes/bt950-cs/bt950-cs_0.1.bb b/recipes/bt950-cs/bt950-cs_0.1.bb
index ec90c81..09b6281 100644
--- a/recipes/bt950-cs/bt950-cs_0.1.bb
+++ b/recipes/bt950-cs/bt950-cs_0.1.bb
@@ -11,7 +11,7 @@ file://makefile.patch"
 
 S = "${WORKDIR}/bt950-${PV}"
 
-PACKAGES = "${PN}-dbg kernel-module-bt950-cs"
+PACKAGES += "kernel-module-bt950-cs"
 FILES_kernel-module-bt950-cs = "/etc/pcmcia/bt950.conf /lib/modules/${KERNEL_VERSION}/kernel/drivers/bluetooth/bt950_cs.o"
 
 inherit module
-- 
1.7.1



