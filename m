Received: from mail-ee0-f45.google.com ([74.125.83.45])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1ULF5E-0002fH-FI
	for openembedded-devel@lists.openembedded.org;
	Thu, 28 Mar 2013 16:49:45 +0100
Received: by mail-ee0-f45.google.com with SMTP id b57so4843051eek.18
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Mar 2013 08:32:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer
	:x-gm-message-state;
	bh=m9DV8KQuw98ZwI8v87EBW3qETnW+jXXxk4t/iIt0mV8=;
	b=cGutQrxbVi23VNEqOcuxhh2q6Dc720wxOFDBDbbzHtANN/Fx8sXlDJKMC99a9Dbh8G
	v1lprJstjtaiEoAR8n9a4/D2acvVdXw6lmvpucEoHCw45nRqeKFBEealLEpxcirqiHOC
	YNAiM7amt5sglbWwd/9ofw5MZSfEIsgJ3GSrP78tkbrd7804tOAlE7rfyfm0smaQdArR
	+PgfEMZI65TAmFblTpxtiwx/311aEU4il4pqFAV/+dLhGpXHwsXsa7zKv/xQekuO2n9D
	7RtaBGzwY3TsraWP5iYs3eUjCI4MJXIPVAX5oQ0Cc144O36/wbJJzGTo/etiys91q47r
	o2BA==
X-Received: by 10.14.215.193 with SMTP id e41mr68190583eep.32.1364484761482;
	Thu, 28 Mar 2013 08:32:41 -0700 (PDT)
Received: from localhost.localdomain (ip4da2a5ae.direct-adsl.nl.
	[77.162.165.174])
	by mx.google.com with ESMTPS id 3sm38430427eej.6.2013.03.28.08.32.39
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 28 Mar 2013 08:32:40 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 28 Mar 2013 16:32:33 +0100
Message-Id: <1364484753-22122-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.8.1.4
X-Gm-Message-State: ALoCoQlQg4UObN3vcMFJQz1sdBcaQL7+bQ3S9+urldEezLG9U6tZcV4KfY4wb2JRetD1MAUwL8i5
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-networking][PATCH] 6lowpan-tools: add git version
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
X-List-Received-Date: Thu, 28 Mar 2013 15:49:46 -0000

The 0.3 release was 6 months ago and git HEAD contains fixes to make it work with contiki, so build from git instead of backporting all the patches.

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 .../recipes-support/6lowpan/6lowpan-tools_git.bb     | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 meta-networking/recipes-support/6lowpan/6lowpan-tools_git.bb

diff --git a/meta-networking/recipes-support/6lowpan/6lowpan-tools_git.bb b/meta-networking/recipes-support/6lowpan/6lowpan-tools_git.bb
new file mode 100644
index 0000000..1dcb124
--- /dev/null
+++ b/meta-networking/recipes-support/6lowpan/6lowpan-tools_git.bb
@@ -0,0 +1,20 @@
+DESCRIPTION = "This is a set of utils to manage the Linux LoWPAN stack. \
+The LoWPAN stack aims for IEEE 802.15.4-2003 (and for lesser extent IEEE 802.15.4-2006) compatibility."
+
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
+
+DEPENDS = "libnl python"
+
+PV = "0.3+git"
+SRC_URI = "git://linux-zigbee.git.sourceforge.net/gitroot/linux-zigbee/linux-zigbee"
+SRCREV = "a1d9615adde6d1a568813c24a128273ed755af04"
+
+S = "${WORKDIR}/git"
+
+inherit autotools
+
+FILES_${PN}-dbg += "${libexecdir}/lowpan-tools/.debug/"
+
+PACKAGES =+ "${PN}-python"
+FILES_${PN}-python = "${libdir}/python*"
-- 
1.8.1.4



