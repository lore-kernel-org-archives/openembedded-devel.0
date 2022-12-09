Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 752C7C4332F
	for <webhook@archiver.kernel.org>; Fri,  9 Dec 2022 09:54:48 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.9574.1670579680043915821
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 09 Dec 2022 01:54:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=kHAxBCLo;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=93424c1fdd=qi.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2B99JuIs003222
	for <openembedded-devel@lists.openembedded.org>; Fri, 9 Dec 2022 09:54:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=LfhYaEiTdhQL6AcQyQJJE4dYwnDY9YAKcKcL/D4S3ns=;
 b=kHAxBCLoKMySRrETwvpBdPoQ+v4n6FB5MruEZAevK5Bah3NmQwrI+dtiuDoGm9DGlo3S
 +m6Bo1+ghm1aZgZzFuYUMI00Rqtkog+QV1llHolYBPFvz8kuc5VB6mnPD55IU5BzFeCM
 0WS1v97nEv6IouEtwVvRTbKjs7hbJg5A6h8RrL1gHnWkMlP5f4adIcjpTQlcSnv0slm+
 Gi2MF3w6ADxnCDxsQeSG47XadeZSaHxJQ4Hfu2rfWm3aq3C/JaOm9JOHVWm4OxM3Xciq
 2KKR54IBbfb43c/e0syQt9omfow5/QktsYBcJEU2yOYpG5UxNQCGzR09+WJSRjawhMZG 9w== 
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2107.outbound.protection.outlook.com [104.47.58.107])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3m7we959p0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 09 Dec 2022 09:54:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=faQEPH8sbjxQNHtpNxuWSWiUn2j4Ken+vNqFf0ZRcJ1Fxev43MdoW8/0MSga8UHgP+zKIG7ezVIoktduW6WdAb65e3fGOj1Yta/Ei3NSAu5EvCX7rNerYxlRCNEf2fyYZnbrnIzRsFmyU8s6Aa6skSt/5LAGfYpJLUBs5dBCDJJyGXscsMWr4DQgcBsLYTwGjd2zUU6YwQYQ0qVhs798YQhA55b2yNdUAgYIhhXiikMr/teuvQbGxvlCYl4DqFuNWvg8jdRNkMKEYEo4CgATdgeCmmWEHjdSLAF5YKInp65IfluuhoMJv8I6vCM25Dxui5m5tAGIu0DYhXFdUf8zXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LfhYaEiTdhQL6AcQyQJJE4dYwnDY9YAKcKcL/D4S3ns=;
 b=kcMh/3HdhXlV+IzYBXrFM56j+vkjnrk8LRKFAFwJCiBa8SifQ7WB3Qzf4tIeKrOyqWyqTCrTg0ErIiwSnhkSu3n7iK9j5/bST/kTUn+p2L8lS/JhhhSGEeooybJZzVkwN2bQJpkPv88eAkGJD2Vt4BTOAgIUdSkJWkt2lRVDM7X/VO7xB7T2+Ah6RbF4VPgn3sSGIGP33sKdWRsCq9NkMZGN8fgdNfTqRUgolVxy+8nX8J5ZU56b3tjJVUH1xkcK/32KbapgEjhJXALPmRHhaJBpJgx3wUhyPcXMT8h9nWF/3GPL6i2OmWYhWjURD/yabMPQ9RC0kKoN+w6iJmaWRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by SA2PR11MB4876.namprd11.prod.outlook.com (2603:10b6:806:119::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.18; Fri, 9 Dec
 2022 09:54:36 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::d8ac:d3b0:6765:63f7]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::d8ac:d3b0:6765:63f7%9]) with mapi id 15.20.5880.018; Fri, 9 Dec 2022
 09:54:36 +0000
From: Chen Qi <Qi.Chen@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-networking][PATCH 1/2] networkmanager: fix dhcpcd PACKAGECONFIG
Date: Fri,  9 Dec 2022 01:54:22 -0800
Message-Id: <20221209095423.43705-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR04CA0035.namprd04.prod.outlook.com
 (2603:10b6:a03:40::48) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|SA2PR11MB4876:EE_
