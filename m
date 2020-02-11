Return-Path: <danc@opengear.com>
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
	(mail-eopbgr760083.outbound.protection.outlook.com [40.107.76.83])
	by mail.openembedded.org (Postfix) with ESMTP id 01C7660BFC
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Feb 2020 06:08:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=naKarnqLwR7nv1gta33Cd+QnPnVLgaD3nJGk5Rrs1iCv2Qf9RMW6suWFU0eOYf8Fv7okh2iwwnfQ2skqmej3kMll0WA1VG5vMfkBEatudOFuyLC99OeIgT2KFmpFHlmRZO8/jR4V1nQnQBhVmyY9zvtzVwrYudTnvC4NXPm9Yu23J8FQepsy+QMDXtIZ4JebX4KHVWsOUjcz0vDa3BtYvlkZ9OHGYzII9unpvZZmxwyvH7loVqCK652d/aSTrxD/rR9aQ+PmoU3bDEPFjkVKj7qYUpGHQkgYfUUnPTnTw1YmeerHfc79BULvdYogkLRfJRsKpGJCJ66sY6OJsY0oHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=o3DCMhCRiSeVgTU0ARBqYpGX8hWCGpRyMBmGaCIyRgQ=;
	b=cufYQFBJDun3GMoxoe6vDYj1zwJD/RJ63KOpv1qxIoyGghJQ2CXXTXNjlhgF1U6KOTuNwS5tT4AUYkqI0Gp61py0dwC9juOSDqSMDL5TMKp9mXUTMI55McFXB3HruxtCBIn40DgbHiyhA+KSxoksezJsnE1G4aZvwRIj5FtHL6nosghB4afApag91btz6uFspMIaHiGDZVUyF5u4zRxF8zn2lOl2hVoUx8jkKLxIHQ4vQNcIqXwh3tJRK6O5DRrLejYYp41d8GiUod8tcqEsrJwYvQKIeZ6JED3U5QmfV7FBCEbp9v8LGStjcAWnP/YQLCXwU+dseANjQ5CFlTK8jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
	60.241.24.90) smtp.rcpttodomain=lists.openembedded.org
	smtp.mailfrom=opengear.com;
	dmarc=pass (p=none sp=none pct=100) action=none
	header.from=opengear.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=opengear.com;
	s=selector1;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=o3DCMhCRiSeVgTU0ARBqYpGX8hWCGpRyMBmGaCIyRgQ=;
	b=yv8aW4SuNfsNHoFdPP+P8lCAayWR2+SHEf+FPu+3VI2xGFBuCHdbkTFQzmyJ6Ko4hnOSK8DmOgRzU0A9kGzGE/AiS5Ia46Ky0Ri68kZWVk1sGOlOdLOBvrzHaxwmG9EFDDenQ3I6NT3oLtbxkyUJAqbFoglG0CtESrjpIWb3eUk=
