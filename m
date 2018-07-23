Return-Path: <prvs=735146e9d=Alistair.Francis@wdc.com>
Received: from esa2.hgst.iphmx.com (esa2.hgst.iphmx.com [68.232.143.124])
	by mail.openembedded.org (Postfix) with ESMTP id 078A375340
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Jul 2018 23:11:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1532387979; x=1563923979;
	h=from:to:cc:subject:date:message-id:mime-version;
	bh=Tioeq9XH7phW+cGMpl2NWSUDwblUE9+89f0XrWV55f0=;
	b=OQUVSAGjzUmvtXc4JjTVGjpXWjAi7aoKKWa1dCe+IIh6EywVGljBl4Pa
	QtvJwBmVHKslMNvbDL3laNMbw423JKqpsC47cWJAqsDDhtBWDWEbuWaaz
	YlByHHWAV6vFfVQTUD+KckOeGyt8HhZ936OuAulDVpz3j5bgjQgBOEWST
	8P3UB6KJ4kO2+5PYmWxPF1I9HUXnWea4/7vkwDUq8uYNJoO/6G2Iw5KFO
	fcZA5mNGAFZ3r0tMVDjcffI60tFb0yafs1wpnrdUMaCbGUUWm9N3BRgHD
	lownghXPRUdjFZ23EsqgyFGJFz0A4x4Om2/HFuPXF//LhjWq/QyO7tAD3 g==;
X-IronPort-AV: E=Sophos;i="5.51,394,1526313600"; d="scan'208";a="181897020"
Received: from mail-bn3nam01lp0178.outbound.protection.outlook.com (HELO
	NAM01-BN3-obe.outbound.protection.outlook.com) ([216.32.180.178])
	by ob1.hgst.iphmx.com with ESMTP; 24 Jul 2018 07:19:36 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=wSooBQocmvveKfUAut0AKz5ynxvGgFlS42BcoysAKuo=;
	b=NWYgaNAZ1oYgcJ6B+PcNW1lo+vHCz+SbSAk93F/HXcUjznAjue08u9v4EgBH9I2xrZzItjeVcScW+LL3UeZiy4dQ/cLzIKaQTqh9zr1nzpgfa6MmQOSV1ZAnjmebJVliD1iEUuLUewFcPz4LcMs9RU0zlKKi7yYDeXJMhTfyYb4=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
Received: from risc6-mainframe.int.fusionio.com (199.255.44.171) by
	MWHPR04MB0398.namprd04.prod.outlook.com (2603:10b6:300:70::15) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.973.20; Mon, 23 Jul 2018 23:11:16 +0000
From: Alistair Francis <alistair.francis@wdc.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 23 Jul 2018 16:11:04 -0700
Message-Id: <20180723231104.23011-1-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [199.255.44.171]
X-ClientProxiedBy: BYAPR01CA0013.prod.exchangelabs.com (2603:10b6:a02:80::26)
	To MWHPR04MB0398.namprd04.prod.outlook.com
	(2603:10b6:300:70::15)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c020854e-23fc-4b2c-4ad1-08d5f0f19785
X-MS-Office365-Filtering-HT: Tenant
X-Microsoft-Antispam: BCL:0; PCL:0;
	RULEID:(7020095)(4652040)(8989117)(4534165)(4627221)(201703031133081)(201702281549075)(8990107)(5600073)(711020)(4618075)(2017052603328)(7153060)(7193020);
	SRVR:MWHPR04MB0398; 
