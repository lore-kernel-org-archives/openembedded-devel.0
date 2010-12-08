Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jefflance01@gmail.com>) id 1PQ8Gj-0007iM-Vn
	for openembedded-devel@lists.openembedded.org;
	Wed, 08 Dec 2010 01:52:30 +0100
Received: by yxd5 with SMTP id 5so366625yxd.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 07 Dec 2010 16:51:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=QSseRSRbSX7gGFpeVuxo4jGfZ3OoQJH/oxDd14dYWZQ=;
	b=pIL1SkYeNCTPK11baroXVuon5DrNQ7y675uc91IUPX2tkPQVOfsDUBngBWXiqf+DPy
	wyvSKzmspjZo4Td9xRh1k8HOugOD2Y97ZLdW7KbXX+blqDb0yma4/PPxtxU94eUlHchp
	qLB98oHmLcJcbqJ4jBp8axH0rFLgclxskigts=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=qfiWcWSosSh4X0sd66e8T3al0bHBqtuH03ACqarxh/d8Bg879tib5K+eMgYWGDX6I/
	SoS6NoPFQ9dzUDMajLwbY+GnzNcN/h2ThFJJxiuW680iC87BsU5U/OXrWSmRTW0Kr1K7
	tkYrZOu9Q3KvF0DeMsLKrF/q8cb2M3Is0Wu80=
Received: by 10.90.29.19 with SMTP id c19mr10444277agc.209.1291769460516;
	Tue, 07 Dec 2010 16:51:00 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com [192.94.94.33])
	by mx.google.com with ESMTPS id r38sm563yhi.43.2010.12.07.16.50.59
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 07 Dec 2010 16:51:00 -0800 (PST)
From: Jeff Lance <jefflance01@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  7 Dec 2010 18:26:30 -0600
Message-Id: <1291767990-18403-2-git-send-email-j-lance1@ti.com>
X-Mailer: git-send-email 1.6.3.3
In-Reply-To: <1291767990-18403-1-git-send-email-j-lance1@ti.com>
References: <1291767990-18403-1-git-send-email-j-lance1@ti.com>
X-SA-Exim-Connect-IP: 209.85.213.175
X-SA-Exim-Mail-From: jefflance01@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Jeff Lance <j-lance1@ti.com>, Jeff Lance <j-lance@ti.com>
Subject: [PATCH 2/2] matrix-gui: Adding additional platform support
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
X-List-Received-Date: Wed, 08 Dec 2010 00:52:30 -0000

  * Add platform support for am180x
  * Add platform support for am181x
  * Add platform support for am3517

Signed-off-by: Jeff Lance <j-lance@ti.com>
---
 recipes/ti/matrix-gui-common.inc |    5 ++++-
 recipes/ti/matrix-gui-e.inc      |    5 ++++-
 recipes/ti/matrix-gui.inc        |    5 ++++-
 3 files changed, 12 insertions(+), 3 deletions(-)

diff --git a/recipes/ti/matrix-gui-common.inc b/recipes/ti/matrix-gui-common.inc
index b5a368e..4185b34 100644
--- a/recipes/ti/matrix-gui-common.inc
+++ b/recipes/ti/matrix-gui-common.inc
@@ -4,7 +4,7 @@ LICENSE = "BSD"
 SECTION = "multimedia"
 PRIORITY = "optional"
 
-INC_PR = "r5"
+INC_PR = "r6"
 
 COMPATIBLE_MACHINE = "(dm365|omapl138|omap3|ti816x)"
 
@@ -15,6 +15,9 @@ PLATFORM_dm37x-evm = "dm3730"
 PLATFORM_am37x-evm = "am3715"
 PLATFORM_beagleboard = "am3715"
 PLATFORM_ti816x = "ti816x"
+PLATFORM_am180x-evm = "am180x"
+PLATFORM_am181x-evm = "am181x"
+PLATFORM_am3517-evm = "am3517"
 
 #Checkout the project repository to get access to the scripts and data
 #files.
diff --git a/recipes/ti/matrix-gui-e.inc b/recipes/ti/matrix-gui-e.inc
index 86f08b1..ba8012c 100644
--- a/recipes/ti/matrix-gui-e.inc
+++ b/recipes/ti/matrix-gui-e.inc
@@ -4,7 +4,7 @@ LICENSE = "BSD"
 SECTION = "multimedia"
 PRIORITY = "optional"
 
-INC_PR = "r20"
+INC_PR = "r21"
 
 COMPATIBLE_MACHINE = "(dm365|omapl138|omap3|ti816x)"
 
@@ -15,6 +15,9 @@ PLATFORM_dm37x-evm = "dm3730"
 PLATFORM_am37x-evm = "am3715"
 PLATFORM_beagleboard = "am3715"
 PLATFORM_ti816x = "ti816x"
+PLATFORM_am180x-evm = "am180x"
+PLATFORM_am181x-evm = "am181x"
+PLATFORM_am3517-evm = "am3517"
 
 SRC_URI = "svn://gforge.ti.com/svn/matrix_gui/;module=trunk;proto=https;user=anonymous;pswd='' "
 
diff --git a/recipes/ti/matrix-gui.inc b/recipes/ti/matrix-gui.inc
index a2a2721..82ec6ab 100644
--- a/recipes/ti/matrix-gui.inc
+++ b/recipes/ti/matrix-gui.inc
@@ -4,7 +4,7 @@ LICENSE = "BSD"
 SECTION = "multimedia"
 PRIORITY = "optional"
 
-INC_PR = "r18"
+INC_PR = "r19"
 
 COMPATIBLE_MACHINE = "(dm365|omapl138|omap3|ti816x)"
 
@@ -15,6 +15,9 @@ PLATFORM_dm37x-evm = "dm3730"
 PLATFORM_am37x-evm = "am3715"
 PLATFORM_beagleboard = "am3715"
 PLATFORM_ti816x = "ti816x"
+PLATFORM_am180x-evm = "am180x"
+PLATFORM_am181x-evm = "am181x"
+PLATFORM_am3517-evm = "am3517"
 
 SRC_URI = "svn://gforge.ti.com/svn/matrix_gui/;module=trunk;proto=https;user=anonymous;pswd='' "
 
-- 
1.6.3.3



