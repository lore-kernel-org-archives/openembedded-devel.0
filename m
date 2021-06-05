Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web08.12187.1622900916085755196
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 05 Jun 2021 06:48:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=IhSBMcVf;
 spf=pass (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=179073020c=yi.zhao@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 155DkVke009920
	for <openembedded-devel@lists.openembedded.org>; Sat, 5 Jun 2021 13:48:35 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2176.outbound.protection.outlook.com [104.47.59.176])
	by mx0a-0064b401.pphosted.com with ESMTP id 38yxg2gc1n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sat, 05 Jun 2021 13:48:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UQJgHFfy/aDjcVlBCIpIvLgDARA7LrI0Y+ksvgNAT0qkCR+09AyEmCSlJ8aP4CqwX13GNzx47uih23xEHvby7xi1wzM3tB0YJ0RATe+RKdohx4ws/zfAtFKdFHglVlpCsciIuBflJs42uv80KZXWgX2gk75nLeXszSgTGoc8UJRoMOCkFvysSW+NmSbd07BHkkOMaO2P7dqhIxRsMxjEb8zevrnrQwKREhNfRIEn4tFQiQQTXD8lM4uLI2JGxOFhSEdDSMBG8AjR6c17oKsVDiidQZvwg11R3NOgyCmxAU/KmnlziCLjROoL2NGqMrxlvxyIasuHNlGVz35ubvbp5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iUOWUJ1w02YjhVzE9Bh7QbDxDpcZmbzZf8nEr00MMeA=;
 b=LeypsIAo9O+sYIT84LFGoTjUlMERcCBeKSozjna9nOt0m7eb+E+KyCvuydBuRdaVurjU2Ce11h/Jd/jTDHSFk/7VSMNlP2VAO2wvU+ivccq8mouPPhtUWD0JW3CFn+sTDV4qG7oaTpVCkvfJXm/URkON+lmPOra8i/zRLZFeqbrffMWISQMG9tZIE2FJj9sRs1dLnhI9CZDUPVAovgQArJPnNNccNGiAYNbS2y4mlwrVi1XZSfpHbodQs6p4YeWTbYELh24vwJQsz2u52vfHYtGGSull/uOQl9XXo2Dt2H5hdWZCGweb31G83yY3TJTmkl75lxUQNC8uEYQQmtRCtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iUOWUJ1w02YjhVzE9Bh7QbDxDpcZmbzZf8nEr00MMeA=;
 b=IhSBMcVftF06hDc7ggkJ5QuHxHAllkZ1Cey48QUWkOZED0m19qtWSzC24URoQw0vEpbRU0ThhII4O+D0+pWxB0shxNrzq2hSGdeQtO466Nmyaash1VMHa8edyiNnSnawxJaZrkzcBEiu6RACU9RT1nrVW6huE3Fa2fOL0m3/dqw=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by MWHPR11MB1853.namprd11.prod.outlook.com (2603:10b6:300:112::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.22; Sat, 5 Jun
 2021 13:48:33 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::55fe:763e:6961:7bbf]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::55fe:763e:6961:7bbf%4]) with mapi id 15.20.4195.029; Sat, 5 Jun 2021
 13:48:33 +0000
