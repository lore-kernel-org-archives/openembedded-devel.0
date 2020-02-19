Return-Path: <danc@opengear.com>
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
	(mail-eopbgr760075.outbound.protection.outlook.com [40.107.76.75])
	by mail.openembedded.org (Postfix) with ESMTP id 27CA5615CC
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Feb 2020 12:08:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=d3lTmyqRxn3a35iDru9rzS8qr89DnDj3HG3n0kXILzDQzOs/GRKAWHdLaFZEywtdsEZom5ck87veqmZeD5HvwmoThaMSIlWFJI7NsNMDFYUVp9gpYoPHWqGxZeQF6vIvD5vXGwBmweRLhHleQ5LmGobmaX8EQC8AR+PLnJIFTOATVDRlRuWnKYvFcQMs4rDaiAyfTAYQaggY0L+lY/ajgEg0dEHqot8xVSezr/tO3aCH6RwGGU4A7bUekVvtWpghahsJmTl8peBWAMpOheG2CHPjuMeKkYI2VVtMEewfEbZmy4zRuWvvMp/EKz8RyzPvXgf04Lw3HYiA3jMPl/s8Qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=SrI/C05TNgvafXaxpHfzZ/aQgaUxvUZzRGuk0w3A0PY=;
	b=hcTcPLnkpUhC1Zj01BRMgvEJqXurYyV80c4vEPuBfabNlUdV6N/bw9eoGHAEmTSxocygzhXipEt80U3ZPzSHeKqxfCL8kpoyiWXm7yQMVUcLH6t2dxct49yxs+C9wHZGXYXAWTtqE4Jshvm6f5i5s9cN0gGkB2mZSFfCd9HZNJF8zEFpy34DDA18U+8pweemXmu/aF3cPZMGEEK9PcjOWWEGoMfar0MD/pXscGegXEn+ZeqWXHh4lDWkpdEo+RAu1XQqVs/6l85W0sp3IFEnJL2akZOk7j0/x+py0GQMczcc+Ra68QxLjxZ7Bh+Vyp8I4FzjJKCUbsQheCFMjhY27A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
	60.241.24.90) smtp.rcpttodomain=lists.openembedded.org
	smtp.mailfrom=opengear.com;
	dmarc=pass (p=none sp=none pct=100) action=none
	header.from=opengear.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=opengear.com;
	s=selector1;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=SrI/C05TNgvafXaxpHfzZ/aQgaUxvUZzRGuk0w3A0PY=;
	b=r3hi2OYvRuCAP+UkwZhmlLgWZZ1HuplwV8gyQZ7qLCD9JMlkkD0nuj37zBY6x1dvKeSizcchsec5j5aUVfyH4Y2TLEQGVBfLEJ1RaTRYRfmGCN8Bu1yAhiYreKs+6YjH71JvbYEFu73bQ++ukEGYwcpPP41OgxapmB18Pbynfjs=
Received: from SN6PR16CA0059.namprd16.prod.outlook.com (2603:10b6:805:ca::36)
	by BYAPR15MB2311.namprd15.prod.outlook.com (2603:10b6:a02:89::29)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2729.24;
	Wed, 19 Feb 2020 12:08:15 +0000
