Return-Path: <nicolas.marguet@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F075EB64DD
	for <webhook@archiver.kernel.org>; Tue, 25 Jul 2023 23:21:22 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.3860.1690327275993178955
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Jul 2023 16:21:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=W1+5FSZi;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=65709693af=nicolas.marguet@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 36PLLDg9017968
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Jul 2023 16:21:15 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:content-transfer-encoding
	:content-type:mime-version; s=PPS06212021; bh=PaHis/GgPUiZQguTBR
	/kTACBEEKE5eou/leAvyA+ufg=; b=W1+5FSZi916CpVKdWmlmvbmqTr0CtVH36D
	O/X3TUswE1o8W+XwUbNcO0yPg3htcUL1QkioYZQKkEatCIWqkk3iC+l2603rzAtJ
	bDUbywcgyjb9m4BBZwS2iHw29bwwAI/CIaheUwfklktXbya+WAwT+Zv6q2NzYsxb
	iIyDfsW6IntI2J3shnK/isl8hzZklOBQYvzdeLHVLRqGi/BhoMc8YIf9ibLEIwi2
	UFn3Tengd6LxHet4wcJ48LQHniZ9lIXA+17zKr0+ezwUQ0WdQs/JX1Tlt5zHFuH2
	8rhqiY+4d5ZfEO1APcspRWUEBenmK197KzySpaaZHv0EN20a3+SA==
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam04lp2043.outbound.protection.outlook.com [104.47.74.43])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3s0emfjruy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Jul 2023 16:21:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aLHv/C/X1dJKxhXDNnvI23XFpCwILqxZY2GSwFBonz+Fsl8WU05RsQ2yIWYlhSQZJHa26CdccGGeWDKZOFRRM64svk/28pkY9UUJ6GfHECECzE4Ip6A5JGalvqpR6XJj23SRwbTfucy8w4aKhlLRxXvhHusOfKvQJXwkobNGo05c+yd8QCZnrS/ko2pJZ2fdqbKe6CbBvQOS91wViJzfxKx9KAolof1LJ/Ut4LHw/zd6nsT3v2P/LGEiCuekVINirWJbhq8V89aglLNWohivoAx3hJVNQKLDk4lpq78Z9jjjpShastzTVncHvsj7nk88OGzLpAVWRxR6DbeOtpOIQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PaHis/GgPUiZQguTBR/kTACBEEKE5eou/leAvyA+ufg=;
 b=hKWE/vKOXzP2ytaGWNQxDVf2QFs0msnlnIgL9Xeqp6Dj3LPe/fX/AKf/nPGzf4GD0ZG6LIvV3ou4ONjdk/gSG89pBrk4Qa9oqTLKO74tH6a6oRSQG8MtH2xvZwZIIkI5F3P5jkhrBpdiUJC3S7+NOIjOxU4wXmTJBwGg+JlwJLntot7sqVdyc/AR9UXd/0mfEVIZ6s+GGaagGgf5TvTZjyWrzYGWa5WGq07K1EDDLTeQN8AbE8my4m6h8UNhX/VMMnvN4u5PFNZqNWGh7hIBKOebHK/ZlQ79oFmolPx/y4na2/EZw1uuGwmCAD2Ft1qQumJT7+z/fRkexXkn4SD15w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SN7PR11MB6701.namprd11.prod.outlook.com (2603:10b6:806:26b::11)
 by BN9PR11MB5372.namprd11.prod.outlook.com (2603:10b6:408:105::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.33; Tue, 25 Jul
 2023 23:21:03 +0000
Received: from SN7PR11MB6701.namprd11.prod.outlook.com
 ([fe80::6a71:c066:db13:7c91]) by SN7PR11MB6701.namprd11.prod.outlook.com
 ([fe80::6a71:c066:db13:7c91%7]) with mapi id 15.20.6609.026; Tue, 25 Jul 2023
 23:21:03 +0000
From: nicolas.marguet@windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] rsyslog: update from 8.2302.0 to 8.2306.0
Date: Tue, 25 Jul 2023 16:20:49 -0700
Message-Id: <20230725232049.396773-1-nicolas.marguet@windriver.com>
X-Mailer: git-send-email 2.39.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR05CA0106.namprd05.prod.outlook.com
 (2603:10b6:a03:e0::47) To SN7PR11MB6701.namprd11.prod.outlook.com
 (2603:10b6:806:26b::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB6701:EE_|BN9PR11MB5372:EE_
X-MS-Office365-Filtering-Correlation-Id: cf0d9ffb-b4e8-425a-55f7-08db8d65d095
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	v10vkKuxYfNYlQvVIRL5Tg9VvY8ym/TIknAOd2ZQGcQZsRKhe8v90jSKCypTqfddD+JizF64B5ZjyIG50Uxf2at2rX5dyYhUndlj9ENaGsiKfGqKe9/KF37x52Mlwz62jX7Bb95RzgqIZ7ywtABqWdOq7VHOasCuu0S2G0P/Hx99gl/eYaxM2FMa++PbUkD+Bi3rtTO/wmmp99KMqxahPM36grNGR+vxXE48nxH+4njE+rydAFPGnl86T7249YxLG+Tzx0IRIZdb9TlqSmcxMXnwpspEE64RMBjA4FYuRpSVoEZEu4blEIR6FypBLae0r7xYfatMYR5xJXlpKu8XIX5OzPN+GMUcnUqmURCsuFdZ/hDTi1PrlpWjS0v9IYYCFPyPZFiIxzeUOS2/mNhfV38JD2muIiG3uiI4wCeteoi8p/RDqRnVbImYTeD5dxf/6rQcCovbxE1rtw5GS8rDQ0rKNiQ3mcX8nEPyT4Og+fu7MeUVsH+zBTHASnGukPFjyPm0Sgt0jiLkVZ5E0EAzv/mUFyizv8tO1kCk33GT43kVtj7KZx8Bv67eDF4M5zMpvjmSEdJnfFMFFQcux+YwkTN9Q3CcpB4WNsa2KIyi8Mvezm8QlzPlW6a4YUiChy/6fWCVwgTcD6O5kIo8RxCrhw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB6701.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(39850400004)(346002)(366004)(376002)(136003)(451199021)(83380400001)(2906002)(6486002)(52116002)(6666004)(36756003)(38100700002)(38350700002)(86362001)(2616005)(5660300002)(186003)(41300700001)(8676002)(316002)(26005)(6506007)(8936002)(1076003)(6916009)(66556008)(6512007)(66946007)(66476007)(478600001)(9686003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?8GjuKmbtUXxERhaj8w8alkmwr5/ijjyyJ2jJ7qI0uYRvBq7u4coi+TvtPFZk?=
 =?us-ascii?Q?8ERdUSvMwugifQm+zWD88kh8DYZunoqmAHs1ftKL5ntCREgaWnuUIT2/t0Wj?=
 =?us-ascii?Q?E0gEGomIDZRNwh2EfcNVEKixsbi9XUPG0+fRF+4sAI1OJUREJ3Q4ImdWb5Fs?=
 =?us-ascii?Q?YWaZEnrE1pjCejYQKQbTd6xCf6vHVL09QGUu7+0AO+H0KSXa6mIDjSwGIpWl?=
 =?us-ascii?Q?cMi43W12iFe6DeO2X9mYswmGTPwHIdEN3kjr/CIwNQJ39PF659L47/3Q2gGy?=
 =?us-ascii?Q?vANOu1tr2WBihPGphhoPDjhM7+tYf2O9OP2nnW9gsQkOQKYV9Gpyl5bjOj/l?=
 =?us-ascii?Q?MVCP9YuUlk/8TnDufUQXc0qt2FfHGzQB4hzYL38Bb8AXxV4eotEpfZSAC7uu?=
 =?us-ascii?Q?zy6YawjbV19SWUg5Ma3ykj7xtC8TmIe6zO/rwAF9TTqi0brE2hcLt06FkyF7?=
 =?us-ascii?Q?rGsj8UPdj15esoBjvoqEXfhAZxGbzxqlZmbOSShZnliqoSwW+2X3giUJezGA?=
 =?us-ascii?Q?kJk6esvqK738RVOv+kF5SUfsajzt1scumaSW6ZOQWD8diQvblYU13jzZGXlK?=
 =?us-ascii?Q?CJbAAN6sP4kiMYtAP8HSyarMU+PjxpMT4ELHHvd0pEGcWIP7BnhyeweCC5ES?=
 =?us-ascii?Q?+Utoj57LkhTicszoEutNR0jWyOOvzaSqvSNTAKS3YOGXx6EwOIaf0hENZDpl?=
 =?us-ascii?Q?nnzWuFzKXoYwU0H/aTuKxIu2r6wCLXW56KhEOyAddyeZDPdMVmYIjHwSFVTa?=
 =?us-ascii?Q?IlDegus1tPqcFr6DWpz3sH+9EuJIh2npYXOU0umPYkFRUR0A1B1R1OOlN/EI?=
 =?us-ascii?Q?hLjV4Tm4BweIV5SOlA5geBzBLiAJj+IyFEbmuA90hgE6lKaxjv6UxFjFcGyE?=
 =?us-ascii?Q?4R0WdWkU43msOPxVVa/I4dtWN1Q5+tjP27cT6TuQ2mwgjUGAZcEZFDfPFlKO?=
 =?us-ascii?Q?56r0im9Gtc+PB+HShkw6d+u3ud3gbnkQKydMn1Z0j2hvkr/VjiHBUYIcwS/t?=
 =?us-ascii?Q?crgyUTBoBzUyYVZ3dKQ8xEx4fufH27sannoc+n3hFeEcPxLr35yniZkwwTPO?=
 =?us-ascii?Q?kb1GMEjFGIwAyOjSv05qf0pPxKLGTucu/cB+LD9pseLm6YAPCVjRlLnLAgnJ?=
 =?us-ascii?Q?ATkM0caALrqvRU/L9ZWVlqj1HjOPSDK737JD5DroKsOgQEVZL5QePtXNNdCy?=
 =?us-ascii?Q?2UfOf3INTu4n4OaXuhqpMM0gPl58TYXloUhv5mKyU/WX9wLUxNl7a+MAljJP?=
 =?us-ascii?Q?NF68jbQNYqsqvKocetU3XhN3pSB8y7va9YUP6Ml2O8hqvWpYxPz/NvaLFc/C?=
 =?us-ascii?Q?0jySVj5KsiP20wN7bZztXzrp08WyF43zPLBQjCUQ6MIbMLwRFsqu/7ljcZNp?=
 =?us-ascii?Q?s2EbT6A0s7nBkYWJsx2dvnKYIDVjYW9KjncK85PhuZcTMg4RDkLL/fX82D3a?=
 =?us-ascii?Q?+5KhftfDI0fU5I30wQn5L2YwdCKHwMFyfUL1UJkf/fLXrUl/UZM/UZx8LI5i?=
 =?us-ascii?Q?sR5qEyt54QNgEzqD0U5tYUKhnLRElLcrRN6rqhdrbL06vqjN4rGGvRHPhYJg?=
 =?us-ascii?Q?HLs+XfxAlSqrrUt6XVNop6B0LuCN2s6N3aesmBCjTqPyXj0qusWoQqD7zuvN?=
 =?us-ascii?Q?duCMu1oqSHxvOQGjCchQti8=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf0d9ffb-b4e8-425a-55f7-08db8d65d095
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6701.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2023 23:21:03.4716
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q5sZMLfUcfIlTarHIaZgeQPOW7XcC5YWZDoyVM/VgJ/82XeKjoPN+X4ShVvDkh7XAY9F+q20zvI+DOrRrxja3HI+l4nMQAbfeQVS661w6KA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5372
X-Proofpoint-ORIG-GUID: TIiyBRkgoHXu9Vj2r910jwVrE44Y8G9F
X-Proofpoint-GUID: TIiyBRkgoHXu9Vj2r910jwVrE44Y8G9F
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-25_12,2023-07-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 malwarescore=0
 bulkscore=0 phishscore=0 adultscore=0 mlxlogscore=882 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 mlxscore=0 suspectscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2306200000
 definitions=main-2307250198
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Jul 2023 23:21:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104028

From: Nicolas Marguet <nicolas.marguet@windriver.com>

ptest results for qemux86-64/kvm

   Version   | Passed | Failed | Skipped
    8.2302.0 | 471    |      0 |       5
    8.2306.0 | 472    |      0 |       5

Signed-off-by: Nicolas Marguet <nicolas.marguet@windriver.com>
---
 .../rsyslog/{rsyslog_8.2302.0.bb => rsyslog_8.2306.0.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-extended/rsyslog/{rsyslog_8.2302.0.bb => rsyslog_8.2306.0.bb} (97%)

diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog_8.2302.0.bb b/meta-oe/recipes-extended/rsyslog/rsyslog_8.2306.0.bb
similarity index 97%
rename from meta-oe/recipes-extended/rsyslog/rsyslog_8.2302.0.bb
rename to meta-oe/recipes-extended/rsyslog/rsyslog_8.2306.0.bb
index 39d9516d0..c639e8147 100644
--- a/meta-oe/recipes-extended/rsyslog/rsyslog_8.2302.0.bb
+++ b/meta-oe/recipes-extended/rsyslog/rsyslog_8.2306.0.bb
@@ -17,7 +17,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=51d9635e646fb75e1b74c074f788e973 \
                     file://COPYING.ASL20;md5=052f8a09206615ab07326ff8ce2d9d32\
 "
 
-SRC_URI = "http://www.rsyslog.com/download/files/download/rsyslog/${BPN}-${PV}.tar.gz \
+SRC_URI = "https://www.rsyslog.com/files/download/rsyslog/${BPN}-${PV}.tar.gz \
            file://initscript \
            file://rsyslog.conf \
            file://rsyslog.logrotate \
@@ -31,7 +31,7 @@ SRC_URI:append:libc-musl = " \
     file://0001-Include-sys-time-h.patch \
 "
 
-SRC_URI[sha256sum] = "25415f85b662615ce3c83077d53758029e8743cb5929044bfd3564e3d626a3b9"
+SRC_URI[sha256sum] = "f6283efaadc609540a56e6bec88a362c966e77f29fe48e6b734bd6c1123e0be5"
 
 UPSTREAM_CHECK_URI = "https://github.com/rsyslog/rsyslog/releases"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)"
-- 
2.39.0


