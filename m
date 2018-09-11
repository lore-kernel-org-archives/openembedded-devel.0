Return-Path: <prvs=78587917d=Alistair.Francis@wdc.com>
Received: from esa2.hgst.iphmx.com (esa2.hgst.iphmx.com [68.232.143.124])
	by mail.openembedded.org (Postfix) with ESMTP id B532C79813
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Sep 2018 00:10:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1536624661; x=1568160661;
	h=from:to:cc:subject:date:message-id:mime-version;
	bh=Er9ZB19oFx2PWec6ajl9QuLWTuGgQPFIdw5WJuE438U=;
	b=gxu3m7p5XKQntDqTXK1PqNT+7V5BSKzYa+gkbPs2x58+IGqVpxxxg0CK
	Ue7+WRarBMXmkvQGhoQjULpn/xUSGTs72hYlU4FS0ulBqKppJAPO3StBt
	Ih49xZOkNvU57rRpg8gTVSOo3KOscS7uBc4DbR44aB81bw1PvxAEexqIM
	AzN0F1Zw7szX17NkigmZnbJb8PxvUt5lc9V7naTru/vkcvG6rAJQ7kEWh
	i12AZ/6ZMxCBCh3Rw1yxTODlehOen9EEF/kv2u6ydoyyiH/qI5ugyJ+aw
	dDpTRSRMZkU8jsziVH+e/y/BQwIk1EQRb5WYwYTMLpmVIeSyoJTY12y5r Q==;
X-IronPort-AV: E=Sophos;i="5.53,357,1531756800"; d="scan'208";a="187002282"
Received: from mail-co1nam04lp0050.outbound.protection.outlook.com (HELO
	NAM04-CO1-obe.outbound.protection.outlook.com) ([216.32.181.50])
	by ob1.hgst.iphmx.com with ESMTP; 11 Sep 2018 08:11:01 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=Y5tXaycZEzpf0rtxSn993LzHToTSeQjyuhAMJ+PYrM8=;
	b=El+HbN/oLdwUWib0jWc0Tw3SM7xHkG0/HjK9txQE/KPSanv0/XqzXKggfHxcaSqxi3+fP20CvL8h0mOQPuzmEl/E++KO8g5LLKIPy7607eAc+2pl82xIGXMP6ZhArlFy/AwtthAbCwfF87xkepIYgERU91NzbRmnbUun5t5JzlE=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
Received: from risc6-mainframe.int.fusionio.com (199.255.44.250) by
	BN6PR04MB0389.namprd04.prod.outlook.com (2603:10b6:404:91::18) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1122.17; Tue, 11 Sep 2018 00:10:58 +0000
From: Alistair Francis <alistair.francis@wdc.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 10 Sep 2018 17:10:47 -0700
Message-Id: <20180911001047.28826-1-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [199.255.44.250]
X-ClientProxiedBy: BYAPR05CA0019.namprd05.prod.outlook.com
	(2603:10b6:a03:c0::32) To BN6PR04MB0389.namprd04.prod.outlook.com
	(2603:10b6:404:91::18)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 842b305e-9903-493c-14e3-08d6177b0ced
X-MS-Office365-Filtering-HT: Tenant
X-Microsoft-Antispam: BCL:0; PCL:0;
	RULEID:(7020095)(4652040)(8989137)(4534165)(4627221)(201703031133081)(201702281549075)(8990107)(5600074)(711020)(4618075)(2017052603328)(7153060)(7193020);
	SRVR:BN6PR04MB0389; 
