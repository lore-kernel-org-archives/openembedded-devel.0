Received: from NAM10-DM6-obe.outbound.protection.outlook.com (NAM10-DM6-obe.outbound.protection.outlook.com [40.107.93.48])
 by mx.groups.io with SMTP id smtpd.web10.543.1615572888431395405
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 12 Mar 2021 10:14:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=ZtTfX2M/;
 spf=pass (domain: windriver.com, ip: 40.107.93.48, mailfrom: stefan.ghinea@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xo4kV4pkXoNR/u9XRj4kGYEtl/O9eYEP7tpZt4FAQKu3ZZW5ylIMLmtSqW9OawtJ32REqrJOkraRO0X0FQCCVpy8931BjDzU80w7pZAOaxuM6Bp3JcaqkVBPyOtms3zFTkOMQNjtOi6Ggn1j+d/keQmYPPCpFY7kUyQPJTnS1msHtZSdomtT4LvmnL2VfeU7+W4hCq/B29OT4WkhI2Gxu0xqvsmpB+N2/tUMO3LqwrgKxsIfug6ceXhqpeF4aWlMKC9jHfJbGfLNqDU5wMOk8fdktnNFtvJm4YhxMRNwmo1CBqgGUZ5x4M71n7O9q4yw38mNtvigK9+AWBwAtb/A8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tJNODnnElC+oO+O/rTit7KkAskgHp5Is2Qzjzg/cY9Q=;
 b=Gy8pVKV2f5o8P4jW0v6zoUzm0V68RKvkiFF3TV18PB7WygHBsEUQnkS8IgyDTlaxqPWyP87typ/1ZriRBDE3ZH8srE1gBcvwALUTGWpwSswzpqH8NXmYHFcucuG+FL6tqPmxcKRP8c5biRlMpIdQCACYyuUN1Ej8gSLgFflNLiv4ACt6TooxH6PNEe+ENjpoiHGPM+M5FdFfrFobjYg79UHcNXJQpQT2e1iBcNvo5DvZlJGBxFX8l0S66z8UYJgMumlRSuzkZk5AKIVRV/FEbX+WiTpdqUWiCMTMa+QLg0yHmi9hyguSR+usDk4yHh7KxGp59IjkldQXjEYE86FVFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tJNODnnElC+oO+O/rTit7KkAskgHp5Is2Qzjzg/cY9Q=;
 b=ZtTfX2M/fWzLkxtHvTKYDN2uuE8f8XrVjG3RoozSz0mhhn2prnI8hcmBdQesOjItGgDLc4VCwOCZBxMGOKSKg43zxoccjKX+nC2rKCq3HkLSbGNps+6z0a+6kkUbyRRGZUJXVTTXZueRFjtCRzHjZgfMExuUUUktng2irLEykfg=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from SJ0PR11MB4989.namprd11.prod.outlook.com (2603:10b6:a03:2d9::22)
 by BY5PR11MB3958.namprd11.prod.outlook.com (2603:10b6:a03:18e::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32; Fri, 12 Mar
 2021 18:14:47 +0000
Received: from SJ0PR11MB4989.namprd11.prod.outlook.com
 ([fe80::31f5:2e4:c15a:6df0]) by SJ0PR11MB4989.namprd11.prod.outlook.com
 ([fe80::31f5:2e4:c15a:6df0%6]) with mapi id 15.20.3912.031; Fri, 12 Mar 2021
 18:14:47 +0000
From: "Stefan Ghinea" <stefan.ghinea@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH] [OE-devel] [meta-openembedded] quagga: fix do_fetch warning
Date: Fri, 12 Mar 2021 20:14:32 +0200
Message-Id: <20210312181432.14324-1-stefan.ghinea@windriver.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [89.137.231.29]
X-ClientProxiedBy: VI1P193CA0014.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:800:bd::24) To SJ0PR11MB4989.namprd11.prod.outlook.com
 (2603:10b6:a03:2d9::22)
