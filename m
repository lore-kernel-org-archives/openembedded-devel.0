Return-Path: <prvs=72899bf67=Alistair.Francis@wdc.com>
X-Greylist: delayed 579 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 16 Jul 2018 22:46:55 UTC
Received: from esa1.hgst.iphmx.com (esa1.hgst.iphmx.com [68.232.141.245])
	by mail.openembedded.org (Postfix) with ESMTP id B528877A8F
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Jul 2018 22:46:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1531781217; x=1563317217;
	h=from:to:cc:subject:date:message-id:mime-version;
	bh=HlDw5zmhlzYOEfyFeHHopYtogntHFp1hdKdQUWLN9tc=;
	b=i0fO8d4GDWEeXrzrUlTkGrKbwM8zm3go1vT49NFs7gFvnwnOHl5QoJPO
	LzA2aHBtOHlabZ0zF5VJTlNKZ99gj+TA192UFBJWAv+Mp+z9nW1CAafF5
	7VFPRBWvqVMqwhIBzLia/vPEaYmPfUEUo3i5WtIpTd2+tR9TuzVeAYR2L
	vjUck9mGAPrcwjC32yROmzo26NV8TD+kHXfxiNewRkLLEkT+slVwurRJq
	EUqbpiAlOV0Dm4NuusWzSNoeC52/p/XMKRuaZm4dhck/zZ9P+FLPNWqKx
	yckQtEEs8KlhYAkjgPJYdZjJL6x6Mm0aqFYldTRwpNvIJ3t9bj3ObFoUQ w==;
X-IronPort-AV: E=Sophos;i="5.51,363,1526313600"; d="scan'208";a="187682800"
Received: from mail-bl2nam02lp0080.outbound.protection.outlook.com (HELO
	NAM02-BL2-obe.outbound.protection.outlook.com) ([207.46.163.80])
	by ob1.hgst.iphmx.com with ESMTP; 17 Jul 2018 06:37:15 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=7cB51c/kPvACPKVKFl3szb6ARHCxo1azQGYCgpYCJJ0=;
	b=eWf9EHT+Eb1NNkfp4RFKD14GrEQzD0VucN4sxmWGZaL3u1YqQ5P9wfH2tyMOZOOVte/rYhSn+6HEPgK1E5yqVgNwUITbRkkSVqnhP5NhypAG+Gsz45a/q0FfmPt/wDDINuk4r1RwJNmha2au/VWNm6f8k444p40g5swSus8D5sc=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
Received: from risc6-mainframe.int.fusionio.com (199.255.44.171) by
	MWHPR04MB0401.namprd04.prod.outlook.com (2603:10b6:300:70::18) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.952.18; Mon, 16 Jul 2018 22:37:13 +0000
From: Alistair Francis <alistair.francis@wdc.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 16 Jul 2018 15:37:03 -0700
Message-Id: <20180716223703.1588-1-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [199.255.44.171]
X-ClientProxiedBy: CO1PR15CA0074.namprd15.prod.outlook.com
	(2603:10b6:101:20::18) To MWHPR04MB0401.namprd04.prod.outlook.com
	(2603:10b6:300:70::18)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bf9ba073-d255-4a31-4f1d-08d5eb6cad59
X-MS-Office365-Filtering-HT: Tenant
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652040)(8989117)(5600053)(711020)(4534165)(4627221)(201703031133081)(201702281549075)(8990107)(48565401081)(2017052603328)(7153060)(7193020);
	SRVR:MWHPR04MB0401; 
