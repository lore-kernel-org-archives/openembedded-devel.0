Return-Path: <kergoth@gmail.com>
Received: from mail-wm0-f42.google.com (mail-wm0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id A431D7725A
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Nov 2015 20:17:39 +0000 (UTC)
Received: by wmww144 with SMTP id w144so2811561wmw.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Nov 2015 12:17:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=ratTflXS+mZUf+dpgBjvISFaFd/+h/tXT/xchr5yXwQ=;
	b=DAYU//ZJDMTOEv80ZJrspBTtDjbbfTSNxWwK/R2N0VwA7h4qIBAWCjPY5GnSWlly11
	oFdP2C7AAteYZLpWENXY7kWlnHLf+MH7syxdxgIOfkM2foofNrI5RLuG4bQBxh9JmaQw
	EsBp/01NCZvgjki/6tFu6Z+uyXCE/ipFkItlVVK9FpH5Ej9j+TFo26bJkOn8NN5MF8p1
	9JbzeEtMYmte/aTN45p9n8OqmLCye24sN5c6oLZMRQPyCrTG0EiJNuk1LtGPD+WADBFt
	zgcF2sPSlmTE0xrdg7Mi8d+9+0BZJYL9VPd0B12GcdlvZY+poEAYZ0QuCXZGfRzgnxke
	hc0w==
X-Received: by 10.28.55.138 with SMTP id e132mr18361615wma.86.1447359459388;
	Thu, 12 Nov 2015 12:17:39 -0800 (PST)
Received: from amyr.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by smtp.gmail.com with ESMTPSA id
	u185sm276863wmu.19.2015.11.12.12.17.37
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 12 Nov 2015 12:17:37 -0800 (PST)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 12 Nov 2015 13:17:24 -0700
Message-Id: <1447359445-27258-4-git-send-email-kergoth@gmail.com>
X-Mailer: git-send-email 2.2.1
In-Reply-To: <1447359445-27258-1-git-send-email-kergoth@gmail.com>
References: <1447359445-27258-1-git-send-email-kergoth@gmail.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [meta-oe][PATCH 4/5] ctdb: rdep on bash
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
X-List-Received-Date: Thu, 12 Nov 2015 20:17:39 -0000

From: Christopher Larson <chris_larson@mentor.com>

onnode is a shell script with bashisms and bash #!.

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta-oe/recipes-support/ctdb/ctdb_2.5.1.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-support/ctdb/ctdb_2.5.1.bb b/meta-oe/recipes-support/ctdb/ctdb_2.5.1.bb
index 3731efd..5718c5f 100644
--- a/meta-oe/recipes-support/ctdb/ctdb_2.5.1.bb
+++ b/meta-oe/recipes-support/ctdb/ctdb_2.5.1.bb
@@ -41,3 +41,6 @@ do_install_append() {
 SYSTEMD_SERVICE_${PN} = "ctdb.service"
 
 FILES_${PN} += "/run"
+
+# onnode is a shell script with bashisms and bash #!
+RDEPENDS_${PN} += "bash"
-- 
2.2.1


