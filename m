Received: from NAM12-DM6-obe.outbound.protection.outlook.com (NAM12-DM6-obe.outbound.protection.outlook.com [40.107.243.88])
 by mx.groups.io with SMTP id smtpd.web10.1256.1615230184290540781
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Mar 2021 11:03:04 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=CuQh7UOD;
 spf=pass (domain: windriver.com, ip: 40.107.243.88, mailfrom: yifan.yu@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TUr3zckefza3AwlwnmTxPko7QLTRl0HibKQN0Fxkuh6vX5i8vodMJ7lEH+msic1jETQJA6l7r4j1AS7rFUzYIMRruQlNZwzudPozJFpdTq9d/xWM3eUl+MA5EHqqTE+nI2U80HIQJM8wT6ZGZLBEvFn23NgvONS+gPwkVnzh1ZTYJt8y53mKaD24XA0b4KLhUW+azVj3J2ZxV1Ui9LVSxa+QPvHd0PyssTiGe0DZVkqpr6YMjC1nhxv1EzURiuX+taB64qC03zFtUeP2WSfEmqjRDtzHMvSUHnY03szLGJEu8wG+kV7qiXM7p8gJCTrpcxeEB2I4461K6DogJ3oBHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YlUFMiNzCYJbuWImtWtnDC3UaizD3LfEHBlf7Ga2Sys=;
 b=RnsUME+Vzz43zIsQSi+UOLLKiKFVWM4uUqBitmF7CHcUiIUGHP759O8OPzmFDGg260kYAcS+aAjhOaXAS2aEgwjwx+Mwe4aSl3yf3hey2YrADS72OlKo0FBBZNC4cNrYpXp8+cd47PS8WTNhbJthkTmxsw7NpgaEZgv5FbRi9T1qnyvTCpdvZYkL1pRlklhBtD6T/Lsp01J/miMP4sxkWX4GiYBPPQnDkZX/2USWioJUgCT80aaForWLA+k6SeucPTHJ0PpN61hdft/lRzVllh2VVfkAkP80n1Abazjoa1wVeDozQfLCnE/x/jb/Qx8XfUJUa8rruG9PAp+BX4tp5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YlUFMiNzCYJbuWImtWtnDC3UaizD3LfEHBlf7Ga2Sys=;
 b=CuQh7UODok5Wg7xJv2pksC+v4uz2bIjW6Y+vHZrax+hGOOa70BFczY4m/UzJcZtfwUfH20Rq/5hjKRqI5lJrksKSR3C9TMabNwZTa1NOj/c576+wVYU7LE+EAOwbplFw43j1+DrKJWpRfGpyFPdWZvCeUOdk1TFzy23Vehj3ca4=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from SA0PR11MB4719.namprd11.prod.outlook.com (2603:10b6:806:95::17)
 by SA0PR11MB4685.namprd11.prod.outlook.com (2603:10b6:806:9e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.20; Mon, 8 Mar
 2021 19:03:01 +0000
Received: from SA0PR11MB4719.namprd11.prod.outlook.com
 ([fe80::24e6:c5dd:a024:807f]) by SA0PR11MB4719.namprd11.prod.outlook.com
 ([fe80::24e6:c5dd:a024:807f%8]) with mapi id 15.20.3912.027; Mon, 8 Mar 2021
 19:03:01 +0000
From: "Yi Fan Yu" <yifan.yu@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] rsyslog: Fix rsyslog systemd service not starting
Date: Mon,  8 Mar 2021 14:00:20 -0500
Message-ID: <20210308190020.14178-1-yifan.yu@windriver.com>
X-Mailer: git-send-email 2.29.2
X-Originating-IP: [128.224.252.2]
X-ClientProxiedBy: YT2PR01CA0017.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:38::22) To SA0PR11MB4719.namprd11.prod.outlook.com
 (2603:10b6:806:95::17)
