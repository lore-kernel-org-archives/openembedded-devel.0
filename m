Return-Path: <hsimeliere.opensource@witekio.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B093CD4F54
	for <webhook@archiver.kernel.org>; Wed, 20 May 2026 12:30:20 +0000 (UTC)
Received: from mx-relay16-hz12-if1.hornetsecurity.com (mx-relay16-hz12-if1.hornetsecurity.com [94.100.139.216])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11101.1779280217400225291
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 May 2026 05:30:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@witekio.com header.s=selector1 header.b=QLTePhHy;
 spf=permerror, err=parse error for token &{10 18 spf.hornetsecurity.com}: limit exceeded (domain: witekio.com, ip: 94.100.139.216, mailfrom: hsimeliere@witekio.com)
ARC-Authentication-Results: i=2; mx-gate16-hz12.hornetsecurity.com 1;
 spf=pass reason=mailfrom (ip=52.101.84.131, headerfrom=witekio.com)
 smtp.mailfrom=witekio.com
 smtp.helo=db3pr0202cu003.outbound.protection.outlook.com; dkim=pass
 header.d=witekio.com header.s=selector1 header.a=rsa-sha256; dmarc=pass
 header.from=witekio.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=ljcFPzf7QqtUD8KhOpmhsppkaHEKZfXyEYqwuVklD7k=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=2; s=hse1;
 t=1779280213;
 b=FBeN3FZzFt7Xj6DlBS8SPs8wynYxhw5UFossic9kAvb7wEFwb4+ziDO+1/MPkL4XxEC3sfFy
 O3HCG2O+rE6LdhdvORMW72P9tHvwmiYSP0slmBFnJE5kiz8Q4dhKFPvAGenBOMmNALQoHsfCJFZ
 LUSkIkEVMAlEfftMK0r31E6sKs+IbqajhMbXnbVQ+3/oNn/dhAETxAMHU3AhqZCvSC7npIraOC2
 iA5mSqdLqrjxSAGYSleoUHHd/F4ZpmZTsUV7cVGN/AioTCxKPGPOJP7CdGtpY43v6VNvTxUsuW4
 fmnb3AQRJAghunFp4wDSGiXA9OaL5z5ebDc8KKnDH8jlw==
ARC-Seal: a=rsa-sha256; cv=pass; d=hornetsecurity.com; i=2; s=hse1;
 t=1779280213;
 b=mlkcO4Fu7CJWGYBC3g6ZdS/YhZEnZ0CBTpSPAtjbwoG2pNBGTPr5/fnNSCkqkpYLAL/njMGb
 oqyAmK+6Av3GM9vUnVrkJpoGf+G6rv5ev6havafifdeo0XINoHqIIs49f/1QIoPg9ZHIYdFfdL2
 DIvdNl/G99Ar5lT8vnlw4faCUZ+q3C+bBtmJTOHHV+kPVnt8s2y9Ys6XF8NOBUQ5Qj/zRgyqhib
 yPZe8XM6Twb5ackaiC23YEAP4qjk9VG/ITf0HUIYOeUenkXUEf3PYXYrq3YxoT49noubiUyiR6E
 wntC0/Fq1+jQZre+Cyco8WKHIvQ9edb59QC5VeP6Qpc/g==
