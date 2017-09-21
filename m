Return-Path: <kwangsub.kim@qt.io>
X-Greylist: delayed 829 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 21 Sep 2017 08:18:04 UTC
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
	(mail-db5eur01on0116.outbound.protection.outlook.com [104.47.2.116])
	by mail.openembedded.org (Postfix) with ESMTP id 4D8D977F70
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Sep 2017 08:18:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=qtcompany.onmicrosoft.com; s=selector1-qt-io;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=Br4N6qVePX01DpYLN2gr/pflyOav/soAth+MdlW04sI=;
	b=dFeuMOPA/1lhwjYsR61JxadkXcPAbGFdFOHexxtCpkm749sr55y5eRcNsUAqMgN4OoXlptwTIxJdKa1wNTJEaSMxculwizWGf46jMfGhd7ZRMpT6Eek+xHyHeZKGpUQVrluIFs53PpqEn0eqInD/qRfSiiNUu4UELj52wuoXyrk=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=kwangsub.kim@qt.io; 
Received: from localhost.localdomain (175.195.156.153) by
	DB6PR0202MB2485.eurprd02.prod.outlook.com (10.169.210.135) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.20.77.7;
	Thu, 21 Sep 2017 02:41:16 +0000
From: Kwangsub Kim <kwangsub.kim@qt.io>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 21 Sep 2017 11:40:47 +0900
Message-Id: <1505961647-21967-1-git-send-email-kwangsub.kim@qt.io>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [175.195.156.153]
X-ClientProxiedBy: SLXP216CA0045.KORP216.PROD.OUTLOOK.COM (10.174.33.31) To
	DB6PR0202MB2485.eurprd02.prod.outlook.com (10.169.210.135)
X-MS-Office365-Filtering-Correlation-Id: e8879ece-c5ee-4856-3807-08d5009a3c18
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(300000500095)(300135000095)(300000501095)(300135300095)(300000502095)(300135100095)(22001)(2017030254152)(300000503095)(300135400095)(2017052603199)(201703131423075)(201703031133081)(201702281549075)(300000504095)(300135200095)(300000505095)(300135600095)(300000506095)(300135500095);
	SRVR:DB6PR0202MB2485; 
X-Microsoft-Exchange-Diagnostics: 1; DB6PR0202MB2485;
	3:WhhseASAUTzjxgst0hOVuPz5n1izo23sf781/mhOalEfBpEr6DHXp0mqMLNdILV5jR0HjPfT9wqtgWr4ZZnVLsu9FVhczpbyrlrUqKF+NrLyWDybQz9MilaZA2E3nGm2lDpPjSjrk1KzXZUvqlfE9XWmKcM/VK1MGLd7cyu7DAb+8TAqSRYmR37Qbd7Ml70HayZCAMSKaG39tefyFr4Pqof7TsEct6GirmoGm39XuiR+YEAU+2L+VL+rHGJmqiDs;
	25:1SkW9+A3no/ky/Jn/6ndbCx7iSxvqWqzV/1Owd/75HV4JHbk1w5qPqmCuDX7tcUZ6l7frH6gew1k3w1TkRkZW3vGGHUOmOAeRCFkrzr/q+ECR98Yu/MmnGy43OLEqmLOQnaMzigcV/4e/GntFMzt7cdVOtZbWfUgB47WU5ddG1G+QGanVgtmLAJjQCds4QUyFTvqun7A+EFEyVWiq5yuV5ap5ecX6f1kkpXP6Aj9jd9t/xmocr7kkcJ3MqL3Tx7abdDHYFDy8zcgVYVC5u9/6KgFce8DCYTFKWOSV7/06jVQg6lE1yhaYZKwWxMsBX1A2eXF30b9WIf13TT0OEiKxg==;
	31:abn+tuu9lPDkk6nazJa1N/oealEJ1XFZC+ocTZJtnfOPaJeMY1T8nDOsdbDTWG2ke/dAXJZQYI86+B1gDQ/5YjsOInzV9etlc0XbRpC+PIDNVQMYVeWoeHx1FMCJEO/Fc4zjk493ViX32kamCkWAoDRzPzrH9c3bF4xATJx2H1+eLlmkdnJfSyd2p2KPPbqQxcc6SlDS8gQ2Zt6KkF3l/HBmB1qB82YnF5D+Dd6p3fI=
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB6PR0202MB2485:|DB6PR0202MB2485:
X-Microsoft-Exchange-Diagnostics: 1; DB6PR0202MB2485;
	20:8Q/IEDNhPTLvnMrVU6iSJw4Md2Q0MXsi0UDPxvFVtRWaups3AEWSTPQp/cKPvwIs+bRMU2dRDmO5hqJtdrYPnlNjCMAiPgLKBZkW6yq7baJPjfg7DhKW8kbt9o9e+4hzjpljS1XkbkF9gp8En0rj4ZVDPf+h3KhjxSiqS07PZPV0nY7Uu1K3EOxgPaTW/1Yo//G5QY5k18uIXZQ02Ba58T8XHFYIMSlqqEqZwOl8blyCWbXMAK9PDjezRMa1wVWV04TyBJq8QoAYYLZ5JVg4+GoiNMXZcErJtmMEp78c+9RXMFp6FWjdlOHcS5PIc2gmTqX4KMm7Nw2Zckif94jpPYY/ikVKSiWK5Tr4uerxdmnu2J5wnV2fRjmm78l70TpNS5ZQE0PZr6gb8YoomI5gzN3EegqZoqPbFAswcFGxfOt+ZTuFGfD4raphJMGq8xExzhl8wqy2iy2xEfu9fNjUGuq36rm7XHr6egIifm7GIpRPYgiBqmwu5fdxV3RwX00H;
	4:+fj2F1iKWWDeHpn7iiSbRiexzWAQJmllCDsbzFt8xbSuRhpLSzT1Arvug+pmpFFDAW7a2TozIdlZM6KxSoEscAyflXDjnuyqzN82TSPk2UkhLQvm5d61bu6hQa+VrJLIA637FXBFrFP2A7SS/J/3LOI72ze2pmDiLN52eGQobRfiRh43hJqK/EuTMZFrEPjf9yenUZVnpiZd9TjLnjyg3Ns+Urx7mvOdRdMRdTbJ8W665XmLNEk4NQvAO7XMGo3/