Return-Path: yifan.yu@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from yow-lpggp3.wrs.com (128.224.252.2) by YT2PR01CA0017.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:38::22) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.26 via Frontend Transport; Mon, 8 Mar 2021 19:03:00 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f017c2dc-b7ad-45c8-d970-08d8e264cb61
X-MS-TrafficTypeDiagnostic: SA0PR11MB4685:
X-Microsoft-Antispam-PRVS: 
	<SA0PR11MB4685B2D76B1480B1BE2818B380939@SA0PR11MB4685.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:63;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	+CDUkyg5VS7No8cYVi2JltAW5yK/cfXI2OE/727M3zQngchK8C5adyWn3UzTpmFKkwQzhJzwiBjt0s9ICkJqaoeeE+5wshEBvo9nZhH6WEHpxAkYW1jJ6s8+pr3s6rUS3dG7CO41Herg9J9Gkn6KFO1TdICviECGYq1G3zwOzX3pke9peJ4JNqsul2gyOqcv5ggshEC+fBpv3f4l6ylxa7eK5RW0RaEcVOi1Uh6AcoM8L4eO/88A4I0enV17ogwC8+jsugF7FveXkDEVwoSvievOy/mgScPXS456DCcTfrcMhW13nODWLGtKYLLKVycDOyKkwNRFoRblqP7gSMqoW2JLGJX2bvtdHv2vRfBsxARjybWWmDZvKiooPgLQFfM5sNelNPNMPbCZTY7gsqpAXhqCu0b8obw9yM0/xeZ2fYjuERJaZcrex53ju+d+6+mPL/wcxSpWva1ikkVEud8u46RyoJlH45Ifd6naOzEgqA7uBWIVQ4YdqZyPOdRHYYi6keMD0jayEh5PP4v+eLIfzg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR11MB4719.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(136003)(39850400004)(396003)(346002)(376002)(478600001)(86362001)(4744005)(36756003)(2906002)(316002)(6666004)(5660300002)(8676002)(83380400001)(6512007)(52116002)(186003)(8936002)(2616005)(16526019)(66946007)(66556008)(66476007)(6486002)(956004)(26005)(6506007)(1076003)(6916009);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?Kxh/f4rNdVbtiNccaU1HXjLDKoC3ZUs+SpoUcyKVaIPgleQXCcZNwcHqGaHw?=
 =?us-ascii?Q?+yW06WeZ1bbt/NRTy2cU3SmeqSel+za/CzI/i8Pj0f/zPuNiVGVUzbWurc7y?=
 =?us-ascii?Q?jp3c81gb2ikRi3BKgLNtAlvaVjUaonjUSj3zb2P7zpntGXnRfMtkR/EPMS4p?=
 =?us-ascii?Q?oHpSY1hrd9CKzXanmCqfxn3hq72jGZfliYArPmrLtT0hVmsCSdeMHVGUv4S6?=
 =?us-ascii?Q?CSMtjiPYWLNJW3ruhQBOxh7nZleFve5QJJBfzndSeYTNlA9sGJM3oZ9hh8gy?=
 =?us-ascii?Q?quLMEmF8ya5wzDe/7WddGidZjF4ig12rEHY7hOQARvfoTKyHGqL6OKaUPpn7?=
 =?us-ascii?Q?5RKykJmaERNnSOgnD6BXdhrPXHoluxIN63dDX6QVzfgiun2SH+oYQA9Z7j+k?=
 =?us-ascii?Q?N92KaG787Rp8t4tqRk3GtEudTAffs4zp5bewb31yQprhYZ3FoK7wvwa1UnIJ?=
 =?us-ascii?Q?BnLAlbQC2bqYHgYKWCORYZG6gXbj6/jAVlFpgJ0ZmBjW+ZfWbo/ShnH+jISd?=
 =?us-ascii?Q?KacvF5gFOrPBxkbM392M9Ks4is3yyf6Ax1Fl1QqdcFUIQaVJqM9qNykTgMIe?=
 =?us-ascii?Q?Jf4gD7tXSfxv01HYIErWLT/wn76lVG0q4ao5ukONhDn/wmaJLDypolpAC8Pb?=
 =?us-ascii?Q?EfCa6dr6TCCzPt72y7XmuThXR6yuZ94bGp/7wAe+NsoEWsR57pvQocK0Po1V?=
 =?us-ascii?Q?jmIRliF7xC3RucMgZtAxl0Ta3bAQJvUw8oOjuUa2MXxt9TqnlYNsHcn+PnaN?=
 =?us-ascii?Q?0rdNzkli66N6yZUQVtqVqGoda7Ag74LfhAP7iym6njIhItL6r7CUpNrO8BWi?=
 =?us-ascii?Q?KjLnxSZA6jwY8496qlkRTQuajn/A7/v7sCmbvxY1gJuYlRm7LyzhQ7nvhdy6?=
 =?us-ascii?Q?cBDpI9GL0FKIKnbKVqtpf49VR7DQ32VU3+1E93915HMNI8UyUBpRBdXWBuud?=
 =?us-ascii?Q?2jnfAhtiYIxmomJJD9d2yC1+l9etKSBrn/yXEKIU9O8h3jKkmZ1e81DhGrRH?=
 =?us-ascii?Q?6mcVmr3eAQ5VsR3MG4E/33/51Vzb0Sjnz/EllCPowYG1sie6Zz6PqvXNyobu?=
 =?us-ascii?Q?wcDxk0Z/LqsvSguUpQxwUx5xv5taijvlVohQ9trwAobzklZy2q8T40lvBbMw?=
 =?us-ascii?Q?NDrAWVlZUpgpPvK8fx4bhIYbyGxGazn7Yo7zL7Q3Pi6TP+0FpOsnyDMmnZw2?=
 =?us-ascii?Q?pjO84ZeXu2EracBU+vHMAo7SJrXOmxw8pugS0rKc4ZhA6sYnw3VLjnhZintK?=
 =?us-ascii?Q?VX8mKU78xIvxv2umFOxXK1rqlIFSxMDHRX1jR9upyZIdVEO+iLN9TjlFIwxo?=
 =?us-ascii?Q?Jk8oHjD/dNBMWV3p8HF09ETk?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f017c2dc-b7ad-45c8-d970-08d8e264cb61
