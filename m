Return-Path: <MANJUKUM@xilinx.com>
X-Greylist: delayed 11613 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 09 Aug 2018 09:28:15 UTC
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
	(mail-by2nam03on0067.outbound.protection.outlook.com [104.47.42.67])
	by mail.openembedded.org (Postfix) with ESMTP id AC47F748DD
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  9 Aug 2018 09:28:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=pceYGc0FInqMluyCGFwn1ngUGsdHhQ6cHGkzNgpnKwQ=;
	b=m5mJrXOaQz/yUfo2e/STdmpqo8nyQK/aBl89/F00MpGNB1tO0eRoPyeqQWdYRjV24S0nk/FOv6BQ9e5QuntGOP2SuUiaiNDLGTrML+GZbN2xnuy8/mn1tTxaVQg9GfhuRho3BAc/34JXb0jpc/+dTE2QtVFwiASB2mSSoDj5yPQ=
Received: from BN7PR02CA0017.namprd02.prod.outlook.com (2603:10b6:408:20::30)
	by MWHPR0201MB3513.namprd02.prod.outlook.com (2603:10b6:301:77::10)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1038.20;
	Thu, 9 Aug 2018 01:38:57 +0000
Received: from BL2NAM02FT047.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e46::206) by BN7PR02CA0017.outlook.office365.com
	(2603:10b6:408:20::30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1038.23 via
	Frontend Transport; Thu, 9 Aug 2018 01:38:56 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
	smtp.mailfrom=xilinx.com; lists.openembedded.org; dkim=none (message not
	signed) header.d=none; lists.openembedded.org;
	dmarc=bestguesspass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	BL2NAM02FT047.mail.protection.outlook.com (10.152.77.9) with Microsoft
	SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.1038.3
	via Frontend Transport; Thu, 9 Aug 2018 01:38:55 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <manjukumar.harthikote-matha@xilinx.com>)
	id 1fnZug-0006vO-Dg for openembedded-devel@lists.openembedded.org;
	Wed, 08 Aug 2018 18:38:54 -0700
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <manjukumar.harthikote-matha@xilinx.com>)
	id 1fnZub-0000ZZ-9v for openembedded-devel@lists.openembedded.org;
	Wed, 08 Aug 2018 18:38:49 -0700
