Return-Path: <chunrong.guo@nxp.com>
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
	(mail-by2nam03on0121.outbound.protection.outlook.com [104.47.42.121])
	by mail.openembedded.org (Postfix) with ESMTP id 33F0571A5E
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Jan 2018 08:26:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=freescale.onmicrosoft.com; s=selector1-freescale-onmicrosoft-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=rGJeX8nIqeUHxSwkyMPQeRPaGRTn/A2HtAt8+JGoPdk=;
	b=W8mLcE5O4DBAcEoPzVbQD3/4wutoyI4432vWO354Vi0ALcyGdZFay2UXDwKkJecvS7isxztlJgyOfBzxvFup5M/CSpwFOmyQ5Meu8YGGgNdJg4uTcdadNQhmpIBuj9FRxMVOVdzHq2XUjwwDXQJS/0fmA1LPQ/iXYNSIT4nKp5A=
Received: from BN6PR03CA0079.namprd03.prod.outlook.com (10.164.122.145) by
	BN3PR03MB1352.namprd03.prod.outlook.com (10.163.34.150) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.428.17; Wed, 24 Jan 2018 06:53:22 +0000
Received: from BY2FFO11OLC009.protection.gbl (2a01:111:f400:7c0c::139) by
	BN6PR03CA0079.outlook.office365.com (2603:10b6:405:6f::17) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
	15.20.428.17 via Frontend Transport; Wed, 24 Jan 2018 06:53:22 +0000
Authentication-Results: spf=fail (sender IP is 192.88.168.50)
	smtp.mailfrom=freescale.com; nxp.com; dkim=none (message not signed)
	header.d=none; nxp.com; dmarc=none action=none header.from=freescale.com;
