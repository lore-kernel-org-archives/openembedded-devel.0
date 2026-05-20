Return-Path: <hsimeliere.opensource@witekio.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82D36CD4F3C
	for <webhook@archiver.kernel.org>; Wed, 20 May 2026 11:51:00 +0000 (UTC)
Received: from mx-relay07-hz12-if1.hornetsecurity.com (mx-relay07-hz12-if1.hornetsecurity.com [94.100.139.207])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10418.1779277856948679324
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 May 2026 04:50:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@witekio.com header.s=selector1 header.b=GFfrkRgR;
 spf=permerror, err=parse error for token &{10 18 spf.hornetsecurity.com}: limit exceeded (domain: witekio.com, ip: 94.100.139.207, mailfrom: hsimeliere@witekio.com)
ARC-Authentication-Results: i=2; mx-gate07-hz12.hornetsecurity.com 1;
 spf=pass reason=mailfrom (ip=52.101.65.118, headerfrom=witekio.com)
 smtp.mailfrom=witekio.com
 smtp.helo=du2pr03cu002.outbound.protection.outlook.com; dkim=pass
 header.d=witekio.com header.s=selector1 header.a=rsa-sha256; dmarc=pass
 header.from=witekio.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=wrKcFzTsSTg+mu/ccfGEcqY/cy7Xb5NOhOfeUOh9L1E=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=2; s=hse1;
 t=1779277854;
 b=ZUPijY0ynKs0bS2xv2BdvO6v69Ew0lXGqwByWzXPLQf04VxOivpboPCJ016Fmhf2o/bdkzyf
 RLOzC8WKqMQdaUIx1XXD/U3pAWd+6ukdgzaFFORRiHWWEP45Sb3TbJa6OTdyGYoIqkMShwBmOgi
 4MLQYnNymPHOWDQen1QDQFc69JFgbKy/26vrAohoGFdPxIbhqzzCmg11ioAR1YQCAgkVaMpLWRL
 b2CC9L7jHqgW47P/3RWYIJwAbwqGAaqVbfKnIAKJykuoit4lz+Y4eSdn+xMvKSziX+UlAiMB4UI
 3bxjWZupkVytfOouHJPs8+kDg1tjzItkpe90OUL1f/9sQ==
ARC-Seal: a=rsa-sha256; cv=pass; d=hornetsecurity.com; i=2; s=hse1;
 t=1779277854;
 b=OWKHrX3rMVcqJdJ2ze5aiTG5ZEjDCBAuD29BaJzUIoCtMUCK0oJvCk8EBwObIkvdiF+cDGWl
 nLUsngTsnFdfIvRtEEe7aXKIY/YZctOr9Y3NuEVgy2cXgglZ9cCiJE0XJg9z1iJM3xOdlNiy2t6
 fb03hYND2Sqb47fMzSXSi3Ic+fpwoKgqILcecyv8dw/ZiQ+GKmsB5s3YoQFFYzlysUy+UexW+sT
 uJR7013Vamodn2i+hlpcO+fPtY6lnXqJCqrku9uQGeXm2wPwB8TncH+lCqktzvKqdOUf3/6UZf2
 t7baXec5yja6iYgnlgkuO1jRCxLZPvxY5S23maBq7ieZQ==
