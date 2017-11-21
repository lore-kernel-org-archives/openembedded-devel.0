Return-Path: <jhofstee@victronenergy.com>
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
	(mail-db5eur01on0139.outbound.protection.outlook.com [104.47.2.139])
	by mail.openembedded.org (Postfix) with ESMTP id 9BC646067D
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Nov 2017 19:24:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=VICTRONENERGY.onmicrosoft.com; s=selector1-victronenergy-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=1tY4IHc2c8AZyEadofH3b0UGhqQyCt+JOY8VD//T0gA=;
	b=Uv2r8iacZU1+XXq82kfetfXwJ+oOHB92XO98m3a86IdXEuM2lyjN7x4X5MJzo94qMz9nolGIIjqejzlL23oIxL1YougqZ2VbcPkcZTlS5wLgjy3ZSLnmN/MTpon6DwId0qEVjf1VdFRuzfoLo7Ois44iuhII7lOhxOKwbWeRpe8=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=jhofstee@victronenergy.com; 
Received: from localhost (213.126.8.10) by
	DB5PR07MB1062.eurprd07.prod.outlook.com (2a01:111:e400:52c7::12) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.20.260.2;
	Tue, 21 Nov 2017 09:51:44 +0000
From: Jeroen Hofstee <jhofstee@victronenergy.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 21 Nov 2017 10:51:24 +0100
Message-Id: <1511257884-7348-2-git-send-email-jhofstee@victronenergy.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1511257884-7348-1-git-send-email-jhofstee@victronenergy.com>
References: <1511257884-7348-1-git-send-email-jhofstee@victronenergy.com>
MIME-Version: 1.0
X-Originating-IP: [213.126.8.10]
X-ClientProxiedBy: AM5PR04CA0030.eurprd04.prod.outlook.com
	(2603:10a6:206:1::43) To DB5PR07MB1062.eurprd07.prod.outlook.com
	(2a01:111:e400:52c7::12)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c91e8af7-0ce0-4113-11b2-08d530c57938
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(4534020)(4602075)(4627115)(201703031133081)(201702281549075)(2017052603199);
	SRVR:DB5PR07MB1062; 
X-Microsoft-Exchange-Diagnostics: 1; DB5PR07MB1062;
	3:lqw1m4HVAT3vVVpbMS5c/htXyQRRmN0vJrvRqfJ4w5qRH4zJ4KOGxgv3pE1WIJD6KIozs/BE9CIehKL593W3ktJ0dPP3VBgXgE/fo774E2DUGXiwxOWW69mMv7Po/BmiQoAwsMZZH817f6/GZ9dign7GaAQU4NEr+gcgP0AuWGiWy7i7NAbLo2nqjt/Juet996t5O68Zf+0U57z1ZzihiHG/G/hid2QVfreAznxWrrdt93x5l72RIFEPiiUO8RHR;
	25:SX+fJAOx0WqgJuYVqvqh4Wv8oFLsQajLrlDPsSFde9uguIt0Vh5gwmAA5cUN1J7vppwLPi3WkXPRXR+okDGzqOGekgsb5sWLdtOwJWf1ZJVjHnenfNhsAI/qql1thM2z6U8fwEe6p4yUC/ZN+L/hX7yO7+PexMzQvkvtNQJs53wOnSO8LvjeXFYl9a1QEbCOgDaOEY5r7RKu/jACHUIBY4z3deFHadkLAeSQOcz3fO6o0A3H7UsDkYjrA2WaPP3xdHkF8edycmM1wgH7JPdod+oIwZVM2DJzUyapLPxPg+EgFLHnAgjPU8Unq0sUSuR4JeFIf9UeMqVHPQ9LZf364g==;
	31:RkdPEnX2H3PwDc0ROOxx+68X5kTxhnUBVn+AJrxbi2+RqNY57JDavmnMlGkP649kRys/YkOR7tM6jEu8B+PwNJpbY9iT0TtG0jLcnLiWyIyagqCPfsvqxLtIlYZ45rgWGjS2uowaHi81xo0ENkZPdzDmv5P5buhDMcBkLE2Kzkiue7m/VRhdEryKymJJ1HxDxUlQjAwBmKrKcpcvQBrOj8Z2NeNChwcofoSfTLH0jy4=
