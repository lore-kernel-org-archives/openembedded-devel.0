Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 931D1FD88C6
	for <webhook@archiver.kernel.org>; Tue, 10 Mar 2026 22:31:09 +0000 (UTC)
Received: from DM5PR21CU001.outbound.protection.outlook.com (DM5PR21CU001.outbound.protection.outlook.com [52.101.62.35])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7776.1773181864617448562
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 Mar 2026 15:31:04 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=IU4jvNC5;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.62.35, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nDPU3ClueKs3aaPCR7gGdGUqVQchdo0NDDIfMf3FQd/oq+xvj7zw6KyYSP9GTKl46RMEGmapfka7iS+I1NVL99eEaJ9UiqJoXEVksFO+ovWdC+KoYdeqyx4jW8OhPBTdEsY8lOF9q222atzzsB6eoTd+m7LlwVP9hUNQyJ0+10oS+waoz2tjcvJGwzPRram/H2ImpH7Z5DO+G4La4dPFdVbE5lzzhERF9pIQz2jOU0Q4u1cnyDDcvAWgpI2rNzP4Hf/n9c7trnTFEQdporKlkse9y85WnY0rfrTtkeWE1jx++tkERTBW5B3kW/kZKJFUaAms8BvszuQwthUOd3Oyew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VtNi9l2C4eD3ZeSVj6gX8FyIlW+c4sJOG2yG+Bcuh+g=;
 b=fmKeGIWHz0eXriaqEN1mtrnNXsLBGpQx7ZFxZpn1mlR7bUHpwcVBS6tDv4ziu1umWksNHqm4mG5VsPdxd2DiezZI0kRGwOrqzMZFbC3mSK1W2QwRF25t4L8hi0Vk1wGWWUc88tJc7ZeHJr9PGMPczDMMv7lEM7aqqQbC0OTejw8w3DbgKxObL/F6DODeAeZlJ+sAXXuNWvi1Bir8U2jXTPCePQaL/xSaTbJNu7wQMy4RhB8QSGI+w9WTWG9GzdYB1jCo9OYrVb76ocsU82FgDvtamIAn1Y5VxsmWeukchlkrtW/K3Wl3ULd3DqVHDSeIY+6TtLz1O3BEz+IIIQxx0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VtNi9l2C4eD3ZeSVj6gX8FyIlW+c4sJOG2yG+Bcuh+g=;
 b=IU4jvNC5eKLPiY7GUT193AscHHjfiJJ/vX9nkXSkKavEz+nKYl7r0D2N4YJ2ZZnHP2cJ4z+oTLYcDpLvKAg6IJRGI4iKnTWpfsODm8PRaDOWkw0f/tDAimUIg2O4Q+iF8ulTUG0oGceV+uhhG6CtIFoRti1dhAkunOROiZmw8G8=
