Return-Path: <kergoth@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 52F3B6FF3D
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 16 Apr 2016 02:40:49 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id d184so11515066pfc.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Apr 2016 19:40:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=bxYi4wE9iP++a0SpFgb4iWqkvqGNxgdXW7RZVK4Zb1A=;
	b=WAK2n1u1bYZl+ps/t+ApVp2DLmWYPIto+j9rUvBJJUrhlvXeGo278uL434xtjwnjaM
	idBv0gKlp5MLed+OhwZZueJgPTbOrifdPML1KBH010LyzM8jTGHiLDYa1T9EycV0Gq3+
	V6iEAicbDUKPd+sGm0/EvAcF/M9q+PE6KuS5FnCHgKlx4++gbpXXa6xC33dJBAtIgRoY
	D4qUSse5Y83I0K28TUN1oSBIDIomaibnS+tp5lcu2JF83J4GAL4dxDTI0sVZJGyaoL0O
	SmnD1LgbG+a8YOf7M9syt5XEYot+EW4dfCBMLXLY9etzp4/YULIEiaab+urk76Rho0Rm
	s5HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=bxYi4wE9iP++a0SpFgb4iWqkvqGNxgdXW7RZVK4Zb1A=;
	b=PixHh/Rwd9wCIXIxsnBYfJ6bvD6QDSFWShC+zoFTqtpZAMglChA5iwF67WmdPViAt1
	VzvOMewR5jifGE+3KNnoqsmDW8znZXdHwyct39vQ8OdcdTEgCL586XxknWkQ9pM9jN4B
	LGgN4hfbOCgplJjqBPtUQC9tVKwxM9f7Nxzmup9vzABodI2W8TtI8ayGu5r1+xJVhtKF
	mfKCakemGDBErgly6oGeDFngpESouC4SrmER/R61DX1g2U7UTNsye52k82rJ5FFcy4wt
	NDkmx6mJWpHKQo4AzRgm+Dufhoy34BWpFOuGtl16Vn+G0Apv6sKWu/PEnCjZ0055YyYH
	3+RA==
X-Gm-Message-State: AOPr4FVuY1EcS+SNNZseYxWUuoU2x7WKRkzlizpFAgVWYdtUptsSXsrRfjro1ViJyWGZ8g==
X-Received: by 10.98.16.210 with SMTP id 79mr33860210pfq.69.1460774450060;
	Fri, 15 Apr 2016 19:40:50 -0700 (PDT)
Received: from amyr.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by smtp.gmail.com with ESMTPSA id
	h2sm67546842pfd.91.2016.04.15.19.40.48
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 15 Apr 2016 19:40:48 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 15 Apr 2016 19:40:41 -0700
Message-Id: <1460774441-27282-3-git-send-email-kergoth@gmail.com>
X-Mailer: git-send-email 2.8.0
In-Reply-To: <1460774441-27282-1-git-send-email-kergoth@gmail.com>
References: <1460774441-27282-1-git-send-email-kergoth@gmail.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [meta-networking][PATCH 3/3] ctdb: disable the service by default
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
X-List-Received-Date: Sat, 16 Apr 2016 02:40:49 -0000

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


