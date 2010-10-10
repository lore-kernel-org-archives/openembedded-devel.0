Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1P4saE-0003qP-AJ
	for openembedded-devel@lists.openembedded.org;
	Sun, 10 Oct 2010 11:52:47 +0200
Received: by pzk2 with SMTP id 2so98248pzk.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Oct 2010 02:52:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=nlT1SP6rU2+R1SIih46icFp7ZA3WIQrvKuesQUk5mmE=;
	b=fo3yxzvPUjTErPBxNuEgGd+AhHCgaaMx9w/VdfInnXmtN9NYUoT/uQVlMC4NoUabXQ
	YqN3ootdzIgLyjRfWlbo9S8Fh38xNGf9RbQCnyaow5b2YbxJk2uufzSjHz6Opr1tXC3s
	qZeAwVT6N8dBVIcTrW2lwv/gJw2ZqOIKSaNDg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=YxlYKTC23udMHLrZ3nrZOpT6xy+DmNDx7zjmp6FQmlJYb7WLArAV4lr7d2Ly7mfg5M
	TlCS+L/rikzFqSplr40Z343OPMu7oQNvHwnG0l9q4cZ/K4slVqLb9qyCY6CpYyI2jKnG
	eIcflG5G7/gdQHkBgkIaNVRl42AtjFHjOevwo=
Received: by 10.114.79.10 with SMTP id c10mr5430768wab.220.1286704339192;
	Sun, 10 Oct 2010 02:52:19 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id d31sm7721890wam.5.2010.10.10.02.52.18
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sun, 10 Oct 2010 02:52:18 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 10 Oct 2010 02:52:13 -0700
Message-Id: <1286704333-27208-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.1
X-SA-Exim-Connect-IP: 209.85.210.47
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] bitbake.conf: Increase IMAGE_EXTRA_SPACE 4 times
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
X-List-Received-Date: Sun, 10 Oct 2010 09:52:47 -0000

* Building native-sdk-image or x11-image genext2fs fails
  as it runs out of space. This change helps it with extra
  space needs.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 conf/bitbake.conf |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/conf/bitbake.conf b/conf/bitbake.conf
index 7f01f8f..5bbff4c 100644
--- a/conf/bitbake.conf
+++ b/conf/bitbake.conf
@@ -355,7 +355,7 @@ IMAGE_ROOTFS = "${TMPDIR}/rootfs/${PN}"
 IMAGE_BASENAME = "${PN}"
 IMAGE_NAME = "${IMAGE_BASENAME}-${MACHINE}-${DATETIME}"
 IMAGE_LINK_NAME = "${IMAGE_BASENAME}-${MACHINE}"
-IMAGE_EXTRA_SPACE = 10240
+IMAGE_EXTRA_SPACE = 40960
 
 UBI_VOLNAME ?= "${MACHINE}-rootfs"
 
-- 
1.7.1



