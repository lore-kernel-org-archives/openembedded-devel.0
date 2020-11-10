Received: from NAM12-DM6-obe.outbound.protection.outlook.com (NAM12-DM6-obe.outbound.protection.outlook.com [40.107.243.79])
 by mx.groups.io with SMTP id smtpd.web12.22095.1604974529372714532
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Nov 2020 18:15:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=HzIwOlak;
 spf=pass (domain: windriver.com, ip: 40.107.243.79, mailfrom: mingli.yu@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bZvQUu+4XS1VV+r1F9Dyt9caQr+MlkNWVjtL0RaePtzsOZOCq6wkyvaxMKQ0HYF7PDfu7M0r1VS9v9csUVjUb36ypnAcYkZyQhyEvZvBdsPnzetJJNMgAK8XfL3Sakix407ke+cdFAXlOGhoHCtZRH1s+B9iQoboYERtF8TCh5v4AMcRf9gx90UOv7+reYPIODr0ccsi7OtpPxc7x+IDHBs8izvsLnCC+RHh9FStlNQT5aqxgTxsVmr+yJsGRxQXwutTN8gGZTgtH8SicT+qPPfT6Bcdxk20XQy7RncX6UxCWEaYiqMKzOf/gICrWXsgvodJx4+RDKAiKiQGULK4xA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hrDLPIzwzMaYmFl2R2M+ucV7O1mfw6dmaZ2fBn69sq4=;
 b=Ma2Jj3n0frioidOw5Ox+8ziuXW0nek4yPLN7JrM7jZkqiG/qxBIyX6imFHvocG4O0yMnM2N8vC0N9LCPlmIsQxYbXtRtDJNIeHdtjgUpQLKPY6E0bWhh3OrATcHN+FvxJKy+lAXy3K+D7fIXl2fSCIH91B9jnUQ1i4ibwKlAo5IwQznRMGgsB4YGL1qKVWjvfKra+akM1129cmRUtGXnH9Ekk9du3SD/1ehrnvOJsDBZsjcig5b7//MOzPYafyaSF5TPmtUUQW8Ru4Qumd5Z5112tQS2rHLrnWDmTSyb6DGRe+uiGN96tdDprkkH6ugNVUYok8QsdMS3DoD5+Xplhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hrDLPIzwzMaYmFl2R2M+ucV7O1mfw6dmaZ2fBn69sq4=;
 b=HzIwOlak/uUcSgrb+SHs2t9Wjyv+ge4nS1LqA42jBdSiUJ+KV6PqHbft29AG9nXKc/DgdV8pTykcONQA9jM1D9gVBI2wRfuApmtIU5yxpDqa6ZOBMs2He5jmE9/cUDNL4dA2qAbaptUtY3SbO8z0301jI65Y0AzhBgCiPfFxZEY=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=windriver.com;
Received: from CO1PR11MB5009.namprd11.prod.outlook.com (2603:10b6:303:9e::11)
 by MWHPR1101MB2109.namprd11.prod.outlook.com (2603:10b6:301:53::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.25; Tue, 10 Nov
 2020 02:15:28 +0000
Received: from CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::105b:9105:2a38:9e9f]) by CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::105b:9105:2a38:9e9f%7]) with mapi id 15.20.3541.025; Tue, 10 Nov 2020
 02:15:28 +0000
From: "Yu, Mingli" <mingli.yu@windriver.com>
To: raj.khem@gmail.com,
	openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH] packagegroup-meta-networking.bb: add ntopng related recipes
Date: Tue, 10 Nov 2020 10:15:13 +0800
Message-Id: <20201110021513.12619-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <CAMKF1sr3Ntwy_H6QsxVAHJaT2unc=pw9z0z0ecNANP74850j+A@mail.gmail.com>
References: <CAMKF1sr3Ntwy_H6QsxVAHJaT2unc=pw9z0z0ecNANP74850j+A@mail.gmail.com>
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HKAPR04CA0004.apcprd04.prod.outlook.com
 (2603:1096:203:d0::14) To CO1PR11MB5009.namprd11.prod.outlook.com
 (2603:10b6:303:9e::11)
