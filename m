Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id C242260685
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  2 Nov 2017 10:31:49 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id p75so9976485wmg.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 02 Nov 2017 03:31:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=Aj5aeuxmV1c52b0aDkBGm1AJKjXgxd/uOUG0CN5xtac=;
	b=nD4oSctuMspUXII8TtAxqZ6HPp0yfi5+u2tNWW7Af+53ejAGKzHxXKupytaskhmPki
	1M/Xgz9Np3Bprs3s2g2kmWvFHi+czvbUfXnta1hojrwby9lT74+cYnFcrO33CqBFofPM
	Y0SYoyAZ2kKzjMN6V00GHZyS91FGfZDOc2trYWwyrjf1oKSQyrECQPZJG3nUCDONDMpl
	1NnGXgegsZgAcJdQHpbZVSWjex+cOUeuomejF+ZTM8veP+WlrzcB8muZ88P3se0l9fp+
	snFyYWIBzX4xp8nonq8+rqTe2DZsfeIAemK5ObdKAORTdONUjnQSCT/UfGj+HHUKIJ+L
	FGxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=Aj5aeuxmV1c52b0aDkBGm1AJKjXgxd/uOUG0CN5xtac=;
	b=QYTMszbOxxSytd0/8vjVa8liTs7Oc3Umru/YlzZMCVhCElmhH++gKarXBmarGbakbe
	/jAVK9IRXwjkKMTg0pVdtGhbDjJU3FkcxCqQNboHSB9uONmbG6D48CQTk8pdng+mLXfq
	RquPhvJ41zbtQsC3f96SaHJ+7yLDsQfCMQcVnNOgzV53qxoSehOxlpRoYdLW9Wf5UH9V
	57lF20CCZk5VennAi57SHJ9vMeFxJDzyMdHhl4xEjIZi6dG1Uc1A+mJYoXXWgI4D18Ao
	UsVqa2eWEXWkMCZOn3gy0g3WwtgWAmm4wUHtukgCtljNTbABs/VwUjlM9cLDYsI5K2D4
	7D5Q==
X-Gm-Message-State: AJaThX60wqQp0vIS3jxShs0eqAG2zNvpTAgwQ8c0/9Stv7JcAQ22Aog/
	afFkmbV1XI+f87urNY4WYkhfqA==
X-Google-Smtp-Source: ABhQp+SdaG0GRxlhc2ymM2sJBsJWGdSymOGGGkAzxVloe1ecQHLgQvjz8C2aj+nMklm/nDniDQhQ0A==
X-Received: by 10.28.174.140 with SMTP id x134mr1165026wme.103.1509618710173; 
	Thu, 02 Nov 2017 03:31:50 -0700 (PDT)
Received: from mueller-a-nb-linux.zera.local
	(ip-88-152-111-130.hsi03.unitymediagroup.de. [88.152.111.130])
	by smtp.googlemail.com with ESMTPSA id
	g68sm340440wmc.22.2017.11.02.03.31.49
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 02 Nov 2017 03:31:49 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  2 Nov 2017 11:31:21 +0100
Message-Id: <20171102103129.3703-3-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.9.5
In-Reply-To: <20171102103129.3703-1-schnitzeltony@googlemail.com>
References: <20171102103129.3703-1-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 02/10] xfce4-settings: update to 4.12.1
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
X-List-Received-Date: Thu, 02 Nov 2017 10:31:50 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Same as before: Sources from my repo are based on XFCE-git plus:

* invisible mouse pointer configurable for certein input devices
* date/time/region setter

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_git.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_git.bb b/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_git.bb
index 771da2c..b98d8a7 100644
--- a/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_git.bb
+++ b/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_git.bb
@@ -13,12 +13,12 @@ REQUIRED_DISTRO_FEATURES = "x11"
 # + minor bugfixes - sent mainline but no response
 # + option to hide mousepointer for a specific (touch) input device - sent mainline but no response
 SRC_URI = " \
-    git://github.com/schnitzeltony/xfce4-settings.git;protocol=git;branch=for-oe-4.12.0-1 \
+    git://github.com/schnitzeltony/xfce4-settings.git;protocol=git;branch=for-oe-4.12.1 \
     file://0001-xsettings.xml-Set-default-themes.patch \
 "
-SRCREV = "c6683cb2cff489c16c2c7b5eab4017bb461f07f1"
+SRCREV = "0766cf81daa9d41d0d0fed2fb73a8a26709a3bca"
 S = "${WORKDIR}/git"
-PV = "4.12.0+git${SRCPV}"
+PV = "4.12.1+git${SRCPV}"
 
 EXTRA_OECONF += "--enable-maintainer-mode --disable-debug"
 
-- 
2.9.5