Received: from mail-northeuropeazon11021118.outbound.protection.outlook.com ([52.101.65.118]) by mx-gate07-hz12;
 Wed, 20 May 2026 13:50:54 +0200
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=atRSIu+Dbpcii+heAmTCoTVg8xEL1jOTmi2bDtk/iYNktIVlYlz8vyF6fhB/MtHej0+iue9vQHcwgvsOvxEonzUx/w+846PXHPmodqXXY6o8vqi4wbsijWp7jxMWeighWxwJ3rwi3KCtyV+/joh2whGvTvtviIaaX3O8+nlRCFyWQtIGvZW2gE9uD9TXtOE10Ksb6NMTNc83iLgvtqL8L+BHT064LnpVYKAP4HQ+MFXOrh85Y6wBBYfDbNEJLPNI0mwepHY5Liybpu+17h/2eEITe1sB3hO11lLD9Lsz1NWDy75p/3vhnN/6dIKHsAFpOj0lSUbzU40BG3fGXMD+7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wrKcFzTsSTg+mu/ccfGEcqY/cy7Xb5NOhOfeUOh9L1E=;
 b=oX/EbYMfgnqjqo4YlBafKD7fdNEERuglMZkQjgLyB/e26o2EUj7EPXYrH8i4zG3bjh0H6nYBsAyfb+0U14L6XZFE33/eCJdeqWjv2CcwxNiMBxBUmAoY5xin6Cx6WsYuV1/vAtzIgek0Ssnr5ko0YarFL+Jj5oJC5U6afWpTYfJPjdLcGFZghXT5EjFr/qwwpiX3N+7My0IK2m+wt8pzJOMktNDifbGPARqgoFzgR2mXYE7TTb8R1sUmZz9erc6KVOQ+nTB6TfJSeooDUX6Ppj2HOb5N8dtFsTdWs3E7MwZ3KB77XzJmaaldlfJL8HMxIEGnt1J7x28if2J/9PbDvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=witekio.com; dmarc=pass action=none header.from=witekio.com;
 dkim=pass header.d=witekio.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=witekio.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wrKcFzTsSTg+mu/ccfGEcqY/cy7Xb5NOhOfeUOh9L1E=;
 b=GFfrkRgRn/g5ona2ETJ+klGwTAak7OlSzsf+BiK6KJ1MGZCnbVKESEu7wJKQRnjX3++47wr687T5Suu23yzq+yjUQEZEYUN1f+GbEnxASQ9PQiMemc74vDwscJhAnQk1/kVm3A/M1aYHXn9ha8xDWO5NiIo6j7TTx7bNFsENlJA1YPEg2BNfv4OLpeKe2dXcxBQZMGrhpWOflg8hg2nH6SQ8oPRnXZdrMfX13gsxJi2aVt8OF/n57okreuJfsIy4wVDntUpCwhFKaLBAEmvhbP6xcy6h2kHbcQB8kks2hzn5fUKGeU5rgsG17GqnhOU+mUvHi2bEvs+lBQ0AxkfWiw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=witekio.com;