X-Microsoft-Exchange-Diagnostics: 1; BN6PR04MB0389;
	3:oImRq/wtPAGrUbtxfiuM2aEF7Uh4OrNKmK6Mk1QYgLYKPSKCHSa/woCyAhv73+kyKxSxIjT0m5QIb++nVtEYYlaQcrUpX51TA1PqhvBLJxRVMUshnmTmx2MHkT6LzeRR8qKUE4piZHbcnp9c/pMEy6CA8KuRkkM9sNNq2lvIuA/yvLsdYUFvdunWMokU0OXf2RLbwNseLnIxHZ2Wr/fnAV3SbzIxXUrtFuofJwPXLeg4CKBieEyyHiMbKxH5g9n+;
	25:GzkY47zae8jHvgI9l+ZWYroh3OWYhmdfWN89mvj2cM9V3yMpam6/0yp3WOenHYran7PXQX7chei4J9frDqjLVUwAQBVQ+yiCrPp3ulsPMhijClTBMVjOVySDcHEi6g1G9IgeaPlM1vemCn1uMS4ERTpgmUVRlhVdWV/EyzUNxSeqdj4EdUEo+rNgE6x6c3ea71Qc6r8ZMH1pbx5Sm2efq1LjBj27qcRxQURazUdH6Ry7xEd94mP3fmn8Z0GWjGF0rZ0Bx1XENm/7vgLmf6I49FyVx0vQ6EBNQVRU7DPyKxBd/uS+M37yc5H0uhzCr6j5pCgKkY9KpR3Yp2mT1B7Iww==;
	31:rEja5s7uQfVkot75r9ykKdAUsLfVi279KKOj6iFf+Nilu1GtG3Zo1+Pb8kgeGyPPdCCMUOTm6o07SFqEb7peGQNm+t1d8kyBSB2plqEry5Rpw7Qxa4wafmQ4TjChZ7OQOJjoLynCvaBkDmynepVpItSuZyDv7umM6wvkgJNLn7Pf/A3y1RteZ31WM1cf4hGdR3JJIw/qJz5gVOfA+WbsdEIWu7cS+FXCOPaR59STA4I=
X-MS-TrafficTypeDiagnostic: BN6PR04MB0389:
WDCIPOUTBOUND: EOP-TRUE
X-Microsoft-Exchange-Diagnostics: 1; BN6PR04MB0389;
	20:/C1CDUxaHcb3p9O+wZVK9Ows9h7HKur+QW9TrcOkROyVS/vWCss82yd5PyZypTuBiux7PkMVtN6krOHMIxGtWEJvNhxkhAkuAlrZQLAcjrywd4g/BZZD+3bYPx2Ixs4c39r+lMWPb98fjRnFxwJsUonfVyG1jtdXIJE79t1d4dbmScQO4AdnJg5NyVpgyzHlAbRnLr09zWJEujQRc1iTCxMojSHwI0Msd1tPlPjzJZYO82mpsMKr4eHgqaQ7SLguNZFl4EfOoAYLjGuZ1QJYHH7nrVRRNYsV5bdhJGMUg3BURxpwvpmntx2xHd/JZxiYyqE7RYtJJMW6ePOsdihpp6WNfue08IEJ02LHLPCh/YNATLp064afiNtUIXZj/r12oV2rcxXJJwDQ7EuDOn3WFMs0wUuMyWkvQqMVnZir3GQ+i4o3NqfzwvX3TcAsVge8NjKEDDWc9vwXA4hd47+Rex3oAx1Tm2t1wOrZCYsHh/o/yiEQ4EN4XSorK8P7CIYC;
	4:vA4v2pM3kv4s6RH2KOR+Jb+7VGfXgs4KgYJlJyW3Q7bjc6f7iOmCGXax6wPh3s51zzWTlxaP61OZ8jpkPQ2wTMJD/STdYJvXrT1LmKPKhg1WuNs/hy+nFCnBWa7qa9Wh35CoG4sCopYNYv2zpH2D2piInws/RAWm18jvgYCXXQNfadWoyD81VaAWFavr2UUgMzWt9hTNVeE439ywT5SBIkd6BBP0UK9MNbzPpQRrbXr8FFg4pvFrlafrRCOPxTpzuol5td7e6WpbNFSKBxZLPfOWED7yMkpW1h2uSBjM++gmUeahN33AhFmdkOsswD5i
X-Microsoft-Antispam-PRVS: <BN6PR04MB038952ADF812C7ED1FD8092D90040@BN6PR04MB0389.namprd04.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(166708455590820);
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(93006095)(93001095)(3231311)(944501410)(52105095)(10201501046)(3002001)(6055026)(149027)(150027)(6041310)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123560045)(20161123564045)(20161123562045)(20161123558120)(201708071742011)(7699050);
	SRVR:BN6PR04MB0389; BCL:0; PCL:0; RULEID:; SRVR:BN6PR04MB0389; 
