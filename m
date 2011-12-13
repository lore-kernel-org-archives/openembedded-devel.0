Received: from smtprelay-b21.telenor.se ([195.54.99.212])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ulf@emagii.com>) id 1RabOK-00054l-Rw
	for openembedded-devel@lists.openembedded.org;
	Wed, 14 Dec 2011 00:04:08 +0100
Received: from ipb1.telenor.se (ipb1.telenor.se [195.54.127.164])
	by smtprelay-b21.telenor.se (Postfix) with ESMTP id EED45E273
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Dec 2011 23:57:12 +0100 (CET)
X-SENDER-IP: [83.227.57.213]
X-LISTENER: [smtp.bredband.net]
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: AiJJAOzX505T4znVPGdsb2JhbABDqx4ZAQEBATcygXIBAQVWIxAgHxI5ChQZh34GtjKISYMaBJRxkio
X-IronPort-AV: E=Sophos;i="4.71,349,1320620400"; d="scan'208";a="236202610"
Received: from c-d539e353.011-39-73746f12.cust.bredbandsbolaget.se (HELO
	hexagon.atmel.com) ([83.227.57.213])
	by ipb1.telenor.se with ESMTP; 13 Dec 2011 23:56:53 +0100
From: ulf@emagii.com
To: openembedded-devel@lists.openembedded.org
Date: Tue, 13 Dec 2011 23:56:20 +0100
Message-Id: <1323816980-21668-2-git-send-email-ulf@emagii.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <1323816980-21668-1-git-send-email-ulf@emagii.com>
References: <1323816980-21668-1-git-send-email-ulf@emagii.com>
Cc: Ulf Samuelsson <ulf@emagii.com>
Subject: [PATCH] cpufrequtils: Replace non-existant kernel.org git source
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
X-List-Received-Date: Tue, 13 Dec 2011 23:04:08 -0000

From: Ulf Samuelsson <ulf@emagii.com>

git://git.kernel.org/pub/scm/utils/kernel/cpufreq/cpufrequtils.git
no longer exists so build fails, unless it is already present in
downloads directory.

Source has been retrieved from a mirror:
(http://mirror.nexcess.net/kernel.org/scm/utils/kernel/cpufreq/cpufrequtils.git)
and a new git source has been established on github.

kernel.org link kept in a comment to allow the old
link to be easily reestablished once it is available.

Signed-off-by: Ulf Samuelsson <ulf@emagii.com>
---
 .../cpufrequtils/cpufrequtils_008.bb               |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/cpufrequtils/cpufrequtils_008.bb b/meta-oe/recipes-support/cpufrequtils/cpufrequtils_008.bb
index d795e54..ea38e15 100644
--- a/meta-oe/recipes-support/cpufrequtils/cpufrequtils_008.bb
+++ b/meta-oe/recipes-support/cpufrequtils/cpufrequtils_008.bb
@@ -6,11 +6,13 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
 SRCREV = "adb7e044755aa06b12212d05c4acbcccb023d2cd"
-SRC_URI = "git://git.kernel.org/pub/scm/utils/kernel/cpufreq/cpufrequtils.git \
+# SRC_URI = "git://git.kernel.org/pub/scm/utils/kernel/cpufreq/cpufrequtils.git \
+
+SRC_URI = "git://github.com/emagii/cpufrequtils.git \
            file://cpufrequtils-nls.patch \
           "
 
-PR = "r1"
+PR = "r2"
 
 S = "${WORKDIR}/git"
 
-- 
1.7.4.1



