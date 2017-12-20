Return-Path: <chunrong.guo@nxp.com>
X-Greylist: delayed 1992 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 20 Dec 2017 06:19:15 UTC
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
	(mail-by2nam03on0120.outbound.protection.outlook.com [104.47.42.120])
	by mail.openembedded.org (Postfix) with ESMTP id B8FC471AD1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Dec 2017 06:19:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=freescale.onmicrosoft.com; s=selector1-freescale-onmicrosoft-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=N8IXZBAxpR1D0CzQdq0QP/39KUvnOdhpADLCFflSZHM=;
	b=Tzts5mXDib1B4zjvUnqSJ5EQOblNbvWQZKhXpX0Z2OjXOHsEAUlMMqXfK/q9G+4+uh/P7gyVptAqSjg95GQyVVwvEs7fpx5/rWdio9ldbNPHd9Eeu+FPueJ61B+xMTIie2UQ0YqR4+DjrXvMsDSOlTjuHznXwPm8tzssGnDndQU=
Received: from CY4PR03CA0013.namprd03.prod.outlook.com (10.168.162.23) by
	MWHPR03MB2991.namprd03.prod.outlook.com (10.175.136.148) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.323.15; Wed, 20 Dec 2017 05:46:04 +0000
Received: from BL2FFO11FD024.protection.gbl (2a01:111:f400:7c09::152) by
	CY4PR03CA0013.outlook.office365.com (2603:10b6:903:33::23) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
	15.20.323.15 via Frontend Transport; Wed, 20 Dec 2017 05:46:03 +0000
Authentication-Results: spf=fail (sender IP is 192.88.168.50)
	smtp.mailfrom=freescale.com; nxp.com; dkim=none (message not signed)
	header.d=none; nxp.com; dmarc=none action=none header.from=freescale.com;
