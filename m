Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wi0-f182.google.com (mail-wi0-f182.google.com
	[209.85.212.182])
	by mail.openembedded.org (Postfix) with ESMTP id E017D60167
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Feb 2015 07:02:32 +0000 (UTC)
Received: by mail-wi0-f182.google.com with SMTP id l15so9141971wiw.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Feb 2015 23:02:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=4EpOSoF9zrRc++l6Abwx3idBLOFWJe+bm/uibCoRbrg=;
	b=U7+jcDZ0XLXuaa5VIiTuYDNaSN1gTYzhz85blPnvlqJMo2Zpqq/u4T0sv3yatDm8MH
	ju48PUQiEKIWNjsW8c/4jhMKSlACB7YWkVH9SLLWt6O78vhtWb2ZrBJPAP84Ng84zRNb
	PLMKhqfP2l4/ug7dfrjw96kNss89LfQ+mhtX4D50PLINED3tVIPMRRrzWVdZ59YflEAw
	4abFTiAx//vGvflCXL1rSwy1Y//8llZTlwrTkroXoyaxjpY+pwhwr3VmAN0NboWE1enk
	xK8M5N1jEZK2my9sBWVGm/5AD0LqwWXKB8aF4UoqJ5p6SlPCqRcWReNfZi4wr1oZKikx
	ekbw==
X-Received: by 10.181.12.5 with SMTP id em5mr13369522wid.84.1423810953738;
	Thu, 12 Feb 2015 23:02:33 -0800 (PST)
Received: from localhost.localdomain (p5B0A1394.dip0.t-ipconnect.de.
	[91.10.19.148])
	by mx.google.com with ESMTPSA id v16sm1635972wib.5.2015.02.12.23.02.32
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 12 Feb 2015 23:02:32 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 13 Feb 2015 08:01:54 +0100
Message-Id: <1423810919-9857-15-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <1423810919-9857-1-git-send-email-schnitzeltony@googlemail.com>
References: <1423810919-9857-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [V2][PATCH 14/19] xfce4-systemload-plugin: update to 1.1.2
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
X-List-Received-Date: Fri, 13 Feb 2015 07:02:33 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 ...e4-systemload-plugin_1.1.1.bb => xfce4-systemload-plugin_1.1.2.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-panel-plugins/systemload/{xfce4-systemload-plugin_1.1.1.bb => xfce4-systemload-plugin_1.1.2.bb} (70%)

diff --git a/meta-xfce/recipes-panel-plugins/systemload/xfce4-systemload-plugin_1.1.1.bb b/meta-xfce/recipes-panel-plugins/systemload/xfce4-systemload-plugin_1.1.2.bb
similarity index 70%
rename from meta-xfce/recipes-panel-plugins/systemload/xfce4-systemload-plugin_1.1.1.bb
rename to meta-xfce/recipes-panel-plugins/systemload/xfce4-systemload-plugin_1.1.2.bb
index 53f6c4a..c212f88 100644
--- a/meta-xfce/recipes-panel-plugins/systemload/xfce4-systemload-plugin_1.1.1.bb
+++ b/meta-xfce/recipes-panel-plugins/systemload/xfce4-systemload-plugin_1.1.2.bb
@@ -7,5 +7,5 @@ inherit xfce-panel-plugin
 
 DEPENDS += "upower"
 
-SRC_URI[md5sum] = "22d48c0883f9d598bce24e81d93e692e"
-SRC_URI[sha256sum] = "1ac13efbe9e576c9effd5e0675574a57c8fd44cfee60d6e319eb4d03c1c8d9ae"
+SRC_URI[md5sum] = "68c9d20b352c13f3eb6b39a0d9fe2ba2"
+SRC_URI[sha256sum] = "b469b6b3a08ec29b9061151950d876d36bf25a3106ec77256923fdd6b5d18a7c"
-- 
1.9.3


