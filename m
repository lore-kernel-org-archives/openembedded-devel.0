Return-Path: <mkelly@xevo.com>
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
	(mail-cys01nam02on0080.outbound.protection.outlook.com
	[104.47.37.80])
	by mail.openembedded.org (Postfix) with ESMTP id BCD5178536
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Nov 2017 18:23:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=uievolution.onmicrosoft.com; s=selector1-xevo-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=bkp17qCIAecsQs7I9LrV0VagA7FrVy28LWQ1QUf1sn8=;
	b=0aTRgNybuUajdsNDIyETcOkeIlNTgnmZsG0SfZ+lFxluT9FYCcsZ3+JSZgPwM6gsru18FeP54Xc7SB+LWZ2LrDuihlbSuYGI02cKk9LMO65RlI9TY+EDD0EW7wAC/b5fXBS3ePeYVZqOC3USAi+b2RrMnyTboMau+OWHbylXTFQ=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=mkelly@xevo.com; 
Received: from columbia.corp.xevo.com (65.122.179.226) by
	CY4PR0101MB2935.prod.exchangelabs.com (10.171.223.140) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.218.12; Tue, 14 Nov 2017 18:23:03 +0000
From: Martin Kelly <mkelly@xevo.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 14 Nov 2017 10:22:52 -0800
Message-Id: <20171114182252.28244-1-mkelly@xevo.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
X-Originating-IP: [65.122.179.226]
X-ClientProxiedBy: MWHPR03CA0002.namprd03.prod.outlook.com (10.175.133.140) To
	CY4PR0101MB2935.prod.exchangelabs.com (10.171.223.140)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 11674cb3-bbf2-441d-d580-08d52b8cbed0
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(4534020)(4602075)(4627115)(201703031133081)(201702281549075)(2017052603258);
	SRVR:CY4PR0101MB2935; 
X-Microsoft-Exchange-Diagnostics: 1; CY4PR0101MB2935;
	3:qcDoNoxxsChassoez/d4y9YduBTxbB3L3nAoC7TeFB/rqW224ak9VDc0LteVYafEjV0SZy+nPvEC+x9T0fMSi83IBuwadsmGpV9d8FCMaKnfsKRIH/NdurvYKtvvN4akZ4HDwqw8MBT18Y7goSu+CQdj9V8gQgznBkEaKVagXFf91zQKn609xreQVw4t1ILZO2oDQdcvSq3SNfZ3z6NbD+FIMxboG8k10kPTuq+qsLhp2PdwA7c8cR/t+lfd1Zh5;
	25:I07WUkLNXryrXMV59LxCYA3fVCnJjRy/KNVu0WveEh4/5D+f+JoIVuwNrPQas4ZUC4/S9B+5IgsJYVAFtiLhpPIt1tgrkHEu/ssUKXzI/eWFDdiT0TT3FjzSIOos/DGfjpdHLe8DhcfxVAyqwzei8z8L3sfC/McmRo98oqaM1wIsvV0hepCkbSKcs5MPaUWkPqjCjp2Z25fj5HkR9QnW+MWEtt6viShmcPdhdfDv4SvZHXF4GyF4R+jVERyPdzvAxL8WmP+bO+sTE7Bhp3lojDYF2PHk97dOsb9/hNiptKzNWbPCgeoWv1QH7GopvNLKJC5U38G+XnVSIW10s84LHw==;
	31:xC/4n4Ln7gLgSeVp5n4fXwWmkj0nDn7B2hUPMlpYKDfmVO/Ewl+toaeRuEcAxT3KlTl7jH0WeQx7UeDHcINIgn63zOgtQwHAXyF+5rB4AmYxt3rR4wHYAmlkRfZ/kvlprSOQCznmqHwYV9wGIqq9whnshvi2mDvBq43ejaPuDY9xbqiDqdwsaVZLveN2Rva/sGvTaM1+uloVwjrsGe4CWpeGvIEn7IyowikEJV7cnqA=
X-MS-TrafficTypeDiagnostic: CY4PR0101MB2935:
X-Microsoft-Exchange-Diagnostics: 1; CY4PR0101MB2935;
	20:xPmNe8clgDOdEutCUvelclELHup1SQ31eukKzU/GJw7TEtIRBwaZIzW2A+eMZ2Cja/tE5XP77e2P7KWpY+WuyJcLaNmQofHvQsi1Eb0EydwmzRn/HPhkouBt6PfAVv3/YF5sqwZONJPtBC9KBfCUcVDpr68SHSAb0fLXywy0r8adOkCsp6TtePvfUND5LGVwzn0zmEgZe+8FpveNVccMsLS8EPXMSMKKcl66qdEWg0qc7yVseZnztkh9prO8zgzdjaqhHl0m507ojjBhlvkf+Wg4/LtLoh6NdcezO6cxvxDpeVtwDoTPprf4lhswHoWOjtHZIAgDkqOidAXW2HF4KZNAXfvm3ioNxxeNgfYV2bmH33JfjZSYZ/kqrgMTBQ7Bc7O19i7da88cEkTAFTNCwrcV6qHzHd/XU9TZpPuDY5E=;
	4:oMuc0rTLFxffLnpomagOSKw5acwzI/yCWAWPU6tr7KfcIxYtSURut7Yxg1REuZnwSXX374j68Ih9Pf/QCOyBCgKQZqzVJczLQtNUlnwvpZAlYO5Y7nvXcBVX2V3hIGyGBdwAgcbFeBhBuYSOyp6spK+y8WMxaNaTVrP1Ycneimxyx6MS4CWsL3HPT3PfyvWnE3XOu21Nl5jygl3cjqqG3/6J+w1pNGWx5xf4whsJCDgOLiY4KaKVz9vjfMNpHNLnZwzk6nl96FiRYqwX7ZFvi0R/xN95uMsFYWhgnzXOMHE+XGmM59PjitK3PooGd83N