Received-SPF: Fail (protection.outlook.com: domain of freescale.com does not
	designate 192.88.168.50 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.168.50; helo=tx30smr01.am.freescale.net;
Received: from tx30smr01.am.freescale.net (192.88.168.50) by
	BL2FFO11FD024.mail.protection.outlook.com (10.173.161.103) with
	Microsoft
	SMTP Server (version=TLS1_0, cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id
	15.20.302.6 via Frontend Transport; Wed, 20 Dec 2017 05:45:50 +0000
Received: from sun.ap.freescale.net (sun.ap.freescale.net [10.192.208.75])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	vBK5k0OB021916; Tue, 19 Dec 2017 22:46:01 -0700
From: Chunrong Guo <B40290@freescale.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 20 Dec 2017 13:45:50 +0800
Message-ID: <1513748750-15017-1-git-send-email-B40290@freescale.com>
X-Mailer: git-send-email 1.9.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:192.88.168.50; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10019020)(39380400002)(396003)(346002)(39860400002)(376002)(2980300002)(1109001)(1110001)(339900001)(199004)(189003)(36756003)(85426001)(48376002)(97736004)(2906002)(6666003)(8936002)(42882006)(6916009)(6306002)(50466002)(77096006)(68736007)(53936002)(2351001)(8656006)(51416003)(575784001)(105606002)(104016004)(81166006)(5660300001)(498600001)(106466001)(305945005)(8676002)(81156014)(316002)(356003)(16586007)(966005)(59450400001)(47776003)(4326008)(50226002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR03MB2991;
	H:tx30smr01.am.freescale.net; FPR:; SPF:Fail;
	PTR:InfoDomainNonexistent; A:1; MX:1; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; BL2FFO11FD024;
	1:1Zm7BKzSDnJHBaSfvPymALEKcYRLXw8+wY2O5TOwLvo/vunoEqhcS9d/rTyWSLUACmkGPHmtet7JKxxPiImyGdMYyT5mwszFdM0Zv0BoB9CTRsSXTNL5xbt/c//FsqfG
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3e04e7be-d569-4fbb-0be5-08d5476ced36
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(4534020)(4602075)(4627115)(201703031133081)(201702281549075)(5600026)(4604075)(2017052603307);
	SRVR:MWHPR03MB2991; 
X-Microsoft-Exchange-Diagnostics: 1; MWHPR03MB2991;
	3:rOiUFCVuLd9tZPTKKLxWEG8chwiwYBZ32nLdi33FRK2f2r6BiQxl3nO8vzlBhEy2EEqjrzi1CXbtYm1zae/DCg9Tk2fNk/c7IBKmbcNAYdxbaCNnJ77u11jnvMaqXKFpd8lzVYjAube9RLtWtEdn3feILoPKGr78bpkOrtw418yhmoWn57lCPG4tgC+woTMz7byvQlZljF6hDT6GC2do/xSfKd99P0tR2rAcZFcF29NYNeVNljtLC9EJT+KmNj8u0asPQSd2EPrY5WgUeLkkAl0mphnkibTjz8KL0ng/6VC9NnmsaV2fI/zMzHVBkr/GyMiOw7ICPkkv7iET0ZC/qmwbvlV/F+O5vN+7U9heGOM=;
	25:MAECw1LVYdOiXVCHFPL1IWGOFa9U/jwqM031HulnlbFxEdXBjwdKEC5r3letSrdjQM59lRcNl0Kggb9F/lWEtwm/K7g6+xnFfH9V3BbHShbeKWcMzF/pEF7PeDmNlt3AJSX1bin+ejn8kuEwuBv8MMsgMyNLRZ3GKrVUrtWlcxUWK2tlkll8c4bZWBme5otE59ALoAurwJuwy0V9vL5kuBft8VGcVgR8fIc3HMkkgeWl1llekwMnpYHL7DDwbd8yK/d5UnL/WOY0nTkm84IEKxaGz7WBQfdfOMqrWJlzNiG9uouCPqft3Fw5KdWNx/rC2aQDlp4FNt5KQpfhZvvb+A==
X-MS-TrafficTypeDiagnostic: MWHPR03MB2991:
X-LD-Processed: 710a03f5-10f6-4d38-9ff4-a80b81da590d,ExtAddr
X-Microsoft-Exchange-Diagnostics: 1; MWHPR03MB2991;
	31:UZH39YcSB+L3bdvRKXuZ68oxaqUXjEh6mQf//Qffs59vYqFl4oZfpt+qatFwiHZ9WuVHiEmk3UbITquAkOHuDBFQvULtEVCJAgxGzs/pP4p6xPORVWwUqlO9qhMemzXeAJJl4Taxb8o5pO1388T9E0sN19SZmuNHsVsLh2QppcaaiQ9yGtbQ67TRCnb5qCCnwnor+1zMMbdr2J3pO2rqkwOHF50bwRLLwO8VZi1tgxM=;
	20:A4ulm76zSwlgCWfu7MnBeBSNc3cMHDDU0cTc+8P1k061ZkrZtn4DKZKuPAMTwPvoTZa5jSJl+lS6DggjK9EeIwmqvnL+OFvssqy/GoduMWJ9F5X8ugpZV1FcZ4XpGAnile1GbO5GrkD4JAlWV50RPkBoJ9PDXNcupX6C1jWFaxXDpLTq0HmDhVCTT2b995gUE5IjiqsmGqwx4SR70+xAsdPBmMG1rg+y8VTFICOTtINqj+yc6ne7KkLYGFxzhzvdjtrmKmBUiuaQN83YyX4Bxp3OyvJefnh0ZxPWOCMyjfxl2hq9JCmSgHS+L9I6R+xqDosKUrhkl2mw3dF9E2DEMscF9Y8pQoRFSvH+1NsQMoV4FAzDd252Qw8Z3zjncpQN2Pam8znfuVbLJky9GCsQoT7e/c0dvQRNnGsTFY4MFjoXJp9g3y/hSEXLigxOeKXtkCF0vbmSyc2VCdE1MWWCEIb3je+83SDbEBrSg+1OLYEWnSfEn9f8M+cOVIFGjrU/ZlmXA5YgSBHPXrcmUNdNFErIq5bz7O8jvm76oL3i2uZcTDhHyaA/+/yURBALnJjz6+5fc9Lii8Wrl2sTDBPTJC6Ufs8vUmn5OB2L/cE9yc8=
X-Microsoft-Antispam-PRVS: <MWHPR03MB29916066540620C45A737DDE840C0@MWHPR03MB2991.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(158342451672863)(185117386973197);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040470)(2401047)(5005006)(8121501046)(3002001)(3231023)(901003)(10201501046)(93006095)(6055026)(6041268)(20161123560045)(20161123564045)(20161123562045)(20161123558120)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061750153)(6072148)(201708071742011);
	SRVR:MWHPR03MB2991; BCL:0; PCL:0;
	RULEID:(100000803101)(100110400095); SRVR:MWHPR03MB2991; 