X-Microsoft-Exchange-Diagnostics: 1; MWHPR04MB0401;
	3:y91UM1xNcHuhti4M+9Lu4eAO4HKc4N7XwG0OMCNk1MM44y7lHX2dzKz8ymH3KDt9sIWDWCJCXX6YR+NHM1HAWdXGBKcAsfEMixaC6m1fWdWLENKI3zuCx3C1PYs5r80ZAW640hJH7xwfYUaiHhUJ31Dfk9ya/DCozUm3KosuMxa3PWJUq+/OBZqe3+mJEAO6QAWIc/VwBpM/0qw9kf8gxGgkqKjl3WVDc4itP3K8ir0Mhs8U1T/pk7hRHRc+Rviw;
	25:p0FBos7ZTKdNz1hRdttEbTDLHFztRcJaNRtg144qi9vie5kUeaWKmTnbZKxyx5ajDiPD+G4NSmwHFAGeawWUPZd8620ebm4lMao7txn39isvojkdmGDkdDzqspyMHYU0JOOVcYLssNWQcmhdZ6LaVnCpVUETRhLP/F6iprLYmxwdYznm2bAhgyQ9W5iOgxGnutTsDZMPiDiKJ6YZ5gUVvjM9+n2/0nW7/TKlq4n3aQ9TxcfqSZqW2NEipd3YZ50k6WQcgtKxGrk24Zvq0gl5+3MZKK8t2v97m2n0NBxg44s1BbOIGjsS5v7Zy70ibH6b7PMzqIVEss3DpRXgolX/iQ==;
	31:mG7PIb0DK8HyrfXhudkKHPIFOp3ndaNenejWHFOue1DxclhSSOrBlT0FfrBwBvNfnb1VlsXjSJXQ5ZD+neWFpIz8z7Gu5lkzYqEepLoJeXgQ9jwOGQGhUUmIoNZffGg0DAPT2GM3Zoudn07K5NsZhxV6warsQCUiQBBuILIaOlocjg+gTAK5T09SGP+1fgvuzWN9EyjT3DfA9CNUJVJh7bRo4DO5njztlAvT5H29ZAg=
X-MS-TrafficTypeDiagnostic: MWHPR04MB0401:
WDCIPOUTBOUND: EOP-TRUE
X-Microsoft-Exchange-Diagnostics: 1; MWHPR04MB0401;
	20:I3eGKxBw2wl9FPdK+hnNfqWdTVRK2fsUMFooJzGI4hudNl22s3P4bzKFavkXeCUSVZJ6BHQEQT3rKd3O0qpjJoAsDMhgiO4OqCTRpvwOZSCEBge/p5IdjeJUA+v9xlT2dGteZwqtgvMgOYOi+36dRbfHnJsPkdz53Mw7s3DiGYdZDfjzI/cmYMx6r8m37XXTJHINtj75RyTmYsoSS7Glj/PYfAlD6dSEYKIuQAe8atHbeseze1cubCoFG9GHH3ir9awYOX8B0+nab389PMzOw2ednJwFec8kZ1GmLIicO3Xv662FPR018Mt8jSYkVOXzkxER9hwi5fn0q18helx1QprwCumyNX7mrofsk2SyCH81egNj7k7Z2PJyy2C9BfLI+3OSt7mHHOjcvQsBPI6tgJcPKNZqRPnOFxMJpcfT38IpsFLkqi8lYZJflAiGzQApXz6kJyDa3VX8KObjz2soUYThEAJNKDilsm7LRbG6imOH4wAIdR/wb2YDofBPiqlT;
	4:LQsogpeCxtkxcYBpeqo60SpuSQyznD7PeuyECqKAK4MEr/YzJD+KJpQ/ZDtlRL70vpO+frgbdHaTjYzTAmZ5YTPcjpKX/bTbPMlo54V9BF8xK/fNqXya088VYqVEd/ZxObNSs7ZAm0MGXpdhWQRt4JzaiHpqVEiRI6fW8LlaGMn4vU7AQjD40jMSypsVZQ1mK9mAg0VcJ859YUujBqF5ereFmTCV1DQXSyqDcEIZ+8ZA58oPlrFbxDQsrFd8LHPAPs6T+nU1d3eVudK9xms9K/uAHFZZNED90z19gxISPdbVnUnxNxl3+Inex7f6gXo48OIp/hnqF2DtDnPmm6wFlUYODNFJXDIgZDLKUaNK82R8jDGDDZYzbHjkuWB4D0la
