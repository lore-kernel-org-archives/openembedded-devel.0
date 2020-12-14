Received: from NAM12-DM6-obe.outbound.protection.outlook.com (NAM12-DM6-obe.outbound.protection.outlook.com [40.107.243.85])
 by mx.groups.io with SMTP id smtpd.web09.28654.1607910091816468436
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 13 Dec 2020 17:41:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=WEiiDYxE;
 spf=pass (domain: windriver.com, ip: 40.107.243.85, mailfrom: qi.chen@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OBK9Lxw+6/aYnUMG80trSUXO4RVT55m4QkLqMpITL3eElgHQ5MwV2qIlruVHck6UTvlqO1W+E91EEongM3x8wKnEtm388tDFNEYp94DhZE6/eqlT89mSVJTaU5UH+WMfGu+uoiu+Ob9SY5bRZ90XXF/rsXhruT0Y3hMz/u2WcwIh1CUlU5Wd90jt9pJ2q94zQNskIZO+O3nfjq/Y7WD83jPafT0/tW5/ey9TVJVnskqQDyzk/T3Ja2Ocn5GS2YrG+giX55BDbyhrxCDHmXU9FxsQ4zwaUcow78bHW9lsdhaunA6QvrgscNfmLh230qvSTH5dMhGcEm+sc/3QWm2PNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zhjZgS33MO01PPESibI/7OSZvGuEc3KppRkV9+t4q/I=;
 b=JbHXuJ+d6hYax8qO+N+cmp7d44jdUsWUrrt3j+eNSm5Np1/9pTAvVy3xg/6LzwyVYwqnbwghrNn1P5FU+0FAEpuc5+cAY+p5SNkygXxYo9sTRer2CAvH/XGd0ArRIoAbuYROlI+QPsL3Zf9haM0MSe4YteZR4PcD0a8EKLd2BL1ArGn3yS8bNVsysPWRrcWcKGsLnw1JBToRFTrUyXhEAONfaXhuXodCnTgkWkMZ8EEagzdoXJyuVg1EXEOd8k/9c7H6ed3KBT9FfGA2GQTmRo3DhacDohZ++Tzi5GvDYryAEH0xSE6hWqmZQISqjf4Xx6U+pblYj4Ezvw7CsFNbjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zhjZgS33MO01PPESibI/7OSZvGuEc3KppRkV9+t4q/I=;
 b=WEiiDYxEDzJ3iKR1/5iaPQ69ghkLRhew+yJgR6MUhGrVoBMMRYdzPaKJGDUqU6EJGk0LRTm4ID+1W85nKDb4KpUgvSVgEpUPBeUrA9QsitbmxGmcyFw+2wY0BDM/4EQPVOrjwpVhGzL+zSsSTzoR50Q02L/AiTGb3UnvynceBjM=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BYAPR11MB3480.namprd11.prod.outlook.com (2603:10b6:a03:79::27)
 by SJ0PR11MB4814.namprd11.prod.outlook.com (2603:10b6:a03:2d8::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.20; Mon, 14 Dec
 2020 01:41:24 +0000
Received: from BYAPR11MB3480.namprd11.prod.outlook.com
 ([fe80::3c77:a84f:ae81:1cb7]) by BYAPR11MB3480.namprd11.prod.outlook.com
 ([fe80::3c77:a84f:ae81:1cb7%3]) with mapi id 15.20.3654.020; Mon, 14 Dec 2020
 01:41:24 +0000
From: "Chen Qi" <Qi.Chen@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-python][PATCH] python3-requests: upgrade to 2.25.0
Date: Mon, 14 Dec 2020 09:40:26 +0800
Message-Id: <20201214014026.37770-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HKAPR03CA0012.apcprd03.prod.outlook.com
 (2603:1096:203:c8::17) To BYAPR11MB3480.namprd11.prod.outlook.com
 (2603:10b6:a03:79::27)
Return-Path: Qi.Chen@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-lpg-core3.wrs.com (60.247.85.82) by HKAPR03CA0012.apcprd03.prod.outlook.com (2603:1096:203:c8::17) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3676.12 via Frontend Transport; Mon, 14 Dec 2020 01:41:23 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ca7573df-7751-41d3-2845-08d89fd15ddf
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4814:
X-Microsoft-Antispam-PRVS: 
	<SJ0PR11MB481496CF5F6B79AEF53BBC95EDC70@SJ0PR11MB4814.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	DaFFVVVCF/0HRFpvYomlrYoGRp3H6PdbJq/kIus6EscM0Nk4Vw60OVk5eIPeefF/Mxo4dnfsleMLp5TSAOd7dgWPz4hKyRRRsoryp+PbK+gB7sYZA9rQDxTNet7qrZW+ZBfaR9wgUHXqnDIKA2asQ7FzMe7+UPr9C4gdp4ipUU8g7w706Jt+1ulxbqN7ZwCM3RsSURLcb6bRozPpKEAhWOQ24jQkTz3ZnBDqJGHl9xA8oiITm3HdFz46F6LuDOj47APhnKFgU0ZeKG8Aju1Vik/kfwyCjJI/7R/eJ6RvbT8sxlpSfdLK7wCDYEu4tL2uqN7WMNNzW0w8Ho6maEPhZ1QE+Zkq8c/J9TCu+rWTwXlbGZ3G3Pd4ReoboRbxia40yEopfjQuJAxVLTkX7t2EcOfmGPsYMgiDTTxvpKs9KS9nGpE0/hLsovfDAVGuPXYM6aEnjal2G5kG97jObRnDBg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB3480.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(376002)(136003)(346002)(6512007)(8676002)(6486002)(2906002)(1076003)(508600001)(36756003)(83380400001)(66946007)(86362001)(66556008)(5660300002)(66476007)(34490700003)(956004)(6916009)(6506007)(8936002)(26005)(186003)(52116002)(16526019)(2616005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?UyByzPFZWOnYxlfpal0TjJemA+Ugr0k4PpWu+k2AxuM3I1LhF9sCT7rkOGuf?=
 =?us-ascii?Q?EHhWvMIjJRnZFB7H8UMfMvuE2GCeiWR3K5ZiCVStYmyZP6nKljNTLBOo/EBk?=
 =?us-ascii?Q?EFWyrj+dPH8YgXKa915J+9oE98BaAMs8BEkER9SlsyNqFSZh5vWlkzIk5hXH?=
 =?us-ascii?Q?27IRFzcJ3OSL0Bd9xJFecHat+tMWCdl3BF1wgS9nI+xVEbTK5NB7xxwn0xGI?=
 =?us-ascii?Q?e+RjSzkZKoJd+AYsdJakpSuXRzD2KJZKqsDHU6nGonfhmWsPgHLmNUi7Fl+G?=
 =?us-ascii?Q?PzLiiEsnw+bXiVekH4pdIFOGT/e8K4g9tNrGPa8DpTOaB4SPwDQUoNQfx6EP?=
 =?us-ascii?Q?9LR89IT8hNl3xAp/927pwTDy14ODE9Cawo/su0OFe7TdhRspppLsjFSV+dcw?=
 =?us-ascii?Q?96eYwoJmlNrdQgj7EstnGPLooZp5AJ3RFX06aHZqhthR4R3UfleZBMAXfCuW?=
 =?us-ascii?Q?0jQORrZClERvCSwT/ckoCChaQUJYPEuJ79i/1D2iQGNSE6gALtvpb6fjMVgu?=
 =?us-ascii?Q?2+R9Pp0GoevEjTNCZrN6hD9houryDwjdAXLmsKGc4yH5gVBz0aWkRf43VoKk?=
 =?us-ascii?Q?UxcbPGfjObKX9+PQZpJLV1FkYf01iErOPcTApDq/HtHJx7UiaYDiUsta0wFt?=
 =?us-ascii?Q?IS2SuqpZhEPPisLEUDUjYsjqegNo5Nal+GKy+DuICcnKcr6tKJ3rcBvMY3++?=
 =?us-ascii?Q?lt7NaKs0UsgCQqHojdxTBRMB80UO6UHzXClZuKTs1AIbbFq+TjeJJYtd8ugF?=
 =?us-ascii?Q?45PzB0VpFFUhQ5kaAF/R1DDTeoJajZ1bMXkQVsBRq6hjsA5FrR2c+kZBHHg2?=
 =?us-ascii?Q?OhgbMe0vRPkx2kXvZgvFshQNUh1jwPNTz2ZpQTT2g7DmUWt6MJ/PqUnd7izG?=
 =?us-ascii?Q?jD8d2bf0AM20sg5JXbD6ilTUcOXLvlx7zVEXJHnmhciq0G4/43u7Cq6CokHA?=
 =?us-ascii?Q?hUtbuWXrfh89IiiVGE3/TSCb+7PQNRGX7zc8AHd2CXI=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3480.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Dec 2020 01:41:24.3942
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-Network-Message-Id: ca7573df-7751-41d3-2845-08d89fd15ddf
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BV6BWMHnnYFgEivWGJUw6eiQ3bCZVo2H2vI0b16LGwuVJScfL32scmULsu5RB0aa8k/tlph6ttD9v3yWiPkOwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4814
Content-Type: text/plain

The License checksum changes but the license remains the same, as
the change is only about copying apache2 license contents there.

This upgrade also solves the following issue on target.

root@qemux86-64:~# python3 -c 'import requests'
/usr/lib64/python3.9/site-packages/requests/_init_.py:89: RequestsDependencyWarning: urllib3 (1.26.2) or chardet (3.0.4) doesn't match a supported version!
warnings.warn("urllib3 ({}) or chardet ({}) doesn't match a supported "

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 ...thon3-requests_2.24.0.bb => python3-requests_2.25.0.bb} | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-requests_2.24.0.bb => python3-requests_2.25.0.bb} (64%)

diff --git a/meta-python/recipes-devtools/python/python3-requests_2.24.0.bb b/meta-python/recipes-devtools/python/python3-requests_2.25.0.bb
similarity index 64%
rename from meta-python/recipes-devtools/python/python3-requests_2.24.0.bb
rename to meta-python/recipes-devtools/python/python3-requests_2.25.0.bb
index de9a53584..5284f9598 100644
--- a/meta-python/recipes-devtools/python/python3-requests_2.24.0.bb
+++ b/meta-python/recipes-devtools/python/python3-requests_2.25.0.bb
@@ -1,12 +1,9 @@
 DESCRIPTION = "Python HTTP for Humans."
 HOMEPAGE = "http://python-requests.org"
 LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=19b6be66ed463d93fa88c29f7860bcd7"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=34400b68072d710fecd0a2940a0d1658"
 
-FILESEXTRAPATHS_prepend := "${THISDIR}/python-requests:"
-
-SRC_URI[md5sum] = "b54bff26a389e5932e8b1c4983a99ce7"
-SRC_URI[sha256sum] = "b3559a131db72c33ee969480840fff4bb6dd111de7dd27c8ee1f820f4f00231b"
+SRC_URI[sha256sum] = "7f1a0b932f4a60a1a65caa4263921bb7d9ee911957e0ae4a23a6dd08185ad5f8"
 
 inherit pypi setuptools3
 
-- 
2.17.1

