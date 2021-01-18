Received: from NAM12-MW2-obe.outbound.protection.outlook.com (NAM12-MW2-obe.outbound.protection.outlook.com [40.107.244.83])
 by mx.groups.io with SMTP id smtpd.web08.30580.1610954419528697190
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 17 Jan 2021 23:20:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=GIraQkvx;
 spf=pass (domain: windriver.com, ip: 40.107.244.83, mailfrom: kai.kang@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eucdQHkA+3FxATHvdSYu0XVkrguDvqE0m6z7085taB+E1oxeyejO9lQe7K/Hb1DeYc4H/RR0SQSojpJhQVXwhl8kdJT+y0kcWKbGJAcsyH5G2cyxe8PtpL4COiow51IeQERMmkL3Jxs48MVdQdo7ci7sbgKbIeM2PhUxTlDGfQxrenHsTFVHAH7BTczGkitwf2p17uDvvizBpf/QRLWBTvFmJqe9omvQouVtbb8uun7A60pYrIKbZJ1KW5pzkhiiVf/OJ+LVabwRaX1OKphKI/mT9LZNTyFo/MNOLhK2g2EhFFgGCC1JeeRYJdPivD2Jh/dDDY5L9yzcyQi8TxH9AA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d2whDKH9FSxWQLnzZBujgz12xoOUypm3avgA8ObWsUc=;
 b=LtSN3jCRquQ/akNLEbyuM1+o0/Ri/eUbxHacoVXW3TbnQdiDnZWxsUU9SFd9MgS1raGvbqOEfHk180a88HPqKzEJO8sXjSibqJ019f/iO9SVBO3+dlqYCRWXuRsojJlGbhkjGGIz+eiW4YwyZEwqSbJd+TlRDEGDNVXqQqERCkP2e/jLkcF3cPx6gukMrxfYC6BVzaLBMpsF6LdFhJqfJ4rjaxOKy1Pa8raUHIGIuGU2St3XCFP/zotI/b8Zv5DICiA4gCUO0zFNdT/t/5qT2UXmyZIrQJ9s7cLO9Sb0XwvpCdQrJCYYFNMOGatqhFj/GHtYvbdC8xvH97TMPp7AmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d2whDKH9FSxWQLnzZBujgz12xoOUypm3avgA8ObWsUc=;
 b=GIraQkvxJh3Byds4sbnc/wV/+edYCAgKjg77f1ES4Gq18XBaSbaHogvEYCz/AJOiap/zOlfG0CxZ/iwAQOtKWEW3tNzvPnelTSuZKQ7shd1v0YF9xmDTCXqdwugyrzblPsyMd1n7a8b/ScGXTx8Wj+7ziEgSaiwLjv8oeCgqg9A=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=windriver.com;
Received: from BYAPR11MB3687.namprd11.prod.outlook.com (2603:10b6:a03:ff::26)
 by SJ0PR11MB5055.namprd11.prod.outlook.com (2603:10b6:a03:2d9::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.9; Mon, 18 Jan
 2021 07:20:17 +0000
Received: from BYAPR11MB3687.namprd11.prod.outlook.com
 ([fe80::25dc:1dca:8fb5:ea28]) by BYAPR11MB3687.namprd11.prod.outlook.com
 ([fe80::25dc:1dca:8fb5:ea28%5]) with mapi id 15.20.3763.013; Mon, 18 Jan 2021
 07:20:17 +0000
From: "kai" <kai.kang@windriver.com>
To: schnitzeltony@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Subject: [meta-xfce][PATCH 1/1] xfce4-panel-profiles: update remove-bashisms.patch for centos 7
Date: Mon, 18 Jan 2021 15:19:58 +0800
Message-Id: <20210118071958.7159-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <165B426A85E17F28.15753@lists.openembedded.org>
References: <165B426A85E17F28.15753@lists.openembedded.org>
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HKAPR03CA0019.apcprd03.prod.outlook.com
 (2603:1096:203:c9::6) To BYAPR11MB3687.namprd11.prod.outlook.com
 (2603:10b6:a03:ff::26)
Return-Path: kai.kang@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-lpg-core3.wrs.com (60.247.85.82) by HKAPR03CA0019.apcprd03.prod.outlook.com (2603:1096:203:c9::6) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.6 via Frontend Transport; Mon, 18 Jan 2021 07:20:15 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9345c5fa-09d7-44f7-f45f-08d8bb818123
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5055:
X-Microsoft-Antispam-PRVS: 
	<SJ0PR11MB5055CD94179BCE7949371CAD95A40@SJ0PR11MB5055.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	SVl8AKwsbncIZrDv/Rnu/qUDPzhZAVBSpz+NppPlcHCnTKt/NipGhcn97EUn7Tm4uSWvwZ5ZPayCIHzTETYhPJ+dBTkuuiQtkkeFVML55cuqUbxcm4w8iT+5YphGPTS2Nk0OgbQsjrzkD4EKxNn7h3SquG/Zw2xykNGHI5HKBPV+OFqSk6lGyiNXCxSxcyDFrBqDZLRpafmFHck9JHLZVKtzHcsp2Et2/N6AWdJrzyqJ+6bKKvH2uLn3mueHnY+wFV3HcqvBQJTNTcgCJ0T4NRXWVpjJ1/OWlsJcBYOdThVEjgkuHk0R22n4/ctwMoZB3k+g5HHbMQrEvf0vOYOlN5qYlKhpzzETQwruqs1rJW9fI3dKJBIIEkKOMLBVpFeZPN8s9V90znDFFj4k+FHIAf56GZWSJ79212jZ90QOz2YXlzJRTwFAG7kLKcI3hS7xAbhaVENcFf5PKARWZUxCxw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB3687.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39840400004)(346002)(366004)(376002)(396003)(136003)(26005)(8936002)(316002)(52116002)(16526019)(86362001)(186003)(966005)(1076003)(6512007)(2906002)(4326008)(478600001)(6666004)(6506007)(8676002)(66946007)(9686003)(6486002)(5660300002)(36756003)(83380400001)(19627235002)(66476007)(66556008)(2616005)(956004)(6916009);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?m+5VUqTSPDogEO1aX8pQmEO5cIjH0gTZzRmV06N4l+oV69hFlD96s6OLt/Z/?=
 =?us-ascii?Q?nYijTLQiPiAXwNTaZ+w1uZpD1FtZXPMV4+6gMNWcEaFt+P0KBPEMyJ76tJrJ?=
 =?us-ascii?Q?yZDrkxrFr+uzoYIlkxldBU04oJesNKGRYwkNWskQCw71Yk/g6j3rieopHJyw?=
 =?us-ascii?Q?otKOJ5iM/eAWezglwf5sMPmTuKGivAitpcAVAmBqiBh2NnOupeVv748mF7/R?=
 =?us-ascii?Q?SGXNfp0Gih5ldiU9Jh5WLQVwRRRvlsBbLm5JCg7AG1D/KgWGQtPhm9/JZS36?=
 =?us-ascii?Q?NCtuFAD3QWuTnc/xy6g/PeSSABZXp7UII7zZlOCZUEIof7FsPoyb1Lzk3k73?=
 =?us-ascii?Q?1PPxoZxn+hpSkH47Od1fPXMS9Nbqx8LaS2Rt1j5yG2KPde7Z3BIiTpYSj7qr?=
 =?us-ascii?Q?6PbWPNDDyhyOXoPeKoDgn5+316FwS/evjotCyJtmeYxT7tLGMRD/QdC7vvk9?=
 =?us-ascii?Q?iK+LoXM9XD4IA+7ZndnsfzD4eicXnhyilUEMp59i4LqFAkd2/nyxxq1w2i7X?=
 =?us-ascii?Q?r+yPQrlAAerShj3KfxEq8fQZwBHb83LClsUwOJ/gOZCgsGHn9Ckqcn5iBNku?=
 =?us-ascii?Q?vXG7nmMzxXSVZY2NTlk5nl7pH8VggE703+QyYCi5OhCZUCv3HJSbf4KuEYyB?=
 =?us-ascii?Q?jHTLAiWGTKa9HJpeYl3GsOwY1QfLQhNuisfDqBJT4eY7HcgMHKCyWHR/UhHQ?=
 =?us-ascii?Q?B9ckWx7gW8oS9rsDLT+e/xhC6TAig08B0xz7kfBr2tFvQpCiUqp3CYrWzCSC?=
 =?us-ascii?Q?LQnRObcEHLtFKDeFSckPJBTLhj6C88x4ncN9DsxQbJCAo55WWlRJgg9BnfhU?=
 =?us-ascii?Q?JLSKd8sWJ+n1SGc/NJlk3AMKRynGUltgPhY0vHdFTlRhvfGgwdXCB/x0nWRA?=
 =?us-ascii?Q?WeaJmz14WeVNNEyiToVDpw5EmH3PIMJF9UOR5VS/nkonYzNyYLeHUheTBWIo?=
 =?us-ascii?Q?mOB8QjP8lYat7k8sXyDmkriee37DmEuyWsEG6wpvI7s=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9345c5fa-09d7-44f7-f45f-08d8bb818123
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3687.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2021 07:20:16.9165
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LU+Ug3eZga0FvTWhTAWOiguQ6WKCWYQBRRFxSuoBvJo294eUOri00uveC8yX1Kzd3HfMUQS/7dm07zOggEgyIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5055
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Command install is from package coreutils. And there is coreutils 8.22
on centos 7 which doesn't support options -D and -t to be used together.
So create/remove the directories and files one by one.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../0001-Makefile.in.in-remove-bashisms.patch | 50 +++++++++++++------
 1 file changed, 35 insertions(+), 15 deletions(-)

diff --git a/meta-xfce/recipes-apps/xfce4-panel-profiles/xfce4-panel-profiles/0001-Makefile.in.in-remove-bashisms.patch b/meta-xfce/recipes-apps/xfce4-panel-profiles/xfce4-panel-profiles/0001-Makefile.in.in-remove-bashisms.patch
index 62d53a99c..9738f1a8c 100644
--- a/meta-xfce/recipes-apps/xfce4-panel-profiles/xfce4-panel-profiles/0001-Makefile.in.in-remove-bashisms.patch
+++ b/meta-xfce/recipes-apps/xfce4-panel-profiles/xfce4-panel-profiles/0001-Makefile.in.in-remove-bashisms.patch
@@ -8,29 +8,49 @@ https://gitlab.xfce.org/apps/xfce4-panel-profiles
 
 Signed-off-by: Kai Kang <kai.kang@windriver.com>
 ---
- Makefile.in.in | 9 ++++-----
- 1 file changed, 4 insertions(+), 5 deletions(-)
+ Makefile.in.in | 15 ++++++++++++----
+ 1 file changed, 11 insertions(+), 4 deletions(-)
 
 diff --git a/Makefile.in.in b/Makefile.in.in
-index 73338f4..28a6c7b 100644
+index 73338f4..e08b218 100644
 --- a/Makefile.in.in
 +++ b/Makefile.in.in
-@@ -74,11 +74,10 @@ install: all xfce4-panel-profiles.1
+@@ -73,8 +73,11 @@ install: all xfce4-panel-profiles.1
+ 
  	install -d $(DESTDIR)/$(MANDIR)/man1
  	install xfce4-panel-profiles.1 $(DESTDIR)/$(MANDIR)/man1
- 	
+-	
 -	install -d $(DESTDIR)/$(PREFIX)/share/icons/hicolor/{128x128,48x48,16x16,scalable}/apps
--	install data/icons/128x128/org.xfce.PanelProfiles.png $(DESTDIR)/$(PREFIX)/share/icons/hicolor/128x128/apps
--	install data/icons/48x48/org.xfce.PanelProfiles.png $(DESTDIR)/$(PREFIX)/share/icons/hicolor/48x48/apps
--	install data/icons/16x16/org.xfce.PanelProfiles.png $(DESTDIR)/$(PREFIX)/share/icons/hicolor/16x16/apps
--	install data/icons/scalable/org.xfce.PanelProfiles.svg $(DESTDIR)/$(PREFIX)/share/icons/hicolor/scalable/apps
-+	install -D data/icons/128x128/org.xfce.PanelProfiles.png -t $(DESTDIR)/$(PREFIX)/share/icons/hicolor/128x128/apps
-+	install -D data/icons/48x48/org.xfce.PanelProfiles.png -t $(DESTDIR)/$(PREFIX)/share/icons/hicolor/48x48/apps
-+	install -D data/icons/16x16/org.xfce.PanelProfiles.png -t $(DESTDIR)/$(PREFIX)/share/icons/hicolor/16x16/apps
-+	install -D data/icons/scalable/org.xfce.PanelProfiles.svg -t $(DESTDIR)/$(PREFIX)/share/icons/hicolor/scalable/apps
++
++	install -d $(DESTDIR)/$(PREFIX)/share/icons/hicolor/128x128/apps
++	install -d $(DESTDIR)/$(PREFIX)/share/icons/hicolor/48x48/apps
++	install -d $(DESTDIR)/$(PREFIX)/share/icons/hicolor/16x16/apps
++	install -d $(DESTDIR)/$(PREFIX)/share/icons/hicolor/scalable/apps
+ 	install data/icons/128x128/org.xfce.PanelProfiles.png $(DESTDIR)/$(PREFIX)/share/icons/hicolor/128x128/apps
+ 	install data/icons/48x48/org.xfce.PanelProfiles.png $(DESTDIR)/$(PREFIX)/share/icons/hicolor/48x48/apps
+ 	install data/icons/16x16/org.xfce.PanelProfiles.png $(DESTDIR)/$(PREFIX)/share/icons/hicolor/16x16/apps
+@@ -86,7 +89,9 @@ uninstall:
+ 	rm -rf $(DESTDIR)/$(DOCDIR)
+ 	# FIXME: Uninstall locales
+ 	rm -f $(DESTDIR)/$(PREFIX)/bin/$(APPNAME)
+-	rm -rf $(DESTDIR)/$(PREFIX)/share/icons/hicolor/{128x128,48x48,16x16}/apps/org.xfce.PanelProfiles.png
++	rm -rf $(DESTDIR)/$(PREFIX)/share/icons/hicolor/128x128/apps
++	rm -rf $(DESTDIR)/$(PREFIX)/share/icons/hicolor/48x48/apps
++	rm -rf $(DESTDIR)/$(PREFIX)/share/icons/hicolor/16x16/apps
+ 	rm -rf $(DESTDIR)/$(PREFIX)/share/icons/hicolor/scalable/apps/org.xfce.PanelProfiles.svg
  
- uninstall:
- 	rm -f $(DESTDIR)/$(PREFIX)/share/applications/org.xfce.PanelProfiles.desktop
+ distcheck: all
+@@ -106,7 +112,9 @@ clean:
+ 	rm -f bin/$(APPNAME)
+ 	rm -f data/metainfo/org.xfce.PanelProfiles.appdata.xml
+ 	rm -f data/layouts/*.tar.bz2
+-	rm -f data/icons/{128x128,48x48,16x16}/org.xfce.panelprofiles.png
++	rm -f data/icons/128x128/org.xfce.panelprofiles.png
++	rm -f data/icons/48x48/org.xfce.panelprofiles.png
++	rm -f data/icons/16x16/org.xfce.panelprofiles.png
+ 	rm -f data/icons/scalable/org.xfce.panelprofiles.svg
+ 	rm -f org.xfce.PanelProfiles.desktop
+ 	rm -f Makefile.in
 -- 
 2.25.1
 
-- 
2.17.1