Received: from mail-northeuropeazon11020131.outbound.protection.outlook.com ([52.101.84.131]) by mx-gate16-hz12;
 Wed, 20 May 2026 14:30:12 +0200
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cEboJGLaAlCHH3QW4FUDVAhNf++UVdI41aGXthJZd5+Y5YGvATZVxJJ32iNx4TBtN9TnMWL6Ryu6XMJDCnnTT4Ix2Sq3Cx4aIQPSBn35A1IKaNiW+WVBTUaSRjKISYBnL4hbTuGWdk70jHdLR8I2Pir0ebsLKFg/vAEYRBZqaixMSxfdmXAygpyfjasTXYiYNhwBRxgxYkaxhOCj4fYnOTiBWehUbDDcwPX2U9WDDUDqUqzdQnl8+cU1nh2ap7fiBlBzmMYI185HvTgkrlNPSd1JuVzOgYmxKbAe3dM4YhOrH77lUoDjPx9+YgIGlfJewj5HoS90O4bWg07bTEyTjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ljcFPzf7QqtUD8KhOpmhsppkaHEKZfXyEYqwuVklD7k=;
 b=rCFiuSoBWxYji5thbHHlW1ajKgqV342UjySig78XiPHz6zkm6AJtEWckmUJn39Mk10Y2fN65WJwzTvUByGeNE3m1bgwHIDSaxslyvJXBQGny0SoCV1rrTTbbwmVR7ZaxdidOCnwbynczVGfn0LxnFaZjpdhMPHKhUyNIHr7Ml77gxSewYbvrOoi+L+JwSbK1BL8+EtvTB5axCKifFrQFPnKn+wf9q2d27PFOc4hTIWY3tMUGANVRU7qP+c88PjgLOPCzx7YeMPMeiB0Pzkl12d+BwrIJZpm3DKdDoZ3tlj/E+YcmyfESagnSca5j3lP0poFLwZEaiD7dqHCtZodRZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=witekio.com; dmarc=pass action=none header.from=witekio.com;
 dkim=pass header.d=witekio.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=witekio.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ljcFPzf7QqtUD8KhOpmhsppkaHEKZfXyEYqwuVklD7k=;
 b=QLTePhHy0zwdijpWhkXykhgo4nburPZCEqeZ8+LaUT5KAT9QmDLnqbkXyGPVbyEtQhhge3Z99HOdajjYb9tf+ngyaDx9MKwm10nIN6kZlGUoBAnplR728bhTPEBcOpDY+kCGILg5tzaY4ioBGzTf/N+YQp1nNoK48oHWWZq5+V6Gje+T/QpzVBhS7EAcbbGu5LZsYGxS8MFCZI69PG0kmqCvhEmWUpe3tRea06YHIZ0qxmQ0M8mRTpOl5j+WDC5xtmaaRYrvyG0cPenQS5qxgQ3lc83+UyUtiodKpJQQhAHXbirbCiWGX94GU5SytOp+U/I3FPUBgddQPCc6gxQAiQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=witekio.com;
Received: from MRWP192MB3504.EURP192.PROD.OUTLOOK.COM (2603:10a6:501:87::6) by
 AMBP192MB3401.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:75b::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9891.15; Wed, 20 May 2026 12:29:59 +0000
Received: from MRWP192MB3504.EURP192.PROD.OUTLOOK.COM
 ([fe80::e437:672a:5abc:a0f4]) by MRWP192MB3504.EURP192.PROD.OUTLOOK.COM
 ([fe80::e437:672a:5abc:a0f4%6]) with mapi id 15.21.0025.020; Wed, 20 May 2026
 12:29:59 +0000
From: hsimeliere.opensource@witekio.com
To: openembedded-devel@lists.openembedded.org
Cc: "Hugo SIMELIERE (Schneider Electric)" <hsimeliere.opensource@witekio.com>,
	Bruno VERNAY <bruno.vernay@se.com>
