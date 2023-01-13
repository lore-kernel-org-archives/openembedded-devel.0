Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA124C54EBD
	for <webhook@archiver.kernel.org>; Fri, 13 Jan 2023 17:08:16 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.56])
 by mx.groups.io with SMTP id smtpd.web10.93589.1673629690260758532
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 13 Jan 2023 09:08:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=RLpZ0YNg;
 spf=pass (domain: arm.com, ip: 40.107.6.56, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oyxKC+CPvypV64AdO3qwT/wA5qTGuUolB8wx/xN0XdY=;
 b=RLpZ0YNgN+/+N66w+4JeF4OeO5hDVk6xZD732OW83Z7vuLuog0a5WOySYFOzAJm3Ia1pwGk7k+X7CW4sWZqrzhBm7+qU/qqLR++pwHJGsPoeqylB/X7P/nXN2Ot6wtpkOVGeaEIK7YM5tdC5ASWqjhE7iOlJc138FTkJizTiATM=
Received: from AM5PR0502CA0003.eurprd05.prod.outlook.com
 (2603:10a6:203:91::13) by DU0PR08MB9902.eurprd08.prod.outlook.com
 (2603:10a6:10:476::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Fri, 13 Jan
 2023 17:08:06 +0000
Received: from AM7EUR03FT021.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:91:cafe::13) by AM5PR0502CA0003.outlook.office365.com
 (2603:10a6:203:91::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.14 via Frontend
 Transport; Fri, 13 Jan 2023 17:08:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT021.mail.protection.outlook.com (100.127.140.243) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6002.13 via Frontend Transport; Fri, 13 Jan 2023 17:08:05 +0000
Received: ("Tessian outbound baf1b7a96f25:v132"); Fri, 13 Jan 2023 17:08:05 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 40e4feb4c52bb8df
X-CR-MTA-TID: 64aa7808
Received: from d86d46b53993.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 8B3711C4-C7DF-4559-B14E-E173F6D30DDB.1;
	Fri, 13 Jan 2023 17:07:59 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id d86d46b53993.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 13 Jan 2023 17:07:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G31vCdeLDse+WBBNNMGtZ8UHrsFa3cfV5BuHGEgBqKYLmBaGhSyL33tx/Kh787KZGiZKOE/+bPifr/oobwwoRPo5qUubWdgtmhx5q86ls4edJxofTYt5RSejZbZwT9Pu5Q3dLP1hhvktHq6RZOL3md19gp+SyeI04LVOxXDykG6pUzM1lLe8z5mbCxzEzXuvrhBNu5a21mpe3lxeaQd/lL4AZktIudLzQXwWMEH7GHouuwdzXo7xQGXhfijf0+q+7kT6Slw9LLmgGMiSnvT45ckaGAtUVcRn+DdL1reZcLPU1uJXknzaOTgGojnYa62C9ZqrVUTqb3KpG8gWNOhn9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oyxKC+CPvypV64AdO3qwT/wA5qTGuUolB8wx/xN0XdY=;
 b=DjKmUBpFH5xSE+70e8d1HmUKLhkddO49dPZhN3sWPx1KT4yniniI/UdMg2qDVdV9yYf4he49kmqTe+1y8o8eDyK96u08W8ZKfSGi+6WvhnIOU6KDHWOUSDUsG8MwyjgWUSK2iGTMJf+YOd5191Xg9BY1gmTNTa205LTT+LYKQKZ/3bICM8ZCYFMFNZq9jBrZozX8XxcoQm3YqasBxRKjtIZJ3JHQ1l/jNr06c8/9oJSm0Nk48J36ItHWnCEbmTt8UMH+v7K+dtteMk93BKa1XD4IMOC2SAYpd0U9PH7ygUB2mmcKHJIY9Cg2djfICQH2k5yo6TtKGu2BgmMd/v6luQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oyxKC+CPvypV64AdO3qwT/wA5qTGuUolB8wx/xN0XdY=;
 b=RLpZ0YNgN+/+N66w+4JeF4OeO5hDVk6xZD732OW83Z7vuLuog0a5WOySYFOzAJm3Ia1pwGk7k+X7CW4sWZqrzhBm7+qU/qqLR++pwHJGsPoeqylB/X7P/nXN2Ot6wtpkOVGeaEIK7YM5tdC5ASWqjhE7iOlJc138FTkJizTiATM=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS8PR08MB5893.eurprd08.prod.outlook.com (2603:10a6:20b:23e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.12; Fri, 13 Jan
 2023 17:07:57 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::2d3c:c53c:86ba:a3b0]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::2d3c:c53c:86ba:a3b0%4]) with mapi id 15.20.5986.018; Fri, 13 Jan 2023
 17:07:57 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Khem Raj <raj.khem@gmail.com>
CC: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [PATCH 1/2] python3-pytest-forked: update for move from
 picobuild to build
Thread-Topic: [oe] [PATCH 1/2] python3-pytest-forked: update for move from
 picobuild to build
Thread-Index: AQHZJ0pWdtDS31KJx0C/SlhRngwxGa6ckraAgAAB0YA=
Date: Fri, 13 Jan 2023 17:07:57 +0000
Message-ID: <A820F473-8A69-47E6-93FB-AF82BFD50316@arm.com>
References: <20230113122629.1300116-1-ross.burton@arm.com>
 <CAMKF1sqqPAURqVn5wPcKkNzrNVLT2892X5rOkx1C_NRFRviu5g@mail.gmail.com>
