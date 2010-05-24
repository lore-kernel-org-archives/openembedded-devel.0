Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OGP40-0008Tq-5s
	for openembedded-devel@lists.openembedded.org;
	Mon, 24 May 2010 06:14:53 +0200
Received: by pwi5 with SMTP id 5so52309pwi.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 May 2010 21:10:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=bUpaXtqAq+z9EiJAbQemhrAUd/rNG4xqfLJMcHmZzaE=;
	b=dK4jr6WQ6o2K4z6KB+l5ska1u8UrAKxLKIE6JEHuU9iNvTh7Q94NLeS9dFYo8Gw21x
	rKnzxq6mQ0ExjgucPosIIrCLvmuDCUAhVZQN50JWSIWCmStDF2Vtz1YhgxDPxw3oHdS3
	mtEyEJX+Qp0lSFD2EQa3tdTd1jb9RuRGZTuJ4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=Gfj6lNn8X2Jku7RKnm6+wXvBHeDNtTXxuLQeHJWK2mKRSJ6jTEFzsjYwZCxLx/jlay
	aHfv2ay6Eljz4DVUjQ2gJb7zs4q5LSt1bt8lMW7cLqtgGCgcT7OQIiC2rzQGn5cXnh6c
	uqXb0rIlmXEcAS86bRMawxNnE1MiY5a8hWbfI=
Received: by 10.114.18.36 with SMTP id 36mr4356582war.98.1274674245526;
	Sun, 23 May 2010 21:10:45 -0700 (PDT)
Received: from localhost (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id 33sm34807424wad.20.2010.05.23.21.10.44
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sun, 23 May 2010 21:10:44 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 23 May 2010 21:10:40 -0700
Message-Id: <1274674240-19973-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.0.4
X-SA-Exim-Connect-IP: 209.85.160.47
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] distro/minimal.conf: Dont keep CACHE as weak assignment.
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
X-List-Received-Date: Mon, 24 May 2010 04:14:53 -0000

* As this is a weak assignment and bitbake.conf has a proper
  assignment and bitbake.conf is included before distro conf
  file it leaves this weak assignment as no-op. The problem happens
  when using minimal but changing libc from eglibc to uclibc then
  it will use same cache directory and then its infact wrong.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 conf/distro/minimal.conf |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/conf/distro/minimal.conf b/conf/distro/minimal.conf
index f42f1b6..1e72efd 100644
--- a/conf/distro/minimal.conf
+++ b/conf/distro/minimal.conf
@@ -66,7 +66,7 @@ IPKG_VARIANT = "opkg-nogpg"
 #############################################################################
 # Name the generated images in a sane way
 IMAGE_NAME = "${DISTRO_NAME}-${IMAGE_BASENAME}-${LIBC}-${PREFERRED_PKG_FORMAT}-${DISTRO_VERSION}-${MACHINE}"
-CACHE ?= "${TMPDIR}/cache/${LIBC}/${MACHINE}"
+CACHE = "${TMPDIR}/cache/${LIBC}/${MACHINE}"
 DEPLOY_DIR ?= "${TMPDIR}/deploy/${LIBC}"
 DEPLOY_DIR_IMAGE = "${DEPLOY_DIR}/images/${MACHINE}"
 SPLASH ?= '${@base_contains("MACHINE_FEATURES", "screen", "psplash", "",d)}'
-- 
1.7.0.4