Received: from DS7PR03CA0065.namprd03.prod.outlook.com (2603:10b6:5:3bb::10)
 by PH3PPF5FDE66ECB.namprd10.prod.outlook.com (2603:10b6:518:1::7a6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.20; Tue, 10 Mar
 2026 22:31:01 +0000
Received: from CY4PEPF0000FCC3.namprd03.prod.outlook.com
 (2603:10b6:5:3bb:cafe::7b) by DS7PR03CA0065.outlook.office365.com
 (2603:10b6:5:3bb::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.25 via Frontend Transport; Tue,
 10 Mar 2026 22:30:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CY4PEPF0000FCC3.mail.protection.outlook.com (10.167.242.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Tue, 10 Mar 2026 22:31:00 +0000
Received: from DLEE207.ent.ti.com (157.170.170.95) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 10 Mar
 2026 17:31:00 -0500
Received: from DLEE211.ent.ti.com (157.170.170.113) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 10 Mar
 2026 17:31:00 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 10 Mar 2026 17:31:00 -0500
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62AMV0l63382778
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Mar 2026 17:31:00 -0500
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1w05bQ-0000000B49l-12Cy
	for openembedded-devel@lists.openembedded.org;
	Tue, 10 Mar 2026 17:31:00 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-python][PATCH] python3-websocket-client: Upgrade 1.70 -> 1.9.0
Date: Tue, 10 Mar 2026 17:31:00 -0500
Message-ID: <20260310223100.2637578-1-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCC3:EE_|PH3PPF5FDE66ECB:EE_
X-MS-Office365-Filtering-Correlation-Id: 12168385-e706-4fbe-d7d5-08de7ef4b525
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|36860700016|376014|1800799024|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	PkH2dDQvVeKVpwGTcr4QDM7eBdVI68KR2Gqxk8x4/cI1wjAhSz9rPoR+21kZyZmRcXJsCCt0CRu+PImhggQBC71uTO5WKSrbUxt/YFde/EAMDVGvEgcZMh4jW9PSQIfrshbcQJGajvM84GU57tyZux5Qx+TPOosRfvcewCrFsBftk6WSHsm005lx2/Z/CQAKoOTgV+DXB34rNCF9GvMRNuThj3vi5hyCBWAR4GNNwR1syALKuxZUNWyCNdirQ3Y483yiVk7cFcg6KujpHdUwCjIKvKOYfSu667IigW7/Up5++S4dHf8/rh3P3faPlpCTBENzn+dIXpM0/HTSDKhL4tSBhujnYUaDETTjS/UdZsEAIxO0N8HBJIEJyf5ujmp/84KAOb6p/zUcUlJlLPrn4zsG7boH+SVyErROVPEI2bsUPJWn08ILBtI03SbzO7NlTqvkCJ2SmxpQygT3eow3J/7WFL7uCjKpsZweKUg/r6Qxgg7xx5eaa66TSa6Co5/bl67oTzDVdHYnDgRHUjll8z4a1+/fdcJHwmbANjm1yMJtIwD2rlZuSL5+e7uXQ/dfTBUSF61MnrLcbKjhrWGr/2Rd8MhImlDsQGz0VUjsFGJMEh4NKvglLY3xB3i+aJJynC541YOn0sFbMBajwOIhI5rLhT7OJ11CZrFCiCIJ5VNvoHt1dI6a81WRueb6kOx8voHsRwQEfyKRJDoSMAPebdERo/5ujfCkpU46N92InUw=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(1800799024)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	zT+I5Lf4dpi+XGa0aDprJKAcFTTKLu7vs9paoMyaqEbG69kypn85GiWRyjzeSFAKOTNlff1fvhBVmz/9G0Ux7jADf8oKG0n4Mc6SzcwcVJmvPf/hZO5VeIsCQegnKNUZu1hSsDi7b4Q+lxv1/84JnT+xrlZ+QvaqPZg6jTPvIntTgapFIlgLUcxhiT7bNS+NPaqNOlOP7RIhJpen7btLaD9Ou4hznaoAPkzi4fuscs48EKTZLdOMB/w3BOpwYhe5IB8eYKTKCoYqQt35pJ2bty5fw/CaQ/4W6fm2XeJ4bcLhZK03X6j2IhsbOtHWewyPFClMzuu0MeVRfL/bLv8pHaVhrxDV5wrljztKopxiWulvCLXRSjjMsMX48KrZIFLuRwl7zAFt693T73f9txMjYnUv3YMZny9RfTh3FhyqtLzrSz8TzZk8ySALfn8fvVch
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2026 22:31:00.8665
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 12168385-e706-4fbe-d7d5-08de7ef4b525
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CY4PEPF0000FCC3.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF5FDE66ECB
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 10 Mar 2026 22:31:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125044

Upgrade to release 1.9.0:

- 1.9.0
  - Remove Python 3.8 support (EOL), add Python 3.13 (5f25030)
  - Remove localhost and 127.0.0.1 from default NO_PROXY list (#994)
  - Support IPv6 CIDRs in the no_proxy option (#1033)
  - Fix thread safety condition in `teardown()` to improve `run_forever()` =
(#1015)
  - Fix #1024 by chunking data, recursion in on_error callback, thread leak=
 in `_stop_ping_thread()`, avoid implicit None in `recv()` (#1036)
  - Avoid bare except clauses for better error handling (#1036)
  - Fix async (#983)
  - Resolve mypy type errors (#996, #1006, 813d570)
  - Test coverage improvements (#1035, #1036)
  - flake8 linting improvements (#1034)

- 1.8.0
  - Added `on_reconnect` parameter to WebSocketApp to handle callback ambig=
uity (#972)
  - Improve handling of SSLEOFError and use reconnect bool (#961)
  - Minor linting and docs CI build upgrades (981c00e, 75ba91a, bec2608)

License-Update: copyright years refreshed

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 ...et-client_1.7.0.bb =3D> python3-websocket-client_1.9.0.bb} | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-websocket-client_1.7.0=
.bb =3D> python3-websocket-client_1.9.0.bb} (66%)

diff --git a/meta-python/recipes-devtools/python/python3-websocket-client_1=
.7.0.bb b/meta-python/recipes-devtools/python/python3-websocket-client_1.9.=
0.bb
similarity index 66%
rename from meta-python/recipes-devtools/python/python3-websocket-client_1.=
7.0.bb
rename to meta-python/recipes-devtools/python/python3-websocket-client_1.9.=
0.bb
index fc73f1b0a5..87f25db0fc 100644
--- a/meta-python/recipes-devtools/python/python3-websocket-client_1.7.0.bb
+++ b/meta-python/recipes-devtools/python/python3-websocket-client_1.9.0.bb
@@ -5,9 +5,11 @@ This provide the low level APIs for WebSocket. All APIs \
 are the synchronous functions."
 HOMEPAGE =3D "https://github.com/websocket-client/websocket-client"
 LICENSE =3D "Apache-2.0"
-LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D6eae3bb7247ccb2c3a087ea8de759c0=
1"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Db8d4a5e03977c68fad62beee8185704=
e"
=20
-SRC_URI[sha256sum] =3D "10e511ea3a8c744631d3bd77e61eb17ed09304c413ad42cf6d=
dfa4c7787e8fe6"
+SRC_URI[sha256sum] =3D "9e813624b6eb619999a97dc7958469217c3176312b3a16a4bd=
1bc7e08a46ec98"
+
+PYPI_PACKAGE =3D "websocket_client"
=20
 inherit pypi setuptools3
=20
--=20
2.43.0


