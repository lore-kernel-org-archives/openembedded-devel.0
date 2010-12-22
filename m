Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen.kooi@gmail.com>) id 1PVMek-0002Es-K8
	for openembedded-devel@lists.openembedded.org;
	Wed, 22 Dec 2010 12:14:54 +0100
Received: by wwi17 with SMTP id 17so4921437wwi.24
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Dec 2010 03:14:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=etiCl3CkWK44BW7TFD10hZ06K6aR8r/ANKbnAhDYYjE=;
	b=andQO57HjCAfrtohdXgrN14IIdExqe4VfXH0LPiscu80cYbZ83BIsYR6j7YUkFeOOh
	qRYZcf+aZ9GXivAp498Eu7H0UrE673Y0dtJcvpSxoPR50MP7LUcrxRhVCNxOSjDp0WH3
	Ieo/sFH26TgkdlOHsdPxnhVMiOkB8Mb8uKStg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=w8NivMSrRw0zI/+Id98AR8TzclWCYf7ijVG+HLDpAw9m72T+WZJH96Q6eSFSgc5x9l
	pzCzMqyGxZpi8Df9AC+HCpp3syT14WZsmkZRuX7oOccVi3onDtmNzOFtdo1t5E25m4tm
	wWKhDdDRDWfLW6o2mitmJ1RgLLir/KZMzP6HE=
Received: by 10.216.254.89 with SMTP id g67mr10406347wes.7.1293016486532;
	Wed, 22 Dec 2010 03:14:46 -0800 (PST)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id m6sm3045550wej.34.2010.12.22.03.14.44
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 22 Dec 2010 03:14:45 -0800 (PST)
From: Koen Kooi <koen.kooi@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 22 Dec 2010 12:14:41 +0100
Message-Id: <1293016481-703-1-git-send-email-koen@openembedded.org>
X-Mailer: git-send-email 1.7.0
Cc: Koen Kooi <koen@openembedded.org>
Subject: [PATCH] sanity: release 2010.12 is out, so bump minimum bitbake to 1.10.0 per TSC decision
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
X-List-Received-Date: Wed, 22 Dec 2010 11:14:54 -0000

Signed-off-by: Koen Kooi <koen@openembedded.org>
---
 conf/sanity.conf |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/conf/sanity.conf b/conf/sanity.conf
index 0f53cb2..1c83c14 100644
--- a/conf/sanity.conf
+++ b/conf/sanity.conf
@@ -3,7 +3,7 @@
 # See sanity.bbclass
 #
 # Expert users can confirm their sanity with "touch conf/sanity.conf"
-BB_MIN_VERSION = "1.8.18"
+BB_MIN_VERSION = "1.10.0"
 
 SANITY_ABIFILE = "${TMPDIR}/abi_version"
 SANITY_PRFILE = "${TMPDIR}/distro_pr"
-- 
1.7.0