X-MS-Office365-Filtering-Correlation-Id: 87846466-3e42-414b-c585-08dad9cb614d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	PUXY5/FUL4L3HYp1h0hi0XjujeeRvLQKqGyi4XQzCl8vfdhqJDT4QGFZc/KisUQzyiGs/8WOB1v2O7gNXdH03RaJ9zLx9/nP8zHG0LY9Yg2/d2hwP92wPPGyf+/P1Rxpy66AkjTmDp8r6x6ukONhHV4AsGDup4Xzz1zdFxFoMEoMXChUCwkK8OiVP6snQGTnR6Q6H3Wz16l7rNKL/uY3LyXtCNjbgQOzWpN7rmDEuhz8WfewqnwC/fhVGfPZoVvE6JbYJOXSYNNJSH4JxilPJeWEC7wwPBMXadOhnWqU7GKT3SPdj11xPvA7SukImu+fmUSg7sb+yamS2TdOqOytCB1ndOqbsBJZqw/+wglqlNvalsiRMDAsxlXlPpri4xViA0k7/e7MTgWUFdDi57WzkFZ1vq5bqkpgrd+mKoOQIhnnXqXG3D4d50cPuAuUL+lc/k9Bp+1S3n9hJBYslOD9u3USxqywmUx8U598kq8qDxWYt2COUAZL40Q50V3D/VZp5G2hQFxh1PR2PMttd4MJBAw6RwJmWZcaUri4ZTqK3ohkA1rgPq+TifR/Gz7BcyqchbMMP45bCi5MBbtpMyXG8dUd+OGb63IzdCGTofhfDkgNIyquI2fjUnFFkgQo4xGqH+M/45FtJvGj19npsI1Qwc3SZvtPFE4ouixqTT8Haa2Kdi/ClX4R4Wmze9W90VcH2KZLrWBVcsTbOkI7KR95ULHCIHPZO8ZThAQcnaIdNFQ=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39850400004)(366004)(396003)(346002)(376002)(136003)(451199015)(66946007)(66476007)(66556008)(8936002)(8676002)(36756003)(41300700001)(83380400001)(478600001)(6512007)(186003)(26005)(6486002)(6666004)(6506007)(52116002)(38350700002)(38100700002)(1076003)(2616005)(316002)(6916009)(86362001)(2906002)(5660300002)(40753002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?6+emJS4TZGK4fB864dOwas6dJsQqT3B7Qr+8c6N+DlcGBesVP9j/RlyUbSPB?=
 =?us-ascii?Q?q+q1q4dIs+rOZicYvaieGQ9rX8va0Bl9MeiIua5qEFrQh93d8vJroAFKjONM?=
 =?us-ascii?Q?yq/35zm2jK9A6vy+FC14rLN+nbn0G1e4vSsmvlH9fQMq2+PW8gzGgD1VveUT?=
 =?us-ascii?Q?c1AnNVZSTqlJpZBAhT9Jf/1KFfoHCeyvhM5oMgdUpE4Gmn1oifvh9pS53xNz?=
 =?us-ascii?Q?e/GVICQ4DPjkrOyyIOr7lGXjiRXzjgM5JBy2HMh+GhDEWjldV0qTkdhT4/F8?=
 =?us-ascii?Q?E5ZYOiIbl87gNlmyfbGiaHX3oIqRVm+kPG0UndFOgKP87kQEB6zCDZSTG42g?=
 =?us-ascii?Q?UbuGikcdGFZfO9MfhrAL7gu/U+vL37Bx5mkDVAKsZL3p+yqHsgGnOL/KYX3Q?=
 =?us-ascii?Q?TQTXM0Ru/jJNAkepuafQW77/JIxfhOF7uvecpW44Bh7+mR8NHm7M01Vo6Ate?=
 =?us-ascii?Q?oOoQn71c0lKJJpklWF9Aae8rAFhrvu7fY5nDdgxRw5dL7SFLgumF6VdTVBf6?=
 =?us-ascii?Q?TPRnv1LoXPHMjYn8xvDoM3SHYKsZFUiFTyW5LTg8HgqjITTS9m2O+aD+yKgu?=
 =?us-ascii?Q?YWug0FleafxvkE9LAj8iiXEvSuO0+rM7/q3PM9yRt0esvwq5M2YWWdbnHhxZ?=
 =?us-ascii?Q?NK+M7C6CKcDRXU5XXmXOmxM6NKDKsF9WSzdk0p2qHmmAu3rYyTm9jVDwsNxk?=
 =?us-ascii?Q?5F0IUWf4EXcYYIGfpWnv6LOZYeI1k8hmcFEMPSTXOr3w8IV6vA0Jq2A4tcOf?=
 =?us-ascii?Q?YacEioWWfoxMZ0HW34fMcwhZxEQJ+VPYBds7QpJrMYYctTmRdMphi2cu4WW+?=
 =?us-ascii?Q?RJxZqqWE6aiWNYAEVPZqQHrDLaZmDW/8eyoOQdgUn7h/tRurqox+TB1lAIW/?=
 =?us-ascii?Q?0H06rUnuAMPGfNyelkryt9tnYL5CJMeuhvdLBIuiTeK7OVa2rwkiX/MRzEdc?=
 =?us-ascii?Q?86RutO88OHJtclHC5ddyQwY0c+oZaL4ms60DijI9G64/BSxCwgkp2pPaFtE/?=
 =?us-ascii?Q?6+iGsw6mOHIi7xYR4L6mFi8iKY+GyU7Rw8lJ4UCb6rXkC/bMyOAAFqh+2vUW?=
 =?us-ascii?Q?3WDq1vOKzGU2u93iY2LGtabZ5ZyXHqCQiOl6UTfQv3z6uEV1r1JZtf4p/7Il?=
 =?us-ascii?Q?wH1u6S6RIiIMFjewdhMCOr0C2tr51P9zdwdhhBXNbbMRszG3Bv8xQphw7egf?=
 =?us-ascii?Q?vXasDdQz2zMp9i+cReKKnUkmUVVpD30cKwP1hdMozwjQ1J3vjWVJnEFy/asm?=
 =?us-ascii?Q?GxXwZfuOLxXKQo7huiZTS/STJVorEcUdej8rwLT/3QZjYagQoyPWkulfKl46?=
 =?us-ascii?Q?jXaYMHj3uhtZRBeCBjy7urUCuTQ65IyRSgFCSyvaHGlNo9A+0b3PxDX5paZH?=
 =?us-ascii?Q?8Vd7NvX+dx7TyCqVF5Xq01KfK1lV1/UgxTMt4TWJaifE9qIUNkJ74GwqnApG?=
 =?us-ascii?Q?IVp1CamlLo1birV6nGJw7JU1oHWDMQi2CfeR7QGRPASOAPR5kEmKEnbFtiWQ?=
 =?us-ascii?Q?fCJRfH5PHc3H4wK60E0XDCtQXESDdwnaYxMGJ4JAXPHNdK8tiKpMj8r2mSZB?=
 =?us-ascii?Q?DRSVnI2fM9fd5U4ll9UcaIY9c7dGJLcqai1X+QkFmaxFb9ekqfFFGmlkutYJ?=
 =?us-ascii?Q?Kw=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 87846466-3e42-414b-c585-08dad9cb614d
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2022 09:54:36.1672
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q9tw5N9PP2myQxHHRylYJKOKZuw5Gfvdg6u9u+z/HRU0BJWhCZj8hig/WTs1iBfFIZQhcJTrQimLJZt1WZMXoQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4876
X-Proofpoint-GUID: hDMaB-RTt6Bsh9fuzaAjb-fETzY9MyXh
X-Proofpoint-ORIG-GUID: hDMaB-RTt6Bsh9fuzaAjb-fETzY9MyXh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-09_04,2022-12-08_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 bulkscore=0
 clxscore=1011 suspectscore=0 spamscore=0 adultscore=0 priorityscore=1501
 mlxlogscore=921 mlxscore=0 lowpriorityscore=0 impostorscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2212090066
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 09 Dec 2022 09:54:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100002

Without this patch, even if dhcpcd is enabled, the NetworkManager
cannot find it. Below are the messages from NetworkMananger:

  dhcp: init: DHCP client 'dhcpcd' not available
  dhcp: init: Using DHCP client 'internal'

The problem is that dhcpcd needs to be specified as a path, otherwise
NetworkManager tries to find it in /usr/sbin/dhcpcd.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../networkmanager/networkmanager_1.40.0.bb                     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.40.0.bb b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.40.0.bb
index 49b054d6f..f5a710f98 100644
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.40.0.bb
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.40.0.bb
@@ -104,7 +104,7 @@ PACKAGECONFIG[ovs] = "-Dovs=true,-Dovs=false,jansson"
 PACKAGECONFIG[audit] = "-Dlibaudit=yes,-Dlibaudit=no"
 PACKAGECONFIG[selinux] = "-Dselinux=true,-Dselinux=false,libselinux"
 PACKAGECONFIG[vala] = "-Dvapi=true,-Dvapi=false"
-PACKAGECONFIG[dhcpcd] = "-Ddhcpcd=yes,-Ddhcpcd=no,,dhcpcd"
+PACKAGECONFIG[dhcpcd] = "-Ddhcpcd=${base_sbindir}/dhcpcd,-Ddhcpcd=no,,dhcpcd"
 PACKAGECONFIG[dhclient] = "-Ddhclient=yes,-Ddhclient=no,,dhcp"
 PACKAGECONFIG[concheck] = "-Dconcheck=true,-Dconcheck=false"
 
-- 
2.37.1