X-MS-TrafficTypeDiagnostic: DB5PR07MB1062:
X-Microsoft-Exchange-Diagnostics: 1; DB5PR07MB1062;
	20:iToSViMBeGsLluUJwld0GbRqOJp/MNyxMoZQLPAngf99kyLKeV7p24Yjc466h30gYDuDuHKd0UOJoj4MOqgzvMSHZOdtuJDONbGIXl0NW2J95Uft9zz/NqcwyOAy9+U4zRM7wsRqde3OLI2ciBQOX6G1OULc4F7CpOZ3dWU1wOwluxY2M0bsw9KkJ3Ji92T3tZIXIvoU/XpOuXGVKNhBBFS+tr3tsx3pK7nGt+HiTsxy4QFw0frm91acAkoNADdw;
	4:74yyULq/5htJHrsczmXHs4sF9f6D7ZeDGZm57bYZq/Y0JHgTK16qqwcDg1gr84T6eG2ZJdW9udb7D+Nal47PzcJNWWDlWyxBMeVC76ZZSFjkG2rAzlJ4zoI8lbf380j+dYepfxkjdNXWatPppC2gLeGtFKEph3UzTLhptfC0xDhhg4Y2WoeG/mbk/TVS23K+qBpqKTFb9S0F0kO1FK2GQX5tseHpwMiYMoZYY9aG0+v4+j71gDCVCT8/QqFjfSJjC/6Tg0VPCjfev8L3smOccg==