Received-SPF: Fail (protection.outlook.com: domain of freescale.com does not
	designate 192.88.168.50 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.168.50; helo=tx30smr01.am.freescale.net;
Received: from tx30smr01.am.freescale.net (192.88.168.50) by
	BY2FFO11OLC009.mail.protection.outlook.com (10.1.15.0) with Microsoft
	SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.428.12
	via Frontend Transport; Wed, 24 Jan 2018 06:53:22 +0000
Received: from sun.ap.freescale.net (sun.ap.freescale.net [10.192.208.75])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	w0O6rJMV002210; Tue, 23 Jan 2018 23:53:20 -0700
From: Chunrong Guo <B40290@freescale.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 24 Jan 2018 14:53:12 +0800
Message-ID: <1516776792-25740-1-git-send-email-B40290@freescale.com>
X-Mailer: git-send-email 1.9.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:192.88.168.50; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10019020)(346002)(39380400002)(39860400002)(396003)(376002)(2980300002)(1110001)(1109001)(339900001)(189003)(199004)(2351001)(8676002)(106466001)(77096007)(81166006)(81156014)(97736004)(26005)(48376002)(8656006)(105606002)(316002)(16586007)(336011)(51416003)(356003)(85426001)(6916009)(2906002)(6666003)(42882006)(230783001)(8936002)(104016004)(59450400001)(5660300001)(53936002)(47776003)(498600001)(68736007)(305945005)(50466002)(36756003)(4326008)(50226002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BN3PR03MB1352;
	H:tx30smr01.am.freescale.net; FPR:; SPF:Fail;
	PTR:InfoDomainNonexistent; MX:1; A:1; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; BY2FFO11OLC009;
	1:MfVzF2Elyk9VggV9l6lhC+mKvxlp9bkGaJTqpYXLRBhWmABfDs9qbmgogFEu3jqER5iXk+GEWEDpAjlNWaFDss1CFxf661DJxuvfS5R64MPIRChBypr6OSkqLLAZiljL
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3a505727-f441-4b30-c045-08d562f728f5
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(4534165)(4627221)(201703031133081)(201702281549075)(5600026)(4604075)(2017052603307)(7153060);
	SRVR:BN3PR03MB1352; 
X-Microsoft-Exchange-Diagnostics: 1; BN3PR03MB1352;
	3:KuLk7MMLikrz4QRu6wHhfdvgcfHmQMJRBqPcu438MtfG2B3xtOR3CB3u26h7jozWQQCYTmSYzNlR+fLeVCz+Zb5pIhlqfLSvr83Szom6j/K1nbdT2K2PSr3moxI+g5EBvyS1wp6lfEZwz/z7Kz8tDm3gg6ukMg3bXFEECpVsIfybZrk3PpSjPgZ8l2vl9V2Vf2wjwAlkMDtmwm/RWkzT/gmwJDNACbAetw/jZLU+nnBETefZAH6YERTt7YO5rFX35tBG6HLkK8nqetrmNqbsxbV8//IM8GWW5eeQHdi1scI/voOLUk+xZqSxhGCxTqV6AQB3qIuPwj2zrXE007aLO6wCKiAFg0qJkL0tdo20hTA=;
	25:GMdzrdp1iVXmqC3KAzVoZXce3tZZLt+S/WSCy5xCrmSGkFw9Dr/faAOlEGHANWQ69uyXHOVfubiK0AWOYNVIi3MmqouQiqWMR82UGXLZ+Por6Ehx2NasupFePcVun7Bf1c0NZWkBFdzuUipFfcaz21ZV5wOqEwcTIotiOLL5isG3T7zXmiaLLC/yvVeC6etcyq6iM/uNaAMhFC2jeB2RiUxbJG324/NxInsLuKnKKvC5gXXrng9/fFA2ZewlA4Lf9JLpK35bTzL/c6bMbTLBGC93DKBQZZj4tyafaTXAm6cKlnCVDpktargJGbilgy1ssPln9v8Qx6mfh4gQwLcnzg==
X-MS-TrafficTypeDiagnostic: BN3PR03MB1352:
X-LD-Processed: 710a03f5-10f6-4d38-9ff4-a80b81da590d,ExtAddr
X-Microsoft-Exchange-Diagnostics: 1; BN3PR03MB1352;
	31:yBD8zMZewUbry4GBzRUresoB3TaO8itJAs0zGSeZ24wYb1Gxi29WzEBpIU4dV5qfE/TGxAjTGhTwiA3wVaoyeQKriRInix3NrT95ZFsYNAqBHY0KKU3c3+YdyMxba64vxifHIxkkDRZ3yCuKJAXwiijiQJuAaUHeoFPmK+SOsyn8fssR370GBIUZ798XnsS8yvaMwQMkD8rkqPj47gp5zXaGKZMK/QT5hsY2d5M8iMI=;
	20:yZ23KD/4dkNolgPH8zecjrS7Z6lB5877JVvuUyQ2sc6YK81BUq3aaJtWL3s5SM9r7s6gYUPhYFeaVnTghsE/0hoF9GlD4wgG60Dfk5L8rsyS18wc5vwYEciW93iTh40AmlOBfuVXPS5+hiE49XIHpKN2JFn2Vm/Vq2gKRgjMIyw6i0wuIRy60aPYsZRghstVTzOmI/vuC1aB+t1MwWPdtDq6FdEu+3KLqzcPGSsewHOHaCJxCsAs9pBdsdx0Y2HJ1Qa7SBi18xOXMAIfw2hr/GIS6R/2hjquz2BpxtOwQQapKr1VQVwD10UelmFfxy1B7meURFr6pdW/Cxkj/FQf+QsJxHHTBFy6dpUF3846EmCGHRG0nxwfYPrT7bABpQpRdN4xfteK+CdEQJGsYaWK1mK7So3b/l+2bDVdNCEmPBlsz0okEcGnbcaLz7aO9lemRL/8RydXagdY88z6YxzRMYi04wgylXNl1uJajyqBhxad4FshDOFEV4p4zRHCCzgnKV2tEOEd8Wv2YzM/wCdGZe+1dnuo2wDx9A//NHCDjolQ8ett7ZmeHaLDkZe3At/uI8+jfFumVh5e4VlBh3kwxTyf6EQTgv1CQzevl0cE130=
X-Microsoft-Antispam-PRVS: <BN3PR03MB1352010021E23E5790BDB1D484E20@BN3PR03MB1352.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(185117386973197);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040501)(2401047)(5005006)(8121501046)(3231023)(2400081)(944501161)(93006095)(3002001)(10201501046)(6055026)(6041288)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061750153)(20161123562045)(20161123560045)(20161123564045)(20161123558120)(6072148)(201708071742011);
	SRVR:BN3PR03MB1352; BCL:0; PCL:0; RULEID:; SRVR:BN3PR03MB1352; 
X-Microsoft-Exchange-Diagnostics: 1; BN3PR03MB1352;
	4:cdEj7jpUJgJ4AE7O85OMIdTT1UgwtRPQPaDNIRhgvt2EN0l6t3ZTVPgnuv7wmVoxu/J0JVuAK5pAE/daj8Vb+v0tFLSfeanmS0T9igdMDjIFlL5Ma2Qc0lpYrE8Qg82OpL8WGj9X/PZF5Q7oO3JgtrN8eBoHtPlYF097wrIwNa+KHU8CqwGiEvWRchESuMD5cHGQK0lVe7vhJIGlOJc9exII+wAxmJLvKm/X1C/RPimhbrDPnnRr8j6DtNJ/e46FNWGGrFe92CYdPrkMjRrH0bcUvDZ3hJziLtwTWl8+0myTnIhylyHFg9NXq6IQdRdH