X-Microsoft-Exchange-Diagnostics: 1; MWHPR03MB2991;
	4:TDRO9ghIgRzxry6NHztnUFchzwpZkeVLrLQ7vE0Nv4FORcxzxE9/hTpE8sy7pxY8yi80XuWeZNWKwfSRrppo3ff7fuIC50keIfeYlvJOaflQuIBeB2LbTOaqHVBYLfCWdZY9Okx7xnrKMUDjF2tC7OWZDO02GRDZvHfeoCzj4NWHs3gzZI4AMYOpOgB9lMpDNdJbxBjWsrhPlHeuEYwQMRPYrheS+n2wlDkvP/E/DCQfC3n2qmtL69QDPH01ZGmLv2UPDWCnTVmkz+JoWB1/VyGTQ6sAg2ZJH+EyzkMDMNuYxDLhaKGC16u3IUM37D5aGbDjTqXTKizmkrh9s9N/mwld6W+SwVIqsRozwniHWec=
X-Forefront-PRVS: 0527DFA348
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; MWHPR03MB2991;
	23:jEkCiXGo+ih2YZm00ERavc5GuLHs0FL4AzQqpiHJR?=
	=?us-ascii?Q?WOwqr9Sd9avQGOKskpJ/9BUeJJirz/oGkuUbzo+05t0doiUUSePXriKPBdto?=
	=?us-ascii?Q?f86IKQAkjXKrDYSAlbSR+fPIhIRcWDpqQ5GouZKeh3F+hQXJoq4lODP83D+a?=
	=?us-ascii?Q?89R4Kna/enuQtgyMSvNXMWi3RVEyimJyFd97nLxsgKjaVv37jWS/s6Pb5R8Y?=
	=?us-ascii?Q?1RQKcwHzxsPveU2hk9tcjzGrvUe/1tEtj3vLBph42Dn9SQ2ye3PMtw1XUIgm?=
	=?us-ascii?Q?Hb/lgXdIZgVde6aayn1JI3qPtNao921ODnl3LcBtBXZxYdmJt8M8yY1zQWab?=
	=?us-ascii?Q?8K5KZls5XDTT2akeozfwk+juD15Rr/loOM4za5SOQfzALha/wiWjH/RUoPWY?=
	=?us-ascii?Q?AhjHlRSf1U2hFf683j8nzpIMaua8a/C9XRKUFJ2CGJaiGqN/VNEaisYNL/dh?=
	=?us-ascii?Q?dyUarLoMLjDZrG28W4jjHAvES6OcsX7lPHdXOClBmmN053qsdRbAaEbbGPGG?=
	=?us-ascii?Q?oOaZRTEPjHVO3SBmkVR2J6YKBYykyO3Gh2ggHemHokvExb6lw2WTgj4p+Cy4?=
	=?us-ascii?Q?IDuYlsSj/VID8WOFu2ImdQQWxZBiKCX+r3kN+oKl3kMQwBEPzacbDbzXgbCX?=
	=?us-ascii?Q?V6WGsTtuyAVpbxvje2iLMkF8GXrZkq2jKGwUljl9Qk5MC2edWwhZelQnR8pG?=
	=?us-ascii?Q?CXk3fF7jvELhLL6dj8pz4M8PC8hv+UL+/Bo2vsfwW/dRlghjCx1hxaiex2Gl?=
	=?us-ascii?Q?m1YsWUK2yIXOZ8P1tCsheDx/+l048RDYI+y/7jon1Sh6GHTfp3+6q+DQ6mOc?=
	=?us-ascii?Q?xoyP/mN+N0cwSpjK9wouS0Tp4Digz8ISls68x7fDlpifp5eLRcW9/laF69dp?=
	=?us-ascii?Q?uAqjjjsJSH7DBlq1qxt0rgygT+KfQ363+Uj9rbMwYuWm5nfgAXk03AE95yDu?=
	=?us-ascii?Q?ezCJtWxgdhflYXZL9On2SjUHKeKI3z1tQS5pVDqUEY+gVYet3FqT7Ez5qP3V?=
	=?us-ascii?Q?CZiGIg9J+J6KxamOCRJWjNeXnLSn28Pw4i/qEIcdakgLk/7f2pVy0ShITUmu?=
	=?us-ascii?Q?PH89WpWyHZotSsLYnbB+pKXuR2o?=