X-Microsoft-Antispam-PRVS: <DB5PR07MB1062C8C1C3F63068A549DC81C0230@DB5PR07MB1062.eurprd07.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(2401047)(5005006)(8121501046)(100000703101)(100105400095)(3002001)(3231022)(93006095)(93001095)(10201501046)(6041248)(20161123564025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123558100)(20161123560025)(20161123555025)(20161123562025)(6072148)(201708071742011)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:DB5PR07MB1062; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:DB5PR07MB1062; 
X-Forefront-PRVS: 049897979A
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(6069001)(6009001)(376002)(39830400002)(346002)(199003)(189002)(50466002)(8936002)(6116002)(3846002)(107886003)(105586002)(4326008)(6496006)(48376002)(50226002)(5660300001)(5003940100001)(97736004)(2906002)(66066001)(189998001)(36756003)(47776003)(76176999)(316002)(50986999)(305945005)(2361001)(2351001)(25786009)(68736007)(81156014)(106356001)(7736002)(16526018)(6666003)(6916009)(2950100002)(16586007)(86362001)(101416001)(81166006)(53936002)(478600001)(76506005)(33646002)(6486002)(8676002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DB5PR07MB1062; H:localhost; FPR:;
	SPF:None; PTR:InfoNoRecords; A:1; MX:1; LANG:en; 
Received-SPF: None (protection.outlook.com: victronenergy.com does not
	designate permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; DB5PR07MB1062;
	23:PdwrNVRGE7SzUKkeFLZOcrccxCiNYoLwgcTtD3tHo?=
	=?us-ascii?Q?Hqc4zFhIHtdGiDawacfNgrE6N5IXVJINLbOA0ABxWwnFToY5occVQVzQJ5xp?=
	=?us-ascii?Q?6RU1xhho/bzW5rH5a+wxB2cgiqX6WwjWxHZRM3VhzlfLuIdf3+k8jfWqJ4Kb?=
	=?us-ascii?Q?+el+QRi4lDE9gvDwAGJi9m37q+yRsmqUgpPchxyYl6s9A/xJL9TLNxVA1XFf?=
	=?us-ascii?Q?yvWnZHCUBGNZTbsuqfQSX1PeOPjA6L3bNQTIFV4EqZmdQwm2rumwmQC+ZQlV?=
	=?us-ascii?Q?ZlSkFCEiP2WDKqFCMuHZm6Jzi8zYmDhyHRlxiFVPUa5rpXnH9tvbsN3vzvsC?=
	=?us-ascii?Q?9wPg2fLIRTeE4+Q5O9jhTsV6xpo51ExZc3oxExq/9oDthVqi5IOQWj4VmlwV?=
	=?us-ascii?Q?nOxMVwmmbUProHpxaBvrNMduZqm5oAqY697tB8tP5K9zuisG2AEVRZPEn1Si?=
	=?us-ascii?Q?wlOT0RYPimmxGy5jRNli8va5biCxj7K8AWVyBudWgr1qrLT+36JAlhkvKBoM?=
	=?us-ascii?Q?PA7gwGh/Y8orIdinKgcL1hYg3ARBBaMeSghJM8HFhO8FQ3iDYlB3PQ7Gx1fK?=
	=?us-ascii?Q?PGk/FqGLb3+vuvSHrLbkzoIVemTCWAfJG7KZAwy1yzQBLZWa9fay+gbmQivG?=
	=?us-ascii?Q?ec1g4kRXGYm8o4lbtFw4MuTKFJlypVcGAdI7inoyGcAW9HkL02627G/8NGDu?=
	=?us-ascii?Q?itxPta04Ht3Dv7+Y+ZIXToWU19XHzQmjasBvPoC5q1eRNXEeQE7/dfNVdQrh?=
	=?us-ascii?Q?sYRVxTc/BxT6Tqa/NB36VKl23N4AnRj6Mw2dDJFMe9yUTJFmypt92i+tTAGV?=
	=?us-ascii?Q?P2FieKh8NdnGkk8GokIZ40ha+A5otG84N4T/54Tk5QP9QiFaVxrfg5tcDh+A?=
	=?us-ascii?Q?Q/GSBbgPmciZZQS+TA03bMC0pKpA0SHUQk8ayac8cpYq7ANZHRnP4zRVZHyZ?=
	=?us-ascii?Q?9X1LJxmCnWiqVqx3wVSqM0nRQHqSax2cwQoj5u/e26NF/i3EKrufOA8VpM/t?=
	=?us-ascii?Q?aJho93P45dalDbpND1O9O3XcQ49pUU/knRrw5LoAre2dI3T/RLz11JxcXPDK?=
	=?us-ascii?Q?biLPnU8fVyV5ZqG50WXN/nDyF5RFks2w0uWnhtsDC/Ktx3Tv4SqONVvBplBq?=
	=?us-ascii?Q?IY1O1+GLrwIRDcaMp+3B6l0Q1r3bU+f/rXlkaTck7tHdRGGKFEy6A=3D=3D?=
X-Microsoft-Exchange-Diagnostics: 1; DB5PR07MB1062;
	6:T5lGPhF+5NDMjXX7x5QM9VUPVfY0FTc/MW4aZ4H4M5IJf5EK01HY32qKXAt0rpd/JumsvKrL8gnEqwY60vYucqJngxUS95IJxu5cNqTL/nSUcSxxq3HzQG0P5UomQP/6+ED3hthKqCLM//4vXr5SFQf+sfMgTorXJTZrEf9Lt0BCnY/npzWrA0/gaPn94InZsXXk5OeGzUmolpjCZOzeXEq5cudgC9KiToFJbctKzscWJ+XxYOThKcL9t55vtD5EJCEiXyJAfw0QOPGwalh+EKEUpSNhvnKUdUQfRwfy+p0pnvS8xWC5MXAliyitEku9FI1f1sul6fExWJZzi3j6LjRvjhjO1Ik5kr3njsVvMrQ=;
	5:DtD4FWqQa1o/6mXtVgXvFLIi+NWELmH4Ze6VvwUtsNjyKZDyqJPx+YIMQWeT+fg5dyMpJmf6lJTVArhM8AqYoo97l2M4zq/uXWwz7nyI4meR1XtPQlSAgrepxo0PzS5PF1lPFavFFfGL89RQBChLeRZNPlPkUbnkvvXd+5mNTVM=;
	24:Auu7V4q9oZATAYnZGKctHw96xODlIKqgtBU/LBBciyo0+wjXgbD+fMO6TPTNeiMJsfYaG7KM4WiUcKObMxpLgCYgtF98NOXEiQyT9fJRwIs=;
	7:s4ph8NxWhwHSBrhKwN3E8dVndZe7jnj0K9taUMHdlH7WJI5OBdwMfawJxGrlCyqEcKIPoLdo9DpDEL9m0tZHXHJfMT8ftvWF5ewU9EzFSj/M2eezWP9mJxMu679a5XwL07ztraLZo5xtLQgjYRqRSDnosFcUizYPU3b9e7DxvQJ75M2ZcfeneUUwrG2JU4qESidGVqpc9SVGKyZbciUsA4OL38vA83e0JnHXTgpkiOz7Kc6NqqLJmsV4v1CNICmy
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: victronenergy.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2017 09:51:44.2263 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c91e8af7-0ce0-4113-11b2-08d530c57938
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 60b95f08-3558-4e94-b0f8-d690c498e225
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5PR07MB1062
Subject: [meta-qt5][PATCH 2/2] qtbase_git: install qt.conf for the target
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
X-List-Received-Date: Tue, 21 Nov 2017 19:24:25 -0000
Content-Type: text/plain

The build-in qmake settings point to the sysroots on the host machine.
Running qmake on the target hence errors with:

  Could not find qmake configuration file linux-oe-g++.
  Error processing project file

So add qt.conf to the target image with the correct locations.

Signed-off-by: Jeroen Hofstee <jhofstee@victronenergy.com>
---
 classes/qmake5_base.bbclass  | 29 +++++++++++++++++++++++++++++
 recipes-qt/qt5/qtbase_git.bb |  2 ++
 2 files changed, 31 insertions(+)

diff --git a/classes/qmake5_base.bbclass b/classes/qmake5_base.bbclass
index 8e1fe20..7ba30f4 100644
--- a/classes/qmake5_base.bbclass
+++ b/classes/qmake5_base.bbclass
@@ -50,6 +50,35 @@ export OE_QMAKE_QTCONF_PATH = "${WORKDIR}/qt.conf"
 
 inherit qmake5_paths remove-libtool
 
+generate_target_qt_config_file() {
+    qtconf="$1"
+    cat > "${qtconf}" <<EOF
+[Paths]
+Prefix = ${OE_QMAKE_PATH_PREFIX}
+Headers = ${OE_QMAKE_PATH_HEADERS}
+Libraries = ${OE_QMAKE_PATH_LIBS}
+ArchData = ${OE_QMAKE_PATH_ARCHDATA}
+Data = ${OE_QMAKE_PATH_DATA}
+Binaries = ${OE_QMAKE_PATH_BINS}
+LibraryExecutables = ${OE_QMAKE_PATH_LIBEXECS}
+Plugins = ${OE_QMAKE_PATH_PLUGINS}
+Imports = ${OE_QMAKE_PATH_IMPORTS}
+Qml2Imports = ${OE_QMAKE_PATH_QML}
+Translations = ${OE_QMAKE_PATH_TRANSLATIONS}
+Documentation = ${OE_QMAKE_PATH_DOCS}
+Settings = ${OE_QMAKE_PATH_SETTINGS}
+Examples = ${OE_QMAKE_PATH_EXAMPLES}
+Tests = ${OE_QMAKE_PATH_TESTS}
+HostBinaries = ${OE_QMAKE_PATH_BINS}
+HostData = ${OE_QMAKE_PATH_ARCHDATA}
+HostLibraries = ${OE_QMAKE_PATH_LIBS}
+HostSpec = ${OE_QMAKE_PLATFORM}
+TargetSpec = ${OE_QMAKE_PLATFORM}
+ExternalHostBinaries = ${OE_QMAKE_PATH_BINS}
+Sysroot =
+EOF
+}
+
 do_generate_qt_config_file() {
     generate_qt_config_file_paths
     generate_qt_config_file_effective_paths
diff --git a/recipes-qt/qt5/qtbase_git.bb b/recipes-qt/qt5/qtbase_git.bb
index 318c9f7..fe66eb6 100644
--- a/recipes-qt/qt5/qtbase_git.bb
+++ b/recipes-qt/qt5/qtbase_git.bb
@@ -244,6 +244,8 @@ do_install_append() {
     echo "isEmpty(QMAKE_LINK_C_SHLIB): QMAKE_LINK_C_SHLIB = $OE_QMAKE_LINK_NO_SYSROOT" >> $conf
     echo "isEmpty(QMAKE_LFLAGS): QMAKE_LFLAGS = ${OE_QMAKE_LDFLAGS}" >> $conf
     echo "isEmpty(QMAKE_STRIP): QMAKE_STRIP = ${TARGET_PREFIX}strip" >> $conf
+
+    generate_target_qt_config_file ${D}${OE_QMAKE_PATH_BINS}/qt.conf
 }
 
 # mkspecs have mac specific scripts that depend on perl and bash
-- 
2.7.4


