Return-Path: <samuli.piippo@theqtcompany.com>
Received: from emea01-db3-obe.outbound.protection.outlook.com
	(mail-db3on0148.outbound.protection.outlook.com [157.55.234.148])
	by mail.openembedded.org (Postfix) with ESMTP id 5E5A17702A
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Oct 2015 09:59:59 +0000 (UTC)
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=samuli.piippo@theqtcompany.com; 
Received: from piippo.it.local (91.217.248.11) by
	AM3PR02MB1172.eurprd02.prod.outlook.com (10.163.183.150) with Microsoft
	SMTP Server (TLS) id 15.1.300.14; Thu, 15 Oct 2015 09:59:57 +0000
From: Samuli Piippo <samuli.piippo@theqtcompany.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 15 Oct 2015 13:00:31 +0300
Message-ID: <1444903231-16227-1-git-send-email-samuli.piippo@theqtcompany.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [91.217.248.11]
X-ClientProxiedBy: VI1PR06CA0020.eurprd06.prod.outlook.com (25.162.116.158) To
	AM3PR02MB1172.eurprd02.prod.outlook.com (25.163.183.150)
X-Microsoft-Exchange-Diagnostics: 1; AM3PR02MB1172;
	2:UyKs/EIlk2mIWK6PRBKWiHstEM7ZJrqSPbfcIptq2sPNPgOZJcPzHYeLkPRhu0fGQrWt+oZS/iH4IjQkNK6MmlPXYeLXXPsgmyi5H6D/McPm5NqACuZGxqPB+6MozFK6hK42GMMxfPHHrFWWSLG2ePyz2Qd08ETR7iqR9PoS+Zw=;
	3:uEuF5lhypJp4k8BiF608fkNNe1awrDXATRn8GRZ3VuecUFAi+QA97d3DuEttXmrxR6SXU3sgePyw5ldlg1COMuXiUwFYT8GUxvtVlp7kux0ZEcOk7a53IaWBfLGSmzNuks+K1CGcdUiv8fH+lr6+cA==;
	25:x0UIhY6YbSCz3XB0v9BULyf+bb2qGrRCq9Mg+ArFXbUeVGXchFaOF4hfvDxKXymU7yxswLUIops2WMjQD7qGOGl2oAmDXMMFDrzH2KrBQE0otgsA3VhoAzQu6ghPFGdz+k+syjBsv/gO2Mg1oCPxcuBmwgYdT11D5HpRERQEaCKTfDqo02rnM8Xw2KsMBN2IDhXR8GBtHC/Ivf0AmXKmPwN5238eGqpQ+tuvmHN047e3GIf0xSZl6yqwuVPfK5UGupDZHkzllLSVfP8rhXpB3A==
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:AM3PR02MB1172;
X-Microsoft-Exchange-Diagnostics: 1; AM3PR02MB1172;
	20:i8VhaRtnD3WCGvkGiNh08R5NhJyj2xU2SRQotigPvxzPVgllPYKNaMx7JC8zqEpZgnuHdfBLVkrpb8eW26Ln/GkVJVBSKwMWYDczeunJ3VgC0ClXaYEOUFyDdATpdjzl9NdeX0gkUOqu1jBPZLDIrfAvecNtI7g99dX0LqIxK+GV/mqCX62DzHhkB0IMrQfG/ZjXHnhgV7TONLBxQoiosIvv1BQ2kDqqgFrzaGG5rWBI0+Rjju0vQj/lT2tcBDzhENh0dYL+o9LbYiDN/IHFgUwazTR3lxFH57tG3+5nLlSgY2h74rtRlBPEUbtRoCrlU5p5NIMMF9D1og0r8aqQiZRJvjaGAKBHuAS0vHrn5GglLLQwjdgYM9eli+NauzPYMMdF8SV1ucgKh6JEFwsRoZWX+FWwjm7fGSlKDT94ZNFW/E4XnhGlQzsR1SVS8haedts5ZkGWsJ+KMS1eoLORL64GK3ejrWRm0QcMmexyVc1URL58xx9+mUvHd++55rmd;
	4:69hgsu1SXZ2/sfCqo6a08E6jeENl/mqfAFd15UXSaJ2mdIVC9jb63qviXeOXQTd2aXIPWF5Pd1Vb0rHfHRT+yC47z49ncpz17GUvJPBu3g/XK5zUAzhwtruzHDpPlfXsMM8YJ9rrhCrCIWG8J4cVJ47/tK2WEYGsUzB7MADa/3TPNK/9YoyA4QmYREHQl9iQhnLfWos9vAsIxIYIFq21Jyo8c1cGJgnirwKPTAoni3QduDDAzEhx2b5untzvq5T62Rvlg9Xoh8L5WDGF32Ms5A/JCJ6DUWNIYvQmQNyT7t4GzHJW1Q/lABF+4gyu0FaH5XP6DQEG7YyG97kwi4Tb382PCa/3L9jWdxhZYfA36hc=