X-Forefront-PRVS: 056297E276
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BN3PR03MB1352;
	23:F2ydnJYFNpzDk+3SsnCHNxTXAFlxjT+dJImugq8kb?=
	=?us-ascii?Q?ZNeOfM4u5jSj7DQFnfdybQqFQ+ySk0lR/TU02GXbdGMRQsuo482rIo1vOL3m?=
	=?us-ascii?Q?z969Dxc7oH/8wEMSwp6LznupE1dNGJGNa43tVyqh04RcetfYULIrVXraGL7a?=
	=?us-ascii?Q?IvX+w3QZkERXZF8TsD776wpirNIaoXiYZrivPT1T5eMA7P7s+hxlFNHrnUw2?=
	=?us-ascii?Q?y5LIbR/sEGW4lxglMmbQQSfm1/Ozdxb6dRwVtOd0dtVhguRenpppUYmBeR0P?=
	=?us-ascii?Q?yE1NLwLlt6noim9D0VpzLy0Vfu/LN1V5m41hT6IswS7DUkI1sBfIm/fJWXtG?=
	=?us-ascii?Q?g/hORLr3/C6JOsyw9VniJkF5rV64lJAY1qNVfixkip0JVHh2NIW+DVa21LF7?=
	=?us-ascii?Q?/e4JOHpKojVJkprSkpZKcBp8R/E/vF1hrLvuXVZygkDFrtcO+TQvaYIBRELZ?=
	=?us-ascii?Q?oDj9qLYbWZO+YzGPVluAPEQTb+sLy24wzr7z7U6JtnNXqi4IhLFVSyq8nIN2?=
	=?us-ascii?Q?RkYuBRT79WSbN1cc8Ts7R3y5KXBzcOnoHsgOJHrzUw2musyp7ZC1vWFTAeHM?=
	=?us-ascii?Q?EQ1tKcyHrQtyj0o6djEowTTD8k0vU4AsD6CII0W+Lc+hxRMeyZsdec/5xdZb?=
	=?us-ascii?Q?Ng8xh/RM+14lvA0+KQ34Ihk0o1gOvne3VVv7rMnOPlhQQn7jajmKGs5wtxTD?=
	=?us-ascii?Q?IzMNw3qwFLgWSJ/sxAQP06Xfg9bueckByeUNoqDl4u792bX/gia4m3MPspf5?=
	=?us-ascii?Q?OEhnjbO6SawSilXB5oCm5sPLEdE4Lp9sM0sQyMqVRTMnDDU/SAvZa9beq2ZA?=
	=?us-ascii?Q?Ws/yBynxamIZkNs/ObYukJgT8bySY0njkx+LYQJeVTt3Jl/2h1oZhTSa+1mR?=
	=?us-ascii?Q?320xXz0otjNBHJm6JpxgBOimINjJPgWpLBXjG+3i1DJzB+KP44OB+W/yASuX?=
	=?us-ascii?Q?XhdmSpJzvTlbjNjn42CBiBe+nYODussdqMJMMgKFauZwogI77hMzCImELOIE?=
	=?us-ascii?Q?nqseoAE7ZAZY4GfLxZ60hzpMz19EgAJg2L8uqBiSC00akxWxPKM76zhnfRwp?=
	=?us-ascii?Q?PSCFt2do/QO6nYAn4sq039ElNOB?=
