Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f172.google.com (mail-wi0-f172.google.com
	[209.85.212.172])
	by mail.openembedded.org (Postfix) with ESMTP id F3FA572A78
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Sep 2015 14:07:13 +0000 (UTC)
Received: by wiclk2 with SMTP id lk2so30609324wic.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Sep 2015 07:07:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=atnrhRdFxZoX7jve0wZAT0MWBC5IGJnrFYPgHVZ072g=;
	b=CVQMJylJdatfPwyZMF+uPBRV8NmNZ2W1rOTP7amQySk8VcFlNbtnR4YwRnEWT17pRu
	fBkuBrAb/1NfDljv711Zbupd45ojU5xz560tmBBVQ2IaZ6JQmkEDVC2SteklIeNBVcZe
	BNTaXvHniqMwf1qxZrRGk4j701p5qMGYh9B73d8jG6huT4EkfaIH0fSx0qlqE6TKhur2
	kFX+lBCXQc3Pg2dciOqumul0nmnxsm3ecqiDG/zxNQ4HpH7LVwyjZ9LdzdZ76/onyHcj
	GzEGDwpyPhNUdcGi2shnUaB5WEQgR0fNPtsM0TaOGFelr2755WX3cWQQGtCLIWC8vq0z
	4LLg==
X-Received: by 10.180.96.164 with SMTP id dt4mr7975970wib.53.1442326033215;
	Tue, 15 Sep 2015 07:07:13 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	mx19sm20131739wic.0.2015.09.15.07.07.12
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 15 Sep 2015 07:07:12 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 15 Sep 2015 16:07:13 +0200
Message-Id: <1442326033-20744-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.5.1
Subject: [PATCH][fido] dhcp: fix parsing warning
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
X-List-Received-Date: Tue, 15 Sep 2015 14:07:14 -0000

From: Martin Jansa <martin.jansa@gmail.com>

* fixes:
  WARNING: Variable key FILES_${PN}-client (${base_sbindir}/dhclient ${base_sbindir}/dhclient-script ${sysconfdir}/dhcp/dhclient.conf)
    replaces original key FILES_dhcp-client ( ${systemd_unitdir}/system/dhclient.service).

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-systemd/oe-core/recipes-connectivity/dhcp/dhcp_%.bbappend | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-systemd/oe-core/recipes-connectivity/dhcp/dhcp_%.bbappend b/meta-systemd/oe-core/recipes-connectivity/dhcp/dhcp_%.bbappend
index 6c0fd02..94d7bd6 100644
--- a/meta-systemd/oe-core/recipes-connectivity/dhcp/dhcp_%.bbappend
+++ b/meta-systemd/oe-core/recipes-connectivity/dhcp/dhcp_%.bbappend
@@ -5,16 +5,16 @@ SYSTEMD_PACKAGES += "dhcp-client"
 SYSTEMD_SERVICE_dhcp-client = "dhclient.service"
 SYSTEMD_AUTO_ENABLE_dhcp-client = "disable"
 
-FILES_dhcp-client += "${systemd_unitdir}/system/dhclient.service"
+FILES_${PN}-client += "${systemd_unitdir}/system/dhclient.service"
 RPROVIDES_dhcp-server += "dhcp-server-systemd"
 RREPLACES_dhcp-server += "dhcp-server-systemd"
 RCONFLICTS_dhcp-server += "dhcp-server-systemd"
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
2.5.1