X-Microsoft-Exchange-Diagnostics: 1; MWHPR04MB0398;
	3:O0vLbe+aBzv9mfNwk2ilxkR/mTPk07KiM4lbEWDSyYg8Js9+EGGtj48UwCsRm2Prl7yEx+CNCpJCdnn6SFSAFK+YJMDByEBshxy1Kbv6GJ0uWlkzDh3USD0k9HUamdqE2RRERY8r3KbaH2IjZUw1tDe6a7VXNvWd+7D27DN62z0OZkgMzrxOMaL7USNvO8BCY9zGrbNWhXQYbpfjoxsG0PE7iXcWHfrXIffHoJhVPYwxdcnZXB4EKLITJMUp453H;
	25:s+OVwm5ewfuW7sw5wM5J1f0poLnM7mlpnDzBK2HMB2kLlPpXQznFa8koe93XDuyTvkipaWKgLqS8VEtiFJkCpCqfElyGGRvcHnGW+hpMjnFNc1dm381pKePU5sQqKoDGxuvOuHLPKIz+7UWjs2HBocaK8IIvG6dG9C7oqsKFDgGPE3C6+hSmhDjVeHrqVbgAg7PHSTrmYO9sAHnvGgcXqKb17ruOmAoxHLVTMGHIOI66uf2ghFYFNf/KwMdy3g/NAf3EW8cCUFhmjXzwsg3O45XeJC5JBanHb0iWuKW2AV2o5yJqeazHwhB7MK7giv3j0MHw660kpmaYxCxv7JhzvA==;
	31:GqmncKY9lFd8iIIpHnCGA3D/4Pr9OB13oLqSz/CM66MkrcA7DL8Bc+eGSvvKEjB4G7nMFW6+hEpXqpBmGz7I/lXbt7v1WKjcyr8eWWRBXF6ZqwUWrepN3ffYg68s+89m8VTtIbLKywAwgzXWp98V2uS5bkuNCi+6nLaLT8la7ngsBkFbTp0aM84ky/rPzuEY9P+R7VcRKO06SlY1t5G7Zf/RZNB3CA0QcdMn//t4IOQ=
X-MS-TrafficTypeDiagnostic: MWHPR04MB0398:
WDCIPOUTBOUND: EOP-TRUE
X-Microsoft-Exchange-Diagnostics: 1; MWHPR04MB0398;
	20:wGvJmfiWe0txKPdm3lLQ5mVbuc/Vh9u5Z0+ltkrrBs9C1KKxzYTaPxHg6a7creHwf+kGm/8RGvV6WTuAwcqrJU83GdNM1sH8bAA2J/6QoVK4exb0QyOPzzDu3TFURNlMm0lhXYUAWQsOKFGGh/9XbE5CHdhJziBp9WlGSObcJpkLi0352DQDBKuQYQO/dKY4Dlg8fiAyUgH+5Viq+HNaaYOms/gNWL6ufAxCksjJyeeehNGvvNxmCw2D77FuaA/GdQra7FzI/RPyYqoHB0V0qdm5Ip+CP4/0WqLYjlB+LAPTRyBndcQbeh9DeNP6nsp2wXsIYAU5Cf5msX3uHd5n/TzTjqRfof9n7864zRdX30HXo5d+spvCG1pXp+p/opbYY9g6rMEinSZ3UHz5TkMG4edP8prj6fafDdYdPPog00uneCD6+z5VXqPQ+r+AysO6hGj4vmGpdS6ZfyfvREOpM8vLh4m7T8+yvQCNcVrjyAyPa/WeXzVNIXYsuggX833I;
	4:ML/Pv826TliTbDGnjSs9lDZpLRqN+2vX68yhcGuS7Fne3JbffufY7RVajX4/J6d2QLhAt7nS7BzT9OapYsqN8mQtVCFQjLLfh+P7TkmHQqSJe/CqOrmulInr43Bq+tZJoqEUuyA83euHAIZLatheTtXylktiTBVVe6diq4QS/TYSdulDfHFJ5tZVczUL6Qa/lnCKDtqTFNOdHgq6HMCs7O74MFc6Prk1lJEp5uzopUGRtuq88LdJ+GiKXFW2qv7Ki9l49dTPSzXtBmUqJ90kHATL7OZDl4KWejhPOTuTtNtEtXUWjWGVVq4avqok3mYFRbCQvM0XPJ0hkfLuVN+Eq4+tGIv0X40/NY4hDsapZAIrXt16oFEAGynE82ECCyhW
X-Microsoft-Antispam-PRVS: <MWHPR04MB039808643447EBCEF63593A090560@MWHPR04MB0398.namprd04.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(166708455590820)(73538370219878)(84791874153150); 
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040522)(2401047)(8121501046)(5005006)(3231311)(2232096)(944501410)(52105095)(93006095)(93001095)(10201501046)(3002001)(6055026)(149027)(150027)(6041310)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123560045)(20161123564045)(20161123562045)(20161123558120)(6072148)(201708071742011)(7699016);
	SRVR:MWHPR04MB0398; BCL:0; PCL:0; RULEID:; SRVR:MWHPR04MB0398; 
