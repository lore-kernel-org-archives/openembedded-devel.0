Return-Path: <jhofstee@victronenergy.com>
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
	(mail-eopbgr30136.outbound.protection.outlook.com [40.107.3.136])
	by mail.openembedded.org (Postfix) with ESMTP id BA7E17839D
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Nov 2017 10:06:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=VICTRONENERGY.onmicrosoft.com; s=selector1-victronenergy-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=/Ucp+KlJX17LzdPE+rlj2IvYFM6S/obbXdJxVz9Mzmc=;
	b=NBVxgeEAcmzsAb+cVdqU7VOCVu8/9vuhwffyCmkKWUahlMtupePVZ60gDtZvHU5izc8MXWYfnh0lK6JR7HQlmbnn0dAOexSr8IBecP2j/pGcQGSSDMk7vs7k2+2A8iIpMW6w/xS0INR4Ue1GitxCPQR3xPs5HFD0RgX/ygd4JF4=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=jhofstee@victronenergy.com; 
Received: from localhost (213.126.8.10) by
	DB5PR07MB1063.eurprd07.prod.outlook.com (2a01:111:e400:52c7::13) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.20.260.2;
	Tue, 21 Nov 2017 09:51:32 +0000
From: Jeroen Hofstee <jhofstee@victronenergy.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 21 Nov 2017 10:51:23 +0100
Message-Id: <1511257884-7348-1-git-send-email-jhofstee@victronenergy.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [213.126.8.10]
X-ClientProxiedBy: DB6PR0801CA0065.eurprd08.prod.outlook.com
	(2603:10a6:4:2b::33) To DB5PR07MB1063.eurprd07.prod.outlook.com
	(2a01:111:e400:52c7::13)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a58c6443-7a0f-44a6-c133-08d530c5721f
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(4534020)(4602075)(4627115)(201703031133081)(201702281549075)(2017052603199);
	SRVR:DB5PR07MB1063; 
X-Microsoft-Exchange-Diagnostics: 1; DB5PR07MB1063;
	3:9W/0SVGreEeD8jTL69B2gtD0ySpZe140cwfX7zCLTwwVP14ZtU3GSUtBIZWQW5SeYUvsJKW3tKHlB7cuAM/2yA0rSq8yyl54YJTwrVjfzJV2Eij5HEO5ekNOK8PIOvSbp/aleSlF8ryuaj59Yji7qIsNxPB3OFrxn91YPLAJutXtxPatMD7oQQeShUo8PeQR175IhzEtstK2yglX2usOZ+/6OH8TOaYpsObXNUVSC2zAYsGIKyJXNEX6qtoXM+q4;
	25:/3oFvIte3n/Pn1YOPy15h3LtVWtqAtpq9Ppjsm+tcjznpwYXtCHFtx5iAxbfjKB/YS3DdG4HkXVP8Lwe8NziYvMhue5xfZhlcNMhAFjuylAav16t4BqYbWq4lNKE3yL+AOg5QNFsBxfxw8jCbmj3LcZdZNPvHXm0c60JtKlm4tEMQE83asfHcGJVOUcBjaNyYJ8QTSIg9hVOR8xU8JapfXzJdWQOtz9/6LGOjehuB3qi3hYDphjHUq55vdqkDBKf+7tmw1Nwn0VxMj5xJQSa9PueUZbaTTxEhf+2LRtw+aX1CvWEM2JqSTpoPI3xFcsT1NMaNqh+Re4lGxEkF6aGOA==;
	31:X2UhV1/RbnzxspQoUMmsdc0Th5MfN7XLfoA7GmckMscZkuQdM8Xtf/dHbwE903Gt659nW1Nq4xBVS8LVChQpsyiyb5hws5xWV7EpDqzF27fJc74NL+8ebV4d79Cu/ed/B6ogVTcTlaWtYWAunJ0xbCWUJAKMeFZTRPh9fXfIqEpultoslVf06r/d3v8GyFhXMlLtMta7rqZpGo0333VU3Tck15yWMppcuhPzHYu+vbM=
