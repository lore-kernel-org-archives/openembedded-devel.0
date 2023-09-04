Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E923CC71153
	for <webhook@archiver.kernel.org>; Mon,  4 Sep 2023 06:49:21 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.43037.1693810157099252668
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 03 Sep 2023 23:49:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=kzAdWARN;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=761162e5cf=yi.zhao@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 3846WOEJ018555
	for <openembedded-devel@lists.openembedded.org>; Mon, 4 Sep 2023 06:49:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:content-transfer-encoding
	:content-type:mime-version; s=PPS06212021; bh=4lACz9QbuzoG14CJ/k
	ujjukAaSAw6nLTBZmJI75DSvw=; b=kzAdWARNU7xg/w38OXZpuWZ/yYDrasCET1
	/AN9IHUS/3xXDsrLq1gN1rtsjcoNHTZ8BnCliGnjgXLaafETUQelxlcrveU2Z3rC
	7QldJSRtJNIGqUBmYjOu8bI5llfQG6cR80IPf3RsQlnMfMEy7xARCAOPEe7zIBuc
	uKU15LllaM/8V906QDyE7Ds0vfmQS5qtxDxkbZTkQcXFSZFo8iwNOczavpUN9bz6
	csXRK+XUQzreNwzpAi4O/UMzrIjCoTkQ45KjULlq2JIuDBpG0OpvamUcbS3fiuWY
	PAJKJT4LU940r1piSi8Orkf2yavh6l0I+1nuRcK+etG+scV+zZ3A==
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2041.outbound.protection.outlook.com [104.47.66.41])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3sw33k07b8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 04 Sep 2023 06:49:16 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZtRvNnDBzybWc0bu5ikyg4C0bc8M/T3pyJeGITCXmqy5qXBqiQh3awEtG9bx8TgCwgdfz0ozzjV6qf6juwGGUbzBnC6me1rVkldSSVs+nKFJm/HUotbdKA/pID47ON4d6vvmpX9LsQPcnR6McAI48U6ONQukXbIQP76pjq/M9QjXl5hCrYUR6nm6wjpl8E/5L9CWapmg+VfGqntrt2a+rd1LrYeFOW7+kn88VUJB9evgLVewl8PSVfu6GHLjNk2WTnZCTtqsYFwwpMSr0ZhdKRzXbV9eKPobCO2rAH9wNnpCA6w7yU93zeYKm5knjXOCAZIEjOLkqKSElcMDmIkFzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4lACz9QbuzoG14CJ/kujjukAaSAw6nLTBZmJI75DSvw=;
 b=e2t8DZb4ox0BmmyFy4GF7QSHQlzTkQ+/mBCIqNu6bC0RLRY7NtAS4Hc6O/Z3Rd9Gzh4kEBcp60GG9tRS1Y+QQnbnzIjwdOBWsBNjdHhVEpAHMak0paw0Opz43cOBNxvk8QY9UgsKxfMm+Mox0895jLyHWzVsGUwU2MLm3K12SCtNIcUnUMCxCEqJmJmKSeQWbLUHVDa/1Rnr3hF2Px5PsUhyk3VTz8duSOpmEGy07O886+t1wMqqC3kG0KLylxzJazb11VZFbdj+719J1nRGoiqgHt6R6JKYfnjkxghjh6ibFedA2dmFrrWgOgHdnXjIdeFASmLYpk+e5APmaXRiIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by SJ0PR11MB8271.namprd11.prod.outlook.com (2603:10b6:a03:47a::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.30; Mon, 4 Sep
 2023 06:49:13 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::1ba9:4bef:c1a4:306]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::1ba9:4bef:c1a4:306%2]) with mapi id 15.20.6745.030; Mon, 4 Sep 2023
 06:49:13 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Cc: liezhi.yang@windriver.com
Subject: [meta-networking][master][mickledore][PATCH] frr: Fix CVE-2023-41358 and CVE-2023-41360
Date: Mon,  4 Sep 2023 14:49:01 +0800
Message-Id: <20230904064901.247455-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCPR01CA0099.jpnprd01.prod.outlook.com
 (2603:1096:405:4::15) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4867:EE_|SJ0PR11MB8271:EE_
