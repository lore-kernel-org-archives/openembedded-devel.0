Received: from NAM11-CO1-obe.outbound.protection.outlook.com (NAM11-CO1-obe.outbound.protection.outlook.com [40.107.220.88])
 by mx.groups.io with SMTP id smtpd.web12.31811.1606118286575060598
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 22 Nov 2020 23:58:06 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=QJWU3Jxe;
 spf=pass (domain: windriver.com, ip: 40.107.220.88, mailfrom: yi.zhao@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k5koe0tC9nDheuB4y/swM9yRqL798iHE8aDR2sr5OcZiC0xm8Pvo0D2qf+HXSjJXvaV1Bd16LvhhdKIWNiMjIR6ntmvVc3TjWwV7d2lErMYCsEkMScsTVW51jlIIoM6a2PjpG4mEhWvRqBUAwxI2+76nEr+QVm7mEUg7tlHN1UmBH+eqPLuOVWOz1y1Y9P5rULrQVfNrqL7fZdryoYkHyixSH1PvfBiuyMWHND8UdzuqSAMHngK3837Dp7rCJHcLHL0qRgpVTrRb/XBCGjUHaYyoMopLuc5itqDMBKe1Ng641mdIS5Ha6fg9e3SLT1pb0R6ZgHvP6z0hCMPaa1QMCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o0sQylHc2kPwixJ+Wtt91bxiGlpzZjlT6WGw7VHHsf4=;
 b=UXEhY0TchugqChq4h8u02IdSk7PH9RbLxydmcRZRfQjXG9pttLVk+aFmQuPkmTJew4D4ghnCIrpmpDESMDp5D5ZTJmvdHvaUpcripP01laQRj4j7BF/7Qscq2vczqbw5h0MvjjsSSH3yTEu/jXhehI4hNljkXiGWfOl+HbzB4ZNIB4+JKjXwuOepiWvUzL6x8zQ9UU+Hzt2pEokf+xVIrhn54E9V9UiFEtPZqeYzFN6n7H0oYCw+skxex+1v9z3SbVEzEULxsYKTWHH+DVJ9pwXN7XaC+JYhaWc8eWgNSfRgcc/CE3CUjQibPH2/B9A7gNJQ9IWWSq32sX1TLsIB6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o0sQylHc2kPwixJ+Wtt91bxiGlpzZjlT6WGw7VHHsf4=;
 b=QJWU3JxerpRE8cnwU8iXyIgjgE1K/DB0qsGmAR6LWiHj0UFbbJto8m58e1LfY9/E5GbwN+g48oZ5F9ww5AqrKxqOEFJ9h3iz8Z9lKw3w65XuiLsHR0ytyMyPbewt+qyy5aGoT2WNgrKZcZ5kKMNoZkQQKeUKCDbvR0eGsUIaC6Q=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by MWHPR1101MB2240.namprd11.prod.outlook.com (2603:10b6:301:52::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.20; Mon, 23 Nov
 2020 07:58:05 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::d844:ac89:6b05:ed98]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::d844:ac89:6b05:ed98%6]) with mapi id 15.20.3589.029; Mon, 23 Nov 2020
 07:58:05 +0000
From: "Yi Zhao" <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 1/2] nss: upgrade 3.57 -> 3.59
Date: Mon, 23 Nov 2020 15:57:53 +0800
Message-ID: <20201123075754.293074-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK2PR04CA0044.apcprd04.prod.outlook.com
 (2603:1096:202:14::12) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
