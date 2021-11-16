Return-Path: <yi.zhao@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0BC2C433F5
	for <webhook@archiver.kernel.org>; Tue, 16 Nov 2021 09:51:12 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web08.7809.1637056272041570900
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Nov 2021 01:51:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=fYMbXQ0e;
 spf=pass (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=695477d9d1=yi.zhao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 1AG8KEkb015127
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Nov 2021 01:51:11 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=xp25QgcC1RmdZPbKMm2gXHSSD1noyo16zRNYCywCNbI=;
 b=fYMbXQ0eWNH087VdW1HVqDvPSAlImtfeolwv07R9WOCfqAyAqCTqt/C6F2tuecRHbkhe
 Sv/4v9aqHVXxrt7HQ7LLq90cWEflFBI71KWJpYqUua/3VwHksFAdqSBOI2JUn+RbR2kq
 HRDQqT1WmYm36K+OhPLMa+Lae8aVdTHnmwx7N4HwwDMK5maROJBT1eifGN4jmn8mSDMS
 JuzP31t2CftD9IdIJOAXyzvWZJ3qgYymOMGyfbzLoHr0gHGMqG+fNsEvTs1UWcfHiqx+
 JoWaPTLi4R3opvYqk1neM+FsgEEqeVoeLicaFHF8F9bOD/Ecox5wloB0RoSQLgwTXZ39 0A==
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2108.outbound.protection.outlook.com [104.47.70.108])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3cbfw5h78v-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Nov 2021 01:51:11 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lfwj0J2RAKIN9urprNpBJzMpHSOaDEHJtbOvvJwZ+R2ZvCLOOwpP2s7VqjLysNXx/dYBbjX4k3cta42Tpx7mbeX/26B0etSawaE8hCXDbQydLY8eDJy+hKF+DN3YlDrrEGxnZbxZlbaRtwkb6QHCr9eGUkSGcv2BzSdiwMOBd7BLAKmzsJ0m/bhJi2cESDGPAE7hvJl46e1rGQbBHlSUN78BIaL4cUh+VP46RHKqWpLDd+CiN3JR0Qh4NrfwSPmFwm59vwDcpER44ar+vF5rkKMe6BTfDJlNQUt9r6ub3MevdjQtJ/Y7Sg0ZjBcLY7VB2IXwV57TEAbK6W+5GSIDNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xp25QgcC1RmdZPbKMm2gXHSSD1noyo16zRNYCywCNbI=;
 b=Tfl9bxxflUdQhUT828Qz/ikhXKyJTE01mZaTe9MNF6raylbePuMM+SujiMHMCDaYYgVuUG8HUwz8Nk0y/U4SBE814iWfFF0uhMtV5GHP/cJNa6sh4daX4mc2CmODO6CG0zznRzd8ZKfaYJJur1noxKxWI7xhJn6fKtZpB7TgW1KaRP1QTSeaSY4PQWvFj1vfESsStnqbntMCPGmF87r+7oSMKBxa4GxOuMDn7glPFtxcLrus8nzmcBo+0tLt4X50J1gBU7uEF6PbJoHNF6cxjupIXFM9pn70KExIfZtlj+0Yc3PqrU+bq9H6ogBarmy8fMLpxgS9Zccgv4OU9eu9sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by MWHPR11MB1999.namprd11.prod.outlook.com (2603:10b6:300:20::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.26; Tue, 16 Nov
 2021 09:51:06 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::455e:9cfb:d106:4480]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::455e:9cfb:d106:4480%9]) with mapi id 15.20.4690.027; Tue, 16 Nov 2021
 09:51:06 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH 2/2] samba: upgrade 4.14.8 -> 4.14.10
Date: Tue, 16 Nov 2021 17:50:53 +0800
Message-Id: <20211116095053.168656-2-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211116095053.168656-1-yi.zhao@windriver.com>
References: <20211116095053.168656-1-yi.zhao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HK2PR03CA0059.apcprd03.prod.outlook.com
 (2603:1096:202:17::29) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
