Return-Path: <ckalluri@xilinx.com>
X-Greylist: delayed 7731 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 06 Feb 2019 10:46:33 UTC
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
	(mail-eopbgr800047.outbound.protection.outlook.com [40.107.80.47])
	by mail.openembedded.org (Postfix) with ESMTP id 9900C7C05B
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Feb 2019 10:46:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=jmmiEPKxfroL4e3/LzFLPa70oUIXZVoUZ5tzHDXXEiM=;
	b=0Nxa8l5FwcLu/P5nBA8YpQtm+2gpvDtWpCj1GMEN+zjKrejWq92k7piPBBYc7+UDpNC/o4Thk5rtxQQdWutwBqIWqUYgVJwyTza04E9rXWSOm8z/uTUOkAdFDlE15jCQ3bhdqJVK1d5KJWqI+ob6WawW3bUhjlxSjqEWnGqIDZY=
Received: from BYAPR02CA0027.namprd02.prod.outlook.com (2603:10b6:a02:ee::40)
	by BYAPR02MB5015.namprd02.prod.outlook.com (2603:10b6:a03:71::20)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1580.22;
	Mon, 4 Feb 2019 22:10:52 +0000
Received: from CY1NAM02FT034.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e45::200) by BYAPR02CA0027.outlook.office365.com
	(2603:10b6:a02:ee::40) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1580.17 via
	Frontend Transport; Mon, 4 Feb 2019 22:10:52 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.100)
	smtp.mailfrom=xilinx.com; lists.openembedded.org; dkim=none (message not
	signed) header.d=none; lists.openembedded.org;
	dmarc=bestguesspass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.100 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
	CY1NAM02FT034.mail.protection.outlook.com (10.152.75.190) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.1580.10
	via Frontend Transport; Mon, 4 Feb 2019 22:10:52 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:58531
	helo=xsj-pvapsmtp01) by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
	(envelope-from <chandana.kalluri@xilinx.com>) id 1gqmS3-0004N7-IX
	for openembedded-devel@lists.openembedded.org;
	Mon, 04 Feb 2019 14:10:51 -0800
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <chandana.kalluri@xilinx.com>) id 1gqmRy-0001os-EA
	for openembedded-devel@lists.openembedded.org;
	Mon, 04 Feb 2019 14:10:46 -0800
Received: from xsj-pvapsmtp01 (smtp-fallback.xilinx.com [149.199.38.66] (may
	be forged))
	by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	x14MAdVb006767; Mon, 4 Feb 2019 14:10:39 -0800
Received: from [172.19.2.12] (helo=xsjckalluri50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <chandana.kalluri@xilinx.com>)
	id 1gqmRr-0001oF-JP; Mon, 04 Feb 2019 14:10:39 -0800
From: Sai Hari Chandana Kalluri <chandana.kalluri@xilinx.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 4 Feb 2019 14:10:34 -0800
Message-ID: <1549318234-20497-1-git-send-email-chandana.kalluri@xilinx.com>
X-Mailer: git-send-email 2.7.4
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.100; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(396003)(136003)(376002)(346002)(39860400002)(2980300002)(189003)(199004)(54906003)(305945005)(47776003)(478600001)(36386004)(50226002)(8936002)(16586007)(8676002)(2906002)(316002)(81156014)(81166006)(426003)(50466002)(336012)(9786002)(48376002)(476003)(126002)(2616005)(486006)(6916009)(106466001)(356004)(6666004)(2351001)(186003)(63266004)(77096007)(26005)(36756003)(106002)(7696005)(51416003)(107886003)(4326008)(107986001)(42866002)(5001870100001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR02MB5015; H:xsj-pvapsmtpgw02;
	FPR:; SPF:Pass; LANG:en;
	PTR:xapps1.xilinx.com,unknown-60-100.xilinx.com; MX:1; A:1; 
X-Microsoft-Exchange-Diagnostics: 1; CY1NAM02FT034;
	1:G+Q4mRTlhrs7es4AHKRMIGMbyUemz6TjvyltvTXsLbwNy0yNWOhfh5mG0Eue4H1zmd0QBPnZp1Pg2OzFZKaBxzjx6d11ibH8QOZgbuMxbCgnjZTvDhvsjkHGv9Ie3ZkuUvmjYCgtgKxd8+2g/qb1WA==
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 28fc0ab6-c6e0-4f5c-d6ad-08d68aeda06f
X-Microsoft-Antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600110)(711020)(4605077)(4608076)(4709027)(2017052603328)(7153060);
	SRVR:BYAPR02MB5015; 