Received: from BL0PR1501CA0023.namprd15.prod.outlook.com
	(2603:10b6:207:17::36) by BN8PR15MB3409.namprd15.prod.outlook.com
	(2603:10b6:408:a8::24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2707.23;
	Tue, 11 Feb 2020 06:08:57 +0000
Received: from BN3NAM04FT013.eop-NAM04.prod.protection.outlook.com
	(2a01:111:f400:7e4e::205) by BL0PR1501CA0023.outlook.office365.com
	(2603:10b6:207:17::36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2707.28 via
	Frontend Transport; Tue, 11 Feb 2020 06:08:57 +0000
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
	BN3NAM04FT013.mail.protection.outlook.com (10.152.92.152) with
	Microsoft SMTP Server id 15.20.2707.21 via Frontend Transport;
	Tue, 11 Feb 2020 06:08:55 +0000
Received: from galangal.danc.bne.opengear.com (danc.bne.opengear.com
	[192.168.254.90])
	by postman.bne.opengear.com (Postfix) with ESMTPS id ACACDDEBA0;
	Tue, 11 Feb 2020 16:08:53 +1000 (AEST)
Received: by galangal.danc.bne.opengear.com (Postfix, from userid 1090)
	id 88995427F563; Tue, 11 Feb 2020 16:08:53 +1000 (AEST)
From: Dan Callaghan <dan.callaghan@opengear.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 11 Feb 2020 16:08:33 +1000
Message-Id: <20200211060834.19790-1-dan.callaghan@opengear.com>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:60.241.24.90; IPV:; CTRY:AU; EFV:NLI; SFV:NSPM;
	SFS:(10009020)(4636009)(39850400004)(396003)(136003)(346002)(376002)(189003)(199004)(36756003)(426003)(316002)(8676002)(4326008)(8936002)(186003)(44832011)(4744005)(2616005)(2906002)(356004)(6666004)(70586007)(70206006)(6266002)(5660300002)(246002)(1076003)(336012)(107886003)(42186006)(36906005)(6916009)(478600001)(7636002)(26005);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BN8PR15MB3409;
	H:postman.bne.opengear.com; FPR:; SPF:Pass; LANG:en;
	PTR:brisbane.opengear.com; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7772fb8c-7339-4eb5-8a0a-08d7aeb8e0c5
X-MS-TrafficTypeDiagnostic: BN8PR15MB3409:|BN8PR15MB3409:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BN8PR15MB3409CD528C2AC660EFDBE5C9B8180@BN8PR15MB3409.namprd15.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-Forefront-PRVS: 0310C78181
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4xgwsXvfnEeWvFWrjqdY3PpTeZ/rMZYpnrHxW1VstczlP/puYbcAp5QRXiCiTwYkumxh33NqMeHkbe+QSj7pVtyAwNGjUrpxhCXtL+d9yyWqcSOk3ySK37Eiua8N/Rs4vZ3bWZYzVr9DoeD+mbTIpW+JHeYo8f1RV2THhqDT25tfmnUf86sp72BfG6OOt94PkQb323INZIPeArfKmYsThwEaiu7YPm0nVeteiCP+UKTo1SEL9ohBRmPcy16AgzrW1UY6+VdzRm04ORndyAACOy+Hr8O+zKzd69VWcVKigqwKoZq0wjnErRinTs9GwHwgSybgo0gL/LaGBJbqdRIc1p2xsNs6Q6SLCRKgUauZCWgUcCPInTuqt4D5fn+/bqSzT4bEbN4BAFIaksNpZjWWxa19QJZcE/+TKYiTRUD8nGf7rvVbSCwDpevBij2ICqEJ
X-OriginatorOrg: opengear.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2020 06:08:55.9927 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7772fb8c-7339-4eb5-8a0a-08d7aeb8e0c5
X-MS-Exchange-CrossTenant-Id: a6251c26-d21f-4164-a225-1f4eaebf5f9a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a6251c26-d21f-4164-a225-1f4eaebf5f9a; Ip=[60.241.24.90];
	Helo=[postman.bne.opengear.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR15MB3409
Subject: [meta-networking][PATCH 1/2] quagga: fix tmpfiles snippet to refer to /run instead of /var/run
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
X-List-Received-Date: Tue, 11 Feb 2020 06:08:59 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This fixes a complaint from systemd on boot:

    systemd-tmpfiles[393]: [/etc/tmpfiles.d/quagga.conf:1] Line
    references path below legacy directory /var/run/, updating
    /var/run/quagga → /run/quagga; please update the tmpfiles.d/ drop-in
    file accordingly.

Signed-off-by: Dan Callaghan <dan.callaghan@opengear.com>
---
 meta-networking/recipes-protocols/quagga/quagga.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-protocols/quagga/quagga.inc b/meta-networking/recipes-protocols/quagga/quagga.inc
index dfd6aa7eb..2673a8976 100644
--- a/meta-networking/recipes-protocols/quagga/quagga.inc
+++ b/meta-networking/recipes-protocols/quagga/quagga.inc
@@ -117,7 +117,7 @@ do_install () {
 
     if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
         install -d ${D}${sysconfdir}/tmpfiles.d
-        echo "d /var/run/quagga 0755 quagga quagga -" \
+        echo "d /run/quagga 0755 quagga quagga -" \
         > ${D}${sysconfdir}/tmpfiles.d/${BPN}.conf
     fi
 
-- 
2.21.1


