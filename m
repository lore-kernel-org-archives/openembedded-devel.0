Received: from mail-wi0-f180.google.com ([209.85.212.180])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UJ6Lk-0000EM-7V
	for openembedded-devel@lists.openembedded.org;
	Fri, 22 Mar 2013 19:06:17 +0100
Received: by mail-wi0-f180.google.com with SMTP id c10so44041wiw.13
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Mar 2013 10:49:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references:x-gm-message-state;
	bh=BPhTDuj2b0pLsBkzje6rzeUIIH3OMKrQz5kJKrVtvLY=;
	b=NigYQP5r7q/Ny+ksKnUFtxz1wzUdVRn2TYwj45+N539PnEbv9BHhQCiW8/K8hEepxM
	Rbtp6jqi8rDAaACuwKpX6IDwlXOkHdqIZgv4VBTBdCxBrOYqG6lcC/WP+IIA9OtVfR26
	Cb5yb1b8DakQQ47mRJ6Uk8PKRNvss6ba3ADungQUev5Vj4T2Hd9tjgJKGqaCqFf5/hMv
	2yj1DgEnWSQG4T21t/+BF9vfxfWWKYnYRarLqnEbVqZmxMoc3aWkA0S5w7dlCDa0eLQE
	CNhI+VmmqNYzC5abLEYT9FkGlZ0Ptmu1hfHXB3M5D4qm2som1AatcVwWpmx6KctZhdl9
	etBA==
X-Received: by 10.194.237.129 with SMTP id vc1mr4781211wjc.20.1363974118055;
	Fri, 22 Mar 2013 10:41:58 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id dm9sm12260880wib.3.2013.03.22.10.41.56
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 22 Mar 2013 10:41:57 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 Mar 2013 17:38:41 +0000
Message-Id: <e4580eb21f5a7679b7fb0970ac11c0de0848e0cd.1363973088.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1363973088.git.ross.burton@intel.com>
References: <cover.1363973088.git.ross.burton@intel.com>
In-Reply-To: <cover.1363973088.git.ross.burton@intel.com>
References: <cover.1363973088.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQnwo0xUjNW/P9ip22KQven6BfXaokr/NaZjnYwk1A+A1cVqEVP7gsXG9b/7nFplzrRccFU7
Cc: openembedded-devel@lists.openembedded.org
Subject: [PATCH 21/22] systemd-compat-units: disable dbus-1
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
X-List-Received-Date: Fri, 22 Mar 2013 18:06:20 -0000


Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-core/systemd/systemd-compat-units.bb |    1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/systemd/systemd-compat-units.bb b/meta/recipes-core/systemd/systemd-compat-units.bb
index 19a1ea1..9b4a8a4 100644
--- a/meta/recipes-core/systemd/systemd-compat-units.bb
+++ b/meta/recipes-core/systemd/systemd-compat-units.bb
@@ -34,6 +34,7 @@ SYSTEMD_DISABLED_SYSV_SERVICES = " \
   hwclock \
   networking \
   syslog.busybox \
+  dbus-1 \
 "
 
 pkg_postinst_${PN} () {
-- 
1.7.10.4