X-Forefront-PRVS: 0792DBEAD0
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(376002)(346002)(396003)(136003)(39860400002)(366004)(189003)(199004)(66066001)(6666003)(2361001)(6306002)(48376002)(3846002)(8936002)(2906002)(50466002)(47776003)(6116002)(8676002)(50226002)(486006)(575784001)(2616005)(72206003)(45954006)(1076002)(6512007)(956004)(86362001)(25786009)(6916009)(14444005)(6486002)(53936002)(5660300001)(7736002)(105586002)(2351001)(106356001)(476003)(305945005)(6506007)(186003)(16526019)(97736004)(68736007)(316002)(36756003)(44832011)(19627235002)(478600001)(53386004)(26005)(81166006)(81156014)(52116002)(51416003)(39060400002)(4326008)(16586007)(386003);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BN6PR04MB0389;
	H:risc6-mainframe.int.fusionio.com; FPR:; SPF:None; LANG:en;
	PTR:InfoNoRecords; MX:1; A:1; 
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BN6PR04MB0389;
	23:9btS6SjGZhvn6oUwtWUVqKhS8sB96yz0ya99PzT+H?=
	=?us-ascii?Q?iqXsBexmOQhf9RAC5F42kSVLdmNAreNMuvj94oz7JeixfiENzIF+fl9vobBB?=
	=?us-ascii?Q?4EyS3VgYItshheGw47THKCJBJi2i/fdaV0c29vfqlUBWhCBjT3jMhed/kBC6?=
	=?us-ascii?Q?vx2CCjgWlB/AUEqWMrliAioPr7pFU5Ub/eJP1TYRsvUdMnq2oJQOLBvO66Be?=
	=?us-ascii?Q?EXZMSjfQgdOiJa4ehE5Gq/6zLWcx2VNW2qIdY47qZGyTamDOKJjNpm3xS5KN?=
	=?us-ascii?Q?R/4sDTdlgqcdS0A3ELRWe7wOdTqLwJ0p7GtbQqKfIrT5lyUW2l3lpkANuFqe?=
	=?us-ascii?Q?u+HGwtTcbBG4wnFzmtTWEcmzjai83hPiOkyUMyDeKTsB32IjD8bfgOakwNvB?=
	=?us-ascii?Q?RFq6ARL899O063rh01H+WiNNfDVyjSNia+RNI9AlRVqg3yXtb1FWI3X3lyDz?=
	=?us-ascii?Q?4VE8+mL9Y2oE5S0fXkUZfqPEoEIKY0ATr1gye2raH4h27UW+dI70A9YRNIS+?=
	=?us-ascii?Q?EHPbYqXvJV9u+G75X2M9uM9fgtGnpzTKiXHWTzog/iwhQs9gaGHisl64r8i1?=
	=?us-ascii?Q?IXla9JW7MegK5vP428KcIzXJs9p/2uypPt59nNv0jdRsPyRj4o/C/ZUEsL+o?=
	=?us-ascii?Q?8F3U8PuDYqb7s/SQo+ZkE4wTo9DPASPtPQunDYbIK6VNuYJk58JkduQ8Ir/n?=
	=?us-ascii?Q?BR09EEM1BEMQWWKcNS/yZ8f3jkxyUE73AjUy/M3S1JsuvjU8xJAXtwRqQewD?=
	=?us-ascii?Q?Nc/1DYEWzgVZbWkKSXTWxF2by5s20EAbHcdUopa721ywnHTTedDttOOhgNIE?=
	=?us-ascii?Q?yRAAU2wbBODaeLTlKz0UEwLpheGL+GZSMFGnbNXrwzb5Tgs+aXOF0kriMjX3?=
	=?us-ascii?Q?6/NKY0sUCD8XBswnRkBuLRLCDI+CGSw9P9iRDBwf/dA7zqv6sSnXM+woLpYF?=
	=?us-ascii?Q?cMLu1msAdu1rYIT8v+JCGIt7XqKLC61rBFpvw4T15GXHLl10H1RJOSOaNj/c?=
	=?us-ascii?Q?EijWLduanYf5LQXR7w6fLgsJJy8MNuKuYJKkQg/NEzRuvWQk/fkgaipoNCAI?=
	=?us-ascii?Q?tG5MmaupNOEcHgGwSnkKCXR4PrlW/3v8LzBQR+LscRWy8Fhgk87huYvpvXRu?=
	=?us-ascii?Q?eElUPtVKi3nSPZSIXLFwGxvxtQCg9vKZiUBxNTwJiN7iYBYxLPXAvf67wKGG?=
	=?us-ascii?Q?lHfEOqOwvaTMKXZTcT76ezYa2u3/XvyP4+yUQC9UFLTc7M704vA0gjHGKbbe?=
	=?us-ascii?Q?57ACZoIPhOLQAp8PCvJWSbMq8CszwVHG5awFf3hoVJ88tHIlhiEodPWKeqDo?=
	=?us-ascii?Q?PhSzcgGPu9q43hvvrXBT5THFiLzedoSuUrYoBSRX5qK2/zERvEKKXMDqsUI0?=
	=?us-ascii?Q?WXQ4q/QxVqcGpRJf0pP3V4GCn8=3D?=
