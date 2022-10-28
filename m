Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA38BC38A02
	for <webhook@archiver.kernel.org>; Fri, 28 Oct 2022 14:58:46 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.54])
 by mx.groups.io with SMTP id smtpd.web09.457.1666969116028464842
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 28 Oct 2022 07:58:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=sxiZcMsC;
 spf=pass (domain: arm.com, ip: 40.107.21.54, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=Bv5LSdtPfL1t+dA9EPAhZ0YUIDqPcSpwNxhNjbhRJ8GWKFqGAPlTJjOqaOoOkXZfJhbVmsV7nT/WWRlbEQRrfIAw3imLpQ623oYltbeORB7cODKAoJWIHNdd2vV5R7xib0ZyqkyfxPqozb7nUJGxhFLcVtB4AgilseOGL/QpbbZgWgqBiri+gEeaQ5Kkrni2/KM0O6qJPbP26xMUHevzPSB5of6qsVu/uKZi7iupcGJtcEV93Tx0tX9ZHeSM1Sru6Ikn+KbDRp6f72CIlORtoKj972CLd6iAISC2VTVfweNv1FvmkQ9Me3z49ij+DOwSToGB30s3qV1IQrLulIUptg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CPtLmu4mL6VdvpIjnPqEe6R01xJlTdufPNbs92frpII=;
 b=Cj/VCG6a8MXwHZ8bviRy2kNHR9oT2q9QgMxqTzgpnF/u2clsTba8Ysw9onYrbE7rpYA2E1NcaeKqgKSjLm1+sF8Xm22GAxq5VZataFGJ5s3lpD1CIsbvRWZDTJXIbD+0WfAnYdlkK2776YyqMuRLC+Zyptj0xpHE2+fmXprp+wdY+HFEVPQmJtJgaE0qyegXalNgoOUrKE116z5gbUZ25MJGHy/IWrj2weoY1DwdSejg2Vj9SS7WK8pJHldxH5mwOabsrdwPtZEv9J2AxLvgSNiO0Ed837itovHu/RJ90HTB7gdi2d5KyFFHJK7EsRVvtiLeUJJrT6ex2Wm6TNIcSA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CPtLmu4mL6VdvpIjnPqEe6R01xJlTdufPNbs92frpII=;
 b=sxiZcMsCegAhbbZuBBD2y/Oise9edDSsSwxajLgGYw/GKARhWYUysV3sUscIN8CQNphqtFUYAzk9P+gMXl4uvZsF+w4XpH+oxzpMQRmKKCjiNrfgMUSNIGqv69S3POWnI1k1UiV0PKPC0NUaeu0AFAxXtjO6GIW+RLU8JcZY1nA=
Received: from DU2PR04CA0232.eurprd04.prod.outlook.com (2603:10a6:10:2b1::27)
 by PR3PR08MB5707.eurprd08.prod.outlook.com (2603:10a6:102:8b::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.15; Fri, 28 Oct
 2022 14:58:30 +0000
Received: from DBAEUR03FT054.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:2b1:cafe::50) by DU2PR04CA0232.outlook.office365.com
 (2603:10a6:10:2b1::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.27 via Frontend
 Transport; Fri, 28 Oct 2022 14:58:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT054.mail.protection.outlook.com (100.127.142.218) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5769.14 via Frontend Transport; Fri, 28 Oct 2022 14:58:30 +0000
Received: ("Tessian outbound f394866f3f2b:v130"); Fri, 28 Oct 2022 14:58:30 +0000
X-CR-MTA-TID: 64aa7808
Received: from 98d8d0dc8d1f.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id B0884C4C-AE86-4C7D-A4C6-A32193660CF5.1;
	Fri, 28 Oct 2022 14:57:52 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 98d8d0dc8d1f.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 28 Oct 2022 14:57:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FEeUvoVAdVf7Cl1Lpj9Se1f+zypqUB/sefowJFi7t3VKJQrRXvGdVfQ5G7EjvLO0Zd4j4ca9IudJJzMkMO+eI/4DbQfyCZGQhH7B1EMA/5jn7nKmHLsPfXypDinGwH50c+0JAm8MDFhnSx4cZbwhmSPJPooNIIFuiOBRXnEEqz5kH2OfLJMXHlJOVrYqGZDFsSp4DG7urIdXx3+gJgqVOnb+WF1nYyirMqwiPblPk0mDS2oLtLXS8w6GLegGmqJKJbku3iIzLUz4vZdon8m3VIFwUOl1uCTDDmEiXNV5XZynL3pZMK6Y5mHOrbgAJXGuaifZX9lE/YPiNWcQKd/Xkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CPtLmu4mL6VdvpIjnPqEe6R01xJlTdufPNbs92frpII=;
 b=U3kohngFepPYiJKCf0W5rEsqkuLcghjxAyedpfkYsCzPYmuGpNROU9+Qk4Og0v5M26tvYuGk3CZzg93dcWhkZNGWEcFwRRwI5cv7t+IHfAyg7CKLpi8nuS1RAD7tFKQOBr0kqU5GXqns463WSoaBmQwdLB504CGnK65fXXoM8hwjeNiFCXpF9Z4iNXhGmr9DRTtHnLvY+DkISDH4BlNtzExuAuRZpbiXhNuIbE8RubKRcsX3z37Ufr5MszAzGu31PoAP7oz84Cabgd6ZdVmtPtBGC9ZOZUAE2DlHt3VphW9olRNkqOVGsImYZaV5WJGg2BaMkd972ND95nLaOwA0vQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CPtLmu4mL6VdvpIjnPqEe6R01xJlTdufPNbs92frpII=;
 b=sxiZcMsCegAhbbZuBBD2y/Oise9edDSsSwxajLgGYw/GKARhWYUysV3sUscIN8CQNphqtFUYAzk9P+gMXl4uvZsF+w4XpH+oxzpMQRmKKCjiNrfgMUSNIGqv69S3POWnI1k1UiV0PKPC0NUaeu0AFAxXtjO6GIW+RLU8JcZY1nA=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by PAXPR08MB6541.eurprd08.prod.outlook.com (2603:10a6:102:15a::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.14; Fri, 28 Oct
 2022 14:57:50 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::52da:ac9d:e42d:8cc]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::52da:ac9d:e42d:8cc%5]) with mapi id 15.20.5769.014; Fri, 28 Oct 2022
 14:57:50 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "mikko.rapeli@linaro.org" <mikko.rapeli@linaro.org>
