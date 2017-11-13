Return-Path: <mkelly@xevo.com>
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
	(mail-dm3nam03on0073.outbound.protection.outlook.com [104.47.41.73])
	by mail.openembedded.org (Postfix) with ESMTP id BC066786C0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Nov 2017 19:42:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=uievolution.onmicrosoft.com; s=selector1-xevo-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=7zxpkf9t5XImGDFrC4EjH581nN0iIxGzfsQrfAAmXjQ=;
	b=Brj7Uld8co0sXu/c0UGZsjiKku7ioFK2+2NEs+SsEO4642PCsVTd2yQZTWRrwanhJVaoDJL6P0NSmNlJ1XMpeiKDvGeSXaikvso083wPzwvHXgxLCdOhovqQ7OsoATEdhosHleHOAXrFdsxfOyrMMdNtA1X7WHvPICe2ZocJsHo=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=mkelly@xevo.com; 
Received: from columbia.corp.xevo.com (65.122.179.226) by
	MWHPR0101MB2943.prod.exchangelabs.com (10.174.170.14) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
	15.20.218.12; Mon, 13 Nov 2017 19:27:35 +0000
From: Martin Kelly <mkelly@xevo.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 13 Nov 2017 11:27:11 -0800
Message-Id: <20171113192711.12926-1-mkelly@xevo.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
X-Originating-IP: [65.122.179.226]
X-ClientProxiedBy: SN4PR0501CA0057.namprd05.prod.outlook.com (10.167.112.162)
	To MWHPR0101MB2943.prod.exchangelabs.com (10.174.170.14)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3be666a6-17ee-4a3c-b583-08d52acc9812
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(4534020)(4602075)(4627115)(201703031133081)(201702281549075)(2017052603199);
	SRVR:MWHPR0101MB2943; 
X-Microsoft-Exchange-Diagnostics: 1; MWHPR0101MB2943;
	3:qlSME41bdJn9mTKODa6fgpFArR17ofvPxRmWUGSJV7YVfvEf3m00uqrJGTzX9vcj6ENDEurKRL6q5KLPp8loWX1P7ZwjbAjkgl+EhtJyRPC8m5asrWYrtnkuqfkV4gEuw4/IHf3e4uwUk+gpQNnpRS79LEMFKGPqql+kuxJoMBgy9cl+S8SrUUXah97aY0jrGHuYmRzs5vBL4IPgmnWB6kCT6dpqhhtDIzFBhodMujGuPElT/PePq4ZRBuifj+2R;
	25:nqHBN1JdMbJ3D/V45X+zhKsy6l9rCWb17yJmvYIZEWIA57JoMJBWGE5eQoGTiN/TxVVL6PBu/y9/94pGSm4qlCH0W5vBkHrqyLlAZ/34pC7Hf0qDwgBfPj2Wmfc5TyF4GPYnO03yRaMr7nLF7F9HQmolvQC6/camLgsjHHlPDkBhDoQBhW8oMTfx2a50avDNiJf7p1k+z7iwMHddRTYYfsG1zKh8Ysq4OX5WpTmHhCx5EPBok2mPsdRGeVvgkh0nz1AkJA5dvOA+dnNuBkmMYS0J94XFk0mrMi9CRJiQaqqhuTuAqAe1xSVrzeWAi/g57wu+XZUCLVRn9qGg/enO7Q==;
	31:QoAYvvHykexrxxF1Yg5/EgG79cffGAPtdhvkXaQn6j9M7Q8dSn1c8QI4oAIVlvpIJOk71fcGh4VW3RxoAPOUXjAsuk5QlIRM6MRZbeqwp1dPs45SdH6ckE06DU/LbuVryAjx5/MCk7/DuK+HDAPJJuS1BpIsqEwlp4Fk/QRyUfzvl55KV3ZQzoEqCZMK6b2bMt4UTC792sHT1FaEB8OWCvuIq1QuBgwAngkBGpFOhR4=
