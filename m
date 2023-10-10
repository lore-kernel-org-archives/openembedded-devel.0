Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7323CCD6901
	for <webhook@archiver.kernel.org>; Tue, 10 Oct 2023 08:09:56 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.85894.1696925387940405096
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 Oct 2023 01:09:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Zx1XBXHv;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=86479ee0b4=yi.zhao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39A5lv6f006008
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Oct 2023 01:09:47 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:content-transfer-encoding
	:content-type:mime-version; s=PPS06212021; bh=DT+9taJ2SzebB5HXzZ
	XUQiR6qfbWPj5c8Kl+VP0NQBw=; b=Zx1XBXHvpBrY6hWNCg4AR7fxOvIOpvj+xu
	iobLmd83pjRZzzCMN7R5kCcSwh0F6I8LhSff73PkP87OIU47CGegawrv+BZVGwoQ
	dHs7HsXr2uxPjqMCY8Hilg6azZ0ok+G88gsg+BtM04YRiTp9oD1Q3apTURDf2tjH
	WYa0ZM40IzFHPSgMVPHiXQBuptXE2uLZIGrUm82QiZe4zHgh+oNSDpjfe5fNxCaQ
	JuqteVyn6JJDo3FGdX0ZB2RvOWxUm3u2J//o5WsDgWTZkPzdzigATfqkZy8qLRk/
	Fu07odA8JjuDOgWayX6BDL/XnoPXeDHjOPrscSFPiYArAurGqeZQ==
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2169.outbound.protection.outlook.com [104.47.57.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3tk2m0jatx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Oct 2023 01:09:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CzxxHal/HvCtK765LESYbzp1njaTMxJ+06ZNSfPvF6pFf9ixTGMZFqQrBtwUaRxxmrJPVBphrZSmjD59dWLMufLpEbwC9MethFKuG5x8amf4HOUVstb7tyWlshJ38HJm4xqnzfuBU1gcixaSzDNT3JpA8fvwoS/1XpklQUMKo0LbSLh8URsslBjccfB7/SqpBe7o6+FXFwm5S/5sIL8s57Uo6GERMF+Im0i/dAIruV/zanyjmh23J+8DQT4e7tG7rK88SZe3oVVPQ3POAQ9l1//all4GlrFzagX70Dg19PhFbh7nx9itFPttQ9gG98VFFBkErt9kNPT8S1sNyBmNhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DT+9taJ2SzebB5HXzZXUQiR6qfbWPj5c8Kl+VP0NQBw=;
 b=OKwMhysPgg4aBUvZqkspeWBQj8jJE7KLYjtJjxmwbz3DLCM527A7hBOq2BNBmwHomVDP/Mq72O1AKecKOKOPX3O1VLXnNqhkGt3W4glLKBjKcIQ6tbvqjuyRPgRNwh9+bT41Be1TF88Ym7bMAe1G0HkkM5fWqqGPyvx+FWyV6O90ZwL9IysN4t2sSy5ZRkq4UoYGf4CGo5rukfdgWfUOL+MpC6p6LK8fhARcoPFpAcEZN2SmCxFL1xmredPqYVktqUfrVEwjQmbSfUQz57eT1ZjuUxYhtClzeqF+iFR1ap49sbjXkhoNk9Ff9Kjch+3SCJH5I1UYnUAuWb5aJzi+Ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by PH0PR11MB5577.namprd11.prod.outlook.com (2603:10b6:510:eb::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.38; Tue, 10 Oct
 2023 08:09:45 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::96db:9814:2d71:a957]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::96db:9814:2d71:a957%6]) with mapi id 15.20.6863.032; Tue, 10 Oct 2023
 08:09:45 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [mickledore][meta-networking][PATCH 1/2] frr: Fix CVE-2023-41358 and CVE-2023-41360
Date: Tue, 10 Oct 2023 16:09:32 +0800
Message-Id: <20231010080933.344216-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2P153CA0046.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c6::15)
 To CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4867:EE_|PH0PR11MB5577:EE_