MIME-Version: 1.0
Received: from pek-yzhao1-d1.wrs.com (60.247.85.82) by
 HK2PR03CA0059.apcprd03.prod.outlook.com (2603:1096:202:17::29) with Microsoft
 SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.14 via Frontend
 Transport; Tue, 16 Nov 2021 09:51:05 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f5872cce-8009-4455-6ee2-08d9a8e69bbe
X-MS-TrafficTypeDiagnostic: MWHPR11MB1999:
X-Microsoft-Antispam-PRVS: 
	<MWHPR11MB1999620509B671A66FEE3CBEF9999@MWHPR11MB1999.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	5CYDTTB/l01JR+pYkGIkRcEE661L1sSGJdgeOZ0pQCKvofmNSu6SI11YSexp2vIw4IEytR1oCAQB5MCoQy6usIz6gLUyXD6x2CdElEboQq50joQw2VnI/FyULAw4clKxuyYt7h9FNbwxAB+FXZUssE+QEN2Kg2QT0iPSnCYKFEIRoOs2eplONcs8/gxrfvROOgeYSAt3pZQ+npak4VAcVUAk5DbYFN26JnYNZh+J3LQK67BX6MRvTUiK0OZeBgFJtVouPC/QzeWtQRvVXRQp5VJcpHEbvT1N56d/y2cgSIbN3+BPKh7f0cyUl+Ao0gIgxjxsJWymEVBlALKq7FFv+InT5PUS6d4M8rhWQbZgkmYIdeaFyj9y+mB1I4OnTcFQTE9gFIrXEKSul1+QDKBGl6Cr6zEAAIjUP5mxzkPKin7+EDiI6+S89xoIGRintvlbSWNckKW7UtazVgRfHvKWz0k77AFPtQ0sVSz5DgjN2BDppR2EP1aDUcMXByWzyKYHeVXMUuD+Cqo020w/fg9vPN0S9zZk48dVahM1Rt0Vvn29JToygJW1+VV5FIZIdbMxalO4HYST5UXA7VUsBtW+VWhjNdiiAUqiKn7T9tIs4txntUWyf90zX7l8JHoKKCj7JtvteURtvu+MYTyUFw1KtFIOrp1Srsaetvic8mOIeBYQobVrJKG9vfhW3NBlIDkX2K+RvOJv5rtX7awn9/kjcRyf/jWacMkmk7LOrn+CUwJ5bX5WRHfJfiv6QDNvhHws24sMLqy9UBbicM7GYOxHDwtw0s/RNVNHILm7Hx6caID2imiHVSxHuJ60Zo+2PPficrQyWLXhgQ0oyjVd1H5QWA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(2616005)(2906002)(6506007)(316002)(956004)(966005)(6486002)(186003)(66476007)(66556008)(5660300002)(6512007)(86362001)(6916009)(52116002)(6666004)(8936002)(38350700002)(66946007)(38100700002)(508600001)(26005)(36756003)(8676002)(1076003)(83380400001)(44832011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?7l/KZLI6WabD4DbEWCLADLASfnweRobgWZ54WoBi3z3GOfc8RM2lc239IUGf?=
 =?us-ascii?Q?fLFO9Qy+jK+6ccWn6cYVv/HubZeKklc8Hjbk8z2oU3vmsqZUCXnCDNcC2i0o?=
 =?us-ascii?Q?j1q839sb37GeWj1b+j63TE+vBaeV8JkzvaN4EJKIZxzk7FwfE5i3QhVnTnQg?=
 =?us-ascii?Q?kFdavt0tTCKS92hmtdDh2yx0J80i8yCQs5S6BFAWWCTqieRneeUdlB2sZxuj?=
 =?us-ascii?Q?bN3rXwlO4wq6xiG3pQIbx1hUFSXjs3ssBNkvHCpCcBdRHbXX8IseHRmC6Jt/?=
 =?us-ascii?Q?qyLD4wTW8mk+TNDBRcRtOR3sD/td7VPEpdl+zhJZsK6M+ARWq+WVhU2Oj5p/?=
 =?us-ascii?Q?DuYMNpi89AyReVapdqL8UzSpUx3FqoUzzc6Ef5jSgZYYVX/kpAxnb0ho+PIQ?=
 =?us-ascii?Q?eLEVTbs6wZWsw+ZP/8POTAqbe6MZaSuEVqaG1/8kVb+Ax5rA+ZYF5LB6UgHV?=
 =?us-ascii?Q?Td0OtwBt1x/bq0d+8DNru70wVbVTGeYk26M/kpecOgJzSEGOvpGEpdCNSiU5?=
 =?us-ascii?Q?B4lKDK/jUfi2Wu5Pm3H1ZuhmW7K9muQbEcL5sglig5DAavG4rkp0XHUX7ook?=
 =?us-ascii?Q?URs1iFvI5CKwP7pVgxv0JHRE18MLKVojNtDn/eHXHhfvHLs8j11EImkYmDmQ?=
 =?us-ascii?Q?HlSSM1Hvess/ZfAiuuP6cXK6GV72ekkRsAsC8ND90Os2BlR/GwxJHbX2KCi7?=
 =?us-ascii?Q?FzpjUgwXY6wG8J2yZsSzV7BL/sCmd4jxxcNQgNLQhnaTl340JzH927sYZhHd?=
 =?us-ascii?Q?mBjPgeGZ6P9Om067N06xoHZt3Krs08aF1iSk7ErZebJZ2BF+8MEY0J5r/4SE?=
 =?us-ascii?Q?AgNkW5etwewhsRBjjoNmxixWKB3g0RtjeKcTIyrKatc5gBhe16GKQixKCIOw?=
 =?us-ascii?Q?sT8cf6OVxqY2a6joArslc+aR7jpJtWXxn7p8W+yubf3djI+I9a5IJD/d2sEq?=
 =?us-ascii?Q?jJSlT20r6zeJKUfLu2NBANTRLHO34nK+vEhOLEBfPM0eHlvEsngvqMTbSQr5?=
 =?us-ascii?Q?maK277Ap2J2chA0eu5iuImlBiY9+iHGInMxjNsVgDKgBSndaQiT1YpF/XBvh?=
 =?us-ascii?Q?B+9A8kMUBhQFjUtiyr0q1dL1pl/rFf6FlLd7ExPjZ9ux6nKfmlDHlJ+ps2Ub?=
 =?us-ascii?Q?7grQtFOdzisiFvgGZMlF11AnXNM8Fk4RA/hXfZVXfWwzrCuxjZtkCXZsgjEt?=
 =?us-ascii?Q?1lDCZxmotFLskG1C42uBYTlWZ4X6iatCwLrtg4aZ6riblElJ307M+dLjRt1g?=
 =?us-ascii?Q?inmE94AlVZaPHYT/wjLRCItIcNQHGPTqP6mowNKrQgm2DavpmFke9Fe1zw7t?=
 =?us-ascii?Q?MPGSsqaH1jHHncaJk56Xzf6IsugYgda7bGeR/DKYhZBTEyQvGhesE9yrJO/D?=
 =?us-ascii?Q?FSyDBX1PPu/4n5+FLQghV1r9bjSvaPeV+dHVFg8I6F0YU6YBc9s4Vs/o7sPy?=
 =?us-ascii?Q?axiWRdkfJZl1aVHlUqlcJOYATKq1HEpx4L0dRCEBxHSa3s+X2hXh9F0oz4U/?=
 =?us-ascii?Q?CLb+A5v+4EtU2FU5n7QkA6G1bDZrsrHf/uStfoiO4cJa5+qx8+XrSvuT73x1?=
 =?us-ascii?Q?2dyFfLrx2VsqLevF2ltSK2cjo8/cPEVpnYm5n/1gxGpqLWad+XnJt1IdHl2p?=
 =?us-ascii?Q?gF8HfOibJxAO7vj3U71POHQ=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 f5872cce-8009-4455-6ee2-08d9a8e69bbe
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2021 09:51:05.9524
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 Hi18WaqOA4lN35mFNTF6GeUGXt0zh8Td1gGzWO0hkxiWjW1Ylj+m1w3jnF5yXA//+FvLOKM0BSL0In+KtQ3+Fw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1999
X-Proofpoint-ORIG-GUID: C1K3nH2U0yyXXUJK5i3Y5S37dKM80W0_
X-Proofpoint-GUID: C1K3nH2U0yyXXUJK5i3Y5S37dKM80W0_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-15_16,2021-11-15_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 suspectscore=0
 priorityscore=1501 clxscore=1015 mlxlogscore=815 phishscore=0
 malwarescore=0 bulkscore=0 impostorscore=0 adultscore=0 spamscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111160049
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 16 Nov 2021 09:51:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93972

This is a security release in order to address the following defects:

CVE-2016-2124:  SMB1 client connections can be downgraded to plaintext
                authentication.
                https://www.samba.org/samba/security/CVE-2016-2124.html

CVE-2020-25717: A user on the domain can become root on domain members.
                https://www.samba.org/samba/security/CVE-2020-25717.html

CVE-2020-25718: Samba AD DC did not correctly sandbox Kerberos tickets
                issued by an RODC.
	        https://www.samba.org/samba/security/CVE-2020-25718.html

CVE-2020-25719: Samba AD DC did not always rely on the SID and PAC in
                Kerberos tickets.
	        https://www.samba.org/samba/security/CVE-2020-25719.html

CVE-2020-25721: Kerberos acceptors need easy access to stable AD
                identifiers (eg objectSid).
                https://www.samba.org/samba/security/CVE-2020-25721.html

CVE-2020-25722: Samba AD DC did not do suffienct access and conformance
                checking of data stored.
                https://www.samba.org/samba/security/CVE-2020-25722.html

CVE-2021-3738:  Use after free in Samba AD DC RPC server.
                https://www.samba.org/samba/security/CVE-2021-3738.html

CVE-2021-23192: Subsequent DCE/RPC fragment injection vulnerability.
                https://www.samba.org/samba/security/CVE-2021-23192.html

See: https://www.samba.org/samba/history/samba-4.14.10.html

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../samba/{samba_4.14.8.bb => samba_4.14.10.bb}               | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-connectivity/samba/{samba_4.14.8.bb => samba_4.14.10.bb} (99%)

diff --git a/meta-networking/recipes-connectivity/samba/samba_4.14.8.bb b/meta-networking/recipes-connectivity/samba/samba_4.14.10.bb
similarity index 99%
rename from meta-networking/recipes-connectivity/samba/samba_4.14.8.bb
rename to meta-networking/recipes-connectivity/samba/samba_4.14.10.bb
index 0dd563c5b..c1c393738 100644
--- a/meta-networking/recipes-connectivity/samba/samba_4.14.8.bb
+++ b/meta-networking/recipes-connectivity/samba/samba_4.14.10.bb
@@ -34,8 +34,8 @@ SRC_URI:append:libc-musl = " \
            file://samba-fix-musl-lib-without-innetgr.patch \
            "
 
-SRC_URI[md5sum] = "5c6636b34a322de0eb917ee0403be322"
-SRC_URI[sha256sum] = "c936b782c2aced8cd7299c13bec67c495fd4affdb217a6ed6150f4fd6d770fde"
+SRC_URI[md5sum] = "02a3ae53a9c3feb2f3c5b97141b7a8cc"
+SRC_URI[sha256sum] = "107ee862f58062682cec362ec68a24251292805f89aa4c97e7ab80237f91c7af"
 
 UPSTREAM_CHECK_REGEX = "samba\-(?P<pver>4\.14(\.\d+)+).tar.gz"
 
-- 
2.25.1