Return-Path: yi.zhao@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-yzhao1-d1.wrs.com (60.247.85.82) by HK2PR04CA0044.apcprd04.prod.outlook.com (2603:1096:202:14::12) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.20 via Frontend Transport; Mon, 23 Nov 2020 07:58:04 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 663e8267-0501-4abc-664a-08d88f85820d
X-MS-TrafficTypeDiagnostic: MWHPR1101MB2240:
X-Microsoft-Antispam-PRVS: 
	<MWHPR1101MB2240A4DAAFE8E42E2536AE82F9FC0@MWHPR1101MB2240.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:497;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	RkRtND2SqdXt23c9tyeCpRMxZYiSiehyWQVisN2PoxW/HlGfvwnhPlOI3ez1Y6qRMmkBUIswjoYIG2WDO7x8fwAn/BtpgWjMmekHV6Z3d5L9om9jB/Tg6nGdEp1lLEsNBs4SA5SNPlT44cWyQpsiphLWHEY+COXj6GhMMCqKuJowmwdJiKbhaTxTOhkVbQwjiimaASXFtbhUE2IdAkA7V0gZJyq2oLZ4pLsdNjdBJVRfJIxuXIzXaUZSEc2hDPLvEJvpa91lt/HKwx0Loj/aQ/Rhn1PR6YVCLTH74EQHuJnIJWTx6wOne0JNLC0c3/e916unqKWMkVkTdYNIKfF8bV8TBa0o7q5kRFh4c8Muux3oO2Vjc3V9FAz5AUWcrENxbhLnDmhJ4yJ4K/WyV37o7Q==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(396003)(366004)(136003)(39840400004)(186003)(26005)(8936002)(6666004)(6486002)(66946007)(2616005)(956004)(44832011)(66556008)(66476007)(6512007)(52116002)(36756003)(2906002)(316002)(83380400001)(6916009)(8676002)(5660300002)(86362001)(6506007)(1076003)(478600001)(16526019);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	FZEmZ1fZl2SgIWOj8NWkO6MB2tbevPmcWYTkwZ1A/EeeSxkuvULRsXL/gz9epm1WfD86Iljnll9bQluoZyaYIBpsgYw+ax6bs17g/7YCUKGegVhBg3p2eyBa6rc2Ay0dZ820UFdSxxkPEeLtAC8gSW99xYdkPkL9sUUNtorZMjHeypF7hHpA4AuG2XRjf7FJ0i11zt60E4aRZVKbwzzT2h2GTCyG/HZSJFf0JWTzEeXA9C39nJj3hHrhri3mHmXPFRhwbFa5RWpgufVX1oU49LJ29WeR8vqNkEE4JWcW3NCHif+Qq2ZbCriU7ee3aiRv/JidWaWXF9qFyV+W1IGPdOXmUb53B3LwYKVd9ypmHYZxODCQXaWzDb2FWPbG31ENaF1DLm6B63Q0pVMOrNN9QckwefkNHzbVuEdLCWUtUMUeMwSOedpvI5T8h66E3A3hRIdaf8JJ4LiuPU7EoOs5WIVhFegZJkOobKXsBsw076Welv5khgbhxP7lB0HApe/Ta+gMZcyNWXeUAw/HgmyjIO8vXBI1xkpSsLGCXH+CohXAPBuoMGpaBU5DOUYpKketPydBYV5nqCeOFkfifnFxhFUIpPkC9VoFwj5w/zmNbQFCUaPFOpwpmrnF7YrqVw+DX6EkQFSgEVacsexgVhvPSg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 663e8267-0501-4abc-664a-08d88f85820d
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2020 07:58:05.2052
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AjFKbmGGfVvb+aM6pcLMvQsItrz9PDYqkpq5N12ApCnnqruAbIvxA82p7so0OI2pKuzfLJaYNoZ+jmGPm7+0Ww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1101MB2240
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta-oe/recipes-support/nss/{nss_3.57.bb =3D> nss_3.59.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/nss/{nss_3.57.bb =3D> nss_3.59.bb} (99%)

diff --git a/meta-oe/recipes-support/nss/nss_3.57.bb b/meta-oe/recipes-supp=
ort/nss/nss_3.59.bb
similarity index 99%
rename from meta-oe/recipes-support/nss/nss_3.57.bb
rename to meta-oe/recipes-support/nss/nss_3.59.bb
index 5d9318a92..eb9162bea 100644
--- a/meta-oe/recipes-support/nss/nss_3.57.bb
+++ b/meta-oe/recipes-support/nss/nss_3.59.bb
@@ -32,7 +32,7 @@ SRC_URI =3D "http://ftp.mozilla.org/pub/mozilla.org/secur=
ity/nss/releases/${VERSIO
            file://nss-fix-nsinstall-build.patch \
            file://0001-freebl-add-a-configure-option-to-disable-ARM-HW-cry=
p.patch \
            "
-SRC_URI[sha256sum] =3D "55a86c01be860381d64bb4e5b94eb198df9b0f098a8af0e58c=
014df398bdc382"
+SRC_URI[sha256sum] =3D "e6298174caa8527beacdc2858f77ed098d7047c1792846040e=
27e420fed0ce24"
=20
 UPSTREAM_CHECK_URI =3D "https://developer.mozilla.org/en-US/docs/Mozilla/P=
rojects/NSS/NSS_Releases"
 UPSTREAM_CHECK_REGEX =3D "NSS_(?P<pver>.+)_release_notes"
--=20
2.25.1

