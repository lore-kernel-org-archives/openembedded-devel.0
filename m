Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6969DC7618D
	for <webhook@archiver.kernel.org>; Mon, 20 Mar 2023 14:46:05 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.41])
 by mx.groups.io with SMTP id smtpd.web11.16091.1679323562023710757
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Mar 2023 07:46:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=OB+OTJoE;
 spf=pass (domain: arm.com, ip: 40.107.7.41, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4qK3CxpW68p0b/MVDtaHCm5hGC3T7df7iMdNL6jVSu4=;
 b=OB+OTJoEFSbg9Puf553BkzxxbySTXeBxSu82HKpGhNEfDRpyLFKn3G9IlvIRj6fTICLkduC92Swhofc1jVYEcHl0foAFe2BiGUl8RPTjIeQXsP8zVpfeWwFTrQeWsroSvIEXjzWbWNHg+SaThbeL6BO7q/53aqDeSzTV0CDDQZA=
Received: from DB6PR0201CA0040.eurprd02.prod.outlook.com (2603:10a6:4:3f::50)
 by AM9PR08MB6033.eurprd08.prod.outlook.com (2603:10a6:20b:286::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Mon, 20 Mar
 2023 14:45:58 +0000
Received: from DBAEUR03FT043.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:3f:cafe::e) by DB6PR0201CA0040.outlook.office365.com
 (2603:10a6:4:3f::50) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37 via Frontend
 Transport; Mon, 20 Mar 2023 14:45:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT043.mail.protection.outlook.com (100.127.143.24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6222.15 via Frontend Transport; Mon, 20 Mar 2023 14:45:58 +0000
Received: ("Tessian outbound c2bcb4c18c29:v135"); Mon, 20 Mar 2023 14:45:58 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 6efefa895397b9d6
X-CR-MTA-TID: 64aa7808
Received: from d6fcb9d45bac.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 88292A76-4344-4F62-9B23-002ABA4E1893.1;
	Mon, 20 Mar 2023 14:45:51 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id d6fcb9d45bac.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 20 Mar 2023 14:45:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OecRR6kJvxFKQx6CRdsWRbvHDdQTOfbtH+LOP1Ix2PiFKrc+GSDorzFFNcVVfQ6s240HaeoKRahLXFrjoTrotRpNkP+jO2dbS3VdDHOV/k2xpSFlNMEk36pjjRbpJDouVqiJQs44lnYsfKSqXtxpZkJgrY3YYCbNpmXCey0LWsQf1ZlcL+AiYZ5TrqD25ltRk23XSY/bzxGbOMS/Izib0QKipKGckKbhRE2gw9x12u0t56rjbpBBdBLUXuqZ1vEAngyS8vrJkVtMY+R3LVgdQPi5CAJShOTQRwnJe6t2g13VsgJ64kFSrfMIuBJ5R1g3HbhvgL8s0QLnCG1M68yyjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4qK3CxpW68p0b/MVDtaHCm5hGC3T7df7iMdNL6jVSu4=;
 b=mSWKRRMPj27dLh4dIrH/evDo3k/n3jy+fdvjV1KRS6uSVxCydYwYRaR3fi26RctffXXnOX7UTjM9OCUaQAtxByNMNzmPwjdieKszFdntXaYXFMLX72+eS/gPWebTYXJMl1zkQ2xgyKccTMZLuZEuHw2uP9XlS1U/8gEv4NyqHl1HBZlUZlmdV0zyqTV86BUwdfR9HjTGy3LxDFbIWdkpry5bHC5w+BhghkHTrnPs//7prB1taoXM0Eg4cApSd9ao1e1sCivYq8Uph3zO9L3r63h+dnuHHnNg1nDVZa6azrHWBbLzS9YFV/ZJsZRvQeEL4beN+Wj89sS+Pe0LjfAOWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4qK3CxpW68p0b/MVDtaHCm5hGC3T7df7iMdNL6jVSu4=;
 b=OB+OTJoEFSbg9Puf553BkzxxbySTXeBxSu82HKpGhNEfDRpyLFKn3G9IlvIRj6fTICLkduC92Swhofc1jVYEcHl0foAFe2BiGUl8RPTjIeQXsP8zVpfeWwFTrQeWsroSvIEXjzWbWNHg+SaThbeL6BO7q/53aqDeSzTV0CDDQZA=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DU0PR08MB8068.eurprd08.prod.outlook.com (2603:10a6:10:3eb::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Mon, 20 Mar
 2023 14:45:49 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::e305:742e:e10b:1093]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::e305:742e:e10b:1093%2]) with mapi id 15.20.6178.024; Mon, 20 Mar 2023
 14:45:44 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "zboszor@gmail.com" <zboszor@gmail.com>
CC: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [meta-python][PATCH v2 3/4] python3-pyproject-metadata: New
 recipe
Thread-Topic: [oe] [meta-python][PATCH v2 3/4] python3-pyproject-metadata: New
 recipe
Thread-Index: AQHZWKHAbs0sDoH5WEm1xfk7h1TPm68DxAEA
Date: Mon, 20 Mar 2023 14:45:44 +0000
Message-ID: <75C9C3BF-25E6-4244-8379-3A1323EB0B48@arm.com>
References: <20230317072547.1031123-1-zboszor@gmail.com>
 <20230317072547.1031123-3-zboszor@gmail.com>
