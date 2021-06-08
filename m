Received: from IND01-BO1-obe.outbound.protection.outlook.com (IND01-BO1-obe.outbound.protection.outlook.com [40.107.139.75])
 by mx.groups.io with SMTP id smtpd.web11.8370.1623126739272195196
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Jun 2021 21:32:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=r3oqHn66;
 spf=pass (domain: kpit.com, ip: 40.107.139.75, mailfrom: akash.hadke@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Lqia5+UYwTdygdcRbbCfVWl7PecQMyDntW1Iie7g/GOt7aLRGZYiysZTjX16h24OGABvFl0WOj8eGiprsLAHI0fZ6CnerI6eBwqnnG9044mxVi0L7/kPYqcGOCcrEX33F9P3XpfXkyQhi9HlQkioKyklTsPZIaenGKH/1Rz3bASMHsgWZPv4Mgv7GjQj/oPAo+G6wvIbnYFU5gIilechKK7n9Is6pQc0JSOsJz96dGz5a/TdjXwCYtzvg7+gLBXqUFmqkk1Xc1RXRvFVAbwvwRfO4M0YobmaeKGD1o9jRN8Yi77Ssn0BJYxyCcuPuQa6q8f1XEf1EAw0dW8TmS/22A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zdS6pZz9uA+Ww+CLPF8CqZ8MsFmJPbOmmlmjq+tYzb8=;
 b=WCozmAi/KhyQANCG8lbJuuBl68dF/q6fdmD83E5Nv+6gcyz4d2fGPpy6Jg65OebvXt9qb+EQvX/r1A+IDsZ8OjcqtDH22azjCQbdkXtMieY5EbsdRwo7NKumR6tG8bijRDcCGv0hvx8XAB65V5m3GuygpILYpt9KEZvRk0X2clDi584+S5nl+zKl9tv0s8WC/uD578O492AGXYqPr/4gAuQXpNy4i0NxE7CcsOifuHwaJVIIknUtRTSwmha58lG7AxZd6zqDa3MfPNcNe+xADUmMDtfheBnQJdKi6idDkXX3v9gnt+KD9P3Glc72aRsM3w6JzUw8UJuxBhoUiyeuDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
 dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zdS6pZz9uA+Ww+CLPF8CqZ8MsFmJPbOmmlmjq+tYzb8=;
 b=r3oqHn66jLmqaevXLnJsfTscrHCXTRn8Nzn2oSlCu5L1d/T8Q/T6yr1TeoiQXAt1pDoSnkPjnVvEDyjfig9SuNblhJgD1twugyYGtIG6JTYK42PnE2UaP5V5P6tS6/MfBImTBfLKeJem0WgdSeZETxMXADwCvzqSD8DC78GYsX0=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=kpit.com;
Received: from PN2PR01MB4619.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:a::14)
 by PN2PR01MB5077.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:4c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.22; Tue, 8 Jun
 2021 04:32:08 +0000
Received: from PN2PR01MB4619.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::c962:e30e:1f2:44e7]) by PN2PR01MB4619.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::c962:e30e:1f2:44e7%7]) with mapi id 15.20.4195.030; Tue, 8 Jun 2021
 04:32:08 +0000
From: "akash hadke" <akash.hadke@kpit.com>
To: openembedded-devel@lists.openembedded.org
Cc: nisha.parrakat@kpit.com,
	harpritkaur.bhandari@kpit.com,
	Mikko Rapeli <mikko.rapeli@bmw.de>
