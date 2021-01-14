Received: from NAM04-BN8-obe.outbound.protection.outlook.com (NAM04-BN8-obe.outbound.protection.outlook.com [40.107.100.41])
 by mx.groups.io with SMTP id smtpd.web11.2358.1610590229083096650
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 13 Jan 2021 18:10:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=CPgYGhq1;
 spf=pass (domain: windriver.com, ip: 40.107.100.41, mailfrom: kai.kang@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eYV3NIzDXkp4KMGJW9q61fHvI0PEwWtSb7UlvwQO1erM5WBvA+Z3YJQQpsQzKF922bo93qUrQBBnOZi8kwuALpJg5lqcJNQANwB1fLsVvmMWf2+aQSk6SyJdycNQ+wpYyfHX+Pm1N6j+pi21jK+zMVMdl43dZMGFzi+8bps5EoivOBDjHdVPTW6N3Kw4yvly3uJAW4tvykPSPhazPzklrSXTDQfk0G/qSdyinB6Wa3NXsKV6lK9/jRfyG/sNo5UHDR0ApizmBY1BYJF6vab0MBTfkbUtv3l2UG60aku2qlQMD6cLhgKKyKGi6h9zWGoJ8mp9ZzH0QaLQ72huTu2Erw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R8VgC4+9U4BVPJUO/irNcEnbo2/dse1S5kUO+odKy14=;
 b=XUNfVLTg+mgGWWkkKQRvtPnfV4xRVc8S4qaVSL0xb3LWoMR+9RLxFgKDgj2yq4xyN6OVd2ERnIfAzID9fiYoC/fejn2YMywh69IDFFv0EVlFkUqpHJdHQ0fj0UJMhsnh3QEMtIByq5kzlOKFLCBWtJO+cKAxfNBEPsqcb2xSjmjwsKWEowwCNIhUngwktedmQP7VsA1ZEu+sYhGgsQaq/rewMEyoy2u1dzXsJgq9P28Js6H85iW21vGeGz8M+d+s5rzW2Xbzj+bKwX4ujcVnwdFEOqgpkQhXXKFzsMzPyT5YM8fD/7ufXSQfEgFLiRl6FTvcnTFhH7i5ypk7U3Vx8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R8VgC4+9U4BVPJUO/irNcEnbo2/dse1S5kUO+odKy14=;
 b=CPgYGhq19jDCbQ+X6yotY1OWTFlYJ4Tqu9jJ/GSD2qYXs+oDAgh3QwZwLGLhc5SVV44kMtuh6+UYLvH0DtKpkOOJIpNnak/pY4YhR8Gsk7a7Nhgci94z2UYTGOK2Jiy3DM9AvKCsDhauWIpBHdtvcAhlQpxOXmZJNKpvchL1yU4=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=windriver.com;
Received: from SN6PR11MB3294.namprd11.prod.outlook.com (2603:10b6:805:c4::33)
 by SA2PR11MB4780.namprd11.prod.outlook.com (2603:10b6:806:11d::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.10; Thu, 14 Jan
 2021 02:10:27 +0000
Received: from SN6PR11MB3294.namprd11.prod.outlook.com
 ([fe80::b4b5:fc79:127b:66f4]) by SN6PR11MB3294.namprd11.prod.outlook.com
 ([fe80::b4b5:fc79:127b:66f4%6]) with mapi id 15.20.3742.012; Thu, 14 Jan 2021
 02:10:27 +0000
From: "kai" <kai.kang@windriver.com>
To: schnitzeltony@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Subject: [meta-xfce][PATCH] xfce4-panel-profiles: fix do install failure with dash
Date: Thu, 14 Jan 2021 10:10:10 +0800
Message-Id: <20210114021010.18900-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK2PR0302CA0022.apcprd03.prod.outlook.com
 (2603:1096:202::32) To SN6PR11MB3294.namprd11.prod.outlook.com
 (2603:10b6:805:c4::33)
Return-Path: kai.kang@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-lpg-core3.wrs.com (60.247.85.82) by HK2PR0302CA0022.apcprd03.prod.outlook.com (2603:1096:202::32) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.6 via Frontend Transport; Thu, 14 Jan 2021 02:10:26 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f658c807-fe4e-417d-f80a-08d8b8318fb7
X-MS-TrafficTypeDiagnostic: SA2PR11MB4780:
X-Microsoft-Antispam-PRVS: 
	<SA2PR11MB478081E08D5AE0782AE1AA2595A80@SA2PR11MB4780.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3276;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	rL7uGESp8MKEqb8SvSkbPFmp7i/cKJcqNJe/XmUv99WcXZL2Oj/YG7oqcx7M4zlQycqY3vm3oyo73GRZwak1CSZ/u3BWYFQtEkEJZcEqhN8UnO3N8JqyFodSWOAYxw03orcVRbGMTvSoCPBoIdeaJWM3DnToBwKNimcfOEQMAqUF5H7KnwXPS3LgrY9p3wvltPKCTIMbakZKLS3Ioaj1ALG5nfPHkzrQvxfulbIEn2WQ/tzoQlg1g5uYzzFhHsXCJETciJvCxydCglvWBmQioPW/8VnS+75FuOABjZId2n8AOLa3ewYb/QSxrr/zOKoGK9Yqac0vvwpXZgoZRWRgJPTCEYOb97KUGzauKRYTI4O4kfXSgA0AsGuHRNuPXyb+75V6dWQSZsOdyu+hPDHw57Ou4E/omAtL9r3UJnoZcvJ5pfZi0MZddONLS97fcOVj0jsdrUf7i35SGZF1hMonYA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB3294.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(136003)(39850400004)(396003)(376002)(346002)(6486002)(2906002)(6506007)(316002)(8676002)(2616005)(956004)(19627235002)(9686003)(86362001)(478600001)(26005)(8936002)(16526019)(66946007)(66476007)(6916009)(6666004)(5660300002)(186003)(4326008)(66556008)(6512007)(83380400001)(36756003)(52116002)(1076003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?a4AIGNUDPTaqL1csw9CJSQSut/1CQrBGiPZkYr6rqMhiokPohxT1TlBa72HM?=
 =?us-ascii?Q?4M8nKCRipbvJSowotXptNDfSl5YQcuAo5Zf2LJzZnZLHMSSJKIUWwECiuL7c?=
 =?us-ascii?Q?BnGT3kZNqnNEZWyJjkFDgJJliL9zJSm9K+csjuXf3VXdfjd663vE9uXxljgz?=
 =?us-ascii?Q?5Bw/UQTSXiTMTBFZ/wWnNzldJJ4M0Zpw0wK5iA7g+h4AK4yCUY1lDScD0vuv?=
 =?us-ascii?Q?xvIZPFh11kWfE+kjSg8Ib9dwsy6GcAxwbBonahrNOvVd9LVTejPTM6CRymK7?=
 =?us-ascii?Q?EiiGvLIs20SOmPzKAxzi+yZYS2UoKZaqWSMHZ/BjTa+v+bCGGDLfixlGmXvi?=
 =?us-ascii?Q?0VETJGeuGjUg3eyMpUsQsxD0bso3t+TRVMUYH1+rUvWcx30meDwKJXBxub2S?=
 =?us-ascii?Q?FvTVZDEtHNtMDDup1TED/ZYQAE0/PTfd2LMAzHD+rb7JHfTnAh/oE1qsF2WZ?=
 =?us-ascii?Q?3/zht+FVTg0IytQnnzhjWvhymhZPM9M32wZmpBcNHYd9fnqYI58N05p6rqWv?=
 =?us-ascii?Q?BJRajonHBSghfy+O402u/nyWfCBJqKdKzl8R0b13JlK5dzNLaVqGdfSu6+9M?=
 =?us-ascii?Q?/KGkE2ERhK5+H6S4UWZTtoB6ataVUX6nHEeUaMC7vYxofegEgLQfijAEKPkW?=
 =?us-ascii?Q?XS6h4POCKIXPP8z31yZZJfmfin6sY2Cte1aT9kr565g/NCZqjSqegtxGJus7?=
 =?us-ascii?Q?JM+5CpY8Y4DD7jL9r5sEK9wnyPKhypz/R+Rpf/pGw3svM04RDjyuOlj/JBqn?=
 =?us-ascii?Q?BqILWZtRYbooF4vKXq4Pdxa8zVA07Jvzt7vOsXWNwfn0TIeFFtv3JNp0rdtj?=
 =?us-ascii?Q?/0pg8x+RahRClBBRgtwnxd0ATJf6hePhRqB2ISCCsd8C2npAJskXKP9kMM67?=
 =?us-ascii?Q?wfSBhmnYbTn87Et3ycMF2NBcrWH0KcpZ6c4wbyjb0jlvAosEpfRAJzmCdsq+?=
 =?us-ascii?Q?z2GVkpD4d66Ri1hLExDcmRn4wqx+chH3o0lPVEesa4g=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB3294.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2021 02:10:27.5662
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-Network-Message-Id: f658c807-fe4e-417d-f80a-08d8b8318fb7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: elAP6WSDf1cTYzbr8QxzPKlLqUpf2e28Lfe2hNJIjMpNxF62lvu19ajCID2u/xdNq+ZpWtfYCwN1UXx9CIXRhw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4780
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

There are bashisms in Makefile and cause do install failure with dash.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../0001-Makefile.in.in-remove-bashisms.patch | 36 +++++++++++++++++++
 .../xfce4-panel-profiles_1.0.12.bb            |  1 +
 2 files changed, 37 insertions(+)
 create mode 100644 meta-xfce/recipes-apps/xfce4-panel-profiles/xfce4-panel-profiles/0001-Makefile.in.in-remove-bashisms.patch

diff --git a/meta-xfce/recipes-apps/xfce4-panel-profiles/xfce4-panel-profiles/0001-Makefile.in.in-remove-bashisms.patch b/meta-xfce/recipes-apps/xfce4-panel-profiles/xfce4-panel-profiles/0001-Makefile.in.in-remove-bashisms.patch
new file mode 100644
index 000000000..62d53a99c
--- /dev/null
+++ b/meta-xfce/recipes-apps/xfce4-panel-profiles/xfce4-panel-profiles/0001-Makefile.in.in-remove-bashisms.patch
@@ -0,0 +1,36 @@
+Makefile.in.in: remove bashisms
+
+The brace expansion is bash specific and fails with dash.
+
+Upstream-Status: Pending [No permission to folk repo and create pull request]
+
+https://gitlab.xfce.org/apps/xfce4-panel-profiles
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+---
+ Makefile.in.in | 9 ++++-----
+ 1 file changed, 4 insertions(+), 5 deletions(-)
+
+diff --git a/Makefile.in.in b/Makefile.in.in
+index 73338f4..28a6c7b 100644
+--- a/Makefile.in.in
++++ b/Makefile.in.in
+@@ -74,11 +74,10 @@ install: all xfce4-panel-profiles.1
+ 	install -d $(DESTDIR)/$(MANDIR)/man1
+ 	install xfce4-panel-profiles.1 $(DESTDIR)/$(MANDIR)/man1
+ 	
+-	install -d $(DESTDIR)/$(PREFIX)/share/icons/hicolor/{128x128,48x48,16x16,scalable}/apps
+-	install data/icons/128x128/org.xfce.PanelProfiles.png $(DESTDIR)/$(PREFIX)/share/icons/hicolor/128x128/apps
+-	install data/icons/48x48/org.xfce.PanelProfiles.png $(DESTDIR)/$(PREFIX)/share/icons/hicolor/48x48/apps
+-	install data/icons/16x16/org.xfce.PanelProfiles.png $(DESTDIR)/$(PREFIX)/share/icons/hicolor/16x16/apps
+-	install data/icons/scalable/org.xfce.PanelProfiles.svg $(DESTDIR)/$(PREFIX)/share/icons/hicolor/scalable/apps
++	install -D data/icons/128x128/org.xfce.PanelProfiles.png -t $(DESTDIR)/$(PREFIX)/share/icons/hicolor/128x128/apps
++	install -D data/icons/48x48/org.xfce.PanelProfiles.png -t $(DESTDIR)/$(PREFIX)/share/icons/hicolor/48x48/apps
++	install -D data/icons/16x16/org.xfce.PanelProfiles.png -t $(DESTDIR)/$(PREFIX)/share/icons/hicolor/16x16/apps
++	install -D data/icons/scalable/org.xfce.PanelProfiles.svg -t $(DESTDIR)/$(PREFIX)/share/icons/hicolor/scalable/apps
+ 
+ uninstall:
+ 	rm -f $(DESTDIR)/$(PREFIX)/share/applications/org.xfce.PanelProfiles.desktop
+-- 
+2.25.1
+
diff --git a/meta-xfce/recipes-apps/xfce4-panel-profiles/xfce4-panel-profiles_1.0.12.bb b/meta-xfce/recipes-apps/xfce4-panel-profiles/xfce4-panel-profiles_1.0.12.bb
index 1fcb7edc0..34162d3cc 100644
--- a/meta-xfce/recipes-apps/xfce4-panel-profiles/xfce4-panel-profiles_1.0.12.bb
+++ b/meta-xfce/recipes-apps/xfce4-panel-profiles/xfce4-panel-profiles_1.0.12.bb
@@ -11,6 +11,7 @@ DEPENDS += "intltool-native"
 
 SRC_URI = "http://archive.xfce.org/src/apps/${BPN}/1.0/${BP}.tar.bz2 \
            file://not-create-link-to-locale.patch \
+           file://0001-Makefile.in.in-remove-bashisms.patch \
            "
 SRC_URI[sha256sum] = "246e459d2d2f3f524968440ed7fddb2a891567ebc05f10a800f7f5821b3452a7"
 
-- 
2.17.1

