Return-Path: <javier.viguera@digi.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A43C4C43334
	for <webhook@archiver.kernel.org>; Mon, 27 Jun 2022 13:39:38 +0000 (UTC)
Received: from outbound-ip23a.ess.barracuda.com
 (outbound-ip23a.ess.barracuda.com [209.222.82.205])
 by mx.groups.io with SMTP id smtpd.web08.42472.1656337167929619731
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Jun 2022 06:39:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@digi.com header.s=selector1 header.b=WNzRC4Zs;
 spf=pass (domain: digi.com, ip: 209.222.82.205,
 mailfrom: javier.viguera@digi.com)
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2171.outbound.protection.outlook.com [104.47.55.171]) by
 mx-outbound11-48.us-east-2a.ess.aws.cudaops.com (version=TLSv1.2
 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Mon, 27 Jun 2022 13:39:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NFeZcPNYRUBVdi4pEbeXrvT7gyRMdFdNdbd+ahg5a7JlZpFT3n3hnachFpxV3RRpzSq1tWmv17pU8YBMuDHQ1TUS0dvbaYmloj9Kgxc6xSdoGUKagGJxLIPBUOgsVn4U3ZuEp4Fb0ngBE/zX8FIopoZYpP+qlOS0j1KQ1cCryR4mwXbQWHWcPjDR74nOMSpZGgJ2ekoNagNVnvpQrFDTFCHM7oG1nqEZ3tKzXkFfnxMkv5po611SvTsESu8TADe3t7q+2kaxiA/nb040jZON0lz5ADZgysln7TdpkkJD+cFuCehbg5Ujo6NniDaEYg26/haRL4MTaTu+VTLMspjSoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RWE3eePQ6Jk2VVJ3ERIcnGgCwrgCyUM2EMrH3w0Nfho=;
 b=dTq5uT4i6UMN/PtWYhAtfFZ0QhsQ/HqEqGX0m+QKs9yu2sYgNUh5Gd4Kjt7mTtcCTGUtxWRcWlij/GfrQmJPXF8elJvsjcXzbMtnX1U29m1WRwFK715z497n53er8A4Zz9Jh5qwAYrF/xb+4Z2XneDTFHSQRQaQHaE0S0eo8NCkHghCbehvLYkdUiCHaRuKkAbCO+6MqDo9vcSRCfUkXM+RjmYVioLYMCrtRgcZznPC8INNOK1pWjXVVzWI55JQI0OfaZ2aSFD4zO6IGaJTwFP1dyILSRdm8mzO0GbCq9ZO/VQO0+5uK+32esZwEqTFQwBbGDnSg8rJYdOgyUmcocg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=digi.com; dmarc=pass action=none header.from=digi.com;
 dkim=pass header.d=digi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=digi.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RWE3eePQ6Jk2VVJ3ERIcnGgCwrgCyUM2EMrH3w0Nfho=;
 b=WNzRC4ZsbX+wR/PIa87As1AwzlpYHRq/3gtW/n7otKrwMPA36Fn6K/BULtryc86VKn4wzjCqhjRgsMOTF9wkAJ91aEIBEliS1xj52glVTbaHqFFkf3dP4tpb8Eso1JF0qf8LTzwSFRYB0NXWsERAkR6m6fAzxx3Uk41vKl+Led9c5+BDRjiQnJStr8/wujfo/OApq0N672DZKBVtKI4Ybb0R03PKYLEZNAzFk9qKmsh+GKkSClgOI84cI6g5y5E5B2WT++gs+BWdtfGuTLEigw+/Ph2zYho/2Gpem7+86Cx/9J0lxeisoEoEoo7mUa4+t0uTFcT0EzJ/ChGM6JAdhQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=digi.com;
Received: from BLAPR10MB5156.namprd10.prod.outlook.com (2603:10b6:208:321::24)
 by DM6PR10MB3386.namprd10.prod.outlook.com (2603:10b6:5:1a1::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.18; Mon, 27 Jun
 2022 13:39:24 +0000
Received: from BLAPR10MB5156.namprd10.prod.outlook.com
 ([fe80::21a2:d9b:70e9:aac1]) by BLAPR10MB5156.namprd10.prod.outlook.com
 ([fe80::21a2:d9b:70e9:aac1%5]) with mapi id 15.20.5373.015; Mon, 27 Jun 2022
 13:39:24 +0000
From: Javier Viguera <javier.viguera@digi.com>
To: openembedded-devel@lists.openembedded.org
Cc: akuster808@gmail.com
Subject: [meta-networking][kirkstone][PATCH] networkmanager: fix build with
 enabled ppp
Date: Mon, 27 Jun 2022 15:39:14 +0200
Message-Id: <20220627133914.14615-1-javier.viguera@digi.com>
X-Mailer: git-send-email 2.36.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM6P194CA0075.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:209:8f::16) To BLAPR10MB5156.namprd10.prod.outlook.com
 (2603:10b6:208:321::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8a1ecc47-5b7c-484d-26cb-08da584272fd
X-MS-TrafficTypeDiagnostic: DM6PR10MB3386:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	rAcY3gWTUHVQPBIsJFGdycXQGGRICZSyO8A371hmAw0D9R4rkApnWKylzoCVFbOfaGslI81lbk6WMqBpC/REUwvTdAV9ADTye30bSPLJ2s3vj38dwAxHuRKe7HsNX2G8CnRe1ZWY+KCyDAmlk8Iw40ZZKke/UZUwjmG+p+v5COTmOZc7antf+DviQ/8Aw1oSIxhA0i8BCYqIxoBLXreBLpVGMg/gcODx2jJYnEEJnur282LK7Nvc9Mc7GZPu0FX3e1XDtprLumK7GyPcDt26nS9QL9Ynuq2FjfTqWcXSZdzCexBY6BPK3g9NQvLgCxiijHVVtFXlovg2f0uqqtHe2i8ejftJ8j+ye2PsD7V+crycMaHf7jW/1wiH13zGX3BUbN0h43c9hM3HuN/pCSUWk93xPFlE2SfMxVSxY8YnpSiYLT36JHsKgsEZHM+GZgzOzw7b0MHrlx+9GkH5vaEd/D6UtGSDMo02o//KGlfz5FVEJuz9H+db5OU69pcP9S6AZLghqu38dIqKTrSQ/wxVxYSfK8UqcIpqhW1yvQPw1EQv9++HngdUoA8nRmc1mFgMdVJygmXWIgmpCPbU2DAPrk2o5M0umL7ZMhjQyFdamgMOkcOSsBk3cWd3v0AwXHBOxNh0o+uxEFcfsz1MDUoelt3ZIwibQL5SunWQ0PqqDSObllskIRIMOqodXJJdzbMbV3fVsKkudt2Ru0/AjpAfvZJwcNISDAuvaUvvM7+0l420LcOs81x8oQWC9ZSPn1uOUXz5Gz9dRfOq6pMsdc4Ya8l4Lvn2NagsL8DmESZEyHg=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BLAPR10MB5156.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(136003)(39850400004)(376002)(366004)(396003)(6506007)(186003)(6666004)(41300700001)(26005)(6512007)(1076003)(2616005)(52116002)(38350700002)(38100700002)(83380400001)(8936002)(5660300002)(44832011)(36756003)(2906002)(4326008)(8676002)(6916009)(316002)(86362001)(6486002)(478600001)(66946007)(66476007)(66556008);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?48ZVuEv2o+jZNE9FqqOexBhz4v9sTZmdcvnZf1uHPqTE0oHFW9/WBo/9f4FR?=
 =?us-ascii?Q?vXXhCsuh0g1eNX6hqZDxE8nz/lhDbbo7Ie6uqd8Fltk62CoAzLf0NX9QiHgF?=
 =?us-ascii?Q?As+ezLee+1O/A3MoUgXDu26eReEQzAJf7ToMDFlkyu346GDyL+ICSXPbAMnp?=
 =?us-ascii?Q?m1uIgKvZO7CPYwia09P3HcMIGwB0CBC/wMzfPEmdDAcXs4lBlOVhA8ywT+vu?=
 =?us-ascii?Q?l1KCFVA7nny5ZpU/Z3lFbG66AEsxi3g7BqBwqYXkxcx2tUDE1wGfUo/8/Jj6?=
 =?us-ascii?Q?oCg6LGqpHScMWCn7SdjbCPnpjeYBxWuGkdRmDtAkVwRSom+V6abc+nOlVvyw?=
 =?us-ascii?Q?kGURNYSr3bCpEHBdG2U0BYNVPqrJN4e8Tf7KIcMl1/IOBtD14O+XdsxMUowe?=
 =?us-ascii?Q?H7L44QCTWK2RgMdG9j+TeKRxk1yYQy/WYMps5JBIhcsnVauGqNEdm67Y1bpj?=
 =?us-ascii?Q?VGYKh68U4D+7srR1N17GiE3U7dTmIen5zsH5Hce/4sHPFd28KAwNGdneO9FA?=
 =?us-ascii?Q?+ML/3kZ/RnoxSKSWh0TAUzdLulp9wu+ru0GpBpycYSxHlgMnJnN0zQu1v/7s?=
 =?us-ascii?Q?+R84Qk/jmcfvJMFgA0v99JVq5KalHc4wg0gA+/SZLEPmT5eWSI17x44sEgJ6?=
 =?us-ascii?Q?s/4toX7e8Aij2YOsxQfCjxHSsR3j/Z903kwHNVnL54uv59wUqEsQloGvsf25?=
 =?us-ascii?Q?o39VbRjpwWSJ4mmvZinjn38ZF6T18fyKx/jndEwIK5ne10sYqhAwF6+lHwo+?=
 =?us-ascii?Q?wmcqmuCAZ66uRqZUTy1JLI45J6UlVxPl6fFMZcixErUwiHLn1HMSUSiwnhQ0?=
 =?us-ascii?Q?S+delWMNR/fbz2yCJY0i9bTPwvqmuO9MkNsp0fRvQ1MQFeSSX7vUxOk2DBM4?=
 =?us-ascii?Q?8azwSdMVggaAO59pZGamEcX/LQcB2Nd2UAWoV/379hvpJvFOcqPS+N9OKFII?=
 =?us-ascii?Q?gJ66MYq67Gpxpry0LgXYWA+Eo0infJy3DCjZY7aTRRIAmUEtd81eoX2lUW6f?=
 =?us-ascii?Q?EiRUwP8IvYFqQqHWK8X0G2hk3yHQJpkVRcEEz4uGPcvF4gvXXt72HbhmA9Ac?=
 =?us-ascii?Q?isyFaFrWC5n13YzjJkN1kNYyT50G+QvfDT8kdnLZfQnnXgrZpQb3tbA/LfO6?=
 =?us-ascii?Q?P8tI0cCxv5HxhyOs9RU9Lgo5DlTCHzwq4cvYKAiUlcqnCrIey533EbqfB5My?=
 =?us-ascii?Q?91ontq/SD6DD/jhfhQB2XvhDvsfh/wIcDelyXqh6TC5RwN1ZOjn+Tl6UfX9W?=
 =?us-ascii?Q?CSk/qEgxngwu1OlgTW+NvFS6ehjb+3TY4AOQlWNXlZlBjSfu2y9AugTD+cat?=
 =?us-ascii?Q?SUSe46WxYCpceRjKoVHCSCTtaiiMtEhJ12X8joegIPMp1SGUPfQbBM3z+pwo?=
 =?us-ascii?Q?wkVaRycGKJe6HmK/4x14w7Wp3yUgs97q5lNl9wK7+KYGtIMYsEkGDQzzvNJd?=
 =?us-ascii?Q?jFVydXKPHJ+wjaCNPUomkjStwCJ4QsXhzsT29NMhjgv0mWyj826x43MoYYZQ?=
 =?us-ascii?Q?zV6z8ghapTbFiSZzZ/bCemCXu7uOlgao+fHPr83yA1JP/Igz07TjZ1iYic1+?=
 =?us-ascii?Q?CR3+bqTSPlc3YGzGxdgoAtivYhkoAdG58/AG/MIi?=
X-OriginatorOrg: digi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 8a1ecc47-5b7c-484d-26cb-08da584272fd
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB5156.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2022 13:39:24.8342
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: abb4cdb7-1b7e-483e-a143-7ebfd1184b9e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 AW73zqAFY6qk/6p+U/Jp1e9+i7dcIyQn47ONsOd8t9rxzE4+/hUxdaDMI+AjfoaBMP95KvaMUrO6CQkZOmvKUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB3386
X-BESS-ID: 1656337165-102864-5317-9651-1
X-BESS-VER: 2019.1_20220614.2034
X-BESS-Apparent-Source-IP: 104.47.55.171
X-BESS-Outbound-Spam-Score: 0.00
X-BESS-Outbound-Spam-Report: Code version 3.2,
 rules version 3.2.2.240976 [from
	cloudscan8-114.us-east-2a.ess.aws.cudaops.com]
	Rule breakdown below
	 pts rule name              description
	---- ---------------------- --------------------------------
	0.00 BSF_BESS_OUTBOUND      META: BESS Outbound
X-BESS-Outbound-Spam-Status: SCORE=0.00 using account:ESS112744 scores of
 KILL_LEVEL=7.0 tests=BSF_BESS_OUTBOUND
X-BESS-BRTS-Status: 1
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 27 Jun 2022 13:39:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97600

If 'ppp' packageconfig option is enabled, but the build system does NOT
have pppd binary installed, the build fails with:

| Has header "pppd/pppd.h" : YES
| Program pppd /sbin/pppd /usr/sbin/pppd found: NO
|
| ../NetworkManager-1.36.2/meson.build:570:4: ERROR: Assert failed: pppd required but not found, please provide a valid pppd path or use -Dppp=false to disable it

This is due to meson trying to look for the 'pppd' binary in the build
system when it should not. If the build system does not contain pppd,
the build fails.

Signed-off-by: Javier Viguera <javier.viguera@digi.com>
---
 .../networkmanager/networkmanager_1.36.2.bb                     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.36.2.bb b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.36.2.bb
index 6c665d53bb50..e3b1296a6bc4 100644
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.36.2.bb
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.36.2.bb
@@ -83,7 +83,7 @@ PACKAGECONFIG[bluez5] = "-Dbluez5_dun=true,-Dbluez5_dun=false,bluez5"
 # consolekit is not picked by shlibs, so add it to RDEPENDS too
 PACKAGECONFIG[consolekit] = "-Dsession_tracking_consolekit=true,-Dsession_tracking_consolekit=false,consolekit,consolekit"
 PACKAGECONFIG[modemmanager] = "-Dmodem_manager=true,-Dmodem_manager=false,modemmanager mobile-broadband-provider-info"
-PACKAGECONFIG[ppp] = "-Dppp=true,-Dppp=false,ppp,ppp"
+PACKAGECONFIG[ppp] = "-Dppp=true -Dpppd=/usr/sbin/pppd,-Dppp=false,ppp,ppp"
 PACKAGECONFIG[dnsmasq] = "-Ddnsmasq=${bindir}/dnsmasq"
 PACKAGECONFIG[nss] = "-Dcrypto=nss,,nss"
 PACKAGECONFIG[resolvconf] = "-Dresolvconf=${base_sbindir}/resolvconf,-Dresolvconf=no,,resolvconf"

