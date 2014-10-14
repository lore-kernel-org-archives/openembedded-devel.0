Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wi0-f169.google.com (mail-wi0-f169.google.com
	[209.85.212.169])
	by mail.openembedded.org (Postfix) with ESMTP id BCFCC716D9
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Oct 2014 22:14:37 +0000 (UTC)
Received: by mail-wi0-f169.google.com with SMTP id h11so7231763wiw.4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Oct 2014 15:14:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=wy53IPuXxnY3JXIKN1AOoNFRX7FGiXF0d36MOvdbQJY=;
	b=hbOk8Zspvxmhh1RWBefT95UHr9tq0TWqB6t/MO2G7bFJ22LGBSGskPtYHnX9eWC6Ji
	/8XAYnGWFeQ0Nu3LdEoYRIwZ5nMvy+ZuDQ2pB7yYlMpHEzAwMYSbponYFrdkHpmUNUR8
	tkjV6CrRQI3bvKZxRUUrdR2uKTGlRn/LNUS36GrVy7ibFe5R7znMcOQeZtFOfByV/ZA/
	a7crn17K45e3hbQRBtRUUwxE4njchxfBoI0jhctL68pX0OiVbeHOudOmNCgK9ycKMfM/
	YaHFAF0LgphCzYHIgqIAIl+vjzC8pgFo10YpD8m1pkIlyxO1nKZ7wt2IksbRXaf5Po1a
	TQCA==
X-Received: by 10.194.108.104 with SMTP id hj8mr8214087wjb.28.1413324878226;
	Tue, 14 Oct 2014 15:14:38 -0700 (PDT)
Received: from localhost.localdomain
	(ip-176-198-252-150.hsi05.unitymediagroup.de. [176.198.252.150])
	by mx.google.com with ESMTPSA id
	eg8sm17132892wib.15.2014.10.14.15.14.37
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 14 Oct 2014 15:14:37 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 15 Oct 2014 00:14:15 +0200
Message-Id: <1413324868-11856-3-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1413324868-11856-1-git-send-email-schnitzeltony@googlemail.com>
References: <1413324868-11856-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 02/15] xfce4-equake-plugin: update to 1.3.5
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
X-List-Received-Date: Tue, 14 Oct 2014 22:14:42 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../{xfce4-equake-plugin_1.3.3.bb => xfce4-equake-plugin_1.3.5.bb}   | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta-xfce/recipes-panel-plugins/equake/{xfce4-equake-plugin_1.3.3.bb => xfce4-equake-plugin_1.3.5.bb} (64%)

diff --git a/meta-xfce/recipes-panel-plugins/equake/xfce4-equake-plugin_1.3.3.bb b/meta-xfce/recipes-panel-plugins/equake/xfce4-equake-plugin_1.3.5.bb
similarity index 64%
rename from meta-xfce/recipes-panel-plugins/equake/xfce4-equake-plugin_1.3.3.bb
rename to meta-xfce/recipes-panel-plugins/equake/xfce4-equake-plugin_1.3.5.bb
index 95d1d66..76cd5d4 100644
--- a/meta-xfce/recipes-panel-plugins/equake/xfce4-equake-plugin_1.3.3.bb
+++ b/meta-xfce/recipes-panel-plugins/equake/xfce4-equake-plugin_1.3.5.bb
@@ -6,8 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
 inherit xfce-panel-plugin
 
-SRC_URI = "http://www.e-quake.org/wp-uploads/2013/09/xfce4-equake-plugin-${PV}.tar.gz"
-SRC_URI[md5sum] = "fa1e934f5b7e522efc4e30a99278f908"
-SRC_URI[sha256sum] = "ea37e691606dbcd705f98cecccabd69b870c7acd008f47faae6d0fee21fe14a2"
+SRC_URI[md5sum] = "7c520e2f1cd0cc5e33d8346b12e31c02"
+SRC_URI[sha256sum] = "43bbc781575c357c13ac6720eb8e8485115099411d5382668e106de58ab0e416"
 
 FILES_${PN} += "${libdir}/xfce4/panel-plugins/xfce4-equake-plugin"
-- 
1.8.3.1