X-Forefront-PRVS: 0742443479
X-Forefront-Antispam-Report: SFV:SPM;
	SFS:(10019020)(39860400002)(136003)(396003)(346002)(376002)(366004)(189003)(199004)(2906002)(305945005)(2361001)(6486002)(6506007)(386003)(47776003)(476003)(486006)(186003)(6666003)(44832011)(7736002)(6916009)(6306002)(66066001)(6512007)(5660300001)(956004)(50226002)(68736007)(53936002)(2616005)(16586007)(16526019)(39060400002)(50466002)(316002)(48376002)(36756003)(14444005)(97736004)(8936002)(4326008)(86362001)(2351001)(72206003)(106356001)(51416003)(8676002)(52116002)(478600001)(81166006)(105586002)(6116002)(26005)(3846002)(1076002)(25786009)(81156014)(59010400001);
	DIR:OUT; SFP:1501; SCL:5; SRVR:MWHPR04MB0398;
	H:risc6-mainframe.int.fusionio.com; FPR:; SPF:None; LANG:en;
	PTR:InfoNoRecords; MX:1; A:1; 
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; MWHPR04MB0398;
	23:L3UCr4RtPYIgAvPSrtV84J3zrT2yROESmSBhcDiyN?=
	=?us-ascii?Q?kLvZxdhz9OBosHcUm66QkSaFYRcaHwhVxS81Ze+d/sgatOueBxyTtw0OMx53?=
	=?us-ascii?Q?9zRkEGjuSnG/Fg1TDMIrdfdNxCv04dsdC+fayBiqtnYr4FQt3ctL2aMHYnN+?=
	=?us-ascii?Q?Sf/DwVPldGjZ8InBbhshexZhiN1yWa4luYs8l2f0Cq/zOOMjpDnSisHTsaw8?=
	=?us-ascii?Q?qCNXWRjz3wB42m7qF7zABgrd+zxpLlKthzQddqR+AgAX7I8kGIpqaZj5u/cL?=
	=?us-ascii?Q?8Z/OX4+SaQqfbPkXxpGgefu8J77A+kCZho5kDE5qsREJPWkU9bRyTMk+MfbF?=
	=?us-ascii?Q?XpWlm/rvlBXtIgEG4+WMnik5sq80fsLg6chIQA1VGv3Q8dV6OOv1m8d4f6fP?=
	=?us-ascii?Q?umXTzgzyIn5qEasNlHpev7UWU3JoQYqYwuoOsTRGzugUxemnmaiT/Vz7ZzU7?=
	=?us-ascii?Q?hxBrvJQuixgMLqA+y0WxYxEbikhUowxyUsdTwoyKOVmK9riqDbnf4rc3FzS/?=
	=?us-ascii?Q?5tFrd/KVHeBRaLpcjevMXT3lC/PzpCI0VnVEyQ3u9P/umuXDu3qwHvzo6anv?=
	=?us-ascii?Q?6u5OFiSlomEw1Ee0h6cvdlkOGyMNPTgUOT9G+QJWnzvsKOu4nsaHFfGhGh7n?=
	=?us-ascii?Q?PVarSU9ptjHMQUgrO06/YuI+RwQ4EKd9soEQUTSNIg1IVzmWtxPnEJ9iR/o1?=
	=?us-ascii?Q?o+8y5OlcVKNGAB1sWfzHrTIZdQq24nXzGPcly+Z1FZCM6+HZeQ78YkxQyIeO?=
	=?us-ascii?Q?WZRkwAwM88DuwFaJXjoHTg4B5mr7B8LufgQbKR7smnlfTBxKTk+kJvFhMF8x?=
	=?us-ascii?Q?QQqUG2fYQwUev5kXtcN6gWwfY9zgoSRMV4CLiPA8osLsmxVBAwVFGQ34tFXH?=
	=?us-ascii?Q?PXBiY/gwKUfQj2smuB71G/1VfzR5pRGbvPu2iNXgWKvNfXe2Y3BTjp6JhVGf?=
	=?us-ascii?Q?iJeZQfahxxJBUew6zrxYPsOeZlJcIZ98oEjey9o77iGkAp7mSG15xOYX5fTq?=
	=?us-ascii?Q?fwh0Y+yejV83jtJ7j35rAlS1nQbv3QLI7pv5kTGx4FejJv5wrKhTySWBKfh1?=
	=?us-ascii?Q?0Ahs/hy8gsTHoaWY7UZo2owuTu9LLrm6Rv7DAoVQY4WqW6dpXNb7orza++Wt?=
	=?us-ascii?Q?c1ykxMFwonNQA2Gw6f/XfmiEu4HGY2EIAJtJMLvUcHhzkLaeCB6JCQkWlyAv?=
	=?us-ascii?Q?8s3q+eg6UwxLRH9p9XDdsyKIoGj19Ca+WtwzStnzqfhh6kPH6sgOIzCYXqSB?=
	=?us-ascii?Q?keZYVpmqBJP3gdnhl3Z9i1UhyaQkI+8u/Utovz+qMsdC3btOXwWheWbzYC9U?=
	=?us-ascii?Q?n2//yERSyqRCA33rf0Z/ejWjMWMLWztAbBteUMEgoSw?=
