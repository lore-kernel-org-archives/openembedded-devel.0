Return-Path: <armccurdy@gmail.com>
Received: from mail-ie0-f178.google.com (mail-ie0-f178.google.com
	[209.85.223.178])
	by mail.openembedded.org (Postfix) with ESMTP id 703396E5F5
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  7 Jul 2015 19:45:17 +0000 (UTC)
Received: by iecvh10 with SMTP id vh10so141848239iec.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 07 Jul 2015 12:45:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=nxqEuzsDxYILR/4ViNrTKRqkBlBoxD3q9iIEC6hJlxg=;
	b=gsFWk4kA8L095i504MecGqpCnMSgtJ7k+dg/sd4FCfU39B0CU3BmkX6XnCHKYv5U2r
	pIoXGGJPe2GVyOnKg8q1yEGRTeA2G2NP+oRQdPIa0LFcBlodLFaW8qd7L6kIMvplT3LM
	4P49zJa41OMhJLsJVolA+mf0Mt8YKnDc+7Q8fRtyJWihiR7aURrhB5IlEKm7IPzS2DN7
	AP38MO67FGo+Fi7GTtjvBEDdkoEweOD8sFIHm7Q9FDPWJXJ94t6vMnlL2mInNXFnpByA
	QrziFs3GauVODON6UvTBRPpvSmlYLXByKTJB/t0wKrJjGumpiMIuFSTJLKLaYAMcancJ
	ebvQ==
X-Received: by 10.107.38.129 with SMTP id m123mr3189508iom.22.1436298317542;
	Tue, 07 Jul 2015 12:45:17 -0700 (PDT)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id h7sm12506352igt.3.2015.07.07.12.45.16
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 07 Jul 2015 12:45:16 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  7 Jul 2015 12:45:06 -0700
Message-Id: <1436298307-1194-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-browser][PATCH 1/2] chromium.inc: use x86 over-ride instead of i586
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
X-List-Received-Date: Tue, 07 Jul 2015 19:45:23 -0000

Support i686 without needing to duplicate the i586 over-ride.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 recipes-browser/chromium/chromium.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-browser/chromium/chromium.inc b/recipes-browser/chromium/chromium.inc
index 973d1c9..8221779 100644
--- a/recipes-browser/chromium/chromium.inc
+++ b/recipes-browser/chromium/chromium.inc
@@ -2,7 +2,7 @@ LICENSE = "BSD"
 DEPENDS = "xz-native pciutils pulseaudio cairo nss zlib-native libav cups ninja-native gconf libexif pango libdrm"
 
 COMPATIBLE_MACHINE = "(-)"
-COMPATIBLE_MACHINE_i586 = "(.*)"
+COMPATIBLE_MACHINE_x86 = "(.*)"
 COMPATIBLE_MACHINE_x86-64 = "(.*)"
 COMPATIBLE_MACHINE_armv6 = "(.*)"
 COMPATIBLE_MACHINE_armv7a = "(.*)"
-- 
1.9.1


