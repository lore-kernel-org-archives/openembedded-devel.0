Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C32CC4332F
	for <webhook@archiver.kernel.org>; Tue, 20 Dec 2022 10:02:02 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.46960.1671530514024489405
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Dec 2022 02:01:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=k7Drau6l;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=9353c41503=qi.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2BK9xFXF000481
	for <openembedded-devel@lists.openembedded.org>; Tue, 20 Dec 2022 10:01:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=+fR4y7qC94w5jRLsks60pE80b3WvhERYfQc+ShvdbUw=;
 b=k7Drau6l6HyOoy+8tMPYqy54ZlWb9v7jfUUkTavc0t2qv10sU1jpZEhxKyo4nynJl4hv
 lm9gd+ZK2Ss3JXkeAzwPjn+1yGT95ykujvbVgR24lEPcb+k05110LJxCssMQ1n5sO2Wt
 W2KXhgzxTp/v2+EInBrrruR4kJCneF6AGMUthTKry4nL9QG4om8FxDRleav1C00M69ht
 yjmb7upKWj2hglEX2qIV2Lxhx2/JC2SspNsV+fwVnvD7A6iw0zWm1Mo0heO/IM3o/m6x
 om/Td+VniMWHDAYw75Szts4hiSpGWx/sFZiuqOhQhZm+akPLg0mFAu5C42ahV9SNaRDk nA== 
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2170.outbound.protection.outlook.com [104.47.56.170])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3mh301j7ka-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 20 Dec 2022 10:01:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OqUNlJMMPrTxQjSq/rBvG+PyluYFut98ObKST0IjSbB9zO2vHgfZXQSe/j6Hk92k80QTWppbrXnIjXBN3bq2Yn56nHt+EGVHcSuVHbHS3of+sVw29K5LufQLxuLYbIfQeAKlEn8PkVhl7wvq3IFR+9KAm2kbYcJ9naCq6NG0hww55K+7uSN+QZpgaOQOzAaFshMT8GmSK+KbTOt3HrQOam1nKMNLb7AkQaP9x4oDPuskyNYiMHUtsrHqXe4exMo8UXH0Ne8vH/wEawJd4L5XNeAaSsJm57g42bRyfdNy0C8RPUY9z1C8cPB0vD0agvsFO147rk55cByfvMxT+L6P2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+fR4y7qC94w5jRLsks60pE80b3WvhERYfQc+ShvdbUw=;
 b=ejjqT457oi3imE4kM6LzNRxGY56kIfvw8jpi6Vtd77yJehA1UoGLknZEV4E0yTSDGVSAdhy2dvrZNHHGBSbzBD4jB1kQrCOFGgkNgjFWRZdmdCyrD7cCkkc52hgTK8fm3px3bqY1TgToeCnnx6o3PRgGI9Avd/o8GWiG2ChVBFTq6MmdHErC4MtZylxTby7hIWThYngyKOQtvpiO5WGhVQ44gttQB0KfL5hUPs0NsRXXkDa4lkrfFKiV3ZcToRDgmqs3etQTic5UtelBRvtBUDkDpTPFyBgvAQg97+azVjRGYatxCsfA+jcFhmz2KwYOD5WmEa2aSrwX4kpmUbgSaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by DS0PR11MB8163.namprd11.prod.outlook.com (2603:10b6:8:165::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.16; Tue, 20 Dec
 2022 10:01:51 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::3b28:4c3d:1225:fff7]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::3b28:4c3d:1225:fff7%7]) with mapi id 15.20.5924.016; Tue, 20 Dec 2022
 10:01:51 +0000