X-Microsoft-Antispam-Message-Info: 0lzfYphxSCqepcC8BS81OxeMZGHkaYkqo0E2En03MRh3SCLBuIxhKCmGzreVRuuOOGJ5aml1++tUvxo/J5ujq2114MZ7KLzVSriC8KaY9AQYfF2DiuttdJv2bcLelDlD1taTdSl9tH6I2J7rOV9iKeqnStoP3Z0ph8NDQir5VN4iwS4QZuFeUrscyu4RkFJBUPOI2wycsrplF10HRnSaIlAO63uB9jkXrytHY/tji6k1dVWvzZo7QMtjtCbXYqy0L8vlv15Fwq/cgOBSXAoMSE0CSSPdFKdg5qE3TI48zqvd1fLtjYRqFeXM6ObFUxAHXSP5W2FImjDDFotvHQrBPWD/N+Urq0FDSvhIl6PRrGyrQiIFugSNjyFuAylIflXDtgQSyR9HmdUn0lIfOkJxMhIx7jK8+SKlL62E5d3378tmH6DKjCizo9+/Js16ntbhViXnFsE19AQtDpSsfxxlpR5kElaxwUUySjqr3Z4ZUVfbAUzAZ5+TiQwRuw/YWACa0d7sPHeGdQ1NiB0CXqt0BTTFattC91NkKlfMgudn0kIGyK1Nw9lkfGG12Epv9X/dbpZxDrg0/AXMoUCh1vdUG8r8c5NCJMrJfIIexiteDxxb4KeEt1iddqm0cVbmDjvz0BjQ8dY5EtNW+ZuuriEw4MSvR9M9ksIRwA9V/g2Es+WkgzXZ+/jp4WPXY/iy1z6LPhOjA5WdvnUoK/ecO+RtEQ==
X-Microsoft-Exchange-Diagnostics: 1; MWHPR04MB0398;
	6:DOcoRtNdlqQl+b67zkV3pSj5OcaRfPk63+HxHBI1u8VxRo6+SCtb4zwtrHWvWZoCoIwqLgGpoFvu2eoEzvFJ8MqOIlBNi97Xj5aQfj8PXG+h+Sbtwpy27zZGguhUqfs+4tSGRPc/NNUpjUCiyOFOAd55wABS+bwIiQ/jmOrPnblZRk8VoJ8qV21E3dgKCMttzQtTmcIMvH/i/RxJC5TOInXOInGMNuttbRNslF1ZLeQQTC9TjjGKzaXVTJPpL0TFb3qYJNLFl4bt1nFjr9/RSG/Fi411hJ1zddDY/eEmK3KApLX5YQGVCUk2pZp3GBeUjuZVHt4vuIrryBAmuFFVHbjm8N7PISWUpUQ+josXrXH9XTsYCWotQaSd6Hj5kdto/Pk5sgp//1X4iAP+MxWyThV23VFXD4SWOF8GnScfJFPO2V8w+FnGEfO0P7AiclQhjuxYcllehDnKBtusDz29+Q==;
	5:Lha+tHwy3aWEraNn1H8batP0VIrNPLlqCL+MnyHsAo0V0cHl6plN8CZt+SXHGqTEojNy5gfZa4T4G5qvWr3/hgBkp1NftHrR5CEDV0c7CEFSt2/lFKx32eRNUpg701d836jKou7TMJ3xd3oTo/gAWFQpWgoIEJulGGTLmjHksD4=;
	7:j9EZ58R5ZXrtXz+jX5r5k0Eus/HqQz0HP+kL/137Lm4K8gR+cScr/DtQlKK850/rPU268iTheM/Ts/uuDTc91di8bvRXwXDy79X2jXejlER0sY/kwd8BYvPk6/zCgyrL+krRnTj2Lf+1AaTRde5xKQSxKA7fVkrHntQtC4YlrK0NqJS7+uNUt780aNaiUSOwtOs94DSONn93QsxwrhAFGKXWQSsljIwEc8NnzjhszslqAlsu9VZZJFYo654Mbytp