Received: from xsj-pvapsmtp01 (xsj-smtp.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	w791ciED022734; Wed, 8 Aug 2018 18:38:44 -0700
Received: from [172.19.2.216] (helo=xsjmanjukum50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <manjukumar.harthikote-matha@xilinx.com>)
	id 1fnZuV-0000ZO-TN; Wed, 08 Aug 2018 18:38:43 -0700
From: Manjukumar Matha <manjukumar.harthikote-matha@xilinx.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 8 Aug 2018 18:38:41 -0700
Message-ID: <1533778721-28693-1-git-send-email-manjukumar.harthikote-matha@xilinx.com>
X-Mailer: git-send-email 2.7.4
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(376002)(136003)(39860400002)(346002)(396003)(2980300002)(438002)(189003)(199004)(126002)(9786002)(51416003)(7696005)(50226002)(8936002)(36756003)(486006)(476003)(106002)(48376002)(2616005)(426003)(336012)(316002)(50466002)(2906002)(16586007)(4326008)(81156014)(81166006)(8676002)(26005)(77096007)(305945005)(6916009)(356003)(2351001)(5660300001)(186003)(107886003)(63266004)(14444005)(36386004)(47776003)(19627235002)(45954006)(72206003)(478600001)(106466001)(6306002)(107986001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR0201MB3513;
	H:xsj-pvapsmtpgw01; FPR:; SPF:Pass; LANG:en;
	PTR:unknown-60-83.xilinx.com; MX:1; A:1; 
X-Microsoft-Exchange-Diagnostics: 1; BL2NAM02FT047;
	1:nEuHSbrSU6EMbeVx2uEkQbQLoFNGeU2ZaKTrLGq8tzV17p42SXYpbRYkn+E8SnfJxaXRwHeoE6NexX/961a1ux04hB4WcxBp7X3qpbWDX2GAhzKr1oQz1x5KNH0S8lh4
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a3380a80-8e1c-47a4-3ce4-08d5fd98ded7
X-Microsoft-Antispam: BCL:0; PCL:0;
	RULEID:(7020095)(4652040)(8989117)(4534165)(4627221)(201703031133081)(201702281549075)(8990107)(5600074)(711020)(4608076)(2017052603328)(7153060);
	SRVR:MWHPR0201MB3513; 
X-Microsoft-Exchange-Diagnostics: 1; MWHPR0201MB3513;
	3:jn9QdG+4T4JBvYF1mTwF0O9tMRS1XbNtcHrr2DTilXGF4YcBQfbh9o7LSh2a8jPnv7PMV9ETquuKZr756F3JP/DUVLA+C8K6VLCcFH79JeQkjlOTT/wAVJqJnjrue4ySQGfU/V7ewJ1X5UzBCs7uor9tafe8eEmAnQdKzTlX5WruAQHt9x/XXa18tZ6T0GHYkE8HDQ+vMmrATnzZMDgkZLLgjy5NGwD61gefMcefnAS68d06MtqmgFMpiNZC2bGxGCfAXX1ViDKLvqW8ybfhiqSfyoaPJbr0p5HlHQAjzn2UH4lJDZWxo9j+EHMoS7kBHNUhuSQ5yzHwCaNGJk6DDfiKRAODhG/xdNlMQ08ZfWo=;
	25:kDHqB+08J44UkkRaopSCuudcRMl8GUsDh4/l0P+U2v0ANWpzL4CSJ9Ofbd/sREJuKz4a8ljF00TpSVM9NbqN72faxETDEoetQcpAcg8hbGb1d+0LQB5gBKFeiKc/n30G/+m2M09T0knNM3BChzvwk6i3dP718BNbsblWeNryKcRU+kQy7b5a+N53JyGHqvHOq9IVN+VEef0doMX+sTKHTLt6Jzwpacsc7h+cz14aFkerSpvENgYogl39MFz7zQ9vgB/RKy7/tC9BkxBHLdoZH0v3chCjS7mzlSKQnOAa0sKVQut92z6ohvxBu62PJQaipuTWUpEP0NL3q1kiEZiyUw==
X-MS-TrafficTypeDiagnostic: MWHPR0201MB3513:|MWHPR0201MB3513:
X-Microsoft-Exchange-Diagnostics: 1; MWHPR0201MB3513;
	31:8gEbvEOZZbmTj6eLcJba5N/EYHseCcmSgXIZQgbxFuUFxrNeizOxC7AoLGnAfktPEoPe6G35vMK2v/qn7MkRW0U4VUnS761IeSV6hltS4CqbYpfce+O4HjyCKB44hMzMwdj998eU/9Ez2bL2l0BP9svh5JLwooJSVCn1Hqt1qzT0V4j/E9kQFA1LR8SriQCS/5T5DAlwuwg62c4M97gA37BdhTdCG3j4N1GpLXhvo6A=;
	20:FHJmSGV6vEVZdJ+6ag3aoVKjFgCeTb4g52yC2qEJQQaluxs/7vVMffuB9IvtCxwI1Xafe2MBq17KCTzAxo0kN9JG3EeynkI7FgqxhM7ic1wqAeWfWIEHmWZGaEcfW29XbEwDeOrNtIpuZSuxBa9ZLr3ozrNW6Ju8C+sWYna8VyH9jyUJqd/GwQsPbuzjTdw2PK27beanNWtADsM2rwmVFR4nzWGSlWxgnx2xexEBT6a0etF3w3Y0+clSo8QWUFXe6iqMF4XgeYkReQK3AQyqZq42QBd3jnRUjDUyhk6flLnFLf/jP3M45WmKNZVrdYlg8ldSmdq7tWxqMLCXuVjtFonbqKeUCjP10CZ2wz4zU6VmYlhkOtmxUM3LFeFj8h2NDTT6zRNk78tGWRMiWuKSg6rp+ty0wymRaD8T+beR4fClW4xD6WUzymleCgjJiRjsnoR8JTnDdOAKltuZfwQgEPl6PKEoLYlpKb6spdFCu3Qwq8jedH6aRO20GkF2sGFR
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-Microsoft-Antispam-PRVS: <MWHPR0201MB351359F7AFD8F98C58CD264EB9250@MWHPR0201MB3513.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(192813158149592);
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(10201501046)(3231311)(944501410)(52105095)(93006095)(93004095)(3002001)(6055026)(149027)(150027)(6041310)(20161123558120)(20161123560045)(20161123564045)(20161123562045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(6072148)(201708071742011)(7699016);
	SRVR:MWHPR0201MB3513; BCL:0; PCL:0; RULEID:;
	SRVR:MWHPR0201MB3513; 
X-Microsoft-Exchange-Diagnostics: 1; MWHPR0201MB3513;
	4:0cL5g6iEkca/vIT7g/ooa8ciGwwR5Ht6WqszQQEDkrH2qAGL38X0MW1ezjNl0zDnIhbCVVtr8M+vixW/S8cwz7lGaF7avZHwZpbE0rrRjqatDqWNvjMPq6ZGNTwlCOBM9SsH5LGutwOLDxcyfjO7uVJi5ybKjkryktpExE6fSvno5bcpFD+KrXBJY/Vnok2jjuqwcRmgd8cahWr3lkcIoLz4iixG2P5DsgFHZMsMY6fuwieFXPQnb7stv7oFPqzgYKlQTzq6TPbDLwueCo1pqnUktIn2EduSh908mzC8/RvxJ9r3iAiWURHIBBkEBMaj
X-Forefront-PRVS: 0759F7A50A
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; MWHPR0201MB3513;
	23:WBeDLWFL1P6RS3SoiSyMoqIOpGG1pZa8w3Qu9JM?=
	=?us-ascii?Q?rX/2WYgHwVmTOKW1N1O8Z5xUZ8z22zY4TsirzugFXiGF0WUL6KbKRuRei7Mx?=
	=?us-ascii?Q?K5CDZHZxk+Ah0xS4xZOKCqdbf2eXBeLP5I+ddDQPeClBtUDkdoeZEgoJSPPg?=
	=?us-ascii?Q?162PE6nUtpwJ4DM+LYGjMDp1hBJk8seD+pjLikReBCD/FcsalwmX0OVgwcHs?=
	=?us-ascii?Q?PRRVYlM//Pc3VJf/8NXGrLAaUu8f10l+JumU3lcJX70iRRa+FZrPmImsqxyZ?=
	=?us-ascii?Q?nAUquR8hyu53svhoOku4RfhSFj3pM0x7VdzI7tqtBPwH22F+VkSmKAVP0jvT?=
	=?us-ascii?Q?ZTTUwv523kEvmpZtYaS5sZjNhHuHGFsNrvhFJ6EH6HFiRZY2LRsx/7tUmwfe?=
	=?us-ascii?Q?Q9S0IWrq0KsVHrbjfxcVbMw+ZUshAL0LkYO+3EACsf9FjNtc3gcFGvYeLscK?=
	=?us-ascii?Q?IjlczkU4oqn7y0Cq6HhxHylFaw8e9monGzRhlNRWoGf88zfVefkIDe3JM+i5?=
	=?us-ascii?Q?BXQ2E29txKflrA62/U31Pl7/YctbCcMzIM025OBuEIf9AST73opNHahC6+Sg?=
	=?us-ascii?Q?pBoUtNi6KXJrpLaAOyzrAAUO24KMNcSgrr6yiFc3W6OJ69ndH3sWUcFdRTT/?=
	=?us-ascii?Q?JOfPAL0tCXAZS3AASUcftr1I6Tu03o3MuTg1xEN/XaTTlFQM+F9SoimD6EMP?=
	=?us-ascii?Q?e7hy8UEXoqErFjRf8JDaAzDCyC3W/IHOMJH4PLUtJUlTcVR8VIZ7ZheuHnAG?=
	=?us-ascii?Q?AfAPYe/lcV5jZFA05Z8jXtS6JzSaBXcuUl8bOpZonGrV3rgELaYfBN+OchWT?=
	=?us-ascii?Q?KZoSqc7gU5kIBZvbQ2XDh+dpYcRpp/48ZMnSn3MDstNkOiWxqoHhI2JQFgrW?=
	=?us-ascii?Q?Rlm69BwifZGc7+Bs9FYajVVDu/FIDgMoKDw+u5DriivEL4lv/0uQOcqSHhIh?=
	=?us-ascii?Q?B5NnHxBl5ACp/8BFwk2fgcZi6zNLm0vawwkDO4ffYXGHVpG7Hc8sl8PFQOvW?=
	=?us-ascii?Q?WUB6USu/p4RYhePprtIDzWboLpH4Lb/1qmsrBcT6joWU0JHAPjPA4JnJ3Dyq?=
	=?us-ascii?Q?f3EY50IOwCEjtXrwUeKKAmIFcUbx3s7FTbS2pu+V6h4LTAldXOxo9XE2Bpuj?=
	=?us-ascii?Q?tQGAxsfHltDO2jutA/tGDOPT7+ZNI8PgB?=
X-Microsoft-Antispam-Message-Info: +28J3O+/L+yBFoawMRevqeoyqtBQR3bgfPzkLC8AxGwLu3yUcXz2x4kImSgGWp5HGJ9Wi5vRmMGh2mWOCpMDmW7UdALzy3OGvN7imlIkbgPwxaE8lOQZlPXA8BbE8JMWreI++X1aijWeyVODItgBh57JQEExVWIIJva+eyN/kFdl69hCRQfu6IrKxRr/IdCzKCs0PjJQH3MNM7Bza+XUF09dvxE/ibjWZxjpxIjwx+XNhdeq0Sq7fQENjsdxTP3YGgILLVX3jZpecA06mKxbilkmzcoAmPazdVmSwpQOCU2huOySXJal/njUhCskPbdil7GXKLOHJ73TMYZgdpQnw42AVjMB+9dS3yZ80vhENds=
X-Microsoft-Exchange-Diagnostics: 1; MWHPR0201MB3513;
	6:JWchoZYcmLGIKGoRfAzm6wq/CB4s5lHONRKnB2ZZexcyBznWDLiQFN/mGTl+NnSZHXKbCrRJs/VpNGqokeFjlkCanAQFOaZShoXIdPdAjNni5Qb3gTuSRna74ExjiMVdnqo84jvgrK0WkKet63S7WEBFgvWNae6Vxm9Ak/+iiHVr5VgnkG0wQ/HZtoPXn0m1yTHTyJc9jBrRI19oWZ2VEN0oKOQNS1tywiw9yzPWj1Jz63Z2F8B5qfBNtA8GKb0IAGfZW93iDhbfe7fzGWOWJ9sUW+tLYBcJxDqFvvHzGaIlPDjzjnq4V4tpCkQq34h1soOGhAWfE2RIc4K5YjfnUjKrX8aEKzculsbNwKL/pKyCi5B4U528LnGKBPZne4S3xHtw6tViF/J8ouwMEevRl+Hry6C0KFLSXTDKz87PzDiQ2RyB0ooOsZ9izFvjjFfpZ1FtE/grmLCIhYuwNwyxfQ==;
	5:u9DEke7wjocb125Z4Cx/fF+2Or5duQeXu9qR0I1T8pvi1b+sfqdfOwUpVRNAK98MgadRscL2FlmVTPrY8bEw5rgC0MiP1tXKEmw7fI3sua5HziH+QCKfqp83NrBt+mvOVclMz5lwt4HtFcP6vTzzeJ4Hq3AZaa5TxdGADCRniNA=;
	7:Vc8ngW1g/uw9GVz6BFKCCUGFMLsSLhc8pYCk/NM5xna8HPjYadPAG9W/H1xSfym0fgB7ib0HXPHTKD1+ra4xtGqkpvnkDSKp2mJn9O5JmgnR+vAreTtZrGFwElOCPHRizTRi/OexnyZ62ScXimDQ1tQLf/cT5Hm399jxktbFJRqx2fzMcUojJR3Fjnla5kRpQXv03iVJIgDCilHfhTTLPfuU3yBX+n6jxwpDolfdeXyQ/NV24h9bsU0duTeUc85h
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2018 01:38:55.3297 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a3380a80-8e1c-47a4-3ce4-08d5fd98ded7
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR0201MB3513
X-Microsoft-Exchange-Diagnostics: 1; MWHPR0201MB3513;
	23:uNE5BYaRqywQx/LFjPvFwlyGN/a5UkzONjvqa458Gnn+6U/K1f5UDc+3FeMH2j5gHgMmrK5atdOG9PhR/fUE9gspIR+VhXf45NGIQEF6D6+EtylvLwYFazA1R0rIubUzEZrF7E8PGUvKAiSU3wH23g==
X-OriginatorOrg: xilinx.com
Subject: [PATCH] wireshark_2.6.1.bb: Fix the configure error on git describe
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
X-List-Received-Date: Thu, 09 Aug 2018 09:28:16 -0000
Content-Type: text/plain

This patch fixes the following error during do_configure task

| fatal: No names found, cannot describe anything.
| CMake Error at CMakeLists.txt:3086 (string):
|   string begin index: 1 is out of range 0 - 0
|

Using --always is a fallback for fetching uniquely abbreviated commit
object

Signed-off-by: Manjukumar Matha <manjukumar.harthikote-matha@xilinx.com>
---
 .../fix-fatal-no-names-found-git-error.patch       | 23 ++++++++++++++++++++++
 .../recipes-support/wireshark/wireshark_2.6.1.bb   |  1 +
 2 files changed, 24 insertions(+)
 create mode 100644 meta-networking/recipes-support/wireshark/wireshark/fix-fatal-no-names-found-git-error.patch

diff --git a/meta-networking/recipes-support/wireshark/wireshark/fix-fatal-no-names-found-git-error.patch b/meta-networking/recipes-support/wireshark/wireshark/fix-fatal-no-names-found-git-error.patch
new file mode 100644
index 0000000..80119e3
--- /dev/null
+++ b/meta-networking/recipes-support/wireshark/wireshark/fix-fatal-no-names-found-git-error.patch
@@ -0,0 +1,23 @@
+fixes
+
+| fatal: No names found, cannot describe anything.
+| CMake Error at CMakeLists.txt:3086 (string):
+|   string begin index: 1 is out of range 0 - 0
+
+Use always to circumvent the issue if git tag is not present
+
+Upstream-status: Pending
+
+Signed-off-by: Manjukumar Matha <manjukumar.harthikote-matha@xilinx.com>
+---
+--- wireshark-2.6.1/CMakeLists.txt	2018-08-08 18:18:05.388318652 -0700
++++ wireshark-2.6.1/CMakeLists-fix.txt	2018-08-08 18:22:27.829670496 -0700
+@@ -3078,7 +3078,7 @@
+ 	endif()
+ 
+ 	execute_process(
+-		COMMAND git describe --abbrev=8 --match v[1-9]*
++		COMMAND git describe --always --abbrev=8 --match v[1-9]*
+ 		OUTPUT_VARIABLE _git_description
+ 		OUTPUT_STRIP_TRAILING_WHITESPACE
+ 		WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}
diff --git a/meta-networking/recipes-support/wireshark/wireshark_2.6.1.bb b/meta-networking/recipes-support/wireshark/wireshark_2.6.1.bb
index 91c5e96..b001bcb 100644
--- a/meta-networking/recipes-support/wireshark/wireshark_2.6.1.bb
+++ b/meta-networking/recipes-support/wireshark/wireshark_2.6.1.bb
@@ -10,6 +10,7 @@ DEPENDS_append_class-target = " wireshark-native chrpath-replacement-native "
 
 SRC_URI = "https://1.as.dl.wireshark.org/src/${BP}.tar.xz \
            file://0001-Add-libm-to-link-for-fmod-API.patch \
+           file://fix-fatal-no-names-found-git-error.patch \
           "
 
 UPSTREAM_CHECK_URI = "https://1.as.dl.wireshark.org/src"
-- 
2.7.4