Received: from SN1NAM04FT039.eop-NAM04.prod.protection.outlook.com
	(2603:10b6:805:ca:cafe::8c) by SN6PR16CA0059.outlook.office365.com
	(2603:10b6:805:ca::36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2729.24 via
	Frontend Transport; Wed, 19 Feb 2020 12:08:15 +0000
Authentication-Results: spf=pass (sender IP is 60.241.24.90)
	smtp.mailfrom=opengear.com; lists.openembedded.org;
	dkim=none (message not
	signed) header.d=none;lists.openembedded.org; dmarc=pass action=none
	header.from=opengear.com;
Received-SPF: Pass (protection.outlook.com: domain of opengear.com designates
	60.241.24.90 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=60.241.24.90; helo=postman.bne.opengear.com;
Received: from postman.bne.opengear.com (60.241.24.90) by
	SN1NAM04FT039.mail.protection.outlook.com (10.152.88.242) with
	Microsoft SMTP Server id 15.20.2729.22 via Frontend Transport;
	Wed, 19 Feb 2020 12:08:14 +0000
Received: from galangal.danc.bne.opengear.com (danc.bne.opengear.com
	[192.168.254.90])
	by postman.bne.opengear.com (Postfix) with ESMTPS id 59BCBF25A4;
	Wed, 19 Feb 2020 22:08:12 +1000 (AEST)
Received: by galangal.danc.bne.opengear.com (Postfix, from userid 1090)
	id 4C8DF422E2C0; Wed, 19 Feb 2020 22:08:12 +1000 (AEST)
From: Dan Callaghan <dan.callaghan@opengear.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 19 Feb 2020 22:08:03 +1000
Message-Id: <20200219120803.9846-1-dan.callaghan@opengear.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200211060834.19790-2-dan.callaghan@opengear.com>
References: <20200211060834.19790-2-dan.callaghan@opengear.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:60.241.24.90; IPV:; CTRY:AU; EFV:NLI; SFV:NSPM;
	SFS:(10009020)(4636009)(376002)(39850400004)(136003)(396003)(346002)(199004)(189003)(6266002)(336012)(6916009)(1076003)(107886003)(26005)(2906002)(478600001)(42186006)(7636002)(426003)(2616005)(246002)(36906005)(6666004)(356004)(8936002)(44832011)(36756003)(70586007)(70206006)(5660300002)(316002)(8676002)(186003)(4326008);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR15MB2311;
	H:postman.bne.opengear.com; FPR:; SPF:Pass; LANG:en;
	PTR:brisbane.opengear.com; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 884ade14-800b-4c3c-b836-08d7b53465d4
X-MS-TrafficTypeDiagnostic: BYAPR15MB2311:|BYAPR15MB2311:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR15MB2311BF5319B7B559E242989FB8100@BYAPR15MB2311.namprd15.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3276;
X-Forefront-PRVS: 0318501FAE
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1zbuWjnk1McHLxjRrj9qQzSHOg1NMSMAxSTz58Iz8CH2VPvfmbyYnnl4rZzkie3KApbT9vuncSyNv41iECKb37VFCLdiE3mNp9pldCzUpR2xUcVM2kOrEwRhri8B0RnPr+SdsK7YFsK5O53ZZsn8n4tNgvWrF5HUTFExh4Ahfg35eHGJ+77WxzFvbvxQGK0SKs+jib53Q6S2qqdakza2uq8vjKgxMGNhHgE9bjYJNTbDXIJ2aMuESpsCX56W+wWX1B3cgGOysLXZP4KsxN/Coo2uMIPHSpUxZ1uA0IHDGRMVY+2f7md1F2wDYhBiAnTfU90pL256v9j08dB5Df2CUfyBHHBgPHuYNp4cc47qed570Zi3qtLru3dMzA2o6s598EFnEZSR4Fo2OwQ5W6aYI17lAr23GTV4ElLHJGV0tMUVziFpnR2c4d6vvczzCo5u
X-OriginatorOrg: opengear.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2020 12:08:14.3537 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 884ade14-800b-4c3c-b836-08d7b53465d4
X-MS-Exchange-CrossTenant-Id: a6251c26-d21f-4164-a225-1f4eaebf5f9a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a6251c26-d21f-4164-a225-1f4eaebf5f9a; Ip=[60.241.24.90];
	Helo=[postman.bne.opengear.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR15MB2311
Subject: [meta-networking][PATCH v2] quagga: install tmpfiles snippet to /usr/lib/tmpfiles.d
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
X-List-Received-Date: Wed, 19 Feb 2020 12:08:16 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Package-owned tmpfiles snippets belong in /usr/lib/tmpfiles.d,
/etc/tmpfiles.d is for administrator customisations.

Signed-off-by: Dan Callaghan <dan.callaghan@opengear.com>
---
 meta-networking/recipes-protocols/quagga/quagga.inc | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta-networking/recipes-protocols/quagga/quagga.inc b/meta-networking/recipes-protocols/quagga/quagga.inc
index 2673a8976..310bc7eef 100644
--- a/meta-networking/recipes-protocols/quagga/quagga.inc
+++ b/meta-networking/recipes-protocols/quagga/quagga.inc
@@ -116,9 +116,9 @@ do_install () {
     done
 
     if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
-        install -d ${D}${sysconfdir}/tmpfiles.d
+        install -d ${D}${nonarch_libdir}/tmpfiles.d
         echo "d /run/quagga 0755 quagga quagga -" \
-        > ${D}${sysconfdir}/tmpfiles.d/${BPN}.conf
+        > ${D}${nonarch_libdir}/tmpfiles.d/${BPN}.conf
     fi
 
     # Remove sysinit script if sysvinit is not in DISTRO_FEATURES
@@ -166,6 +166,8 @@ FILES_${PN}-ospfclient  = "${sbindir}/ospfclient ${libdir}/libospfapiclient.so.*
 FILES_${PN}-watchquagga = "${sbindir}/watchquagga ${sysconfdir}/default/watchquagga \
                            ${sysconfdir}/init.d/watchquagga"
 
+FILES_${PN} += "${nonarch_libdir}/tmpfiles.d/*.conf"
+
 # Indicate that the default files are configuration files
 CONFFILES_${PN} = "${sysconfdir}/default/quagga \
                    ${sysconfdir}/quagga/bgpd.conf \
-- 
2.21.1


