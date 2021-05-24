Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web09.24732.1621870179378062032
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 24 May 2021 08:29:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=piEy/YfF;
 spf=pass (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=0778c2e939=saul.wold@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 14OFB5lW011856;
	Mon, 24 May 2021 15:29:38 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2109.outbound.protection.outlook.com [104.47.55.109])
	by mx0a-0064b401.pphosted.com with ESMTP id 38qjghrtu2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 May 2021 15:29:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=juVzFxLzts/mAsUL8fdjo+HIEfftF8x3vhfuBDRO5PWM3CkvZFdFMiYCI3ddQy3vm+xFL5NMVLMAScu92j8kMIB45cDyVjNXkWWnH85ThCv4hqALtYcFkyau+06hT5U6scX1p203YNAG9B12FSZoHfDT6t1c/EvV20bMnN9KQSC8G/3JNAJBxw2BOB8DA3UdrAeT7zPbfZkbK78kyARwrBgA/wcGIS9SL0jkH+SCXIcyVZONLJTRkNQv9T7Mh/LrdUNz487Ngnyc8Fc2/nqNE1kcnBHBXFSgsHvAHmRe6rWhwHohsJk2aWYXHccGNXH7KaXDKuxgCONCz2/7YX4iOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LzY6ywClmNpeqKY9DTlrQOT6W85qo80YfOhg+Pz2QmI=;
 b=mp5vw2AIfhg9kD/alvJCV4fOf99o8i0XHX8bWXTxJPOtVhb5BUS4MbyslTQlaEC1zwyP68h1xLK2kPu7/WVy1uebWjBlWvphsCnxcmHg4f0lKQHG5QQuGjJXQmqOgslmaTC21zOgDyGtcWp0q7SBaJMVyc/tJuKmpTMWfFrT4J3wAqzAQB9HveleZUo0EExgS6VwLcB8pGBMX2UvE4YRS+qSJ6Xrogu3JUETAS1q5gkJa1aUIVrkCVexrILhlyA7qnnRFN+soNCJz9ww4ztFL+Rmff8lTJ/W/P7MqV5wdjxtpp+38kj8eoeD3H85LOKk4f6aic7Im791je6DS57m1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LzY6ywClmNpeqKY9DTlrQOT6W85qo80YfOhg+Pz2QmI=;
 b=piEy/YfFcp1nC+ifqsCevH1xpdarmExE8JF078viKaWQe63+MSePjNpAzs+mLfTkpYGc243rXomMEw+zle/5oPoAi1O+NFQ+QDAiW0fIliSvyLtS+C0Svvr/kSlI2FG89VOSE4Rp0o4zSV3ZWeSxbVX2knk1EpwMdKTAQp22L+Q=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CO1PR11MB5076.namprd11.prod.outlook.com (2603:10b6:303:90::7)
 by CO1PR11MB5073.namprd11.prod.outlook.com (2603:10b6:303:92::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.23; Mon, 24 May
 2021 15:29:34 +0000
Received: from CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::fda5:ca87:9468:ad8]) by CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::fda5:ca87:9468:ad8%8]) with mapi id 15.20.4150.027; Mon, 24 May 2021
 15:29:34 +0000
From: "Saul Wold" <Saul.Wold@windriver.com>
To: openembedded-devel@lists.openembedded.org, akuster808@gmail.com
Cc: Saul Wold <Saul.Wold@windriver.com>, Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][hardknott 1/2] opencv: remove tbb packageconfig for powerpc
Date: Mon, 24 May 2021 08:29:22 -0700
Message-Id: <20210524152923.3299258-1-saul.wold@windriver.com>
X-Mailer: git-send-email 2.25.1
X-Originating-IP: [71.238.119.71]
X-ClientProxiedBy: MW4PR03CA0123.namprd03.prod.outlook.com
 (2603:10b6:303:8c::8) To CO1PR11MB5076.namprd11.prod.outlook.com
 (2603:10b6:303:90::7)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from yocto-hs.bigsur.com.bigsur.com (71.238.119.71) by MW4PR03CA0123.namprd03.prod.outlook.com (2603:10b6:303:8c::8) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.26 via Frontend Transport; Mon, 24 May 2021 15:29:34 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0fd0423e-65d4-4c78-eb51-08d91ec8bbb7
