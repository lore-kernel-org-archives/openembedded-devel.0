Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8F80C41535
	for <webhook@archiver.kernel.org>; Wed,  8 Nov 2023 10:47:35 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.42])
 by mx.groups.io with SMTP id smtpd.web10.10678.1699440446231682004
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Nov 2023 02:47:27 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@navimatix.de header.s=selector1 header.b=u9If1sRq;
 spf=pass (domain: navimatix.de, ip: 40.107.22.42, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bYQgY/bfFofIMI//3LY+laNOh2eyK3OHrhVrkchEtor7MSRCjT5FOvSf6+ii0+A0IqtVBVCSMChBc7mFxu8rO6qaZuEhFhsTcusnBhpoY27yH6u8M9HtbjUQ6yv/KZejhk4FsKKGGIKARDP56dHQ8Zcipl3Bla5fZfqjUUG1pTM8PrLC8qgAvtN340k8x1mQTpdnWHslwGA3S6emTnjJrZhiJaaG7Nrp60YUb0b4dJrup9LV/GymVChFOEutofpIgXBajNcAJ3tNqjLxpIKSdYkk2V7ocol6ngKTuIfow6EAxVVd8nTUDKCbCI6UTcMxNjST1Zpv4pe97Lehk0vO4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hf4Hj9OmqeGPZkrG7Cyaq5vt0i9cGGxHyzDpTJxPg20=;
 b=TajyjWw8PXN5v8A2NLo/XCuWCVXqO+yu8i8SxCDICWPhj+qS+OQxqJIUgZYyZV65mkcQkFmxcRpOqmqv2qSagis+v7slskOdP//ek+h0dscuNGOT+mbQKUhdMT6qeroPKT4TTwBps5RM2u8McesdzYJtGs29e42Gr0s6MgNy5nTvwPg7Ryjg1jU96yITGSeBLIxNGmLnaFiRfOzU+Ah+Eil89mAYvnOQJpaFjPm8ISd8wH51aAl7LYVkKusPII+ECA6BI8BrOWhAlcMJJLVSUdA3yUxdBZ9/feXLtGCr3wruhY93TMeGDIVSN09fQp+S+fUnCdJq/RIcOOnSRuhD1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hf4Hj9OmqeGPZkrG7Cyaq5vt0i9cGGxHyzDpTJxPg20=;
 b=u9If1sRqrj3LR1p4OTTO2Z1upz0BTm4OJ4DQCckbZh30h5Rj1M7oQ7YK4+VbIiKwY3YBAA+pb+vUcSEl5NxxlIu4RRfF/m2XFFSs+JIbwLwHUhvlEVPkPxkXuFAurZj7RJOu3VBc0bp4kA7alEcGLwzr+x64wEDV45GM5q/NTAE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from VI1PR0102MB3136.eurprd01.prod.exchangelabs.com
 (2603:10a6:803:5::26) by AS8PR01MB8443.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:442::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.28; Wed, 8 Nov
 2023 10:47:22 +0000
Received: from VI1PR0102MB3136.eurprd01.prod.exchangelabs.com
 ([fe80::7242:3e9c:3c24:bd10]) by
 VI1PR0102MB3136.eurprd01.prod.exchangelabs.com
 ([fe80::7242:3e9c:3c24:bd10%6]) with mapi id 15.20.6954.029; Wed, 8 Nov 2023
 10:47:22 +0000
Message-ID: <37d34916-b09b-4fee-a57f-6d7b01eacd3a@navimatix.de>
Date: Wed, 8 Nov 2023 11:47:20 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [PATCH] [meta classes] sed -i destroys symlinks
Content-Language: en-US, de-DE
To: Joakim.Tjernlund@infinera.com, openembedded-devel@lists.openembedded.org
References: <20231107202439.2647261-1-joakim.tjernlund@infinera.com>
From: =?UTF-8?Q?J=C3=B6rg_Sommer?= <joerg.sommer@navimatix.de>
In-Reply-To: <20231107202439.2647261-1-joakim.tjernlund@infinera.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BE1P281CA0069.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:26::10) To VI1PR0102MB3136.eurprd01.prod.exchangelabs.com
 (2603:10a6:803:5::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR0102MB3136:EE_|AS8PR01MB8443:EE_
X-MS-Office365-Filtering-Correlation-Id: 021f27c5-3d28-4768-b2e9-08dbe048164d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Gv/GFamIWLa8p3IfLojDAqYqdrqzSq5ptLqbNqNQvYUK51cHYHJU6MaKGuXUPAJ3SW6wAxmNpqAEAPbIf95nsmeUQEud6wdDvS/O+5OyK/u7vDRcr9shv9P7h2GHvDdwrkuPjKFotpcRJ4aThlJaIUelVlJ3imQo44HWSG75V3IfkY4RdOsIX3QC6bcnYK3nFhXYXQ9UdH27pJDBzpu92qtudS1C7UqVBDQ2hMLSx/1mGDgAq3pC2qjmgOlvwfwlWjIqNFkTFX/0rBBsQfk3nMpiE9JUXW3qvjqb+vINd5sxvhCuGF3KvzZevCtd8ngNLIHVJ6t0/LX8Eots+s4tTb+WdID3Nb0lm8ZgwPtmxQBVPNessJ1u4PknQa1cx9Wuls+rE90V5Yi9eHEMSM5sxpRxdtCvrneS5x+RlGysTASy0dOqDBVppftCIhsGh9+ORhomsJdNiHqO+ZYAzhQKzqxaS8UDyuqnbJWdOLhf3WSzC+yXdf76KuckwxTTRyJmNCT2jzQQXJv63TLGdLOSBlgFZe4Uz+TI6XliNaAhKer337mpUFjD5sDXN3GccIOSe/9oJXie7kX8XJa8OW/87/kS1pA4mEH2Zz7tOSOJaaAHczaM4ni9dA97suWEmOKL
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR0102MB3136.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(346002)(136003)(366004)(376002)(39840400004)(230922051799003)(1800799009)(64100799003)(451199024)(186009)(2616005)(6512007)(26005)(6486002)(478600001)(8936002)(5660300002)(36756003)(8676002)(31696002)(41300700001)(86362001)(66556008)(4744005)(66476007)(66946007)(316002)(2906002)(6506007)(53546011)(38100700002)(31686004)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?LpDfdWdyEiHZpHnN/+N0qgSevxHXwbT5uqyvuvkDs5HDTCrqZryVCLPtlAL6?=
 =?us-ascii?Q?6lJoEgBF47bqaQ+sfKUx+5lkLdn5U/xsSmEy4uS5Zuvwlay6Mw4EbmhTdL4M?=
 =?us-ascii?Q?213SohqqiswLgYl968dlVT02turtfXu7U7f0EjXzis6dUMQTkcc5YQYi/Hr+?=
 =?us-ascii?Q?yEyBBEOhQOH3Xp8eDqh3lCXumXmK6Cjp8lQ842xKoGaGLUxawfRtBRsX8UCl?=
 =?us-ascii?Q?A29wThH/pH31mIGmCPm/EDmKVTaO7Uq6B0BB4CJN3zAW+jPuqwQHipeEA5/t?=
 =?us-ascii?Q?4ZZmQ2mNSpun0r7521q0AYCh7jQoPhJ8kyoiULiAUEjTOAb8p1ivV/niec8v?=
 =?us-ascii?Q?U64qQeWfgoub7Y6KXi3ar9zJWDRB/X4TAbgUVGzubESU8ssp1OWM0xLETdv0?=
 =?us-ascii?Q?cOhP5dvyOoaIcBDEAqr4JWjFp1Fl06VjakclhXRaxt+TwV/edcqN120QBn7d?=
 =?us-ascii?Q?XaC/QhnHJdAI56DNu78I3H6Qfr4COUmAdaqB12TDaQ3K38ESw6i/TEDacC0/?=
 =?us-ascii?Q?HCiP1vEJEVG68u2AMqXO8Tll9ZhJ0SuhUq3D/xC6HiXgrdcKVPyzdpOgiSSw?=
 =?us-ascii?Q?FhzAJO00nOmB+PgTd8UNTM8WAv8AJVBjJ0WOYZQmUHWATeyIQkT3cgPtHrFi?=
 =?us-ascii?Q?yBk1o/y7JDjzX4IBZDS0CMNan3+csFGPUkwGLKMapPu5YM2lFRDRKpVPt0tJ?=
 =?us-ascii?Q?rcz5oT6qTkHwsIqyBM1iiSGZQptqwEaaPtWuiJ88WDbMjaV2cqN/p/Vw2CmW?=
 =?us-ascii?Q?QLvNsK3sx9fwCZWzZ6XbvrqYl2LwN3GAmNSR3kS5aiU++6WKNvlx45a1HK7A?=
 =?us-ascii?Q?t+D+VmAg0xOf8PzOWsNN21tT9sOAtccJ6oBF5eX+vEDn3Dg5DMF2LsOSrRlR?=
 =?us-ascii?Q?4pD4uJsGjp8SlAeic1D7a3CTT78/CUvvhy8VVgRDIs1ySP15QcBqqqYj8C9t?=
 =?us-ascii?Q?JrKk35NZTYk/JEwWjQ5CAN3Y4opCvTJtM+lnZfAhyrsQTwqof1i/X7DW/Meg?=
 =?us-ascii?Q?eBtA49kauaFHg6co16JrBRUK5GHR1qAz2x7QpKLrtHrpfnl+lVyQ3R2CAmGM?=
 =?us-ascii?Q?lwAqr6j3gp09hAdGPHzhaztCk1hE2BColDJsEsiyktMa4N7pbvskNt+7HUFj?=
 =?us-ascii?Q?tttm4rvI+w3SU2HSU64IWkHIyv10YHcQPHQLNl59wrG+nHt7lhJoF4RTMeSn?=
 =?us-ascii?Q?9J2+sz4+SzuLTWaryWzP5Xtx7emoS1DUThjdjBJpC9ny94E8PmhqKNWWtXXh?=
 =?us-ascii?Q?1gvlDwsfjrfYJkrxTl2sPzlQFGdDqm3lGRCXGtjjDl+gHpiNUgFAkTcDTyOU?=
 =?us-ascii?Q?b6xTvdbJTw51uHGn5IuUGKswJuEx/AkN5U2hnvP74y///hWvHnjp/2grcuJq?=
 =?us-ascii?Q?LcQliLdLfXdFjsuGxALwNkoyRn5fcVecTZJUQQ4iqk4HSMA+Lgrkb00JAL2/?=
 =?us-ascii?Q?i7tHF/RbKLGIcVwCHP5IC+manK2OmQrxY464nEQrqFk+MRTeXTKunj7BvxZs?=
 =?us-ascii?Q?GF7QpMcnWnzqbmJNaaZXt+TE1KbDXcZ+psDGa17ON7iLOcildTfmJRm30yQx?=
 =?us-ascii?Q?3qcA8WeWfDKrDRMzBEd6bOvijVu8DZHB72Q1zzWbZBmEiW8/UHdRiUi6Fq9Q?=
 =?us-ascii?Q?Yg=3D=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 021f27c5-3d28-4768-b2e9-08dbe048164d
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0102MB3136.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2023 10:47:22.2113
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 14VqC03EJ3KMb6LopJM8dIBTy7syDDjOdtCQEtfHzYIsoZWtyIzM76TWOKSz/LZxTZU/Hjc1DisvwS8zhKbUFCiCgBSkSbZZhoinTVOuICo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR01MB8443
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 08 Nov 2023 10:47:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106471

On 07.11.23 21:24, Joakim Tjernlund via lists.openembedded.org wrote:
> In /etc/passwd is a symlink, sed -i on same file will replace the

I suspect the =C2=BBIn=C2=AB should be an =C2=BBIf=C2=AB

> symlink with a new file. Prevent that by expanding the file with realpath
> before giving it to sed.

Using `sed -i` could be used in many places; e.g. /etc/hosts. Maybe the
replacement with a symlink should happen after all other scripts are
done. Would this be possible?


Kind regards

J=C3=B6rg Sommer
--=20
Navimatix GmbH
Tatzendpromenade 2
D-07745 Jena
Gesch=C3=A4ftsf=C3=BChrer: Steffen Sp=C3=A4the, Jan Rommeley
Registergericht: Amtsgericht Jena, HRB 501480