X-Microsoft-Exchange-Diagnostics: 1; BYAPR02MB5015;
	3:PtQFsckBfEVkzNkDhVnhLU44cvbVUnMkNuBUMIkwvqZUzLgzLBxjqOfdntylCWis/g9FjHwmph9rpRDKxtYOO885AFkh9L28tPJK1PyNpkvbkIsajmj7N9XN8xlNkfR2M9itPSWVmBqs5xDR030WMatF3tJ216qkamxpUka3hYzEyLNTcGMUMrgLAhGnFMt0vMto0EAs1KgPTh93B1zAlQSSJ1GmyAoQW4KzWlAtbMmrYkLQejNKzsHUPPDl0Erh4/BBXVQksWNH0xuFWnnKgUAocrh0D7AT+8xLKmtQNJoF85HxmIjkvhBWAZTs/ti2qktz7pvHEUwVnFoYnJy0iR1XVWde2tc6kLLHgipQlLMg7KG8gL7fOQUl0fMvcK+9;
	25:1hr+/uTroDnzmuXYUrWiu0w4nU45ZXiNB2mN7Ne5dSA5DGPA9gWkFkfg6YwXPeBSTP/PGKlK+goGbeB716cD0juAP5DkshQiB09hzuUDfCGbKRXUFoswdo3gaP6ek35vld7daTCOzw+L+D4yZCs7tBQjCL/Hnhx3LyYTATcA0qpHptdqzdfPPmd8KAMgCkM62CphKHbv7ZGZvG6tr3IA80YlPCGUYnl26URUhAoGVeEEe6ulic1GmqHzIR+2fE24EVxGRHJs2zEf8mpHcNMHCLodmFekf/rPyuzl5eI9zhVp12iHTwJO7AVCoYTOZdy/ajUBjgz8qCsPSkPk5l2rHQ==
X-MS-TrafficTypeDiagnostic: BYAPR02MB5015:
X-Microsoft-Exchange-Diagnostics: 1; BYAPR02MB5015;
	31:i80GCvYJouQ6D9Ku8jJzy+8jx1Pk7OwYP+dO65BMEcHmK+i96WPPCFwjZZBnjJssxw9hBj6tiisgX0LkAaHDrYHRYxwBcvSFdeGybtYHawpCmCzyrMxzNO+L6Uij0QTzNkNqt6o7FVRl6NojIC1+iEx8lqsqQbTBb1msq4B+gfhI0q9auFJx3r7KdjPWLX3PS9cClgjNxzV/xLRcqf0NgTMI3AoXqE7RFpjF5QTZk7M=;
	20:7PSLEgKVnZxmeULyUqve2P1M50CyKWUSPKjqHNaHc+HUBB2KVyXlwcFgkMajqo7B6o72YPQJugaDEvFX6blRCpxF3Lb95AHROpLdjPFv8RkX4AIK9ko0mlI0VMXjiBmpi5tAcxjX9s0j/8AAb5zj7uzcNZFSkkDPvFhViihWKk832JE87wSFSDZ3LKHugJVm70C7yrVMmRkKyLM74CHTro7ILxg7GWd7cwSmSbn0meAmGeSclbI6+FJoQ7kpuy7GZe9SfrEBeaIuKbri1f0NtRg7v3wSYvtMQvmms60xMHwVTtWcfPwy4ofieMFnPru0VZTLfMyaDaN66dP0yo6EG+y6Xx6JqHJYDPRmFbQRz93JKj9etbwu8mHrVeWw4PCuzwwhidEDufgENEbkqEqziFp+BL3WreXpmn5RiHOj03/zZostnahG57r3xP54QAxGzaQVuUlGfa5uZPp2TmIHzLcpXTH14vMxSVxsnRlbgab7iXexGX8GrryzC6ZvroYs
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-Microsoft-Antispam-PRVS: <BYAPR02MB50155AFC411D8E83773F47BEB06D0@BYAPR02MB5015.namprd02.prod.outlook.com>
X-Microsoft-Exchange-Diagnostics: 1; BYAPR02MB5015;
	4:qAt4SSwyjPF+MtidRHIxFkggx6wZR30Nu/EVbtPLu98nSmzoLFWMB52DeHBu6T+1uJkkyRF4p0zAG90MqOFByRghdi1SAD10sHnXetWoutaW64Ij4oFtOLyljMF/zdsIICU62IVNNZIIDhzg7n86PwE1fdPeVoijZCslyVx8P+/QVf8ERJBQbnpmndj/+hJOMKcJ9ccGRAn295ZMKLhx99fUlAvk065XSEkLQAwhxlke4eV2S5zd16I4NfUiesV8THR4IY5h34S8G66X8AK71333rj/kz7fLWqbwtbl2yJWPs1Chg8RdkVAQiZyVuKeM