X-Microsoft-Antispam-Message-Info: pQozOE2LVo25Gww126xQFG/UvBGg8KeEr8kjdIWJ6sV5ApVqmQMx/oWr5iVOhyxxK0izYpiizHQl0nftxVktDh3STMeLmVjdQ6q70E27+0Vn6AhQ7azBfKU2y5HmOhCgHal7+c3wtfz/clrowwcpPWNCI4rvIsIRu4y4xHhy38OJTbD31EybSR6/WdQ6FtnQ52oTCMsOxbI1IPmYQqzHXcpyvHMLw8tkMBJwbYQVDh+9F07afTSjbNHrQeBUoZjE5Oqw40Meamj9idXi9vJ4X1DepVYrSXn1KrDPrHLgWURntbeb77Qc8s+2ek++77hMfPUZsP9xkyhWT0C47tCYKCM9tlgZxaav4JawznyAHa0=
X-Microsoft-Exchange-Diagnostics: 1; BN6PR04MB0389;
	6:R3IQ0xypXuHTo9h+wzUeOlHIXIdWZUeuFjvjbSaNn5VVZFGMnpcmX4GLpB6d+dtMIJhmI/e9RqU6jWuI5fMn5vHTs5h0PKGzjSi+acoQXn63JZOa/YDZi1EFq9aYV9hHpjL8fMNqZnWvGsFrwDpvzASc9OCEpm1OV8fRrTeurfozrCyn9pX48fTREYR7QUBU6TRqC7QHENNPgv1OBvNff44KpDqwCIhh8NrrR1a2XnSKc2O460ug0JFNevCWe/yT5LXA0LjNer+bVJEiGEPVqsHDotWM/CHkmlov+F7sQsZz9u7NAe/QMhdmq4C/Vp0OPYXqqcayKaKUhTmRembFct20v7y2KkCq446IbLaTeH6tmFTfKO6b5dlGX0GmyR/doxzWfUMjLSDl4AKjjOO7kdoAQMEm/BTuRsfSwB/OzhKnn0OTQ3Yk0qMrCIphm1uNbXz36ExfPVDCT0T0pMgFcw==;
	5:9mR7hfG1qUa4nHkK92qVLMh+C/TVYqGcgqaPMc22DrV0iQ/Qq/KNxwVCy+R16vvkZFDrIlaMQX6m4xDTnUUiIocY+Y8ehUVMBj7baYD9yjskMtozj6NXGzXajcn2KpWD0VnpodI2HF9/ikS6eRnYeHMfmovC6XZfyZhVzbI+7UA=;
	7:+FE+yp09eiJdvDr+ZU3R/ChU8BSa+Q9CeQ2s9pNec+PwKDtSQ3EDmZrSBFuyWyxxyWBSp27xC1Ibpqn9qM2IaIFi9EC7N6zBLH4U04yszasLFezXDKY5+CnCFCHAx5oA+z5ErREct2EVhsO9xHpR0u5cLs/55bq58BzP8nH2XYmjbcnzPlcvAC5tKs348hqLQN6YigFuEDpGSqa0gJBvzZvix2pZcdIvEZVMgzbqeHlT1JL6ElFAYxLnq5Qv46uR
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2018 00:10:58.1611 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 842b305e-9903-493c-14e3-08d6177b0ced
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR04MB0389
Subject: [PATCH v5] pmdk: Initial commit of the PMDK SDK
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
X-List-Received-Date: Tue, 11 Sep 2018 00:11:00 -0000
Content-Type: text/plain

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
v5:
 - Fix non musl build
