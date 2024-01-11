Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B3E8C47077
	for <webhook@archiver.kernel.org>; Thu, 11 Jan 2024 11:43:10 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.41])
 by mx.groups.io with SMTP id smtpd.web11.9631.1704973389370541766
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 11 Jan 2024 03:43:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=NHfvn3FC;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=NHfvn3FC;
 spf=pass (domain: arm.com, ip: 40.107.8.41, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=COazTbDA7RWKZofaj3mpzusyzZBIPrP9hX1ICZyvk86sLJWEnPaSwzkTGkQJiAYZMcNRJk4D0eKwvaVnq+P0Y705QFxqv4p7EvSaX9kuAxAQvaPk+tcLFYmcouEy9OnTapxsY62670Mf9YJd3q3a0Vla8nwYExLylfeBXp+GuMNLa5jDs4IL91Sua8yt1cIf2NocTU411Ac2O6XGDb0JDSThPYp7bIJ0BpA6S+817DcYlM698bXdELDuTb7a8DfkTOcsg3vuJCfpP9xpY1pJFLAFh7wvNbAFOK9Y+6ywbIc1Ich1V3RWweeI6k1hDOw+QWgJ8pWjY8eU0gggEwpLFQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tb3GPdOBz743nwqY2fctCUH0/b5vAAkxw/svWJxYYgc=;
 b=YfaiE4J66HtoFG9viwnSweS/kEmLJvLjCt/zHTVeBBfmqq52HWI/ZtNvB3AsbD930jWhoRgk6i4hcvmjVITG8rIXMIJMkhUE1juUhwA1T8Zim0Q6qT6bV0LBNBT24i8oYphZ0ZOIaJ+z8dCnYrqOhadwSZthvDxW3pj3/QO3y0NfHEkWdhpPkQtdgTYoiVHD7mTNJQFNgIEAAsmlj4FDuMvSFSHyd+licSqvNnv96mztuvMsSk+9+EPMHFkXhpPz0t6l3b10w3RE5t1frZProvMXhaorEdX+dXXt/EMgQWjia/jlt8B9Pu9NSfxiGcsZoNQZIgxZDdz4vLDF0EmJTg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tb3GPdOBz743nwqY2fctCUH0/b5vAAkxw/svWJxYYgc=;
 b=NHfvn3FCIyPYVdePrKpdZT+SfOUcmZYNhBO0rAKhrUviOzXK7ulhlX+FzEQrZO/fDsj57cRT/L0j47ICDk0WqIP/V9tAOde1VtXYH9xSd9U954H/qtp6ked9ULPNkJoY2Mb4Bf/ONacyGREPrENb0hyyvTN5iT1zB1YtLngty+U=
Received: from AS9PR04CA0125.eurprd04.prod.outlook.com (2603:10a6:20b:531::16)
 by GV2PR08MB8751.eurprd08.prod.outlook.com (2603:10a6:150:b3::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.27; Thu, 11 Jan
 2024 11:43:05 +0000
Received: from AM1PEPF000252DF.eurprd07.prod.outlook.com
 (2603:10a6:20b:531:cafe::95) by AS9PR04CA0125.outlook.office365.com
 (2603:10a6:20b:531::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.19 via Frontend
 Transport; Thu, 11 Jan 2024 11:43:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM1PEPF000252DF.mail.protection.outlook.com (10.167.16.57) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7181.13 via Frontend Transport; Thu, 11 Jan 2024 11:43:04 +0000
Received: ("Tessian outbound a297577ee0df:v228"); Thu, 11 Jan 2024 11:43:04 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 133186a27306c44e
X-CR-MTA-TID: 64aa7808
Received: from b0d38569cab4.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 68B07BAC-18A0-447F-B99E-FC7AE31509C5.1;
	Thu, 11 Jan 2024 11:42:56 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id b0d38569cab4.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 11 Jan 2024 11:42:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SYO6E2OV6tD+tFIhfEnkz5pWtsWSDBQMEODmw6JhDoXqn15iDQf96+/d+ij+2pX+tyPmIutJ1gUv6CAR6QNd/udlaHCdPhtOc7fCynUDJ65xMqxGcqhaAqzl87abAn+4r/jq6do+214yTfs9t+fAXUdxb97IWzKHkvvgkQdyLrFxsiXO9yihlQEZXf66OebiGu3Xc2HeeaMgXNSqte3p83uhxakrIwH1nErHqF2gVyjqwpGJX51Fs8I3YK0o/DtNnxbYFx0FoVgMSOvlyljw5woXdQEu4Nz2is8k6o3Qy3a53DnNFSYbJ/yp5FRgXbQkUxVGlB9VKYXgfxtYEJaidQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tb3GPdOBz743nwqY2fctCUH0/b5vAAkxw/svWJxYYgc=;
 b=k8V7PIxnLjXZG5cyTXHirjXaO4BNJ1rJCjQpZLxDbCE8vniQzJ8X0uyqYNbhvODNFAHPs0y3bVpkZzdZhuYA6aj9apBteUEMoUZ28RCycv32MJT3pogh7xVB8MlZ1wXthAyhy+upzetI9igFKMiXv/zTDBfC80iRwoXzapabEA6vsjIMzmG8B1otA/LnjTofCisABmUh5mpsp76HHZBUeCXkZgofYEhL/t/lYvGYtcTFfrmeH8Ddhq7xj7u4IR/UDEpuaExlhZSlv4KtRbJ8CKXekC8QuP/pCwM/WrkSrALkRLA6CKtMmB93s+VFMSYAA8DqeaJ0pJS8TpEWFQzHdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tb3GPdOBz743nwqY2fctCUH0/b5vAAkxw/svWJxYYgc=;
 b=NHfvn3FCIyPYVdePrKpdZT+SfOUcmZYNhBO0rAKhrUviOzXK7ulhlX+FzEQrZO/fDsj57cRT/L0j47ICDk0WqIP/V9tAOde1VtXYH9xSd9U954H/qtp6ked9ULPNkJoY2Mb4Bf/ONacyGREPrENb0hyyvTN5iT1zB1YtLngty+U=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AM9PR08MB6147.eurprd08.prod.outlook.com (2603:10a6:20b:2da::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.17; Thu, 11 Jan
 2024 11:42:54 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9f34:f165:4c51:be06]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9f34:f165:4c51:be06%3]) with mapi id 15.20.7181.019; Thu, 11 Jan 2024
 11:42:54 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "alperyasinak1@gmail.com" <alperyasinak1@gmail.com>
CC: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [meta-webserver][PATCH] nginx: fix CVE-2023-44487
Thread-Topic: [oe] [meta-webserver][PATCH] nginx: fix CVE-2023-44487
Thread-Index: AQHaRADXyCD9wsKFy0KsvCSfoj+/d7DUfpMA
Date: Thu, 11 Jan 2024 11:42:54 +0000
Message-ID: <9B7FEF32-62AC-440C-8B50-3316DA1974D8@arm.com>
References: <20240110200824.225021-1-alperyasinak1@gmail.com>
In-Reply-To: <20240110200824.225021-1-alperyasinak1@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.300.61.1.2)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AM9PR08MB6147:EE_|AM1PEPF000252DF:EE_|GV2PR08MB8751:EE_
X-MS-Office365-Filtering-Correlation-Id: 77715235-38d5-4870-daf3-08dc129a78f6
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 7Zv8plb9M8CBJD1DrTuT6cRcT6nkCdDROUXKra93uD9yOb2xPdXLmupRjNQIu9aCBfGFFI/wB937NjET0hhdiPK0D+cHCJxKBJeYsq5+IHVhFQQAgoRbw880Fd2IO0XGdGEncp5spbZxEiN1z/OTOD6vAAMHTLxTxH2xv3iXO2Q88kW2DjvBdPSTbLn6I3wzzR78MAAEWM8RHSOFcE7IbfwXuy5cHeoMyH0o5nvIdCit158hvP/Mx9O7RJJDGUZJuEPgI9ptGryTEANGkAUxk9cX5pjvgCMEKpSwlPVWoh6ekP2VIlcvXX9cRtQqSUibUboVMrXK/ZxH378lexc3tT4Eul8Hn92kPMUdr6mhv0aJSwEXzyng0rZgcLTJ+Hp3Od0hQDlNqKQ6vIvP3BbJHv9xXERp2ENEe9qmxHOi3vFacTYszu8tjYD2XCheytcIa3qBbO54XP38GcbxbZfVzKaHkxS5G4mB3mLE55DuPybXyxki/X8vR2IPuA0DwWLPA+GGxI2dWTVa7Gyb6ttfECv6ayOCkJhaOfrNW9J3b4PvAO4XHc1A+zv6mZe8v/JCBSvLF9PcnKBdN0arzmlzuQNABop7kxKRZAIcMV7QIp/SLFpL5acanW/TYC47IEAMC54JeQOeFoipuKbTnc/KYA==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(346002)(396003)(39860400002)(366004)(136003)(230922051799003)(451199024)(1800799012)(64100799003)(186009)(478600001)(71200400001)(36756003)(122000001)(66946007)(6506007)(53546011)(6512007)(33656002)(558084003)(64756008)(91956017)(4326008)(66476007)(6916009)(66556008)(66446008)(8936002)(316002)(8676002)(38070700009)(41300700001)(6486002)(76116006)(38100700002)(26005)(2616005)(86362001)(2906002)(5660300002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <7410A00D1271AD42AD7F2CF3756B789E@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6147
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM1PEPF000252DF.eurprd07.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	312392a6-c161-40db-0ab0-08dc129a72f7
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	edgq3Tblqv/ssHkhjU65l31ylAOsqxWRxrkA+LiYP7qhYvM9rRd5UIZm7QnrUZ18AQodz7AYIPr883Fkano7Dki0roR+sggCMCS0cxojFr6VWX0lvN9EtYvzY3qL7NbufNs5fhEZ88qHwrY8Zyj5xQveO8NjLHo6QokrFQ88mTzP4uwpFWoWS76WbUeNXvWDX9gXoEY3ueZKIiBYdtbFFJNNbRWN1JmVLqLQUd3y6ZbDUw+46JxVUqYKH1pQMZ28ddj1urmo6W6uAtWnjegAABv6chyO4N1KOPXNm0xxz7u209VAJk4YzJDMjVXuilWhFAD1l/c/DIjJCFylXI7OPIWdlcRxuNu0Ts1l1B6MEHftAjMjVpNF2LBFjfqbEhPWvkuW1zfV3/kh3W5rYUZg2kvXKhZznshTQWe3JBkoYO2jgGkcD3H5ofxwlFPRkDM+uvb17ZdEwUYoi5QS3yrfys2mnJKtUNdu7g7J3cf43hk0A2fwCZFlObyizjRypHJehZg/bw5pKu+ZVK7WSl8/+TqDuKlmnVgruDpOUBZgqt0LQdfKUjv8xZ0mZw90yMwoRd6E46lWWYIE7xmk5YOLOqW6mtN6fuHnboHP/+nBbQduwxiXKh9/YAilgnR/APGpZ2boGjQ1ZNSerEzmQ8OGw9my7xMgWDehpQCFrNItmIONIy4gYTEHxU4/XqJig+ksjlSnQsu6tiiMA99fwYVWTxqDZXYwIPsxwMg8QNQ7ciM=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(346002)(396003)(39860400002)(136003)(376002)(230922051799003)(451199024)(1800799012)(64100799003)(186009)(82310400011)(40470700004)(36840700001)(46966006)(356005)(82740400003)(81166007)(36756003)(40480700001)(40460700003)(86362001)(336012)(26005)(36860700001)(41300700001)(2616005)(6512007)(478600001)(70586007)(70206006)(6506007)(53546011)(47076005)(316002)(6486002)(33656002)(5660300002)(6862004)(4744005)(8936002)(2906002)(8676002)(4326008);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2024 11:43:04.3006
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 77715235-38d5-4870-daf3-08dc129a78f6
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM1PEPF000252DF.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB8751
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 11 Jan 2024 11:43:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108223



> On 10 Jan 2024, at 20:08, Alper Ak via lists.openembedded.org <alperyasin=
ak1=3Dgmail.com@lists.openembedded.org> wrote:
>=20
> +Upstream-Status: Backport [https://github.com/nginx/nginx/commit/6ceef19=
2e7af1c507826ac38a2d43f08bf265fb9]
> +Signed-off-by: alperak <alperyasinak1@gmail.com>

Please put the CVE: CVE-2023-44487 tag here, instead of in the commit log.

Ross=