X-MS-Exchange-CrossTenant-AuthSource: SA0PR11MB4719.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2021 19:03:01.2074
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4lFRl9LdRBZzbxAKgCKddZQadjvUdukLXFBYnGD/zCxr/8ixInEDnCblN4y8qmjHe2RiOR+BWPXZiV6BRiid8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4685
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

$(sbindir) -> ${sbindir}

Signed-off-by: Yi Fan Yu <yifan.yu@windriver.com>
---
 meta-oe/recipes-extended/rsyslog/rsyslog_8.2102.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog_8.2102.0.bb b/meta-oe=
/recipes-extended/rsyslog/rsyslog_8.2102.0.bb
index 15e31cec8..22059d140 100644
--- a/meta-oe/recipes-extended/rsyslog/rsyslog_8.2102.0.bb
+++ b/meta-oe/recipes-extended/rsyslog/rsyslog_8.2102.0.bb
@@ -151,7 +151,7 @@ do_install_append() {
     if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}=
; then
         install -d ${D}${systemd_system_unitdir}
         install -m 644 ${WORKDIR}/rsyslog.service ${D}${systemd_system_uni=
tdir}
-        sed -i -e "s,@sbindir\@,$(sbindir),g" ${D}${systemd_system_unitdir=
}/rsyslog.service
+        sed -i -e "s,@sbindir@,${sbindir},g" ${D}${systemd_system_unitdir}=
/rsyslog.service
     fi
 }
=20
--=20
2.29.2