In-Reply-To: 
 <CAMKF1sqqPAURqVn5wPcKkNzrNVLT2892X5rOkx1C_NRFRviu5g@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.300.101.1.3)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AS8PR08MB5893:EE_|AM7EUR03FT021:EE_|DU0PR08MB9902:EE_
X-MS-Office365-Filtering-Correlation-Id: 44deb573-2711-4ae3-fb10-08daf588bce3
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 Yl6+v+1IHznHcUA9wB6zP3sDWzH7wjaoqkSoUmy333d4VRFmuzF2WN4z+cmz9drn7J20+im2nIdxwcyak/8XHnY97WbN5thSTZqljhxufxxpIBSf47wql8g5anM43+oJQkl7kJOVg3+rEa79OX84hxgZzOqOWPSGauIeFHOlC81/vS9y7p09kC1IB42CxPSAWcyjnyxH1NghJFQfuLBjpQKAbAk4C2s618JuQUOVelR8LEg3we2e7Sgs6SPedpXWzZBbHGpgKvirxFibk4Ikxidfc6YMufLg6VSszh57TxHo7L2PFUqMyjwoZMcQboQpBqpd3BqV7h2HlxUkC4ndEhPs1pwKrqFjHoSMWl/NpgeVcehfWSgZdallHvEuZKXm671/WZXNB5r4mJ9rL/GRWknVFsQLQllk+HPkp0IeWCHONZVy983GLZtrcJw+bbpi0rlv51UzLHR1M3HfAUrXdAzL8ORvO5ri5lIivAdxfNtwpOY77BBRRmp9s3IbHhfgyKOiTyT8mbd+qu+pgeQ9k43n/73L8WDAVxMu0didWXIgR7enFN777vx2xm2JQgZYU6bN21IpMhTWUFsM4ZOqHS5U2ofZuAD0gJGffKSzXH29StT9z4Rjqk97lCSp6hbsWu1OJV0G7QDjbTfWpLZFJX1JLMu14oCfSgzLnL2jlxiVVx31yHKGS7uDJQdyqmj57OHNuDppJW1gahQOQCkd2tKVyJdTglVMxotMxEyqbiQ=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(136003)(366004)(396003)(376002)(346002)(451199015)(478600001)(558084003)(33656002)(6486002)(71200400001)(186003)(2616005)(6512007)(26005)(53546011)(6506007)(76116006)(91956017)(5660300002)(4326008)(66476007)(8676002)(66556008)(66446008)(6916009)(41300700001)(66946007)(64756008)(15650500001)(2906002)(316002)(8936002)(38100700002)(122000001)(38070700005)(86362001)(36756003)(83380400001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <CFB72F41B42EB14285A33EF9DD4B7342@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB5893
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM7EUR03FT021.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	f2358826-9589-403d-b865-08daf588b7d6
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	r82h9/Wwdvp1mzlKeJZrzm+o7Ttfh2AgUQI6tRQKsA8LG/Quhud81cf7911OvXunaxaPyCvgzW6qUh9R5253mbM7v8b2EBgWR3GlyEX0q+lJciSJthg2Mbs64D0dgb8VqjlmCubYndHWpVKzCjPcVOBMH/2mToWMG0e0e1Cg54JxkBppcoaIx+PWgQxqLg4i9ZoHAcujEc2dp87Kon5axOchvQX4Ok84HgjJe9ROvmeMaLNp9XBpSwjWFJGsSt5LLvPW3TfTQ+9tgh9eS4M4AFtseHdPY6xwzZwkvyQLqVMgydQ8v5rhvXjm/7xx3azdVHS7EU8NeocCrfDlnpdGB+aEQb6cRsUspiYYKKUR+hFeM/DiRuMPq55dVjstF2rQ9D0A/C/3xr7Ay1QN6hXMZ2uIs0ITaRIbmL67640uxQn9mtwcQHGA75OKj0Yy0GP9oxjcBb8Ve0DTJ2NNE5Vpa5SJXyZJKFdoBBdfEQ0oGhN+9xmaWK3Bcrg31JfZGzX4AHPMu3wHF6z9nxeQoISUXVY/lhL9VavArt5+liNEbSK8wOIVXqQQ4X791slWC858U3iPnIs5fbWan06kIRHjdP9rtqJzCwvoq0Hilj0ZDAjK5nMuEH9y5SOiEvW7DQ9zXP9+rjEd6/wKe6+3/WNz26TEU1xGqVFPdBN9sSZC805C5SN2qTpteUA2CkPHBdS8+yQCENjKL2BsukINji8zXA==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(376002)(346002)(396003)(136003)(39860400002)(451199015)(46966006)(40470700004)(36840700001)(82740400003)(2616005)(186003)(558084003)(33656002)(36756003)(40460700003)(82310400005)(40480700001)(86362001)(356005)(81166007)(316002)(6486002)(478600001)(6506007)(53546011)(15650500001)(5660300002)(83380400001)(26005)(6512007)(6862004)(8936002)(70586007)(4326008)(36860700001)(2906002)(336012)(41300700001)(8676002)(47076005)(70206006);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2023 17:08:05.9136
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 44deb573-2711-4ae3-fb10-08daf588bce3
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM7EUR03FT021.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9902
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 13 Jan 2023 17:08:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100567


> On 13 Jan 2023, at 17:01, Khem Raj <raj.khem@gmail.com> wrote:
>> PEP517_PICOBUILD_OPTS =3D "--loose-depends"
>=20
> Do we need this option after picobuild is dropped. ?


No. That would be the merge going wrong and I failed to notice, thanks.  V2=
 on the list.

Ross=

