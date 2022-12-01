Return-Path: <alex.stewart@ni.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52636C43217
	for <webhook@archiver.kernel.org>; Thu,  1 Dec 2022 13:43:32 +0000 (UTC)
Received: from mx0a-00010702.pphosted.com (mx0a-00010702.pphosted.com [148.163.156.75])
 by mx.groups.io with SMTP id smtpd.web10.43418.1669902206934117033
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 01 Dec 2022 05:43:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ni.com header.s=pps11062020 header.b=FmHEILOQ;
 spf=pass (domain: ni.com, ip: 148.163.156.75, mailfrom: prvs=93349a59e9=alex.stewart@ni.com)
Received: from pps.filterd (m0239462.ppops.net [127.0.0.1])
	by mx0b-00010702.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2B1CBUrv011177;
	Thu, 1 Dec 2022 07:43:26 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ni.com; h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS11062020;
 bh=z4nar67Z6UXIgHrv9hZiC5rRbekjbcERKk7zNIQ94cY=;
 b=FmHEILOQcTYyPoLIEfJuFUeiYFpzmdVDY62HjR3B3oE/4z7FnLoIl9tLyaOpPcvBKc5l
 7Vb1dAiheaMhoDFDlcunv0PRDj63j9veXZprmg6zEezaveWTnTIPGN24MdGZBegmPjBm
 O4XgnYHBlHrBZc7Xt8iM8wuO489pO/7Hsz2mGGq9vomrw/FOQ8GHzVRF8JL5D+IIJNUi
 tgXbFhRKkicwZAHIDjKU/OKB+MiIG1KBomzTEsD90n7i6hTtsEPvyAskIyyGAWl9yyHd
 P+25PGqhO/8xX9clBrxOrFMmX8p76p8t0l+27z98gyke+xSsONT+y4qbhiAuNsLuNtdb Mg== 
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam02lp2048.outbound.protection.outlook.com [104.47.56.48])
	by mx0b-00010702.pphosted.com (PPS) with ESMTPS id 3m6k76926k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 01 Dec 2022 07:43:25 -0600
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SMU38fqLFOb1BNh8Oe3hZsCQLL1+4ZECq1goq8U3JdFL34RkM3geiBYt/IxVmRuaf1SK96A4CIOcWhwc/c3IrzSEScKc5XD4zdy7IxUJ0IAbLvXUI3Q/s/0VeHblBF6oKPu46CK+ZUsPbjLNk/l8tdmoBX/y5anji+Kc0HNTnIpt4lxo7PDe1cgFd6f7PYORd4fhh37kJQ9zk+RcSGI1doNqujgQMXxgyqj3nny8oDbSy06LpTXEG9QDJaYVFKlccZUy0ZU0ypP96nd7i69o05gok8NPOhj1P8yxBawgJgwm/Tv9s0WfJHn5XrolmCoDDGrTTObcuYa0LAjGG2nldQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z4nar67Z6UXIgHrv9hZiC5rRbekjbcERKk7zNIQ94cY=;
 b=gTfA2aVW0rCXP/GGmdlfqwqRNUeiohdRtw8WdiWez++NZrO7v7KmVLXz99rjK8nNdCFBTK7bjnTugZYWgfhlAgBKFRVldf96vrKI94fCopYGbDHSDLdz9IyzwWGJBf0CI5PDOShOhO7/Us+kirqgafErXG31+Afw4+hY8eaOSJ2G22HZyKEDp4HbAW90OjLHwl6wVZUQtRFxn6gBQqxb0lbGm+PQKiVNyhXPOdVTJN9NRYjQUS3MgauqY3oqiteQLbbV25Ya9pK7DOPe+QQL5iEhjQ3xorYNk0X52j3uQV1PrhciAGT6l+hbESChzXrRxjLoHhfMUQWKRazSfxFBqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ni.com; dmarc=pass action=none header.from=ni.com; dkim=pass
 header.d=ni.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nio365.onmicrosoft.com; s=selector2-nio365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z4nar67Z6UXIgHrv9hZiC5rRbekjbcERKk7zNIQ94cY=;
 b=WCNmUYZXbozKn6qJE1zDSd+soh/JMVKDyq+QkXG/hk/2D4Py7/Bvj+FL+6HHXg1GY8S1aIDEshCF8CfS3o/YbVZ7sB87ginY//OO3YhC9pQNnvaYVddYFBSUO7MaeEhD/az/nDg0yZ6mvviwiV5Z7oIhxVA2haQX3RyFn6GWe0E=
