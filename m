Return-Path: <trevor.gamblin@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F01EFC43217
	for <webhook@archiver.kernel.org>; Thu, 24 Mar 2022 15:57:59 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web08.12715.1648137478174900661
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Mar 2022 08:57:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=Fg83yuE7;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=008297714c=trevor.gamblin@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 22ODBFjf020587
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Mar 2022 08:57:58 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=zN+y60rEkDoskg/iadCrKKZmQR3ThbPWpExAPmDe6pU=;
 b=Fg83yuE7lvSorggUv4f4QMeaYdvKIejkRJn4ZHIt0qBYQZ7T9ryOdK1p62/5Rpv1bi65
 hxN1Kgx1CBLiuRbilTBkxMq60/pn/wkBsQuK0fcFXAoBn3oOv8G+XHJRvlSJLUu9JLXu
 6N49Gk6jAxBT6SZDw9Ih+Y492D1hQcrYRqHEXQzctcuYxYC0PN36QJcYJfO3V8oAiUAE
 WYHk1PDNoQ2HVsn2zDBhaQag7L0cctZ/eZNnH7JjUh90AnuoNpWXB/OZp6RXD64D/t6L
 D49XgnsnaLKTmav5WI0TGBC8fFMt0KdjPvFv4FXVbdS8EIkncOy6JwZS1XWApTkfiYT3 SQ==
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2177.outbound.protection.outlook.com [104.47.55.177])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ewaf3vjfh-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Mar 2022 08:57:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DXEFLZ+NYgsD2kqHP6Pm1pr6ho9dwL6oQKp0iOVRvx+42cODcXSAYs4DK1rztbbZPFwuk9qVa5SEpyE4Rq6jPNyxiEinhvE85i6w++Z142k0tU3v8bT6IHGnVmJXDC4eNlm8VAaCGOhovZeu7RbmGmCJX/cNatG48JtmUOCWyJ+XTKFRzWa6rPhY7ptxlAa2+yJrZDVboLqnJ+CEMggujdjL8FWxQjH/fDsBnqPcLxEmovaoO0y0IXKqB5PHwojG0Uf9Hk9oUkj6Lydb2G/XxUt9c+s1/A5bAsRX47/DrmJD7ixY/iDEVUXe1bfwnKLcNtEZ8Nh6lcv7uFaJbjMyMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zN+y60rEkDoskg/iadCrKKZmQR3ThbPWpExAPmDe6pU=;
 b=kd5hkXYCY3PRh/cn2zGBo31IaL6sTo+XN+tElzxR2zDPMOa8BJCiZrbTvmY7k7kIC/XfwDT/dxWtD5YENsCvcxP7dC0HydlpdsSWpTp6XF0f/1umhhJS6Ed6+HfE5lZxz7yAhAxlEsMUPQH5crSamiN8eDJ5AE0ScG+UpYaNcE7cdUpekAn4HPI5JQsH89IUzBzsDz9KtmBc+kG5wGKp2xqAfmMKfoA84NVRqYkPHxA0SOSKUlqvbMYOd6CVnojzuJrjNl9c0oq3fY1ZD9cYe2vKfKUZeALCRmo5MdGwTP56qlK81w5F3/DGIBc6nx086/x768FE3KnKMJ8oKFNIRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by MN2PR11MB3869.namprd11.prod.outlook.com (2603:10b6:208:138::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.15; Thu, 24 Mar
 2022 15:57:56 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::c1c7:209:c28f:67dc]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::c1c7:209:c28f:67dc%3]) with mapi id 15.20.5081.023; Thu, 24 Mar 2022
 15:57:56 +0000
From: Trevor Gamblin <trevor.gamblin@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 3/4] python3-h5py: upgrade 3.5.0 -> 3.6.0
Date: Thu, 24 Mar 2022 11:57:45 -0400
Message-Id: <20220324155746.2341330-3-trevor.gamblin@windriver.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220324155746.2341330-1-trevor.gamblin@windriver.com>
References: <20220324155746.2341330-1-trevor.gamblin@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: YQBPR01CA0033.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c01::41)
 To BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fa816827-dafb-4586-3f29-08da0daf0faa