X-MS-TrafficTypeDiagnostic: MWHPR0101MB2943:
X-Microsoft-Exchange-Diagnostics: 1; MWHPR0101MB2943;
	20:3JUkK7R//n7kCmA3cgAoJ/d70tGq6zWU2O45qStYpJGxo8BCsADMyoQ0jW18fffnEiFIvNDjqrJK6ozhmB/JS4orlrZ3ocPNFrZs2UonECUsel7kZoREtspg21EsC4ir+1UTCztJUbGW2gDdZUtwJjL6rEvTP9sPQ1kW/mPtNc7Y1nl3EwAdRf3qRBj7xGGtOjtpkPp2Q0ngj8lY3T9erp8WwW5gF/DU4yNh3tjwUBWCA2wYSqvVXKNe0xN97NSSFyU6Q5DB/dZL9QImldFV/c6eliQrmPbGbzyuP7E74RDKMwE5xFSnZlm05tbxNPCpKzsOjhjPzc4vahAEmG6sMkZk0zXb0YR1ggIqVEGTrtFswyLybPi8fMcYMX4gBfFFTuaSC5zq+r1R5x6XzbqiyLEUrMlW2Oep0Ahk0EQRRn0=;
	4:vYYzWqTQHvTyFnhTpSziOp8yhWtQaHNvptY30GXkqDLEMD4BFkTtLy49k5L8CAhwPsERNe3sV9eWQcXJVQUP1N9bZvLs5TEQ+59MqD6ELo8qyqwUbUXP0FntddbAeddE1gfIueU3kLsLwD3o0NPxVmtHgrg1/Ccwg3jRtaI0epJnILM7d+ITCEka73JpmfWjMJUlV7lJv5pum3txqcV0RcZrhVVzihOLo00cFrR8lp880O2r/iVtTGsrAZzDbXvQ4hpcZneF1VEmwyWs5Xex62yKyppVpv8GkV/Z3qN37MDFt6TFDyFy7EQkMhafdR3q
