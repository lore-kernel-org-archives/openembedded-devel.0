Return-Path: <Saul.Wold@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE267C0502F
	for <webhook@archiver.kernel.org>; Mon, 29 Aug 2022 15:24:36 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.71588.1661786673218612369
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Aug 2022 08:24:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=KpHMfCc4;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=6240c2564e=saul.wold@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 27TActA7003662
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Aug 2022 15:24:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=F9fKiVjz3t08D0kMHv5uESgR18s9eNo8pJCEnv5LxCs=;
 b=KpHMfCc4/LbxO16b81WOJkJrOXuD84jHxp3Kandw1YGrlI7bh5EFnKHH7++u4VjWmH6M
 KSd8TetHMWOtBK4NFOIq8r0zaZcuM8TXkZiG4XVuxXncbZIcxZ7qTNi+RW0ecPlMa1Wn
 HqkVOfgusaqg2Wxq5/dUJwz8J1KlbeyZPybHnIYDALh6mE/sJAEAO/JL+fXJ2avQYiVs
 a5BDzSkhAKXtR4IZ8wwkog67xJSnjWiwTPTOaIy8iuO8M070x4fxXJsAv3FaMoPAY+l6
 0zn1E9lNmZ/XVIIq3mBrTPD5gEj1Cm8+5AydoDrzlmvKcGaXoUM4yY73oCkR1qxzQZsl sA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3j78g2hsw7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Aug 2022 15:24:32 +0000
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 27TFJeFK026042
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Aug 2022 15:24:32 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com
 (mail-sn1anam02lp2045.outbound.protection.outlook.com [104.47.57.45])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3j78g2hsw5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Aug 2022 15:24:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LcR8Y2z1QQ5ef1kXhC6+3i/3ZWdpWwM23p6a/CqR1DR4WiUcAeZdRwwgq0dGhItbgsgmUxAvyco3irtE6nf5z/OFKKGjVm2b2lK9ukDbim2wh76EKEeN/zfpQ2NZEkxYIlk0+uCJlf0Wn77GYfiL0kUWe/LnVU1t57e2BCtAz4RIcEafoAgl+ps5WlCs90NJwPT0dRrJVPWaxgtFW8o6mzMM1aIGtuOFejhIShamMuo1XQ/FHwKn3qX4zAgLPn8rYa3pNQN2vv60XTC+vfAlkiDbTLACaJshRJEA5/nvFGq/UOJGvu9l3WNaANzVVahgiBeRnZ6dZ3wwVj5tskjwZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F9fKiVjz3t08D0kMHv5uESgR18s9eNo8pJCEnv5LxCs=;
 b=fSp7d9I1NqnBljUhVxx1NSkzYiyXzu4lk2E9lymga1BsnbKB+6CYNPD7PrTnGFNT7JPN5tUu/r9rxlDUNIxKcaaoEIRvUyfsrmJGIY9AzDFW51+tLrvYXMVP1cVUFTSn23u8UGki8ifPO4V/9S7tkATJeccEcN9ypZ3oluLj2erYvMd63WwOOkRmeVJULZ7ibI2w+OasZhyW3q2gxxOqeYDrDVTa5dUnXinaRILIG3mUWTtPXmaofvC7dFjBfOYQAnTmw0DU+xwTedcMoeBmVv1uiPRPy5r40KRVVTAwJUXUIrN/IisEPbb81nB33JFP/I4VjPUxcXwsgmICVu4bEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB5818.namprd11.prod.outlook.com (2603:10b6:510:132::11)
 by BL0PR11MB2914.namprd11.prod.outlook.com (2603:10b6:208:77::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Mon, 29 Aug
 2022 15:24:30 +0000
Received: from PH7PR11MB5818.namprd11.prod.outlook.com
 ([fe80::d5f6:1024:58f3:d356]) by PH7PR11MB5818.namprd11.prod.outlook.com
 ([fe80::d5f6:1024:58f3:d356%5]) with mapi id 15.20.5566.021; Mon, 29 Aug 2022
 15:24:30 +0000
From: Saul Wold <saul.wold@windriver.com>
To: openembedded-devel@lists.openembedded.org, raj.khem@gmail.com
Subject: [kirkstone][oe][meta-perl 03/10] libio-socket-ssl-perl: Fix LICENSE
 string
Date: Mon, 29 Aug 2022 08:24:07 -0700
Message-Id: <20220829152414.1757540-4-saul.wold@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220829152414.1757540-1-saul.wold@windriver.com>
References: <20220829152414.1757540-1-saul.wold@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MW3PR05CA0030.namprd05.prod.outlook.com
 (2603:10b6:303:2b::35) To PH7PR11MB5818.namprd11.prod.outlook.com
 (2603:10b6:510:132::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a9f64c8b-bb49-4a38-4888-08da89d29135
X-MS-TrafficTypeDiagnostic: BL0PR11MB2914:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	xPfgCcuYrUuHO0KKDllxNo07Dzk1wPfAFJBq4FCS7g10AeSISNxLwjTm3WeOqUEV74mfHjOqNbroEPzEmyq2tqB48sEP5ayV9oh6G9ODI6POmpGToGrz21P0YD67cxZBoewo1gmnfHAw0NRFhHda5/UgpdPPauLll11kXMHoaxok82SKqIGtv9tWt/DYyJBeRGbFteq6Y3P1EUuUPszyxEuokB+sVnmUrpFAUOtW5ITC/5ZHDTriCyY7LXcQGZY+VecPYr0r0kChTDqkQfaggTGGMKCAQntZZLiyM8vCthapSPZSEdwo9aIXKgq5O+CqMIQf1jXulHoVXFRyI6llS/SDDSmXtTbPkviYyHIKtwh4i6PE9mFJFvXNOrTISak0PJYsgONtwdD6L2Ti9pvOxLU3WCY5zqJkQTbcTjtywiCKkbLkjpmhdrWysk5R1wa756JyqoeS5VQOXDMKgrzQh4IB89jGUPcmV4pZssiZhwhgKDBUMB2Im41ZiZQjUdZtQLZEJnredwcv5tmvHvjhMaaaqvnBhgC19dvFKnU+CR/FBbanwb4koMhuN8dUW3UpB49q4IzhkHzJqRYnc1a3WdgTa0P5st1JQSE4Nb23Yohh2yTEHfjSgajS3aag6RzGHh9wMlMZlfcxU+ja40iAxl3RttMA0GrvpM7CrkG3Hbk0MX0hhXnweQaGbXNQuqtvhcE5WCAqcQj/G7GRwuiohnjUXxAAf3NUSHx4oYo13jJAlP5x5th9f/AKadp1isyNVe9qwhvJXifI9nLR9gxVaQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB5818.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39840400004)(396003)(346002)(376002)(136003)(366004)(86362001)(38350700002)(6486002)(66476007)(66946007)(66556008)(8676002)(5660300002)(478600001)(38100700002)(41300700001)(8936002)(316002)(186003)(1076003)(2616005)(26005)(52116002)(83380400001)(2906002)(6512007)(6666004)(6506007)(4744005)(44832011)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?3XGyDT67PgRkOzWx3PYdItvSR7HojcBxYkUblABEqM2YcoP0xrtQrOyFe6Os?=
 =?us-ascii?Q?Ifv6h59hJ7EwhUhatbOOmiOpxQVk7KL5WDcAJiH999xSuNIjG+k8fXcv9qE+?=
 =?us-ascii?Q?tDfnNuxwadPApAaPsyBDos4Q1ZYsaeUf9AqITEUgRZ5FCicJLIc8h8k/3QUK?=
 =?us-ascii?Q?uj/iJiN/sCt5ioxYwLfJiLGyO4my+lVhBseSur7KC4ifPklLvn/xPoJaAWtu?=
 =?us-ascii?Q?FlVZAV/Y+8qXX6Lz71oT9qcm0W4PtitXesVeov8u2QwUVDlp0ENsbIcRDBu5?=
 =?us-ascii?Q?y5ORvUMONmgJa+G/nstBzh5hdBsUvhTGwaR2lI8Zi8trmghfr4/PbnscTiUQ?=
 =?us-ascii?Q?pMFM7pvFr0COXhlGNL6TN918E71pVKWNh7O8zJqVMe8F+6vjtakrJjUKHtZy?=
 =?us-ascii?Q?Hvks6DxSKcUNEV7dHeV6NsFrr765l5qHMRwDaJmaShADWuLPmnyXrdGH8xae?=
 =?us-ascii?Q?AK3Gvzx3QymH2JPx/F694FvlYq2nByg5hiVb225JzeW8I+P1WuznuESZrmIn?=
 =?us-ascii?Q?TVNhzpA6JGJH/UT0/rmQjIXi4SLKf4KfMG0rHSz+kTM8owZBCw+tsj5ysaHb?=
 =?us-ascii?Q?E4G6xdWrsO/K52li2T48fOROAFiYv7UT75gnZMWyqwuvyDbUk0efXEYYRmV0?=
 =?us-ascii?Q?xX75lhNvIh8ywHNoMd0K4gqFGCppbLbQmI65ocEGc5CVGrxuJF0CC+8TqBpb?=
 =?us-ascii?Q?rU5iTNDCyHoAKQUUwXWrFcSg8mLf2H8/OGZ8Od0n4R7GiB1h87uxpFD3gnEs?=
 =?us-ascii?Q?mrOKeyUeTwTI78eaGA3zTUjDhtG5UfP2fBeDxIRCbBlpRr/GzImcZnvJ7B9K?=
 =?us-ascii?Q?ZqmxMYsvo9f5oQgdroRVq6HBKcbVAzI08pcszRuNeTP4W5IO9dLi2E81imEn?=
 =?us-ascii?Q?6nX74ZvXWfQt521kM7HTZ0zaBtnQzGnBcszHBZ7drbo3Hopvy2n+z9yYVxvu?=
 =?us-ascii?Q?UEf8ZODtVJMZR+Yaijzksi/EH9Tu1V3bisQmytA1gla0HSIk89unORZHV0+x?=
 =?us-ascii?Q?xEBwAk3i3g7CCfWne4erUACWIqv+msppoFGx1WGx/UVVnDMManBLIYnCxP1f?=
 =?us-ascii?Q?sKNc4d+AKmsDmXJoz8ISGn7b2Ijpx4jdpA0Y4dnag1rSjU0SiE79bfNgnol4?=
 =?us-ascii?Q?FBmU4cokd0s1x498vyZMGpbkAmoGvyRH8AD05XvjZ8qp/PeIFo9UpW1Rora0?=
 =?us-ascii?Q?GRokzOc/Fc1xJvaWq0KAvqr4p6KRfrWOiipOXaJHW+LSSqiTS8jPztoWa2hD?=
 =?us-ascii?Q?XFZ0VHcDMU0s5/nMiexlfJau/ApvSbo8YwqpyGnRUoknOy6Hgv4HCu9T0C0V?=
 =?us-ascii?Q?vUPym50DsHMBg9LWxf8SEPDJerw8Ro/sxlm7Akm8rNIDciHKAoNxsRicRTJC?=
 =?us-ascii?Q?yt8ZGESjrbnx6/c0qPQjr5Yx+hA+nGcnwYJc16XSzJRc2tqyLz0Mkr3dxV7/?=
 =?us-ascii?Q?s5jc+uHhh2dWBUNjB0xieJBnl8lnlURBMICYW3hYu2umNaF+AbPvZJ2qNuyz?=
 =?us-ascii?Q?5HSR3pHKUhtDwVKGcGJNr6GNz9bweERNDvx4OahpGxCBtrI5Fi4dtyEnFZKm?=
 =?us-ascii?Q?cFsxpq1Sq9hVl/Tij74WIhPvgElmp01BNo/Mwp4NBZ1sY99dGMyUxIRxggUW?=
 =?us-ascii?Q?ZA=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 a9f64c8b-bb49-4a38-4888-08da89d29135
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB5818.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2022 15:24:30.1171
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 eYTz/hHugi/NzkU8RVfYaJ7W2JCKYAQnvDdOteGWcqU57b83IB4v9yuNdeiVt5fQYFiRCXUY+A/4pPlkxr0LzQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR11MB2914
X-Proofpoint-ORIG-GUID: zbLRhjns4nCURoLgKFHkgf_tTNp00_IY
X-Proofpoint-GUID: 96b-XbRPL-g2QiZ782s6MxuSYHopLFNA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-29_07,2022-08-25_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 mlxscore=0 mlxlogscore=999 lowpriorityscore=0 adultscore=0 impostorscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208290072
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 29 Aug 2022 15:24:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98527

The create_spdx bbclass does not currently handle the lack of
spaces around the op (| or &). For now fix the LICENSE string.

Signed-off-by: Saul Wold <saul.wold@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.074.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.074.bb b/meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.074.bb
index 1d04f0054..6249fd1d7 100644
--- a/meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.074.bb
+++ b/meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.074.bb
@@ -9,7 +9,7 @@ mod_perl."
 HOMEPAGE = "http://search.cpan.org/dist/IO-Socket-SSL/"
 SECTION = "libs"
 
-LICENSE = "Artistic-1.0|GPL-1.0-or-later"
+LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
 LIC_FILES_CHKSUM = "file://META.yml;beginline=12;endline=12;md5=963ce28228347875ace682de56eef8e8"
 
 RDEPENDS:${PN} += "\
-- 
2.32.0