X-Microsoft-Antispam-PRVS: <MWHPR04MB04013E0A8498BCE4ED4DC659905D0@MWHPR04MB0401.namprd04.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(166708455590820)(73538370219878)(84791874153150); 
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040522)(2401047)(5005006)(8121501046)(93006095)(93001095)(3231311)(2232096)(944501410)(52105095)(10201501046)(3002001)(6055026)(149027)(150027)(6041310)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123562045)(20161123560045)(20161123564045)(20161123558120)(6072148)(201708071742011)(7699016);
	SRVR:MWHPR04MB0401; BCL:0; PCL:0; RULEID:; SRVR:MWHPR04MB0401; 
X-Forefront-PRVS: 073515755F
X-Forefront-Antispam-Report: SFV:SPM;
	SFS:(10019020)(39860400002)(396003)(366004)(346002)(136003)(376002)(189003)(199004)(4326008)(50226002)(7736002)(6916009)(186003)(66066001)(68736007)(478600001)(51416003)(956004)(2616005)(305945005)(8676002)(81166006)(476003)(72206003)(2361001)(6666003)(48376002)(16526019)(8936002)(105586002)(6306002)(81156014)(1857600001)(6486002)(5660300001)(486006)(50466002)(44832011)(1076002)(6506007)(386003)(52116002)(36756003)(106356001)(6512007)(25786009)(26005)(53936002)(47776003)(14444005)(2906002)(6116002)(3846002)(16586007)(86362001)(97736004)(39060400002)(316002)(2351001)(59010400001);
	DIR:OUT; SFP:1501; SCL:5; SRVR:MWHPR04MB0401;
	H:risc6-mainframe.int.fusionio.com; FPR:; SPF:None; LANG:en;
	PTR:InfoNoRecords; MX:1; A:1; 
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; MWHPR04MB0401;
	23:dzorlxQ4rxtN72xc+GdBQJ+5jfB5L1o12Le+8ykIQ?=
	=?us-ascii?Q?+fAW9xHX3vuPPM+JGUtSCUuGiAYbaUYfD1HX5da9FXkZmeXBykr+XsbUWYx2?=
	=?us-ascii?Q?Q1AUjgC+qSCgL1K34Gr/2K6qHDlKkv0MMpAjix7D+F4FmPZ+Q0FeRlZZRSSV?=
	=?us-ascii?Q?l9F4I5Gsd984k4zLOe4ucs3O+2gfyW7n+3zHcGWiecYZD9sOX3bqPzgGeVZ+?=
	=?us-ascii?Q?aRQBN8wJ6zvAebp2IrUENolkaAD5rsANd5xm8HNCwssPrxhSkauNwnHCbeiX?=
	=?us-ascii?Q?IwqahdJg5lU/2M9fqEqs+FYsu2tNNDvsOlqbNDFJf4PUUM4UN/+CDhPGkSXq?=
	=?us-ascii?Q?UGeGgeWW2w+RWXFeJJvcNyf5BnkFUB7z6Pg6TGPnWay/RnyeZHEAEl6p00cu?=
	=?us-ascii?Q?IKCiVLA5r3H0Pf6kIlkJEqk/aueGmO4F/JodGbK7gfJsNYEtgmpCXAcxV7W3?=
	=?us-ascii?Q?DX1sSyqmTGMw/vPxU/AuCmFuneFoPvRO3qePGe5r/NXukb9RZbm1Mu42l5M7?=
	=?us-ascii?Q?3lqBCn5qXIQdkmpc0ebeMblkqDpVMWXD6pyr07I+o3PQsEgOOz4rLWTPm1HL?=
	=?us-ascii?Q?O/13bIBfCnnPIPe/f2UIR9yIi1oVhsV1p8v2SUOTgYH5vf6r6mXJv7U2eOd2?=
	=?us-ascii?Q?GsNZxu1H4u43CHwL8mDy0/yjlZ2HFQiQTkLcvWTbAkfj3PNLBeT42PN1xu2e?=
	=?us-ascii?Q?4rGoj7UlStPze4sUArbzIwz5byTnuk8ZPXTBSzkzt3WupInvQPJVYJJ3emI5?=
	=?us-ascii?Q?lutX+MzuziV2lYpAO5mOTQ2ia0FDrUtv54rcz3tU2Oss8Di4Y89u8QsB8kfA?=
	=?us-ascii?Q?rFwl1M6HIklGR5jABENh/Ur5UF4qYkJfmZepJkNDcAxxxrrGVw4PfSmKbDHT?=
	=?us-ascii?Q?qLGpmB8Jck49AEU86eGpjDRPVM/S/uyfT8TeQWADyrE1hLAgjETm/+ihMrjK?=
	=?us-ascii?Q?YE/wRcT9T/Y4Us85ZLQXrWSFcNFSt57GC8RZmrXh/n+TWkuMOWvIAsdYErU8?=
	=?us-ascii?Q?d9nEJH1wzDXjHxOmi9jH848rb7vP2HA8ppOKLI47CL37b9MmoA8erlkmBNDT?=
	=?us-ascii?Q?GB9DELT/T5yyQpEr9Fq4J8sw79aonjLrgmLMPQ7kxdrkbey9Q5vuPG7X4T5/?=
	=?us-ascii?Q?vpZjSr8cd1LmypW2L4YGD4CZvP3ET+woH36RsnZfRbJeOY0wh2F4InFmCQL0?=
	=?us-ascii?Q?fIFW7lrVe7h4sJuvA89kqqBXaN4p9OwV2Vu6MZk38k5Z2hMnKnRSkFZ5QuQ4?=
	=?us-ascii?Q?8rynht2s9pVEnHszX30nC6Ht3ahy8ib+e+K6bZMou3ELMGBsIQkFYzEkzTnM?=
	=?us-ascii?Q?V+m+3lqsqKflp7MczU2FQ5/tIzNubwjabbXEWwLMgbNuUtff0NrW1QADD7LI?=
	=?us-ascii?Q?9Q+Pw=3D=3D?=
