Received: from mail-ea0-f174.google.com ([209.85.215.174])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1Ucdpy-0006n4-HR
	for openembedded-devel@lists.openembedded.org;
	Wed, 15 May 2013 17:42:10 +0200
Received: by mail-ea0-f174.google.com with SMTP id z7so1109614eaf.5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 May 2013 08:23:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:mime-version:content-type:content-transfer-encoding;
	bh=VyWXmeLAI/71L1MGFi1Li8U8/B/Ix0m+r0gJp1s4Gw4=;
	b=gy2kmIkTR7db66q95BU7yxewDkRo1sM2T06dupYG6Y7iKsmJzKHKAtjAwzsjHLFltg
	HF16e79XfumAZ2cJFhCVjEcMeyS+EfIH6RzUrVV0675o+c/T0vkx34mH3AdcyOamKHLZ
	4v1kjCef43V0gIJ1V5vfTexZ675LCqp1Wk67JEoahH9D9ruRJFFW0XoWaQ+WtmmDmIC5
	6zl5o1BXJ5rPJp3AK9tAsBMkn/eR2CxVBioL7OABFVKhi//y4ARdzJrMxiMpzP52GhgC
	ONIAzqArPNAP1+RBrLlo0WzfRRltNfr74M3DWBHehnOcPjptoYeHbqS2x33UPZHChrAh
	Ga7g==
X-Received: by 10.15.44.10 with SMTP id y10mr104028952eev.5.1368631421956;
	Wed, 15 May 2013 08:23:41 -0700 (PDT)
Received: from localhost.localdomain (ip-95-222-160-204.unitymediagroup.de.
	[95.222.160.204])
	by mx.google.com with ESMTPSA id t9sm4599519eeo.11.2013.05.15.08.23.41
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Wed, 15 May 2013 08:23:41 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 15 May 2013 17:20:57 +0200
Message-Id: <1368631259-13401-13-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <1368631259-13401-1-git-send-email-schnitzeltony@googlemail.com>
References: <1368631259-13401-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-xfce 12/14] libxfce4util: update to 4.10.0
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
X-List-Received-Date: Wed, 15 May 2013 15:42:39 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 ...bxfce4util_4.10.0.bb => libxfce4util_4.10.1.bb} |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-xfce/libxfce4util/{libxfce4util_4.10.0.bb => libxfce4util_4.10.1.bb} (62%)

diff --git a/meta-xfce/recipes-xfce/libxfce4util/libxfce4util_4.10.0.bb b/meta-xfce/recipes-xfce/libxfce4util/libxfce4util_4.10.1.bb
similarity index 62%
rename from meta-xfce/recipes-xfce/libxfce4util/libxfce4util_4.10.0.bb
rename to meta-xfce/recipes-xfce/libxfce4util/libxfce4util_4.10.1.bb
index 546ee32..150d20a 100644
--- a/meta-xfce/recipes-xfce/libxfce4util/libxfce4util_4.10.0.bb
+++ b/meta-xfce/recipes-xfce/libxfce4util/libxfce4util_4.10.1.bb
@@ -6,5 +6,5 @@ DEPENDS = "intltool-native xfce4-dev-tools-native glib-2.0"
 
 inherit xfce
 
-SRC_URI[md5sum] = "2e8defcd40cbf6afedde531b27314511"
-SRC_URI[sha256sum] = "0979fee12880bb5f011ab38d6c7cc9afe5fd68eb96ccda895cb56dbc16e7608e"
+SRC_URI[md5sum] = "11eec87e8eda2bc62512c2416cb807a1"
+SRC_URI[sha256sum] = "e82cd1ad715c02a385b3cf6646cb89aa3c4724446dac1d7e424971df12f6cfbb"
-- 
1.7.6.5