X-MS-TrafficTypeDiagnostic: DB5PR07MB1063:
X-Microsoft-Exchange-Diagnostics: 1; DB5PR07MB1063;
	20:0qUWGsciMuJucKxQ0K2RCDqrvUtkD2OdvLTZU99ucAKx4w97zkjC7ACTkSHagH1cxU4JcukqgeiUd2MeB1onitnK8drOXaqf5twzmrRSqPGa8aRWm48xJuZzUbkdw8HK86JoeEsutKL04fqx3CZVOH5F7E6R3JSWoXca9kETZ5+HQ/uflVNuAucuZmptPjei5Gi2EiWhWsbmFh+kM864k9fxYRCcuyd7kTKPYzm7jScxhMf30xz9yhbdTGSWr9ou;
	4:I9tpmOmqwxH5BAhlY6sHxXsiD+yX/EUjGUFvRCYsc/DRwSm0SYHMyNlNRjGcsIjSqA56u4uL+EBKXzvbavSju/+IIqsVRtEl7hYaJj4NcZs/hAM1rmBnzJQ5/X7ScVWtu3qKvvCL5ekod6P+GyuairZvqz/mXVvNNRPgfeMAAWh6T3kg83SzTF/GmAKL8zLv369DdPxu/w0QUE9U5puFnsyJEMPiWJ2vKapWoF0nwM+Z6auXbr0vUQENSI/68wxmRI2GGsmx0+6bYNDwJR8l+A==
X-Microsoft-Antispam-PRVS: <DB5PR07MB10630CDE919B3B014C091375C0230@DB5PR07MB1063.eurprd07.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(2401047)(8121501046)(5005006)(3231022)(93006095)(93001095)(10201501046)(3002001)(100000703101)(100105400095)(6041248)(20161123562025)(20161123555025)(20161123560025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123558100)(20161123564025)(6072148)(201708071742011)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:DB5PR07MB1063; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:DB5PR07MB1063; 
X-Forefront-PRVS: 049897979A
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(6009001)(6069001)(376002)(346002)(39830400002)(189002)(199003)(66066001)(16526018)(50466002)(47776003)(305945005)(53936002)(107886003)(48376002)(97736004)(8676002)(106356001)(5003940100001)(189998001)(2361001)(5660300001)(4326008)(2906002)(68736007)(76506005)(33646002)(25786009)(6916009)(316002)(8936002)(6486002)(101416001)(81156014)(478600001)(2351001)(81166006)(50986999)(7736002)(6666003)(50226002)(3846002)(6116002)(6496006)(36756003)(86362001)(105586002)(16586007);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DB5PR07MB1063; H:localhost; FPR:;
	SPF:None; PTR:InfoNoRecords; MX:1; A:1; LANG:en; 
