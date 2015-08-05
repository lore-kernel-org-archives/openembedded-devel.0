Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f178.google.com (mail-wi0-f178.google.com
	[209.85.212.178])
	by mail.openembedded.org (Postfix) with ESMTP id A906360017
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  5 Aug 2015 17:17:44 +0000 (UTC)
Received: by wibxm9 with SMTP id xm9so76573001wib.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 05 Aug 2015 10:17:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=C9rQrP/1v3o9InJVufN7Jyc5MVWZI/qs8ckfYY27oaw=;
	b=fei5ZTG943dmdb5zyg3l+jmFulfrfttVRHW9yspnjfpDDtvZnRh/vj67aF/R0IcZuO
	inXPrU74Flg04hHZxIFvctBDSdPyYEZ3yLhAIaKBkewPvlFWcUy0DArxclMhxmq8t3j0
	GLz682Ec+WIU4jI1+DVd4ooIPVsjWQ13PFaf+2VkUyeV0aWxZEjpoE0QPRofhF1Ic65J
	XZ5FNDUT/bmgEgzfZvG/XaPsmgJHZme6af6ncJVlRSjRFQYoMiX2q/r6f5GOAzj3n4tM
	2+E9FyQx4S/K4qrkvnVLiYHrPQqxqkvQsoPPR6sW9gpURmDyPz1MTH+jisqvI3/trmnZ
	3eoA==
X-Received: by 10.180.80.138 with SMTP id r10mr643171wix.18.1438795065002;
	Wed, 05 Aug 2015 10:17:45 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	lm5sm8541027wic.22.2015.08.05.10.17.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 05 Aug 2015 10:17:44 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  5 Aug 2015 19:18:00 +0200
Message-Id: <1438795080-2646-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <5725889.eDmdfnME8h@peggleto-mobl.ger.corp.intel.com>
References: <5725889.eDmdfnME8h@peggleto-mobl.ger.corp.intel.com>
Subject: [meta-systemd][PATCHv2] dhcp: fix parsing warning
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
X-List-Received-Date: Wed, 05 Aug 2015 17:17:48 -0000

* fixes:
  WARNING: Variable key FILES_${PN}-client (${base_sbindir}/dhclient ${base_sbindir}/dhclient-script ${sysconfdir}/dhcp/dhclient.conf)
    replaces original key FILES_dhcp-client ( ${systemd_unitdir}/system/dhclient.service).

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-systemd/oe-core/recipes-connectivity/dhcp/dhcp_%.bbappend | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-systemd/oe-core/recipes-connectivity/dhcp/dhcp_%.bbappend b/meta-systemd/oe-core/recipes-connectivity/dhcp/dhcp_%.bbappend
index 6c0fd02..7873e9f 100644
--- a/meta-systemd/oe-core/recipes-connectivity/dhcp/dhcp_%.bbappend
+++ b/meta-systemd/oe-core/recipes-connectivity/dhcp/dhcp_%.bbappend
@@ -12,9 +12,9 @@ RCONFLICTS_dhcp-server += "dhcp-server-systemd"
 RPROVIDES_dhcp-relay += "dhcp-relay-systemd"
 RREPLACES_dhcp-relay += "dhcp-relay-systemd"
 RCONFLICTS_dhcp-relay += "dhcp-relay-systemd"
-RPROVIDES_dhcp-client += "dhcp-client-systemd"
-RREPLACES_dhcp-client += "dhcp-client-systemd"
-RCONFLICTS_dhcp-client += "dhcp-client-systemd"
+RPROVIDES_${PN}-client += "dhcp-client-systemd"
+RREPLACES_${PN}-client += "dhcp-client-systemd"
+RCONFLICTS_${PN}-client += "dhcp-client-systemd"
 
 SRC_URI += "file://dhclient.service"
 
-- 
2.5.0


