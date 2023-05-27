Return-Path: <schitrod@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 445CEC77B7A
	for <webhook@archiver.kernel.org>; Sat, 27 May 2023 03:10:58 +0000 (UTC)
Received: from rcdn-iport-5.cisco.com (rcdn-iport-5.cisco.com [173.37.86.76])
 by mx.groups.io with SMTP id smtpd.web10.4322.1685157054834198746
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 26 May 2023 20:10:55 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@cisco.com header.s=iport header.b=JF0nE3Im;
 spf=pass (domain: cisco.com, ip: 173.37.86.76, mailfrom: schitrod@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=1566; q=dns/txt; s=iport;
  t=1685157054; x=1686366654;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=qQ0ITeuWWLvQmn3juoZ59ATUshcTfSqBOWC7gA2T6yw=;
  b=JF0nE3ImZWYdCOx3RlbZMp2YOyjtufKwFoD0mKdICwFlBEt/iDEww5X1
   YXCgV4WwHsu4qP4VMBxpdiIA6m4SiTEGfreR5kwGOct0SX3XvHTY6VRJC
   LlkUFWZgBJl5bX8TtsF3wR6AKgTIDe5eEBStMxhL575alQxkx/Y7F4kd4
   0=;
X-IPAS-Result: =?us-ascii?q?A0CFAQCVc3FkmJxdJa1aHgEBCxIMQCWBHwuBXVJzAlg9G?=
 =?us-ascii?q?i2IIItKgieLUJIXgSUDVg8BAQENAQEuBw8EAQGFBgKFXAIlNAkOAQICAgEBA?=
 =?us-ascii?q?QEDAgMBAQEBAQEDAQEFAQEBAgEHBBQBAQEBAQEBAR4ZBQ4QJ4VoDYYEAQEBA?=
 =?us-ascii?q?QMBESgGAQEJAS4LBAIBCBEEAQEfECEHCh0IAgQBEggaglwBgigDMQMBoFMBg?=
 =?us-ascii?q?T8CiiR4gTSBAYIIAQEGBAVrHwExA5sRDYJJCYFCh1SFJxuESCcbQIFNgViCa?=
 =?us-ascii?q?D6CIEICA4FfhBKCLo5ZhAuJK4EwcoEjgSiBAgIJAhFngQ4IZ3t5QAINVgsLZ?=
 =?us-ascii?q?YEmVT6BTQICET4QBVV9EgETAwcEAoEIEC8HBDMJFwkGCRkxJwZWBy0kCRMVR?=
 =?us-ascii?q?AeEBAMKgSkjNwNEHUADC3U9NQYOHwUEIwFLgVgEL0KBGQIESZx2gwKBDoFEg?=
 =?us-ascii?q?SWhfqFOcAong2GLe40agXmGJxeDf4FWixSYZ5gOIIIvjn2WPQIEAgQFAg4BB?=
 =?us-ascii?q?4FjOoFbcBWDIglJGQ+OIBmDW4UUimVDMjsCBwsBAQMJi0YBAQ?=
IronPort-PHdr: A9a23:piewTh/3fwgRgv9uWO3oyV9kXcBvk6//MghQ7YIolPcUNK+i5J/le
 kfY4KYlgFzIWNDD4ulfw6rNsq/mUHAd+5vJrn0YcZJNWhNEwcUblgAtGoiEXGXwLeXhaGoxG
 8ERHER98SSDOFNOUN37e0WUp3Sz6TAIHRCqLgF1J/jvHYL6hMWs3Of08JrWME1EgTOnauZqJ
 Q6t5UXJ49ALiJFrLLowzBaBrnpTLuJRw24pbV7GlBfn7cD295lmmxk=
IronPort-Data: A9a23:dqqcoKPTAi+VWQ7vrR2gl8FynXyQoLVcMsEvi/4bfWQNrUom32QPm
 2VOUD3Ub/uNYDP0Kox0bY3jpkkPv5LXyYcxSnM5pCpnJ55oRWUpJjg4wmPYZX76whjrFRo/h
 ykmQoCcaphyFBcwnz/1WlTbhSEUOZqgGPykUIYoBggrHVU/EHp710o48wIEqtcAbeaRUlvlV
 eza+6UzCHf9s9KjGjtJg04rgEoHUMXa4Fv0jHRnDRx4lAO2e00uMX4qDfrZw00U7WVjNrXSq
 +7rlNlV945ClvsnIovNfr3TKiXmTlNOVOSDoiI+ZkSsvvRNjgAN0PofO/A7UmtWtxqglYxX7
 4gcupPlHG/FPoWU8AgcewNTHyc7Nqpc9fqaZ3O+qseUiUbBdhMAwd03UxpwZtJeq70xWDwQn
 RAbAGhlghSrnOm2wa6hTeVEjcU4J86tN4Qa0p1l5W+CUK19HcqbK0nMze9a4RkopOtUJ6fxZ
 tYIbxxTR1PuYTQabz/7D7pnzLv32RETaQZwr0qYo6cy6WXfwAF9lbTgLtfRUtiLXtlO2EGAq
 2TL+m70Dh0XOJqY0zXtz563rvXEkSW+U4UIGfjlsPVrm1aUgGcUDXX6SGdXv9GVtUzif91VD
 Hc4+xYBhKJu0mv2H9byCkjQTGG/gjYQXN9ZEusf4Q6Ly7bJ7wvxOoTiZmMfADDBnJJuLQHGx
 mNljPuyWmMy6Oz9pWa1s+bL/WnraED5OEdbPXdcJTbp9eUPt23as/4iZsxoHKjwhdrvFHSth
 TuLtyM5wb4UiKbnNplXH3ia31pARbCQHmbZAzk7uEr5tmuVg6b+POSVBaDzt6ooEWpgZgDpU
 II4s8af9vsSKpqGiTaARu4AdJnwuabYaWeB0QU3RsR5n9hIx5JFVd4IiN2ZDBo3WvvohReyC
 KMukVoLvcQKbCfCgVFfMtLsYyjV8UQQPY21Cq+LBja/SpNwbwSAtDp/flKd2nuFraTfuf9XB
 HtvSu71VSxyIf0+lFKeHr5BuZd1nXpW7T2IGvjGI+GPjOD2iIi9E+lVaTNjr4kRscu5neki2
 4YFaZrSm0gCC4UToED/qOYuELzDFlBibbjeoM1MfenFKQ1jcFzNwdeIqV/9U+SJR5hoq9o=
IronPort-HdrOrdr: A9a23:Y6fVc6NOW+9RAsBcT2f155DYdb4zR+YMi2TDiHoedfUFSKOlfp
 6V8MjzjSWE9Ar5OEtLpTnyAtj+fZq6z+843WBxB8buYOCCggqVxe5ZnPLfK7OLIVyHygcw79
 YDT0E6MqyMMbEYt7e03ODbKada/DDvysnB7oeurEuFDzsaEZ2IhD0JbjpzZ3cGIjWucqBJc6
 Z0iPA3wgZIf057Uu2LQl0+G8TTrdzCk5zrJTQcAQQ81QWIhTS0rJbnDhmxxH4lInJy6IZn1V
 KAvx3y562lvf3+4ATbzXXv45Nfn8ak4sdfBfaLltMeJlzX+0aVjcVaKv6/VQIO0aSSAWUR4Z
 3xStAbToNOAkbqDyOISN3Wqk/dOXgVmibfIBSj8AreSITCNUIHIvsEoY5fbxve7FBIhqAD7E
 sM5RPWi3KSZimwxxgUILPzJklXv1vxrnw4neEJiXtDFYMYdb9KtIQauFhYCZEaAUvBmcga+c
 RVfbfhDcxtABqnRmGcunMqzM2nX3w1EBvDSk8eutaN2zwTmHxi1UMXyMEWg39FrfsGOtN5zv
 WBNr4tmKBFT8cQY644DOAdQdGvAmiIRR7XKmqdLVnuCalCMXPQrJz85qkz+YiRCdc15Yp3nI
 6EXEJTtGY0dU6rAcqS3IdT+hSIW2m5VSSF8LAo23G4gMyJeFPGC1z3dLl1qbrSnxw2OLyoZ8
 qO
X-Talos-CUID: 9a23:/MFEtG2EM1tNexgkZfMKdrxfNv8nLlnSxlDrD06EJk9jFJuyFA6f9/Yx
X-Talos-MUID: 9a23:jNfVJQai5D6AVOBThz3RqilAH91SsouvFFELt6kt/OeGHHkl
X-IronPort-Anti-Spam-Filtered: true
Received: from rcdn-core-5.cisco.com ([173.37.93.156])
  by rcdn-iport-5.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 27 May 2023 03:10:53 +0000
Received: from rcdn-opgw-2.cisco.com (rcdn-opgw-2.cisco.com [72.163.7.163])
	by rcdn-core-5.cisco.com (8.15.2/8.15.2) with ESMTPS id 34R3Artv013621
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-devel@lists.openembedded.org>; Sat, 27 May 2023 03:10:53 GMT
Authentication-Results: rcdn-opgw-2.cisco.com; dkim=pass (signature verified) header.i=@cisco.com; spf=Pass smtp.mailfrom=schitrod@cisco.com; dmarc=pass (p=quarantine dis=none) d=cisco.com
X-IronPort-AV: E=Sophos;i="6.00,195,1681171200"; 
   d="scan'";a="2000814"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F/OHSADj4kA5Bns0ZxnDOHMygWPg65/io882KcaK+WeZ1NC6ltq/gdPb46P3aEBu5Ns/sUOsNfw9pLQXqg6Cto+vsr4pLCaEnDDZr3+Bmju18U4mOOUtSjB1N3+Pu/0GKBIMonGwbYs5MiL7U2MxB9DLK1+K5qA/InV6gKkxhkSYpr5PW9pmIAyWTPUgrhS3Jb+hfNh8qwafPPDtFBxb87wO58kWlG23wWHhsUKvFHHxHi9rCRHzFti/y4wlPVqRC8jnacWPs5c0vDfKcM6ibgj6s/Ean+A7EnVla8bNgU2gRtCM7j8czKIox4BMKtKvfZHInt/QyAKESEDtcPWmyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rY1+pOV3jGuhpMfDQqzE6xbZxLMxhV0lUPwle2Jq5+U=;
 b=X54i4B1bK1S/5EAZwOO0ggXOkzZFaBf2VIu9m1N6t+gpCnMBz1vISVq1QKfOHsfVlru9ztXAxuiHeJFiQxZEodI40BNMgwpA8g4mLBwfhWY2QuX8W3ECCk/tkeAOHjSFejTGpRWQwqA9zGf86ei8imZmCO2Re8KpeZcyH+uvStBe2dSjoyEoe76DUFecMtdwc6a3E+3IuK1nxkJKLNX7/lRTVV95swMluon4I7pvBIZ5eIPPAw2Rwunk9f2XMpF9zcb4bM4WpU22vSnOwRIAbwUbRuqWDj54T/UWSV+qvrK7X24KKC9cLi2Yz10ysLEMlSi1xW5SNcOY8CHW1vr+8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com;
 dkim=pass header.d=cisco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cisco.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rY1+pOV3jGuhpMfDQqzE6xbZxLMxhV0lUPwle2Jq5+U=;
 b=ggpaeRjCrSQJasPCzOZzjDat968TqqTut0ztmNrmyNrzCB1zJVUI8BqzF2GTDyK8KTXZz6pAlm1YajRW51LnA0wHwTU/OqwuG9uowjiwHFoSxrD1MZJcsF9sJ3ib3Uu4DsFwSboJa1g3W4INXVow/cMbssB4VHe69HtNbJF7zUU=
Received: from SJ0PR11MB6717.namprd11.prod.outlook.com (2603:10b6:a03:44f::9)
 by SJ2PR11MB8538.namprd11.prod.outlook.com (2603:10b6:a03:578::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.17; Sat, 27 May
 2023 03:10:51 +0000
Received: from SJ0PR11MB6717.namprd11.prod.outlook.com
 ([fe80::2ddb:3ab6:484a:673a]) by SJ0PR11MB6717.namprd11.prod.outlook.com
 ([fe80::2ddb:3ab6:484a:673a%6]) with mapi id 15.20.6411.028; Sat, 27 May 2023
 03:10:51 +0000
From: "Sanjaykumar kantibhai Chitroda -X (schitrod - E-INFO CHIPS INC at
 Cisco)" <schitrod@cisco.com>
To: "Sanjaykumar kantibhai Chitroda -X (schitrod - E-INFO CHIPS INC at Cisco)"
	<schitrod@cisco.com>,
        "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>,
        "raj.khem@gmail.com"
	<raj.khem@gmail.com>
Subject: RE: [oe] [meta-oe][PATCH] gnulib: Update recipe name to 2018-12-18
Thread-Topic: [oe] [meta-oe][PATCH] gnulib: Update recipe name to 2018-12-18
Thread-Index: AQHZihKB1ysHKPQM9UydKWywjPnOeK9te48g
Date: Sat, 27 May 2023 03:10:21 +0000
Deferred-Delivery: Sat, 27 May 2023 03:10:05 +0000
Message-ID: 
 <SJ0PR11MB6717215C1B92036799E1AC2EDC449@SJ0PR11MB6717.namprd11.prod.outlook.com>
References: <1760742CFB0AAE9D.26337@lists.openembedded.org>
In-Reply-To: <1760742CFB0AAE9D.26337@lists.openembedded.org>
Accept-Language: en-US
Content-Language: en-US
X-Mentions: raj.khem@gmail.com
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR11MB6717:EE_|SJ2PR11MB8538:EE_
x-ms-office365-filtering-correlation-id: 791c14c5-ec8e-49a6-c4e5-08db5e5ff976
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 3pxYlDDwM0R/Fl7TKQ3iO9sncU1UgG9xBnpkjuGfTGMtlu5f6z+0trrC52DHMai3DzELA0zIImFdNldQ8Yk3E+pfWgmuAlQp8/CjHm3j+4bg6GwATqHW6OnH/4jR6EVsc65yART+VxBf7+cEybgEzYc/oCXlKaWL5HK7kNGM1V/K9vvDiSw0SeKjoMhYgXVFc/OPdKzmM12PfZkYAJfk152K55US71Y2V4jZ+ym+A4U629KLK5cSCWuJvvbv9KQqkCKiiFme0igzfPCGJSV5VorrWz6E4M1SvYRO+DIw0jlcZWUM8mzJW1tqTvI0iNHWdmyCMYJstUmEBXDMnw9R9gGhAcDXhh0uTxVJR5Z5YqCIu5cLq1i5avF7kbtGho7jLcr8uSrL9Arbf7Ly4w4k75vayPPqS40qMo3G4e8YFnLDrVPnB/uuN1QV/VheDm8eQFoCPdTOoFhyNroCg6rEy1rMpE8G9f6Dwf+TLhMM01AFiUvhZLVvRA7CW/MDUQXT2d2nuygdX1Az5OcJsBaQdEDJPRp4pbcPdPhZBcy3fHGM6rFv5NhyPmLjzGu8YCo2VMQYWj1/UAsg7HLE6m2g4LlkAEGs+jQOABh99SH2IBdF4mafsw+BH8ciIhd6kQ8/
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB6717.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(39860400002)(346002)(396003)(376002)(136003)(451199021)(76116006)(66946007)(66476007)(64756008)(66556008)(478600001)(66446008)(110136005)(316002)(38070700005)(33656002)(86362001)(83380400001)(186003)(9686003)(6506007)(41300700001)(15650500001)(52536014)(4001150100001)(2906002)(8676002)(8936002)(71200400001)(55016003)(7696005)(6666004)(122000001)(5660300002)(38100700002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?9+wXRDGVZ0pa3ngjvEMteWLMmnVQUg4soWJSAibthDAH8X9OJ5QSAdY5ujgs?=
 =?us-ascii?Q?UB7en9wK5gAcpyhn6qg9+l2jmQBmcTS3U1xbeJ+1RtpaEKhXlihBghKJGCCs?=
 =?us-ascii?Q?muSXW4BFB2dGpNQjqUa9a728K0TySzk6pEbZzVMBxm6O3m8KC1j2OCxdZZwY?=
 =?us-ascii?Q?fwWTa8cUcrEzbM25VB1aR/EChSExC/vgq9hjBw/iq1EHqwR4DP31uU+AbYjW?=
 =?us-ascii?Q?pxVyMri/Ifi33NZV+VK/y/Hd+6pmYeXwLyLdmI777KsI2cL7a0J8gypkdV3K?=
 =?us-ascii?Q?vXJnraZr+3UAloEYRB54a20kBtVQBqmn5NwKG0sm7Qqb6Z5TDiDrB6rwCi0Y?=
 =?us-ascii?Q?Xej9wRMY/qqixG9DRQkANO3c1z50R5gdZh9i9RAgTQb0W3MULx2m/7TOeeNI?=
 =?us-ascii?Q?0N+cukfpDa+z2qlVoYEL/G1fHGnA2X5lr9z3etAn4UCmcwg7ydxnNns+DTSx?=
 =?us-ascii?Q?Dz6CUjfQ+Jk498f2katK8eFuF0Y1dPRd/OLIL6zKnUz2aI6i4ke5OQrOJ+Ek?=
 =?us-ascii?Q?rWxUpUowAk+lOAPcO4ZbiXECu8mx1QK0stNRLo5vssDPY2JzXb4cIApy+P8m?=
 =?us-ascii?Q?CqgueF15bA5GmTXR/02cLrGyCoTObwmR5RHpS0czNi9EZtuFehfmS9ayQusB?=
 =?us-ascii?Q?8/EW02WRsQa/HzLFRukzKSPq2Up0+l5nX3NsYDJF+/YvK8VWtd8UrhEgilys?=
 =?us-ascii?Q?R6V88ngiBOGKkaVaZGqOYQnJRHHrabA9XiH0B/1mdI9Rt1maFyBrc/xHHVon?=
 =?us-ascii?Q?q9ALE+1rxX82LBYxRNEdPuD39zXgG5MpIzpV8jjk0I+nX93LCZY+W9sCV0w/?=
 =?us-ascii?Q?xqfy5NdeHCeicpb4yagYaYMyZ3+Lkf0LosG4bX8iiQ00z1DflYQEp3iYKHis?=
 =?us-ascii?Q?oD4PRgADB7R9PEhqJtRDfHLk4SfScgrqGYkXfaZ09BxnZ80NiSGY51i9acui?=
 =?us-ascii?Q?c/YuRZl0uCiI1fw0GB20oMBP1+MqkKbfwCI7oGAgoD8yQjDusuSRI68nzDAU?=
 =?us-ascii?Q?O1RQ9FKUyWhpdG236OOOP0HIrRAhT8GreEQfEk/EtCgZjsG9LbUd/nIS/xUq?=
 =?us-ascii?Q?7LdfwIDwfQW2qe9PzhCuOKJ2AEhOXT4qleVDnytrdnOprT5COAlgV/vAkDPh?=
 =?us-ascii?Q?frNLSVRAu2dF2Jat3dSuLzxGNprm0p+A6Sr1MxdgUZ/JM1owQY+PTacgHiIn?=
 =?us-ascii?Q?Gcx9v4DFE2gRuYQ24sq0t/Ad9KVZhJEV/AGGvxGzzn9xk5TOFx7x489WhbLw?=
 =?us-ascii?Q?C11kx03Zc54J2La6X/p5SGup2/w3NBAzuUUKC/5nueocLCjOnnR0x01Sn8cN?=
 =?us-ascii?Q?q9u1odLwvhhBBSPN+zik0ESzzlQJeCMF+96clPyybVZMVuwRQpm6YoTp5USK?=
 =?us-ascii?Q?XWKcIpGk5TN3MT6HqYnuQj8dhEJ/GJzD0VUnKieCqxZ2BUOdtUC3sPto/kxE?=
 =?us-ascii?Q?nyJDpTks+GYCy7sACDT0BtyrtjT1ecGEGNrxrurifT+FPv1gkztPKTimL+HM?=
 =?us-ascii?Q?yAxDgpXeW8NlclgF2JCSCcvnFOjy6lnODHRGTh6QF0/YyQSco0i/IDM0QBG/?=
 =?us-ascii?Q?zjN+OZMK7RA8CjnPh8rFEG7VN7i3XOGMlU/2ALohqZNBlidtjWR9ms1Wjkiw?=
 =?us-ascii?Q?PQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: cisco.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB6717.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 791c14c5-ec8e-49a6-c4e5-08db5e5ff976
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 May 2023 03:10:50.2973
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: J2vHHqJixkCycdn/2S7/Wv3LrjT6vMG1vvhjK3hSuJUwRxsEL7VdJBX6/41GuvlKmAKUCuz1nbzLCJDfTYI/ag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8538
X-Outbound-SMTP-Client: 72.163.7.163, rcdn-opgw-2.cisco.com
X-Outbound-Node: rcdn-core-5.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 27 May 2023 03:10:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102879

Hi all,

Any update/comment ?
@raj.khem@gmail.com can you please guide me on how to procced further ?

Thanks,
Sanjay

-----Original Message-----
From: openembedded-devel@lists.openembedded.org <openembedded-devel@lists.o=
penembedded.org> On Behalf Of Sanjaykumar kantibhai Chitroda -X (schitrod -=
 E-INFO CHIPS INC at Cisco) via lists.openembedded.org
Sent: Friday, May 19, 2023 10:56 AM
To: openembedded-devel@lists.openembedded.org
Cc: Sanjaykumar kantibhai Chitroda -X (schitrod - E-INFO CHIPS INC at Cisco=
) <schitrod@cisco.com>
Subject: [oe] [meta-oe][PATCH] gnulib: Update recipe name to 2018-12-18

As per gnulib_2018-03-07 recipe information, SRCREV =3D "0d6e3307bbdb8df4d5=
6043d5f373eeeffe4cbef3"
This revision was committed on "2018-12-18".

There is a discrepancy between SRCREV and the recipe version.
Which reports "CVE-2018-17942" as unpatched.

To report "CVE-2018-17942" as patched,
We need to align a recipe name with SRCREV commit date.

Signed-off-by: Sanjay Chitroda <schitrod@cisco.com>
---
 .../gnulib/{gnulib_2018-03-07.03.bb =3D> gnulib_2018-12-18.bb}      | 0
 1 file changed, 0 insertions(+), 0 deletions(-)  rename meta-oe/recipes-su=
pport/gnulib/{gnulib_2018-03-07.03.bb =3D> gnulib_2018-12-18.bb} (100%)

diff --git a/meta-oe/recipes-support/gnulib/gnulib_2018-03-07.03.bb b/meta-=
oe/recipes-support/gnulib/gnulib_2018-12-18.bb
similarity index 100%
rename from meta-oe/recipes-support/gnulib/gnulib_2018-03-07.03.bb
rename to meta-oe/recipes-support/gnulib/gnulib_2018-12-18.bb
--
2.35.6


