Return-Path: <tgaige.opensource@witekio.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10DE8CD4F3D
	for <webhook@archiver.kernel.org>; Wed, 20 May 2026 14:25:11 +0000 (UTC)
Received: from mx-relay26-hz12-if1.hornetsecurity.com (mx-relay26-hz12-if1.hornetsecurity.com [94.100.139.226])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13575.1779287100016148548
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 May 2026 07:25:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@witekio.com header.s=selector1 header.b=Xz5qOYUC;
 spf=permerror, err=parse error for token &{10 18 spf.hornetsecurity.com}: limit exceeded (domain: witekio.com, ip: 94.100.139.226, mailfrom: tgaige@witekio.com)
ARC-Authentication-Results: i=2; mx-gate26-hz12.hornetsecurity.com 1;
 spf=pass reason=mailfrom (ip=52.101.65.127, headerfrom=witekio.com)
 smtp.mailfrom=witekio.com
 smtp.helo=du2pr03cu002.outbound.protection.outlook.com; dkim=pass
 header.d=witekio.com header.s=selector1 header.a=rsa-sha256; dmarc=pass
 header.from=witekio.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=6JJhyctDba4Zk9dxOeA0V8O5bezlF1RaJU4ONbQtJAE=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=2; s=hse1;
 t=1779287098;
 b=jwwc+FQ70XVtut6Vi9o/i64+eULJoxChwqBPs/Ds12SnraB6cCqqRW8rrO4f9HeqqzM+alY3
 y1Rvetc7PJwedpzJaDn/9Oxd3yWnGariSBBXro/jNl9lXtBG19k2sgTU+f0gAxTi0hlwCaUgj4b
 +SiaLhBWL89/mYhx2whWgqFOQoLhgOP501eQNwH1ZOYMHhDHD4ucyDlUI16H95r8MGeEK8J4JN6
 1HBoGa9G4ytdWbJMwcOBpq4lD5fvdB6z4ZtM5Tvc2PWrGtVNOjzxigMErCJnIQGVJt1/O9yEHm1
 Qhvt2mB3SPSiOnOqncbSNUlemuLWZtBRTvQbDPJXM5Cbg==
ARC-Seal: a=rsa-sha256; cv=pass; d=hornetsecurity.com; i=2; s=hse1;
 t=1779287098;
 b=NH7X4kxYR1TZ78x1SgJ695aWIAEe1cOieZh8MyUu/Sz0tOYB5ugExDvuFQElkxYMvghHcm2w
 v+OpBq0WRMwRPVYA6zb8loGD1LVpXHhoypiPhG1jdrv5AsG5pnXiWED5ZOxwPwpT18bLTKrVkyC
 45YgYDdolrlNJ5mSq0OyHAw7luNe9M2/lzyXSLTwkJvV9eHfYubgI/7e2w1KTgJ6dBj3PisTQmY
 E6mYdGXDI1ze7sVZKAPrFvKlUZxW2d0mYXYCTSef743jvqmEPh/qiVGh/2bSosVWnaE5kzgso+l
 3G9T0LDtLFXn6NRT2BCDPzcAOetgXSC2/V+s4QMG8RCFA==
