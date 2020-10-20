Received: from NAM04-CO1-obe.outbound.protection.outlook.com (NAM04-CO1-obe.outbound.protection.outlook.com [40.107.69.72])
 by mx.groups.io with SMTP id smtpd.web12.1806.1603177292508946689
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Oct 2020 00:01:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=EHeT3QB0;
 spf=pass (domain: windriver.com, ip: 40.107.69.72, mailfrom: qi.chen@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mfVK4p8+KFqKEvwlMHK8lB4rXN0Olgl0m9t/EoH1HXzocnvPjsanRYCTHwxNKcR2eC9yWYp8+LcBF7VDXESjTEh2IkHAQYpkU4eb/RYOWJAgIKgLAI3uqrPbk4SA6kDot350buAWLBz0sTeWTyDW7OTGXmZ52qdL3Lc2R1zUK0Unu9ORrxw95zoo12tzd99wI9NsDHdVp8PxvqAfWc2qNmy+HwLJaZdZ3yTk7xpi8AwWvYJadKtaAwLotVfuKwVdkE0HaoPrglh8aCF0ihCalyHPeDl4dy8F57AKDk0tBI9XOj+gpZxBjOzjN9Mv3bheTGweAg9tbSjbKaAMeHyCSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ilBnAnfkc+zZZIBZ3ZjIHMvdnkrajjhcgBfG1llHBRg=;
 b=VZPL2T/J8lqNDbqUzjqNwVs/xyI3/Bg98bw2Ozm7lAF9VFSCjsNgoeHYLUvuj22fM6oYCBGqapFq93+90m4HSlOfGmNy4YunrIScp89tHsNbOOStnuShQqMAni7nCB1+za5NgaNhtHVI6EXDAAdJk+Hbcz5oHz5wvBLGmSdx+HNYwIbLTXXE+z+eeoEZpvQ8c4IW63hitYDSHuno+0vuERaBCueT+wJRFJiCiiE1q+W/scXErjABzbHwrE5tvjVHm3aam8c6TXiHokSv6kNXlx9X5Nhh1OZQ52QcAik8aKObSpbcR01uHtcj1GmTvL1ludJRxHChPNTG2tcVfEOOYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ilBnAnfkc+zZZIBZ3ZjIHMvdnkrajjhcgBfG1llHBRg=;
 b=EHeT3QB0eBs/8HbIzjUyUJ9VKe9L2XaKRHDqK8p54jmGZawSF9GIGFZxSe8e7EDjUoLMd+/XKHUcbKQKNDkqPbi/Tl9ojFC+EMdc0SefGw3jNcVAsfn9ANnHJw5cfVS0KNl1UelPNdhub3t0jAhBa+pvHYwYDG3YEMNCe16CZeI=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BYAPR11MB3480.namprd11.prod.outlook.com (2603:10b6:a03:79::27)
 by SJ0PR11MB5053.namprd11.prod.outlook.com (2603:10b6:a03:2af::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.20; Tue, 20 Oct
 2020 07:01:31 +0000
Received: from BYAPR11MB3480.namprd11.prod.outlook.com
 ([fe80::c4a4:4e3d:3154:98e4]) by BYAPR11MB3480.namprd11.prod.outlook.com
 ([fe80::c4a4:4e3d:3154:98e4%5]) with mapi id 15.20.3477.028; Tue, 20 Oct 2020
 07:01:31 +0000
From: "Chen Qi" <Qi.Chen@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-networking][PATCH] freediameter: use /run instead of /var/run in systemd service file
Date: Tue, 20 Oct 2020 15:01:15 +0800
Message-Id: <20201020070115.19965-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK2PR03CA0057.apcprd03.prod.outlook.com
 (2603:1096:202:17::27) To BYAPR11MB3480.namprd11.prod.outlook.com
 (2603:10b6:a03:79::27)
Return-Path: Qi.Chen@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-lpg-core3.wrs.com (60.247.85.82) by HK2PR03CA0057.apcprd03.prod.outlook.com (2603:1096:202:17::27) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.8 via Frontend Transport; Tue, 20 Oct 2020 07:01:30 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 01828a06-9933-4832-553b-08d874c5f937
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5053:
X-Microsoft-Antispam-PRVS: 
	<SJ0PR11MB5053448907D3DD29049EA90BED1F0@SJ0PR11MB5053.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:439;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	UzU2tX5VoV41peb64AMLS3NPcW8UFI374r69JhCZ+XjII3lvzXZlltmDLDy8bKXwablg+xgjRdehXO0a8LhFRvVZsa+ojRh4B+zAg/p4s9DXF14w0P8GSaa8Ofx9CNnLfl2wYWkYPT5F289u/zk5+L0sNLJZPZEQb6tG+Rzrvet/Kz64MmkHYkywYCWGUOQt++AEZtjC5xeSypoIkKk4GnAN21YmY5AyGd+/liQbcX+Ef4YtcNLRZybiv45ReUPqaLOumuLjzpUdIRD9j0Gdp0LYVRnzmwRAd9itJE1DcDpxAu2VDHEttcT4x7s5xqOKgmIDuuaEfsxvBIcZkRU20w==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB3480.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(376002)(346002)(39850400004)(396003)(8936002)(52116002)(5660300002)(6506007)(2906002)(8676002)(316002)(83380400001)(6666004)(6512007)(186003)(66556008)(66476007)(26005)(36756003)(66946007)(86362001)(1076003)(478600001)(956004)(6486002)(6916009)(16526019)(2616005)(4744005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	Z3CqhcTsBzo4YSHDgl70Wn55QNG8JdbP9QIB21ew+1X4wpDo+/C5iu+7UrqwvG3Drsrkn9jJZgkU6c/JO2KD6ZqweHEafdpOpklO1886a5/VY0P1z7LVISY7uMPDN3xEpsZhMpTv1AWUgwbi0pjrO+Vt0lrFK+KyS92giiXxvA8sWIw7D1S70NOJK0JD8rlJfYsEugE3sfNZvtG3MnoEUMjT8BBC9nd+cSMStpVcQljPCLwGAZrcRqP9LRm+UZdqE7c2Vbc6NeeL1LO3dejzXXdhDodMHz0sePm3Dimv8aY5fxTDpShgKoYScp3cpyWm0662Qo0t2iv5AmLp78pT9ZMgm2joT+TNRmh68zoAS0mKkstfzZxe9MoCtMvKAyzc//HDIgu/7f8hgABmQm8+ee3XrpXkR+W0KBVhNDLRcC/G8CT7s6UmBG1mzRPvBxkIwXN70yh0kfHG10WFKCb+HEeCoh7BE3+GqaVoY2ifEkn+yltlKUEXC5Zf94ENsoA6K9GlLstG/JOyOC09DjOgqILYNHziNAMYHEfzbOlC9T5Z1M1/tuzm2s2AYxppnyVyGNrt8JZOpbPy5/usd1CuYVHIrLD9yetqv9U+OK563ndAIXOdV0Jacof5W6lvoljpJr0J0BvLlcNuuKHGke/lqw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 01828a06-9933-4832-553b-08d874c5f937
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3480.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2020 07:01:31.4475
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TxsAj3pvIJq90I6D4728asDWZFTW1ES7UCLVkdvgS+E45HjJWXxNuaebF8FDoAvSrASay1dkIkys3NZDTCqhRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5053
Content-Type: text/plain

/var/run has been deprecated by systemd, so use /run instead,
as suggested by systemd.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../recipes-protocols/freediameter/files/freediameter.service   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-protocols/freediameter/files/freediameter.service b/meta-networking/recipes-protocols/freediameter/files/freediameter.service
index 514481b43..70ed3803c 100644
--- a/meta-networking/recipes-protocols/freediameter/files/freediameter.service
+++ b/meta-networking/recipes-protocols/freediameter/files/freediameter.service
@@ -4,7 +4,7 @@ After=network.target
 
 [Service]
 Type=simple
-PIDFile=/var/run/freediameter.pid
+PIDFile=/run/freediameter.pid
 ExecStart=@BINDIR@/freeDiameterd
 
 [Install]
-- 
2.17.1