v4:
 - Update to 1.4.2
 - Fix musl build failure
v3:
 - Add missing patch file
 - Use SELECTED_OPTIMIZATION
v2:
 - Fix fortify source compile error

 ...c.cfg-Specify-the-host-when-building.patch | 29 +++++++++
 ...0002-Makefile-Don-t-install-the-docs.patch | 26 ++++++++
 ...03-Makefile-Don-t-build-the-examples.patch | 34 ++++++++++
 ...y-implement-secure_getenv-if-require.patch | 30 +++++++++
 ...ol-Remove-unused-__USE_UNIX98-define.patch | 30 +++++++++
 ...inc-Allow-extra-libs-to-be-specified.patch | 29 +++++++++
 meta-oe/recipes-extended/pmdk/pmdk_1.4.2.bb   | 62 +++++++++++++++++++
 7 files changed, 240 insertions(+)
 create mode 100644 meta-oe/recipes-extended/pmdk/files/0001-jemalloc-jemalloc.cfg-Specify-the-host-when-building.patch
 create mode 100644 meta-oe/recipes-extended/pmdk/files/0002-Makefile-Don-t-install-the-docs.patch
 create mode 100644 meta-oe/recipes-extended/pmdk/files/0003-Makefile-Don-t-build-the-examples.patch
 create mode 100644 meta-oe/recipes-extended/pmdk/files/0004-os_posix-Manually-implement-secure_getenv-if-require.patch
 create mode 100644 meta-oe/recipes-extended/pmdk/files/0005-pmempool-Remove-unused-__USE_UNIX98-define.patch
 create mode 100644 meta-oe/recipes-extended/pmdk/files/0006-Makefile.inc-Allow-extra-libs-to-be-specified.patch
 create mode 100644 meta-oe/recipes-extended/pmdk/pmdk_1.4.2.bb