X-Microsoft-Antispam-PRVS: <MWHPR0101MB29433CBF20826AC30ABE7480AB2B0@MWHPR0101MB2943.prod.exchangelabs.com>
X-Exchange-Antispam-Report-Test: UriScan:(788757137089);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(2401047)(5005006)(8121501046)(3002001)(10201501046)(3231022)(93006095)(93001095)(100000703101)(100105400095)(6041248)(20161123560025)(20161123555025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123558100)(20161123564025)(20161123562025)(6072148)(201708071742011)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:MWHPR0101MB2943; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:MWHPR0101MB2943; 
X-Forefront-PRVS: 0490BBA1F0
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(6009001)(39830400002)(346002)(376002)(199003)(43544003)(189002)(2906002)(6486002)(189998001)(68736007)(8676002)(81156014)(81166006)(66066001)(50986999)(47776003)(7736002)(305945005)(86362001)(101416001)(5003940100001)(33646002)(54906003)(97736004)(16586007)(36756003)(105586002)(106356001)(478600001)(316002)(25786009)(48376002)(2361001)(16526018)(2351001)(50466002)(6116002)(53936002)(6916009)(1076002)(50226002)(8936002)(3846002)(4326008)(5660300001)(107886003)(6666003)(11771545001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR0101MB2943;
	H:columbia.corp.xevo.com; FPR:; SPF:None; PTR:InfoNoRecords; A:1;
	MX:1; LANG:en; 
Received-SPF: None (protection.outlook.com: xevo.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; MWHPR0101MB2943;
	23:nLiOVq4mhUU8XULzbi/az/zGEuJqrfrasuketBT?=
	=?us-ascii?Q?0d+1OWHem2cBJMvvi4mwDZ9GdsjzfOKrQXzHEGGGx21kYCqdhTxy3X1dGlZX?=
	=?us-ascii?Q?cMkVql5RYJUjQj7WdWJlIb+QbhkwEdVt8MLYX3s/u7qJ0xrWymBMWe0Lh4ak?=
	=?us-ascii?Q?8eU1qfOFIr54SzbTcbihugwn6Fp+bHZH12LyNVCUWlni2S7AKdwNNmaxUQ25?=
	=?us-ascii?Q?2vDRFs1TFp0W/24+7rTQTEiPmEyMHIkBcqQ/jZMqQfclHyCbLSMsvCa+5ks3?=
	=?us-ascii?Q?bLDim7J3yHGXknIQ2gqbY3PHd7wY1zGJbwe7sGobXDQ2CbPAWb9Tcm6lz2gL?=
	=?us-ascii?Q?VIp/EhTjD5FaxzkC3zR/kOtuhCIA989QkXyUetxIQ+5gDjHPhSLVnx3CjSwU?=
	=?us-ascii?Q?RdDz3eEda9aK5Gf5CGySpWdRlDSdrNVyyf7bnEk9h9J4Zpnsg/VwGoe/eV/l?=
	=?us-ascii?Q?Qxj6FlI3kdJSG6cSfa0oCYiiq8SyRKbwcAMmFeboF+haE+W6hgZpd4gpJKgJ?=
	=?us-ascii?Q?uqflk/4OdAarLRs351D5UmrP5hCKbqKNUccx9SeGzklaiSqB0HUrXiNdI7YS?=
	=?us-ascii?Q?xDT4/BJEoLLFWY6Gd5Kaj8UmY434+w2ZXYSvv5UfPlqV2hpgx4m0q60+5fzt?=
	=?us-ascii?Q?BZCVNfjEBaRot6ZWoXwLkpBZKeBGCnxQ50kKhbZhRQmFeiMN1YfLY5YvhG6v?=
	=?us-ascii?Q?1ocVUiDIvccnQcqGmcbEciapRKDTxOanz4Rs4cnFjKn/3Qra1unwdy3Gr/xs?=
	=?us-ascii?Q?rJNalSp6KeXdKF60/Z8CIq03R3nXEDaoMHXKXQ1rLHiWYGGcYij75TpuV/5V?=
	=?us-ascii?Q?+Wgx9YTcs8jY/xx5TXX3Ypi8E20Wwui7Z/t58FYmVBsxm878DVqO6OkiJV3D?=
	=?us-ascii?Q?iwazF6WGKe/9hQNMhaUX3jKVT2iCPksBriX80bEwOg4WscYEB53LYcz+pkGu?=
	=?us-ascii?Q?Q+n2qPhFXgkLwbhjLtr0x6EB0pcAhv1TzdWiXZrRBZzbf9t54mUUXydozbxm?=
	=?us-ascii?Q?sZXVHKffcAOo1dxwaT2m9p8/GsUw9Zzk2E8OmWWyuvaj24ulho8Og93LPnC5?=
	=?us-ascii?Q?dqvr/dGj2a1oobPEPmjP2GS+JGLf1+iHJ+yOnDSfFrWx+nZ8fmQUw/kAJIul?=
	=?us-ascii?Q?xiR4x85SE9ghd2gKW23z+Vh42jadClxszOW82q41KGi6S69dKc+0yPQ=3D?=
	=?us-ascii?Q?=3D?=
X-Microsoft-Exchange-Diagnostics: 1; MWHPR0101MB2943;
	6:V7EMuu44GR/oQJpyMSHll5V9ThzG5iAcDj8UzeUZVdna9wD7O7yoMey/UtuSzfsct1VA75M8pOqLoA1LTCHD3gcWemJyJp33MspHmdG9/zGU44J6KyF5gysqG+zxC6x9ggj9uih0vPigaOg51mMx7FtMBxFR/I/ECMj9bH2DXEQ5QYIAW0tYTTxFbw5Y681tap7IDkOLEb/OeHy2JJcTGsJP8IImr8TfACrusgFa4eVBbBfBporqFRNSfB2AihSZAHiJjnVSIQRCywkPfcPV9d9RU5F95uVMIiOyR6NDWhId45cnM8EDZujDktjKT49SYbZ7hECiuccFUqJeJIXkq+usdi+ih7dRgwgHIdb9+7g=;
	5:+r8yoWJdXq5VOaBdq92s9hCfFaoQ4DYT6H67V/M1oxf+wz/0wqxl7ShSJ37YzWTxPWg+YDoin5Z1pU9KcnCeBMJaJsX/qgbTGf/U2swKWl3FoD62go+8mozfBcUoEVs+R7GvGGkuLXPOI/y9arQb7jRfDe8IonUAI2czJIIIMuI=;
	24:oDn4P+jubQ0d64MGBQKCspZv9aGHIj7p6DjnB8bjgHFl4J+ffg0fO0L5jw8b9Mvq3fX4NDwKUPVjBM+ABu3YjNcCVgtOxM3V6Tiydk6LNLY=;
	7:XXeaO5kfJuph8DMWqAFsGfHLCDJ3v86i9Q4lTVXmpliW92pS0Ih5OErg7SJsr61sClp0D+eOfBQprc7mAIEBc5oUo0WP7hTimTm0cHIYw8K2mFWt0r0JRrMPZUn+axA3DM6QQ4uLPURP8hT2PwdsY6grzjgVftRuXHa1VDgkyS+Lswt4r26MZdLTuSXMYDK123lGgmMZn+id1F5huIl13sBd6veDd68sfHhVN809H4KLl/hlEc90Nqcvw9Pg8ltx
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xevo.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2017 19:27:35.0851 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3be666a6-17ee-4a3c-b583-08d52acc9812
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e0a7ca1f-2458-4cd6-a7c7-d733c07495ab
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR0101MB2943
Subject: [meta-oe][PATCH] meson: export native env only for native build
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
X-List-Received-Date: Mon, 13 Nov 2017 19:42:47 -0000
Content-Type: text/plain

Although the meson crossfile should take care of setting the right cross
environment for a target build, meson slurps any set CFLAGS, CXXFLAGS,
LDFLAGS, and CPPFLAGS from the environment and injects them into the
build (see mesonbuild/environment.py:get_args_from_envvars for details).

This means that we are seeing native CFLAGS, CXXFLAGS, LDFLAGS, and
CPPFLAGS in the target build, which is wrong and causes build failures
when target and native have libraries in common (the linker gets
confused and bails).

That said, we *do* need to set certain vars for all builds so that meson
can find the right build tools. Without this, meson will fail during its
sanity checking step because it will determine the build tools to be
unrunnable since they output target instead of native artifacts.

The solution to all of this is to set CC, CXX, LD, and AR globally to
the native tools while setting the other native vars *only* for the
native build. For target builds, these vars will get overridden by the
cross file as we expect.

Signed-off-by: Martin Kelly <mkelly@xevo.com>
---
 meta-oe/classes/meson.bbclass | 22 ++++++++++++----------
 1 file changed, 12 insertions(+), 10 deletions(-)

diff --git a/meta-oe/classes/meson.bbclass b/meta-oe/classes/meson.bbclass
index a09bc240d..3a2d5755e 100644
--- a/meta-oe/classes/meson.bbclass
+++ b/meta-oe/classes/meson.bbclass
@@ -9,16 +9,14 @@ do_configure[cleandirs] = "${B}"
 # Where the meson.build build configuration is
 MESON_SOURCEPATH = "${S}"
 
-# These variables in the environment override the *native* tools, not the cross.
-export CPPFLAGS = "${BUILD_CPPFLAGS}"
-export CC = "${BUILD_CC}"
-export CFLAGS = "${BUILD_CFLAGS}"
-export CXX = "${BUILD_CXX}"
-export CXXFLAGS = "${BUILD_CXXFLAGS}"
-export LD = "${BUILD_LD}"
-export LDFLAGS = "${BUILD_LDFLAGS}"
-export AR = "${BUILD_AR}"
-export PKG_CONFIG = "pkg-config-native"
+# These variables apply to both the cross and native build. Note that we do
+# *not* set CFLAGS, CPPFLAGS, and LDFLAGS because meson will import them into
+# the cross-build if we do so; we want the entire cross-build to flow from the
+# crossfile.
+export CC="${BUILD_CC}"
+export CXX="${BUILD_CXX}"
+export LD="${BUILD_LD}"
+export AR="${BUILD_AR}"
 
 def noprefix(var, d):
     return d.getVar(var, True).replace(d.getVar('prefix', True) + '/', '', 1)
@@ -94,6 +92,10 @@ meson_do_configure() {
     fi
 }
 
+meson_do_configure_prepend_class-native() {
+    export PKG_CONFIG="pkg-config-native"
+}
+
 do_compile[progress] = "outof:^\[(\d+)/(\d+)\]\s+"
 meson_do_compile() {
     ninja ${PARALLEL_MAKE}
-- 
2.11.0