CC: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [meta-oe][master][kirkstone][PATCH] fwupd: fix
 ${datadir}/polkit-1/rules.d permissions
Thread-Topic: [oe] [meta-oe][master][kirkstone][PATCH] fwupd: fix
 ${datadir}/polkit-1/rules.d permissions
Thread-Index: AQHY6s64o/KD/DmDEk6z95YEtRf31q4j5a2A
Date: Fri, 28 Oct 2022 14:57:50 +0000
Message-ID: <10504D27-26A9-4910-B890-FC283926F906@arm.com>
References: <20221028131037.3600179-1-mikko.rapeli@linaro.org>
In-Reply-To: <20221028131037.3600179-1-mikko.rapeli@linaro.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|PAXPR08MB6541:EE_|DBAEUR03FT054:EE_|PR3PR08MB5707:EE_
X-MS-Office365-Filtering-Correlation-Id: 3cea31a8-612f-4b01-aede-08dab8f4e085
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 caudgD9TS9/zOY9KX7i0JvdyuC3w7LuSGQUwbQL4i0A10miYv6VSMXoTA/Vlzwqv3EZHy7MYcxE5OfgXljVZ0VI+cUoFrwoTkJHOgZnAOL6aA9PnwyEYBkeOJtcgDemninL1/cyJRJywqtB8r6qdj8ZoErQz2l/L3Z3+hifQ0/dJ/HY/5Z8wFrkheR/IhnCCzfnZkpK92r02208BGwA7FuCpZK/s7BnSnSVhdE5W4FeLOdAOaDp2ro4fI9mippnV17Wf+mGgkqvcWP2AMOhWBtBehS0ormQEsWseQFBP3dtWEOkfyEcrUciKXKfLzyVj7Q6gViPAirfgv3P1doIKI+n9snI5I4QDShO5n/ECLrX2KS2lY3OX/V/z8RX7V0LJ+LxR9/bWwgYiiB9O3NkhfGtZ4pQDubOCbqCZKBWdwMjqGRuBi1N7E4/xFaIbRhgaAkNjoyV6SW+JggKj6TQe0JqmKrGSdn5q/oqksA1jFIy/VSNQZ5lcw/1Aly39xlk9CNjFjQ8DXLMhUebr6NIG3xy/5POIqjVuS+t868otQ74tXkk8z3Gq18LyKEWgzGZ3/Sd99xhd3F8PZlq2jMeSdJGyJYsJs1GCuLMQ892WuTv7DGfv+0mv2Zvepdg7hKZlyhClMxw6h4L+4wG29LbymJJtIDARCsSndSGvxGDCnoifBRGUZYo5x3YqMI7abA6cAMXQPafoAGN2t6/DAalH9+Dk8CJDSFd0jvMSCKYOE0mcx2PVp0ptQabv7ZLdt7DSnLTUQ122VFecpi/RR/zhI61jmhmHYzGfFsyuCOE7OiqgJgvMoeY95lIIpsfQG0rymkzniNpJwGHorRdZ/S/zCg==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(366004)(396003)(136003)(346002)(376002)(451199015)(6486002)(5660300002)(38100700002)(71200400001)(478600001)(122000001)(91956017)(76116006)(66946007)(66556008)(41300700001)(8936002)(86362001)(66476007)(8676002)(66446008)(36756003)(558084003)(33656002)(4326008)(38070700005)(316002)(64756008)(6916009)(2616005)(2906002)(186003)(53546011)(6506007)(6512007)(26005)(45980500001)(228453006);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <7ECBD4B90871CF4A8F6791973BC60954@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6541
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DBAEUR03FT054.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	a2a2dbf8-07e5-4f8b-6059-08dab8f4c8b5
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	VQ60VTBmbCe8e5kAPwfH2J2OgPCeUTRphQxYWZpBqhQ++LOrJVISLZmgjhR5O1gW1fdMj0BkSSoVwY/fLW5X7A8XemZhREGAYeHG41Fp18XnjfqBNakTYV1anGe0G/0b4bMA7KhHkGvYct6XGg/3aZVVSUIiq/mn3T2sgyvcmFQhKrrvAucplyObcyIy0q7DT96r1a/1whVYJU3wjO6EQ1d9cODkPsxqW2RaakhC6qDTJXVlh461g+TQ/Rn1bUShzn8aTyXWMaajEpkNPU6BsiL1u9eZKdaZ6D5aQkxT6qqSeH4VNaDrQ+Mh8pgJpTx3HbQduYeJ+uj+Ox4OOfJXBIDAICpKYbYGi+M3K0hI1N/b0DEjiF+v+Y94tUm8uefRBbd4FHvtmlT3BAMOVS3ujbK2mWqCHupyQlaFaJwvKxVQwjh/zeEaEOPO2CqWRdrdHRd77JM9TR6AmcuzMco2EMALetqniu0C0sgZIJ7BY/TrU5y8+Ff19QrwwqUVHwIKz0oPwhsNk4fJ5bNVLtFRE8ibOC4UpIJNebpWmCTmLiwDynSfRkH2zGtb2Yt3BDgh0l/L3+zlugpwoVQHFZmmhkQV4Bgh/Aa19xuPaAX0c5i/WDoLacHy3fhReH87YKKDYlfi3Aj0e1aD+fE1c0zur5vVwmwAGW2lepN8G9r3FYfVTcSVwMcBWwL1ZbFJhS9hYim375lMsl16loAoAvE0gXDQUIcU7g3lbvKjOUbMGt41bUNe73nlZ7QmQrTF047Rrtj77V8/nJ3HdIJ6SnQ7pjx/+KcDk2T8O2PASIcCsf8=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(376002)(396003)(136003)(39860400002)(346002)(451199015)(40470700004)(36840700001)(46966006)(6486002)(82310400005)(478600001)(5660300002)(4744005)(70586007)(40460700003)(70206006)(82740400003)(81166007)(8676002)(6862004)(4326008)(8936002)(86362001)(2906002)(336012)(33656002)(186003)(2616005)(6506007)(36860700001)(53546011)(356005)(6512007)(41300700001)(316002)(40480700001)(47076005)(36756003)(26005)(228453006);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2022 14:58:30.4734
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3cea31a8-612f-4b01-aede-08dab8f4e085
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DBAEUR03FT054.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5707
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 28 Oct 2022 14:58:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99335


> On 28 Oct 2022, at 14:10, Mikko Rapeli via lists.openembedded.org <mikko.=
rapeli=3Dlinaro.org@lists.openembedded.org> wrote:
> +        if ${@bb.utils.contains('PACKAGECONFIG', 'polkit', 'true', 'fals=
e', d)}; then
> +                if [ -d ${D}${datadir}/polkit-1/rules.d ]; then

No point to have the double check here: just check if the directory exists.

Ross=