X-MS-Office365-Filtering-Correlation-Id: 135ac704-23cd-4231-25ef-08dbad130cb6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	70zpjI+Rv8cGcg4STP2vzL698DnJzjWCdSIw2T4Tp8xASm9LwDXGQobtOWjIyXWWCNu42twznAfrThd7SD/TQHEeplc6+vFZcj+84oZgSketahe+3SwLwM3h46m8nBZuLyVdO+QgdFdMGRU/t6LrTtAP5f163GfbHDEOPn2QRo4suUl1dJVMBrYOP6idCrheUErf9PN2S/cTesc6npW4kF4N+3ABRpOoCzwRfIEJekYJjL3h0dKSAgL8UemSceRNik6qdWS24gyAmLHLr2KlWDuk8NIJ0nGrdJLd7S1T7BRyPvmUMAnT+hAb7SFhFGOpclxIsTgD9JilKhF/ug8gatfutTkVAtARSEezBv8qVgQR/islQTuqlltV8yGP2Vo+CdHoZQMh7Vo8HxeWng4RlbYxOGHs2HgfjBhi7LvIq54bw2y3Adi6foomOy+vtWocAq7If0MEo9cTxpjiyiI2w/LIZBWhaGqlVP3Oi5qoUCtYqpNH+12fenoTTsawZqLOZHrEJe3j3a6Yzh517t/jTDoApHuLxtA00SQJTxavY399jKZ7DBQ2jMBA1T5SqTsMVsCE6SlWS3gjb+JdWImS2i7h8vgIsWZ2B73SjMuPed9FtqZK1//QmRDDYu27j/92XgsC3xqrwUKaRo7D4RhV2Q==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(39850400004)(136003)(396003)(366004)(346002)(451199024)(186009)(1800799009)(66476007)(66556008)(2906002)(36756003)(66946007)(19627235002)(86362001)(316002)(6916009)(5660300002)(44832011)(8936002)(8676002)(4326008)(41300700001)(1076003)(107886003)(6512007)(66574015)(2616005)(38100700002)(83380400001)(26005)(38350700002)(966005)(478600001)(6506007)(6486002)(52116002)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?cZvDL/8pF9ux0WIkydNYqSrancDGyDmnP1K7VEKEJ6G8t1EBjqzVhntszgnN?=
 =?us-ascii?Q?UNA85xOXHH1TpzAUJhWn9NpEAVvU7l+hHY3PM/B/Clg2XU1Ncuz0Ch9tG/Re?=
 =?us-ascii?Q?hfU1Pgr4sl7v02oeSkvQdePdVMQkQ0y9bnRTUp3Yl6XxKQt/g6wlMdSqjZtQ?=
 =?us-ascii?Q?gg25wA6NPrzRpa3+lCKHU6+ijA1iwXuyAS2q12nHAjW4m1rI3u0C/bLu05CS?=
 =?us-ascii?Q?oNHC589Z64lC4jG9EoRvRwrym59KXmlpc4dZ5ZsiXYbZjAZ/7s65jpVT12gO?=
 =?us-ascii?Q?kEaEjgBexm6ni+oQ5G3n7dFu7lTLf1LZoarjn6CE75dkQXxRo6FuJ9nmSbGG?=
 =?us-ascii?Q?f833oxB8RO5jNGtyQqpPZXichQukmY6IYZ57/DHVmkhpz23URB6Ca2s1C8Gf?=
 =?us-ascii?Q?drqxMMVM6PZ210oqxKPBBCnhxxbI9EyF2CGcm+faGcTLYlnaa/K5NMYnlItC?=
 =?us-ascii?Q?m4+CXIuJZ50RxE1PfN5x5QwbT5lTwLZTq6Dp15z+CJN6sNVWWOJna9Uoutf2?=
 =?us-ascii?Q?wc6LAgyV5kRPZ1YmTiRmfpHRhefXQFnnGaG22wq7Fg/3rX4R7imITh+btRY/?=
 =?us-ascii?Q?HNrldJ6TgK2tKgf7/UqsjhrXb4i2kCJ7xwOAC+rwlp0yVLquPunMiSarG9JD?=
 =?us-ascii?Q?bksaiMJjUWfJASE+JxSrYRlwboY8orxqAO9Be+IWwkvCz35PtBD4574nRPC+?=
 =?us-ascii?Q?k83P90auxu8DNqNOsI9tUVt4S2mAJAQe8dI7m8SY2ilGPFoDYUxk4LZSIC3f?=
 =?us-ascii?Q?A4k2bbwe/hFiWaxnJnBEUjol+GROb/c753HRDYrn4P5+JHVjrss8h5tRGZVq?=
 =?us-ascii?Q?QjliuJtQ7TQ8+y9eZmsBKojSD/XjWWOlXVHMRSoRSvvFNfTTwYX6PFDFP5Mx?=
 =?us-ascii?Q?KHtKZckfO6WJQ4lplM1G4QHsqwUHCjxUrmoI/6h3wotuhpmLNLWUEvca0eKE?=
 =?us-ascii?Q?Yg/hg/mN1Lg3oErqWLed7qm9ylrbqNMVeqYNbNeQX82gBiKxNyoHcJ3CtnPY?=
 =?us-ascii?Q?rqadPrjoVTK58AEL87tq8IfhpbmvQGRjwtANdQuaTIVZ8aJ7xwh6gF9Xu8n9?=
 =?us-ascii?Q?+WlTJPs4mlc8qhWJZopMXiSyFJQogowmsl0IpJPOu5YKKSyY9daeOmxToBt8?=
 =?us-ascii?Q?PhRvL5g3pUlOzyFbGXwJjXDEwQ9Dx9lzyWK1E0nLyY9gwYk5khzUAj1FQFal?=
 =?us-ascii?Q?LajrImCjrZLz+mrtgUPxuTWngHjxo3b3br4JjDF1f8R2nd9ITJx6MpwA6XHx?=
 =?us-ascii?Q?a2+e4lhyKFGsoGuTXN3oE7eKR1r7bJM+7XOBBSAMPiHHDMzuYID7kbbJt12L?=
 =?us-ascii?Q?K2lDAt1D9DN383DkQB4wjwPvo2KEaP2oNgQPGwwSeAF7NgssxaEXGgG+NTU7?=
 =?us-ascii?Q?owxvuZFQFHvecq5ojstjIM2SlAYJDvnnxvACgfsnFWEEpfzYP6kH1xMlaxB7?=
 =?us-ascii?Q?bAJqC/23Zt782/um+8ftGTxYzJB8O/xn1mSEzLAEb71oKSl0fVdi2vHXS/Jk?=
 =?us-ascii?Q?Qtdvje1PGv2i5s/DnnYx0twekR8C8JkrQf08ns+dnbhuDZdwa1v5HStm08O2?=
 =?us-ascii?Q?UaLTraHwF695VEjZYbSysqi+SbDWKmeDdf8j2ro0?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 135ac704-23cd-4231-25ef-08dbad130cb6
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2023 06:49:13.4282
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xE2z+3FxeLcxcJjdFAJmNNjVJwz9aq6qLQZE0lYDsbAw/X9LVIASHkaJu8NFi50lcI7n/8YJlVe8JtsFNy+nuA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB8271
X-Proofpoint-GUID: x2MSoUrjp238ihclJm876HFLSCnhJoJG
X-Proofpoint-ORIG-GUID: x2MSoUrjp238ihclJm876HFLSCnhJoJG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-04_03,2023-08-31_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=999
 clxscore=1015 malwarescore=0 bulkscore=0 spamscore=0 phishscore=0
 impostorscore=0 suspectscore=0 priorityscore=1501 mlxscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2308100000 definitions=main-2309040061
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 04 Sep 2023 06:49:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104704

