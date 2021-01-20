Received: from NAM12-MW2-obe.outbound.protection.outlook.com (NAM12-MW2-obe.outbound.protection.outlook.com [40.107.244.69])
 by mx.groups.io with SMTP id smtpd.web12.22156.1611107387817816108
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 Jan 2021 17:49:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=Rgkh3QHA;
 spf=pass (domain: windriver.com, ip: 40.107.244.69, mailfrom: kai.kang@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JtMcVi3bJjSYBv0+87goLvW0S/oXlTbVmbHwZKMOyGD4ffMngeVnDM7oyaRk1BPNWtDp5zMi4V7O9kdaBcEoKo2+lPj1hEZIOXOWk9jEnnw9g+10UxdnyHndGdBwBmQXyQcvWVXifl1FFAA9Mk6LVpOI5iCL5O/XUoVQKM/2Te2tSOpx1vv5534BV9bWgkiEnJbLtHrhAik0TvaIWwOrJf5plfAa3hU9NTFQkc3hOr1WgqQ07XiTI6n4Vf6toMOLt2rXmyuHvTxz1eyPFGsRGGu6xbbOCtu3cY4tC4TzAfT5fQ0k+vvEw4z0khexQ+i9icDaGsHkpRG0fMH+BJ/QOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JsZ4tCh7XWViyca4xkmokarL6F7pJuxhk3AgcmrIfXs=;
 b=RDG9R/0NJjY8sDkoYnWLO/zaAoYuLeCV6QTVh5QQQC1JsOn63pBkLG4vfE5Af84NGAS5l5SHCzmIjw8DtC5Igf4wGykX5Po1gSmHA440URZrwA3pYQx/42Ctcwneocl/TonA8fCLzWmcE9QpDs9NXT8z+ZT8a49sWcnrtIXKDWUI6YgBtGmvkHBxtZskteIDS6xgLbD3KglK/DAIiSdYpyViwVLS6LImnyQAH0SbFOyp2HkL8UCsXqSJfsmf/zPhtEhv33e66kFbX38LiNEKKZ5FDHNbRGYEUZ3nQ0508g/k44rFoP9gvE3HiUoiN4Mbnacq8hkDYbGySlFkXf7RuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JsZ4tCh7XWViyca4xkmokarL6F7pJuxhk3AgcmrIfXs=;
 b=Rgkh3QHA0/1rg11IIYbmUxrgZjN3rfUBR1k2ESMNrfXM3UdQFoaXjA3kSvGnIym+oyWrABCM1h2FXLzPlY+7i4JXbfi8lEM0hWU1BPzWLH0w5XO7uLAqAbog02NyrHLyUYInHnnNVWhv8k0n+Dfv6Sn3OhWb3eeRi8i/93RKeyw=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BYAPR11MB3687.namprd11.prod.outlook.com (2603:10b6:a03:ff::26)
 by BY5PR11MB4194.namprd11.prod.outlook.com (2603:10b6:a03:1c0::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.10; Wed, 20 Jan
 2021 01:49:46 +0000
Received: from BYAPR11MB3687.namprd11.prod.outlook.com
 ([fe80::25dc:1dca:8fb5:ea28]) by BYAPR11MB3687.namprd11.prod.outlook.com
 ([fe80::25dc:1dca:8fb5:ea28%5]) with mapi id 15.20.3763.014; Wed, 20 Jan 2021
 01:49:46 +0000
From: "kai" <kai.kang@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH] blueman: refresh patch
Date: Wed, 20 Jan 2021 09:49:20 +0800
Message-Id: <20210120014920.16094-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK2PR03CA0066.apcprd03.prod.outlook.com
 (2603:1096:202:17::36) To BYAPR11MB3687.namprd11.prod.outlook.com
 (2603:10b6:a03:ff::26)
Return-Path: kai.kang@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-lpg-core3.wrs.com (60.247.85.82) by HK2PR03CA0066.apcprd03.prod.outlook.com (2603:1096:202:17::36) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.7 via Frontend Transport; Wed, 20 Jan 2021 01:49:44 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1a2adb83-d43f-4a9c-ab09-08d8bce5a985
X-MS-TrafficTypeDiagnostic: BY5PR11MB4194:
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB4194B16F50422F90B7A7680295A20@BY5PR11MB4194.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2657;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	5mQyn0CuIXtSu7bUhA3Q9HPzuGV5hmSmpFqX5rcny3Hem0S/vzaev94KcwdVPbrGqeSn1MZP33e+dhSIoxJFcrSTWb/FxlrSkmn07CRuF392osdAJW8ZyNFNvKlAzHkGRA3UhBM9gG+o8KFySS2L5RYRnLzxAzeSWt/By//vYSg4RSuUJ0bQD4EcpzZJpwHkJUoThWZbK2UQnG8EbuF8vUsUi8SR/dPsyXQzRdrJxgGy8bwpuFL9xpM1SCcQAIDWbfbUvZeEXOxhAhg1ltkqaLF1Xd1yUCWLeHzR6DVTqiwYOE5XV1tK58rxZTs6WZGBoThh+6n+6qpH/4uqCeOPqyyk9Yr+K7EFLI7e0jTTFo/RT1Jq7iRx0+ci3dCN93w+xdZQ3nlr+xA1RI7zD6CwcYiczLpw6jd3K9p9P0Os9JN2aupqEvAXX2AWR/87NfZeahy06E/xt4hw8w5ipPcH/g==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB3687.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(136003)(396003)(346002)(366004)(39830400003)(66476007)(2906002)(956004)(66556008)(6512007)(316002)(52116002)(5660300002)(36756003)(83380400001)(966005)(6666004)(6486002)(9686003)(2616005)(6916009)(8676002)(86362001)(8936002)(478600001)(66946007)(16526019)(186003)(26005)(1076003)(6506007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?6+WvB99hesrmr3H49YNhJw009bIId9WtrW+w3ntF7MXz/bBjr8xY5F+mVbXz?=
 =?us-ascii?Q?VcBX7CS8Vkj2wU3EBeh/pvPozIoIWC4efDSt2w0wUgB7ijdXaFJVK6hdYMdS?=
 =?us-ascii?Q?mVDz6zsb0eLu3XAdzK7Wi6qvEurYEACyNts7KTQCSez6fhiBYxZ2Yk3zyswC?=
 =?us-ascii?Q?ZjnYUqSLmBYpOo+Ia1Np7sDpHfuwKr2ARIaxtvEKK6qtOLaX8KuvNWOInkJd?=
 =?us-ascii?Q?PV4JbLyNjdy4Up70+lkrMwMU6R+TnZUGuM8nhnEr4XOKh5D0vAzo3GFl6iiB?=
 =?us-ascii?Q?rr7gnpE7mYOWCr4nx7FJC8M+x1dszjyBe0ORtfw9YlxQpVRBVI+HEhwO3125?=
 =?us-ascii?Q?E8qxLhHHYTmKo4ee4LDK0tj5hrh6CBfoc7N8vkPGEsLirUuI288QNSEN1JRS?=
 =?us-ascii?Q?tcBqQWTF/+IQl0bVG0AMnmmsHt7X/Ftkg5ELGss47onrAkVBKggOAWy7RyEW?=
 =?us-ascii?Q?T41/VW5gRBpSnNSe5PrBfM6Zb/hq1QZEOXDW7HzeAKSIhoPHV6cY9KR9w1gK?=
 =?us-ascii?Q?wuVl/KYrnMEoh27wuwHLr7p02cEtbKfFMue8JPhBLKE/38bW24ecefzCQJeS?=
 =?us-ascii?Q?GYmKazvP+9B1b6FlBVYGZg0TjE+ivPb9Q1Cgmzj/QdFaLaJNi6G9/4Tnjodt?=
 =?us-ascii?Q?4i48JU3dWnCvCdtH/2QZ3KVsQvmgfPjuMhlAZE6GI/U4kiodd6dOlt41r0uJ?=
 =?us-ascii?Q?FkTkGaayVwTpq8XOXm3OOMttynzrQCkLi3MH/y8qEJvgMCHiEtLjho0Uf350?=
 =?us-ascii?Q?icXTOOgpMTwILYalirVqd5Q5Pnl7vevl80I/RUFLwY9DjzaWOEEcvwoqOtzH?=
 =?us-ascii?Q?Vjw7tpBHWq60FsiKg/F6HiJoLB4E9SgLSObaBRld+Z9EVYytJQablZihr0hT?=
 =?us-ascii?Q?tEBbtPKcxSIp/qiTr4PBzjGLcl5gbtwll3QypUU/UKYMp1MVy0s/lWZUQ8AT?=
 =?us-ascii?Q?6ZxyPbMK+tBl0L2xSg6lw5h4ydMwKNscoMSPJgUAf28ffxE1sb62VcxdQD4V?=
 =?us-ascii?Q?XLJF?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a2adb83-d43f-4a9c-ab09-08d8bce5a985
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3687.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2021 01:49:46.1851
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TLDokfnAI4wRcEX4R5IujC+DQ/reuAGaEF4JUKq0iPRi1DBJ6LpfnmGEVl4Ql+vE1lK6Xf12J/Y+SyboVV7a8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4194
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Module 'time' had been imported in Functions.py by upstream, so not
import in 0002-fix-fail-to-enable-bluetooth.patch and update accordingly.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../0002-fix-fail-to-enable-bluetooth.patch     | 17 ++++-------------
 1 file changed, 4 insertions(+), 13 deletions(-)

diff --git a/meta-networking/recipes-connectivity/blueman/blueman/0002-fix-fail-to-enable-bluetooth.patch b/meta-networking/recipes-connectivity/blueman/blueman/0002-fix-fail-to-enable-bluetooth.patch
index 00115cfca..55d1ac94c 100644
--- a/meta-networking/recipes-connectivity/blueman/blueman/0002-fix-fail-to-enable-bluetooth.patch
+++ b/meta-networking/recipes-connectivity/blueman/blueman/0002-fix-fail-to-enable-bluetooth.patch
@@ -20,7 +20,7 @@ https://github.com/blueman-project/blueman/pull/1121
 
 Signed-off-by: Kai Kang <kai.kang@windriver.com>
 ---
- blueman/Functions.py                   | 12 +++++++++++-
+ blueman/Functions.py                   | 10 ++++++++++
  blueman/plugins/applet/PowerManager.py |  4 ++++
  2 files changed, 15 insertions(+), 1 deletion(-)
 
@@ -28,24 +28,15 @@ diff --git a/blueman/Functions.py b/blueman/Functions.py
 index 3b76271..c5eeb27 100644
 --- a/blueman/Functions.py
 +++ b/blueman/Functions.py
-@@ -17,7 +17,7 @@
- # You should have received a copy of the GNU General Public License
- # along with this program.  If not, see <http://www.gnu.org/licenses/>.
- #
--from time import sleep
-+from time import sleep, time
- import re
- import os
- import signal
 @@ -86,6 +86,16 @@ def check_bluetooth_status(message, exitfunc):
              return
  
      applet.SetBluetoothStatus('(b)', True)
 +
-+    timeout = time() + 10
++    timeout = time.time() + 10
 +    while applet.GetRequestStatus():
-+        sleep(0.1)
-+        if time() > timeout:
++        time.sleep(0.1)
++        if time.time() > timeout:
 +            # timeout 5s has been set in applet/PowerManager.py
 +            # so it should NOT reach timeout here
 +            logging.warning('Should NOT reach timeout.')
-- 
2.17.1

