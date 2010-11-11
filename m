Received: from smtp.cbnco.com ([207.164.182.72])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <michael@sles10-64.jrz.cbn>) id 1PGXMN-0001gz-RE
	for openembedded-devel@lists.openembedded.org;
	Thu, 11 Nov 2010 14:38:40 +0100
Received: from localhost (localhost [127.0.0.1])
	by smtp.cbnco.com (Postfix) with ESMTP id DC1D08EF404
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Nov 2010 08:37:40 -0500 (EST)
Received: from smtp.cbnco.com ([127.0.0.1])
	by localhost (mail.cbnco.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 22265-07 for <openembedded-devel@lists.openembedded.org>; 
	Thu, 11 Nov 2010 08:37:40 -0500 (EST)
Received: by smtp.cbnco.com (Postfix, from userid 1003)
	id 76F4A8F092F; Thu, 11 Nov 2010 08:37:39 -0500 (EST)
Received: from sles10-64.jrz.cbn (auriga-dmzgw.cbnco.com [207.164.182.65])
	by smtp.cbnco.com (Postfix) with ESMTP id 06B56307928
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Nov 2010 08:37:38 -0500 (EST)
Received: by sles10-64.jrz.cbn (Postfix, from userid 1001)
	id C2B771411D91; Thu, 11 Nov 2010 08:37:36 -0500 (EST)
From: Michael Smith <msmith@cbnco.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 11 Nov 2010 08:37:34 -0500
Message-Id: <1289482655-20086-1-git-send-email-msmith@cbnco.com>
X-Mailer: git-send-email 1.7.0.4
X-Virus-Scanned: amavisd-new at cbnco.com
X-SA-Exim-Connect-IP: 207.164.182.72
X-SA-Exim-Mail-From: michael@sles10-64.jrz.cbn
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=AWL, BAYES_00, NO_DNS_FOR_FROM,
	SPF_HELO_PASS autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 1/2] usbutils 0.70 & 0.73: don't set DEFAULT_PREFERENCE = "1"
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
X-List-Received-Date: Thu, 11 Nov 2010 13:38:40 -0000

I think it may be leftover from earlier.  Let 0.86 build by default.
Most distros already prefer it.

Signed-off-by: Michael Smith <msmith@cbnco.com>
---
 recipes/usbutils/usbutils_0.70.bb |    1 -
 recipes/usbutils/usbutils_0.73.bb |    1 -
 2 files changed, 0 insertions(+), 2 deletions(-)

diff --git a/recipes/usbutils/usbutils_0.70.bb b/recipes/usbutils/usbutils_0.70.bb
index 5ce15bd..d5b1933 100644
--- a/recipes/usbutils/usbutils_0.70.bb
+++ b/recipes/usbutils/usbutils_0.70.bb
@@ -3,7 +3,6 @@ SECTION = "base"
 DEPENDS += "virtual/libusb0"
 LICENSE = "GPLv2"
 PRIORITY = "optional"
-DEFAULT_PREFERENCE = "1"
 
 PR = "r1"
 
diff --git a/recipes/usbutils/usbutils_0.73.bb b/recipes/usbutils/usbutils_0.73.bb
index 271e89f..e90263c 100644
--- a/recipes/usbutils/usbutils_0.73.bb
+++ b/recipes/usbutils/usbutils_0.73.bb
@@ -3,7 +3,6 @@ SECTION = "base"
 DEPENDS += "virtual/libusb0"
 LICENSE = "GPLv2"
 PRIORITY = "optional"
-DEFAULT_PREFERENCE = "1"
 
 PR = "r0"
 
-- 
1.7.0.4



