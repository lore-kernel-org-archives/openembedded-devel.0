Received: from smtp.cbnco.com ([207.164.182.72])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <michael@sles10-64.jrz.cbn>) id 1PGKMa-0000FQ-F9
	for openembedded-devel@lists.openembedded.org;
	Thu, 11 Nov 2010 00:46:01 +0100
Received: from localhost (localhost [127.0.0.1])
	by smtp.cbnco.com (Postfix) with ESMTP id 69E578EF16A
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Nov 2010 15:06:34 -0500 (EST)
Received: from smtp.cbnco.com ([127.0.0.1])
	by localhost (mail.cbnco.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 22709-09 for <openembedded-devel@lists.openembedded.org>; 
	Wed, 10 Nov 2010 15:06:34 -0500 (EST)
Received: by smtp.cbnco.com (Postfix, from userid 1003)
	id 448D88EFA92; Wed, 10 Nov 2010 15:06:34 -0500 (EST)
Received: from sles10-64.jrz.cbn (auriga-dmzgw.cbnco.com [207.164.182.65])
	by smtp.cbnco.com (Postfix) with ESMTP id 3807B8EA166
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Nov 2010 15:06:33 -0500 (EST)
Received: by sles10-64.jrz.cbn (Postfix, from userid 1001)
	id 2EEF214119DA; Wed, 10 Nov 2010 15:06:33 -0500 (EST)
From: Michael Smith <msmith@cbnco.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 10 Nov 2010 15:06:32 -0500
Message-Id: <1289419592-23604-2-git-send-email-msmith@cbnco.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1289419592-23604-1-git-send-email-msmith@cbnco.com>
References: <1289419592-23604-1-git-send-email-msmith@cbnco.com>
X-Virus-Scanned: amavisd-new at cbnco.com
X-SA-Exim-Connect-IP: 207.164.182.72
X-SA-Exim-Mail-From: michael@sles10-64.jrz.cbn
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=AWL, BAYES_00, NO_DNS_FOR_FROM,
	SPF_HELO_PASS autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 2/2] preferred-xorg-versions: use git release of xf86-input-mutouch
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
X-List-Received-Date: Wed, 10 Nov 2010 23:46:01 -0000

The latest source release, 1.2.1, fails to build with X11R7.5.

Signed-off-by: Michael Smith <msmith@cbnco.com>
---
 .../preferred-xorg-versions-X11R7.5-latest.inc     |    2 +-
 .../include/preferred-xorg-versions-live.inc       |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/conf/distro/include/preferred-xorg-versions-X11R7.5-latest.inc b/conf/distro/include/preferred-xorg-versions-X11R7.5-latest.inc
index 634265e..39cd4e6 100644
--- a/conf/distro/include/preferred-xorg-versions-X11R7.5-latest.inc
+++ b/conf/distro/include/preferred-xorg-versions-X11R7.5-latest.inc
@@ -78,7 +78,7 @@ PREFERRED_VERSION_xf86-input-jamstudio ?= "1.2.0"
 PREFERRED_VERSION_xf86-input-magellan ?= "1.2.0"
 PREFERRED_VERSION_xf86-input-magictouch ?= "1.0.0.5"
 PREFERRED_VERSION_xf86-input-microtouch ?= "1.2.0"
-PREFERRED_VERSION_xf86-input-mutouch ?= "1.2.1"
+PREFERRED_VERSION_xf86-input-mutouch ?= "1.2.1+gitr%"
 PREFERRED_VERSION_xf86-input-palmax ?= "1.2.0"
 PREFERRED_VERSION_xf86-input-penmount ?= "1.4.0"
 PREFERRED_VERSION_xf86-input-spaceorb ?= "1.1.1"
diff --git a/conf/distro/include/preferred-xorg-versions-live.inc b/conf/distro/include/preferred-xorg-versions-live.inc
index c38580e..d4ad824 100644
--- a/conf/distro/include/preferred-xorg-versions-live.inc
+++ b/conf/distro/include/preferred-xorg-versions-live.inc
@@ -130,7 +130,7 @@ PREFERRED_VERSION_xf86-input-magellan ?= "1.2.0"
 PREFERRED_VERSION_xf86-input-magictouch ?= "1.0.0.5"
 PREFERRED_VERSION_xf86-input-microtouch ?= "1.2.0"
 PREFERRED_VERSION_xf86-input-mouse ?= "1.6.0"
-PREFERRED_VERSION_xf86-input-mutouch ?= "1.2.1"
+PREFERRED_VERSION_xf86-input-mutouch ?= "1.2.1+gitr%"
 PREFERRED_VERSION_xf86-input-palmax ?= "1.2.0"
 PREFERRED_VERSION_xf86-input-penmount ?= "1.4.1"
 PREFERRED_VERSION_xf86-input-spaceorb ?= "1.1.1"
-- 
1.7.0.4