Subject: [oe][meta-networking][scarthgap][PATCH 2/6] dnsmasq: Fix CVE-2026-4890
Date: Wed, 20 May 2026 14:29:04 +0200
Message-ID: <20260520122908.3151647-2-hsimeliere.opensource@witekio.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260520122908.3151647-1-hsimeliere.opensource@witekio.com>
References: <20260520122908.3151647-1-hsimeliere.opensource@witekio.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO2P265CA0178.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a::22) To MRWP192MB3504.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:501:87::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MRWP192MB3504:EE_|AMBP192MB3401:EE_
X-MS-Office365-Filtering-Correlation-Id: 814bbb9e-01c5-4b4d-1c42-08deb66b81f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|10070799003|366016|52116014|376014|1800799024|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	s1Ij3ftsSoodFeSHtAwAGKFX3XwGLPIk/E4/VuBwjBZYiol8DPrXT0U7uV3FnopizdlX+JD/euFCtmLDwmzhOTurfXJXI/go86PP9fHD6FKnsLdu5nx7UedVwM5mCAVCMiRYtAbTKYDWZnj4QvntyB+AKULIPnjCtBq5QhRByu3701OMplQFkeemXglEzKIfkUpnefFNMwajmfmI2pggxskmsc5Olng6D3YEDj5a2+BG8ZwDyjy1pP6rSUzJNcY7gyoRGEyV7kZBET+oj88sCQgG37c3PCehyv+01fR2pkFLFjtJLxpWexIu9bbzWS8EHOlsn7gzCbghpcLCHrR1gPN7Y8reEzqvTk6ZTYeX5Pb52BfGEjEqJ3RNxUbvOXavSQy7xbk7ymofVMTZ8OzPKqJK5XfO60AEYB7wEGBB00HD68J3fkg89Bh9s7x9fbcZWTYP5JNA2rczbSaMGcm6037guxAqysgg4/T9fgBZF3XapFk+tSr/SfD4tPa67+4doQg6kgI5bw3xoeumU9PhmnbCYoorqtzFO5kpbJOjCYXXG3FPn80PRRbffsL+W5FrTCQmVZIcatj2Zo9AlzbYjiD9HD3a9VO2nAL/sbb/9qq36lDUaLefudJWDFAO5OGOvi9SAXzOVAyl2BBEy5U0QA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRWP192MB3504.EURP192.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(52116014)(376014)(1800799024)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?LjT/ml+A4f5rhBM3p6VRPDYpwIEBC+ZZMA+bBP5K6d5aF2zbgKqMzU+l8MYf?=
 =?us-ascii?Q?wwavHDl1qpq8/0k+No3SRsXOF5WIz9dI2bd870ZILYZLAbMqeF9I/dkLGnsI?=
 =?us-ascii?Q?muBT1Xa6yylxLZDc3IG+jHewyWZD7m7f8fbFHlgEu8S7Euyi7T1WKJvRZMuv?=
 =?us-ascii?Q?f2C8QX+Lv0y7QdF90ceE3X5ouNsaSI0C4e+6VYMDUk/ZDN+UcDDAIUaJMRxk?=
 =?us-ascii?Q?HyZA4SFaF8m1QpvRVbghct/9cuQtXkNRlhQMEj5U1iWK9f6tR88cOW21SS7+?=
 =?us-ascii?Q?0bns5N+dS7AK+pq/jnz/b36+2ntCnYv85gLnDv3Nfq3JLHsHfZCZOVSZKD1u?=
 =?us-ascii?Q?zMhzvDbykVoXnwBMsLHy+VidmsHKbAdbK3MV57NXk/OyaTZzSVeudIwq8/rE?=
 =?us-ascii?Q?foJX5dYTu3o/5sS7B5+NAcEph3bmmNjk9UXRTETgtRKm0R9o0aEjfo/QpmOh?=
 =?us-ascii?Q?kxKPnH348rH2H/p4C/OxwXi67EzE3obGs3A3Amcm6YCgxD5KIZBE1KXP2qMO?=
 =?us-ascii?Q?sZSdauvx1dmDdj5YiDDMpaAVhxzzrY0joWlBco5dQmmBKQxP7HW4V/2HTDLf?=
 =?us-ascii?Q?k9yjKhLy4yj/I5l9s/vL1I3W//BtqUdwGqP4VLmYhwdn9o/Speo2RlaVVi7H?=
 =?us-ascii?Q?8YclEiwUz5ByuyrWkF0fQVCcG0P4u57JFJhpJ/twngNP9nCJJsnQ+PaEE6BR?=
 =?us-ascii?Q?k26NZ9ZJjGXhuYVlHDjpMp6qzqDSx1JOXwIkx6RbgamKf4Mk2WQApcdbPkKD?=
 =?us-ascii?Q?tC5csdP3aqjDW4HTC3uSNxrF1ZhALVKKzPZbuQRoxBUQBbpS/AOltuh38JJt?=
 =?us-ascii?Q?I1tvFMNsuQeQ0GPGsB3GvBAUcLc/eMBdCkRzK8gm6+O0VCm4TG2QLmJMMI1V?=
 =?us-ascii?Q?CfE1eG9hlPjRGz2l/OMV60aJRxCfgT3topQnAD5Z9mURSuc+m5asKSF1fIae?=
 =?us-ascii?Q?+xtjPhn/7CePnSzOk09bu8VcfY6/2LQJ+vNyxkk/EyDi+ML67OsCnBJ39gg7?=
 =?us-ascii?Q?DY409s3T40Jctg8vlmpGpNcYy2caMR2T1hDPlk3mIF6+S/d3wEFFlUkJdklg?=
 =?us-ascii?Q?ttSRPNGB0F+BMGD9SCEULUqmSOZlJP8mmR3PrFmHy3nZ4Xnt9QABsNFAbmA6?=
 =?us-ascii?Q?IGxAIWncGcP6uAaX7A09XgLtW0dbw+bfKf6wCOuhyzbZ8Z8zCPHq8da8S/fE?=
 =?us-ascii?Q?UKC1q7LPx9ll8kDzO/3V1hQOOCGC8+2Q6Umq3D/O739+xp+/UHDTcaRUEH9G?=
 =?us-ascii?Q?P3oNBaJh4eoU/rTzCweBdV2ueB3APpZSzI/ne9bzFVVb3QGJ7ItlbcCcQsKR?=
 =?us-ascii?Q?Id7TZ/nIxrnMNDwL23pg9dHYQ6hEbjMQzdC0v6EqgEQ6Kjimm5vCDttyC2E/?=
 =?us-ascii?Q?EgeH1/6YRK8qCeDRn2H43AnhPM9xDjMdJDQ7Ugd99v3Q8D0uLVtbzvoETkoV?=
 =?us-ascii?Q?DmbwMkyGhrep5VZvQxq8ssn9WuL3+tXSJZlgwUgve3ypJ8+dvqnvxM7A2Z/N?=
 =?us-ascii?Q?POmjG81ylejIoW+knbEu3sVfRiEhBnZEE1zMA9Xm3oyhFHwXwZGVlZm/bFbb?=
 =?us-ascii?Q?wiPzZ9XtVcBrlCtcHyhXdztK5/PpGPAKvFeeVYhtdx5VDOiYbXR9DO5qfFbO?=
 =?us-ascii?Q?o1N5LMyvAkfig2PYo2+toLssGO2m3pcP+2tLRESf5i75zVXF7u6JSVs0KxF3?=
 =?us-ascii?Q?IFqhwA7+VE6vUT0XzUeOg4QM7rqHNfDQ7SWXSzXNnl1ESjdhflp41umo9O8B?=
 =?us-ascii?Q?NUjUYLaicWmLUKDgocUO1p+lweZ6zEqosB9Sy7vVrqsSYZMd7V/nC5xjsawM?=