X-Microsoft-Antispam-Message-Info: OGmDIdjeoTFptE+m4epURFoQo7p6tfSy5QdJqBIvDhH+rEL3kO7R6c37rc51QKdyNt7DTkslykSefTPaeg1wB+4dC1YMWS7lSjh/9X5ayJO08uNfp9YFrvWBetTFb8SRZWxmCXY1XuSyo5FwarCrSgYOQ7qh8JuRIA/xc5j22t6kECi3S6Ylj7CCHtokz+vSG8K/PNRmfdxLcJwI9Q3on0QpFSkFLUBGp0SwnerBMdBXRB0aB+pKUme88zq9lu36xN8RnuLbq4G6boKmL1OXz+QRL0coEdFkAlKjbh2Bzxh14fn7AETAkZwJ5Z7C5zps1kooMLUVZW0D7EdrnGlp31tV82yNDJvrlosb2uEy+Om4pXBziwHahW3CAQFAKNC4CRtEz2EksrIgNc7q1fEn7itXzk7x+uXtSyDYBAyzzgCG4ch/yIhB6ebjrZ2ufUSoj73/ZMpfu8IZIUE+hqWoBatXtbM6j3sk2jNRhcc6yHybpyJki7Uj81BGy4IypzIL72jGFuPhz9uh4NyW1V89gUO6WjsVf44j2FRaSEvivOL/kWh6ggrINp7a7iMzeh/YjGKUrMmxYUEfJ2tQEaPyzaMvGxtpT5nuRRkj3twHEd/7NOwW30ldViH/FTFW99ocSmyADXlm6Y4GALs1IgIso+elOrzTlz9VMi5PymrXSRsTLkf1+fTojsXsJlBf6eoHP8O+QT0dfV7lZBAzFOBOeA==
X-Microsoft-Exchange-Diagnostics: 1; MWHPR04MB0401;
	6:BaE8R4ls7yd2pUerXalE2aRoyk1EsnU6s/d/Z0t3tS1drjzU0zFpOVXX7nEyWpnOZuQcwZvjd9AdUhmrrcXkuupyzhtTUpiRFEwtqVvDZgt3RlKfvdXLKQr629XaDJjdtOgjOxYm+z/1FBRtEy2OWDh8+s9mCGEfYJ45bwsbE1tpKnsbjzWgzDNLsYvwd5QXPSqefMSTWuuJnNGP2hBGz7wi47aYpu1WsYMRxEQgUc2ZRAs/Xn4I86fpC+M3zlSexIxlaUdNhzVJYy6isXVGsCnlgPjFBkkUxADCinBg88LYOgWdi+e+z/Db5XV1P+urQU++6WGYw+xEiUWt9Q1R4oCQBpVdTXjPjohrLPd0tWz5h27iJrcHqHDq9SJNfehd3rlEgHxqGxEaBq93SwrvrUG9CyalEBu1sGWyp8o+uddupO6zHVn4KVwFiphWqHMJFOPnZlOnanMGyE/pv5DMcmCnom00iExSBQ8+tSC+Zg3c1nVGa0SsslC9a0K6YIBw;
	5:zE+iqsqEPl+IMe+oI0rwYtJxuTddf6ncNq4QbJqX9I60fq4PwIVNiDkrBCBdp0ciWACsUGPR5bj7H/X1jBNRETTF1uOmAqk0I1cTLx8gOvecYVh48wEuSNt5TRMvh4MMXg0v72BrEgevUeNeX1TaTTGNg819U1k7sSWVHtT25+o=;
	24:7qmndXCgiTe7CzRYDkWzTQ3XTkxEhmKvbn8019M9/+ri3+kXCgISGa0a1BJ3XynL6XXOS5/LTr1+bjQvjy9CxQ==
