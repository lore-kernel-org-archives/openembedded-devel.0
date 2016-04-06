Return-Path: <kergoth@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id 6638B75C51
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Apr 2016 21:46:59 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id r187so5392679pfr.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 06 Apr 2016 14:47:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=bxYi4wE9iP++a0SpFgb4iWqkvqGNxgdXW7RZVK4Zb1A=;
	b=XSzt8qABm7cPlPd8j9gDi5Js0PuvGLcdc39jLzPflQt5CxkJcdr7iUOrYHPRuvX1CW
	BzB7L3CRk4mKCohCpE7F5cpTSkaUj8gCT1Tm01H79kwrXPOSLgKM060jYvIS8qWzLbeS
	J6Tv1Njzbgj349jF0ymUjRC4BcBRGzHWDwne3CNIJbbjUw2a6FwbG805Y1t98fM8cObP
	Aq4uGzLbn40g0n0KaabvYiuhtzyXFiNk/qA1KiVcjbsObAOvFoaZFQJAvDAv0RUzi0tT
	bpibcH+YnHNe4hba7EZT3ZzxWdQviMU9arp+8Kx88GbpY6mbc3GGCDWd34Vz+nb72WQj
	XKeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=bxYi4wE9iP++a0SpFgb4iWqkvqGNxgdXW7RZVK4Zb1A=;
	b=DMWyzh9Nkn/VOq3Yrd9o5BdbOg+SM2GbAD85lwzQkBqUwfTg3dZpiMOQNCizIDytUN
	7mYfuUmPnlOdLBdJ7sICijsdjuGG6Afld9On3xkxcht4RBiEqIkrY/a9u1m9ThVWAaIK
	DXVuL/pvcSIDVLOfKTWFy+la/f51FX2gfdpvI+0dGc8+LpTCEJrfnL3bPIdaWrHGQGU/
	Y2rjEewgnI5ZHui8uQWF8sXB36bHNqEPcXdSbmEdfSPyQlZ3NaoZgYSjnkb0CLeJsVzU
	OhxIVUUE89up2B41bnvRruySySvih5OqIeuIUy1xuJHRSiNU5RPZUI5BQnrxip5Agnsd
	2kHQ==
X-Gm-Message-State: AD7BkJIZcniW/rcDKmIDkOTPyVOMjn3Dxf9+7IQ418sXfCeyBnYCXk3Z+TGvRpO5ifJU4Q==
X-Received: by 10.98.17.78 with SMTP id z75mr42274381pfi.40.1459979220454;
	Wed, 06 Apr 2016 14:47:00 -0700 (PDT)
Received: from amyr.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by smtp.gmail.com with ESMTPSA id
	l81sm7091069pfj.21.2016.04.06.14.46.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 06 Apr 2016 14:46:59 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  6 Apr 2016 14:46:52 -0700
Message-Id: <1459979212-16117-3-git-send-email-kergoth@gmail.com>
X-Mailer: git-send-email 2.8.0
In-Reply-To: <1459979212-16117-1-git-send-email-kergoth@gmail.com>
References: <1459979212-16117-1-git-send-email-kergoth@gmail.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [meta-oe][PATCH 3/3] ctdb: disable the service by default
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
X-List-Received-Date: Wed, 06 Apr 2016 21:46:59 -0000

From: Christopher Larson <chris_larson@mentor.com>

The systemd service is disabled by default, as the service will fail to start
without /etc/ctdb/nodes. If the user supplies this, they can re-enable the
service.

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta-networking/recipes-support/ctdb/ctdb_2.5.1.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-networking/recipes-support/ctdb/ctdb_2.5.1.bb b/meta-networking/recipes-support/ctdb/ctdb_2.5.1.bb
index 232546c..5d75784 100644
--- a/meta-networking/recipes-support/ctdb/ctdb_2.5.1.bb
+++ b/meta-networking/recipes-support/ctdb/ctdb_2.5.1.bb
@@ -44,6 +44,10 @@ do_install_append() {
     rm -r ${D}/${localstatedir}/run
 }
 
+# The systemd service is disabled by default, as the service will fail to
+# start without /etc/ctdb/nodes. If the user supplies this, they can re-enable
+# the service.
+SYSTEMD_AUTO_ENABLE = "disable"
 SYSTEMD_SERVICE_${PN} = "ctdb.service"
 
 # onnode is a shell script with bashisms and bash #!
-- 
2.8.0


