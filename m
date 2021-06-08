Received: from IND01-BO1-obe.outbound.protection.outlook.com (IND01-BO1-obe.outbound.protection.outlook.com [40.107.139.87])
 by mx.groups.io with SMTP id smtpd.web12.8372.1623128234673423947
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Jun 2021 21:57:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=PqoNDKif;
 spf=pass (domain: kpit.com, ip: 40.107.139.87, mailfrom: akash.hadke@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZyxZVGjJMWjOrCGjmkFJb+HeFXFZqSg4cQ1JyK+JfSJP+suCfOVI9c/x5q8o04rhjVb6ePtfZZsYEb6UmR1q87mSOitn+G1M5KEEzvToqHf/phv8qiKJ9E2Qva26b1R1tEq69mTGRKWCUnG2QcTXfpcK6wK8alD4/YnWd4IYz+kgIFAVXxuaxs0Svk6i2n/Evth3COfLpUS5TU6AzNxDzQ9jJTyTpTprmMLkCiR9aAovYspIxYU1yK+Oc4Ze3e2QbL4R6sRWK7OHWqVQphHx1H5aCtPFyjNNCMSd/KW4NuZVCWLQzpfTOKl+k7DCTA8oVFJ2fN/Nmif1ygAceiaV/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yuf1m9oY3Y4dE7hZZHiTRQ2Ig+jPQ46l/VBEKauCLmU=;
 b=Dj/4R4GQOHKyq4CLSdLHccNgIwiVXjurE6RnBI2xHGFhzlR+QHIFeWxIvoOqvCWe3Fq0wKiEz6n8IVAw0c7YxCGI/LZb+FLcbzQjexn8+8exG4+/VGRatHTuK6/M6P3RCxIZj9js65bxJXT6IVQ5Wwg8tGlxKmafnDyJAU+KGo2gqLkROhBEIIAbldTfcDs8vcbymRXzISPTE8a3/C+c7WdV9YazWDjcPvB2FJGRqg8Ab/szkDS3LyZWYAYgi5hme1z6NTNHcKsku1Hi4AOnr0Zg97NpHnfsztq15mgNmtI3rjtypMZgdSGQR5ZY2fJCktsxqBsl6Arry6DZed4boA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
 dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yuf1m9oY3Y4dE7hZZHiTRQ2Ig+jPQ46l/VBEKauCLmU=;
 b=PqoNDKifRE/BqhA4v5itfJKXX+iZVNlck5vV9OcToPDZnHI5wR1osMnkd/7KU3N/HxSkhkJAWvf3ML95IRC7eSoMbRKMdEmzSkqqOOiF0UmLRi/UIoUztYxOvedZJrK1UhwumNqrCi7hm/L0fna7ipmJpdkPqiJKF3ZvTLUZM5s=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=kpit.com;
Received: from PN2PR01MB4619.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:a::14)
 by PN2PR01MB4587.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.29; Tue, 8 Jun
 2021 04:57:02 +0000
Received: from PN2PR01MB4619.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::c962:e30e:1f2:44e7]) by PN2PR01MB4619.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::c962:e30e:1f2:44e7%7]) with mapi id 15.20.4195.030; Tue, 8 Jun 2021
 04:57:01 +0000
From: "akash hadke" <akash.hadke@kpit.com>
To: openembedded-devel@lists.openembedded.org
Cc: nisha.parrakat@kpit.com,
	harpritkaur.bhandari@kpit.com,
	Mikko Rapeli <mikko.rapeli@bmw.de>