Received: from MRWP192MB3504.EURP192.PROD.OUTLOOK.COM (2603:10a6:501:87::6) by
 DB9P192MB2818.EURP192.PROD.OUTLOOK.COM (2603:10a6:10:5e7::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.48.14; Wed, 20 May 2026 11:50:48 +0000
Received: from MRWP192MB3504.EURP192.PROD.OUTLOOK.COM
 ([fe80::e437:672a:5abc:a0f4]) by MRWP192MB3504.EURP192.PROD.OUTLOOK.COM
 ([fe80::e437:672a:5abc:a0f4%6]) with mapi id 15.21.0025.020; Wed, 20 May 2026
 11:50:47 +0000
From: hsimeliere.opensource@witekio.com
To: openembedded-devel@lists.openembedded.org
Cc: "Hugo SIMELIERE (Schneider Electric)" <hsimeliere.opensource@witekio.com>,
	Bruno VERNAY <bruno.vernay@se.com>
Subject: [oe][meta-oe][scarthgap][PATCH] nss: Fix CVE-2026-2781
Date: Wed, 20 May 2026 13:50:32 +0200
Message-ID: <20260520115032.3131401-1-hsimeliere.opensource@witekio.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0445.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a9::18) To MRWP192MB3504.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:501:87::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MRWP192MB3504:EE_|DB9P192MB2818:EE_
X-MS-Office365-Filtering-Correlation-Id: f51d2346-ea5f-4290-ae75-08deb666086b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|366016|376014|1800799024|10070799003|18002099003|12006099003|25016099003|29003799003|56012099003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	OpeJn1K+N4Xqjr79lv3Bqqw8THV8lLpIWz+KDUCoAw/PR4fSY0gwqhBDg5Exb1oUbJG6IhGQu9xCV48E0HSZRhxyg2MUyHRSrmxOevTHnZ7vFwMFwmhIwibaq2dQdQeamq3fNG4gyl39RKQDHvlnB/QvIHGI1FoD0O45glIBy/whzQ98Tnev9PnKKzk2ThrLN9llxTyB7Kd5hKxzJr5h0Ryk9LRNte5d5JvnR5sSTC1NZUNUvMbxPN/4Jat7RIBm9K5A+/poZ/lGH8N9fRGaPxguROEGB+iAAk6oVDhhfl0/k3RnMC1Gcq5eEAhYzZGtafwQDFHHLkHDVZlfOpWGWFY14/7bJnK4c7XvPX+st4XD6mMLzaFus+BBWSq+J94BAAs8AoXnp8UWc8Fk6bRUCyu4P7jMmPNrJ8+35OY3U0QPF3Fl0jZrzGDnCmFpW2RqUD8z7potYdekutG6MuzA5dDwdf9s7OpSs+h9TfVTfFYGmu7kTBNSF0PT9zPOm0R41I8k6AsaQCNQs4riFTwd+W+UrF3b6ykh/WpB49azpMw4vbCehV5KFUDkQrfM6O6qnfFi4zx137DiTZnEU5dLh5NXQ25v2yq5pzkKTbnPtF2vLAn7e+eZsbR0vhcJJDxmPnHPn4BhjBhUrgBAU6AKYrflL5jo77YGquPUKskfyvP/oMOJZG7YbIIwHMYBByQFW/yGVpzu9maAVcEQM9la5g==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRWP192MB3504.EURP192.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(52116014)(366016)(376014)(1800799024)(10070799003)(18002099003)(12006099003)(25016099003)(29003799003)(56012099003)(13003099007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?F/w2XLJe1kg+URFKFvf62RpQFcPOpe5Vsgyya3oc0WFwivjM7m1nw9SykOBH?=
 =?us-ascii?Q?gabGkLOlw5HA1pZxKTuFhfNVN7pqPUJ+frbWjnq1+NiaxnAwouHDxyx8f3lb?=
 =?us-ascii?Q?HW+p+6BRNQqrABM8B+PRX+CO0Cg6dOKJE5Yvdbcn02VgAt18jSWFZdIe3yI+?=
 =?us-ascii?Q?2kNWCeBJ4lf9/jz1gCd9zKVBJykuOS7kHhUoT3T8msfLnnsrL0kM0M8ahOfU?=
 =?us-ascii?Q?6VMiqzmetVFpuJn3c0M/sy71j0JFRABAjjto2IKXE+ALl5t4zDBuKFMllKkI?=
 =?us-ascii?Q?g5J2u2+JEV574/1T+mdYAM94x89cMDHxXUut5brF1/zDVq4kKrBqu4gvl9fo?=
 =?us-ascii?Q?md5ec0XoykkIhTH0JRANHRWb+JstQ2V1aZu4Jxe3qzvR6KawYmle4PR204L6?=
 =?us-ascii?Q?3ZxDTTnAxJC8kdcrhqKE1A3/HrwOLYGVWFg79x1vyoWHEfB/h4Jrw7QHVrWP?=
 =?us-ascii?Q?0uQWqEX4UGY073TGv4Io/C0QOkNAISq7YTw1r/E6bCb6d8ocwsZ80sB6Zp3c?=
 =?us-ascii?Q?uM9UI0a6QRJbVRZG2OMuowUXI8dM0hkTxcCXUjttt4uE4jpBZ9rilpNYbssc?=
 =?us-ascii?Q?UuEv9Qu2YW6DaDmXr/OXpk7Xkbk7xzPzywdLQlT03AuICbosrGXFWsKNQirm?=
 =?us-ascii?Q?iryrJNwm70ZiH7fLoUuWX5Uk+TAhwbpWIR1GeZeQrPm5L2hYUhTktH94fHVg?=
 =?us-ascii?Q?6trc9MVzpmK3Xp64iZb0nB7c/WiKJ7qdYqVdjk3gI0Uu6q5Q9+vvfHaV1Kxp?=
 =?us-ascii?Q?ONGXMtjTUl1Qajotzm3rJ+Z9NNB5sp4ux/Gq6gINADg5IB1YtBAKh5eD+Nqy?=
 =?us-ascii?Q?F180Yq4E14i3ubc+9e9mb6QZXVhI1Dl3mKO2DAJOrxLMvvuEGj+n9DmNqObd?=
 =?us-ascii?Q?oQAJNasnt2U8GxlAz2EXbo7pCiRWtER2rc1lae+4SoweVj2XzyFhmlOB4+CT?=
 =?us-ascii?Q?mxjA08Fa9expS5AeYI2qRqyS0JsuOvh9ZfDJiaoMMFdCz1ud4YJVPcaHRDIK?=
 =?us-ascii?Q?RidmrMHW+gSRGybFZDH38jfLnKbBpa9GpbudBsRxFiiuA2ioDagNMfRLE/S0?=
 =?us-ascii?Q?ppt/fKXX8cvSaUL1Hr0QatYNqb+ZnACj0SlrJQYACAjwLWjYLq1l4KXTWUA1?=
 =?us-ascii?Q?CKsnVoHg/h+Cl6wIAwDU60QUsqcL2pqO+z14fRQqhXvi8X4tA4ZIiyewpAGi?=
 =?us-ascii?Q?OtWDWSHPGcK5TsIbqfG2avr/valUogBgCfHP8Ohl2tD1i7WIPr9O+B2Io5u8?=
 =?us-ascii?Q?GUwnVQKOnhFczaHWLbGXjmxRXUgjNOYuFQ4oo4m3RzTwclJreoFdaEgaTseS?=
 =?us-ascii?Q?JuYWf2gVmGsLs/oSLg4GExsBVrW6vUoRgcvhIVl2DGk6lSOyAPZNFrxBZtp8?=
 =?us-ascii?Q?9mhEjSYkav7BQeLCwIXWfKJ/qZOvynYsxAxc0e4don3XWXy87gQNDVxpuZ5B?=
 =?us-ascii?Q?SjLfVbsbfKMUwbmsGz/jNyyKqO6sgc/vnLkGQvl4D+9NIy9Vr9c2QOd6r48q?=
 =?us-ascii?Q?0ucbImNcas9dymENjiTx5qDnuXUUyJZ0o47OpuWIM/3vlIq/JdBVkFWeprYg?=
 =?us-ascii?Q?DIQxvvov4AM1wqlUpZYP4xlYwRNaeaTERgoV80l909XmRlWZq/QEHyWuh0Jd?=
 =?us-ascii?Q?1oxiFggPoLnmdM1Ce8jmAVADmGdXWjOQby/x9hG+hP0zIh+AathyKEfmFDSA?=
 =?us-ascii?Q?HR0ckRKt/BZtOYr1WcuSGNqNGtWffzYrK9USH/eAWC4Z/OyPwklaYjdA52O6?=
 =?us-ascii?Q?S2DH9WoFvwNPoFEpmdLu+cFpogkEagYjh/NUfnaOCqYhNYXGu3FwkPGvc3bq?=
X-MS-Exchange-AntiSpam-MessageData-1: L+z3/oeC44RLtQ==
X-Exchange-RoutingPolicyChecked: 
	NcuGO2Qtn+w0ydw5vGx4RVhSTLeHzOyLRha2pePwV8p4ASv98fFjVJ944QgnmBApLYB389p0OSeFiNvlwCaok4g+9CT876jZSYmdyAFRcJWt95GywV6LwxJSNq0Tf5+n8iuMKuWcqBCbErNhvraeOgp3kHEzJRSd73qAwTvjcC8vrNSlzWbCEk/1Zawj3a3XYQ6F6K1LatAq/Xelh7/vzuNLyQmIXn8qfLmxFRmDbdy1h22xOyyVfnWK5h0xERBqaLJGJb0c7btXEgkquwJzylyda5WAxBPpZEwROdg5m0F6RjkDtBybzCkYd/g0q+h6wiLn0ppZrpX/hhOGdVyYew==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	lM097CVslItfeFmQb+jj4TeneOOjCYPm+OTjSpHmCXokTLDtua6m+1DFYGjQKMdo8xQlOGS82+z3GHHLZat5rwzjDyoB/XpJ7SOBxmXfRN/2k/93e/fRZSDUdeP/HBoSr9VpJGGWGZCD4o6pcGV8bIf4+TpWAaMnS2rh3S8553ovQQT/7QkXqj4Th3p4AFM0I4+uopSDwibjWyMuRgbKElSN0raWPEcELJRxn0kzWm+mWfXcuHlRaEEKn6PAKmwp7TmkHxhSMUsMOSxckj56rFUyvkl+su7wfCHt0cUcjHCPnrDq7Y2ZI6HPVes36Qk7cQeXJwO8V0UGcfjaLClDEnvqkVjGHDLQRZ3aDKm+LlNQpt6m8eB5rmt2KCOvKIXq1qfjbcY2fn+S2YeyfX9pzTlwnIuXLWZ5+uqei0atRHk5U6q5tiwZA5c3Gfn+/VFMFPJkfq13jDlNgUDglmOXrOXe4M7TqxUNlFOHJ59ez24GfRqs2KXlNNziqKvTZYS81LEpywdpwitq0OorlNx2Bb6jkgIDkw8Hp7rlG2xmaJZrJvmpGEl3zfY3BuXvNEPj7DPfC8BSmKosvEY/PtaBcoGuPVRxLrO1PoYHs/QtTPTyad453zAqdIDBasZ/VR2C
X-OriginatorOrg: witekio.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f51d2346-ea5f-4290-ae75-08deb666086b
X-MS-Exchange-CrossTenant-AuthSource: MRWP192MB3504.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2026 11:50:47.8336
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 317e086a-301a-49af-9ea4-48a1c458b903
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9ruWdsHexfKkOI8M9YcLvFXd0sIgYPVi9cUBjb3lRTD1r7Tq087vao27Zqc5M1VKx84bGF1L0q2lJ4haV8a7Nw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9P192MB2818
X-cloud-security-sender: hsimeliere@witekio.com
X-cloud-security-recipient: openembedded-devel@lists.openembedded.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: hsimeliere.opensource@witekio.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-gate07-hz12 with 4gL8xk4NTmz1b0vD
X-cloud-security-connect: mail-northeuropeazon11021118.outbound.protection.outlook.com[52.101.65.118], TLS=1, IP=52.101.65.118
X-cloud-security-Digest: 624e95421396aa5b1021dcde5cc75a0f
X-cloud-security: scantime:1.364
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 20 May 2026 11:51:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127109

From: "Hugo SIMELIERE (Schneider Electric)" <hsimeliere.opensource@witekio.com>

Pick patch from [1] as 3.9X upstream mirror backport of [2] mentioned in Debian report in [3].

[1] https://github.com/nss-dev/nss/commit/870d3b013e6b39540d14e67b3db89da5a96381bf
[2] https://hg-edge.mozilla.org/projects/nss/rev/245385e16fa6
[3] https://security-tracker.debian.org/tracker/CVE-2026-2781

Signed-off-by: Hugo SIMELIERE (Schneider Electric) <hsimeliere.opensource@witekio.com>
Reviewed-by: Bruno VERNAY <bruno.vernay@se.com>
---
 .../nss/nss/CVE-2026-2781.patch               | 36 +++++++++++++++++++
 meta-oe/recipes-support/nss/nss_3.98.bb       |  1 +
 2 files changed, 37 insertions(+)
 create mode 100644 meta-oe/recipes-support/nss/nss/CVE-2026-2781.patch

diff --git a/meta-oe/recipes-support/nss/nss/CVE-2026-2781.patch b/meta-oe/recipes-support/nss/nss/CVE-2026-2781.patch
new file mode 100644
index 0000000000..8c1798ec04
--- /dev/null
+++ b/meta-oe/recipes-support/nss/nss/CVE-2026-2781.patch
@@ -0,0 +1,36 @@
+From fc8a94cca3150a59075ae3fba82ae9758df0b187 Mon Sep 17 00:00:00 2001
+From: John Schanck <jschanck@mozilla.com>
+Date: Wed, 11 Feb 2026 17:21:49 +0000
+Subject: [PATCH] Bug 2009552 - avoid integer overflow in platform-independent
+ ghash. r=#nss-reviewers
+
+Differential Revision: https://phabricator.services.mozilla.com/D278681
+
+--HG--
+branch : NSS_3_90_BRANCH
+
+CVE: CVE-2026-2781
+Upstream-Status: Backport [https://github.com/nss-dev/nss/commit/870d3b013e6b39540d14e67b3db89da5a96381bf]
+
+(cherry picked from commit 870d3b013e6b39540d14e67b3db89da5a96381bf)
+Signed-off-by: Hugo SIMELIERE (Schneider Electric) <hsimeliere.opensource@witekio.com>
+---
+ nss/lib/freebl/gcm.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/nss/lib/freebl/gcm.c b/nss/lib/freebl/gcm.c
+index 9ee7fc89b..d1410a9ad 100644
+--- a/nss/lib/freebl/gcm.c
++++ b/nss/lib/freebl/gcm.c
+@@ -355,7 +355,7 @@ gcmHash_Update(gcmHashContext *ghash, const unsigned char *buf,
+     unsigned int blocks;
+     SECStatus rv;
+ 
+-    ghash->cLen += (len * PR_BITS_PER_BYTE);
++    ghash->cLen += ((uint64_t)len * PR_BITS_PER_BYTE);
+ 
+     /* first deal with the current buffer of data. Try to fill it out so
+      * we can hash it */
+-- 
+2.43.0
+
diff --git a/meta-oe/recipes-support/nss/nss_3.98.bb b/meta-oe/recipes-support/nss/nss_3.98.bb
index 9218b4d30b..0937b28bd5 100644
--- a/meta-oe/recipes-support/nss/nss_3.98.bb
+++ b/meta-oe/recipes-support/nss/nss_3.98.bb
@@ -34,6 +34,7 @@ SRC_URI = "http://ftp.mozilla.org/pub/security/nss/releases/${VERSION_DIR}/src/$
            file://0001-freebl-add-a-configure-option-to-disable-ARM-HW-cryp.patch \
            file://CVE-2024-6602.patch \
            file://CVE-2024-6609.patch \
+           file://CVE-2026-2781.patch \
            "
 SRC_URI[sha256sum] = "f549cc33d35c0601674bfacf7c6ad683c187595eb4125b423238d3e9aa4209ce"
 
-- 
2.43.0


