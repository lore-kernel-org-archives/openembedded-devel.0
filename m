Received: from mail-wi0-f172.google.com ([209.85.212.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UJ6En-0007iB-Mt
	for openembedded-devel@lists.openembedded.org;
	Fri, 22 Mar 2013 18:59:26 +0100
Received: by mail-wi0-f172.google.com with SMTP id hr17so965170wib.11
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Mar 2013 10:41:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references:x-gm-message-state;
	bh=6yDRBlgDgHft0CiX4Ou1zVy9+M5EsDZ5MuwRuwfo8eI=;
	b=egFcFm4yH8olDmxsYdoCSaB2Yut5OfDOm1MeIVwXyxrvNpJRtrmmZyg4qGja+K2M3J
	izzmzPY2dWKdj3X/ac7RNV3hIvuE+DPOkTHWJJ3f9NMooctKUWQ3hfQ8u23gTgi2OmDa
	7yKHFCzCi81bh3Jevr39PG7TcsFFdmA5k6FobVlb0KpQE7mcBTVqqEJ3IFM3UQ7RHTtQ
	dRkQX6VYIIs4lrQLZNQhQXEDy9nBylP3wy32j25eWKe8xi/9LSLDE9NojZwAodqt1WOD
	7lhOWsIvSXv2tOcdFqHJZEwPyou/V+xdrHEa/SWDxnQo9kl5yrspxQxx1A2OvYXuIV5Y
	enGA==
X-Received: by 10.180.75.110 with SMTP id b14mr13014457wiw.21.1363974111763;
	Fri, 22 Mar 2013 10:41:51 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id dm9sm12260880wib.3.2013.03.22.10.41.50
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 22 Mar 2013 10:41:51 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 Mar 2013 17:38:36 +0000
Message-Id: <657f4be6bd7fc0d2881f93698102a4788902d357.1363973088.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1363973088.git.ross.burton@intel.com>
References: <cover.1363973088.git.ross.burton@intel.com>
In-Reply-To: <cover.1363973088.git.ross.burton@intel.com>
References: <cover.1363973088.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQnOmIlM1MNvmHSplRee2Qp079XKMkGeE1FfLhM4u1u54Crjo3bcyxPr73TIibrkr8fXym9L
Cc: openembedded-devel@lists.openembedded.org
Subject: [PATCH 16/22] bitbake.conf: explicitly backfill sysvinit, not DISTRO_FEATURES_INITMAN
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
X-List-Received-Date: Fri, 22 Mar 2013 17:59:39 -0000

Reflect reality by backfilling sysvinit support, instead of whatever value was
in DISTRO_FEATURES_INITMAN.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/conf/bitbake.conf |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 01ebad4..cd5d61e 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -730,7 +730,7 @@ MACHINE_ESSENTIAL_EXTRA_RDEPENDS ?= ""
 MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS ?= ""
 IMAGE_FEATURES += "${EXTRA_IMAGE_FEATURES}"
 
-DISTRO_FEATURES_BACKFILL = "pulseaudio ${DISTRO_FEATURES_INITMAN}"
+DISTRO_FEATURES_BACKFILL = "pulseaudio sysvinit"
 MACHINE_FEATURES_BACKFILL = "rtc"
 
 COMBINED_FEATURES = "\
-- 
1.7.10.4