X-MS-Exchange-AntiSpam-MessageData-1: xsinIdTBbgqI0A==
X-Exchange-RoutingPolicyChecked: 
	KKB5LfahFJ1kI1pEni+lsH9sVAcB5G5Y+NcWAwHuleN8HfEGlWgeZfK78aH5juwLqjbkOBpuG2pdCaTVPw30n51eQirQVhVpuiRzgX3o1bZf646p+nS4+lVH38PGOuUfXPLXn0TtVgRK2hqzthzXGj/GF611ihRWyOAoURo62AcljyeB9D9QJ9VmalREuj1IE4StU4W0wrz/ME7Kpul64cnlF4fEPSfcS4HSV8vrVio+P/2UV7nRHmHC2C7kbFYcVhU/ECBW3BO+R8+GwK+GKlbXqrgA7Gb3F7G35CsEZS23WUhTDu1VrGNnAKVEYoywuWIXjnTAdrAJBbjThOs3aQ==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	hufvj//7ZkyOjMhzDmeXcklCJl2DsVMBtwOatEM8o0UVjgbIk90gX+IxAIGMbguGo/t71zVu/L096rnrn2lK9ftgecmq/zbvmk294ESiLeQjpBG8Y7zmWeoqmcMn7X2vG4+vSEbMiOVTRHxiJz2LgFA4z8unikmm/Q9qGiiRjJyDizqT4Iby3eQwG8NgbmNa6dEATpbKqCNMelwc6GyOG1vXdEP1QScLO/ZfDoK6257CzJqOJvvm3GcpFVZBc9rTAHXAZNvAaluTUivcB/Ivi/VBspXsBMqYMLy/ycgbX4qH22YLuVC52b4CKQ7+v3Y/rPDEklW1ungLizM0FGsFvJoWZaUjOJVYD/SnW/UVYhNX6cosVdKGWu09SLt/l0IJquJAdRGlX1laKXuOFzCoR5wpuQp+uvEA9ufq1F759/jsc44lR++poJniG3QZo7qArD2ODwVIMNk9VQ+1CEWPkt3H/0W8kpkuczzb/2V8VmWJhRZsxfJWB9kU4qx9L0yK/gSHLjTBg9bVFeduBbpk3RIl/IAACn8WcJn6iI+xxmfwZN1vc7J70y8d4L2szLRhFZCxOZDgPejzqHtNfyrMODvV+6Txkpoo59Ov3uWFSH4pShAw6sDgiejO7q/q4BCR
