Return-Path: <OmkarAbaji.Patil@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AE9CC624D3
	for <webhook@archiver.kernel.org>; Wed,  2 Sep 2026 12:12:44 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10986.1788351157300680788
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Sep 2026 05:12:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=X8xDJNE/;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=3705188636=omkarabaji.patil@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6829NNkT104031
	for <openembedded-devel@lists.openembedded.org>; Wed, 2 Sep 2026 05:12:37 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=JnvZHxXPapy5UsW9leSo
	Wgq+0FqEsrhDQ1GvuolrlrY=; b=X8xDJNE/1JopQjH5XMjSPaJruG2JbDUUFeg9
	acquK+9mrVbh7w2JyRe1BwjTEGbdvLncLpjMyvnMqPnrNU9r4ceY0yGuZfljO99R
	rZjY0k7JWOjWZJjS0Eg5PcHBIBzN7xG3Y4c/H9Zh8ZZ6jg6HJUMJksMSX+PbNh4j
	4NBlBQttbSL4db5D/51Jpszjh1Nw4v+MCjhBIbJJPrrw8LgyXYJ7kp554A76dm/F
	soDAJv0u83bjHUwTElKMaD1TdHg/88xaD0WlV2NCT51Ah1XKwrc7lcjhHFCKEKJI
	rd0tNZi4DNZrfAx30cQvnpg697U/A8LqXyNSdwYRzc5dEuDeFQ==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11020120.outbound.protection.outlook.com [40.93.198.120])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4gbxxee3cv-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 02 Sep 2026 05:12:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vbA+lHDr1pnLP1gX4eayBjp9Dt4PZCu3IAfkeJzwSczl3Dwe6UBCwHdNscK5YQh1YpC+6Cbprn6OCzPxhRau9B8tqBmTDTMqd06n/F6ttnxlEn50Ev8Vf0UxjOE7NQKw4aPUx4i0zNnbx21Acc4USzg9CqFOcd115HgjeGCGFX8hV0GAR9A/T3HM2mfRV6ohHRcPX8LnyVcFGpPn+kYQ3CyLoPGE+IbQSk+bnuPVFAJWHM45b9gun8ASVVr521FiW8unK4SPxd+blgHEgD0IXC2Aq+r1Z0A3EN8ldtk0YOMG8KA8emP0cVOau8Il4Hz9pyTJdXE7dTNa2KUJbgNttA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JnvZHxXPapy5UsW9leSoWgq+0FqEsrhDQ1GvuolrlrY=;
 b=H0pxC/pUxSczVplVaWZKep8W6dd+Ja625QCZc8d1On3MyWZOmjz+6wj0NOkzwMv/G3WlAJTevvS/sBT7qSpKhmIHAldv7zaF3RO12mGCBXdALR88KVUeV2aPz+KVy8KedAWOpEy0334dYD0q0MbRcb/nJ6oMFPzjhJiq4dsriHhC6XQw3zizup02eLw6pOnWfP9IIbQheHUizR1Uu48RujRylYjKsQ2SqEumd+OYlNG+Elojv82SfGWG6NiwVgp6dEjuj+H2g4l3UWQlMhTOAXhZZvvTG+YZaCJbZ3TN+bKHeLhEGRPH6UX6W9tVNdeOEp0NiUikV9IGyI0QpooU4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH3PPF3ECB6A513.namprd11.prod.outlook.com
 (2603:10b6:518:1::d19) by CH3PR11MB8442.namprd11.prod.outlook.com
 (2603:10b6:610:1ae::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.10; Wed, 2 Sep
 2026 12:12:32 +0000
Received: from PH3PPF3ECB6A513.namprd11.prod.outlook.com
 ([fe80::c5c6:cca3:ec27:580d]) by PH3PPF3ECB6A513.namprd11.prod.outlook.com
 ([fe80::c5c6:cca3:ec27:580d%8]) with mapi id 15.21.0360.008; Wed, 2 Sep 2026
 12:12:32 +0000
From: Omkar Patil <OmkarAbaji.Patil@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH][wrynose 0/2] openvpn: isolate GPLv3 dns-updown script and upgrade to 2.7.5
Date: Wed,  2 Sep 2026 17:42:06 +0530
Message-Id: <20260902121208.3587748-1-OmkarAbaji.Patil@windriver.com>
X-Mailer: git-send-email 2.40.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0051.apcprd02.prod.outlook.com
 (2603:1096:4:196::10) To PH3PPF3ECB6A513.namprd11.prod.outlook.com
 (2603:10b6:518:1::d19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH3PPF3ECB6A513:EE_|CH3PR11MB8442:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e0b5ec0-f1d4-419e-b1b8-08df08eb7732
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|1800799024|52116014|376014|366016|38350700014|56012099006|11063799006|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	YxTfDjU2FpjWSQ5U0wzumDxoxGW21C9RLALkay5KNKnAcX0J5ZS4GUyJ5WR82TIsngK6evMP/9JDZKJKxDxqUSfrAmDuzQq4xHJfa4kimmtdJd/5LmbP73gTpX2mpCEj/dSSJ9HMOeW0lKWsNqXKP4pL5tTevhA0lMc0fW1EC63BHHan2ax4sDlT2v7qv6GzFhYK1k3LVt5DvH54+2iGjCS7uF1oDdaNoo+S2aM84khMRROTaCygpI7oNv8Z+N0JqePs9FG77LuA7RF/VeKpZuhTjzFaABzq1qTKe/nC6avbc9VfDUyOe3eCl9Up9RKnld2MtmRDX0opyRgrUfmdgPE1Rjg2K+Vw4tcEm0D7yL0naRALRsXHBBcpK0pYMFqt4nEwSOjfB4Hid97q8Gp5pzftTSDnzXd5+Zk1kK2Mus3yMX/Ek/LdtN72RQG3XN3MeX1R9cLlKBMsIW/RxxPVFMvIwD0C56LNFFo96DDNz5NgT/6MF9JWcxVgR2JAkMgcx93qArLjCwN/Y7NyGIyymqjAlvpdVCuIqr4IB5lmHuA02DX5uJL3bGezVZylL49mkywIbOpezMq8Bc6iceuZ3l5hjOqF0rNJ8FA2ApwYHiqDee/QlPu1F+g16BzRkIb9CLbBAoUYzDRX5exbZ3i4RkG/l3jZwnnsi153EDYnq9qq9EhoeuOsQzX0r10LSX+oCZgQn+MS7vSZd8dMa0hYonuzIIS7EHUY8tWbInmKC50=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH3PPF3ECB6A513.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(52116014)(376014)(366016)(38350700014)(56012099006)(11063799006)(10067099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?mOXQc5hQyC5OMyugplZvpVzyrtjiV0VYTIFaTHtZu1+7TvQRDcUYIPXdwsr6?=
 =?us-ascii?Q?ZOS8oOqoXJl9hsbmfXg7EFIx/CqZFGihmDhGYdRl7J7/qdhUS3UOUP/qnYyL?=
 =?us-ascii?Q?eeblR6AHsr9n76irgodr6ayCPKn2vhM7TGf2Gf1p0F9HUNmKkF4uxaVVaYC/?=
 =?us-ascii?Q?bdtkQY+Qr9pc4safXPkX86KuK+tmRm54GsX8rhpu8+4Xc2l5xm1oRDC+b4le?=
 =?us-ascii?Q?9+D/ZdaDi9nBGCVz5hgxu2ekQApaoihbgBXVNLxRqgwgz9GV4UPTcM6fwOSm?=
 =?us-ascii?Q?oC7deCFSKKh1NcUdYraCKZzX134YoUCQyUddkXVINNp9nEur3+mRKVHcFKLs?=
 =?us-ascii?Q?sW6QYSNF5HLyvsTVZEBb4zsbMDMZIL7DxkLneKlQEhF/SelDlvlVe99knRAY?=
 =?us-ascii?Q?LKa+WxtjZW5Ea1TdHJcwXlQZGw7r1tKE25PyO+5pvKh7UG7WKCiM+vrF2Ifx?=
 =?us-ascii?Q?Deu1lUGzs8fEwfxkitk9n05sAsdpGkiom74J86wMQOpds1gUUWO0goNOoy02?=
 =?us-ascii?Q?Wu0D+eG3ynPDM9zbxiK1+NHxS74aplXkrBMVLW/QAl92I3V7gEf4iJQMv8b5?=
 =?us-ascii?Q?+4mvzZ2La2pW7sb2MiRfaFklJ9/JXHXgLTtUMt4cO+1TXuqmU4e4WfpBWbIg?=
 =?us-ascii?Q?U70TmgyqbaijNNyLP1QJP1cNCSDh9YtWPuiS5fzyQq6Qxl5ydGL/Nw9dZ2jF?=
 =?us-ascii?Q?iv8mdFVB3TqcBlkpI/NReum+A1VBMeUqscxlfzX0VreLJ5qWpYrNrr1xt3k7?=
 =?us-ascii?Q?+iIBYyRB6n2UXu5FGy7eNCjCHUqSL5+y5hFxrb5pHJZnuYCahujww6xOHP1f?=
 =?us-ascii?Q?ovTL25Ld6QyUlzeoEqrdw9goEl3oOELG+NL8GUU9BWLdF/OrSX8mJjkZ7Z6q?=
 =?us-ascii?Q?cC8zqyCyL/LZgz3ebZjfpN4X5DzedhQ/GTBMR4q9gM+3k1/u3bY5hMjMwik2?=
 =?us-ascii?Q?LOqFKi3qycJ2feklK2g9UYKxp8lXspAuG0LtumsgaeN3FblVuDZWc/fxr6pq?=
 =?us-ascii?Q?Z2w48hE8Qsb/BKcDaaQJem9UdYmRlzEtHA6Un0JN7p+51sILBQpOFUInNQ94?=
 =?us-ascii?Q?j42+wlX4LDuIO59spsXtFB9jwmQZ/7ANs18LmjR9wb6iKrDBixm/ryv1uRfi?=
 =?us-ascii?Q?cQA/d7TwsC0ytTi19gir48DDJXegGfECIpo/whje5mr1/RIxZtFBAI866kS0?=
 =?us-ascii?Q?viQAWNkbk2gMtLosdyg4dvGVZRTv2ojtcwpFTjH8egSDV4/qiXAbSXzbX/GF?=
 =?us-ascii?Q?3/X0BT7l5rVk+i5G0aXzH0DD9+Q6FPLfxieh/u7cunaa7hLEK4pah1xPc1No?=
 =?us-ascii?Q?HI2vgtXspdC7OoBUYmT6kqiQLETTHT/apHvEQ7qisznZ8vb3adGwD2isZBu1?=
 =?us-ascii?Q?IjW+2K9HPwSsRm/cR9h5DbE38oiF37vjYqAst61hDIDno9ceKfEpEty7f0vp?=
 =?us-ascii?Q?77EoM8Tg8T/8GDFK8g+OMIk2lW4eN79tLEk5dCsiZwbRHmMnQGEGmS9x453p?=
 =?us-ascii?Q?witcZhFLWSQSNTYqnnilaepJUQMqsiF36SjsZWgPR1I53CU0sG12tvjGuEl0?=
 =?us-ascii?Q?rGl3pfMvH9/bhrIX9tD7SEzdQY6tdM8ftfR9qs8uwG3zM7EnMhNi4KtEqZVB?=
 =?us-ascii?Q?UTftiQx3glsjbpxJ7t/CZsLUz+T+JZqEKK+MFEENk9w7SGI9ftDw/kp5k1jZ?=
 =?us-ascii?Q?R/KTDT/pXGCLXc7kxcmLRNThV+UCI0WP7dcQHBVZk/hz74ryfEEhNSyrrmYZ?=
 =?us-ascii?Q?CI+6Pl2bP+R535O6LudbxGsuseH0Kz4=3D?=
X-Exchange-RoutingPolicyChecked: 
	z9Jrcl92GX1+5twDwGJjSumfBWXwD72qGFsEKgFZ+gcbbBNvpuy0AlZA21sTmBUgBRwKn4m2xFWMhF8mr1/2de9II/33U0osvLpAeP1Upr9iJ38VXnfFdhDQGCoYbaL10gkxZcbCxy7QxFDB7JlJEwnCq+66Xfqyngmww5PtdiMzk1yIozeRb/+eX92jRwKaHY+7yd67qbgVSf+PVcLNT+IyEvxKz/VhDKdCHsPLuAzl1z3MxnEUIkDkuCajJCRsn/XSRAcv8Ubk1f0lkzpuylOXR9aES0eViy7YzF/nsniV6X/ugFwOV5EqyAfmBRrcBavAYf2ATQCennJgLwiYkg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e0b5ec0-f1d4-419e-b1b8-08df08eb7732
X-MS-Exchange-CrossTenant-AuthSource: PH3PPF3ECB6A513.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 12:12:32.1528
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h7pGj89YPGC09AuPM7JvqXj4+AOs3CLdLMsXRkKFtNuVkZow8ZBcqVWgG89ZiIdhEZNPI9Lz5FiwHmZU/14Ib1eVShzKjnRyobONqbHRYYc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8442
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDEwOCBTYWx0ZWRfX4apWweGR9doO
 OaZTi/0L1XYJduYyrILfVsbO2KYMY2mtQXLbeRCj68KKuSedBa/JDJMQSVHMuvheyOlVGjeE8w4
 QTjkeVk8agg2D2dF53b7sKB/jA4xZPqPhQbuxGBAeGhmcb9sjjOXQA8D8RzRhfFSMOtPHsqE8pV
 wiKYhurkweXqe3N7E0mQJfSyT5H/CtCuOobisMwdZ+Wom1NNiF34UhrdOgbche6Kat2cECL2p18
 fMTOZceTBtd+n36FdTLkxrsmWb0Qxa/iir3OulQbrpodqUAKMtcwklv7d8nL306hXTPqbWVR6/l
 jDZ0+D3qqJUgyRmGbAc8b+wFTdHDkiBnfMOE1Kre8EekhR/pJJLlL+n0tMApTnnLheCTc4hWAsP
 ch3TKgRiza0aiFOT11dHldelid+a3/A3gj2443wFSSBReDFUqi6nI7TaBdCKl0dbKMDAePnUQCc
 Rr2wlvm35HTj7kiQCfg==
X-Authority-Analysis: v=2.4 cv=BJaDalQG c=1 sm=1 tr=0 ts=6a9812b4 cx=c_pps
 a=OsHIvx7z5txkqQhXuj38dg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22 a=H67e7P573MadeSAYi1QA:9
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDEwOCBTYWx0ZWRfX7oEVDILjGEYh
 zvBDXxULa1G1bL5/PgzVyFcU24ncHFX0rPVly34uMVGHm3xw9J/YsJZtmtnnRPYNKp10BD90ODA
 tI7x+am7+UJ5ChwhQ5zhVPrIwfzG9/E4TE2ReTTc/FHFzlhPE/sg
X-Proofpoint-ORIG-GUID: EqLZmmLrWQSlcUSENjZWXakLMLTkP_FR
X-Proofpoint-GUID: EqLZmmLrWQSlcUSENjZWXakLMLTkP_FR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_02,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 impostorscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020108
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 02 Sep 2026 12:12:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129694

This series backports two openvpn changes to the wrynose branch:

1/2: Move the optional GPLv3 dns-updown bash script into a separate
     package to isolate its license from the main package.
     (backport of upstream commit 995f143c)

2/2: Upgrade openvpn 2.7.0 -> 2.7.5 and drop three patches now
     included upstream. The upgrade brings multiple CVE fixes (CVE-2026-40215,
     CVE-2026-35058, CVE-2026-13379, CVE-2026-12996, CVE-2026-13117,
     CVE-2026-13122, CVE-2026-12932, CVE-2026-11771, CVE-2026-13698).
     See the commit message for details.

Both changes are independent and can be applied separately.

Khem Raj (1):
  openvpn: upgrade 2.7.0 -> 2.7.5

Louis Rannou (1):
  openvpn: create an extra package for the dns-updown script

 ...-test-execution-when-cross-compiling.patch | 34 -----------
 .../openvpn/openvpn/CVE-2026-13117.patch      | 46 ---------------
 .../openvpn/openvpn/CVE-2026-40215.patch      | 59 -------------------
 .../{openvpn_2.7.0.bb => openvpn_2.7.5.bb}    | 10 ++--
 4 files changed, 4 insertions(+), 145 deletions(-)
 delete mode 100644 meta-networking/recipes-support/openvpn/openvpn/0001-tests-skip-test-execution-when-cross-compiling.patch
 delete mode 100644 meta-networking/recipes-support/openvpn/openvpn/CVE-2026-13117.patch
 delete mode 100644 meta-networking/recipes-support/openvpn/openvpn/CVE-2026-40215.patch
 rename meta-networking/recipes-support/openvpn/{openvpn_2.7.0.bb => openvpn_2.7.5.bb} (94%)

-- 
2.40.0