Received: from mail-northeuropeazon11021127.outbound.protection.outlook.com ([52.101.65.127]) by mx-gate26-hz12;
 Wed, 20 May 2026 16:24:57 +0200
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dHjel1dpxCgvMWoN1KTD9Y1Pj35IBiEalHUpXkRcXmzt5Q+NoXKsrX0UXJvC2XDiIvSOjFLIdHRSIWiSJll7LAx38rmSRA2uxV3qPTu7bIB8BmV1LJhSNx8Q2i8IXGdH00A9VQPTJpAmVFvfz6gj0+wuN2XdOEfo2AarHAEFmZaOgcdhoW//2viQlnn1KR4sunU1gaDIRT2ZHq4q/0o/F7aacBdjhi+9kMlgvgyMv8yZeJrUpyXxmafNqeuAX+LXLQmT3sn6i+EP+E6CnxbQgo7b6eLdzGMtj9pCRrzVppUnpAdF7AYEgE0syc4rWRS7FxdxZkaNF+Zo1cHBZONsVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6JJhyctDba4Zk9dxOeA0V8O5bezlF1RaJU4ONbQtJAE=;
 b=TPY6OstpQwwIPXvrfXGmluPf3u6OGv79Jg76QtEMnfHNn+Vzld+Y0ItUaM12tsg6m+XJoulwWFjJwWfmca/b4F+YbAkMa36ditXN9dMAA4EbYNTDL1cjOs4TIV9fk8JwGV4J611hdT2DzLeVdr216OsgXDBQkDjVyMwfcrP8+Gn+wSF/oxuOHM2ru9RbPwR6qrhknl/bj08OOn51NAWw8Ns9bPO7xw4RgFazqMSItnkFemTsw5xUaW7DP3dcMD6bjqwhSZXcR1n0cxjB7eH4x6aTjrox5TwtB3fZHA/KGy2S3rugEBv1xruw8qDPR0+OmSrKOXXwRr6EESeKbs2qBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=witekio.com; dmarc=pass action=none header.from=witekio.com;
 dkim=pass header.d=witekio.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=witekio.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6JJhyctDba4Zk9dxOeA0V8O5bezlF1RaJU4ONbQtJAE=;
 b=Xz5qOYUCjQEO7GhdziLL/z/1UpGO9O0Ln1nkwuBnB8NvOodiSf4JgFcCaioceE+BANqS8Xw7RoymWjVzPqpcK7bMV7J/olufBNz0bpoDj/qwlyVISnAAjVNts2/37UevNdGPXzwWsk/wemuP3YIRunkm6N+2Qe+a5yzfhtGQKzxHqw7ZzrQEPJpifOxna1wx/KZZti05xRvLBSQBjJHyBQnZGvxhjDHIoUkUQtP5qOYpn/m+uu5s6YAC7ueRYddR5dnl5yTpy0h7yw7HAMhraCbg2PhyW/30VNJ5FTXLDDgZb46/tq99p/Tc6xWKxxbDri4W02gqcI3keaOTGTDCEw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=witekio.com;