X-OriginatorOrg: witekio.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 814bbb9e-01c5-4b4d-1c42-08deb66b81f3
X-MS-Exchange-CrossTenant-AuthSource: MRWP192MB3504.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2026 12:29:59.1892
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 317e086a-301a-49af-9ea4-48a1c458b903
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oP7ATdPPasG1H1u/Dy07lhtlOkkgYaO3dXmslPq58BDAuP8WTAqo3pO3kqzn+rtuVGEkkSUHlsOLvU7ojNiMWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBP192MB3401
X-cloud-security-sender: hsimeliere@witekio.com
X-cloud-security-recipient: openembedded-devel@lists.openembedded.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: hsimeliere.opensource@witekio.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-gate16-hz12 with 4gL9pw5Wldz8tcq
X-cloud-security-connect: mail-northeuropeazon11020131.outbound.protection.outlook.com[52.101.84.131], TLS=1, IP=52.101.84.131
X-cloud-security-Digest: 24534ba4385390a3d360d72d20021da2
X-cloud-security: scantime:3.423
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 20 May 2026 12:30:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127111

From: "Hugo SIMELIERE (Schneider Electric)" <hsimeliere.opensource@witekio.com>

Pick patch from [1] dnsmasq 2.90 debian bookworm pacthes.

[1] https://sources.debian.org/src/dnsmasq/2.90-4~deb12u2/debian/patches/CVE-2026-4890.patch

Signed-off-by: Hugo SIMELIERE (Schneider Electric) <hsimeliere.opensource@witekio.com>
Reviewed-by: Bruno VERNAY <bruno.vernay@se.com>
---
 .../recipes-support/dnsmasq/dnsmasq_2.90.bb   |  1 +
 .../dnsmasq/files/CVE-2026-4890.patch         | 75 +++++++++++++++++++
 2 files changed, 76 insertions(+)
 create mode 100644 meta-networking/recipes-support/dnsmasq/files/CVE-2026-4890.patch

diff --git a/meta-networking/recipes-support/dnsmasq/dnsmasq_2.90.bb b/meta-networking/recipes-support/dnsmasq/dnsmasq_2.90.bb
index 3281404e42..ecd17fa426 100644
--- a/meta-networking/recipes-support/dnsmasq/dnsmasq_2.90.bb
+++ b/meta-networking/recipes-support/dnsmasq/dnsmasq_2.90.bb
@@ -17,6 +17,7 @@ SRC_URI = "http://www.thekelleys.org.uk/dnsmasq/${@['archive/', ''][float(d.getV
            file://dnsmasq-noresolvconf.service \
            file://dnsmasq-resolved.conf \
            file://CVE-2026-2291.patch \
+           file://CVE-2026-4890.patch \
 "
 SRC_URI[sha256sum] = "8f6666b542403b5ee7ccce66ea73a4a51cf19dd49392aaccd37231a2c51b303b"
 