Received: from SN6PR04MB5151.namprd04.prod.outlook.com (2603:10b6:805:90::25)
 by MN2PR04MB6925.namprd04.prod.outlook.com (2603:10b6:208:1e1::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.23; Thu, 1 Dec
 2022 13:43:24 +0000
Received: from SN6PR04MB5151.namprd04.prod.outlook.com
 ([fe80::d240:66cd:3152:9511]) by SN6PR04MB5151.namprd04.prod.outlook.com
 ([fe80::d240:66cd:3152:9511%3]) with mapi id 15.20.5857.023; Thu, 1 Dec 2022
 13:43:23 +0000
From: Alex Stewart <alex.stewart@ni.com>
To: openembedded-devel@lists.openembedded.org
Cc: schnitzeltony@gmail.com, Alex Stewart <alex.stewart@ni.com>
Subject: [oe][meta-gnome][PATCH 0/3] gvfs: use native ssh client
Date: Thu,  1 Dec 2022 07:41:45 -0600
Message-Id: <20221201134148.116754-1-alex.stewart@ni.com>
X-Mailer: git-send-email 2.38.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SN7PR04CA0230.namprd04.prod.outlook.com
 (2603:10b6:806:127::25) To SN6PR04MB5151.namprd04.prod.outlook.com
 (2603:10b6:805:90::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR04MB5151:EE_|MN2PR04MB6925:EE_
X-MS-Office365-Filtering-Correlation-Id: 763965f1-480f-4499-aaef-08dad3a20415
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	AHl2Ew6n9eqz6FhjwK5r9aVO/iU0KmwVrzH4qQKBrFf9FQwi1fytxnP1KvE83hWFN3MzErkAhKa8AB2cZhOCu+029H8nXBEYBI2aRJ57NigIyNBEhFtlVCx4Guh0eI7EuJjljArGkmEMKCJSoo0Cpk02giUPaeJLKlMkBlUob5WHE6CqDpAvNPTmYumWZ6WXj/TgiNuXuR1HlEacBWJ+7+JfFKkhSyRftfNTrH6G2cHU0SS6dSEHXOW4oPa+VI4hBMuoo7zoR64ZcAes+LchOZsG5jACfbV8rIhbMMCKtC7WNYtIoPFbmmnnP1RJV6enADLquKu42Aq7VebzSyIp5b79hnhefAdQJWEDtamdmW8/bJ/XzW6EDHK19v+tX1SHgSF9XJ4c3lb0qrEycR+GOxHVxFFG04NM7ba/krKA/ShjmOP9rRz6CHD8c3hSYD0Fmu9nlXaGrtfDJX0UL5SDgwnWPxFACUQgeXsUaQ8TtOY6GOeB8lQzAp+tr552Lf4aCVOUjTaj9yTccCBw4g7KuYTG3/VGhaKdDvnBT3TIA9LHfdr9Pgs3LeBu0WpktX8NmOhSe05YdTRm0Rco2y/Ziw6aDs7ud9PLvSX76gIt9DgzfwAsgD+sp+avxvm1LBm8
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR04MB5151.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(136003)(366004)(396003)(346002)(39860400002)(376002)(451199015)(6666004)(2906002)(36756003)(2616005)(86362001)(6486002)(478600001)(26005)(316002)(6506007)(66556008)(44832011)(5660300002)(41300700001)(6916009)(4326008)(8676002)(66476007)(8936002)(66946007)(38100700002)(6512007)(186003)(83380400001)(1076003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?8nfy1sBcgGRp4+OWPc7fIAtVMy6ef2U23DZ+HtB1QynXC7VKNbW8UQmC2PDS?=
 =?us-ascii?Q?4AAyi6JPriQMi2cdnKQL4VxbUa3tPzJMr5UtQrJT09Iv2Oggqi5hyQEcJhAp?=
 =?us-ascii?Q?lIEhksHhZWDs7CY6U4oly9UBug6m6FmKkM5OwahkTp2xE428U6+RRDPU9+WY?=
 =?us-ascii?Q?b++1/6vW8LlKrFvIbUk8Xz9ppmTQns2vUbx3gp+voC0cCa+Dxgomjt2EACNs?=
 =?us-ascii?Q?J8W8+0NOiTNqnNn3wbdU/QBR6SCvc/xISbGU6SMQ1ZZvtL76UDcv4YYBDF2V?=
 =?us-ascii?Q?rD48UAFHEWwA04TxkvUJsXLA8aVNIUj5wLnaXn9f+ceCGaRCl0yeleDB7GDs?=
 =?us-ascii?Q?KA2IgLZhl8a4By2YIy3PbZ0leftFZBX5zcjYK55YMAYS0TOdp6/K87WfDZbu?=
 =?us-ascii?Q?xmZUxTbFnXwLz4wAPGExXHAGly02sxzQsbRxtjiIcajtUzrUGzz6Snt7FCfo?=
 =?us-ascii?Q?PhQqQJTVgQckyj2V1gMLXBbtrgRVMrgQ/0/BfeliaenKho0ahaO7cYttnQpw?=
 =?us-ascii?Q?Gon6V+CkE9B6RI6Xxpwor9C3/m1JUW/n7B8kU9B0Zf7Su2229mT47TVgRNv7?=
 =?us-ascii?Q?g9BvGkU3r48B3NZ0pDDiSohGvAVvwVf/Nkrjd45ACKvIUSMMB2oOj42l9ee2?=
 =?us-ascii?Q?MGxY+QWeuQZLnDEXXbsHXZ7piSdgBI15T2zCXdCwXscIa6YEIUPTUpOFamKq?=
 =?us-ascii?Q?As2gVvX53SWS4+h4zKn0YFwNkAXTlWuqVaDo/S0+b72pnmTWCNA49t3e2G+l?=
 =?us-ascii?Q?MolmFNaV39zivpIIOvQ1ZxT5BMIIuUhgrc+knOY3/T0wj9NWaVYqjQLgGboV?=
 =?us-ascii?Q?XlMT/hP4IHH9IQqmba2j/27DNXvlMZj/UEYhMZG6V1O+CW8qATShjvJiEDd8?=
 =?us-ascii?Q?LwRZ2xjo13qPEYmIFzCaN085KT5Ex2A1392ozM/55fGUsif3vN0bfqdndY7f?=
 =?us-ascii?Q?KF0p/GX/tniRxvBDT++xqoUSTpnoXPHOcSMi2VguHfVqT9Qy1LcB7ZCEOb2G?=
 =?us-ascii?Q?cO4LLkTJmdap+kXWMjEUzB5WK0ImdWOkSUGrW+OpLUlP3JDbleijVQzUXhmo?=
 =?us-ascii?Q?f98EIBp4X8gRn9IgAC22cA3BJ0bjvjUEL/77vhaUbP6XWZnqGcd1vyxkh03Y?=
 =?us-ascii?Q?kIh4opISoVAu2yXin5Q17HwCdhV26WfyCsrwI83NwJG0fX4b6SVL512wRkow?=
 =?us-ascii?Q?ExMTo0kkhBxuKqVDRjGls6MFPSNoULSfage3/86iOv6bQ++In//VZjrxfw6P?=
 =?us-ascii?Q?xROFRVnAnv6Gmmdcb55Wdi7HnPIthTV5HfanMPO06BsfsAjGgmRlHyrG3qUd?=
 =?us-ascii?Q?n7lef5VBz17miVxgalKpAQruI/GbCk3r/yiStuxLFjGrV4Dofwx+WF6bPdh3?=
 =?us-ascii?Q?lMDcg5UU1F7tihkIMqLnrfkR9mNn2FKwNUaV6f5D5lriJD0JNBzU1kDUZvpG?=
 =?us-ascii?Q?D/tYwLPLffGpFiiMaY+386HkSoF7YB2LqySrSH+Uq6y7yUUPa03re6mEruol?=
 =?us-ascii?Q?jUXQPiaA/RXWm+6wOTxYcsM8nF3mZB5xeUoOcL4SneIC8FzFe3BX5DfZEWJF?=
 =?us-ascii?Q?fKPSOrYtMeIAok2yTgJ7gB9uwjSzxPs1vnB3Cp4O?=
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 763965f1-480f-4499-aaef-08dad3a20415
X-MS-Exchange-CrossTenant-AuthSource: SN6PR04MB5151.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2022 13:43:23.8818
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 87ba1f9a-44cd-43a6-b008-6fdb45a5204e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cBgRa7DvqS3lfmTFb1kxMlQw2nsrhStt+8uNf2AjZV7ZbqaUlONoKqDAwhp/L4cgh1o6bVe0FJEw2IF7jt/2cA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR04MB6925
X-Proofpoint-GUID: z-fZSzN2pSLgDnF2alPe3QIWT6LTphyP
X-Proofpoint-ORIG-GUID: z-fZSzN2pSLgDnF2alPe3QIWT6LTphyP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-01_04,2022-12-01_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_policy_notspam policy=outbound_policy score=30
 priorityscore=1501 adultscore=0 spamscore=0 malwarescore=0 clxscore=1011
 mlxscore=0 impostorscore=0 mlxlogscore=999 bulkscore=0 suspectscore=0
 lowpriorityscore=0 phishscore=0 classifier=spam adjust=30 reason=mlx
 scancount=1 engine=8.12.0-2210170000 definitions=main-2212010099
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 01 Dec 2022 13:43:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99885

While rebasing the NI LinuxRT distro to kirkstone, I noticed that my
pyrex container fails gvfs:do_configure with a meson error about not
finding an `ssh` client.

| Program ssh found: NO
|
| ../gvfs-1.50.0/meson.build:462:2: ERROR: Assert failed: SFTP backend requested but a ssh client is required


After some investigation, it seems that gvfs is configured to use the
`ssh` client implementation in the build machine's PATH. If no native
implementation is provided in the native sysroot, it will default to
using the host machine's implementation.

My new kirkstone pyrex container happened to not install an ssh client,
and so would fail. Since ssh isn't a requirement to run BB or OE, I
don't think it's appropriate to use the host's ssh.


This patchset adds the native bbclass to openssh, when the user includes
meta-oe in his layerstack, and then provides the openssh-native content
to gvfs through its DEPENDS. This is sufficient to resolve the error on
my kirkstone pyrex container.


NOTE: It's a little odd to me that the OE-core openssh recipe doesn't
already inherit native.bbclass - when it *does* inherit
nativesdk.bbclass. I would be open to moving the openssh changes in this
PR to OE-core directly, if someone can ACK that it would be more
appropriate to do so.

Alex Stewart (3):
  openssh: add native BBCLASSEXTEND
  gvfs: stylize DEPENDS
  gvfs: use native ssh client

 .../recipes-connectivity/openssh/openssh_%.bbappend  |  2 ++
 meta-gnome/recipes-gnome/gvfs/gvfs_1.50.2.bb         | 12 ++++++++++--
 2 files changed, 12 insertions(+), 2 deletions(-)
 create mode 100644 meta-gnome/recipes-connectivity/openssh/openssh_%.bbappend

-- 
2.38.1


