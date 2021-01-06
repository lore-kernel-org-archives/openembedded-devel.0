Received: from NAM11-CO1-obe.outbound.protection.outlook.com (NAM11-CO1-obe.outbound.protection.outlook.com [40.107.220.68])
 by mx.groups.io with SMTP id smtpd.web08.4149.1609911222004954110
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Jan 2021 21:33:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=CtfjYPSh;
 spf=pass (domain: windriver.com, ip: 40.107.220.68, mailfrom: zhe.he@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DC1c/HFTsrixWycne6HaqGdkqkUoE6YmHkORDfKSyCiiY9AOgrN8ofMVsfEIA9hDUtdWcyiG9SWPdGYEGFbXddlfg0y1SJdrCKJ+MRDTs7acW7a1z3jkc7VGmDRbDHc1lo7nUJsXgNVR1TFJfM0FeFCBJaA8Eupn7TIQWTCsqS89QRN5c5+odWXAvKkQrfWTc+VdRcyuYxLkt9vCGANpOW83RqKrYOlcXS3xS5Ce7cnCg0CPgmWId64UeswgDiM2d1brTO4yQ86PMoeTiJkQm2BUlg8yIQsVZl3Mac6FH5RGix/OO4tGMi5cxFEvBztD7JR5OE2sdJkiWtA9EJzwww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=olW5i3NZVF7Xki+Gjapcu0EsCWdjryFEwxi/wY5VQbM=;
 b=oWeQh+4Xs5KvEdcQVA8sIFuvFa0j1HkxgpCH6GA/hyy+jBbBG2HGgLMBGuzZsnur7AW2ZHrWxZ8fW0Iz9zEVGSlcl7zqYOwIpaMIud7WEfq1Ia4eZLVkqqrRXUq9RXcV6FIszR7Hk0eyPH0ESM6bPAIVBlGbPUhv3xtUb+ks+15zKaJYhtEfBh2DKQJTKcN1NtBHiYZXpJKJOrN3oLtIyWXU87mVFT+mep+1+5y+UfUpAfiEiSUL4ZYAlnGWPm9Bf4HM8ZvOOwxArWZbfvRrCqhTotEmx1zrIJ+o6leDYqfCcybflNMpA/jXWazkhmritVDafmxtKDvZPWOwd+/HHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=olW5i3NZVF7Xki+Gjapcu0EsCWdjryFEwxi/wY5VQbM=;
 b=CtfjYPShwk7UJEsx33LAhKbbnE8vlGNFru3/FvbnKcD0z5EUKqd6HshWCnpIP6VPJAo5rqyhHRJjsztWMCoOL3RM7Iqu3yglQKWzsloTc6Bsm3lJytcbPDON/ODny7xJZ+HkpDJyEkLI8HDFVQ2UANaZJna41XrxvZgIKW9JEQE=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from SN6PR11MB3360.namprd11.prod.outlook.com (2603:10b6:805:c8::30)
 by SN6PR11MB2687.namprd11.prod.outlook.com (2603:10b6:805:54::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.24; Wed, 6 Jan
 2021 05:33:39 +0000
Received: from SN6PR11MB3360.namprd11.prod.outlook.com
 ([fe80::f013:6c05:9f97:ca7c]) by SN6PR11MB3360.namprd11.prod.outlook.com
 ([fe80::f013:6c05:9f97:ca7c%7]) with mapi id 15.20.3721.024; Wed, 6 Jan 2021
 05:33:39 +0000
From: "He Zhe" <zhe.he@windriver.com>
To: openembedded-devel@lists.openembedded.org
Cc: He Zhe <zhe.he@windriver.com>
Subject: [PATCH] lmbench: Fix setting LDLIBS failure
Date: Wed,  6 Jan 2021 13:33:17 +0800
Message-Id: <20210106053317.46699-1-zhe.he@windriver.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: SJ0PR03CA0158.namprd03.prod.outlook.com
 (2603:10b6:a03:338::13) To SN6PR11MB3360.namprd11.prod.outlook.com
 (2603:10b6:805:c8::30)
Return-Path: zhe.he@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-lpg-core2.corp.ad.wrs.com (60.247.85.82) by SJ0PR03CA0158.namprd03.prod.outlook.com (2603:10b6:a03:338::13) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6 via Frontend Transport; Wed, 6 Jan 2021 05:33:38 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7f70aeff-2476-43ea-9a1e-08d8b2049f7d
X-MS-TrafficTypeDiagnostic: SN6PR11MB2687:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<SN6PR11MB2687094694A6669F2AAABA008FD00@SN6PR11MB2687.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4125;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	0dgx5eFIL3tgjF7hfZGhnwNiA68Y5DtzBlNx5ytxYm6N5sM3GvtIyRhX03TgCQX+M+M9M0C+Er8CPRY21846e7w8r2qBm0CxSDGvpGS9eQ/kWAJZ8v1AFfU+lx1aY+OzMyDAXJmEXTHAwVCI8TyP3zZZFxQ1bAlgwlfj3Db9XMtCiElqpqoLvKrrm4U6HUy2NzhuMNhyzkTxA1CzL9d5vNPdyyfl2KYhyvLkvfPKczTDSq5uV+yPvHTv9D8wlDWWLQktS356LgSDMeBC4iW68JCKLTtXh+XExz7aFRiizw/oxuDwM75QcUf8q1JPNSM4BKdKw8sIB91ymey63SiLjGBxAiNr+8SHMYPW1eBw3m68UnwMdaDOLBkvXcct+jbTuEx5To6b47gkIsVE8jJUAA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB3360.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(136003)(366004)(39850400004)(346002)(396003)(36756003)(5660300002)(478600001)(6506007)(1076003)(8676002)(2906002)(107886003)(86362001)(956004)(16526019)(2616005)(186003)(6486002)(6916009)(26005)(4326008)(83380400001)(6512007)(66476007)(66556008)(6666004)(8936002)(66946007)(316002)(52116002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?AnxHSZXdyqKjVqP6NJM/Jv8y3VR4viWIDCs5zJT1DwoEPjSTmSTTrhycWps5?=
 =?us-ascii?Q?sjb/Wg6/UeU1NgnHhNo3QXGlMMw2Lezm7LHLhB12drQCbGW7836PnuvRpdFq?=
 =?us-ascii?Q?WKy3IIc8b7ySXO94g0K+2gD2Xlr5VNqsnmqdWsdAvbsFNUqdboI7Tcz9z6hv?=
 =?us-ascii?Q?lRiM/QKkBN/5ZJOrqsJdQ5qMEsQ8QE1vB7T6zI4ORu9oZ1F7kbKh7+uwmG4M?=
 =?us-ascii?Q?auOe2mAfdCcmJi6EQqcVdppLI1DenwHXalhZvo6gHgVT5zw2CD12TflNLkGo?=
 =?us-ascii?Q?AeSpAXxJtngqLAtve+tyZPQHxcFqov0kXkZUu0G4zNlFkaLVwMjYC3i53QLp?=
 =?us-ascii?Q?7856ovkXqyEWfuUThT3gXrNQBTEu1bGqG/xg48QazHp9Ja75l71t+eK2Dwzn?=
 =?us-ascii?Q?fQ9HpqxKHBxeNCrEFfjprh7mdvDNZM6qiH5jS8DhtVLFelwaQGWU4LsVhfEs?=
 =?us-ascii?Q?8FNTN6Fqqhn8N+Y423AY+uSctA9yUY12tC4/KoJneRgRPUdTVAAqZQDtfjgd?=
 =?us-ascii?Q?kM/bAfeQRgWBuxT5osvg+0KGu/9wcD6a964IHI7LFhkapc8+DZ4t9gvVnbZV?=
 =?us-ascii?Q?EnUZ3caHdMbC60E470MVUVX/AwfcDa4XLcbjbM0G4xkdukgS7bjrBbetmleS?=
 =?us-ascii?Q?LjlMRr8nrlX1X07Sz99+Zuy4v3MIVnPrjnAA7sWU7dthckoXO5Spbgds4qgj?=
 =?us-ascii?Q?hUl0ZdKd85zaOTptvOx3FBwr94G/v5YeevZh8TM2EXMEIRv1P/I9DIuxKwPq?=
 =?us-ascii?Q?sMzY7h3gHpRf08y+ff+B3H+yUc4bvbdQKKM5AKgGD3HU36Ja/L6pVbwsNjnd?=
 =?us-ascii?Q?XvRKOeyVc613rBnX7kL3hpyAPH1iJ+IuP/A6aCIzzN7sJyElWmDCPMsVktbq?=
 =?us-ascii?Q?/wK3AeV2gNekMaby572d9ceG+SPih0LD2ytkbXUrA6PhArVIf5C77hLFkGYJ?=
 =?us-ascii?Q?qqX2REXk2OkkhgvupXPGuFuyXqfai8/FPF/nao49N1FyJPT6N3uDgW8tMyWN?=
 =?us-ascii?Q?J9cZ?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB3360.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2021 05:33:39.6378
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f70aeff-2476-43ea-9a1e-08d8b2049f7d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F3hCnJrMbu4zfCjOEYML9YttgO4dvEyADcRd9MFf8pjSi1pRoZlNT42yi6INKJSPyNNQwb3+qwK14aQ7r3fP2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB2687
Content-Type: text/plain

scripts/build is interpreted as an sh script which may not recognize variable
assignment operator += and thus give the following error and fail to append
LDLIBS.

../scripts/build: 21: ../scripts/build: LDLIBS+=-lm: not found

Use the basic assignment instead.

Signed-off-by: He Zhe <zhe.he@windriver.com>
---
 ...2-build-Adjust-CFLAGS-LDFLAGS-to-append-values-passed-.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-benchmark/lmbench/lmbench-3.0-a9/0002-build-Adjust-CFLAGS-LDFLAGS-to-append-values-passed-.patch b/meta-oe/recipes-benchmark/lmbench/lmbench-3.0-a9/0002-build-Adjust-CFLAGS-LDFLAGS-to-append-values-passed-.patch
index 353d80b3b..1d5d9c12a 100644
--- a/meta-oe/recipes-benchmark/lmbench/lmbench-3.0-a9/0002-build-Adjust-CFLAGS-LDFLAGS-to-append-values-passed-.patch
+++ b/meta-oe/recipes-benchmark/lmbench/lmbench-3.0-a9/0002-build-Adjust-CFLAGS-LDFLAGS-to-append-values-passed-.patch
@@ -22,7 +22,7 @@ index 34a1371..3786741 100755
  trap 'rm -f ${BASE}$$.s ${BASE}$$.c ${BASE}$$.o ${BASE}$$; exit 1' 1 2 15
  
 -LDLIBS=-lm
-+LDLIBS+=-lm
++LDLIBS="$LDLIBS -lm"
  
  # check for HP-UX's ANSI compiler
  echo "main(int ac, char *av[]) { int i; }" > ${BASE}$$.c
-- 
2.17.1