Received-SPF: None (protection.outlook.com: victronenergy.com does not
	designate permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; DB5PR07MB1063;
	23:NCYIljMMlwzHN5VMod7mIj8ea3YF+EceIXpKm1BDN?=
	=?us-ascii?Q?AoZ7wWYrXi5fbC+cMjgjohWNeti+Q5IRMgoQPcA6WIy0OwB1JKDpptBz3ok9?=
	=?us-ascii?Q?GcZpr0uXagxiktr+jf+fLhPknVoGcWWHKc58cVF9kfdNrU5ssEzXZHZs8SQ6?=
	=?us-ascii?Q?0x4EzooM14lP/OxD2UvrvdOOkMFefXK3DqzA5DMx9vkN9pdm+9PHMNc8eHw+?=
	=?us-ascii?Q?SR4bKddOIwq8vg7tmaN37vG5rNr+2v95g+hL1f+foURncgbWj6C+jvFHqFnU?=
	=?us-ascii?Q?PcWlNZJtm0b7/dtT1LPwIQrrzuqLpotcnMnFN8XJV28x/vIkmdVRoCB0GbMW?=
	=?us-ascii?Q?PIK0CyKibnM+MNerqPZpiM3ZaVhj+7HmtzgslQuIpefg38qB16jzsRQKWESq?=
	=?us-ascii?Q?bcQ3G7bFJZM2Tpo7WAOZ00ClORmI8ZmqOikLKg29Lr00nBk0j3XRlKERWFyc?=
	=?us-ascii?Q?20SaTp5x78irBcgk9QfCrWPFAPGz8HvbwhmvnIsdNIdMHd/6fyTCLUW4wvBA?=
	=?us-ascii?Q?tmvDRXcFKfTm8RTyR4FT9F9ooXwF6MrRDDFuaTUe2mYsM3rO7H6ph/jZFHSV?=
	=?us-ascii?Q?7e64wllUH9w3+XPj7k5454L0/WM4JEh3N/NiSzWJ2nb3BBG8962jcb4PFMpm?=
	=?us-ascii?Q?P0aoBeQjHvU7201QszT35lvYcLnek5wZCj0dUHxC4UdUSoW/zyRfaOMUlqU6?=
	=?us-ascii?Q?LP2tUciq4OfBd8akY29c5V/ajbjFADwQk2ftWWanEHioETTTP1jNbpuh91Zn?=
	=?us-ascii?Q?VJ/Xn1SNmCRCNaJW7k+qkL6FwAnm3VOVdro+qFMgKdvxi9g6E72U7ynKgeJt?=
	=?us-ascii?Q?7SSTNDOZ6VWbBTD2ZSpNecJV5rPRfe9jvHHnsIYx9NtTYLVVcf4VloDk5fX0?=
	=?us-ascii?Q?kZHBWd9q4tD3vJehMhE7WSsW0VLGd02xycsAhzYKt0/9QGU2OAc/SXU+3Y/0?=
	=?us-ascii?Q?hHsRKyH0DfO6bqzFSd2OxwV6k8aMPo6UPPhRvoeGx22XEwn6Qah9g7yxXuZs?=
	=?us-ascii?Q?H1JUX6ENS4Xx9kzkEDl9VxERP8a8Bf82gy5wCbFvadsErHPYnqsv5L0arpn1?=
	=?us-ascii?Q?J66MAHe5pyAmoNbbhlvkOhzb1r8PoRTzNTeWQc2iMlT4hF+htHZEix/2hlpX?=
	=?us-ascii?Q?YNGcMwzitM=3D?=
X-Microsoft-Exchange-Diagnostics: 1; DB5PR07MB1063;
	6:NlGrSMONPqErKHxZPjoc12ZZGWmIMU7J/RCsJ6o0hOxLKLlRecvK3kvgZ9KTc3rjqSeT+Og2F/QfmzI/JQzOuy7DZrRxDvAjI3s3z+LHhsJ7CtZIIs7UQI87z/pJAxLF52W0GRTSQblgkwJG/kWXdNZnY0eYvQQq3iP4cA8Iu1QGbXRjQuIxSrq6DaxRgFVBGnOpNIvdTvKQhR4LT9lVuVd7Hr9+0725R7+DO0YFz3Ht6NyGdP7W6CScEvGAbsMrv4nlzEhNZABAJmoEqXDuImgLBtQXoKrNiauIzAmpdsmHqQQQpCBG6VBxT0Uu8QTA93hlPE6xg+LdC+mw+t8OW86d/nJxwKnDnOpuYoO8L3A=;
	5:Alp8uAvC5plik9gAfNl/D9QY52afq7/eoHEWwWEbtBv44rhHv6zQStwu/3NJdQI/FmE6uy4xT0pAcPUaEiPOP7PIS5oAT8E37sPDzaYzqgkj5xlyvAG1zXLhCDMITR3+lzgLVoBLCwujAmP4Hbvol3t2nNPUfv4YfZSrFvIwQCU=;
	24:mKHihg6/noevcQRmL1qSztiLN0LWiEOyWkKdxmgD+Kw/sFm37smbRY5WVqQjqiwNX5XoaV2BgzDyqRCgYY3ppiq+5me1Br6/U9xW858ulX4=;
	7:Tj0RdEr8Ls4wGJsdmC1D89PVsa/wKke+ho7TZDNaxsm8xNe2kAgtspo7AmguGEh0R3DEk9Eml6eIi85vmRb7dCzMM1y0buRikMjBI+RWZE3FkDQs1VC6Ujc8zZ+MIFlPn9V1oYDjjve1T+ULeBxCGp6dIMNh1r0eFBDLsIpMDru/QZ9AjpKxDUXFs1INOD6X1lN9aI3X4FndquKg/tluq6NdXWbmZQWttyad/Gk3pQK8CtsduvcvqG6JTbm03neH
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: victronenergy.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2017 09:51:32.2917 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a58c6443-7a0f-44a6-c133-08d530c5721f
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 60b95f08-3558-4e94-b0f8-d690c498e225
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5PR07MB1063
Subject: [meta-qt5][PATCH 1/2] qtbase: mkspecs: add default toolchain options
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
X-List-Received-Date: Tue, 21 Nov 2017 10:06:37 -0000
Content-Type: text/plain

While most mkspecs use hardcoded compiler names / options, qmake in
meta-qt5 is setup to get them from the environment. While this works
fine with openembedded, it does break normal workflows outside of it.
For example to get the SDK working with Qt Creator either the environmental
script most be sourced first, making it impossible to switch between
different Qt versions or the OE_QMAKE must be set for every project,
otherwise you get cryptic errors like 'make: c: Command not found',
since the compiler name is not set and hence an attempt is made to
execute only the arguments.

Likewise on the target itself, qmake doesn't work without first setting
the OE_QMAKE variables.

This patch adds default toolchains options, so it is no longer required
to set them, but keeps the flexibility to alter them from the environment.

Signed-off-by: Jeroen Hofstee <jhofstee@victronenergy.com>
---
 recipes-qt/qt5/qtbase_git.bb | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/recipes-qt/qt5/qtbase_git.bb b/recipes-qt/qt5/qtbase_git.bb
index 3ac6b21..318c9f7 100644
--- a/recipes-qt/qt5/qtbase_git.bb
+++ b/recipes-qt/qt5/qtbase_git.bb
@@ -221,6 +221,29 @@ do_install_append() {
     # Fix up absolute paths in scripts
     grep -lr /usr/bin/perl ${D}${OE_QMAKE_PATH_QT_ARCHDATA}/ | \
         xargs -r sed -i -e '1s,#!.*perl,#! ${USRBINPATH}/env perl,'
+
+
+    # Update the mkspecs to include the default OE toolchain config for the target
+    conf=${D}/${OE_QMAKE_PATH_QT_ARCHDATA}/mkspecs/${XPLATFORM}/qmake.conf
+
+    # qmake already knows the sysroot, see above $$[QT_SYSROOT], so remove the hardcoded sysroot
+    OE_QMAKE_CC_NO_SYSROOT=$(echo ${OE_QMAKE_CC} | sed -e 's!--sysroot=[^ ]*!!g')
+    OE_QMAKE_CXX_NO_SYSROOT=$(echo ${OE_QMAKE_CXX} | sed -e 's!--sysroot=[^ ]*!!g')
+    OE_QMAKE_LINK_NO_SYSROOT=$(echo ${OE_QMAKE_LINK} | sed -e 's!--sysroot=[^ ]*!!g')
+
+    echo "" >> $conf
+    echo "# default compiler options which can be overwritten from the environment" >> $conf
+    echo "isEmpty(QMAKE_AR): QMAKE_AR = ${OE_QMAKE_AR} cqs" >> $conf
+    echo "isEmpty(QMAKE_CC): QMAKE_CC = $OE_QMAKE_CC_NO_SYSROOT" >> $conf
+    echo "isEmpty(QMAKE_CFLAGS): QMAKE_CFLAGS = ${OE_QMAKE_CFLAGS}" >> $conf
+    echo "isEmpty(QMAKE_CXX): QMAKE_CXX = $OE_QMAKE_CXX_NO_SYSROOT" >> $conf
+    echo "isEmpty(QMAKE_CXXFLAGS): QMAKE_CXXFLAGS = ${OE_QMAKE_CXXFLAGS}" >> $conf
+    echo "isEmpty(QMAKE_LINK): QMAKE_LINK = $OE_QMAKE_LINK_NO_SYSROOT" >> $conf
+    echo "isEmpty(QMAKE_LINK_SHLIB): QMAKE_LINK_SHLIB = $OE_QMAKE_LINK_NO_SYSROOT" >> $conf
+    echo "isEmpty(QMAKE_LINK_C): QMAKE_LINK_C = $OE_QMAKE_LINK_NO_SYSROOT" >> $conf
+    echo "isEmpty(QMAKE_LINK_C_SHLIB): QMAKE_LINK_C_SHLIB = $OE_QMAKE_LINK_NO_SYSROOT" >> $conf
+    echo "isEmpty(QMAKE_LFLAGS): QMAKE_LFLAGS = ${OE_QMAKE_LDFLAGS}" >> $conf
+    echo "isEmpty(QMAKE_STRIP): QMAKE_STRIP = ${TARGET_PREFIX}strip" >> $conf
 }
 
 # mkspecs have mac specific scripts that depend on perl and bash
-- 
2.7.4