From: "Yi Zhao" <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH 4/4] samba: update smb.conf
Date: Sat,  5 Jun 2021 21:48:17 +0800
Message-Id: <20210605134817.163302-5-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210605134817.163302-1-yi.zhao@windriver.com>
References: <20210605134817.163302-1-yi.zhao@windriver.com>
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: BY5PR04CA0025.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::35) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-yzhao1-d1.wrs.com (60.247.85.82) by BY5PR04CA0025.namprd04.prod.outlook.com (2603:10b6:a03:1d0::35) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.20 via Frontend Transport; Sat, 5 Jun 2021 13:48:32 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 41f3c4b6-1bec-452a-201d-08d928289c19
X-MS-TrafficTypeDiagnostic: MWHPR11MB1853:
X-Microsoft-Antispam-PRVS: 
	<MWHPR11MB185374509B09CC8931B7291EF93A9@MWHPR11MB1853.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	fIRz09aTaQ4dSt3872WbrR8mQqE8vGRuVHCeYNWiY7YSLScxD72OPxOwZkwa56lUNcQmm2/eSuO4ELOpAkhVxVTPgWKvm4BLu4QLn8s2HW/mteFxdwiu4iSl32rKFwieTTXnIHBljUgjXkd30gcur5jGrCH1gjAkC6cCZJTcPAT6VbJCe4jCfE+FG3R59vIb1C4ZQYUMN2kp1CODUr+25UEUtYFTKFQtva8Uy1rgxPtiBnIz0looJWS13E04dfg+9qaMLsHkgeGZqr7xmtccMKQotTLcS0zpBFNCY7q2YMqsA0BBy9qqFSFgQ3BXAIJdIx6qqfQNfQsF+/pqgYMOWxdBoyIZayxL3rInM+rqrwCAOSyv0H48+O+SBKAbhhukGhjruRltuQp6P7v4pAYz/eztcWnqBC/aojI6n2n85jQTb/KEfppCXvO0NW+SMlNGVuxRN2nzbBtCB2mCnf1DW951kyQ6yAYiXv9/RJszakBMPz1cCq5wK2P6MA6+x6XOQJD16725JdB8RlqK3P0NoVRUCAsv8nmehu5pDX6x3MFmbvws8gI/KBDk98zb0zzBHlK/v6UzKTbYqFwbeTaGuEfHKegbiFdGBHnPXzTk6FDXL22ekj3YscVvT18lZSpCiUgYykpF5qHsiiR0CPMxRJbqi5FZkHiwxXN2s7Z5vRU38rmRXazVombOjt44+4cd6RGWvQLusqquNjl4LtSW06xG75cHNcc4XtXbjjkMYSwZ/UZUbPjGccnm0ULPI3JpRKNHakMYprwZ59S7KvBYCQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(136003)(396003)(366004)(39840400004)(186003)(16526019)(6666004)(15650500001)(6486002)(86362001)(8676002)(956004)(6512007)(26005)(83380400001)(2906002)(38350700002)(38100700002)(8936002)(316002)(2616005)(5660300002)(1076003)(66556008)(66476007)(44832011)(66574015)(66946007)(6506007)(478600001)(36756003)(966005)(52116002)(6916009);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?FfV3hePlDGWUBUeiOKFJfqpWpDtMYG14txAFZVlWshU8GYqXmZfT/gPtOsNQ?=
 =?us-ascii?Q?NbcML5Bf9QZFXQ48M14hUDXWrf+6dG6w/Q2KBxXDzASmQOybAZ6UD9wLZ4RJ?=
 =?us-ascii?Q?3mBGcxRSGKhgug/kX8MZh56tzWb3K2sKqXiiFJ8NnEGk2KGoq9W8dCeb3Bzt?=
 =?us-ascii?Q?nJzI3vHsKmEIB4oHfPf7KcdakKb0rz5MU/AKoWLVlkrBBrgtzbvFlgLi8ro2?=
 =?us-ascii?Q?QTk9ZydgXfj7onUV9ZuqCFw6kEisS0A+/JBH8z6uDxxRaZoSLol7nynZ4Xzb?=
 =?us-ascii?Q?l3WuQ/8f0mMSkOQ5l+8JqL5CsYyvg9Pj2MOPxCjHDIhlPHt0D3y/zXwBzEpK?=
 =?us-ascii?Q?BEfFO6rIOOfWAqPW0PhlXXZUc7Jr3gEDkm6FzANcCdmMRjzzLSJmHiv36YHh?=
 =?us-ascii?Q?Izp+VE66R41j+pNE/59l9/5t+bdvOVCJkVLjVnwLlEPbsi74mCJ5zBv8ic1b?=
 =?us-ascii?Q?Wo+Hk3/05FuAYy25TmS7RnjEQnYGbqqc2E6umm4b6X9w1gVbPYstSzCs95vB?=
 =?us-ascii?Q?wPH1XKSejMfB1pvklWtAeGMrp2XQk/zOcxXvITn/BHnUDq+vBQhBrkDTwO+2?=
 =?us-ascii?Q?+9k+5LMN/8xR65mnkINP1JL/EIPC+M1w+4OVIPyD0r4/xbB9zOU8x3rnmmxh?=
 =?us-ascii?Q?D5VgJlG5IOqo5AcC299ozC25ieIGgmQEXH5DyuOH5XT2TYmgc5DwNHVG7G2C?=
 =?us-ascii?Q?bGxbrA263vms6rsuvu85ux4a8rjssEZ0jcOaXNrYyoTbNYgJUdoU8swWa83m?=
 =?us-ascii?Q?azXGRH92AVnfFVYVpdNU/1jDejbopBYjh9E3c2bWEn7IryMZu4P9ZlL7XTaH?=
 =?us-ascii?Q?3cjbgjmVd/ueIiaFog7Wbjuk+U/iKpv6ranEPa+f533nefDodS1hhWKaIO+x?=
 =?us-ascii?Q?Lt/s6/ySxRGL2o6nsjtx9t1SFMius2UotIePa6gVd7u1PnDLOKqGY9YqQVZE?=
 =?us-ascii?Q?4Fa25ue4b1gWCQY/mdnRnGy4iGO3bX1nWXOSdhBf2+29QVBwiDMvX8jXPxeJ?=
 =?us-ascii?Q?Jej/Opk+NX1UE44d3Rt30Hbo4RghQ4QvvSTchC88dSayAF/eNPOxZjcwouLi?=
 =?us-ascii?Q?OMubmQgsJy2+E8B7CI2yc61xN8XZ+sJElVUsgEaxoEVM5ZnYxcWUhhpb7Ewg?=
 =?us-ascii?Q?lGtMilyNrSp6pA7CiHiUkYXoOkwR93nVdr3srMcp5w4sQFAOtRrWV04jTJoc?=
 =?us-ascii?Q?uqSd93y5bOqZz16dQwuwRBNTZjWDXIKYs1TtvfE1o8+UpbhVcCHE5aTDFn2G?=
 =?us-ascii?Q?HmOL+bC2ijuSynKBZX/rwkJUALSCZRPcsJa5dP9DaDYBH9Kk9iV3D5LZ4JHc?=
 =?us-ascii?Q?JzMXYvqxXya6GCx6sRx7V/Hx?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 41f3c4b6-1bec-452a-201d-08d928289c19
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2021 13:48:33.5118
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +SqRQgU4EMYiNZ4daaoVIG3etNWdW2+bOCY2Pc8JSURm4xK2vAMsP8U54DBOdIYjGzm9Q59YFlnLqmN4qqNKPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1853
X-Proofpoint-GUID: cP_L008gI83vZJQl_eYvTLATanpZec4s
X-Proofpoint-ORIG-GUID: cP_L008gI83vZJQl_eYvTLATanpZec4s
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.761
 definitions=2021-06-05_09:2021-06-04,2021-06-05 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 spamscore=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 clxscore=1015
 suspectscore=0 mlxscore=0 mlxlogscore=999 adultscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106050099
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