X-Microsoft-Antispam-PRVS: <AM3PR02MB1172811F7154388A1EB95F87903E0@AM3PR02MB1172.eurprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(226695750432114)(202767206196957);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(520078)(8121501046)(5005006)(3002001);
	SRVR:AM3PR02MB1172; BCL:0; PCL:0; RULEID:; SRVR:AM3PR02MB1172; 
X-Forefront-PRVS: 0730093765
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(979002)(6009001)(199003)(189002)(97736004)(19580395003)(229853001)(2351001)(42186005)(230783001)(105586002)(19580405001)(5003940100001)(50226001)(575784001)(86362001)(87976001)(5004730100002)(81156007)(101416001)(5007970100001)(50986999)(5008740100001)(92566002)(40100003)(50466002)(66066001)(47776003)(110136002)(46102003)(64706001)(107886002)(106356001)(189998001)(77096005)(36756003)(122386002)(33646002)(48376002)(450100001)(5001960100002)(7099028)(142923001)(4001430100001)(969003)(989001)(999001)(1009001)(1019001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:AM3PR02MB1172; H:piippo.it.local;
	FPR:; SPF:None; PTR:InfoNoRecords; A:1; MX:1; LANG:en; 
Received-SPF: None (protection.outlook.com: theqtcompany.com does not
	designate permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; AM3PR02MB1172;
	23:1QFrWbiMr6Z0qUA92OkMBMGVcPeLaPiwQPrJ+7kAK?=
	=?us-ascii?Q?nTEo/ADp4tqy3XxoUrQQ63Yu1XTkv5uyqWfNONHCvc7GsNeSE6GABkM6zq9z?=
	=?us-ascii?Q?+LOMs6ju6IQBUGN9yuz756Kg5adhl8FuO269kaq92oY6kD3HGf1KbIyd5l4l?=
	=?us-ascii?Q?6w1U3OSCaEfdjtv9APR4UT3LQ/XmkSeOqLRJrEOsSbmAR/+L0IPaN0UGgwDD?=
	=?us-ascii?Q?dTGWuq8f1mNrnjk2xNqnMj+LPjpkKHZBiARea5T/S5t4e+BRShwLLXgPDe3Z?=
	=?us-ascii?Q?tyK8tjRzuPCiYh90k9o6uBR/j1CRiFVUT+QOMgkyCXZGtC2cx0D0XH5jT/yz?=
	=?us-ascii?Q?M0THt2/HNJFjcKh+t67v+RNcYzhqPSi3hSkFV0mkkUruugJr2jGdX50kFOC9?=
	=?us-ascii?Q?3e9r7w6H5eWnigewc1dTBwebOmC/5vAgsf5dLiL0iW054Nol+AR4H871nrmL?=
	=?us-ascii?Q?1Rc1Bfo3rMhbenLMFoicasTPZVTFaA1r+NGxKKhotbwIxlz9bSxnPsOXe4Cx?=
	=?us-ascii?Q?h+o4q2fxRDDvkemp19zJyyCBpM6e7icQe5wnJ66zOxJUtd/x7wkLb+ltSe2b?=
	=?us-ascii?Q?VDJlHss4kkHnNue/XTmDMtJ1fkj5sDsGhOa1t1VeTqspFKmnr6KsFFGq+sHz?=
	=?us-ascii?Q?HLjPeqVNBdq6jq6iz+XTRTuuheLyI9ljFFEx8xA8cSDwHWAUY0uZnkxMgDmQ?=
	=?us-ascii?Q?Jbp2kBgkblk8Rup/a2qse/U0sLqWVnKi4b8EXx+/2y24YWNXa9FnIuU2kKUv?=
	=?us-ascii?Q?wgzn4l/LiB8555bQlYOgjoDOXu36lI1t0tgiPzsu56m4IIpdrhdHMnMCfjd4?=
	=?us-ascii?Q?57WwFIULRG5WYTrisUqp85R7nWkEpMYKGaZ2j+v0THKK4SJq8Jl2V+f+xjYj?=
	=?us-ascii?Q?eumPEDV9JgyR6zKrETiQQf9xEUH56e08+G9+cah845Kfe6QQ8gQVK+rhZPRE?=
	=?us-ascii?Q?FANwDVGr09FakIhlenwXBjS2QWgs5+5lv6GfZk/Qt8O60ANB/S0G8/8YY1/x?=
	=?us-ascii?Q?Iz82EWl+PGuuEQMZGgI72o+JoJMHxs0o5iEvyuNOLtN9nHM1ZsWRlHWzZvli?=
	=?us-ascii?Q?z2WaxclRUqav430j3Dr0JmyzO4UcZsPiqwpyrmrvGkh4X5ByxDp1HgDH23wX?=
	=?us-ascii?Q?hVIlIBu9M3HGYgkusjKRXzSHgeH0kPe4vMVTBqbanlPiTAsWbxSOCnQdkSW8?=
	=?us-ascii?Q?Yd7OEVGtBtPrTI/lPt4nkNEhL5aC4mzVs2ClpFLlMOFzeYjmXhQd2DQ+YbjS?=
	=?us-ascii?Q?k4qmnpK8LwTRiR5OGM=3D?=
X-Microsoft-Exchange-Diagnostics: 1; AM3PR02MB1172;
	5:Lr/vmbPeRPv6ibjxeh+fUUUkEMM26pmpZHRdTKowAmnbRrwCe9E+ciovl4L9R9a05mPlQ8Shkm7kCLjy3O8A1x0+J48xwD4DtehAt4xYyCzdPi9FY0Brpr4l/5sUhw0tyMInLAqw/GNH2Zwcx3NIbA==;
	24:jnJTSOVvkCj+ThxqbVCkJbQwYUvny8ZuJIMQ4SfkGNIBbR43tzrqyso6K7/XZvfQq2HlYeerpvsdpec9dvtyZ9AIA0/zw+JDKVguMo2lr30=;
	20:GiPEbTcS2GjtIoxrkjj1SsDfF4zS+k0t546GO72FqaqvX9OA2xQhPgcv2oj6P+l4V2/WN8gFuhwe6Dyv376K1A==
SpamDiagnosticOutput: 1:23
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: theqtcompany.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2015 09:59:57.5126 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM3PR02MB1172
Subject: [meta-qt5][PATCH] qt5: use extra .pri file from linux-oe-g++ mkspec
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 15 Oct 2015 10:00:04 -0000
Content-Type: text/plain

Load additional oe-device-extra.pri in the default linux-oe-g++ mkspec to
allow simple changing of target dependent values. This is useful for any
target that needs to specify e.g., QMAKE_LIBS_EGL or other additional configs.

Signed-off-by: Samuli Piippo <samuli.piippo@theqtcompany.com>
---
 recipes-qt/qt5/qtbase/0001-Add-linux-oe-g-platform.patch | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/recipes-qt/qt5/qtbase/0001-Add-linux-oe-g-platform.patch b/recipes-qt/qt5/qtbase/0001-Add-linux-oe-g-platform.patch
index e67df40..91bb9f3 100644
--- a/recipes-qt/qt5/qtbase/0001-Add-linux-oe-g-platform.patch
+++ b/recipes-qt/qt5/qtbase/0001-Add-linux-oe-g-platform.patch
@@ -45,9 +45,9 @@ Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
 ---
  configure                            |  70 +++++++++++++++---------
  mkspecs/features/configure.prf       |   4 +-
- mkspecs/linux-oe-g++/qmake.conf      |  40 ++++++++++++++
+ mkspecs/linux-oe-g++/qmake.conf      |  42 +++++++++++++++
  mkspecs/linux-oe-g++/qplatformdefs.h | 100 +++++++++++++++++++++++++++++++++++
- 4 files changed, 186 insertions(+), 28 deletions(-)
+ 4 files changed, 188 insertions(+), 28 deletions(-)
  create mode 100644 mkspecs/linux-oe-g++/qmake.conf
  create mode 100644 mkspecs/linux-oe-g++/qplatformdefs.h
 
@@ -197,10 +197,10 @@ index 6b37a04..dcf6025 100644
              write_file($$QMAKE_CONFIG_LOG, msg, append)
 diff --git a/mkspecs/linux-oe-g++/qmake.conf b/mkspecs/linux-oe-g++/qmake.conf
 new file mode 100644
-index 0000000..2ad2810
+index 0000000..d0a4166
 --- /dev/null
 +++ b/mkspecs/linux-oe-g++/qmake.conf
-@@ -0,0 +1,40 @@
+@@ -0,0 +1,42 @@
 +#
 +# qmake configuration for linux-g++ with modifications for building with OpenEmbedded
 +#
@@ -240,6 +240,8 @@ index 0000000..2ad2810
 +# for the SDK
 +isEmpty(QMAKE_QT_CONFIG):QMAKE_QT_CONFIG = $(OE_QMAKE_QT_CONFIG)
 +
++exists(../oe-device-extra.pri):include(../oe-device-extra.pri)
++
 +load(qt_config)
 diff --git a/mkspecs/linux-oe-g++/qplatformdefs.h b/mkspecs/linux-oe-g++/qplatformdefs.h
 new file mode 100644
-- 
1.9.1