In-Reply-To: <20230317072547.1031123-3-zboszor@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.400.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DU0PR08MB8068:EE_|DBAEUR03FT043:EE_|AM9PR08MB6033:EE_
X-MS-Office365-Filtering-Correlation-Id: 15069265-3524-4a4e-b77d-08db2951d183
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 yekCDdOo/11nvEpdX8wfvS/cGgnBo34Jq0qc2YGAhdjIPMDG4+pWiarm4hCNM8BSC9MjUaXjn3ncFRhdsFK5n1USWytIWQUhBX3kA6ZZ0fXfJxHbyrla0kJ8ye/51YwG0pZeLcI2xM5i7oGWsLCeJxSyTzazZ1YNCVXHzjZVlcHUUOeyYA/swFIxDY77zmRm6jjwkCM2bHuPYkw5X58SRJx73fipXCLzHqAgCojUZSLsmO443dSrDvmRHkkna43SGcnhXeKxeZi28Oq+nRvH3Oy0ixoS6v5LfVPLbgMsDE+YA1wPzAkrakgKK3Za9FofP7cjisTVP20SHbFWRUR//IEoOVHjis5OftZ+5rVU6LLEk+wD09QoSAq8ll+IVmNNcHIB1GIqgTgMagCQxOmsG80NmInuGss8Ina2FbrwLLvuLOe92lK3e7zQdKqHeKheOvuhbzRVAetfusptvrdj+xwB/oNTNaHxQb7lqpoL+R/VIX67wUBsgjLr7hmMpGekacziCmGPJogkmOAkYCxn0o80m6heZTl5AAOSI9hbLOISDBYoQR/h3wO8jpir3kkLlJNL4rb5VhO3/veNsD8OzPvxRGyhb2WCsGGEM7+rfOwxpGNQvUWrl6RBy+TJ2rIevQwzQNyaA7jhmdepnVN6uJtXsz8bnC5HFUvti0C604wLLuiERLckTUShMs03jeM/U+qicIR7xxe3bFEsTW3nAj3vb1X4dcoZGGzYrshp+Gk=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(396003)(376002)(346002)(366004)(136003)(451199018)(2616005)(558084003)(38070700005)(122000001)(86362001)(38100700002)(4326008)(41300700001)(36756003)(8676002)(66446008)(91956017)(64756008)(66556008)(66946007)(76116006)(2906002)(8936002)(6916009)(66476007)(5660300002)(478600001)(71200400001)(186003)(33656002)(53546011)(6512007)(316002)(6506007)(6486002)(26005)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <1347747CE17D714596992CB1FE634EA1@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8068
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DBAEUR03FT043.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	6bbf2fd3-7cb7-41d0-81e1-08db2951c941
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	kAEG+K6kAjKFDPlRKp+TY9pUm6uxOozgCIUkNdnZaKbs+tFGJt5HnuOF1IyMmVjcwxRw75Zve0epxNtqq2eTOynrqoM3ADOef+ELFK2l2utlrc2i6VfoaruuRgiQM6ZSsZHP6MxHXrvLRIWaYr5/Dg/i1ols/MwKYVlRxlkQTGfHUfShYmCCsyIwKI+A5ic+H+yL9xzcYPNui+Q2YjCPbRZ45fOizPyPSo7F14hIHfnT9CYfpi7SJwLxEEjprJSsuNKpQYYRR1NDVU3/2JOiRoEVzV3y03kyBdNaSGaWLMDGCIxOCeUnVHc5aQxn4mAgLENZ4YqK3mDC+G1I3eqdZ/qf70vqZqOrxcZzS8YfpfBZ1qwIAov6DfcZyZydO3Dd21rnpUZfpvB4M1TsV10C79jGHj88AuIlTWtewnNe5fCCpHyBBLRG749ISsb68yoYySS8a1IYmM7FBSSeVI3qzlucSgfH7Y13J60iWE/RKWf4PmAfT4QDULVR7fw4VgzhMxNFDc565VqLHICLTSv1l2J9gyON00c3FElW+ZkHqSE5moYz/ua0ML9oPn86uEQJf2qkC5Fcn6gPRhHrUVBCtzhaUMwiFtlSJEnSrtbzks3rZ/j+eScPKosMz9BQL6vemt7mDJNumb2n6JP2lHwGPooDSUPQOoXCLZpeGf/njfmBeBF9p+uSUNVsihK4gy9JgfV+zgqWvU7Cp7C0NYPx6A==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(136003)(396003)(346002)(376002)(451199018)(46966006)(36840700001)(40470700004)(2616005)(47076005)(558084003)(82310400005)(6512007)(478600001)(6486002)(6506007)(26005)(53546011)(316002)(5660300002)(186003)(33656002)(36860700001)(356005)(40460700003)(336012)(86362001)(81166007)(82740400003)(2906002)(8936002)(70586007)(70206006)(6862004)(4326008)(36756003)(8676002)(40480700001)(41300700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2023 14:45:58.7217
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 15069265-3524-4a4e-b77d-08db2951d183
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DBAEUR03FT043.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6033
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Mar 2023 14:46:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101607

T24gMTcgTWFyIDIwMjMsIGF0IDA3OjI1LCBab2x0YW4gQm9zem9ybWVueWkgdmlhIGxpc3RzLm9w
ZW5lbWJlZGRlZC5vcmcgPHpib3N6b3I9Z21haWwuY29tQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+
IHdyb3RlOg0KPiArUFlQSV9QQUNLQUdFID0gInB5cHJvamVjdC1tZXRhZGF0YeKAnQ0KDQpUaGlz
IGNhbiBiZSByZW1vdmVkIGFzIHRoYXTigJlzIHRoZSBkZWZhdWx0IHZhbHVlLg0KDQpSb3Nz