X-Forefront-PRVS: 0938781D02
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BYAPR02MB5015;
	23:dpZBrqAit0/YPY7HgVQcQ+7IwA6J7+vpW2eRPS4Z6?=
	=?us-ascii?Q?P2Kg11UGZXDN/11/HpmvyKD/S4K+I9sk0kC1n9QR005Y81pm75W7mSQILp+d?=
	=?us-ascii?Q?YYKl4ik9PE2YD2iBnu107td7GC8gQICnvWwy+umgoGipbBzRd4EZb1fg3IFS?=
	=?us-ascii?Q?GUcC6zZ/eKnVnIKY6tzvwjxTv+WVFSjw7q3iftk84mImt4+NhC8LsFv847qG?=
	=?us-ascii?Q?7wmhZzNaAjKhKsnglN+9Y2wp4E2C5lp1UjgK1SJcDyAn4prHN0JzHG6OY6Hq?=
	=?us-ascii?Q?LAyJnITdqF3iYeIOtn4Pt7PFXAzO3FEI9M5OSlut7+Pb0hjEtd8hstVqskvA?=
	=?us-ascii?Q?Rxkywok9lkdkcjkdfAAGAgfe0jzHkphZCJMqci323a+Jv6OU+gT6W9jd25BA?=
	=?us-ascii?Q?39I8/dy7RyBx+mhr24U04eQPL6FmV9bE4GKK02rr8NCBwhT0j5CK5z9WTlzh?=
	=?us-ascii?Q?azWWsvtqfGeCTPU3GgyXTMJh/6suRaAGDEgwtUX9y1wTEbJ7HfI/U1gM6PSh?=
	=?us-ascii?Q?D/Cbl/1GhK562JLj2aiCvguQnEUzWe2B+M5sCbu60EmBljbC8p8i+3Duh2Jx?=
	=?us-ascii?Q?nQO3Ytbl3qd4aBE5uHgaeW+nGfJ38BL0WILd1QKFxCVqAiCVBZIP+ORtXh/N?=
	=?us-ascii?Q?0SkNqJPnQZ0np0WfDOEtieB4/Y7HbC3PtB+9DJ6DhtQQcyaU8skVapg2+raJ?=
	=?us-ascii?Q?dt33rbbJvwfl9ZjK3nDuNDiKWq9jSdRvzNva4GTECUBQkMYDHW05lJsUQIF5?=
	=?us-ascii?Q?A6CIQQx4FGIUj/3IbpvQah/TlQVt8C/hRRNqDfJyjZwVWHaKttNljO9UflRo?=
	=?us-ascii?Q?1bkVc9zKktVjKgmvFz3QWcbCII0k9EY3u1i2JuDB+MJHSublSh2lL8ah5CW9?=
	=?us-ascii?Q?/rNBCS8iTakNiIVYCg2CY1aggOw3L4wXvhU9Bnr7dAiV29gXeppLwREf1Y15?=
	=?us-ascii?Q?uh8fCwnBUPdR5osmK/pFIhl1rmGALz8ZgKP4ebyhyBlLKc0hoS3LTlQFXbTj?=
	=?us-ascii?Q?mLVK45z+9I3SK3fGBZaQSQMFlGs4HaLLqRzCYJF3Vc/d/ANKlsZl+MeS6TMA?=
	=?us-ascii?Q?1OJnqb9q5lephIKnGg6rqK5DBwk?=
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: 5pZylUW0bHh4NExxMeFnbsZi26QmogcM4ai8vAD5x7znSLKmxfkMNTG60DVKZbSN9O2+LBntyF2IrS7eacOyhjv1/IRCfoUKH9VbhkCkirwIqTBM9dK401zhaBNUe0ciFJ8FAFrl5WRUGPl4/M6nGaCv76IKffIRRUV6UhZtgxpuOkUJFY9xJG5hWNcTMTnw4OdmyAyDnGtkljabrXTjHEcttfpNy0aBBb/CmNle0ohVE7AcctwfdkmbPUfLO/YZZT8Dk5zwfi6b16wNXnz/oFe1Q9GRDtN0lSKGxvwmoCGKpFmc87AmdQ10Df3G2fJz+74Kp+U/G6ApySNHbfOulso6T4nkKB9H5w5cSdEvM0VyIjiys8s5JEupqN/BCpjF7EnIEi2RTjZi9uwMviaVvUxZBb7fk8vuEGEAQQTegpE=
X-Microsoft-Exchange-Diagnostics: 1; BYAPR02MB5015;
	6:V61qFV5Poy5nbLXwLjYQmp+rljT/fc8LHasvJabzg3mo2d/LV2m0I7c91Ac3bsF94+O2l+JjnaIyQeHU/d1gNR8TjUOzqPnMPYIIqsE73KDE2NZmmqKR6dp13YTjyD6WA+2A5t9G1JQ7Zjhhxhrxrz2queC2rAkufhyEBYjbG7+qSYNxFuuwoqAZ4KVLCHDaPOVaI4a4sCTRz5iuX7f3u0Gpbc+i5Zy9O/Pumzxed5E8J17OobAOt+p0eKPTBL9eKa41kbn7AJCGdjMaKorNlt2mmpukN8D7kOqqdwV/5dEnYPe1edOxsePqLt/7+7GCSRJ8xOdNCaU0nfolIqb5PaOi9W8aVtLkZJbJT4KGLgU/DcNDaAxgmWCglr3XjkO8dCE3vkzewOrDNzTIMCmSaSjxR8rtQTQxod0fZ2g7ShlktuvzrkbdQjsHu4CFkI1C6lc7HWKQsYo1FqctuYm07w==;
	5:wAXz9JMYcDbPxGwxr/J+SNyG6zAev3G2aNT5OtbsMKtiNL/CN7myvoWTxtV4BMtbDcXF2wKZVR8WbrqQ+MnwJHtYshmfb3c1XestIQPB4A8soyzt9sWuSgOTH03lErnaJs6SAC4Y95MY8ReQEtA6qxQOxYu2juPRNCir6ohFB3LCUJ1hELoI2nrzh9/Q8qYHA6SU+1ouItDkRKQ7r5AG5Q==;
	7:QMq4UttehElcFBLShidkMl0/2ag88tlSWACcRw+8dLbkute4JPojBWwkglRdzy1RKH30sK17HPUBKbZ3ONiD1m1SUtvMVDUi/EUsDWTQwey3vHEN0GkTGqeg5Y5f11sGVJnfnD3vQ/fxSsVEwY2S3A==
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2019 22:10:52.1819 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 28fc0ab6-c6e0-4f5c-d6ad-08d68aeda06f
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.100]; Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB5015
Subject: [meta-python][master][PATCH] python-requests-oauthlib: Recipes to provide support for Requests-Oauthlib libraries
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
X-List-Received-Date: Wed, 06 Feb 2019 10:46:33 -0000
Content-Type: text/plain