X-Microsoft-Antispam-PRVS: <CY4PR0101MB2935A3DFA2F3A345244F5019AB280@CY4PR0101MB2935.prod.exchangelabs.com>
X-Exchange-Antispam-Report-Test: UriScan:(788757137089);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(2401047)(8121501046)(5005006)(10201501046)(3231022)(93006095)(93001095)(3002001)(100000703101)(100105400095)(6041248)(20161123555025)(20161123560025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123558100)(20161123562025)(20161123564025)(6072148)(201708071742011)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:CY4PR0101MB2935; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:CY4PR0101MB2935; 
X-Forefront-PRVS: 04916EA04C
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(6009001)(376002)(39830400002)(346002)(189002)(43544003)(199003)(97736004)(2361001)(81166006)(25786009)(8936002)(50986999)(101416001)(305945005)(81156014)(3846002)(36756003)(48376002)(50226002)(105586002)(2351001)(7736002)(54906003)(47776003)(50466002)(316002)(5003940100001)(16586007)(106356001)(66066001)(6116002)(68736007)(4326008)(8676002)(86362001)(6486002)(16526018)(6916009)(478600001)(1076002)(107886003)(2906002)(53936002)(189998001)(33646002)(5660300001)(6666003)(11771545001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR0101MB2935;
	H:columbia.corp.xevo.com; FPR:; SPF:None; PTR:InfoNoRecords;
	MX:1; A:1; LANG:en; 
Received-SPF: None (protection.outlook.com: xevo.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; CY4PR0101MB2935;
	23:aAkG8gzNVXEP2eK+YF3F0KtLXxdAicxgCx/ztcl?=
	=?us-ascii?Q?wOIF6cZbzOO3yajYFkJ8SdemPBqdpwWaMlmpr8HV92u0WgjIUHEyefXB/Fyl?=
	=?us-ascii?Q?h46H1sMkwKvGaC9aDe3zX+N4XSh4uJSYiCFvFWnIgAEyo/RD4LLoyuqH82jv?=
	=?us-ascii?Q?bTPQFk4UR5rE/NOVv7mOh/yv08cQHEVP85J4B9+GrYUghDzOu/fbn78Z8lpW?=
	=?us-ascii?Q?iz2p6uhiN/igMQKRv78C4lrFnTneORyWCUSlTb8X3asaVedgAom4NliWvJKP?=
	=?us-ascii?Q?H83jVh719wtsXQmBeGmO+BVZO34mXIph4EMmfznQP5hSNdQv5MWyQ44znIuB?=
	=?us-ascii?Q?mxnaFKVxTMqUPsDVIOUbhNWeBcDOcjyIwV/tLyDmX1L5LiaUny9wuxDq70wu?=
	=?us-ascii?Q?wFRXMbsWZwf/G0CGvx1LcdvGtiUJYuFwDFNvFLBj1RSgxvK+mtscKhz3jw48?=
	=?us-ascii?Q?bFc4GAdcI+pYkDw6WlY+naQ2lybNb5L6+X36T3t5Qv2sQDMAtD077jFon3bj?=
	=?us-ascii?Q?bnxmw9iaSnRiuGNW+4GJ3Soa1xB1TFtPD70SisWYOIPXSaaCP9ghqgudGBhU?=
	=?us-ascii?Q?jfqYsSnRgO21ipZdqRL0bb/EQFhtxf2kiKCURSi3VhobjWSfB7qWjvVWh1SK?=
	=?us-ascii?Q?wJxHmn7MWv7DXC3/2ZuQcj1zJBCgako5gleiUq44lK7Hfc93xv1sm7zHzT2h?=
	=?us-ascii?Q?xuZnjkY2iTKGxi3r75QOrq2e8u3t1X+ILu/dKNRvdFc7vars//pull6zasif?=
	=?us-ascii?Q?E+KXFFMxntD6YbgKDlaGzbsp70eHUP3z1sVUiVoFyW5Wl1L435Qot2zntdJe?=
	=?us-ascii?Q?xhsa5kf47pJKkjUgh2sjOZ2l1VdyYHrwuw7cqo2RXXr1J2xYE20+e+RFFPMM?=
	=?us-ascii?Q?K7xN8+ehM5o85KANO9xP/tvPokzeNDo/l6lazD8D3LNvzqNaoVttRSDijY9B?=
	=?us-ascii?Q?JVxRQriyLV8Vt2z5nS3SG2YdpLyQpJyBX8Alyesx2Rw7GMimQa8CxK1bqXHQ?=
	=?us-ascii?Q?PssmoLHt2sPJVBM4bYPgftm4JOM86qJcejn/AnLPDzBZ6J0uCI2M4wKvcgP5?=
	=?us-ascii?Q?V+k+yvkr5waUr+LRUOvdWq/R4123zAgXuVoQgd71D+3lT2iv7gYq1dRBwUhC?=
	=?us-ascii?Q?AS31bDxpDzNetwE7P8Q5PHg1syuPrtErxJL1EGRzo1JCqxTMst8psrA=3D?=
	=?us-ascii?Q?=3D?=
X-Microsoft-Exchange-Diagnostics: 1; CY4PR0101MB2935;
	6:ugcHMNw/dbNNXbeEgX/HIsTD3fXRYeBZilXxHbv98affuvsj8U2H5CQu7kCbbw9Nq4FhU2v2GrH47ZDt4vdUz3OzO1f8YlQXuHvs+Ex3MWMonoAzKi4Wp/Lgjf/FW8A7RWCBmiXkBkoKH2ZiSfJ+ISEs7NgW1lTp7sorCDeGx35eJ2ReEUP7XxmSUJyDkch15kEbyYtmsAXhHl9iY8PA5zY6xqY3W/5pCI7aMUC/vUoJYpV8PgyuqV1vhnNmCaSv8mTd8RNnzon+184bqly+7xYmcDPXMjitXAEsjOkpVb6g3qpiOMbDktaopF1wJ+4kks9jDjJ8gV6+yjNc91l+dG3iA+HBK8LcJpOQCsOwOy0=;
	5:OJtuREMTlwOQpgrt4ChgE6h2GVeCa6IZBLn/iv7K4AdkT2LrPk/XLzO1Nw2Mfhwj0KWwNNW8fs/0Ng4zW8j9m6zCdygKIpDVzrgJzOHYnyHwRthAKsqM0tXcyFKyPcx2Yz3PIuaYL4bKxuLo+CXZPv9YDcqj8BYD0E8qVdZEGTQ=;
	24:T1TNyBPmvhYNc9c773E5TZcIRiEpDLsLkndp7NSiqNfSKoGvRylDCYarou6Ma2vaWzJT1sal7N/MJGYM6Yst7pH1vuqWB7fJLy14cvbvM5U=;
	7:lnE1SM1gIH+5OSAA3k0p4oPoZhIq8CW+N+n22V5U2dwRwr2HRY6hxbprBmG0Qj5ZNN0O2gFdt2gdbedQiGgPQUy683SEQdMnMVxXzJfQHIQNI/6japaDB5tAX/dtagXHnCRz/0iDNfXHeg5TitRn3wG8Y59e9FmZcmYtE8zybEgB3AbHqTE0Q1r5IRXtD7Wy1QVb5ghdqCaL75sbfwayDQJ2nEps8S6q3SOUfTOT7P1Qr+NUNRkGWLFJ6cWVjfjN
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xevo.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2017 18:23:03.7847 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 11674cb3-bbf2-441d-d580-08d52b8cbed0
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e0a7ca1f-2458-4cd6-a7c7-d733c07495ab
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR0101MB2935
Subject: [meta-oe][PATCH v2] meson: export native env only for native build
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
X-List-Received-Date: Tue, 14 Nov 2017 18:23:04 -0000
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
 meta-oe/classes/meson.bbclass | 27 ++++++++++++++++-----------
 1 file changed, 16 insertions(+), 11 deletions(-)

diff --git a/meta-oe/classes/meson.bbclass b/meta-oe/classes/meson.bbclass
index a09bc240d..6e38b4bd5 100644
--- a/meta-oe/classes/meson.bbclass
+++ b/meta-oe/classes/meson.bbclass
@@ -9,17 +9,6 @@ do_configure[cleandirs] = "${B}"
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
-
 def noprefix(var, d):
     return d.getVar(var, True).replace(d.getVar('prefix', True) + '/', '', 1)
 
@@ -94,6 +83,22 @@ meson_do_configure() {
     fi
 }
 
+meson_do_configure_prepend_class-target() {
+    # Set these so that meson uses the native tools for its build sanity tests,
+    # which require executables to be runnable. The cross file will still
+    # override these for the target build. Note that we do *not* set CFLAGS,
+    # LDFLAGS, etc. as they will be slurped in by meson and applied to the
+    # target build, causing errors.
+    export CC="${BUILD_CC}"
+    export CXX="${BUILD_CXX}"
+    export LD="${BUILD_LD}"
+    export AR="${BUILD_AR}"
+}
+
+meson_do_configure_prepend_class-native() {
+    export PKG_CONFIG="pkg-config-native"
+}
+
 do_compile[progress] = "outof:^\[(\d+)/(\d+)\]\s+"
 meson_do_compile() {
     ninja ${PARALLEL_MAKE}
-- 
2.11.0