X-MS-Office365-Filtering-Correlation-Id: bfae1f88-e7e6-4a4f-5f6b-08dbc968438e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	L/pnIzTNiKytk+fFoTwglNqqz/oV78k+SUl6cvdNppWPVvC4UwdMNOTIO6vqkTCr4l/hKrKPLTyuo8wMKufdvCT1VMq56LHoAUBhrjq/+qOwGKmDMJfTwRQBGcavLLpMPLHNvotPYrB6XkMQTmktWoBkSBFpA/ZGxWqU+kttkLdOoFXqvEkZyYrNOXtDqmuhIeAN9s2k9sNRP+nIAb/ef5bezhUE7SuSjNWN2r2WtvxqPstuxSyGn1GUwFI63B/aJkn5yXzLOWb4SjUCUirSk6iO6oDvA2qX4XWczksoVrSiUxqza7rXOZM5//s+o58CwBJtfbQaU2BK7k9h7NwlQZsredbj+NO8FpaXD7IBv+hs23zwuASWQ1bsv3tFAxc7wd8yvEMCHkBoCOF8yAsNQrVyixPvrg8T2mdAgkLX+PmYwFFu5zCY6rVd8EqjfitsmM0aeixi6MLYfBMymrP0Pos2URamJaovdcQE0kVJ6hY4Lyv/1gbimvElXidhQxAbTtCfcY0jDB8kgQgDUjUR9WHZBOPc1MoLgtf/SUEvSpUAdGAuojx7ph1gfBeXbA22by/8kHY8D3CkOJIkTxt+BkFJaWEx+wxRF1T754DjfzXshN38Qvyea1dPyesVresJtdyhUL40DOa2iiYmKnD3Dw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(396003)(39850400004)(346002)(376002)(366004)(230922051799003)(1800799009)(186009)(451199024)(64100799003)(52116002)(1076003)(2616005)(6512007)(36756003)(38100700002)(38350700002)(86362001)(26005)(66574015)(2906002)(83380400001)(6486002)(966005)(44832011)(6506007)(6666004)(478600001)(8936002)(8676002)(19627235002)(316002)(41300700001)(5660300002)(66946007)(66556008)(6916009)(66476007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?hjWabaDpB8tk7Kb1rX+pLSkaNZlUMGPzWV4DqhzwhQBlki8rSdHrCrhnQPmD?=
 =?us-ascii?Q?61P6JXGDRuiCO3E2TLoY6EwDl1ZeUvOpltaZJeyD74GlJmC7eA7eb09TNd75?=
 =?us-ascii?Q?U50GwQnuj5Ze3lVQcqo8OHMt7fjGQqlZpvMK7wd060+aPTsQHbiCjo0Ilzdh?=
 =?us-ascii?Q?Em7AhgF9gzcww5OTDytb/5dnsPlJ41dFxUrJVirLuugTNKkVyZbddCZdqsgX?=
 =?us-ascii?Q?fCWfp6SWTejHr6LJGyyUdaHeGQOMeX5tqhTPcRlxYeVl1zT2ADJFUH+O5pxX?=
 =?us-ascii?Q?QWhXi+efHtSTz4UsnpOjpR6bwwap/hDjxN4p+TTsgkDFnFF7XCNidYK/diyv?=
 =?us-ascii?Q?hDqr8NBN2kJG6yrMXNh1Sh3w8pz/nUdQF2TVV5BdquxKfdReTXnIhAoPy+Em?=
 =?us-ascii?Q?J4lk5OR66bMpciuAV1HdeHKdvTxL5skBnCu3EpgYELVkr2K3zdihon9j9aHa?=
 =?us-ascii?Q?mW+OaD8xgIcbsdLpz4aJfdmIklN+CL/Tj5F0d4tBCeJ8QtiFfsGH45Uzw5sd?=
 =?us-ascii?Q?Hyu2P9nwWhBsb0iuDtamx7Icvvm6tbHtPRdrln9aE9juxOvpcUyvAHOpLziZ?=
 =?us-ascii?Q?424QTp3wOHwQTuo9kGfb7oJyBxJWavDv/U8RJVjbJiZ5MZFVg+572RIRrw/n?=
 =?us-ascii?Q?mMLfrMcn8x1R/BkV8Er+SPvVwQV5/y3B1lsbeRpJp8kXYfLNKlXRLbZt2jmu?=
 =?us-ascii?Q?YxkVikyFIQcwSbEbRI7wHjQsuROpfECCfZZp9Fdvkky4BMgteZfyWQqJyBPu?=
 =?us-ascii?Q?fG1+gVsBWv2cy+CJEoI0ehgrqPgmJOPmZnuot+Z47ntkenZ7yFp19mVeRkXz?=
 =?us-ascii?Q?ImevQBe8XSqE4vBlCiSSGAc1OFdZ8X0ks9thlzcQtY/r8x366QcAsdrpyO8/?=
 =?us-ascii?Q?sf5WsBWcSv5a6o8V/HIcYq/Fj1G7rM6/e+0h01AMGSD6Ny2N+rJhQAoLm/14?=
 =?us-ascii?Q?HN9lItGOurZhznihEROCsgzWpbQjR2wGmIze5TWLGpvkTv1Dl2Cfv98+FoQ3?=
 =?us-ascii?Q?WdSrS9Ruk2RlxhqE+R6gjf6zIZxHrD8fI3mWqRgx4iJeH+u8bbNZxxqUnxNv?=
 =?us-ascii?Q?c47guT1iWChtqzLtC7pDNcfezYGVvKR1jNqLPFiXVTBf0HThlU45to0MIdb4?=
 =?us-ascii?Q?bPsWrgFGeG2tgO/0kYCapeyhiw9A0dzUPwVUnzOBbzE8Q0B3j3rQxyybWXAw?=
 =?us-ascii?Q?k926/T9ZhyRo+O6O/uBOX+EybJKNzdg0cBTEIZ7vjwM2FiYr/B0g/ZETStAe?=
 =?us-ascii?Q?azwWIseKZ37aQIar2sTUugYD354/MxKcPmPSV/916qH4r7hOUS0QoE3m0yJO?=
 =?us-ascii?Q?dXK0diKCurkuLwAmSCacRJ1wPR/6ziwYr7nruWGyJ3tJ59QD8Jp6gR3VRROC?=
 =?us-ascii?Q?ER/eR1KBwKcvLqYAuVstkkTDjTG7Ooh99vRW0eajo78kAHofQ18gnVfhVBFX?=
 =?us-ascii?Q?8lf618GhvLisxMURv4kKVIJHT8UpPLxqz9hIcwFgBewNPRpxBadV1Gr/zl9g?=
 =?us-ascii?Q?jZjVx2gkvfvxqpejTR1oBO0wxpmKhtNL9jJ2K8DSZ0wxSyPAdJPGljFbFAst?=
 =?us-ascii?Q?B3cjUKGW7v/YKFq7qlD/3WrheBzpnYeVgSdTWJER?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bfae1f88-e7e6-4a4f-5f6b-08dbc968438e
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2023 08:09:45.2253
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R7jlzA3lZhlWmWsWF5FpM6MMKUyP+HYQ5aazITHapFpkrWi3UoLPJoUJGiSZ4ZyN001iDjSaGKlcnZjoAx+3pA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5577
X-Proofpoint-GUID: nFEKMqfRupCOW4w4ygjPQqDSjh3at5Yr
X-Proofpoint-ORIG-GUID: nFEKMqfRupCOW4w4ygjPQqDSjh3at5Yr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-10_04,2023-10-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 spamscore=0
 adultscore=0 suspectscore=0 phishscore=0 clxscore=1011 lowpriorityscore=0
 bulkscore=0 mlxlogscore=999 impostorscore=0 priorityscore=1501
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2309180000 definitions=main-2310100060
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 10 Oct 2023 08:09:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105394

From: Robert Yang <liezhi.yang@windriver.com>

Backport patches to fix CVE-2023-41358 and CVE-2023-41360.

References:
https://nvd.nist.gov/vuln/detail/CVE-2023-41358
https://nvd.nist.gov/vuln/detail/CVE-2023-41360

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
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