Return-Path: stefan.ghinea@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (89.137.231.29) by VI1P193CA0014.EURP193.PROD.OUTLOOK.COM (2603:10a6:800:bd::24) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17 via Frontend Transport; Fri, 12 Mar 2021 18:14:46 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0ea1e212-0e85-40a3-dfad-08d8e582b7df
X-MS-TrafficTypeDiagnostic: BY5PR11MB3958:
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB395858C6A06548FD98A11119F26F9@BY5PR11MB3958.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1443;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	YMwrqIdDLxDgbMWuLjqmjC8ezikelGoWzmzwnkbHqo90E22CURGXs5V8QcbVxpuRHtgAgpTpDEYCEfSnFAfOkxNU8DcVdAyiIkzZsVGkxDYT19SsM78Y9avuZk3UT9DmVczk/+gz1nZF6wxi4TWi4dvpJwkIy8zz26nJrO6qGn0V/KNGmYA5UaIfV7TT4vDlJwgxgSZAqDQxERBAMX4Z+867vPFaNsIWykbaJ6y0UlWZJyioq+fQ4n3VojI+Of74WZRSz4TACJoHrxUzwnIJR75D0dP1ajD2H1J1EAi3iiTrLBsoro+Ki/TmUIQ+9ilqOYZg4dO2eRBk8G3ks62a3AM2S/k44oWJ0akWD2S9TTS1NUTmcYdTWOhFmRai0MZ72C5pLymLMVeP5WXb2x7CrqqzRAwaTN/ArDrhNfiXmRbaE6lAAjFknAgkZ8o0/cQXOwRFvyGRkq4mqY05oBxQoa5Oc7jvDAYuz6OtFKK+yCcp17kHoUfRZGGkcJyagpPk0T/rl4oqhfaMuCG5tjkkqQVHGZFrqOCAlVmfPXOoi/1hm4HZq1vUlQr43NdL3L+JrbLQaaHQPIeG7hkrLFyrNKKD9Tfoyvbf8vvBK2R3ZwDfhqj0Xs8PAy6RVTZ55iDJuw9NdzUCHrMP0EFpNUfYIrYng4X8JjA+QhhXRgQuCjLwyV3eLu2uv4J0oZups6v/
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB4989.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(396003)(376002)(136003)(39850400004)(366004)(44832011)(6512007)(8676002)(66946007)(6666004)(1076003)(8936002)(2616005)(66476007)(66556008)(5660300002)(52116002)(316002)(6506007)(6486002)(6916009)(36756003)(186003)(83380400001)(86362001)(69590400012)(956004)(2906002)(26005)(16526019)(478600001)(966005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?I35VFFKr1a/TR/4nUKa/dQaQbQOrSkjSR/EiKbwMYgh9hCO8Ce4LyHbbWP4A?=
 =?us-ascii?Q?Sb8/GdEQJJzb8HkvOuCUA8BBsQHwymIKNPgBJRm3K9W7I8vZRohYdobGEc0c?=
 =?us-ascii?Q?vg8gniNO9dGqmLYnei6PXgwqass5VDxNAoSx5TAgiBRE6g+XMkc6wnFv1Xdz?=
 =?us-ascii?Q?z3dG64+/PpxHesxOa5QPL5Xycz5oLcha1Be+XLFC4t5Vx6W1JUoM3JjAX1lS?=
 =?us-ascii?Q?jm36VB1rhgNbHOMNCCAzFRDaj2wlSdq/Uso+I/EfGqk47drzadtHKjhYrkfs?=
 =?us-ascii?Q?1fp0m259ZpLhSrKFqUHQ21WmCW6THdCUWkyoeX4bKDT/TXfpwJr8iMJAlOCV?=
 =?us-ascii?Q?xPBiXWde3BU9ling/H2zopmn5E/Zx+EhyA37AkDxwddlSTffDMs/pQ07PVAK?=
 =?us-ascii?Q?NjH3QkVx4M/y9LuFFy4ZIdmVcF5bcIyXpGkYTf3ttVoS+/+/7dJd2tH94CtZ?=
 =?us-ascii?Q?IycdRdZX+F0aKOl3zb80emlkWgKHJMShbH69jrp8yUQbEoYQnQpOeA6LxIPV?=
 =?us-ascii?Q?GraO1upBWkNyuwq+D8C0UCZyQlc7TGrd3jO2GEmYQrJn8ukiCnkpozhxqkWu?=
 =?us-ascii?Q?LGUQ05WQb1B+yXr9NHWB3WUZKj8Vqjxw9gC5r7TebvqRyFBmA3xPzZL+5UF3?=
 =?us-ascii?Q?WZE11+2R/A+m8mvtJ1+FJxSSGYYGsRh4Tm50+b7eQi7p9k2Zn9PPsV3HFhgT?=
 =?us-ascii?Q?xaIujT09uf1IyOASxcnLf9cZU/FgEkn5ewXa22fxVOJv11cDvtvVZQ6kITN4?=
 =?us-ascii?Q?di3xDvpJqtLY5rvlEmRKZ4abUnNumXNwwiX6syb9KIqsFuLrXbcWcEZYg2+P?=
 =?us-ascii?Q?QnJg0h+Roi5hVoO0ClwTW1/ASU8MQXuQ4W+rEfWxLl2SWFpuY4JTpYqQivla?=
 =?us-ascii?Q?gW91EE1feV2IZhtMrjMJKjX6jvWyLd1rN10NgyRFUi6Su3IXsRkYkUd9s4TM?=
 =?us-ascii?Q?4grI7t6FOVSB4M3dbQ80YZQtzNmEI9sDL42Y/bdgeRJMEfbj/eRd3WQt4u3T?=
 =?us-ascii?Q?bg/OBpi//Pu+fWJzSlvFtBk8C77jjOeqaoXz0pyNaxQpVq7rZtnODi20LvN6?=
 =?us-ascii?Q?iiISABpcWDA5QeoayLzJ9kJZgiekAzeKdDlnuwRd1BzcWebMCL7uLJmZnjwG?=
 =?us-ascii?Q?X1bb1EGlBLbzymoXIL2NFn89auBo7ZaO5fnrVgHYZDSzo6mHS2JzRPAYRAfj?=
 =?us-ascii?Q?GzcXWKXnO0hW77bnwsxWlp4N9sY68iEfNko0jBzy6ewxs5N/cY7ZSekg95Rv?=
 =?us-ascii?Q?QEE1iX8gzl8J+N5bWDJ9rT1hD7gkVVWpm30r7C16sYUPZV0/D0rSQ7LGLv6M?=
 =?us-ascii?Q?R8g9bDUxdY2Gk4e2bG1+LrOR?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ea1e212-0e85-40a3-dfad-08d8e582b7df
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4989.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2021 18:14:46.9283
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yv24bKBFWneWFFYJjF60dS/6sOzRDiFynVn2rdLwZJtwbTtrWzxnUTH3a8Udju8F/tgyB/pDFICTVkTeim91ARR2xT5H3o33+ikP0k1Surs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB3958
Content-Type: text/plain

WARNING: quagga-1.2.4-r0 do_fetch: Failed to fetch URL
https://download.savannah.gnu.org/releases/quagga/quagga-1.2.4.tar.gz;,
attempting MIRRORS if available

Signed-off-by: Stefan Ghinea <stefan.ghinea@windriver.com>
---
 meta-networking/recipes-protocols/quagga/quagga.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-protocols/quagga/quagga.inc b/meta-networking/recipes-protocols/quagga/quagga.inc
index 6df72427b..6680fec01 100644
--- a/meta-networking/recipes-protocols/quagga/quagga.inc
+++ b/meta-networking/recipes-protocols/quagga/quagga.inc
@@ -20,7 +20,7 @@ SNMP_CONF="${@bb.utils.contains('DISTRO_FEATURES', 'snmp', '--enable-snmp', '',
 # the "ip" command from busybox is not sufficient (flush by protocol flushes all routes)
 RDEPENDS_${PN} += "iproute2"
 
-SRC_URI = "${SAVANNAH_GNU_MIRROR}/quagga/quagga-${PV}.tar.gz; \
+SRC_URI = "https://github.com/Quagga/quagga/releases/download/${BP}/${BP}.tar.gz; \
            file://quagga.init \
            file://quagga.default \
            file://watchquagga.init \
-- 
2.17.1

