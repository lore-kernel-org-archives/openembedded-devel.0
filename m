Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 4BCA97F3EC
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  6 Aug 2019 22:05:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 4637wf5WT4zFs
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  7 Aug 2019 00:05:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1565129106;
	bh=ub7KQPy5EeoXtz0reHsREbHTer12TGh0Bl8YKHXdK7c=;
	h=From:To:Subject:Date:From;
	b=HGFCPIIHZ4ppsAwvAunmaupMbL2gKrO6ME3hsnlybxfZbBf2R/qEKTq84Wbuqoeiq
	bfCKGahNmpcE28n2fWVYwoTI1zjhdLeQ+HZ88gXCCAiUeGvl/ECM5e5bVKSN9Z7KBT
	C+tSLwOh8XbtYUPlc1mkpdPzHyACZJYD097TQlWIWdjDS29h0Yp7qCs4HJVSz/8e7K
	PPJE+rgw21+y3pyDjSMNCf4g23gIJyys4KBXaZRaDSJiTJsuELZ6lT5IZTlxkh8T8D
	6s+PDQ6ZfWspq1+awxZ8Lk1MmdFrs5V0R86bnuT3AuA+wJXc7q0Gl/ngXQvAAR5JNI
	nkCBrmT2bo/2MjSPmME5kCqNV+xfIcNkJu2bAfQE3A6s9/4rma7ZjEnzlWILzxUxAC
	CyTXthPAbZPxPEZyKhD5tqI6c1J+Uu0IaBAEcAUdsyCINKd+sjbtWRLrtNacaHTflM
	Iq9vSm5CNK6zBrKDK+oADqqeNnrT1ipOD5fl0B+wD9dFKkjbiCxxKZsKlIOaJcm5xH
	qhKI84XE7cMN0WnUpZuiubOfhsV910vnPx862eADDmX5DA/Qi8Ycu+JJjG7kEeu/P+
	IQxrKkgOGBct6nVzkGNPL/1vS3VXkUhiQytci1QtlOC43yMjJFP7FnMAbP79B4byGX
	9HeZlfkLA6vuWdq+JPqYA1BE=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  7 Aug 2019 01:05:05 +0300
Message-Id: <20190806220505.21835-2-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [meta-gnome][PATCH] network-manager-applet: Remove the obsolete DEPENDS on gconf
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 06 Aug 2019 22:05:06 -0000

network-manager-applet stopped using gconf 5 years ago.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 .../network-manager-applet/network-manager-applet_1.8.22.bb     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.8.22.bb b/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.8.22.bb
index e7033aec6..37f512a73 100644
--- a/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.8.22.bb
+++ b/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.8.22.bb
@@ -3,7 +3,7 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
 
 DEPENDS = "gtk+3 libnotify libsecret networkmanager \
-           gconf libgnome-keyring iso-codes nss \
+           libgnome-keyring iso-codes nss \
            intltool-native \
 "
 
-- 
2.17.1


