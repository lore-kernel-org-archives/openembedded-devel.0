Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.6229.1626442071538973642
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 16 Jul 2021 06:27:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=lCHMrr4i;
 spf=pass (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=28316a5228=trevor.gamblin@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 16GDGGv2032500
	for <openembedded-devel@lists.openembedded.org>; Fri, 16 Jul 2021 13:27:50 GMT
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam07lp2049.outbound.protection.outlook.com [104.47.51.49])
	by mx0a-0064b401.pphosted.com with ESMTP id 39tw218gem-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 16 Jul 2021 13:27:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cTbb4lsOyujiAyo+UPzlRPfH2D95T121035nqb8XQJ/xhrKZ0ewf2/irXecGOzNQoLyCm5tJeJMu+otbV8Ct1TibCXnytc6bCLXqLd5GteA/6bXhYSYuUZTDbDglWb5Ux1JYB/Jr9MZ6SDKzy2J7kG+J6q7aVy+spCxTA0FGH0eGh/queMDNdC1m3fk/cdvv/024wLcz/D0/bzFiUQuqj1jBnivDUmg4bg2S5QX3Pext/HWhUa/qQ1c13zf26LP7HAvnP8CYAbd6yN9HuOSNRmi/H25xtPFDh3MJqtZmsZpX3U7xVYooWtY9wcLfP8tnkcVe9kf5tWryrfyWXLF9fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PaiNzqDZRHQRHzpNAUi/SIjNQVqHfAgEZKQehochfVM=;
 b=eaCFWM40TEiyiY1iP6NNCKgEB4qsY/rWhX3QVF/ldnlU5qxZIWiiF20ofE18zxiv41xwwzWxx8E+1OIocBpgQxtUcHnogvyWK+IRcJOwWlccyGzxc2AknD/VusdwJ6wnBbMCdWIa46+FrZiExO4iY2ADx7Q8bQXlsZJyYlZqoeWVmLDYBICM7CthTWnzuzMRa2lD+iHxNI6DhqpL5SqXTTLtgDLEcgY427EqP2R71DCegDG8xd6+PcvIIqpyM3N9hd8yBVqhmFFNsDdacTt59HaTPQclTl4Wr7Qj0bzGEx8ipCPeullEG8QApuEbFCLgq6f9ksHcjlFRzcUkuZFcMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PaiNzqDZRHQRHzpNAUi/SIjNQVqHfAgEZKQehochfVM=;
 b=lCHMrr4iTlet+sB+CvAKpPpy/3SFTo6OGQV/CvzN8tJ0GGH8Q/tZJCP7eLL+VUO3NqOlTUI3abkyBqdVgG24I9P+p+VhkUARUNA0gewuPx+a05KwX4iAOpcf37WRW0s/O2nr2qisP/7/OW0rUBdn476t+FxpG+UtsmiyjLI4+ZM=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BY5PR11MB4401.namprd11.prod.outlook.com (2603:10b6:a03:1be::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.23; Fri, 16 Jul
 2021 13:27:49 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::8d6:5e1b:3029:341e]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::8d6:5e1b:3029:341e%4]) with mapi id 15.20.4331.027; Fri, 16 Jul 2021
 13:27:49 +0000
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 3/3] python3-cassandra-driver: add geomet to RDEPENDS, remove DISTUTILS options
Date: Fri, 16 Jul 2021 09:27:37 -0400
Message-Id: <20210716132737.398621-3-trevor.gamblin@windriver.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210716132737.398621-1-trevor.gamblin@windriver.com>
References: <20210716132737.398621-1-trevor.gamblin@windriver.com>
X-ClientProxiedBy: BL0PR0102CA0050.prod.exchangelabs.com
 (2603:10b6:208:25::27) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from yow-tgamblin-lx3.corp.ad.wrs.com (2607:fea8:c29d:d7c0::f245) by BL0PR0102CA0050.prod.exchangelabs.com (2603:10b6:208:25::27) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.24 via Frontend Transport; Fri, 16 Jul 2021 13:27:49 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 22769965-e4f8-4cd1-fbb0-08d9485d81cc
