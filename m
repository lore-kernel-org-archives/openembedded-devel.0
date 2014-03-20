Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f49.google.com (mail-ee0-f49.google.com [74.125.83.49])
	by mail.openembedded.org (Postfix) with ESMTP id 005866F8D1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Mar 2014 12:33:55 +0000 (UTC)
Received: by mail-ee0-f49.google.com with SMTP id c41so610474eek.8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Mar 2014 05:33:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=5zdxor6fuj/eZ1m9VpYXo5oI77dV09VRcrm2xtwMpzM=;
	b=FqKDCEqzoHPoVtyoqs/5MK5sTHsj3oeSTgsQRrGf5GhIS8/t2mR1+pRoFzHC58dX9Q
	PPGsZaHKEmb1NsjsKzR9eUPjjwVTguda45mmfdxUnsKxHDtpGzNh/5vdngwfqJe/Dii2
	Q4HSDTFrIeX67u5y4M476JCGQuPnMoaaf5zt3drC03ujvWDJXy54A6675S/Vm6cqkRAM
	hMm9Lt07AKY+wabrIdToghLadCOBCrURu4T0jHkK49CPBTeC8gnC9fZNENZbrTJqEYl6
	1A17lEjdYspqfOSSWWx5JpqtU5aoc/BhFJWFfM13GnjblmatiJAIP0s5Zzo1oOXje/NI
	w4jA==
X-Received: by 10.14.22.69 with SMTP id s45mr41781026ees.56.1395318836286;
	Thu, 20 Mar 2014 05:33:56 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id o5sm3937075eeg.8.2014.03.20.05.33.54
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 20 Mar 2014 05:33:55 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 20 Mar 2014 13:33:50 +0100
Message-Id: <1395318830-606-2-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1395318830-606-1-git-send-email-Martin.Jansa@gmail.com>
References: <1395318830-606-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-oe][dora][PATCH 2/2] bash-completion: update to version 2.1
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 20 Mar 2014 12:33:56 -0000

From: Matthieu CRAPET <Matthieu.CRAPET@ingenico.com>

Notes:
- PARALLEL_MAKE is still required
- inherit allarch is not present because of runtime dependency with bash (TUNE_PKGARCH)

Signed-off-by: Matthieu Crapet <Matthieu.Crapet@ingenico.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../{bash-completion_2.0.bb => bash-completion_2.1.bb}        | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)
 rename meta-oe/recipes-support/bash-completion/{bash-completion_2.0.bb => bash-completion_2.1.bb} (77%)

diff --git a/meta-oe/recipes-support/bash-completion/bash-completion_2.0.bb b/meta-oe/recipes-support/bash-completion/bash-completion_2.1.bb
similarity index 77%
rename from meta-oe/recipes-support/bash-completion/bash-completion_2.0.bb
rename to meta-oe/recipes-support/bash-completion/bash-completion_2.1.bb
index 014d122..bafe32d 100644
--- a/meta-oe/recipes-support/bash-completion/bash-completion_2.0.bb
+++ b/meta-oe/recipes-support/bash-completion/bash-completion_2.1.bb
@@ -5,26 +5,25 @@ BUGTRACKER = "https://alioth.debian.org/projects/bash-completion/"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 
-PR = "r1"
-
 SECTION = "console/utils"
 
 SRC_URI="http://bash-completion.alioth.debian.org/files/${BPN}-${PV}.tar.bz2"
 
-SRC_URI[md5sum] = "0d903f398be8c8f24bc5ffa6f86127f8"
-SRC_URI[sha256sum] = "e5a490a4301dfb228361bdca2ffca597958e47dd6056005ef9393a5852af5804"
+SRC_URI[md5sum] = "4e2a9f11a4042a38ee79ddcd048e8b9e"
+SRC_URI[sha256sum] = "2b606804a7d5f823380a882e0f7b6c8a37b0e768e72c3d4107c51fbe8a46ae4f"
 
 PARALLEL_MAKE = ""
 
-inherit allarch autotools
+inherit autotools
 
 do_install_append() {
+	# compatdir
 	install -d ${D}${sysconfdir}/bash_completion.d/
 	echo '. ${datadir}/${BPN}/bash_completion' >${D}${sysconfdir}/bash_completion
 
 	# Delete files already provided by util-linux
 	local i
-	for i in cal dmesg hwclock ionice look renice rtcwake; do
+	for i in cal dmesg eject hexdump hwclock ionice look renice rtcwake; do
 		rm ${D}${datadir}/${BPN}/completions/$i
 	done
 }
-- 
1.9.1


