Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PetEh-0003iv-W1
	for openembedded-devel@lists.openembedded.org;
	Mon, 17 Jan 2011 18:51:24 +0100
Received: by gyh20 with SMTP id 20so2049849gyh.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Jan 2011 09:50:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer;
	bh=W7oCtlUvg1RS24+TEpW1hFxLY/L8aIadopS5TvTQX4I=;
	b=x/+swm5M65Peb8vAsmlJv7rftYYvC+TgXm6TEoZO/eULsbRVEp5o4LdSxVKZ3mZtAv
	g8BniS6nUqQgKengRNnVWcXK1zzLF65khAL7dpqfzHyij4QS9YzG+VJsjLUg6bFDKB1b
	UnllzBwCvGYj+1Sch/GesQDXxseRBdCAV2px8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=HNVQzQgW3+oPf4leQBOoTkXBbr7+QnO7TUYNgFtY5IggUB04nsZ1+NvJOT7Th+Janb
	mh0ftNtSmwyzPQLIb0fJFUGUSdDychqgCpJmn5m5t7v685dt1SoPnwjUEjcGsFCi0cXV
	4hvoawaBPhxOg4e1BYznkkfzKWCs7/jZj5JLk=
Received: by 10.100.125.1 with SMTP id x1mr2687993anc.82.1295286645449;
	Mon, 17 Jan 2011 09:50:45 -0800 (PST)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id i10sm5754693anh.12.2011.01.17.09.50.43
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 17 Jan 2011 09:50:44 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 17 Jan 2011 09:50:38 -0800
Message-Id: <1295286639-4901-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.2.3
Subject: [PATCH 1/2] minimal.conf: Prefer perl 5.10.1 and opie 1.2.5
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
X-List-Received-Date: Mon, 17 Jan 2011 17:51:24 -0000

* Tested various builds seems to hold fine

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 conf/distro/minimal.conf |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/conf/distro/minimal.conf b/conf/distro/minimal.conf
index 5a19cbc..f495d13 100644
--- a/conf/distro/minimal.conf
+++ b/conf/distro/minimal.conf
@@ -108,7 +108,7 @@ INHERIT += "recipe_sanity"
 # PREFERRED VERSIONS
 #############################################################################
 require conf/distro/include/preferred-e-versions.inc
-require conf/distro/include/preferred-opie-versions-1.2.4.inc
+require conf/distro/include/preferred-opie-versions-1.2.5.inc
 
 PREFERRED_PROVIDER_opkg ?= "opkg"
 PREFERRED_PROVIDER_virtual/update-alternatives ?= "opkg"
@@ -119,7 +119,8 @@ PREFERRED_VERSION_qt4-embedded = "${PREFERRED_QT_VERSION}"
 PREFERRED_VERSION_qt4-embedded-gles = "${PREFERRED_QT_VERSION}"
 PREFERRED_VERSION_qt4-x11-free = "${PREFERRED_QT_VERSION}"
 PREFERRED_VERSION_qt4-x11-free-gles = "${PREFERRED_QT_VERSION}"
-
+PREFERRED_VERSION_perl = "5.10.1"
+PREFERRED_VERSION_perl-native = "5.10.1"
 #############################################################################
 # CONTENTS
 #############################################################################
-- 
1.7.2.3