From: Robert Yang <liezhi.yang@windriver.com>

Backport patches to fix CVE-2023-41358 and CVE-2023-41360.

References:
https://nvd.nist.gov/vuln/detail/CVE-2023-41358
https://nvd.nist.gov/vuln/detail/CVE-2023-41360

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../frr/frr/CVE-2023-41358.patch              | 106 ++++++++++++++++++
 .../frr/frr/CVE-2023-41360.patch              |  35 ++++++
 .../recipes-protocols/frr/frr_8.4.4.bb        |   2 +
 3 files changed, 143 insertions(+)
 create mode 100644 meta-networking/recipes-protocols/frr/frr/CVE-2023-41358.patch
 create mode 100644 meta-networking/recipes-protocols/frr/frr/CVE-2023-41360.patch

diff --git a/meta-networking/recipes-protocols/frr/frr/CVE-2023-41358.patch b/meta-networking/recipes-protocols/frr/frr/CVE-2023-41358.patch
new file mode 100644
index 000000000..59633ef69
--- /dev/null
+++ b/meta-networking/recipes-protocols/frr/frr/CVE-2023-41358.patch
@@ -0,0 +1,106 @@
+From 9efd9a47db4f13ebf88c2ffe14301d7441bcb40d Mon Sep 17 00:00:00 2001
+From: Donatas Abraitis <donatas@opensourcerouting.org>
+Date: Tue, 22 Aug 2023 22:52:04 +0300
+Subject: [PATCH 1/2] bgpd: Do not process NLRIs if the attribute length is
+ zero
+
+```
+3  0x00007f423aa42476 in __GI_raise (sig=sig@entry=11) at ../sysdeps/posix/raise.c:26
+4  0x00007f423aef9740 in core_handler (signo=11, siginfo=0x7fffc414deb0, context=<optimized out>) at lib/sigevent.c:246
+5  <signal handler called>
+6  0x0000564dea2fc71e in route_set_aspath_prepend (rule=0x564debd66d50, prefix=0x7fffc414ea30, object=0x7fffc414e400)
+    at bgpd/bgp_routemap.c:2258
+7  0x00007f423aeec7e0 in route_map_apply_ext (map=<optimized out>, prefix=prefix@entry=0x7fffc414ea30,
+    match_object=match_object@entry=0x7fffc414e400, set_object=set_object@entry=0x7fffc414e400, pref=pref@entry=0x0) at lib/routemap.c:2690
+8  0x0000564dea2d277e in bgp_input_modifier (peer=peer@entry=0x7f4238f59010, p=p@entry=0x7fffc414ea30, attr=attr@entry=0x7fffc414e770,
+    afi=afi@entry=AFI_IP, safi=safi@entry=SAFI_UNICAST, rmap_name=rmap_name@entry=0x0, label=0x0, num_labels=0, dest=0x564debdd5130)
+    at bgpd/bgp_route.c:1772
+9  0x0000564dea2df762 in bgp_update (peer=peer@entry=0x7f4238f59010, p=p@entry=0x7fffc414ea30, addpath_id=addpath_id@entry=0,
+    attr=0x7fffc414eb50, afi=afi@entry=AFI_IP, safi=<optimized out>, safi@entry=SAFI_UNICAST, type=9, sub_type=0, prd=0x0, label=0x0,
+    num_labels=0, soft_reconfig=0, evpn=0x0) at bgpd/bgp_route.c:4374
+10 0x0000564dea2e2047 in bgp_nlri_parse_ip (peer=0x7f4238f59010, attr=attr@entry=0x7fffc414eb50, packet=0x7fffc414eaf0)
+    at bgpd/bgp_route.c:6249
+11 0x0000564dea2c5a58 in bgp_nlri_parse (peer=peer@entry=0x7f4238f59010, attr=attr@entry=0x7fffc414eb50,
+    packet=packet@entry=0x7fffc414eaf0, mp_withdraw=mp_withdraw@entry=false) at bgpd/bgp_packet.c:339
+12 0x0000564dea2c5d66 in bgp_update_receive (peer=peer@entry=0x7f4238f59010, size=size@entry=109) at bgpd/bgp_packet.c:2024
+13 0x0000564dea2c901d in bgp_process_packet (thread=<optimized out>) at bgpd/bgp_packet.c:2933
+14 0x00007f423af0bf71 in event_call (thread=thread@entry=0x7fffc414ee40) at lib/event.c:1995
+15 0x00007f423aebb198 in frr_run (master=0x564deb73c670) at lib/libfrr.c:1213
+16 0x0000564dea261b83 in main (argc=<optimized out>, argv=<optimized out>) at bgpd/bgp_main.c:505
+```
+
+With the configuration:
+
+```
+frr version 9.1-dev-MyOwnFRRVersion
+frr defaults traditional
+hostname ip-172-31-13-140
+log file /tmp/debug.log
+log syslog
+service integrated-vtysh-config
+!
+debug bgp keepalives
+debug bgp neighbor-events
+debug bgp updates in
+debug bgp updates out
+!
+router bgp 100
+ bgp router-id 9.9.9.9
+ no bgp ebgp-requires-policy
+ bgp bestpath aigp
+ neighbor 172.31.2.47 remote-as 200
+ !
+ address-family ipv4 unicast
+  neighbor 172.31.2.47 default-originate
+  neighbor 172.31.2.47 route-map RM_IN in
+ exit-address-family
+exit
+!
+route-map RM_IN permit 10
+ set as-path prepend 200
+exit
+!
+```
+
+The issue is that we try to process NLRIs even if the attribute length is 0.
+
+Later bgp_update() will handle route-maps and a crash occurs because all the
+attributes are NULL, including aspath, where we dereference.
+
+According to the RFC 4271:
+
+A value of 0 indicates that neither the Network Layer
+         Reachability Information field nor the Path Attribute field is
+         present in this UPDATE message.
+
+But with a fuzzed UPDATE message this can be faked. I think it's reasonable
+to skip processing NLRIs if both update_len and attribute_len are 0.
+
+Reported-by: Iggy Frankovic <iggyfran@amazon.com>
+Signed-off-by: Donatas Abraitis <donatas@opensourcerouting.org>
+
+Upstream-Status: Backport [https://github.com/FRRouting/frr/commit/28ccc24d38df1d51ed8a563507e5d6f6171fdd38]
+
+CVE: CVE-2023-41358
+
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+---
+ bgpd/bgp_packet.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/bgpd/bgp_packet.c b/bgpd/bgp_packet.c
+index ec54943f3..3c2e73c59 100644
+--- a/bgpd/bgp_packet.c
++++ b/bgpd/bgp_packet.c
+@@ -1951,7 +1951,7 @@ static int bgp_update_receive(struct peer *peer, bgp_size_t size)
+ 	/* Network Layer Reachability Information. */
+ 	update_len = end - stream_pnt(s);
+ 
+-	if (update_len) {
++	if (update_len && attribute_len) {
+ 		/* Set NLRI portion to structure. */
+ 		nlris[NLRI_UPDATE].afi = AFI_IP;
+ 		nlris[NLRI_UPDATE].safi = SAFI_UNICAST;
+-- 
+2.35.5
+
diff --git a/meta-networking/recipes-protocols/frr/frr/CVE-2023-41360.patch b/meta-networking/recipes-protocols/frr/frr/CVE-2023-41360.patch
new file mode 100644
index 000000000..8ee3985b4
--- /dev/null
+++ b/meta-networking/recipes-protocols/frr/frr/CVE-2023-41360.patch
@@ -0,0 +1,35 @@
+From 9ecacf2176d2bac4b90e17d49facb8712c1b467a Mon Sep 17 00:00:00 2001
+From: Donatas Abraitis <donatas@opensourcerouting.org>
+Date: Sun, 20 Aug 2023 22:15:27 +0300
+Subject: [PATCH 2/2] bgpd: Don't read the first byte of ORF header if we are
+ ahead of stream
+
+Reported-by: Iggy Frankovic iggyfran@amazon.com
+Signed-off-by: Donatas Abraitis <donatas@opensourcerouting.org>
+
+Upstream-Status: Backport [https://github.com/FRRouting/frr/commit/9b855a692e68e0d16467e190b466b4ecb6853702]
+
+CVE: CVE-2023-41360
+
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+---
+ bgpd/bgp_packet.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/bgpd/bgp_packet.c b/bgpd/bgp_packet.c
+index 3c2e73c59..f1d0e54c0 100644
+--- a/bgpd/bgp_packet.c
++++ b/bgpd/bgp_packet.c
+@@ -2375,7 +2375,8 @@ static int bgp_route_refresh_receive(struct peer *peer, bgp_size_t size)
+ 				 * and 7 bytes of ORF Address-filter entry from
+ 				 * the stream
+ 				 */
+-				if (*p_pnt & ORF_COMMON_PART_REMOVE_ALL) {
++				if (p_pnt < p_end &&
++				    *p_pnt & ORF_COMMON_PART_REMOVE_ALL) {
+ 					if (bgp_debug_neighbor_events(peer))
+ 						zlog_debug(
+ 							"%pBP rcvd Remove-All pfxlist ORF request",
+-- 
+2.35.5
+
diff --git a/meta-networking/recipes-protocols/frr/frr_8.4.4.bb b/meta-networking/recipes-protocols/frr/frr_8.4.4.bb
index f32b52f33..826b68780 100644
--- a/meta-networking/recipes-protocols/frr/frr_8.4.4.bb
+++ b/meta-networking/recipes-protocols/frr/frr_8.4.4.bb
@@ -13,6 +13,8 @@ SRC_URI = "git://github.com/FRRouting/frr.git;protocol=https;branch=stable/8.4 \
            file://frr.pam \
            file://0001-m4-ax_python.m4-check-for-python-x.y-emded.pc-not-py.patch \
            file://CVE-2023-3748.patch \
+           file://CVE-2023-41358.patch \
+           file://CVE-2023-41360.patch \
            "
 
 SRCREV = "45e36c0c00a517ad1606135b18c5753e210cfc0d"
-- 
2.25.1