X-Exchange-Antispam-Report-Test: UriScan:;
X-Microsoft-Antispam-PRVS: <DB6PR0202MB24858AB2510233E3DC1EC17786660@DB6PR0202MB2485.eurprd02.prod.outlook.com>
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(2401047)(8121501046)(5005006)(3002001)(10201501046)(93006095)(93001095)(100000703101)(100105400095)(6041248)(20161123560025)(20161123555025)(20161123562025)(20161123564025)(20161123558100)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(6072148)(201708071742011)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:DB6PR0202MB2485; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:DB6PR0202MB2485; 
X-Forefront-PRVS: 04371797A5
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(6069001)(6009001)(39830400002)(346002)(376002)(199003)(189002)(3846002)(575784001)(6916009)(50986999)(2906002)(478600001)(5003940100001)(5660300001)(6666003)(6506006)(33646002)(25786009)(6512007)(53936002)(74482002)(6116002)(305945005)(66066001)(101416001)(16526017)(48376002)(97736004)(81166006)(16586007)(316002)(8936002)(106356001)(50466002)(8676002)(6486002)(47776003)(81156014)(86362001)(2351001)(36756003)(189998001)(68736007)(2361001)(105586002)(50226002)(7736002)(19627235001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DB6PR0202MB2485;
	H:localhost.localdomain; FPR:; SPF:None; PTR:InfoNoRecords; A:1;
	MX:1; LANG:en; 
Received-SPF: None (protection.outlook.com: qt.io does not designate permitted
	sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; DB6PR0202MB2485;
	23:FEk0s9MviCvvYodqHkiyXfVGK7/M+aFVc/OUHMe?=
	=?us-ascii?Q?2CdIIx5d3lZV9teeVZvrFcxenmDnRf/INVUzHNJof0q4J7SLfFbt+PfYdnAj?=
	=?us-ascii?Q?xzI9kfVBMrEOLw2B5tSA4JMRkO9RptKtPWcXELjnDPAaUH2GjyPuEfwUBm5N?=
	=?us-ascii?Q?luk+9MuZwLR1PLRnzCPI/YRfRfK5JZNg4e5qzEuPnBZu1+jzQMvT8v9gq0V3?=
	=?us-ascii?Q?ukNvdCR9TGNnni4P+pWcl/fmZd3nKA2wmHE0OWgk9MhVAZuTPl0m3RQcgKza?=
	=?us-ascii?Q?unqxlAUSc4hggtCZR1x2/sVD3ybpeChgs4tS2Wmx2RoHgnUZ5Jx+I+2Tvmqm?=
	=?us-ascii?Q?G3lp4HyxEvUYAQxlrW4KDl/Teo9633YszABQVr9dOEUZGUjNLHhe4cw7KdpU?=
	=?us-ascii?Q?yRNAVrH3+5SovjZn/Gs75Iq+bdz3fW8hzvBx3VaGTz/qwhZlnMxBgBdWA5WM?=
	=?us-ascii?Q?t8gC1PV9/4iyf8cmiGFLPfDVMl6A29Ag3Nz1OAi2k8eTk3bshqccKnOKEEhg?=
	=?us-ascii?Q?Fw/X6DbybkwkWqIh8FlUoYH1jmZctBjNgaRQgRqFuFjpCW4bQj75guEiR7Ca?=
	=?us-ascii?Q?8TtfgfxdnPgriXFIc7Xm7TmHLMAT3cJK+gxh8p3U7RIm81SM1hIBIBHhcdzS?=
	=?us-ascii?Q?Z2q2sAs64bibWa3sQjIRcxMhKi1RK/wZib+zFDzCHYVitbp8mXV5MDHp6LZP?=
	=?us-ascii?Q?QaZmlRCjVrotnpI2P9aeQcQKesy7pIdoPLFdWSXx/7uQl4zVDJE1fCePkrLy?=
	=?us-ascii?Q?f850xYrG+cMTGAaK6KzEYokAjC+bLAQ60ibl5M7DukxeMMxsiyhkoOR/8ql4?=
	=?us-ascii?Q?VI4uOKN6uFksjyeqWWF8idpb6N+IFfoM+hvDpGVKsrP3I8A5VImSAUQZzklu?=
	=?us-ascii?Q?+T4qDCvdco3qlqi7X/3Lrumi6k8fbeuYV052HaBp+DrIxWzIpzVqooywnfN2?=
	=?us-ascii?Q?xTSTjJrh7jOX0Y4qPqEUGqOQUgO0fasjDcaLSCpR4nJeH0TJstDYobIg38Tt?=
	=?us-ascii?Q?DoZSIxDdhXtASTiM+cDeywvS5jEOvZ8J6N0JC5TQ+Y8t/EywvhwKgitUWQZu?=
	=?us-ascii?Q?aspYGyPeEkWO4aEycC59aXb9mk5fQzGKLHQ+5kwJYbAV2CZXcy4xEh05IQf0?=
	=?us-ascii?Q?Rhz8ASjMLRfskMFil+pEiA0wWPTSwoLD5YiH/hBK6qcIERD29eMtnTw=3D?=
	=?us-ascii?Q?=3D?=
X-Microsoft-Exchange-Diagnostics: 1; DB6PR0202MB2485;
	6:rK9txe2rVHjXwZCrvNHh3wimWRqTXLW2io9BRrrfzjgpk/H28KpJiY/7JjILLWo2WQ4QeY/0JfzzWy2fDFAtWwD4geYZoQqg4f8CfRSjhzLdvf4v8aX0OqsorszXRW3zeE/FghHocZrfg9Y9lwpEMk6TghzDlCwUIF+M9g2R13SM8WoLb6NlZaY3GBwc0rhpbhBZcgV+888MGxiSibdoB8NHgmrq+lWC9xK0s9MIvBOcwMeqgcP/E5K2RssqFefOP0Ec0Ub84YzmcK+1vjl6Vz7e92Mcj/Sn+15CUAq2FSD349HD+hoN0kAVwZ/dTKRr69ap8ucfaAfzg0F//c2HDQ==;
	5:+ErS4Jwmf/p/EU4ehYqx9B6huHAjGsy2Mm95/4cnC/5LCFSQ92gt646miVST8IWttFCmbhrCduPVQadFciIL8XuTaIr3sJ+CGbijpKgcYdTkadUVD5iA1ySM0KxvW/rRVB58AmxAymlGSPq/gWJc0A==;
	24:fc1Vl1ooEPZ1Cc8ysTo9tLxY9eDBnelESYZdjbBYNu0Ob4oHGle6fNgRI1Kb/cChl6tWS9k6qJ79pGB/bAM7GZCN1HPtInndjvjrxDp+m8Y=;
	7:VmYG3Pjo7tQt3q8BkQ8PQfaqGp3kpaR+j0zQQDSDLUXxUxE360HaN/535l7388CjQmZtkR80lbLQImc7L+NmGge4yD6MwTJMNOjfqxgldRlv6pWn6eFwU/ltxwgoVjNFP5XU3jiFEUkMI8NfP9LG3/ebM7L8YeCCIGf/btSrmAB4ck07MVflbgl0uMWhDNSeegS0A0Q4WhMh2U34ONGYAVsZRVXs2XlaJuSUtdODtPk=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2017 02:41:16.6759 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 20d0b167-794d-448a-9d01-aaeccc1124ac
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0202MB2485
X-Microsoft-Exchange-Diagnostics: 1; DB6PR0202MB2485;
	23:cxRmWDVt1vhRdrDh/jlc2+VoudpYL07YWftZR6e7OnRzSluruLvAFgCFcZRgCZMjfe9ahqI+4oV9ftMZIMj+gUOdwlrihieElfFSz8f8hw2WaohCWjFGcNLMzDJf8Kd02B8A7lJspL4qQEB3Mo1Qqg==
X-OriginatorOrg: qt.io
Subject: [meta-qt5][PATCH] qt5: add missing commercial license
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 21 Sep 2017 08:18:05 -0000
Content-Type: text/plain

Signed-off-by: Kwangsub Kim <kwangsub.kim@qt.io>
---
 recipes-qt/qt5/qt3d_git.bb             | 2 +-
 recipes-qt/qt5/qtcanvas3d_git.bb       | 2 +-
 recipes-qt/qt5/qtcharts_git.bb         | 2 +-
 recipes-qt/qt5/qtdatavis3d_git.bb      | 2 +-
 recipes-qt/qt5/qtlocation_git.bb       | 2 +-
 recipes-qt/qt5/qtquickcontrols2_git.bb | 2 +-
 recipes-qt/qt5/qtserialbus_git.bb      | 2 +-
 recipes-qt/qt5/qtserialport_git.bb     | 2 +-
 8 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/recipes-qt/qt5/qt3d_git.bb b/recipes-qt/qt5/qt3d_git.bb
index c354db4..0cb75a6 100644
--- a/recipes-qt/qt5/qt3d_git.bb
+++ b/recipes-qt/qt5/qt3d_git.bb
@@ -1,7 +1,7 @@
 require qt5.inc
 require qt5-git.inc
 
-LICENSE = "LGPL-3.0 | GPL-2.0"
+LICENSE = "LGPL-3.0 | GPL-2.0 | The-Qt-Company-Commercial"
 LIC_FILES_CHKSUM = " \
     file://LICENSE.LGPLv3;md5=8211fde12cc8a4e2477602f5953f5b71 \
     file://LICENSE.GPLv3;md5=88e2b9117e6be406b5ed6ee4ca99a705 \
diff --git a/recipes-qt/qt5/qtcanvas3d_git.bb b/recipes-qt/qt5/qtcanvas3d_git.bb
index 25cd72b..f46cbc2 100644
--- a/recipes-qt/qt5/qtcanvas3d_git.bb
+++ b/recipes-qt/qt5/qtcanvas3d_git.bb
@@ -1,7 +1,7 @@
 require qt5.inc
 require qt5-git.inc
 
-LICENSE = "LGPL-3.0 | GPL-3.0"
+LICENSE = "LGPL-3.0 | GPL-3.0 | The-Qt-Company-Commercial"
 LIC_FILES_CHKSUM = " \
     file://LICENSE.LGPLv3;md5=e0459b45c5c4840b353141a8bbed91f0 \
     file://LICENSE.GPLv3;md5=88e2b9117e6be406b5ed6ee4ca99a705 \
diff --git a/recipes-qt/qt5/qtcharts_git.bb b/recipes-qt/qt5/qtcharts_git.bb
index d3447ef..26881f0 100644
--- a/recipes-qt/qt5/qtcharts_git.bb
+++ b/recipes-qt/qt5/qtcharts_git.bb
@@ -1,7 +1,7 @@
 require qt5.inc
 require qt5-git.inc
 
-LICENSE = "GPL-3.0"
+LICENSE = "GPL-3.0 | The-Qt-Company-Commercial"
 LIC_FILES_CHKSUM = " \
     file://LICENSE.GPL3;md5=d32239bcb673463ab874e80d47fae504 \
 "
diff --git a/recipes-qt/qt5/qtdatavis3d_git.bb b/recipes-qt/qt5/qtdatavis3d_git.bb
index 471cfee..3737e10 100644
--- a/recipes-qt/qt5/qtdatavis3d_git.bb
+++ b/recipes-qt/qt5/qtdatavis3d_git.bb
@@ -1,7 +1,7 @@
 require qt5.inc
 require qt5-git.inc
 
-LICENSE = "GPL-3.0"
+LICENSE = "GPL-3.0 | The-Qt-Company-Commercial"
 LIC_FILES_CHKSUM = " \
     file://LICENSE.GPL3;md5=d32239bcb673463ab874e80d47fae504 \
 "
diff --git a/recipes-qt/qt5/qtlocation_git.bb b/recipes-qt/qt5/qtlocation_git.bb
index 19f895e..0aebbd3 100644
--- a/recipes-qt/qt5/qtlocation_git.bb
+++ b/recipes-qt/qt5/qtlocation_git.bb
@@ -1,7 +1,7 @@
 require qt5.inc
 require qt5-git.inc
 
-LICENSE = "GFDL-1.3 & BSD & (LGPL-2.1 & The-Qt-Company-Qt-LGPL-Exception-1.1 | LGPL-3.0) | GPL-2.0"
+LICENSE = "GFDL-1.3 & BSD & (LGPL-2.1 & The-Qt-Company-Qt-LGPL-Exception-1.1 | LGPL-3.0) | GPL-2.0 | The-Qt-Company-Commercial"
 LIC_FILES_CHKSUM = " \
     file://LICENSE.LGPLv21;md5=4bfd28363f541b10d9f024181b8df516 \
     file://LICENSE.LGPLv3;md5=e0459b45c5c4840b353141a8bbed91f0 \
diff --git a/recipes-qt/qt5/qtquickcontrols2_git.bb b/recipes-qt/qt5/qtquickcontrols2_git.bb
index e123f0d..4b2924b 100644
--- a/recipes-qt/qt5/qtquickcontrols2_git.bb
+++ b/recipes-qt/qt5/qtquickcontrols2_git.bb
@@ -1,7 +1,7 @@
 require qt5.inc
 require qt5-git.inc
 
-LICENSE = "GFDL-1.3 & BSD & LGPL-3.0 | GPL-3.0"
+LICENSE = "GFDL-1.3 & BSD & LGPL-3.0 | GPL-3.0 | The-Qt-Company-Commercial"
 LIC_FILES_CHKSUM = " \
     file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e \
     file://LICENSE.LGPLv3;md5=382747d0119037529ec2b98b24038eb0 \
diff --git a/recipes-qt/qt5/qtserialbus_git.bb b/recipes-qt/qt5/qtserialbus_git.bb
index d3a83a7..0b30043 100644
--- a/recipes-qt/qt5/qtserialbus_git.bb
+++ b/recipes-qt/qt5/qtserialbus_git.bb
@@ -1,7 +1,7 @@
 require qt5.inc
 require qt5-git.inc
 
-LICENSE = "GFDL-1.3 & (LGPL-3.0 | GPL-2.0+)"
+LICENSE = "GFDL-1.3 & (LGPL-3.0 | GPL-2.0+) | The-Qt-Company-Commercial"
 LIC_FILES_CHKSUM = " \
     file://LICENSE.LGPLv3;md5=e0459b45c5c4840b353141a8bbed91f0 \
     file://LICENSE.GPLv2;md5=c96076271561b0e3785dad260634eaa8 \
diff --git a/recipes-qt/qt5/qtserialport_git.bb b/recipes-qt/qt5/qtserialport_git.bb
index 056e237..23f03ce 100644
--- a/recipes-qt/qt5/qtserialport_git.bb
+++ b/recipes-qt/qt5/qtserialport_git.bb
@@ -3,7 +3,7 @@ require qt5-git.inc
 
 # text of LGPL_EXCEPTION.txt and LICENSE.FDL is slightly different than what
 # other qt* components use :/
-LICENSE = "GFDL-1.3 & BSD & (LGPL-2.1 & The-Qt-Company-Qt-LGPL-Exception-1.1 | LGPL-3.0)"
+LICENSE = "GFDL-1.3 & BSD & (LGPL-2.1 & The-Qt-Company-Qt-LGPL-Exception-1.1 | LGPL-3.0) | The-Qt-Company-Commercial"
 LIC_FILES_CHKSUM = " \
     file://LICENSE.LGPLv21;md5=4bfd28363f541b10d9f024181b8df516 \
     file://LICENSE.LGPLv3;md5=e0459b45c5c4840b353141a8bbed91f0 \
-- 
2.7.4


