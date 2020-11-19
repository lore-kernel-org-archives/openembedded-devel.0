Received: from NAM10-DM6-obe.outbound.protection.outlook.com (NAM10-DM6-obe.outbound.protection.outlook.com [40.107.93.73])
 by mx.groups.io with SMTP id smtpd.web12.5914.1605771721179511515
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 18 Nov 2020 23:42:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=OG6fAMOt;
 spf=pass (domain: windriver.com, ip: 40.107.93.73, mailfrom: kai.kang@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bGOb8GOCIBARZsyRKKWX+RjZ/sWjmaAO+pu3zXEihpDlBe4TAbTyeZRjf6IIah5R/qGTv+ed+8Hx4GnvXdSqRlrk/9E9S+toCKzRVBvhOfniinbhUmNGhEHiOCrM0u9LPb7DYF3uhltWtfPMXp18XQ/vGmdVzTD7TSsdGO8kWPZBYBPJVNYcQvTAOIjuceHlCbd23zFMAYn96elid4qHtG9OUIqena1ioIfV+jfPFZtF7PkE3Ww3g9kgJ678IJhvIBKPWSzlamX4AjjE6j/b8CUBAbRxoK+IODNnbFQ4rzqY3GER0ShfkvuXxyiLa+l4NzIO4H5IscYKpv76E+5QPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9Gw6UkTJ6i4Er4EX2WRiY0VJHRS9BNNq5pSd6ynwvrQ=;
 b=Jh9oeEml/W9F9LqJpGfFyCWnd8qw8hDIIe/jsP8DPlyTGpEmifWVFBx4AqfMVoqi/9aMSqK5NbVFLyIdJK9mXd1uPyes6cvtK9HPbyr8vilNnso3Kq5A9FRBuPULJ890k2zt89y/dM/boEuruH173zLsUalc1rPlNJeFMUfxqmGK4BPmON9MGcdU5h+GhlzzAdYV1SJdzdw2ziEr/YnWDrtldDLdISEqf1NzBY6u0+E85Jf+Hd7VwozjAwAJHosc4MXZy526BPGWy/A48uSCZBpanOCr/LKZRYesiYL+MUUi1ShSRwgU7uo/O15LzA+ggnyM2+nvaOR7QN578n5sXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9Gw6UkTJ6i4Er4EX2WRiY0VJHRS9BNNq5pSd6ynwvrQ=;
 b=OG6fAMOtwa3Nlg9TOEBXc+cl1kJD8BXAznPEjELTvlDUkxXw3MruefwHvJFmOqHwOFdgaaheI/mYjxfhpRAMEOn32sTy0EAXW62ALZeDsMNcRyE1QXw/uisCxuWALZQSBPB85oWw0nF3CUV5kzvSvcqCKlGGXuJrLx/sGU8ZUu4=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=windriver.com;
Received: from SN6PR11MB3294.namprd11.prod.outlook.com (2603:10b6:805:c4::33)
 by SN6PR11MB3055.namprd11.prod.outlook.com (2603:10b6:805:dc::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.22; Thu, 19 Nov
 2020 07:42:00 +0000
Received: from SN6PR11MB3294.namprd11.prod.outlook.com
 ([fe80::b49d:2c09:ddcc:f5e2]) by SN6PR11MB3294.namprd11.prod.outlook.com
 ([fe80::b49d:2c09:ddcc:f5e2%5]) with mapi id 15.20.3564.028; Thu, 19 Nov 2020
 07:42:00 +0000
From: "kai" <kai.kang@windriver.com>
To: schnitzeltony@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Subject: [meta-xfce][PATCH 4/4] tumbler: 0.2.9 -> 0.3.1
Date: Thu, 19 Nov 2020 15:41:34 +0800
Message-Id: <20201119074134.6963-5-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201119074134.6963-1-kai.kang@windriver.com>
References: <20201119074134.6963-1-kai.kang@windriver.com>
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HKAPR03CA0031.apcprd03.prod.outlook.com
 (2603:1096:203:c9::18) To SN6PR11MB3294.namprd11.prod.outlook.com
 (2603:10b6:805:c4::33)
Return-Path: kai.kang@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-lpg-core3.wrs.com (60.247.85.82) by HKAPR03CA0031.apcprd03.prod.outlook.com (2603:1096:203:c9::18) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.11 via Frontend Transport; Thu, 19 Nov 2020 07:41:58 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 06ffabb9-2fb1-4fd2-df26-08d88c5e9916
X-MS-TrafficTypeDiagnostic: SN6PR11MB3055:
X-Microsoft-Antispam-PRVS: 
	<SN6PR11MB30558DB82C2A2850999A742F95E00@SN6PR11MB3055.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	aHJtc7a0WLAVf9anb0VG52+ASVQx2CuhHlTtnecOYq1KN34cnTYUIN01UeQeVQz6PF48uGGYmoFV/qQP6C9OPgDZ55oDsrJtLfZQNlnfplUIHNTgctpaDdHuh11wMkJ+eCgCMakuneBEW9nM7hs0lN8FaieSXVg1BrmM8LzMTdTPiR5C+Fecxmrfjuk5VjZd3Ve1zGhqWjcvplLY5oC2gric/5sk31TMI1MclaNvokmMmHsG40hyrp+eVHH61uWlC8ygBQj2a+YQEL5cJPWY7G7MNLL5ctk9nj1/U7s30lU6XJCd5sUufoC9A3CQk5dZ
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB3294.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(366004)(136003)(376002)(39850400004)(396003)(9686003)(6666004)(8676002)(2616005)(6916009)(6512007)(956004)(6506007)(6486002)(316002)(1076003)(478600001)(8936002)(83380400001)(5660300002)(16526019)(52116002)(186003)(4326008)(66946007)(26005)(66556008)(2906002)(86362001)(36756003)(66476007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	KjXBmMUJgKMBPdMQbPjYpPrSDIaIOLHTZY4AfdM+itr56lEbxuy0GHdyM/1Vn4/ITinhVIZUbPjkivMBjFw+mnALlrXfZmANn+gsBr0txYyT0LPMmFSuDbXqnja6VCwYa6zXwHbbEp9xqz40m0c5KrcwBLHFr1Sf704+nL6iqg7/VVbgg0YfJf2thJRGdcdm2/YkFU8BTRbSRmpbw1ODW2HLK/Uhv84xL9OiD2LlYc/vYy11IbK1/XwmUWdV8DHDd1oaa03b085MuWZ79VFeWJ+uqwyUDTWG4HsqWR+9j6uvgM+saIXVuzpJNgqTJshBhWsw9gw8D6xiDgAgP9uYzwSKnzLM0PUZLyZ7Tldp3zjvDNg3b6awfcxbBmtm6AwzO5WV3t2Bdx1Zt5BT8ynfv0UsJ7ZUFT8x/oRgP6j6eAqtLkliBDAU/3ltAJp9V27PzE3BZ0jlZASUY98V0+wVgy+sZ1mUyloP0to3k43fwoMcjrhDjGKowh9qZz68j7LkrUOCiphGdohdzf73y3exX5D0fJNB23vRx6cAAlUBUPVTLGQGAzsIEYoJQ3kewPBEWdAWJdiRRflg5oGl4ia2w6dcgAZss/CjaADJSe/aH0Ur17NTizfehtSWdywgWJE5w5Q5WHJ0s3/iSf/i0z23IQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 06ffabb9-2fb1-4fd2-df26-08d88c5e9916
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB3294.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2020 07:41:59.9390
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9+L+GjlT4AzgoRF/lWza+KwNJo4N9frZKIPs3qagQRWfDLDbVK/j7QbM4rHEeTGD5Rgv0gWZE4uyzJaEYGnZZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB3055
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

0.3.1
=====
- New plugin, libgepub thumbnailer plugin
- Fix documentation URL
- Add README.md and EXTRA_DIST
- Add new icon needed for xfce4-about-dialog
- Translation Updates: lt, oc, he, hi, hu, sk, tr, ug

0.3.0
=====
- Fix jpeg thumbnail orientation when fallback code is taken place (Bug #28).
- Use AC_CONFIG_MACRO_DIRS instead of AC_CONFIG_MACRO_DIR
- Fix GTimeVal deprecation
- Drop support of GLib < 2.32
- Use guint32 for request handle and fix its further occurrences of 0
- Implement Excludes paths in tumbler.rc
- Translation Updates: be, da, el, es, he, hu, hye, it, nl, pl, sq, zh_TW, zh_HK

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../recipes-xfce/tumbler/{tumbler_0.2.9.bb => tumbler_0.3.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-xfce/recipes-xfce/tumbler/{tumbler_0.2.9.bb => tumbler_0.3.1.bb} (92%)

diff --git a/meta-xfce/recipes-xfce/tumbler/tumbler_0.2.9.bb b/meta-xfce/recipes-xfce/tumbler/tumbler_0.3.1.bb
similarity index 92%
rename from meta-xfce/recipes-xfce/tumbler/tumbler_0.2.9.bb
rename to meta-xfce/recipes-xfce/tumbler/tumbler_0.3.1.bb
index d364c8033..c9f2ddc8b 100644
--- a/meta-xfce/recipes-xfce/tumbler/tumbler_0.2.9.bb
+++ b/meta-xfce/recipes-xfce/tumbler/tumbler_0.3.1.bb
@@ -6,7 +6,7 @@ DEPENDS = "freetype gdk-pixbuf poppler curl xfce4-dev-tools-native libxml2 libgs
 
 inherit xfce gtk-doc
 
-SRC_URI[sha256sum] = "6508906f03e5a6ae3f6503b71b056df47d336d5504f39df6ce0bb9c5248007b6"
+SRC_URI[sha256sum] = "e4a30f3c0656b5b29fcd4a2450293f20f283a95b7fb0754a947c55427784c454"
 
 INSANE_SKIP_${PN} = "dev-so"
 
-- 
2.17.1