From: Chen Qi <Qi.Chen@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-networking][PATCH] networkmanager: fix /etc/resolv.conf handling
Date: Tue, 20 Dec 2022 02:01:38 -0800
Message-Id: <20221220100138.117315-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR04CA0008.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::18) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|DS0PR11MB8163:EE_
X-MS-Office365-Filtering-Correlation-Id: 98d62f6a-9aa6-49ce-2f0b-08dae27136f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	kczpjaFq2pbHsp/1CNGYdLWTEJvDDIjMEkQavWtIFg+QFaO1K8C2ig8ugGOm8Hv8ggADcfSUw1f2tRB1x0BKYas3pdeSODJyc1YLL62BuwQsqWhkdh+6LLOiQK/bCM2QUQWnTIo1UUmuFO8b3wj4qnmsTjq020/pkKY5h43zjovcnJGmk/eorpZW0IsjY7LpSQ9df3Rl5jzuB6zw7/IEk0lqQjzHfi/B4OyFkhord/0EjfEq/7YtfZpVKi1x66qdmdheVFhb+K8xUife/OpK9PcY21ONhFc6XdT1eEWI2Mhy+3ODy57WLkIGcjb6lCBhsGn0EKq3z+4i66GNssUGJVlpIdpx/MKpgEq3g0AWCUk9cEqofCbJDfQVHZodC5bLQWvw5e3Yi36wRDDg0SmjyVoPUpN9OUyrxqwwqt1c1ok3F7SQlhQSOBIYmAOuSx1JOrQjzNu1YknTja59H3uxoPOX66uOWHbVGcp9LdJW9lGs8lOxzTrh9h5kuoC95+QIhHryZ/wzlj44gIRJLLKMRt/8iHcdebak1jXmri1zQjP4Diq/3nI6RLOPuHmTx10fuBUSwpCN96gDBIqQ7tApt8RTl5Rddt1K0aU7LWNhPg3XmR5E4XRNSMqBxIsG0gZ8nMTui5xjRMDIn+ts+VBcDZWMTlsnxK0E53vHDnQAoSC6siM22jPM0+1C+ul0QGHRm6tjFjC3wcS0gkkNRrmdGA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39850400004)(136003)(346002)(366004)(376002)(396003)(451199015)(38100700002)(6916009)(6486002)(478600001)(38350700002)(316002)(8936002)(5660300002)(36756003)(66946007)(66476007)(66556008)(86362001)(8676002)(83380400001)(26005)(2906002)(52116002)(41300700001)(2616005)(6666004)(6512007)(6506007)(186003)(1076003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?vPTuJyqKK8CLSEJ+BLxsVh/qf/WJLyCdgSLEPuXb8yB0TiYZNxPEoS5o6dme?=
 =?us-ascii?Q?6hwW+BUPtHKzogZN4SM3xieY0jQiYZ26/JYBVCRFnvm6xKVDI+6jilHH+RYo?=
 =?us-ascii?Q?6iLcaUYhRNa7witYZ14JBgrl5/TzsseeUidLNsY0IC4i9e5R/3lwBTbooq3k?=
 =?us-ascii?Q?RLIC5Qc/9Orkd3SyJL1GF16REIJJgLEJyhbNxpq2UKlOwtJ/E1wZlmPiAowG?=
 =?us-ascii?Q?XKbqqzUXdkPjwFv/9oIT/mSotnV+Jf8IbsEd+aLvEjld4iIIQmdwLkCQt9Zr?=
 =?us-ascii?Q?LgaTwlsCaMRu+E2NXr6TaJGCySLMgbFW1G4ULbdrK22+I0pOrnj4kmx75wiD?=
 =?us-ascii?Q?WAhYfKCJsR1ayNJCn3h8KNPN8c9gxtZzpDWZ6ufbdFkyKt+7XUaz8SU2MrEw?=
 =?us-ascii?Q?vOQeWxYqT5MGVwC/QWr4HtRm8giAuScdJMDV1Bu9trFHLFYPYbBSYdV+r7H4?=
 =?us-ascii?Q?MygQDH0ouWb88kA1UJLN+LpnbdkdZdot/UcXX5KJ7a6dtuui4tWAmCxVnUGD?=
 =?us-ascii?Q?PoZ9zMwVVh4F9ZYWeYasbtdb9h66muV2TLhnL3QO4edr8yxqWbb05uw6O3FA?=
 =?us-ascii?Q?o3YSQI2eEEkYMg1fG8eqvKVt9pAkncGMQx7e39dhv7aqkZdKK6/wB7+r6+E4?=
 =?us-ascii?Q?Fnw6gAeTrJKQcAd6cBgzSSwm/av+X6021vp2vYkLZmfQMt2M2Dwoyy9JJaoi?=
 =?us-ascii?Q?6e407n51qj+hBlJZxUeIIuRaNBAmZJzEjzl5Su6Sh6RdxlSvpx9stRnQlzS8?=
 =?us-ascii?Q?An0hjw8VJR0ALiiof+M+bTgcbZW9ZZLbhHXl8deRm4t6/aftvEPXcwVxr2iZ?=
 =?us-ascii?Q?WDRif1W8gHHnoYnTmWF0OiF8z08lnXReWS/c69nVyx+uAd3unDrD+lEQ+MqN?=
 =?us-ascii?Q?69CLvn7gKvOI09JP0c56upISWQFJOy353Q8EVs2pGi7JNDDnv1n5689dSaFk?=
 =?us-ascii?Q?OFQp55dD0ED6+CE7T8pSxA1epMEVJJ00s3/q44YGdsxpDpFwsbVnzl8tjWcN?=
 =?us-ascii?Q?YLnxXmGPz6+TY/qCO//A0i6qrc/vOSU6cKjhMFWE+eY9GDE9+quy21hpNcPK?=
 =?us-ascii?Q?KbhbpuQKMSlmws4hhBKnbdfObTsuyRBUNBXtzdc2QScMSN0a7Ljq7O9AH9GL?=
 =?us-ascii?Q?PU7t81GsRa1uplhwtf/5LJx4OeOE/zJdDz1tWD5+8EOmLD3NPrF6+gnyNaP4?=
 =?us-ascii?Q?oUat7ekB8XHhCFU57fZXI7eTFr81C5j+advvKX2eCSjqiLlk0q/82AI4uS8v?=
 =?us-ascii?Q?Q3IF7dgzNdiqjAUh+oPqquBSkr7edKkxCMfm3HXGuroPHIBNdxxP/5Q7knnk?=
 =?us-ascii?Q?06mGppA+Tnj6wI7QFGIA+2N+3W4TTLVY/Mz96Tr1OmF6xF+JiFUigUaCZZj7?=
 =?us-ascii?Q?j4YvQ3I1rfmOVWs07bbTdxkgXd9bHjZ+b5y6pPvezyrBvu4DOXVwqUsr5dlJ?=
 =?us-ascii?Q?YDTbvkN9WX8mSlKR8r2wrrnvSWPaQHH1tfaDXlhYxUe6lqy+iPZAUkVU4XTJ?=
 =?us-ascii?Q?VxZ1SaWfqrVA0v5O1wGxfV1OXqUZPnXiB+WiOsRXtvz8XqYz7iqQo8ul8wsR?=
 =?us-ascii?Q?eapnzdsg3e1qVKKhTH/VT2Mx4qRWqeOYCEMWfjUi7SE52T/RqGYL6h13qCOm?=
 =?us-ascii?Q?jQ=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 98d62f6a-9aa6-49ce-2f0b-08dae27136f9
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2022 10:01:50.9403
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /zZHjnTz0gPpy3RgJx0z3cm2GfcMcPV6n7mxyILAICISAmqpYNURWwCZljFLCoFqfht7OfD2DKCcFty3ytGnlA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8163
X-Proofpoint-ORIG-GUID: CP5XbnA8LVMAKcpjNMU8Z66oONCQ0jJD
X-Proofpoint-GUID: CP5XbnA8LVMAKcpjNMU8Z66oONCQ0jJD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-20_03,2022-12-15_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 priorityscore=1501 impostorscore=0 mlxscore=0 lowpriorityscore=0
 suspectscore=0 bulkscore=0 malwarescore=0 phishscore=0 adultscore=0
 mlxlogscore=999 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2212200083
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 20 Dec 2022 10:02:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100129

The current handling of /etc/resolv.conf by NM has some problems.
When networkd is not configuring network, and there's 'ip=dhcp'
in kernel command line, the /run/NetworkManager/resolv.conf file
is not created, resulting in /etc/resolv.conf being a dead symlink.
This is because NM is treating the network interface as externally
configured and will not try to reconfigure it again.

This means if we want NM to work properly with /etc/resolv.conf,
we've got to either ensure there's no 'ip=dhcp' in kernel command
line, or we've got to ensure networkd is configuring network. This
is weird because normally we should not enable two network managers
at the same time. Note that NM syncs part of its codes with networkd,
which is the reason I think it happens to work when these two network
configuration tools are configuring the same interface at the same
time.

In fact, NM now works well with resolved. It sends the DNS info it
gets to resolved unconditionally by default (the behavior could be
disabled in configuration file).

Looking at the original commit that sets up the update-alternatives
mechanism, it says:
"""
  This brings the networkmanager in sync with how systemd-resolved and connman
  work. Additionally this allows it to function with a read-only rootFS.
"""
I guess the author was using systemd but disabling resolved, and the author
wanted to use read-only rootFS. In order to keep such combination still works,
change to use PACKAGECONFIG to handle things, and when 'man-resolv-conf' is
enabled, the above combination could still work.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../networkmanager/networkmanager_1.40.0.bb            | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.40.0.bb b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.40.0.bb
index b9273ac89..801739170 100644
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.40.0.bb
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.40.0.bb
@@ -107,6 +107,8 @@ PACKAGECONFIG[vala] = "-Dvapi=true,-Dvapi=false"
 PACKAGECONFIG[dhcpcd] = "-Ddhcpcd=${base_sbindir}/dhcpcd,-Ddhcpcd=no,,dhcpcd"
 PACKAGECONFIG[dhclient] = "-Ddhclient=yes,-Ddhclient=no,,dhcp"
 PACKAGECONFIG[concheck] = "-Dconcheck=true,-Dconcheck=false"
+# The following PACKAGECONFIG is used to determine whether NM is managing /etc/resolv.conf itself or not
+PACKAGECONFIG[man-resolv-conf] = ",,"
 
 
 PACKAGES =+ " \
@@ -258,9 +260,9 @@ SYSTEMD_SERVICE:${PN}-daemon = "\
 "
 RCONFLICTS:${PN}-daemon += "connman"
 ALTERNATIVE_PRIORITY = "100"
-ALTERNATIVE:${PN}-daemon = "${@bb.utils.contains('DISTRO_FEATURES','systemd','resolv-conf','',d)}"
-ALTERNATIVE_TARGET[resolv-conf] = "${@bb.utils.contains('DISTRO_FEATURES','systemd','${sysconfdir}/resolv-conf.NetworkManager','',d)}"
-ALTERNATIVE_LINK_NAME[resolv-conf] = "${@bb.utils.contains('DISTRO_FEATURES','systemd','${sysconfdir}/resolv.conf','',d)}"
+ALTERNATIVE:${PN}-daemon = "${@bb.utils.contains('PACKAGECONFIG','man-resolv-conf','resolv-conf','',d)}"
+ALTERNATIVE_TARGET[resolv-conf] = "${@bb.utils.contains('PACKAGECONFIG','man-resolv-conf','${sysconfdir}/resolv-conf.NetworkManager','',d)}"
+ALTERNATIVE_LINK_NAME[resolv-conf] = "${@bb.utils.contains('PACKAGECONFIG','man-resolv-conf','${sysconfdir}/resolv.conf','',d)}"
 
 
 # The networkmanager package is an empty meta package which weakly depends on all the compiled features.
@@ -285,7 +287,7 @@ do_install:append() {
 
     rm -rf ${D}/run ${D}${localstatedir}/run
 
-    if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
+    if ${@bb.utils.contains('PACKAGECONFIG','man-resolv-conf','true','false',d)}; then
         # For read-only filesystem, do not create links during bootup
         ln -sf ../run/NetworkManager/resolv.conf ${D}${sysconfdir}/resolv-conf.NetworkManager
 
-- 
2.37.1