Subject: [meta-oe][dunfell][PATCH] meta-oe/conf/layer.conf: depend on meta-python
Date: Tue,  8 Jun 2021 10:01:55 +0530
Message-Id: <1623126715-9975-1-git-send-email-akash.hadke@kpit.com>
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [2402:3a80:cb1:1876:861f:8f19:371b:f6bc]
X-ClientProxiedBy: PN1PR0101CA0020.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c00:e::30) To PN2PR01MB4619.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:a::14)
Return-Path: akash.hadke@kpit.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (2402:3a80:cb1:1876:861f:8f19:371b:f6bc) by PN1PR0101CA0020.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c00:e::30) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.4195.22 via Frontend Transport; Tue, 8 Jun 2021 04:32:07 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1916e019-8b96-4edb-7e4f-08d92a365ff3
X-MS-TrafficTypeDiagnostic: PN2PR01MB5077:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<PN2PR01MB5077BD877AB889949D703E988E379@PN2PR01MB5077.INDPRD01.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:972;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	WRKbRtXR6Z4k8dUuOmCoB0XMoUT2ouDTNBshsHltKW7MpyVp7wFeNDczxs4XvZmCpV+St3sbL0mCt21XdIoTaMWRuZVHcQpqsUct0pZh1mu2hFubLaZ8S2ejubgOcwdWN8PbtzO3L1nAAvfg3QGx7UVHhkzP0NAYJ1rBnv6jF0VyvECH8ur7o4T7kMKM33ZzCmHk3DZi1wa02e7Sn+9bIAbTvkJCygQbeIvwnxociTGKiudpG3cJTlO3sij2EFwx5vnTnvdPJ3iBbsJoovP27o+NMtuPl/ZqqUELhboCtrzsSF/VINPmBb70XB38cGU73mIxe2BhXhGOgwkHaQY+UxEzD4bX+L/t6NKeHB+0b0rSQXi9NbEoLtYP+IAmXZlu7Hlhyl8aPAOYhq3OkH78ee7mcPHU3nsDUAiVoPau82fOAFLUMrQ4um24+QAeyB9JGaVqcVmVZipzxsHtddV5Yza6Xg9UQr8y6JeHYTSTbS1Ka6Hpkbs6sprKh64FOxLSCHXTk/oAMVo2dVOkNzgpgPOKH+TfhgPPcF88Evqq0wOjtucMoIEz7K+g0ot/u2iOdx09WmsRMv/EtHeYPfA+Ltfb8AkYOLLrohZ+r0rvzIIQsSFDwdFTHoYNV1URmPSB0Q9+CDALeOSdf64wzlcwl4ld5hjzif7ClfMn9aTByBM=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN2PR01MB4619.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(136003)(396003)(376002)(366004)(39850400004)(346002)(8936002)(8676002)(316002)(2616005)(52116002)(6512007)(478600001)(83380400001)(36756003)(186003)(16526019)(6506007)(66476007)(66946007)(66556008)(86362001)(4326008)(2906002)(6666004)(5660300002)(6916009)(6486002)(38100700002)(69590400013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?qoPyFd+G9SkILRKdb/R43AnkGsgN5ykpA8tDNlUBXBgLsfN27S+rqybav/e7?=
 =?us-ascii?Q?4TXTGjWolrmuPrA7rHeja81LVXfwkO3nu3Q0GYHRkykipwnCqTwz0MUut51D?=
 =?us-ascii?Q?RYrMhXnA7/EDBgTgAIYg4VvTU7UAvcN0odJe1sx/xiYEJzjD5F4TINaxdRsj?=
 =?us-ascii?Q?Rw+hA09uZll+FRu9s4O3zzFeu+5tz69tCSL4k28i0Hof5mV0OpB1odkE8h38?=
 =?us-ascii?Q?kXD6G1sz8se1jd/sRMCZL2kulR0KbEpNb9JbNMoQFQHGc+W2lLrGyfvsHsP4?=
 =?us-ascii?Q?afrnmYH0XPNbQZo8hMk9qieFKRiOeGCLXRS9h5uS+1UgQO0ZGkg0+dek0P+s?=
 =?us-ascii?Q?cqAnmVST/pfwVDr/PUbRJLYiVXAAK83izCVOXzOOwkqjb46nEzmR5Orlcl+j?=
 =?us-ascii?Q?007nO0j01MlNgr+BjYCiES+z0nXQ8yZGIiBU157Ea9l26L+klQAv0r3IB812?=
 =?us-ascii?Q?L4I/3G5ugRdbdckk5gvMg/cZ53BvQKVnoULlezG5VzQNTVqhmQdZXCnrEh2W?=
 =?us-ascii?Q?bP7EJUulFTV5AEZRb6bHR20Uh4pWdqmpjtRr4sbWhDNVNpbWUbL4vrrUaC0F?=
 =?us-ascii?Q?wHgDW+M0MewuAigXF96mPFVa7SO40nerskfBfRqda6IrP1JxqJniiX4TExUC?=
 =?us-ascii?Q?scslndA9w3gB4JCSqqUB/4HL2z92+hvq+mNhpfzXfb2aI5UpkUFNTVuA389q?=
 =?us-ascii?Q?9wdBQcQIdokyopAeQyOtBW2lxApzUkJy0C5zijoQxMHcVAXzADMK1o4piKRg?=
 =?us-ascii?Q?emFm50KjM+yOti9BYXKtLGPKXzxKjIGd1gZWdUgB5ON3JtODB0vJgmgR0ice?=
 =?us-ascii?Q?HTqA/jYtFeU3rXiJbbhHfKkE2/ckIBYFKRUwrn4X+g1jj9Cqk3K1qtLaHX3C?=
 =?us-ascii?Q?OdxYbogtbDKDnu1mEHegC9h4350yDQaAeQrj1Wue9DKXsxed0WMdhp65nTUl?=
 =?us-ascii?Q?M1IkCZhLhPKDh6FgKwvUnwO400pfTzOn/lFvrS1m7pqN17hK2GabdH8NbVu+?=
 =?us-ascii?Q?TkPts2kAo4x0W0p1b9jS97zws2Gso6L+i0asojm2Gx1TlWJszbkiYUHIsbG8?=
 =?us-ascii?Q?IbvEb+vOn8MHqcNChDWYewBbHuqeBMoiA9Gyh67wJLxgbB/GBlDeuhzU14Dl?=
 =?us-ascii?Q?hWukVjH6C5N7YSozvpf6lTWH7j+y0PGSzutmkTLCpaZte+fRP61uRosK04G7?=
 =?us-ascii?Q?2xLK0fIa3IHM8VWvAaprf2zXXmAduJ8qSGNlT+M7t1x25P9Ud2WJLDYePFSS?=
 =?us-ascii?Q?4/pqsV9e6asZVb9CWUT7b+80z2KqNim3p6NZm1hjRmOtSnshpsNY9/YkKO2p?=
 =?us-ascii?Q?zXyDHPWxuwXoC7fpmki3hnM5ONTf2d40NtVMzLtNoL1zdWHbBnfODpIMcuGb?=
 =?us-ascii?Q?l6Kj1OvktVmhWNznfdm9CEF72Xxv?=
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1916e019-8b96-4edb-7e4f-08d92a365ff3
X-MS-Exchange-CrossTenant-AuthSource: PN2PR01MB4619.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2021 04:32:07.8917
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dZCD5CIobhS433rCYE/HBPSelvCvvqhx4EbaRwRXlrN3UieDdiqHwD/HYqJMp1dujQA6EivXIoNpK0HBNq54kA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2PR01MB5077
Content-Type: text/plain

From: Mikko Rapeli <mikko.rapeli@bmw.de>

Fixes yocto-layers-check error:

ERROR: Nothing RPROVIDES 'python3-pyyaml' (but /home/builder/src/base/meta-openembedded/meta-oe/recipes-extended/ostree/ostree_2020.3.bb
 RDEPENDS on or otherwise requires it)
NOTE: Runtime target 'python3-pyyaml' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['python3-pyyaml']
ERROR: Required build target 'meta-world-pkgdata' has no buildable providers.
Missing or unbuildable dependency chain was: ['meta-world-pkgdata', 'ostree', 'python3-pyyaml']

Summary: There were 2 ERROR messages shown, returning a non-zero exit code.

Signed-off-by: Mikko Rapeli <mikko.rapeli@bmw.de>
Signed-off-by: akash hadke <akash.hadke@kpit.com>
---
 meta-oe/conf/layer.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/conf/layer.conf b/meta-oe/conf/layer.conf
index adcec83..efdd04a 100644
--- a/meta-oe/conf/layer.conf
+++ b/meta-oe/conf/layer.conf
@@ -34,7 +34,7 @@ perl-layer:${LAYERDIR}/dynamic-layers/perl-layer/recipes-*/*/*.bb \
 # cause compatibility issues with other layers
 LAYERVERSION_openembedded-layer = "1"
 
-LAYERDEPENDS_openembedded-layer = "core"
+LAYERDEPENDS_openembedded-layer = "core meta-python"
 
 LAYERSERIES_COMPAT_openembedded-layer = "thud warrior zeus dunfell"
 
-- 
2.7.4