diff --git a/meta-oe/recipes-extended/pmdk/files/0001-jemalloc-jemalloc.cfg-Specify-the-host-when-building.patch b/meta-oe/recipes-extended/pmdk/files/0001-jemalloc-jemalloc.cfg-Specify-the-host-when-building.patch
new file mode 100644
index 000000000..747538b0c
--- /dev/null
+++ b/meta-oe/recipes-extended/pmdk/files/0001-jemalloc-jemalloc.cfg-Specify-the-host-when-building.patch
@@ -0,0 +1,29 @@
+From 2a22dc96c3bbb5c9bbcc008f58d4f5c64e3d19e6 Mon Sep 17 00:00:00 2001
+From: Alistair Francis <alistair.francis@wdc.com>
+Date: Mon, 23 Jul 2018 11:23:39 -0700
+Subject: [PATCH] jemalloc/jemalloc.cfg: Specify the host when building
+ jemalloc
+
+To avoid this error:
+    configure: error: cannot run C compiled programs.
+    If you meant to cross compile, use `--host'.
+when cross compiling specify the host when configuring jemalloc.
+
+Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
+Upstream-Status: Inappropriate [configuration]
+---
+ src/jemalloc/jemalloc.cfg | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/jemalloc/jemalloc.cfg b/src/jemalloc/jemalloc.cfg
+index 196129de6..79ebbab1c 100644
+--- a/src/jemalloc/jemalloc.cfg
++++ b/src/jemalloc/jemalloc.cfg
+@@ -3,3 +3,4 @@
+ --with-private-namespace=je_vmem_
+ --disable-xmalloc
+ --disable-munmap
++--host=${HOST_SYS}
+-- 
+2.17.1
+
diff --git a/meta-oe/recipes-extended/pmdk/files/0002-Makefile-Don-t-install-the-docs.patch b/meta-oe/recipes-extended/pmdk/files/0002-Makefile-Don-t-install-the-docs.patch
new file mode 100644
index 000000000..bd1b97c24
--- /dev/null
+++ b/meta-oe/recipes-extended/pmdk/files/0002-Makefile-Don-t-install-the-docs.patch
@@ -0,0 +1,26 @@
+From 460a96e390cb80278784cfe36629e280fe7ffef7 Mon Sep 17 00:00:00 2001
+From: Alistair Francis <alistair.francis@wdc.com>
+Date: Mon, 23 Jul 2018 11:31:17 -0700
+Subject: [PATCH 2/2] Makefile: Don't install the docs
+
+Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
+Upstream-Status: Inappropriate [disable feature]
+---
+ Makefile | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/Makefile b/Makefile
+index 224a315f6..ce7f84afb 100644
+--- a/Makefile
++++ b/Makefile
+@@ -144,7 +144,6 @@ rpm dpkg: pkg-clean source
+ 
+ install uninstall:
+ 	$(MAKE) -C src $@
+-	$(MAKE) -C doc $@
+ 
+ .PHONY: all clean clobber test check cstyle check-license install uninstall\
+ 	source rpm dpkg pkg-clean pcheck check-remote format doc $(SUBDIRS)
+-- 
+2.17.1
+
diff --git a/meta-oe/recipes-extended/pmdk/files/0003-Makefile-Don-t-build-the-examples.patch b/meta-oe/recipes-extended/pmdk/files/0003-Makefile-Don-t-build-the-examples.patch
new file mode 100644
index 000000000..f75d94197
--- /dev/null
+++ b/meta-oe/recipes-extended/pmdk/files/0003-Makefile-Don-t-build-the-examples.patch
@@ -0,0 +1,34 @@
+From a7f07dca2468ea226d2f07fc0105166e75cadaf8 Mon Sep 17 00:00:00 2001
+From: Alistair Francis <alistair.francis@wdc.com>
+Date: Thu, 6 Sep 2018 16:18:50 -0700
+Subject: [PATCH] Makefile: Don't build the examples
+
+Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
+Upstream-Status: Inappropriate [disable feature]
+---
+ src/Makefile | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/Makefile b/src/Makefile
+index 4b50dd8b5..e00501e31 100644
+--- a/src/Makefile
++++ b/src/Makefile
+@@ -38,13 +38,13 @@ include $(TOP)/src/version.inc
+ 
+ TARGETS = libpmem libvmem libpmemblk libpmemlog libpmemobj libpmempool\
+ 		  libpmemcto libvmmalloc tools
+-ALL_TARGETS = $(TARGETS) common librpmem examples benchmarks
++ALL_TARGETS = $(TARGETS) common librpmem benchmarks
+ 
+ SCOPE_DIRS = $(TARGETS) common librpmem rpmem_common
+ 
+ DEBUG_RELEASE_TARGETS = common libpmem libvmem libpmemblk libpmemlog libpmemobj\
+ 	libpmempool libvmmalloc librpmem libpmemcto
+-RELEASE_TARGETS = tools examples benchmarks
++RELEASE_TARGETS = tools benchmarks
+ 
+ CLEAN_NO_JE_TARGETS = $(ALL_TARGETS) rpmem_common test
+ CLEAN_TARGETS = $(CLEAN_NO_JE_TARGETS) jemalloc
+-- 
+2.17.1
+
diff --git a/meta-oe/recipes-extended/pmdk/files/0004-os_posix-Manually-implement-secure_getenv-if-require.patch b/meta-oe/recipes-extended/pmdk/files/0004-os_posix-Manually-implement-secure_getenv-if-require.patch
new file mode 100644
index 000000000..624f17bd4
--- /dev/null
+++ b/meta-oe/recipes-extended/pmdk/files/0004-os_posix-Manually-implement-secure_getenv-if-require.patch
@@ -0,0 +1,30 @@
+From 33affa9ee97691efb73f439fcdba4adb8625a26a Mon Sep 17 00:00:00 2001
+From: Alistair Francis <alistair.francis@wdc.com>
+Date: Mon, 10 Sep 2018 12:59:48 -0700
+Subject: [PATCH] os_posix: Manually implement secure_getenv() if required
+
+Manually implement the secure_getenv() if we need to, this is required
+if using musl.
+
+Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
+Upstream-Status: Pending
+---
+ src/common/os_posix.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/common/os_posix.c b/src/common/os_posix.c
+index 2d70a0a29..fb09b6ce0 100644
+--- a/src/common/os_posix.c
++++ b/src/common/os_posix.c
+@@ -261,7 +261,7 @@ os_setenv(const char *name, const char *value, int overwrite)
+ /*
+  * secure_getenv -- provide GNU secure_getenv for FreeBSD
+  */
+-#ifdef __FreeBSD__
++#if defined(__FreeBSD__) || !HAVE___SECURE_GETENV
+ static char *
+ secure_getenv(const char *name)
+ {
+-- 
+2.17.1
+
diff --git a/meta-oe/recipes-extended/pmdk/files/0005-pmempool-Remove-unused-__USE_UNIX98-define.patch b/meta-oe/recipes-extended/pmdk/files/0005-pmempool-Remove-unused-__USE_UNIX98-define.patch
new file mode 100644
index 000000000..75c35f865
--- /dev/null
+++ b/meta-oe/recipes-extended/pmdk/files/0005-pmempool-Remove-unused-__USE_UNIX98-define.patch
@@ -0,0 +1,30 @@
+From 92e63699ea83074298971b0251f002562be4dbd3 Mon Sep 17 00:00:00 2001
+From: Alistair Francis <alistair.francis@wdc.com>
+Date: Mon, 10 Sep 2018 13:23:37 -0700
+Subject: [PATCH 2/3] pmempool: Remove unused __USE_UNIX98 define
+
+Remove the unused __USE_UNIX98 to fix musl build failures.
+
+Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
+Upstream-Status: Pending
+---
+ src/tools/pmempool/info.c | 3 ---
+ 1 file changed, 3 deletions(-)
+
+diff --git a/src/tools/pmempool/info.c b/src/tools/pmempool/info.c
+index b4010bf35..7b890a123 100644
+--- a/src/tools/pmempool/info.c
++++ b/src/tools/pmempool/info.c
+@@ -45,9 +45,6 @@
+ #include <inttypes.h>
+ #include <assert.h>
+ #include <sys/param.h>
+-#ifndef __FreeBSD__
+-#define __USE_UNIX98
+-#endif
+ #include <unistd.h>
+ #include <sys/mman.h>
+ 
+-- 
+2.17.1
+
diff --git a/meta-oe/recipes-extended/pmdk/files/0006-Makefile.inc-Allow-extra-libs-to-be-specified.patch b/meta-oe/recipes-extended/pmdk/files/0006-Makefile.inc-Allow-extra-libs-to-be-specified.patch
new file mode 100644
index 000000000..2042fdb25
--- /dev/null
+++ b/meta-oe/recipes-extended/pmdk/files/0006-Makefile.inc-Allow-extra-libs-to-be-specified.patch
@@ -0,0 +1,29 @@
+From a88e806f9ce8cc071e81abad688643d53f393176 Mon Sep 17 00:00:00 2001
+From: Alistair Francis <alistair.francis@wdc.com>
+Date: Mon, 10 Sep 2018 14:18:38 -0700
+Subject: [PATCH 3/3] Makefile.inc: Allow extra libs to be specified
+
+Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
+Upstream-Status: Pending
+---
+ src/Makefile.inc       | 2 ++
+ src/common.inc         | 2 ++
+ src/tools/Makefile.inc | 1 +
+ 3 files changed, 5 insertions(+)
+
+diff --git a/src/common.inc b/src/common.inc
+index 032cb83ea..2d5c4bedf 100644
+--- a/src/common.inc
++++ b/src/common.inc
+@@ -74,6 +74,8 @@ GCOV_CFLAGS=-fprofile-arcs -ftest-coverage --coverage
+ GCOV_LDFLAGS=-fprofile-arcs -ftest-coverage
+ GCOV_LIBS=-lgcov
+ 
++LIBS += $(EXTRA_LIBS)
++
+ osdep = $(1)_$(shell uname -s | tr "[:upper:]" "[:lower:]")$(2)
+ get_arch = $(shell $(CC) -dumpmachine | awk -F'[/-]' '{print $$1}')
+ 
+-- 
+2.17.1
+
diff --git a/meta-oe/recipes-extended/pmdk/pmdk_1.4.2.bb b/meta-oe/recipes-extended/pmdk/pmdk_1.4.2.bb
new file mode 100644
index 000000000..0c5b6d8b2
--- /dev/null
+++ b/meta-oe/recipes-extended/pmdk/pmdk_1.4.2.bb
@@ -0,0 +1,62 @@
+SUMMARY = "Persistent Memory Development Kit"
+DESCRIPTION = "Persistent Memory Development Kit"
+HOMEPAGE = "http://pmem.io"
+SECTION = "libs"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=7db1106255a1baa80391fd2e21eebab7"
+DEPENDS = "ndctl"
+
+# Required to have the fts.h header for musl
+DEPENDS_append_libc-musl = " fts"
+
+SRC_URI = "https://github.com/pmem/${BPN}/archive/${PV}.tar.gz \
+           file://0001-jemalloc-jemalloc.cfg-Specify-the-host-when-building.patch \
+           file://0002-Makefile-Don-t-install-the-docs.patch \
+           file://0003-Makefile-Don-t-build-the-examples.patch \
+           file://0005-pmempool-Remove-unused-__USE_UNIX98-define.patch \
+           file://0006-Makefile.inc-Allow-extra-libs-to-be-specified.patch \
+          "
+
+SRC_URI_append_libc-musl = " file://0004-os_posix-Manually-implement-secure_getenv-if-require.patch"
+
+SRC_URI[md5sum] = "bde73bca9ef5b90911deb0fdcfb15ccf"
+SRC_URI[sha256sum] = "df7e658e75d28cd80f6d2ff7b9fc9ae2885d52f8923fdbacecfd46215115fb4c"
+
+inherit autotools-brokensep pkgconfig
+
+# Fix jemalloc error:
+# | configure: error: cannot run C compiled programs.
+# | If you meant to cross compile, use `--host'.
+#
+# Also fix #warning _FORTIFY_SOURCE requires compiling with optimization (-O) [-Werror=cpp]
+EXTRA_OEMAKE = "HOST_SYS='${HOST_SYS}' EXTRA_CFLAGS='${SELECTED_OPTIMIZATION}'"
+
+# Fix the missing fts libs when using musl
+EXTRA_OEMAKE_append_libc-musl = " EXTRA_LIBS='-lfts'"
+
+do_install() {
+	oe_runmake PREFIX=${prefix} DESTDIR=${D} install
+
+	# Copy these into the standard directories
+	install -d ${D}${bindir}/
+	mv ${D}/usr/local/bin/pmempool ${D}${bindir}/
+	mv ${D}/usr/local/bin/daxio ${D}${bindir}/
+
+	install -d ${D}${libdir}
+	mv ${D}/usr/local/lib/*so* ${D}${libdir}/
+
+	install -d ${D}${libdir}/pkgconfig
+	mv ${D}/usr/local/lib/pkgconfig/*.pc ${D}${libdir}/pkgconfig/
+
+	install -d ${D}${includedir}
+	mv ${D}/usr/local/include/* ${D}${includedir}/
+
+	# Remove uneeded files
+	rm -rf ${D}/usr/local/
+}
+
+# Include these by default otherwise the SDK is not very useful
+FILES_${PN} += "${bindir}/pmempool ${bindir}/daxio"
+FILES_${PN} += "${libdir}/*so*"
+FILES_${PN} += "${libdir}/pkgconfig/*.pc"
+FILES_${PN} += "${includedir}/libpmemobj++/* ${includedir}/libpmemobj/*"
-- 
2.17.1