X-MS-TrafficTypeDiagnostic: CO1PR11MB5073:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<CO1PR11MB507346C17CC6E82EA9AD5328EE269@CO1PR11MB5073.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:935;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Ye53dcjMUE4h3YKzwYBVVUsMKdK3uidHYVCuk9Tgl33Wdjdm5i5gqsK73/94YGFTPsyJh3awpyxoScnJag+igavlF23IvjvJz8QGO4eVKxdOunCt64xWHcgNl8xuYVBU7Q7XWn8tV9pXa8cv/1uUYIAz+X39z8INVV+dfqxL++2ZiBDqQTMddFh2qbTZf4tWnhfbt5KnT1tveNzJBCi8pQD+ghkaCvu8/O1h6ai4C8WXCg+VSPeoJhR5ARBGr4I2sv8hO7pM24rMYiEsOPsbFrfZaqbKcaWgKIKs+ZA/vO01Kn6FovGKyG/UcCrg0GKRlwQuc7pCMWUP8Jt6N/XWhiPjo6+5uKHoP7NkWXuu3zj0eBBamemZJTkg1z6F7cChdPwHU0rwx2GHR+9wCN+iqbQoydLnALDDA01I61IzfjqZ5ELj4DYS15I9gMdcUaHY0xtPq9AKpZ7Pt0NRC0kYCk7jccOX9OIETE0XDwLW3C6K4wcuod5ErxLoeisVYSShnjfzB/zdOR2WXYwLarM8riOD5hHku7VpDLulUbSuQQ8bA58g9cBk49athpU393CzpRCm7CR+wQp9d/va6Tj7nQrBe5J1Fc5r2ce8AB7vu5HUYK4UgV58ZLKn1X3uQdxkQRs6pSc6t/tinxGsJqkX7w==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5076.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(39850400004)(366004)(346002)(376002)(396003)(26005)(16526019)(478600001)(186003)(4326008)(52116002)(6506007)(38100700002)(38350700002)(6486002)(2616005)(8676002)(956004)(316002)(66556008)(5660300002)(1076003)(86362001)(44832011)(66946007)(2906002)(6666004)(6512007)(8936002)(66476007)(36756003)(54906003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?uMfV4P41R8/ApL9PXIH5CictANUzdSBYln3N5JV3zRrq+/S66ydzP4W6dly/?=
 =?us-ascii?Q?U18sbujEpyJCYV63yLcexvo+gYuVAP45oX4ZVcbB50M1wVvl1WwQ9k7m9Fm7?=
 =?us-ascii?Q?P9fVuJgSJ0Q2JLA8VPW+nP8OsaHsNdzoDHXjqvaft84KC7pF6KYbdzVOGUXp?=
 =?us-ascii?Q?cdUvLzbnr5QXfzz3Hv5ta2/JDx+Gl1ELB0CQL7rzm/XlMEXssNRhU6BHxd0f?=
 =?us-ascii?Q?W34TJLKBqzbK9uF0X5Zo5fquUjBiypjgv5iVczwRo+He7StCnVpA5IAI4QyC?=
 =?us-ascii?Q?3qaSLCtKVexY3/Jm/ilzp3d4dnX0zzyGZ1ApYnB+Rw58olIZb0oiRYSgFdXs?=
 =?us-ascii?Q?2GCemrYLd7snLRM7ae7a2vrN3OiiqGzmQWdFxyEFUZ5Y9oHNVN0V3q8AUZqQ?=
 =?us-ascii?Q?hNV5YTGEX4qqy9tIVUIJkqo6IQjJpnK7P13bqEBJ67f0iggzaGMneBQsxly4?=
 =?us-ascii?Q?rPXY5Bq3fmdK63JHISI+83ULuACVtABTU1l911GSf47cfjKISEP7Y33OT+gA?=
 =?us-ascii?Q?/QMY9PP/qbVBD8a+F8qj2kE8fUZTAH83t/ppiTWRgbc37lQgPPuTMy7Zhhw3?=
 =?us-ascii?Q?ZNtXD4e2OinO/v04eZ+L2qnGnjwEM5aeNav6PcfGdUKl8y+TT+qC3JLsgVGL?=
 =?us-ascii?Q?Gg/kEE/0hCiQJjHvvSJmamrNh5ntm47QOAHr74MRkiTgjzbrc56Edxmq6Tvk?=
 =?us-ascii?Q?JfXzmkRdWLZldyI0VIImJ6WbY62XackrDmx9ZnbguC2+KSkQb6xttYcbRzCk?=
 =?us-ascii?Q?0kqCkUnoLAsPzqwXbOEfGJYUcnY7vBE/MfzReIBDD4FRo6RxF55Ufd1/U6Nw?=
 =?us-ascii?Q?n+ZfVohhPpJ0YVRrKq//Cqf1KneSTvg4lMAhyM+QIaL61nvl1BKcXcvIr+5Q?=
 =?us-ascii?Q?ApRMbpKGnHYRwgoY89NWt0XTtSdLQqShgMz6329Blj57+PXFvXGj1EAf97Hc?=
 =?us-ascii?Q?AX3sdtkSEDPpGICpv7T7e88j/cVBt/ExrGl5D0gSXyLE8BUwZp/mvAS9tEnS?=
 =?us-ascii?Q?MsQhG34k5ysPG5V25DQOUmxl7A8ktCzetV8AuuwUH+kj40wBzRLX5/q0dYUS?=
 =?us-ascii?Q?7Epie0iH5TU61ZW9lPAWYsb40g3teDkXZuKjxRArCpEnKsL4kWnxRBILxHKr?=
 =?us-ascii?Q?rgBZh/7EUjj96IyPSRtLd3kZZMQOJ8tKn3zASOdALaJsjX5gZM5RDzk8uM+Z?=
 =?us-ascii?Q?SsTPXuPlEYjuDCSg1eWsYHSAKYEH3VqsGcGtDxTdeS5B9xx60tICk9ANJY5e?=
 =?us-ascii?Q?RcrDPlnMK6IJEtvl4ht9B5PtsrM3//bPbzQH3m5Z3Vz93LjTRsnIUo+odSgJ?=
 =?us-ascii?Q?HSHC3E9I2/4fglqlZGamyQbX?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fd0423e-65d4-4c78-eb51-08d91ec8bbb7
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5076.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2021 15:29:34.2495
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gibNRX0zBUz9/+t9igZLf75ZQWThTJvxHMNQXJFxvhWC5jdhCPPKf+gv2NBgoOXEZSnC/A361pedoXzFKygNiA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5073
X-Proofpoint-GUID: n_lOJ8r-Gy7uMOJTl6DDss-aulhcO15W
X-Proofpoint-ORIG-GUID: n_lOJ8r-Gy7uMOJTl6DDss-aulhcO15W
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.761
 definitions=2021-05-24_08:2021-05-24,2021-05-24 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 suspectscore=0
 adultscore=0 bulkscore=0 mlxlogscore=999 spamscore=0 lowpriorityscore=0
 impostorscore=0 mlxscore=0 malwarescore=0 priorityscore=1501 clxscore=1011
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2105240094
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Saul Wold <Saul.Wold@windriver.com>

Since tbb does not build for powerpc remove it from the enabled list

Signed-off-by: Saul Wold <saul.wold@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/opencv/opencv_4.5.2.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-support/opencv/opencv_4.5.2.bb b/meta-oe/recipes-support/opencv/opencv_4.5.2.bb
index 311355bd7..1dcd8586c 100644
--- a/meta-oe/recipes-support/opencv/opencv_4.5.2.bb
+++ b/meta-oe/recipes-support/opencv/opencv_4.5.2.bb
@@ -106,6 +106,9 @@ PACKAGECONFIG ??= "gapi python3 eigen jpeg png tiff v4l libv4l gstreamer samples
     ${@bb.utils.contains("DISTRO_FEATURES", "x11", "gtk", "", d)} \
     ${@bb.utils.contains("LICENSE_FLAGS_WHITELIST", "commercial", "libav", "", d)}"
 
+# TBB does not build for powerpc so disable that package config
+PACKAGECONFIG_remove_powerpc = "tbb"
+
 PACKAGECONFIG[gapi] = "-DWITH_ADE=ON -Dade_DIR=${STAGING_LIBDIR},-DWITH_ADE=OFF,ade"
 PACKAGECONFIG[amdblas] = "-DWITH_OPENCLAMDBLAS=ON,-DWITH_OPENCLAMDBLAS=OFF,libclamdblas,"
 PACKAGECONFIG[amdfft] = "-DWITH_OPENCLAMDFFT=ON,-DWITH_OPENCLAMDFFT=OFF,libclamdfft,"
-- 
2.25.1