diff --git a/meta-networking/recipes-support/dnsmasq/files/CVE-2026-4890.patch b/meta-networking/recipes-support/dnsmasq/files/CVE-2026-4890.patch
new file mode 100644
index 0000000000..0b25239a86
--- /dev/null
+++ b/meta-networking/recipes-support/dnsmasq/files/CVE-2026-4890.patch
@@ -0,0 +1,75 @@
+From 12e5ee3495842ededf8057758ef8da59745bbf33 Mon Sep 17 00:00:00 2001
+From: Simon Kelley <simon@thekelleys.org.uk>
+Date: Fri, 10 Apr 2026 22:16:45 +0100
+Subject: [PATCH] Fix NSEC bitmap parsing infinite loop. CVE-2026-4890
+
+Report from Royce M <royce@xchglabs.com>.
+
+Location: dnssec.c:1290-1306, dnssec.c:1450-1463
+
+The bitmap window iteration advances by p[1] instead of p[1]+2 (missing the 2-byte window header). With bitmap_length=0, both rdlen and p are
+unchanged, causing an infinite loop and dnsmasq stops responding to all queries.
+
+The same code accesses p[2] after only checking rdlen >= 2 without verifying p[1] >= 1, causing OOB reads at 6 locations.
+
+Both bugs are reachable before RRSIG validation (confirmed by the source comment at line 2125), so no valid DNSSEC signatures are needed.
+
+CVE: CVE-2026-4890
+Upstream-Status: Backport [https://thekelleys.org.uk/gitweb/?p=dnsmasq.git;a=commit;h=7b151eb60609a0139474918222806f9bcfb4fe71]
+
+Signed-off-by: Hugo SIMELIERE (Schneider Electric) <hsimeliere.opensource@witekio.com>
+---
+ src/dnssec.c | 14 +++++++-------
+ 1 file changed, 7 insertions(+), 7 deletions(-)
+
+diff --git a/src/dnssec.c b/src/dnssec.c
+index ed2f53ff..68f1b5d0 100644
+--- a/src/dnssec.c
++++ b/src/dnssec.c
+@@ -1270,10 +1270,10 @@ static int prove_non_existence_nsec(struct dns_header *header, size_t plen, unsi
+ 	     packet checked to be as long as rdlen implies in prove_non_existence() */
+ 	  
+ 	  /* If we can prove that there's no NS record, return that information. */
+-	  if (nons && rdlen >= 2 && p[0] == 0 && (p[2] & (0x80 >> T_NS)) != 0)
++	  if (nons && rdlen >= 2 && p[0] == 0 && p[1] >= 1  && (p[2] & (0x80 >> T_NS)) != 0)
+ 	    *nons = 0;
+ 	  
+-	  if (rdlen >= 2 && p[0] == 0)
++	  if (rdlen >= 2 && p[0] == 0 && p[1] >= 1)
+ 	    {
+ 	      /* A CNAME answer would also be valid, so if there's a CNAME is should 
+ 		 have been returned. */
+@@ -1301,8 +1301,8 @@ static int prove_non_existence_nsec(struct dns_header *header, size_t plen, unsi
+ 		  break; /* finished checking */
+ 		}
+ 	      
+-	      rdlen -= p[1];
+-	      p +=  p[1];
++	      rdlen -= p[1] + 2;
++	      p +=  p[1] + 2;
+ 	    }
+ 	  
+ 	  return 0;
+@@ -1429,7 +1429,7 @@ static int check_nsec3_coverage(struct dns_header *header, size_t plen, int dige
+ 		p += hash_len; /* skip next-domain hash */
+ 		rdlen -= p - psave;
+ 
+-		if (rdlen >= 2 && p[0] == 0)
++		if (rdlen >= 2 && p[0] == 0 && p[1] >= 1)
+ 		  {
+ 		    /* If we can prove that there's no NS record, return that information. */
+ 		    if (nons && (p[2] & (0x80 >> T_NS)) != 0)
+@@ -1458,8 +1458,8 @@ static int check_nsec3_coverage(struct dns_header *header, size_t plen, int dige
+ 			break; /* finished checking */
+ 		      }
+ 		    
+-		    rdlen -= p[1];
+-		    p +=  p[1];
++		    rdlen -= p[1] + 2;
++		    p +=  p[1] + 2;
+ 		  }
+ 		
+ 		return 1;
+-- 
+2.43.0
+
-- 
2.43.0