SpamDiagnosticOutput: 1:22
X-Microsoft-Exchange-Diagnostics: 1; MWHPR04MB0398;
	20:iRcLnkQ+As1koRG3mnL5Tsh9FNo+7t4JM1nq/hDWzBNOzp7J80RfvUfCtMjMoJMqJypyBfyvfma7zQJOXv6rUvECexW/YuySVaqObce1usXJDwm4xc2andIruXWqiqJVFJFyGBDu/X36Jd43Jg4dVgHRQxMfRl33lXRsIn+UkFk=
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2018 23:11:16.0797 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c020854e-23fc-4b2c-4ad1-08d5f0f19785
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR04MB0398
Cc: megha.dey@linux.intel.com, ricardo.neri-calderon@linux.intel.com
Subject: [PATCH v2] ndctl: Add the NDCTL package
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
X-List-Received-Date: Mon, 23 Jul 2018 23:11:18 -0000
Content-Type: text/plain

Add the NDCTL package (the libnvdimm utility library). This is based
on the work from the meta-luv layer with a version bump.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
V2:
 - Fix install failure

 meta-oe/recipes-core/ndctl/ndctl_git.bb | 29 +++++++++++++++++++++++++
 1 file changed, 29 insertions(+)
 create mode 100644 meta-oe/recipes-core/ndctl/ndctl_git.bb

diff --git a/meta-oe/recipes-core/ndctl/ndctl_git.bb b/meta-oe/recipes-core/ndctl/ndctl_git.bb
new file mode 100644
index 000000000..36f94ecfd
--- /dev/null
+++ b/meta-oe/recipes-core/ndctl/ndctl_git.bb
@@ -0,0 +1,29 @@
+SUMMARY = "libnvdimm utility library"
+DESCRIPTION = "Utility library for managing the libnvdimm \
+(non-volatile memory device) sub-system in the Linux kernel. \
+The LIBNVDIMM subsystem provides support for three types of \
+NVDIMMs, namely,PMEM, BLK, and NVDIMM devices that can \
+simultaneously support both PMEM and BLK mode access."
+HOMEPAGE = "https://git.kernel.org/cgit/linux/kernel/git/nvdimm/nvdimm.git/tree/Documentation/nvdimm/nvdimm.txt?h=libnvdimm-for-next"
+LICENSE = "GPLv2+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=e66651809cac5da60c8b80e9e4e79e08"
+
+inherit autotools-brokensep pkgconfig module-base
+
+SRCREV = "0d6aeeabec9d271e08c12e4cf679b59946e20156"
+SRC_URI = "git://github.com/pmem/ndctl.git"
+
+DEPENDS = "virtual/kernel kmod udev json-c"
+
+PV = "v61+git${SRCPV}"
+S = "${WORKDIR}/git"
+
+EXTRA_OECONF += "--enable-test --enable-destructive --disable-docs"
+
+do_configure_prepend() {
+    ${S}/autogen.sh
+}
+
+COMPATIBLE_HOST='(x86_64).*'
+
+FILES_${PN} += "/usr/share/bash-completion/completions/ndctl"
-- 
2.17.1