Received: from AM9P192MB1396.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:3ad::23)
 by PAWP192MB2388.EURP192.PROD.OUTLOOK.COM (2603:10a6:102:46f::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.14; Wed, 20 May
 2026 14:24:48 +0000
Received: from AM9P192MB1396.EURP192.PROD.OUTLOOK.COM
 ([fe80::25ed:86ef:4d24:3d38]) by AM9P192MB1396.EURP192.PROD.OUTLOOK.COM
 ([fe80::25ed:86ef:4d24:3d38%5]) with mapi id 15.21.0025.023; Wed, 20 May 2026
 14:24:48 +0000
From: tgaige.opensource@witekio.com
To: openembedded-devel@lists.openembedded.org
Cc: hsimeliere.opensource@witekio.com,
	"Theo Gaige (Schneider Electric)" <tgaige.opensource@witekio.com>,
	Bruno Vernay <bruno.vernay@se.com>
Subject: [meta-webserver][scarthgap][PATCH 2/4] nginx: patch CVE-2026-42934
Date: Wed, 20 May 2026 16:24:36 +0200
Message-ID: <20260520142438.2126939-2-tgaige.opensource@witekio.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260520142438.2126939-1-tgaige.opensource@witekio.com>
References: <20260520142438.2126939-1-tgaige.opensource@witekio.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZR0P278CA0021.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:1c::8) To AM9P192MB1396.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:20b:3ad::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9P192MB1396:EE_|PAWP192MB2388:EE_
X-MS-Office365-Filtering-Correlation-Id: f18dd5c3-bf26-4002-9bff-08deb67b8c7c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|13003099007|38350700014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	EyVSFSQ+szDxhTKcixZqVaZE1oOyoHqHmXdsIzfSKgo/6qYNKpdmhGwt2RYEUuwtpdVflgKUSNi8ncldIrOllHFHCUfRrAnHhfxzRLpazgcnQ0CGC4rXudPDIg3+NO6eFKK9TTVNSL0Rr0pflKha528Xupkjv2CKXE7V1fP/FKFMBspk+RwQV2rSLwERaFSCoBsldmhsz83ZZBAbyWg5QBe2queiss4/z765dUtOmXfg290eJBjGpWBodwOHPTR1yhyxh5WdRtVfQhsM8OdSY+N+nwG3DyiyQcnZClfkO4h/dKe6YXfoWQVB32D4tSSgNG9gKGVsH4CCx2fpG3EaYHhPUOej9/BoYioua/3KW/DYns8bSNMMBu+NNWf0qz9rcbJHvsZrwYvzUTbHL+JoOJKM0Mcz7iIgygLDXtWYurs43Eu3771K6uhWdU+rLW66N3HHpPhuX9BKyKB+1XyNg08pnC8W7jdZz367l7/8aJ4MehqK6Q1/GXxhd0rZgLTendmBzFyBThAqVD/GDS5R3G/I1L896x4GkJ9dQ1X0kcdEVl7n4BAPkYFScUeX+xgBw2zSP7h63b95695LZ87ux4S99LCLpsoDMz5Cr42L0Y6M5xqTiyqUyjRMm1/vgnf6R3xONuX8wzu0yEqzED8GSgl610la16qbj1X9cpWnUHmWUFqftaOdKXHSf0xArPVVPLADL76z73k+KQtDAJo1XAncSh0b/wuMKoVoinW6lhw/SV4ZLrYKGgc3vKGn1mB/
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9P192MB1396.EURP192.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(13003099007)(38350700014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?kk7SqlAi/Kax0TBiVOEnfwB3vfbQIcX/Jysvnv73biPWWRco7Ej858qdBqfe?=
 =?us-ascii?Q?TyxDyds3mYaiI2U50Eu4hbdwVlbUrcmjKFrPn5EeCUazwAX7B7qqHHsKP5fE?=
 =?us-ascii?Q?8+ZnCrh35NU+lKxGg0snpXFwMXDhUehv6MX6epJOWqcOVTDDg57Q1cNKPKxB?=
 =?us-ascii?Q?DkuzJTHG7su80hi/A0f0yBd6o9sI2JWxJDkIfyP0ej4W8BRs9eIwCtUoHJw4?=
 =?us-ascii?Q?kVVamt7qeZzihEf9/LpcVxaI9FZg2riaRhwPUlOimONY41kQHARAVQZbisER?=
 =?us-ascii?Q?xCP9YsE7KaTUODwsrwYllPfPj/k+NCtFtncVqVirm4cWJc+69j4OCFE1jveS?=
 =?us-ascii?Q?Kg7HaiN0/P3vXn9gWGaxJYANZrZVPxUgcgPF5plI2ATnqDPqqSFxXbeMzI4C?=
 =?us-ascii?Q?F9x075KDdR4z3NylyCFUk5t1uDs89oCYYTpHfN2sX6OOe7MDc/Ol84XbyOJ8?=
 =?us-ascii?Q?TpYfZCOlldjdz4dy9Bn4bpN1WhCXNuvxLjCQYW9pHEZlY/i/W1v5ZhtmO1pQ?=
 =?us-ascii?Q?1VLzGFlKqgqQMoCf5PQpikz85WdYtwijuVMxIPEYxNelwZ16a5Ynz+GCw1s/?=
 =?us-ascii?Q?JdTSev5ktdGfBPqMpO9Lk9/huoaRUi5hzQGfI2GMe1tGJBIl6FRTRo6vnfLo?=
 =?us-ascii?Q?xA+nESypkRqJlwtQDj4eSVEo7R+lVZ2tZNqvfJwIDIb6/rlmHxI+vUp964oH?=
 =?us-ascii?Q?nQvyen83fBjqAcYD1NWOU04F0ZXzlVE6qRwTAIADcdzYe9Nnsh770MKGqDs+?=
 =?us-ascii?Q?q0GlHBUTHK8kPUhk1URxb94f2lOdrh6kvMA5pRwbo0DsGe+kltp3Q8YLR7Hy?=
 =?us-ascii?Q?sIZJBlgTLzZoG9kXAzB+32UaWoAEdnVNI34l2RgFrfHYV9l4vSbfLoIzOYFg?=
 =?us-ascii?Q?3UzNkWnMbB4B5Nr4+HqNyR7dXFKLgpBZWZZVFhXMNhktFsdoGwUHPO/wLCOU?=
 =?us-ascii?Q?6SuMQBt35TPd49dKQATRmWUBkEuzNWgwDveRtDkQrdol/ZlfUqaMIOu2iVlZ?=
 =?us-ascii?Q?xnOuVqD2AETH1UugpxwZ6Aad7BYJZ88xDldUsxgQz6ypiDfrbQqUCkiHxjgF?=
 =?us-ascii?Q?dL0Xl694bvnM4oLFzC7BgBHNZVJfWSU0W+MmGVe+DJVrqlNdJaODZxHsAxH4?=
 =?us-ascii?Q?YwdW3e9Hy2k3pjzSq0GkMnIkyhEqH0BjykLbQxCccl1VMU3p1+t0ccahuOPh?=
 =?us-ascii?Q?XJkV1fgVPRoKVjcYWU9OxWreeVEfme2mwNExjT3yooC3jX2VjaTrgMSxwpum?=
 =?us-ascii?Q?yD0P95gPC3BCzXp4on0oYpBINLAXRLhCdyRB5yJgrGqJa5Clwx0/VyckYMPI?=
 =?us-ascii?Q?pejA0ee5YPZhKodQuHMclB8MaUVwroNZxTbMKmVZ3ljbQbzTmL93AtKdJ6Ts?=
 =?us-ascii?Q?T35icGtkXiZuBkDBJdyMHTiofRgaFtmz8BM7l3+efMMOI3fpcGGqJYcpaEae?=
 =?us-ascii?Q?4g+vfZu4UnTBQPQcu6Q4K3eZZPPoK9kOmryuNEP4lb/kcrKBrH6ysaCuo0Kj?=
 =?us-ascii?Q?qvgZbkBFg6MrSOt48OSAlubAtanPz/1h+3zfK8HP/8Me1MnHfZtXTP2Tuc4Y?=
 =?us-ascii?Q?/EqPYABS1+MR9sxFRzU1d+REwI03WdNE0Sx3bfwbQ6IlsvJuAWALlmKWiHn6?=
 =?us-ascii?Q?5NIRWMR8MojUJHdt78yLIAPGC+rr8Hy0rs7A8V97LAWFwmHYo2isu2G0t4lY?=
 =?us-ascii?Q?AHhr0+d6uB88nVpTZxLr7h9g1ew/Tfib4Rt2ob81Y8jXq1rqVX2zZSpbc06k?=
 =?us-ascii?Q?I4mOmMaZFw=3D=3D?=
X-Exchange-RoutingPolicyChecked: 
	mG1yO26WNS/QN3b9OQgVSni+/E2X6nLLGmYMcC1DEnAaDMsfINWKIsTKQE+pcL0GqHMBKpR+PyRMvEFqRtaVFRHg+0dax9F5uW+NCipDwquq4wcu4Ru8Vq9A3usgcEVgOqkGwV8Ev1aLnXw7kKG9er2jvBh2Gdoy6rhz063LFxmMTOP49MeTU/ofXNORja9nm7t4QofZG/nNiF71qIK9iKObQ2QOqN3qaQTEX8ysHgez6KYDMCQHBVb5+LQrZ3fJVhZzwCa/C4NE6QvlwhvMCtYwn2IroXoGXxr45U1JWfpf8OTZwugcyv0Dkef+r1N1Nw+EL6LFh/X9AK/hq6AxKA==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	08yTJaHlfVpBdTm7Vy0svz9XEKC4bObCqGVyrbnrD4L49n/ajepHA3fROIK624WOSnbdZliHD2BE6woTVXRBybXwbiv5p7Ht9R6ypfA3jSsUXwPwpHhCja5QHokI3Zaa15gPyvs7KOXcFBaCA9tKeuuj2oKplBPSOi0QclXxW61aRyycgtIY79i4arEgeaJZ8Q+iz0yNUanCXj7yiH4/4ljZIr4vBu91yKCAkrrtQ4tvG4l7+3Fn+nHcuw1R6RjX0Dn9qQ2hSQtLkN9d1TCoF6SG54UL5RtR37RO4BoLRxKlSFP3WLTbCjzT4mOXfZsavjNgttHct+u5BBMyi1UeAapkdnBb2rJrcdVadxhnhY3/0nnxMcnIxcx6r/990CT68Y+3fNxTUAJtaVb1bU4nCoepgNVdRneoT2kt93RI10ke3ZXWqoWyOyWdiscVeLLdjdqTiLRrogVGseA94hFrsEOyJRUlLJAAds0drWQc/h8SY4OCTysuYaUWMDl3qXQzro6eNWX8rh8gmhanMoyml0pouZFzVefeXQc6KtFNXBuMN17bK7CH5j8as+Hn/1T7CTDKJxtO2aWfmC71PLg++lduIK0hmp6nGC0Yhb86LuVttWM9LyvSt6juPbkkJbRo
X-OriginatorOrg: witekio.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f18dd5c3-bf26-4002-9bff-08deb67b8c7c
X-MS-Exchange-CrossTenant-AuthSource: AM9P192MB1396.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2026 14:24:48.8375
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 317e086a-301a-49af-9ea4-48a1c458b903
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QgVfhkRHsgApDsYcruxXDjrQ0AgVyjoEfLK1FCG44mGjsi9HY8gYdbBwu5quCJ5YapdrzBhCyCYHcnyvh45ZAw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWP192MB2388
X-cloud-security-sender: tgaige@witekio.com
X-cloud-security-recipient: openembedded-devel@lists.openembedded.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: tgaige.opensource@witekio.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-gate26-hz12 with 4gLDMT57xsz1g3kr
X-cloud-security-connect: mail-northeuropeazon11021127.outbound.protection.outlook.com[52.101.65.127], TLS=1, IP=52.101.65.127
X-cloud-security-Digest: 49a1848fb861610df3cffc10ce8173b3
X-cloud-security: scantime:1.335
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 20 May 2026 14:25:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127118

From: "Theo Gaige (Schneider Electric)" <tgaige.opensource@witekio.com>

Backport patch [1] mentioned in [2].

[1] https://github.com/nginx/nginx/commit/54b7945961b2eaafc480d6b85d9635d0db1c126a

[2] https://security-tracker.debian.org/tracker/CVE-2026-42934

Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witekio.com>
Reviewed-by: Bruno Vernay <bruno.vernay@se.com>
---
 .../nginx/nginx-1.24.0/CVE-2026-42934.patch   | 79 +++++++++++++++++++
 .../recipes-httpd/nginx/nginx_1.24.0.bb       |  1 +
 2 files changed, 80 insertions(+)
 create mode 100644 meta-webserver/recipes-httpd/nginx/nginx-1.24.0/CVE-2026-42934.patch

diff --git a/meta-webserver/recipes-httpd/nginx/nginx-1.24.0/CVE-2026-42934.patch b/meta-webserver/recipes-httpd/nginx/nginx-1.24.0/CVE-2026-42934.patch
new file mode 100644
index 0000000000..b2a8142934
--- /dev/null
+++ b/meta-webserver/recipes-httpd/nginx/nginx-1.24.0/CVE-2026-42934.patch
@@ -0,0 +1,79 @@
+From 9e8f535a9320a2f6bdc3ae9cf9e616ae0a29869e Mon Sep 17 00:00:00 2001
+From: David Carlier <devnexen@gmail.com>
+Date: Sun, 12 Apr 2026 07:13:23 +0100
+Subject: [PATCH] Charset: fix buffer over-read in recode_from_utf8().
+
+When a multi-byte UTF-8 character was split across 3+ single-byte
+buffers, the saved bytes continuation path had two related bugs:
+
+ngx_utf8_decode() was called with the last saved-array index instead
+of the byte count, causing it to report "incomplete" even when the
+sequence was already complete.
+
+The subsequent ngx_memcpy() used that same index as the copy length,
+reading past the input buffer boundary.
+
+CVE: CVE-2026-42934
+Upstream-Status: Backport [https://github.com/nginx/nginx/commit/54b7945961b2eaafc480d6b85d9635d0db1c126a]
+Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witekio.com>
+---
+ .../modules/ngx_http_charset_filter_module.c  | 20 ++++++-------------
+ 1 file changed, 6 insertions(+), 14 deletions(-)
+
+diff --git a/src/http/modules/ngx_http_charset_filter_module.c b/src/http/modules/ngx_http_charset_filter_module.c
+index e52b96e..7a518e3 100644
+--- a/src/http/modules/ngx_http_charset_filter_module.c
++++ b/src/http/modules/ngx_http_charset_filter_module.c
+@@ -689,7 +689,6 @@ ngx_http_charset_recode_from_utf8(ngx_pool_t *pool, ngx_buf_t *buf,
+     u_char        c, *p, *src, *dst, *saved, **table;
+     uint32_t      n;
+     ngx_buf_t    *b;
+-    ngx_uint_t    i;
+     ngx_chain_t  *out, *cl, **ll;
+ 
+     src = buf->pos;
+@@ -783,18 +782,12 @@ ngx_http_charset_recode_from_utf8(ngx_pool_t *pool, ngx_buf_t *buf,
+     ngx_log_debug1(NGX_LOG_DEBUG_HTTP, pool->log, 0,
+                    "http charset utf saved: %z", ctx->saved_len);
+ 
+-    p = src;
+-
+-    for (i = ctx->saved_len; i < NGX_UTF_LEN; i++) {
+-        ctx->saved[i] = *p++;
+-
+-        if (p == buf->last) {
+-            break;
+-        }
+-    }
++    len = ngx_min(NGX_UTF_LEN - ctx->saved_len, (size_t) (buf->last - src));
++    ngx_memcpy(&ctx->saved[ctx->saved_len], src, len);
++    len += ctx->saved_len;
+ 
+     saved = ctx->saved;
+-    n = ngx_utf8_decode(&saved, i);
++    n = ngx_utf8_decode(&saved, len);
+ 
+     c = '\0';
+ 
+@@ -810,7 +803,7 @@ ngx_http_charset_recode_from_utf8(ngx_pool_t *pool, ngx_buf_t *buf,
+ 
+         /* incomplete UTF-8 symbol */
+ 
+-        if (i < NGX_UTF_LEN) {
++        if (len < NGX_UTF_LEN) {
+             out = ngx_http_charset_get_buf(pool, ctx);
+             if (out == NULL) {
+                 return NULL;
+@@ -823,8 +816,7 @@ ngx_http_charset_recode_from_utf8(ngx_pool_t *pool, ngx_buf_t *buf,
+             b->sync = 1;
+             b->shadow = buf;
+ 
+-            ngx_memcpy(&ctx->saved[ctx->saved_len], src, i);
+-            ctx->saved_len += i;
++            ctx->saved_len = len;
+ 
+             return out;
+         }
+-- 
+2.43.0
+
diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.24.0.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.24.0.bb
index b4bb1ccc67..7a94cb6172 100644
--- a/meta-webserver/recipes-httpd/nginx/nginx_1.24.0.bb
+++ b/meta-webserver/recipes-httpd/nginx/nginx_1.24.0.bb
@@ -10,6 +10,7 @@ SRC_URI:append = " \
                   file://CVE-2026-28753.patch \
                   file://CVE-2026-32647.patch \
                   file://CVE-2026-40701.patch \
+                  file://CVE-2026-42934.patch \
 "
 
 SRC_URI[sha256sum] = "77a2541637b92a621e3ee76776c8b7b40cf6d707e69ba53a940283e30ff2f55d"
-- 
2.43.0


