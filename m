Received: from NAM10-DM6-obe.outbound.protection.outlook.com (NAM10-DM6-obe.outbound.protection.outlook.com [40.107.93.65])
 by mx.groups.io with SMTP id smtpd.web08.6074.1605771719566611949
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 18 Nov 2020 23:41:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=HXQeEMfB;
 spf=pass (domain: windriver.com, ip: 40.107.93.65, mailfrom: kai.kang@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nhVEyjg4kOzmVzac2TKOb95YtslxHBV4TS5V6KfezT2FIGtfWKMIVGHfiBzECNjcc4PTUJJMd/m22cBhR2Ff5UtNsSj9cZGTdaPjVAqSPIl+ExWWdFrCPbZeqrSx3ao/19FY3wtEbR3tOqGqdAiFaisY/0vMhekMVtMxUtFyi1IMIj20/SV2rluIzEw6Y5C3ES2dzGDqcrvwN6DT+DVCcjCxJ6eo1PAlBkeyenFiF6HeKI0pFec4NEzoO/t7ayt2XUXRv5/TvQsI7gfaZqrTt3uQ1211ymMnR37dvr2zrUOnWR9ei27iGZiZOTJq4BKJ0yjUmyuFuqb1kHM/KMvcPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tpOj8OYcanOwrZKxTf50Ak2ZgNbN+wChjDzoyVLY4Cg=;
 b=b9EI3HvET2SEpNyg5f/XjV29W4M3qgyQFhdP5EOJeeB/sgAo2dTYuf3RWcjX2pH6XNWVjnrp/95xnn48LoFMQuDmA3xl+Vox8rQeJJetvAno+pxQa4/zjFT4fe8U3CYtycWAQR/Tv/Gy0y6CS5qONNjl74yoQnkDxw9DjphVFVGYN3zBxTGreJ+pNHtRlhOUxMI7uxYJGrgj+A7Hdmfl6jxtNFNKbxiusmLkjVAPx1j8Fqk8QhRRcEPnqwBzpcl7KM0wBnHAMTOpeSl7MsohB8cfREVegVlDdovggIJAugfntCeMhjr8vzh+jHrL0NSI1Xmh8V70cHmoqFPYZfPlTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tpOj8OYcanOwrZKxTf50Ak2ZgNbN+wChjDzoyVLY4Cg=;
 b=HXQeEMfBsN00Cnh6NChzYQNvAEi8052xy5YRiAmQVIvV58xCrLF1vYC8166SfezzrJUao39bB1wgP14nXBaY0HLqVM9TPe43IKQgX6rwFJCcD8dyMPr1BZ5J/vYv/07dKKl6x4QYUB3l6idoEsEULX/tINCP8JcbZzcwBgGwVak=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=windriver.com;
Received: from SN6PR11MB3294.namprd11.prod.outlook.com (2603:10b6:805:c4::33)
 by SN6PR11MB3055.namprd11.prod.outlook.com (2603:10b6:805:dc::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.22; Thu, 19 Nov
 2020 07:41:58 +0000
Received: from SN6PR11MB3294.namprd11.prod.outlook.com
 ([fe80::b49d:2c09:ddcc:f5e2]) by SN6PR11MB3294.namprd11.prod.outlook.com
 ([fe80::b49d:2c09:ddcc:f5e2%5]) with mapi id 15.20.3564.028; Thu, 19 Nov 2020
 07:41:58 +0000
From: "kai" <kai.kang@windriver.com>
To: schnitzeltony@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Subject: [meta-xfce][PATCH 3/4] xfce4-mailwatch-plugin: 1.2.0 -> 1.3.0
Date: Thu, 19 Nov 2020 15:41:33 +0800
Message-Id: <20201119074134.6963-4-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201119074134.6963-1-kai.kang@windriver.com>
References: <20201119074134.6963-1-kai.kang@windriver.com>
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HKAPR03CA0031.apcprd03.prod.outlook.com
 (2603:1096:203:c9::18) To SN6PR11MB3294.namprd11.prod.outlook.com
 (2603:10b6:805:c4::33)
Return-Path: kai.kang@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-lpg-core3.wrs.com (60.247.85.82) by HKAPR03CA0031.apcprd03.prod.outlook.com (2603:1096:203:c9::18) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.11 via Frontend Transport; Thu, 19 Nov 2020 07:41:56 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 85dd72e0-bb9d-4cf4-4088-08d88c5e9800
X-MS-TrafficTypeDiagnostic: SN6PR11MB3055:
X-Microsoft-Antispam-PRVS: 
	<SN6PR11MB3055F44548B0482D41FADCA095E00@SN6PR11MB3055.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ryqcKZ78Qjxeak1OiB/RkM7of6khtCOy1S8IwtHl0cVFCIViAg+6vtzgDiDusabcJj4S4myYJcfkAA6JMamZQvw88QK732F0tPLg6c5rGl7L4sBczvYGF+IVC3Ld6jHLf3uyfgidjJXTBOVrQQU8G5wLFwLe9mzXg5pGw2J1LqGt0BibepS5NLu1XOx1cWHjmvM9VKqk7YRc6EU5jl3EmpPY7v3ijCGniXg/bF74plnvlX/Ipt/cgXLRKw2+YoaktT/68qNyn/mRACWr3V+Bfjn4ByV/FuOVBUVC3l7PN+1OwnOftY4WeKnROYAeGAyK
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB3294.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(366004)(136003)(376002)(39850400004)(396003)(9686003)(6666004)(8676002)(2616005)(6916009)(6512007)(956004)(6506007)(6486002)(316002)(1076003)(478600001)(8936002)(83380400001)(5660300002)(16526019)(52116002)(186003)(4326008)(66946007)(26005)(66556008)(2906002)(86362001)(36756003)(66476007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	u39NW90IHWmRsxw/CwjuIxb7NIoxIQvIGpthpZ6dFu3fgCKpeq3J20QiHQyoqLIRVtvfMgWSR6B21VikibActETAGe3HA70JvT8OL2JnUuJLoJN4az+dndXOHffyaCuGr0Lxny0XbkXsPpimgjbb5H/YB6lMOraLWsK23WshBz6GakoxZTBe8y7521Db52FL48aeyrnZyIdw6XY4UcBwxT/kZioH5SoyA6nf2t+FRqlycrOD6XAvntYDyOtcJjTcL3nbAtBUenVguq+tb+VmrcWveUthMvMwX8rZOMkh8kde6a7pRQl2ZBFhe7Erh3RExvtPybYojt2Yp1EbCM9JD1AahL2G1wHuc2OQVckjmF3p6r3MWhDF4//QOlgmtE5sttJWMIK07WlZODW+FJoQvBtdDnmkCOjZOno6zegILiGP+QGiZEdoedclicP93KtpadgFSkhNpMq90jAWIcnd5afJ20wDgx7Gq0lipQvmAs8apf1kN0aj1VAn2dDQY1TrXOGIGl/4xwHO4EEgNEXlkK2gbMVN8Lvl285RNlLhObheVHIjYHQ76ZjHVmOCDuAJl5UJr9YwgXvvU9YHS/1RoHYTPmRRNkhM8ZiZhWk5VY6LISqLIeG8zHryL4lTrjt4gyZpKKbj5VuXZ8TOSGuUWA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 85dd72e0-bb9d-4cf4-4088-08d88c5e9800
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB3294.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2020 07:41:58.0641
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YkSiCHkdS4qVQnvGQO8QJFzD/QGBQrvvDY152GaeNp2Cems9NpJBtgATdfzmYqMp3+9xzs7X8dNpaJ5dgPXOEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB3055
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

1.3.0

- GTK 3 Port
- Remove Libgcrypt dependency
- Move "watching" column to the left to avoid overlapping with scrollbar
- Add support for XfceTitledDialog new API
- Fix cast to pointer
- Replace deprecated GTimeVal
- Update URLs from goodies.x.o to docs.x.o (Bug #16167)
- Added support for multi-row/column panels in xfce4-panel > 4.9
- Fix running command on each change of the count
- Fix running an empty command
- Do not run command when new message count is 0
- Add SSL support CFLAGS and LDFLAGS conditionally
- Translation Updates

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 ...watch-plugin_1.2.0.bb => xfce4-mailwatch-plugin_1.3.0.bb} | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta-xfce/recipes-panel-plugins/mailwatch/{xfce4-mailwatch-plugin_1.2.0.bb => xfce4-mailwatch-plugin_1.3.0.bb} (70%)

diff --git a/meta-xfce/recipes-panel-plugins/mailwatch/xfce4-mailwatch-plugin_1.2.0.bb b/meta-xfce/recipes-panel-plugins/mailwatch/xfce4-mailwatch-plugin_1.3.0.bb
similarity index 70%
rename from meta-xfce/recipes-panel-plugins/mailwatch/xfce4-mailwatch-plugin_1.2.0.bb
rename to meta-xfce/recipes-panel-plugins/mailwatch/xfce4-mailwatch-plugin_1.3.0.bb
index c8224148b..c4172f4d6 100644
--- a/meta-xfce/recipes-panel-plugins/mailwatch/xfce4-mailwatch-plugin_1.2.0.bb
+++ b/meta-xfce/recipes-panel-plugins/mailwatch/xfce4-mailwatch-plugin_1.3.0.bb
@@ -5,10 +5,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
 inherit xfce-panel-plugin
 
-DEPENDS += "gnutls libgcrypt"
+DEPENDS += "gnutls"
 
-SRC_URI[md5sum] = "7263114ec0f2987a3aff15afeeb45577"
-SRC_URI[sha256sum] = "624acc8229a8593c0dfeb28f883f4958119a715cc81cecdbaf29efc8ab1edcad"
+SRC_URI[sha256sum] = "20f91ebefd2880b27f421f773115b3740f67de2bf60feace3841bfd1a09cbe2e"
 
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
 PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,"
-- 
2.17.1

