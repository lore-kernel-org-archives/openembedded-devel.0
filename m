Received: from NAM11-CO1-obe.outbound.protection.outlook.com (NAM11-CO1-obe.outbound.protection.outlook.com [40.107.220.85])
 by mx.groups.io with SMTP id smtpd.web09.9112.1621347298103130362
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 May 2021 07:14:59 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=SadZ73Za;
 spf=pass (domain: windriver.com, ip: 40.107.220.85, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VnZs+hVdPEg+sVD34ji84Bu9YfMcm0l1mYxjrb90pCAf5Ak/Qu9aSh0b+sXKUcIZjtRjWUFfEsg5fleaIFqHy6S3YaKVSdJREOlsObcI8yRkfTMXGxkHwBo9Kks+HWXMvunFIUQLsZgEXjJ9ihaIQZ8SFt8RVBqSal5WZGmIqEcU7tElIi+D39nRvVl8jNyo7A8SFhya4K3VHvkc/Nc8JpElyth9EkKiyKGnoCueHBxpwGHOKVC60vcP+jBzNZQ/u8EpwmoOe479i6marv3Jy/10O51m6VJgR5kiBV6t1A9uCnf3wYEScnhIFJDfmPMeeiiw0QrkiE6YQV1AmuqYVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3NgtptLjMPCmyhAa1TFjQQWQjdyoqvk7p4ehem72QoE=;
 b=KoqZB9qIMclw1umE3uBYMLvw1udh0AodCS4L+QlaNaeRhB4+KvtOtli1ZOBWPV1OnqgOB0lVE7C773wdbgwRgy/B8p0RNzqZ3GWOX0JTfzYQ8v4p+UlSvg+OxLAbwsEoMXmxMPBxWkgdOSpaFXaZhmr4aEnjc99Cfl4oA8WVpyJUkMVZsT+UX/mUviaqhdH1KIy6/OK9UTyAocL+H0rrdDWBBiV5uO/kds2EsAG0/qYMHcJRkIOBKMRIZbIX5SCoKGWvjOw1ikWFktEmGWFN2s6gocz6pQDFa+MIU+BA3rrl1gqW+LnKlA6zSzl81TYg7aFSGvj5ETCa89otrrBR0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3NgtptLjMPCmyhAa1TFjQQWQjdyoqvk7p4ehem72QoE=;
 b=SadZ73ZaCUUkUihB3diWIc5Vmi+STu1iULPmzbB+T189E5TZzDjLIHqBbSePyIiowHWRbSIhF6yvQoKe7GPplg1+XMuMoOT/np0hJ492Me4ZiB7UNXYI4Py0xQouM+pEHcNxU/8GVb+VLShVuj2HUI22N2oUvUlI3yKt9W0obBg=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BY5PR11MB3894.namprd11.prod.outlook.com (2603:10b6:a03:18c::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.25; Tue, 18 May
 2021 14:14:56 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::89c3:3b4d:43c5:ae76]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::89c3:3b4d:43c5:ae76%5]) with mapi id 15.20.4129.031; Tue, 18 May 2021
 14:14:56 +0000
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 1/2] python3-django: upgrade 2.2.22 -> 2.2.23
Date: Tue, 18 May 2021 10:14:48 -0400
Message-ID: <20210518141449.913331-1-trevor.gamblin@windriver.com>
X-Mailer: git-send-email 2.31.1
X-Originating-IP: [128.224.252.2]
X-ClientProxiedBy: BY5PR03CA0019.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::29) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from yow-tgamblin-fedora2.wrs.com (128.224.252.2) by BY5PR03CA0019.namprd03.prod.outlook.com (2603:10b6:a03:1e0::29) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.25 via Frontend Transport; Tue, 18 May 2021 14:14:55 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b3e44482-9952-4ca3-7d63-08d91a07502f
X-MS-TrafficTypeDiagnostic: BY5PR11MB3894:
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB3894269377A7B918536074359F2C9@BY5PR11MB3894.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1303;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	EbuG/mpNAmkP/2coIWfEZkebMfX/6g3qU8FhOCZac45Y7GA4VkhHxFLVri8aZupq0FNpeFVJ3GzQb4h2EmnPQ4csIoDDCxfxnnEIzxyr5g/MvadJYMcz8+OTA+rXFchXWtOLI1KqwygeKafreBecjjRxoj6sLasLpmuuRQ3If3T8LLI+G7HSV4G9RZpZl9iaKfy8gX5JRN+b+EZKqkA9WYTwXV4GN143tEW4hEvbHa+fJIB4+b8E3NLYZ5lIIXdYnypltlrfevE+u2oEAHJ8YE7Lw6hueF/bxSTdWoUgxIiUMTqyBwMYp9ja3K7CL0ET4W24Q66GXAVtNro8SYcSfn6QpmMJ0+KSt7rQih+l4KwkeLSIl3fy8/HFfdhlYfKu90bqncrTnPjoF2dUKcve8jb9MBdXrs3rIvQTUBOsn9+FRKBXG2XcvAr8mg8/XHNyiSGDsUob6BzOi6cDBY7uuvla6rgFEWI/qhyKKAI5TRftKGBWI4e31zyEHrAQQLGnFdDBIlejYkA5O9kkHft3CjZh6pJq/PFSMT7EV1eDzVKSQ2bZGJONt07flC9pNvArh1a1xbYF+yWNB3F5FE/1Y5xituEGDBodLF+RZGbBT/s8OEeHsglrPFX84NmSCUfCNsSsU3A7VVkjNhHakhcGbw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39840400004)(366004)(396003)(136003)(376002)(346002)(83380400001)(5660300002)(38100700002)(16526019)(38350700002)(6916009)(86362001)(26005)(36756003)(2906002)(2616005)(6506007)(8936002)(8676002)(66946007)(66476007)(66556008)(6486002)(52116002)(1076003)(186003)(6512007)(478600001)(316002)(6666004)(956004)(44832011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?dcyeZKNxdB32oLO2S/k38lWG5XGz22soVeu9BOyqeE6UfRZR2a21CQYN6Qbf?=
 =?us-ascii?Q?2dyGfDNFlUDChJH2HgwNyJzCJLRb0xQsorKxlEDR2Kb4k0NEB0yObFej93cU?=
 =?us-ascii?Q?fhMd0qwsKiznG4Y4GOSgThmRbW7C6Ay2Z+X+lqOh5NHRLA99Nyz/kdzAKq2J?=
 =?us-ascii?Q?xHUx+mJWnBAPFfJ9McUqCKqBkgrszeow5f1rGHJ5/UBrJgX+kF501Ok1DvyV?=
 =?us-ascii?Q?+wRiNyuaP9PLN2t9u8v+tCFkVSFU1umj2ofA0lLzXR2UBD7C0usQHJa9dWy+?=
 =?us-ascii?Q?Kf0pWBu4YwrMxiBpiAC5YqR5ZFVJJ3YBRyEEVNntk5j3IGf1Ds/n4RVFOCCP?=
 =?us-ascii?Q?phAP3q48hjZ0abwpO/1K1ZsbcMuI4uNmmu+YAdgAQv1BsTEx1BbiyfZYQ5/o?=
 =?us-ascii?Q?qenYRDi/l9n5W7PF5R6mozso3keZFOYFwqeVJTYgGF8soBopHwN2SeAI/Ldz?=
 =?us-ascii?Q?HFfro+ixnRz+cEntcZElrLIThN9D4gjRmPVB2Bu3bh4Zv9yPQ3FTyzJpqIsn?=
 =?us-ascii?Q?YvMgerXthFXKrcjRz9s1pEuU1xD0RALAUH3e7iT4A2vFULB17zBfy6+V6EW/?=
 =?us-ascii?Q?6Tn3EiUxKjPDymYZtCXVtoT/6aABpWGbvOGjF9ScLbXUD2ozTVm//ZrXyCo1?=
 =?us-ascii?Q?0bTTfTaoFGc5K8LRc+INq0AyAz+VhMW/ta5U5dOiqO/KxTpNdwBYrhwgjOzk?=
 =?us-ascii?Q?yyLQ9Qd3E8goFbaEIBzny0Og8N1IwfbwRJTZhObYW0yrOMKPVsVDfP/O3nIx?=
 =?us-ascii?Q?VtRjXh8L++qqQnUMiNQYUC0oAe2OwUxWKVh1EUFH+1s7RgyW/2uQVL+rMd0B?=
 =?us-ascii?Q?KT3dUQxIqV/g1W8eeS9qIUdlpEd49V5Em9Jul9PC708hnAvS7DDghzbkV1C3?=
 =?us-ascii?Q?LKm0bJkDX+5HwmTnkglNFtypEI7C91U69lQ29jCP1v+B1+m/3fJQNkD4Cj+X?=
 =?us-ascii?Q?aWANKiPnxYQaYMMEOr0ZFEOmXLu5BtyOVR/wkUX5lhETyHZyYO8I6L+pfi7h?=
 =?us-ascii?Q?g5iGIOhf7WtrRRhDlq8YJajjlxL54wLVRmyZAFW82qCmYpdLXx529OrVtcfR?=
 =?us-ascii?Q?4Ym7Zv1TCu39McTxMseZC+iL6cuUFQR/7P9d7rFXGxYOAsSXho7tjLijbkFj?=
 =?us-ascii?Q?RlNDuZMSEbr238efD66ufG86wXhFL1PN6Ei16EbQAOFJxSLENHGV4vHVviiy?=
 =?us-ascii?Q?l70cYXi7EHIGpKw638EtAY7kWL2pvJGmiQKhRGDfXe/QPyejw9LVKNW+0YMI?=
 =?us-ascii?Q?hfxI3cLmmWPUFe5V6ZIGWDKSaQDBl6KPkVWEth3p5IMhhgO3eKi5s+7RW3NA?=
 =?us-ascii?Q?Ex35qoOlKyvwawyXxM9ZM6Gb?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b3e44482-9952-4ca3-7d63-08d91a07502f
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2021 14:14:56.4137
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G+CjW2r1DldWhYA+aha8nUs4Xdub0D5T/FF3JMFou/5GrTHsAcS0OttRqKqoEjXg3437VekSEDrfAs3l6aPQ024mpPQl4qxabAZI5bhd7VQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB3894
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

2.2.23 is a bugfix release:

- Fixed a regression in Django 2.2.21 where saving FileField would raise a
  SuspiciousFileOperation even when a custom upload_to returns a valid
  file path (#32718).

Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
---
 .../recipes-devtools/python/python3-django_2.2.22.bb     | 9 ---------
 .../recipes-devtools/python/python3-django_2.2.23.bb     | 9 +++++++++
 2 files changed, 9 insertions(+), 9 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-django_2.2.=
22.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-django_2.2.=
23.bb

diff --git a/meta-python/recipes-devtools/python/python3-django_2.2.22.bb b=
/meta-python/recipes-devtools/python/python3-django_2.2.22.bb
deleted file mode 100644
index a0b884025..000000000
--- a/meta-python/recipes-devtools/python/python3-django_2.2.22.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-require python-django.inc
-inherit setuptools3
-
-SRC_URI[md5sum] =3D "dca447b605dcabd924ac7ba17680cf73"
-SRC_URI[sha256sum] =3D "db2214db1c99017cbd971e58824e6f424375154fe358afc30e=
976f5b99fc6060"
-
-RDEPENDS_${PN} +=3D "\
-    ${PYTHON_PN}-sqlparse \
-"
diff --git a/meta-python/recipes-devtools/python/python3-django_2.2.23.bb b=
/meta-python/recipes-devtools/python/python3-django_2.2.23.bb
new file mode 100644
index 000000000..ab4b68fc8
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-django_2.2.23.bb
@@ -0,0 +1,9 @@
+require python-django.inc
+inherit setuptools3
+
+SRC_URI[md5sum] =3D "d72405637143e201b745714e300bb546"
+SRC_URI[sha256sum] =3D "12cfc045a4ccb2348719aaaa77b17e66a26bff9fc238b4c765=
a3e825ef92e414"
+
+RDEPENDS_${PN} +=3D "\
+    ${PYTHON_PN}-sqlparse \
+"
--=20
2.31.1