Subject: [meta-oe][dunfell][PATCH] ostree: switch from BBFILE_COLLECTIONS to PTEST_ENABLED for ptest support
Date: Tue,  8 Jun 2021 10:26:45 +0530
Message-Id: <1623128205-11332-1-git-send-email-akash.hadke@kpit.com>
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [2402:3a80:cb1:1876:861f:8f19:371b:f6bc]
X-ClientProxiedBy: BM1PR0101CA0025.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:1a::11) To PN2PR01MB4619.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:a::14)
Return-Path: akash.hadke@kpit.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (2402:3a80:cb1:1876:861f:8f19:371b:f6bc) by BM1PR0101CA0025.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:1a::11) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.4219.20 via Frontend Transport; Tue, 8 Jun 2021 04:57:00 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bbc1286a-532b-47ef-4c5c-08d92a39da68
X-MS-TrafficTypeDiagnostic: PN2PR01MB4587:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<PN2PR01MB4587468AFF2B74612599B57E8E379@PN2PR01MB4587.INDPRD01.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:4125;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	IaIkCRXfMzdplz2CybMaaoaRRQDqYAulgmAYh5LnjT0N2IdR0n1zXlpdm+DBJ8zNwiSihiVvqGtZRTWCuaOM11KoFBItNsi9H7cZCqL2RUeOqIB8Vux3R+xt0zF+IFrOLOaTpGjWVr6HIniwB8th+UcHptpSB76+rd7TnE57i4Xtjjbg0Zdl4Le9oopVYHOuwOZ6Z2ZvSUQ8C6RksSbB2DMysKTeTubtIytuqV6qtpwD5MHh1g4AlBdXW8MhibUTnAkXJDkDjXTaDUEG4Sww2yelP8PN403oBbGFGAAeDKO2Kqh0dB6zMvZf+TqTrToZctPuSs91s0wTv04gGkauhSuTFT/pJaj/q4IbpPnYdVdKDaNPa8UqUd/ZXzisyQc2gHVxjiOu/7LYv6VvZPbdCRwaPGfbU5jnhbrO1sUPp2M8pBAwBzI5FpuOx3gTQKSfjP/9Z2jQCMgUawsjb7ZC1dpMJqn4SgHinyeQMJA005f6OUr0oG5RUkYM7fIUl2yGwxj4fPFhceAtgZo9GRmx98zWRdbeHTSBeV1UHwqC7VoGVS7sjQgLbPkqkPn+cffGjptGRWSdvU6CO5C8+iQGSuAMz2CDBnLbI7EV8LqozsQGciX5EIUaXBqVJ9WXoucZSGJuAgHcRDLLBos72zTDWJUkyyWZyavFVwutw56YCzA=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN2PR01MB4619.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(376002)(396003)(346002)(39850400004)(16526019)(5660300002)(186003)(8676002)(6512007)(38100700002)(316002)(6506007)(2616005)(6916009)(66946007)(36756003)(6486002)(8936002)(66556008)(66476007)(478600001)(6666004)(83380400001)(86362001)(2906002)(4326008)(52116002)(69590400013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?I03mshTauJBbK98/cXivRhgkEWEQe52C3zZgdvnWzMkaOM7l0nmzuQXtID7L?=
 =?us-ascii?Q?j3nqte3AjsxrD+mmoGOJwkbYkAZyH1rOq0VuQ/fgTBLS2vj/AqIpsLkTh+z5?=
 =?us-ascii?Q?bw+aoz3jcnoGqmbok2oIj//OMpk1pKla2UvHvHEQ9gJLwej2tqPXJLgBDsSO?=
 =?us-ascii?Q?HaQuNyZfz/Taz6DT/4237IMglCnzXdBrKZeXI5Eoq1VLNb1IYN29WsfzemFP?=
 =?us-ascii?Q?NCNVax5E/Kxb9yBSbqcQdU0AYzBiu7WPtKWeBMfbcpoZMX/gxgyWvOzudAUO?=
 =?us-ascii?Q?vJPoNjA3KhxyskIP2g/+GdYbW4vtj9ToFyY4GMpVYevH/K7YbBWj6ljAELY9?=
 =?us-ascii?Q?wUumRypeOnMLGTWE/76Mqdr3mFey09zv/halhVin6rncTEDTrSUFsExlWdUT?=
 =?us-ascii?Q?qaX7vXML4bjynhV5neBIPoIhO9nrFdXEpu19bw4q0suOweGWIkVq3VL2RFBx?=
 =?us-ascii?Q?DZ4fU2LnRDEoXFBDMam5KYPeQn3jZDSIdZE49xqodNVH31+3mvZlXpvmnIyb?=
 =?us-ascii?Q?QaoBOivQbA5ac2tzDoAp/rhb5qnib0vaSnstVKd/0Lb+XWBZEBcm0kAKmptX?=
 =?us-ascii?Q?1OBByREaXOWJa3bRJ8la88QfN0lB00F9jhfnMb6Zo5SJYr49TRwI7F6DMQjd?=
 =?us-ascii?Q?x1W9OhFY6v7w82XP/JO11yOIJrZDJspLo4q0u/Yx4TSNs+M0Y4HwdnEGQD/t?=
 =?us-ascii?Q?imEvKy0W5ekefczjshRmFO7QXyTRXpMK7GoWflTfU6FwPJ6ohSrn4AjENegX?=
 =?us-ascii?Q?8p4PTSNaX4JfL9hRe5TMOlLWLVALyLSV4k8kAl17te8+vSTkpkx41rM7D5uu?=
 =?us-ascii?Q?6AYK3imOaNbitn9A98Ct6uxKsjEzh9qjajrDuG3wMfOYYFAGInI1UMG3Vc+G?=
 =?us-ascii?Q?Lm5W0A8AqoFi1awyAqhqxi86JYyNtoNlUl8n+bkn1iEKOEEbEihaz0/hYNf0?=
 =?us-ascii?Q?uYlL2OeyZZDPLTjUJcpWerCB11MbeInXTJnNvidHsJUSJWoyNThTa+pOcwil?=
 =?us-ascii?Q?9giixrsk+Mgc7ZaC55q6YASMvFBCIXRnB8oh8DC+YnYmToWBqC7LGF9uxBLf?=
 =?us-ascii?Q?V9EbmxcqPhemEqNd7WCktlNTV4OMRmqCscQ7toOqAQS4SgtI52lfmnwYMTGB?=
 =?us-ascii?Q?vItAEqFXJYY8R+zCm/sb24BszUIA4Cq8m1iX2HtYxbCRYSDwM7J1/sYORb7o?=
 =?us-ascii?Q?0hdvGE+g+Zi+k/t0/IZVkWk1jykMz6dDmD9jecLrcQ4yugF0WcoMA1wl0dRT?=
 =?us-ascii?Q?V9v6v0d/1RBhx4IOMyL4X5alEFwsxw5XJsUeZU4MkELXb5eEYMySmH36C1kg?=
 =?us-ascii?Q?pb85PWB/rJlJxfwsGiehlPhTO7+qUMBzu7ig6jiSTMH9KbFJazOE/IMSZRU0?=
 =?us-ascii?Q?vGLC01AONeRMEIklt+y7+IQpvV5O?=
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bbc1286a-532b-47ef-4c5c-08d92a39da68
X-MS-Exchange-CrossTenant-AuthSource: PN2PR01MB4619.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2021 04:57:01.7915
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eLFAiHs2/25w204yZSRfMZybMAwSpYwP2QobMMKqw8gZIy6jf7+dEja8ufPx5eqswOGoQ7Fq/tn7d4t8uH5Kog==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2PR01MB4587
Content-Type: text/plain

From: Mikko Rapeli <mikko.rapeli@bmw.de>

Just including a layer, like meta-python, should not change the way the recipes
compile. Instead, if ptest support is enabled, then require the python dependency
for running ptests in ostree. Fixes yocto-check-layer error.

Signed-off-by: Mikko Rapeli <mikko.rapeli@bmw.de>
Signed-off-by: akash hadke <akash.hadke@kpit.com>
---
 meta-oe/recipes-extended/ostree/ostree_2020.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/ostree/ostree_2020.3.bb b/meta-oe/recipes-extended/ostree/ostree_2020.3.bb
index 8640745..e13bb1f 100644
--- a/meta-oe/recipes-extended/ostree/ostree_2020.3.bb
+++ b/meta-oe/recipes-extended/ostree/ostree_2020.3.bb
@@ -176,7 +176,7 @@ RDEPENDS_${PN}-ptest += " \
     util-linux \
     xz \
     ${PN}-trivial-httpd \
-    ${@bb.utils.contains('BBFILE_COLLECTIONS', 'meta-python', 'python3-pyyaml', '', d)} \
+    ${@bb.utils.contains('PTEST_ENABLED', '1', 'python3-pyyaml', '', d)} \
     ${@bb.utils.contains('PACKAGECONFIG', 'gjs', 'gjs', '', d)} \
 "
 RDEPENDS_${PN}-ptest_append_libc-glibc = " glibc-utils glibc-localedata-en-us"
-- 
2.7.4