X-MS-TrafficTypeDiagnostic: MN2PR11MB3869:EE_
X-Microsoft-Antispam-PRVS: 
	<MN2PR11MB3869DA4787F755FF0B9BD4969F199@MN2PR11MB3869.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	3SqdjXo1hbTRL8IXako+736NoMZrWAzwkdYC7LBPrHvwM5caP/vZ7QuL7onU05YbYTvzUPIRg56qEoJ4gHcZdPtQHbDwO47mMT3Ly1Ol/rJr0Vz1kKRFdVXnwdFbARtRJR3HYfVsy9Z1ihbImTABlx6rLtDzIBtwZfxDOMVC0Anu0AKMbG3J/oJO0+fw98vCjAPOcXbpQEkzbK1chdt8pyoEYaodzCpDn5H/ORTfMo/Th0R41AQT3RxQcBPpgRshwlrL1qkGlqZ/LqMNIW2tCymDGcoWLCbMc5H0VG+H2PtQ5u9BsiJVdynWTPHBeouWYRRDX7giAPSeU+WMTEs2IpSQJKtPebc6RIUxOgA3NHnlXCnUGFFZaiNn8ZOzQTVrATPVGweMOdTYN9h9pxP5XiW49i7dxZHn2ApU3zRWUw30/d+uJkdpSADKIeMxYWqXtbULjHOD8l8ydZHRS7RENx5kS8SNB3MUVtS7Itx9hWePnkS1jCoIUOK0KZ5I7cTwgoZpmxEUpr+t0A0BcgEPgfJqRRLykEZnuEHb0FXbjHR0Zhv2FBjylBhwpU0jt+xLm8jBiJznif6WtF3li3aOKTAfQ8paBVDntajIjztYmHt+8YfWPIEMmeysKAaLp0se7D7CSzzJBpOqWUvBAF+JnTD4n1NEbg9tyEDac1N5PWtSG/bT58lRp/5CGtD4ZDz1ZOAGlUTdRQsUGrZrQPqs+Q==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(83380400001)(38100700002)(1076003)(6916009)(38350700002)(316002)(26005)(66946007)(186003)(2616005)(66556008)(86362001)(66476007)(6666004)(8676002)(5660300002)(508600001)(6486002)(6512007)(2906002)(52116002)(6506007)(8936002)(36756003)(44832011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?alHQtdpme/9fU/QOsfroNaCtYdeVserATXD1GTBV99It8rqSV/kSSux/Jrmq?=
 =?us-ascii?Q?fa5WAaJ33vqxDAWx5bOBVFINhlhgdSaxc0Ol3Zmog6j5OnyC2ZaQX9uQcOsP?=
 =?us-ascii?Q?LR1L7BCRIY9dv3Ofba+kJ9tOCIolAp2mAFxfKe4/sFw4uk/pQC6XiKXzbdZ6?=
 =?us-ascii?Q?auEUFBdf/kx3y5lD62+SYTY8B6lfqvF/cgUfH/CAr4TGg+XIYnam39lE8izM?=
 =?us-ascii?Q?tlzkY+pka9rMDj3GMxkdkyjhsVZlM2XdznbunFsRXFK8Tjcw4X50EVFl5u8D?=
 =?us-ascii?Q?ph4amHSq+HuFrLPz+/wsse9wofc4y3VBu06b50/u7iKxJRImig6FcbWwyU7m?=
 =?us-ascii?Q?kgSzP7PGcmdpTqb5qs/zsx/WSSAZkQ35Wrrv/A7xfQ8V8K7k7yBoSOT+OvHz?=
 =?us-ascii?Q?Z2sN++arwrJVzKfdRBT4TV/pPLn/Ob0i0EVh1h1KlR5P6B9xBqrYFJ/p62UM?=
 =?us-ascii?Q?sbj+YoWzwhRWRIvTVqC2H66/6YXM+zJvh4I/OOUlhPmYujjYjvkGXmB2/6Sp?=
 =?us-ascii?Q?hvPmXdzA7A6FkuZwXREUsyDX3DBHSIeP1cnlxfPm+ziIu0jGibn+NwRaG1pz?=
 =?us-ascii?Q?nAUp60M6mUkEOXePdehxpgn9VYsYAZRjFf+sUpvlF7bxqXhGwyycBXxWzq34?=
 =?us-ascii?Q?Q4jLf+o+1tM/DStFJoe7Wo3Nk8t9zpZ421mTMy/9k8zScdC9Zqu5IpdcwAcU?=
 =?us-ascii?Q?UPBhmCoQf1GPL1ibAa74FUn68FtuHalt7wgQexa4ZAC7gy4vmAN1UTuxIfBp?=
 =?us-ascii?Q?yDz46dPRENf3Dy3jdLTMOhwJnqobGQAn7461AbD8mae1Pn2J0qjQvuDkKoP8?=
 =?us-ascii?Q?k7H55F34onI+ivuFNEddubEwZrSHhGZd5i4X+HI9ooQEP0IoPbMh1sbiqRI2?=
 =?us-ascii?Q?hxbKDmyQa453dPI3kfAR6UZVv86dV7jfkGtj7sPUIYXWhLjyR9TMj0ucAosQ?=
 =?us-ascii?Q?TX/NG+ML5DRXYmwM/5GC/U7rT7bTllbTP5EVWWSK133posSJNjItXk9PfQWz?=
 =?us-ascii?Q?Pxi7znhlKqlxGFav5bpH3vkTqacL0y8ry28L7oMYorxusJ0Bai39GwGQEqkV?=
 =?us-ascii?Q?lgoqrEcXapBeOs3rdqwiZl0KhQ2DAhflluwG8fNASmnRTvcBGTEjcJl6rTa8?=
 =?us-ascii?Q?aWWtCDxrGKB/Z1O0H9Bxr1lGnlTEgSWKQz+v6+R4Z53faQL1PQ7OdDLwgjkM?=
 =?us-ascii?Q?1ZA8Q05miNntXEEGzTUa3Wbwiyepg51+VzCI4hWRx0fvgIfHSslUW8KmNnTB?=
 =?us-ascii?Q?m31rOVAutrujeY8YKjhMuQ1Bcd0M2VXKSokySkwqy/Jm1sRip5zeQ129aeYO?=
 =?us-ascii?Q?r191vSXlIQH0ufbwj+Ph21KXQXrODALo4t8IjceXX6K2QZQELrCsNod8y5kI?=
 =?us-ascii?Q?MbCEvaUTqn58u2Szi/RIyRCopuzTC3xeTB4Vy4Xh45dAMIFzY+Os2N5hNJrR?=
 =?us-ascii?Q?M1VtmU9DCK+ErJ1OjwhYWfYFC9SB16SrmkiCin/TMuM1009MoOe16g=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 fa816827-dafb-4586-3f29-08da0daf0faa
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2022 15:57:56.2568
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 Krla7rd5ObEMBqSpQUmHwrD8xlkTF+1T7418e7eae/n2LfwbEaztbL1afVYqQxtcuSHNAFbNFIFChSHOHbF9bIE6oGpiNYizxYk1LyZS8Ig=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB3869
X-Proofpoint-ORIG-GUID: xu5ziriKF_FVX3d4N7GjkspTU2iBdhb2
X-Proofpoint-GUID: xu5ziriKF_FVX3d4N7GjkspTU2iBdhb2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-24_04,2022-03-24_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=45
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 mlxscore=0
 bulkscore=0 malwarescore=0 mlxlogscore=770 suspectscore=0 clxscore=1015
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203240089
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 24 Mar 2022 15:57:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96198

Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
---
 .../python/{python3-h5py_3.5.0.bb => python3-h5py_3.6.0.bb}    | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-h5py_3.5.0.bb => python3-h5py_3.6.0.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-h5py_3.5.0.bb b/meta-python/recipes-devtools/python/python3-h5py_3.6.0.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-h5py_3.5.0.bb
rename to meta-python/recipes-devtools/python/python3-h5py_3.6.0.bb
index aad2f9177..64abe73cb 100644
--- a/meta-python/recipes-devtools/python/python3-h5py_3.5.0.bb
+++ b/meta-python/recipes-devtools/python/python3-h5py_3.6.0.bb
@@ -4,11 +4,10 @@ SECTION = "devel/python"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=113251d71fb0384712c719b567261c5c"
 
-SRC_URI[sha256sum] = "77c7be4001ac7d3ed80477de5b6942501d782de1bbe4886597bdfec2a7ab821f"
+SRC_URI[sha256sum] = "8752d2814a92aba4e2b2a5922d2782d0029102d99caaf3c201a566bc0b40db29"
 
 SRC_URI:append = " \
            file://0001-setup_build.py-avoid-absolute-path.patch \
-           file://0001-setup.py-Fix-numpy-version.patch \
           "
 
 inherit pkgconfig pypi setuptools3
-- 
2.35.1