X-Microsoft-Exchange-Diagnostics: 1; MWHPR03MB2991;
	6:RUF0a3uF/VOlascW21jqgHdLPL8IXDM6IUUWqMhIZte2Ep6zsGufkghGaUiCqope4zThIIVMyR4mQhqK2McjhAodd1vgwC/KPwRKIy3eVJlXXdNAbcJ0A+vOZNyi3ugt/AHfFkWyWblgOFR18DZYYNduNzX+3qaBpHQLmrezHHftg4X7LOgnHV6mURwWk666H4Th6lrfLqfgURrk0TC3sbMe3+ogHg/bahyiA+NvcGa8aBNb2UOafRabZ0pypl5eH5Sdhte38/gCbwmusTOCh8UMdo6yPoRXh+Nf7KQNCWMG4w6jIr3IKHTPYBLxZ15hVy7wM+3zHwa3mJupyJ2N7UvJIckQPaezhfNCh3xdaUI=;
	5:nhi+rHb31aaWiQR4mJaq03NjlhrZamvw/hWdNT+mJeOdEj8IdQ46Jhe9wGJdyOGHanxESsOG57zkP2UgamPWFgd3l1o57EPwBFUKgOK1/VQfEegxgnKyeOFGb9LpwbIrKCLayDMo+0YI4VtHDcKvp5PJYvtYpIVkXE8CRzcVbHw=;
	24:e7pKGQzTew1XppYyGoI4B8n9c9WdU0SVIXJuDMsZuI7wVDQwrlD1gKOY5Oo5MwtirUvbGcEYA3skAt6RMC5hYUBC19e4UCgW4BOcqLmYFsE=;
	7:dPdXs7aedudzTgDwpL2MksGFbJx/S2j8xt5lbglAdMH/WXeTZJHGz3ytLhoSO34ogeE4hMOwsPxSf+CGLdQHrQ62fqrs9PTLiUUusk3coIN2s9jfzwb0guDE2ifZqCP+R1BKep8soxs1BL9oH6sUeQXa9mEZ5yiTLGAZNxarQAualmY7j0IW+TV733f56AbZFu0nBhg4eOi0SZDlaSlDk/YIkiJlqj0QnhUwaVTuqVEKqwuQlwRFCPo4loaOZhEB
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: freescale.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2017 05:45:50.3015 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e04e7be-d569-4fbb-0be5-08d5476ced36
X-MS-Exchange-CrossTenant-Id: 710a03f5-10f6-4d38-9ff4-a80b81da590d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=710a03f5-10f6-4d38-9ff4-a80b81da590d;
	Ip=[192.88.168.50]; Helo=[tx30smr01.am.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR03MB2991
Cc: Chunrong Guo <chunrong.guo@nxp.com>
Subject: [meta-networking][PATCH] cyrus-sasl: depend on db
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
X-List-Received-Date: Wed, 20 Dec 2017 06:19:16 -0000
Content-Type: text/plain

From: Chunrong Guo <chunrong.guo@nxp.com>

*db don't provide virtual/db

https://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=fe10cad66932c23812f344c6551cdb4f9e0b867b

Signed-off-by: Chunrong Guo <chunrong.guo@nxp.com>
---
 meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.26.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.26.bb b/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.26.bb
index eaa453d..64d1a76 100644
--- a/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.26.bb
+++ b/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.26.bb
@@ -1,7 +1,7 @@
 SUMMARY = "Generic client/server library for SASL authentication"
 SECTION = "libs"
 HOMEPAGE = "http://asg.web.cmu.edu/sasl/"
-DEPENDS = "openssl virtual/db"
+DEPENDS = "openssl db"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=3f55e0974e3d6db00ca6f57f2d206396"
 
-- 
1.9.0