There are some options are deprecated in smb.conf.

Refer to
https://salsa.debian.org/samba-team/samba/-/blob/master/debian/smb.conf
to update it.

* Remove the deprecated "syslog only" and "syslog" global options and
  replace them with the "logging" statement.
* Remove wins support and wins server comments since WINS protocol is
  outdated.
* Improve idmap config

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../recipes-connectivity/samba/samba/smb.conf | 40 +++++--------------
 1 file changed, 11 insertions(+), 29 deletions(-)

diff --git a/meta-networking/recipes-connectivity/samba/samba/smb.conf b/meta-networking/recipes-connectivity/samba/samba/smb.conf
index d6bde417f..588491ee6 100644
--- a/meta-networking/recipes-connectivity/samba/samba/smb.conf
+++ b/meta-networking/recipes-connectivity/samba/samba/smb.conf
@@ -32,17 +32,6 @@
 # Change this to the workgroup/NT-domain name your Samba server will part of
    workgroup = WORKGROUP
 
-# Windows Internet Name Serving Support Section:
-# WINS Support - Tells the NMBD component of Samba to enable its WINS Server
-#   wins support = no
-
-# WINS Server - Tells the NMBD components of Samba to be a WINS Client
-# Note: Samba can be either a WINS Server, or a WINS Client, but NOT both
-;   wins server = w.x.y.z
-
-# This will prevent nmbd to search for NetBIOS names through DNS.
-   dns proxy = no
-
 #### Networking ####
 
 # The specific set of interfaces / networks to bind to
@@ -68,14 +57,9 @@
 # Cap the size of the individual log files (in KiB).
    max log size = 1000
 
-# If you want Samba to only log through syslog then set the following
-# parameter to 'yes'.
-#   syslog only = no
-
-# We want Samba to log a minimum amount of information to syslog. Everything
-# should go to /var/log/samba/log.{smbd,nmbd} instead. If you want to log
-# through syslog you should set the following parameter to something higher.
-   syslog = 0
+# We want Samba to only log to /var/log/samba/log.{smbd,nmbd}.
+# Append syslog@1 if you want important messages to be sent to syslog too.
+   logging = file
 
 # Do something sensible when Samba crashes: mail the admin a backtrace
    panic action = /usr/share/samba/panic-action %d
@@ -94,10 +78,6 @@
 # new domain.
    server role = standalone server
 
-# If you are using encrypted passwords, Samba will need to know what
-# password database type you are using.  
-   passdb backend = tdbsam
-
    obey pam restrictions = yes
 
 # This boolean parameter controls whether Samba attempts to sync the Unix
@@ -123,8 +103,8 @@
 ########## Domains ###########
 
 #
-# The following settings only takes effect if 'server role = primary
-# classic domain controller', 'server role = backup domain controller'
+# The following settings only takes effect if 'server role = classic
+# primary domain controller', 'server role = classic backup domain controller'
 # or 'domain logons' is set 
 #
 
@@ -172,15 +152,17 @@
 
 # Some defaults for winbind (make sure you're not using the ranges
 # for something else.)
-;   idmap uid = 10000-20000
-;   idmap gid = 10000-20000
+;   idmap config * :              backend = tdb
+;   idmap config * :              range   = 3000-7999
+;   idmap config YOURDOMAINHERE : backend = tdb
+;   idmap config YOURDOMAINHERE : range   = 100000-999999
 ;   template shell = /bin/bash
 
 # Setup usershare options to enable non-root users to share folders
 # with the net usershare command.
 
-# Maximum number of usershare. 0 (default) means that usershare is disabled.
-;   usershare max shares = 100
+# Maximum number of usershare. 0 means that usershare is disabled.
+#   usershare max shares = 100
 
 # Allow users who've been granted usershare privileges to create
 # public shares, not just authenticated ones
-- 
2.25.1