X-MS-TrafficTypeDiagnostic: BY5PR11MB4401:
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB4401C30039CEB1F8011B59389F119@BY5PR11MB4401.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	JSSSqO9GmC5W2l6KD7VXvzkqy+IZSRW+VzKFymWxD3CZIcExJb5Q5QWVadCn2gdvV20/538wOLP+ZvCr5QEaAjkrPSTvh8cMsRs5D1bVS67UurEJtW+wDSw7PxboNuOt3t7x4fw7MYDOVwcuUh8hkyGqjCC7se2sBeyxkKuSBlmiEhXV6wQ4isAFdhVse20HsCK4DcACfuzLA8zOjPcuD4N99m8GAia4XLgZWMu3kVVb8fwIF2gN5fX7mBSo3fPyMHS4kPe24k0+U8HslVMe2RYT+2I8+YPS8J2Qw2515iH/Dc8nj8wc/Lfg9odq5T5iMJosPJ9T3gfJtsbNBjdG9hGCuMqf75BcGhG+iYF7xI/2oVFP8Dmzirm6KdSthp0t0xMLSb3AD6i6rUL4wAPJ6ieHsmUAtSr1aYPy8YNBPzMVvUHxZxJNVlyG2lh+XxTw4tUPNQfU1D9Y9y8Q0liWUGw8slPyKnWLXYJNpFTPj5JjZ8W/WgMaq1W+xFKaiWL94+nXSDoKTTl1Ta0sMFIYzjtmo7eFlslrDBdY2ctmvXoOGd9erH8FQ0ViaICgHV76si6Squ915l2WNhqiRMAoYwBY2c0/BVYHkNZI6HjJcPnqKZnj2pj8FRHJ0KY3tnd/aPv+uaOWm6sgedHDlglT9g==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(66476007)(66556008)(186003)(6486002)(2906002)(508600001)(6506007)(83380400001)(8676002)(6666004)(38100700002)(66946007)(8936002)(6916009)(5660300002)(86362001)(52116002)(316002)(44832011)(1076003)(36756003)(2616005)(6512007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?KjW8RfwdSlVV3BnTnNXtvL6oZVHz7GRsJv9MhhGRTz99CSY0nHo6RpsGFMJb?=
 =?us-ascii?Q?PbUyF2BzGMlq2X2I+jc/zHA3VxSQZRh0CF/OHH7C9OTVMuRoxxaxw7dTvhuZ?=
 =?us-ascii?Q?cW41mULv8glHdkqU5psYJsDjoqCcE6s9H3W1GJQeG+exbviV85TZEw+NU6q9?=
 =?us-ascii?Q?RpBLR5t6yhOWmy4t3Oku8rHTof5/2PXbTnMLTuxRy8k9NroQ4GWq9uj02Aph?=
 =?us-ascii?Q?Figu52fsS5vTtQXcotHn29AzB+8omYafEflrkGj3+w/++Mfw1oEOhwIfq2rE?=
 =?us-ascii?Q?OGf2fiXUfYYlXjD+4vQyB8MCAjsPv1LnQlfKVWRtUcZy/1OznwmBkyZ0gUuP?=
 =?us-ascii?Q?Hsz+gvKCa+LIZtHS0PDqYzTyH/FYrsGqO8jIxhCBjLa6m+29gm2Bajwlm3Re?=
 =?us-ascii?Q?WjrHnDWBHRBUhVOCCvp7bAWK2aN6mOU+x7lHDvNjnNKPCy2FWxF1rOOGMgZ3?=
 =?us-ascii?Q?0OGP3SzXQIBW8ngus8Z0Lcrc9uWm95B7GQ19J5UIY+qH5ROmj3RzFiSAP7nf?=
 =?us-ascii?Q?PRyWogFs7CWaiY7Dccbpow1vtyCgeKbmkzcDPhkUnK0gGQVkEXRNsclijqr6?=
 =?us-ascii?Q?WgonCJppYZXnJkpcdbJX8Rq/7cLyMeRzYJTEzNJCewpOZU1Aj7hR6b+K5HAY?=
 =?us-ascii?Q?u0bXS6Buxjm0JzUukoX+rlzGRX+jtHV4DirvfCmBnE7BaUoOU/G8XlNesISy?=
 =?us-ascii?Q?4Qk7425TAQMAgIhc6O6Z7rmmAgMHp9y1FxGcX1nnB3lrDU5oBGXxdul5m/3s?=
 =?us-ascii?Q?fC1HTaC/ojMO0MqG8kJJb7iJXBqSAkGRbrkrppyy6vnm97rpAn0z/eKBjFWJ?=
 =?us-ascii?Q?2Zc1KcYmAPynYatDv8nD7Q59L5nB3XS86O/FlYBLaPZzffQpjRPGbEn5B/vk?=
 =?us-ascii?Q?qqyCylJUOtWujKV9Y2+Ba+FY+JnZXbehBaRMQQI0kkOWj4sUjkzEzLpBvpz2?=
 =?us-ascii?Q?V1vhWezWkf83lT0jf4n6+dJvRemFg6oDdGNE60Cv1ED/I2Ne8hsRu7Q+i2oZ?=
 =?us-ascii?Q?L2886nGXIzHKxl/IYSaSpWk6O+dZRYM7GMjKsEzoC25hEYIy3WmP9FgaTa7B?=
 =?us-ascii?Q?DyTWWPrSCQvSkGQ54sjRrFKu11l8tV6r/yd5T2KeAeq1Ka/EJ2jbHP08FzFp?=
 =?us-ascii?Q?3YuwqJjoqSB0jOmGsKCoCbUpkFfqMZje1i9rUq71N7Jqq/W0y7PMqsstpx2y?=
 =?us-ascii?Q?M6sFGBpoNvQ0ymsoqfGP2z/xiqknupug/IGdtJQ+CZdufxsQO9mxB77NQ1BU?=
 =?us-ascii?Q?q2sPM/TikK9BAQ7tTWR+bj0TrufmpWRXXlRAaH/plqVtim3Eed3eef5OIFW3?=
 =?us-ascii?Q?Y9uWoDptTMAiE5hxxFeSCjm6OlL1+mXiNCzXVMU7YfZVRF8+Hwtwc1PFQFYc?=
 =?us-ascii?Q?ehG2OjQ=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 22769965-e4f8-4cd1-fbb0-08d9485d81cc
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2021 13:27:49.8037
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n/H76RaBzYfTI+4KdO7IHaBg9kY9F3mnhhiNle0N2jX+3FgOpOPkEIDKx2hRN6XSm6ciueX6wc50gMeNQX9cU23ZmtVOVl1V8AGU41Q35r0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4401
X-Proofpoint-GUID: Ih44D81uwwK41ZNJKFKWstOgZv1fPDZU
X-Proofpoint-ORIG-GUID: Ih44D81uwwK41ZNJKFKWstOgZv1fPDZU
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.790
 definitions=2021-07-16_04:2021-07-16,2021-07-16 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 suspectscore=0 lowpriorityscore=0 adultscore=0 spamscore=0 bulkscore=0
 mlxlogscore=999 malwarescore=0 clxscore=1015 phishscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2107160081
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

python3-cassandra-driver is failing on do_install because the recipe is
trying to pull sources while installing, but it can no longer do this
because a recent change to python3-setuptools removing support for the
deprecated ssl.match_hostname method. Since this only seems to occur
when the DISTUTILS = "--no-libev" option to disable the libev extension
is given, remove that from the recipe and let the extension be compiled
into the package. Additionally, add python3-geomet (the dependency that
cassandra-driver was trying to pull during do_install) to the RDEPENDS
now that it exists as a recipe.

Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
---
 .../python/python3-cassandra-driver_3.25.0.bb             | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-cassandra-driver_3.25.0.bb b/meta-python/recipes-devtools/python/python3-cassandra-driver_3.25.0.bb
index a1941bf3c..ad446d6ef 100644
--- a/meta-python/recipes-devtools/python/python3-cassandra-driver_3.25.0.bb
+++ b/meta-python/recipes-devtools/python/python3-cassandra-driver_3.25.0.bb
@@ -10,17 +10,11 @@ SRCNAME = "cassandra-driver"
 
 SRC_URI[sha256sum] = "8ad7d7c090eb1cac6110b3bfc1fd2d334ac62f415aac09350ebb8d241b7aa7ee"
 
-DISTUTILS_BUILD_ARGS += " \
-    --no-libev \
-"
-DISTUTILS_INSTALL_ARGS += " \
-    --no-libev \
-"
-
 inherit pypi setuptools3
 
 RDEPENDS_${PN} += "\
     ${PYTHON_PN}-cython \
+    ${PYTHON_PN}-geomet \
     ${PYTHON_PN}-json \
     ${PYTHON_PN}-misc \
     ${PYTHON_PN}-multiprocessing \
-- 
2.31.1

