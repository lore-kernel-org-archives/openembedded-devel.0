Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1Pu39I-0002wa-De
	for openembedded-devel@lists.openembedded.org;
	Mon, 28 Feb 2011 14:28:28 +0100
Received: by ywg8 with SMTP id 8so1253795ywg.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Feb 2011 05:27:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:sender:from:to:cc:subject:date:message-id
	:x-mailer:in-reply-to:references;
	bh=WBZenz44nEvc2qjyBM4mNa/BnwuusLAIpdlFE2+Bh/E=;
	b=ir40cb0+R7iK6D0miyw6ATKZ3a36tm0lB9td0R6o1u2OEwy3LMQdWRcGm1rxk2Aoc4
	YiPsqCziUI+A/ugGqsoezg+G8+955j5nZ/SjCL1J1BsjGUA+RHKy9Lh/BMholBDCPDPA
	zeh0v9Tl6w+I5M/h82UxsMW/MYwoUNal3g0x4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references;
	b=x7Cr8M66Z2pg83YhtHDLG+yRX/FjQmO6IhTJ2zxnhg4RNJ6+I757cPxIvIHPtufiEN
	Bi0fG4BnSVkTKhQCg3cmrUmmh7ZsOSUaUnB5CU8yrtRlVqN/XE2p4KMModVidut1JyCg
	yE4n2lmSKAAy4YJFti7YYZ4rA/kfzv91pyMZU=
Received: by 10.90.248.36 with SMTP id v36mr1470904agh.33.1298899620265;
	Mon, 28 Feb 2011 05:27:00 -0800 (PST)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id b28sm117412ana.0.2011.02.28.05.26.58
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 28 Feb 2011 05:26:59 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 28 Feb 2011 13:26:46 +0000
Message-Id: <1298899606-9139-2-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.3
In-Reply-To: <1298899606-9139-1-git-send-email-otavio@ossystems.com.br>
References: <1298899606-9139-1-git-send-email-otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 2/2] conf/bitbake.conf: add DISTRO_ARCH and MACHINE_DISTRO_ARCH
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
X-List-Received-Date: Mon, 28 Feb 2011 13:28:28 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 conf/bitbake.conf |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/conf/bitbake.conf b/conf/bitbake.conf
index 1002c01..b018f08 100644
--- a/conf/bitbake.conf
+++ b/conf/bitbake.conf
@@ -132,7 +132,9 @@ PACKAGE_ARCH = "${BASE_PACKAGE_ARCH}"
 PACKAGE_EXTRA_ARCHS ?= ""
 MACHINE_ARCH = "${@oe.utils.ifelse(bool(d.getVar('MACHINE', True)), '${MACHINE}', \
                                    'BASE_PACKAGE_ARCH')}"
-PACKAGE_ARCHS = "all any noarch ${TARGET_ARCH} ${PACKAGE_EXTRA_ARCHS} ${MACHINE}"
+DISTRO_ARCH = "${TARGET_ARCH}-${DISTRO}"
+MACHINE_DISTRO_ARCH = "${MACHINE_ARCH}-${DISTRO}"
+PACKAGE_ARCHS = "all any noarch ${TARGET_ARCH} ${PACKAGE_EXTRA_ARCHS} ${DISTRO_ARCH} ${MACHINE_DISTRO_ARCH} ${MACHINE}"
 
 MULTIMACH_ARCH = "${PACKAGE_ARCH}"
 MULTIMACH_TARGET_SYS = "${MULTIMACH_ARCH}${TARGET_VENDOR}-${TARGET_OS}"
-- 
1.7.2.3