Return-Path: mingli.yu@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-lpg-core2.corp.ad.wrs.com (60.247.85.82) by HKAPR04CA0004.apcprd04.prod.outlook.com (2603:1096:203:d0::14) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21 via Frontend Transport; Tue, 10 Nov 2020 02:15:27 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0a72fab8-c8dd-4e58-9865-08d8851e7dc7
X-MS-TrafficTypeDiagnostic: MWHPR1101MB2109:
X-Microsoft-Antispam-PRVS: 
	<MWHPR1101MB2109BDB301B6C4CF122E47DAF1E90@MWHPR1101MB2109.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:626;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	dFh1/gOTfVrdtABMeZobmyUiwqw6l+aGCwVbnbSo+DmigsdduhMv7pAdlqI+mtOHST77J3/VrVyj0JgQW3lHpcOXash53xoMK/QyOi8qhQgNLnOmcJqzYq5SCw7uUu10WTC8Iopa1EqEZSUxMblUJ/ue/S4Jp/bo0Y7kRGZ0YPS56Oq4F6V9HeIyqlZZ1VAA2lh5/Oc0wdqkFAHa8grqQR42+yikFBIMRmG9tVVEexsV7Khk0qqZ2SjwEgkCL9GceIeD9+OU/g1i1BbxswscLQLULl2Uw+oEt1lYysmdtAxWrqZjKkwHEBYPKlR42quIwM1TIHolLGavJgeO7fIYCw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5009.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(396003)(346002)(376002)(366004)(136003)(6486002)(66556008)(6666004)(36756003)(8676002)(8936002)(9686003)(66946007)(4744005)(6512007)(5660300002)(66476007)(6506007)(1076003)(478600001)(86362001)(316002)(2906002)(956004)(186003)(2616005)(83380400001)(26005)(52116002)(16526019);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	qvziF/kZ5vWi+osQ2C8EBWC1tOevL51q/LmW7ePat7HGUVo/hl6oSiIKg+8VQD28tw5zxIpfHZD1LW/7AB4rrxxr2k9oTnPpXysC1E8fwtwgIeZ/rIviLzm+369UxnXaawgtiH7rJfzC0ysiJeK0rV2Cdfi8QAyEZxtpT1M5gWZVEN0pidnsKPPqfuBaPEef3eILK4zAqK1pk083oqe1gg8YIUYpvKES3FaTZVuPZpKgjnChfhifnPzeLtKVgzG4xJ+PhkQYML6xjRJJ3um4Se5ht0/+ONoyH1xOjTCSQc1//VOwjUAWNULwm8RC5SC4mI8v+EaFgBI2c/8TYDfSVg/fIWiM3xuqmGsI4ev1W/6wyXoOuAjQNiYFeMoiNrO5GzDWk7A5ggSkOXVGSORHjj9RH1K4mHp8eQz4bTK7BqDO1f2fE5ODQaKBOzwH2d9QvrdGGTYVuu6wtRx3pgYVvHQHKQalpOWuhiyRfeEJCzEGECm2fZa8xR6wjlV06xS0mFMRdU3ohBFhsIkqyMoK4gwO6r5Ard6qcGXgtnOCVRybj1L3MoZYvwDetbEf6y30qHKY8DeWd61VYcJiJogMuoIsKyOXKgawFWA50Eub0/Px7sa3q7yDtVuiag60Ykad596wxOXya3lI4BIFV06HYk2Yb0mJSUKoZb1MtOtn4d0QY0i181vmjuNtaa0gogDjRI99fCRHYpNvjJiMXjNmFU8hn5/aKKl0tC7qnPE9vywpBxBu1NBtUPPWVVE9vgFjTzwvLjgQ8meCIC+AYyPmQz0+WKRtFROEOFszGrqokQ/TtK9y8O7Ota+EmDEfo/w0ShkR5Ck7uWQnouNu6QaciVIjv9Tv8sJQYFUx4v71BBpJNrLB62bL6PdHiNHHVScbvVhGBt+kr/ZgtTkOIdmB5w==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a72fab8-c8dd-4e58-9865-08d8851e7dc7
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5009.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2020 02:15:28.1548
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KffVVbltTmP+ThA2X00epmFLknT7DLlWbCL0DB60WnCg8x+0QERPZprvqBDvfE2uGdidb5q6hKOFNRIAdWSVsg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1101MB2109
Content-Type: text/plain

From: Mingli Yu <mingli.yu@windriver.com>

Add ntopng related recipes and remove the deprecated ntop.

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 .../packagegroups/packagegroup-meta-networking.bb             | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-networking/recipes-core/packagegroups/packagegroup-meta-networking.bb b/meta-networking/recipes-core/packagegroups/packagegroup-meta-networking.bb
index a9dc6a13e..1a34c4b34 100644
--- a/meta-networking/recipes-core/packagegroups/packagegroup-meta-networking.bb
+++ b/meta-networking/recipes-core/packagegroups/packagegroup-meta-networking.bb
@@ -220,6 +220,7 @@ RDEPENDS_packagegroup-meta-networking-support = "\
     macchanger \
     nbdkit \
     ssmping \
+    libmaxminddb \
     libowfat \
     ncp \
     strongswan \
@@ -232,7 +233,8 @@ RDEPENDS_packagegroup-meta-networking-support = "\
     traceroute \
     tunctl \
     wireshark \
-    ntop \
+    ndpi \
+    ntopng \
     nuttcp \
     nvmetcli \
     open-isns \
-- 
2.17.1