SpamDiagnosticOutput: 1:22
X-Microsoft-Exchange-Diagnostics: 1; MWHPR04MB0401;
	7:naSBHayQgg2wmWFeCinmPruhjjghYPLHEQNSIjaWtF0j/prdpTiPBdoScCgv9YkQCfLONvTS+z0AwDjuLn3SwkjQ97/y83DnNwxpVSsk5ik5R19onqytk1s8V929APWp0CSH4BrmcF9NALB+kqVsSEAvSiUPIH79ODhp8RZdYg4eSA3GUqlns11TaEku/+tDtjWUSJ5tq32t6WCwl2LpQAfcA5XJNT8nMWSc8RBYd8lA7xeYUqCEyVWjNo8EvDM4;
	20:Pzxxl8v/M/YU3A9JhhlOpWZKcZ1Ty/fWLml/M35cmOfNDHWB+gp3fbuBN55TsG2PsQVr88Yw5nKTErePj+byYqdge5ngebxwl0q7IZtzA5NmvT1c8nK5mL0Kn+dWnqJ/b2IMloqrQDmlWnGETgA9frevTNMuKMEHKO/SNFOrYPo=
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2018 22:37:13.8318 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bf9ba073-d255-4a31-4f1d-08d5eb6cad59
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR04MB0401
Cc: megha.dey@linux.intel.com, ricardo.neri-calderon@linux.intel.com
Subject: [meta-oe][PATCH] ndctl: Add the NDCTL package
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
X-List-Received-Date: Mon, 16 Jul 2018 22:46:55 -0000
Content-Type: text/plain

Add the NDCTL package (the libnvdimm utility library). This is based
on the work from the meta-luv layer with a version bump.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 meta-oe/recipes-core/ndctl/ndctl_git.bb | 34 +++++++++++++++++++++++++
 1 file changed, 34 insertions(+)
 create mode 100644 meta-oe/recipes-core/ndctl/ndctl_git.bb

diff --git a/meta-oe/recipes-core/ndctl/ndctl_git.bb b/meta-oe/recipes-core/ndctl/ndctl_git.bb
new file mode 100644
index 000000000..3bf54e74b
--- /dev/null
+++ b/meta-oe/recipes-core/ndctl/ndctl_git.bb
@@ -0,0 +1,34 @@
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
+do_install_append() {
+        install -d ${D}${bindir}
+        install -m 755 ${WORKDIR}/ndctl_runner ${D}${bindir}
+}
+
+COMPATIBLE_HOST='(x86_64).*'
+
+FILES_${PN} += "/usr/share/bash-completion/completions/ndctl"
-- 
2.17.1