Yocto recipes for Python Requests and Oauthlib libraries to provide
easy-to-use Python 2 and Python 3 interfaces for building OAuth1 and
OAuth2 clients.

Signed-off-by: Sai Hari Chandana Kalluri <chandana.kalluri@xilinx.com>
---
 meta-python/recipes-devtools/python/python-requests-oauthlib.inc   | 7 +++++++
 .../recipes-devtools/python/python-requests-oauthlib_0.8.0.bb      | 3 +++
 .../recipes-devtools/python/python3-requests-oauthlib_0.8.0.bb     | 3 +++
 3 files changed, 13 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-requests-oauthlib.inc
 create mode 100644 meta-python/recipes-devtools/python/python-requests-oauthlib_0.8.0.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-requests-oauthlib_0.8.0.bb

diff --git a/meta-python/recipes-devtools/python/python-requests-oauthlib.inc b/meta-python/recipes-devtools/python/python-requests-oauthlib.inc
new file mode 100644
index 0000000..4bc6a36
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-requests-oauthlib.inc
@@ -0,0 +1,7 @@
+LICENSE = "ISC"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=22d117a849df10d047ed9b792838e863"
+
+SRC_URI[md5sum] = "4358a879a4377393bcfd37d0f9ae6d4d"
+SRC_URI[sha256sum] = "883ac416757eada6d3d07054ec7092ac21c7f35cb1d2cf82faf205637081f468"
+
+RDEPENDS_${PN} += "${PYTHON_PN}-requests"
diff --git a/meta-python/recipes-devtools/python/python-requests-oauthlib_0.8.0.bb b/meta-python/recipes-devtools/python/python-requests-oauthlib_0.8.0.bb
new file mode 100644
index 0000000..4318915
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-requests-oauthlib_0.8.0.bb
@@ -0,0 +1,3 @@
+require python-requests-oauthlib.inc
+inherit pypi setuptools
+
diff --git a/meta-python/recipes-devtools/python/python3-requests-oauthlib_0.8.0.bb b/meta-python/recipes-devtools/python/python3-requests-oauthlib_0.8.0.bb
new file mode 100644
index 0000000..1294661
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-requests-oauthlib_0.8.0.bb
@@ -0,0 +1,3 @@
+require python-requests-oauthlib.inc
+inherit pypi setuptools3
+
-- 
2.7.4