X-Microsoft-Exchange-Diagnostics: 1; BN3PR03MB1352;
	6:YS+yZk0atuYW4D3gTWbUSrKzAWT1cev0qcJEs/qQE2mgdP3RYAWqJRtUZbPu/vkwymZRxUw5pYIrcQKysca8+PbL1txojP/PXK5rYVrf/BgT0z7UpCt/3y7cynXwrgWPZIEV6f/l/5CH6v5QZL7QJ4Rdw3mEab47+RnMH8HYsYFqtKatT+GX4SRC+CFqccJeE8GbUOQUcf3QrhPc62/8Z5Rw28X2QSTr/+hPXBpqNHr+AEyCGFHIvn+bCSC2e7d2tBh7xYiuEP1KtL+eauL+fJsN0EVX56bj8BM2/g3m/NC557vMgX0qy2x6YyMngE+dIEw1hizpxW+aei2TD7vdt3C1wzzlyqpWfW0HZh3/mh8=;
	5:CoWd6jLMWpKz8EtWo4+W7uiT7SklRHZIQrIAAbRUJkcFJ+c1Piut1Zx/NUnvEaz6KSAD/yPxaokrqQAliGtNsz7jCQTHXi9HwgkN9HOorhlwnA7+l0AtB4b1ZCfUzLuYNRJzGz7mGXuJJlPYzdHF53Ei92174uBVytTIc3QvdiU=;
	24:HPc3sa2O7gdvNuel0v5/RAxAfBDhVJukd5Z6q3RCt9cCqlQfnnzP4jdmfbOcNtu1+lW4nkXyAfYwGXuJo2ai/b0Z/mWI/rpcd+ZLszycMXg=;
	7:Aio9KqiftE4aYESWmWtuWxYL/RN86/jxwbHW4QEt7dUtp2yqTuOOqnFt6mO7z1FbGSjOBc8016/tYb1FvFfNHXmci/NCc3lHnm1MTZq33spaL96RXNZltpgdLgqNoSWdBwRQTpwCBFGBWzBP3q54bIVRU4bT4VyOHuAiGfnypfkgYlTDtzAo5ndmD2oaDhwa+I8JrLoQBYd8cWZqBpbj6VKuvY2q87Dct767aWA25nCw8LDwTofhqNwBb6AtPlHx
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: freescale.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2018 06:53:22.4403 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a505727-f441-4b30-c045-08d562f728f5
X-MS-Exchange-CrossTenant-Id: 710a03f5-10f6-4d38-9ff4-a80b81da590d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=710a03f5-10f6-4d38-9ff4-a80b81da590d;
	Ip=[192.88.168.50]; Helo=[tx30smr01.am.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN3PR03MB1352
Cc: Chunrong Guo <chunrong.guo@nxp.com>
Subject: [meta-networking][PATCH] waf-cross-answers: Add cross-answers-aarch64_be.txt
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
X-List-Received-Date: Wed, 24 Jan 2018 08:26:23 -0000
Content-Type: text/plain

From: Chunrong Guo <chunrong.guo@nxp.com>

Build fails on "aarch64 bigendian" platforms due to missing cross-answers-aarch64_be.txt

Signed-off-by: Chunrong Guo <chunrong.guo@nxp.com>
---
 .../waf-cross-answers/cross-answers-aarch64_be.txt | 39 ++++++++++++++++++++++
 1 file changed, 39 insertions(+)
 create mode 100644 meta-networking/files/waf-cross-answers/cross-answers-aarch64_be.txt

diff --git a/meta-networking/files/waf-cross-answers/cross-answers-aarch64_be.txt b/meta-networking/files/waf-cross-answers/cross-answers-aarch64_be.txt
new file mode 100644
index 0000000..1023f6a
--- /dev/null
+++ b/meta-networking/files/waf-cross-answers/cross-answers-aarch64_be.txt
@@ -0,0 +1,39 @@
+Checking uname sysname type: "Linux"
+Checking uname version type: "# Wed May 20 10:34:39 UTC 2015"
+Checking simple C program: "hello world"
+rpath library support: OK
+-Wl,--version-script support: OK
+Checking getconf LFS_CFLAGS: NO
+Checking correct behavior of strtoll: NO
+Checking for working strptime: OK
+Checking for C99 vsnprintf: "1"
+Checking for HAVE_SHARED_MMAP: OK
+Checking for HAVE_MREMAP: OK
+Checking for HAVE_SECURE_MKSTEMP: OK
+Checking for HAVE_IFACE_GETIFADDRS: NO
+Checking for HAVE_IFACE_IFCONF: NO
+Checking for HAVE_IFACE_IFREQ: NO
+Checking for large file support without additional flags: OK
+Checking for HAVE_INCOHERENT_MMAP: NO
+Checking value of NSIG: "65"
+Checking value of _NSIG: "65"
+Checking value of SIGRTMAX: "64"
+Checking value of SIGRTMIN: "34"
+Checking whether the WRFILE -keytab is supported: OK
+Checking for kernel change notify support: OK
+Checking for Linux kernel oplocks: OK
+Checking for kernel share modes: OK
+Checking whether POSIX capabilities are available: OK
+Checking if can we convert from CP850 to UCS-2LE: OK
+Checking if can we convert from UTF-8 to UCS-2LE: OK
+vfs_fileid checking for statfs() and struct statfs.f_fsid: OK
+Checking whether we can use Linux thread-specific credentials: OK
+Checking whether fcntl locking is available: OK
+Checking for the maximum value of the 'time_t' type: OK
+Checking whether the realpath function allows a NULL argument: OK
+Checking for ftruncate extend: OK
+getcwd takes a NULL argument: OK
+Checking for small off_t: NO
+Checking whether blkcnt_t is 32 bit: NO
+Checking whether blkcnt_t is 64 bit: OK
+Checking whether fcntl lock supports open file description locks: OK
-- 
1.9.0


