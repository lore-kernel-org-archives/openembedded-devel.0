Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.40])
 by mx.groups.io with SMTP id smtpd.web08.839.1616427424119753046
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Mar 2021 08:37:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@topicbv.onmicrosoft.com header.s=selector2-topicbv-onmicrosoft-com header.b=zP48znwW;
 spf=pass (domain: topicproducts.com, ip: 40.107.21.40, mailfrom: mike.looijmans@topicproducts.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=topicbv.onmicrosoft.com; s=selector2-topicbv-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1sgOrUD09XAcDFCChZpWTk1aDRV1uC+2dhIP571WdXc=;
 b=zP48znwWSOdrOzBmWpQe8ZkCb+438BceSJlp04RVqDhzG+skSQTSS5a/jnXZpBWZ/CT5E8MG95sMuP3RDbb6thPJUaQpTO7V6ICxPerN1domDNy4zO4xaeHpeeeJast7WM+FCWnr2ZOp6BD72yL67FIjMh/nIdrSbX5PxHes5fY=
Received: from DB8PR06CA0048.eurprd06.prod.outlook.com (2603:10a6:10:120::22)
 by AM0PR04MB6866.eurprd04.prod.outlook.com (2603:10a6:208:183::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.24; Mon, 22 Mar
 2021 15:37:01 +0000
Received: from DB5EUR01FT041.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:10:120:cafe::1d) by DB8PR06CA0048.outlook.office365.com
 (2603:10a6:10:120::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18 via Frontend
 Transport; Mon, 22 Mar 2021 15:37:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.68.112.65)
 smtp.mailfrom=topicproducts.com; lists.openembedded.org; dkim=none (message
 not signed) header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=topic.nl;
Received-SPF: Pass (protection.outlook.com: domain of topicproducts.com
 designates 40.68.112.65 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.68.112.65; helo=westeu12-emailsignatures-cloud.codetwo.com;
Received: from westeu12-emailsignatures-cloud.codetwo.com (40.68.112.65) by
 DB5EUR01FT041.mail.protection.outlook.com (10.152.5.191) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3955.18 via Frontend Transport; Mon, 22 Mar 2021 15:37:01 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com (104.47.9.50) by westeu12-emailsignatures-cloud.codetwo.com with CodeTwo SMTP Server (TLS12) via SMTP; Mon, 22 Mar 2021 15:37:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DkB0LZOEnV2ASUFQ/a7cidBwnDDpSzGmc5MPFbxKcxNqIFsV5RxXvj5rdzjM1CjVU79C9FYB3/NusswEgF8yLEyTc0I+LMCj3GMZIjxzjigBPEm5WqocxoY32rs3kbqxKUc3q/ReILZUmsi5Ffv3c9E5qosfr5HYmVxJ2UsOlglk+q6dgqeVmproST3qDwFFrKa2UkJ2BAmEbNGT+G8qv2R/Mo1ZEu+cgSigp4CKNk80UYeOBhKsjq9nG7k24BIfCYq1H3OfLGwsSoO/HBk05upaa2Y0q7d49f+oPwTDFf7y/CmW6/F2AsfLWYNiJ0WfEZdK4N2wKkICeUpGP2TkwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GPD50BGKikvXjAHd67hX28fXRbZS9UzOKbGeaQx83Yw=;
 b=dPHppjQteVgIBPYmuVZnawa6AWP698vl2yVFNOkqWjWNkL4y92jRJkNAQlNN1pUdz6ggeffZkRjdIbdiw/Zq0MnexfpHwxEM5U1wu2xhYXUcCze84MQRn8muiHuHPEv5AsmeGjS8WCEYG8imwmuxF0qCvtM5K9h15TS+5WoQl50eRq49NGD/OWUk6FTHxe9K709Lf1CH1NkKB+cZodecjLSJDYi2qXq33dLeBkkqByXBnQw3IYzbg06AkYUzGT5cPy9nbuGOa0fV8JqIi8LvZNB7VT/0UghVCAanFFYuNNORaTHo0kx3GjRvf6yIRk1oaNtUAefuxU6PIfuPBELJ4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=topicproducts.com; dmarc=pass action=none header.from=topic.nl;
 dkim=pass header.d=topic.nl; arc=none
Authentication-Results-Original: lists.openembedded.org; dkim=none (message
 not signed) header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=topic.nl;
Received: from DB8PR04MB6523.eurprd04.prod.outlook.com (2603:10a6:10:10f::26)
 by DB8PR04MB6523.eurprd04.prod.outlook.com (2603:10a6:10:10f::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Mon, 22 Mar
 2021 15:36:57 +0000
Received: from DB8PR04MB6523.eurprd04.prod.outlook.com
 ([fe80::38d2:189b:f7da:b988]) by DB8PR04MB6523.eurprd04.prod.outlook.com
 ([fe80::38d2:189b:f7da:b988%7]) with mapi id 15.20.3955.025; Mon, 22 Mar 2021
 15:36:57 +0000
Subject: Re: [oe] [meta-java] openjre8 fails to compile on aarch64
To: Richard Leitner <richard.leitner@skidata.com>
CC: openembedded-devel@lists.openembedded.org
References: <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.949ef384-8293-46b8-903f-40a477c056ae.75f5ae13-2f0a-42dd-b164-bf1c3f2c0c91@emailsignatures365.codetwo.com>
 <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.0d2bd5fa-15cc-4b27-b94e-83614f9e5b38.74969f47-fd5f-43b1-b5f3-843bc6e03141@emailsignatures365.codetwo.com>
 <d441a15b-11a2-294e-9430-c93a48283fc1@topic.nl> <YFiFTHaVZUBoq7uW@brokenbit>
 <a0a46ea3-769d-bc32-479b-160b10b882ab@topic.nl> <YFiPV45+9llagCwv@brokenbit>
 <166EB1C4D79F83DA.5508@lists.openembedded.org>
 <166EB26D9B0785E4.5508@lists.openembedded.org>
From: "Mike Looijmans" <mike.looijmans@topic.nl>
Organization: Topic
Message-ID: <1cd40fde-1547-4594-4495-2dcad1692125@topic.nl>
Date: Mon, 22 Mar 2021 16:36:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <166EB26D9B0785E4.5508@lists.openembedded.org>
X-Originating-IP: [83.128.90.119]
X-ClientProxiedBy: AM0PR02CA0199.eurprd02.prod.outlook.com
 (2603:10a6:20b:28f::6) To DB8PR04MB6523.eurprd04.prod.outlook.com
 (2603:10a6:10:10f::26)
Return-Path: mike.looijmans@topicproducts.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.130] (83.128.90.119) by AM0PR02CA0199.eurprd02.prod.outlook.com (2603:10a6:20b:28f::6) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18 via Frontend Transport; Mon, 22 Mar 2021 15:36:57 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f35ef001-09f0-4845-9a10-08d8ed48562e
X-MS-TrafficTypeDiagnostic: DB8PR04MB6523:|AM0PR04MB6866:
X-Microsoft-Antispam-PRVS: 
	<AM0PR04MB6866E82A831E477C0BCD5F4A96659@AM0PR04MB6866.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 q1/Wc/KwGR6Rg2vwWi1/y2abCzPxJx6V+ox/JGfhvokrX0wGWUuT7WmEzcb/JBdMApKKZ5lAnjKpPpXxOmq6ySq553ay4XsNU3CWa0u6AXG2d+k9jdZPxQPj+vQhgP52E3ImAwvShds9SQi+p0VKcNkjlWwh4Zjuj1q9Isba7l3/esrv0fsNCnn5dO3k6tAan2paLc6hTmvwGI+xhOsF8mZSVBUslXCkKmZOXyfsPrNkd95qKmKhr/IHXf7AjbI8RiYIi1N9Xzk5Wa45HscGGEEQPkzB/rPdmZcPZJU2rHrmldGLJy5pO1n/wM/rNNc/fhl7VEVKpmSJ5uH0P+1/f2F4nQf/liBzAWJOk9ZR/qI9cdlQFtogDs71/4xE5NZNHiVTUpL3pNoKhblZFmVpunsQNZCdcDnHTfA879OED3tw+nD1YRi2Vd32FPyWZhnyp/zG2PNSs2Nk0wTrMAZ5OjE7AxMukhbb8mr5+gS6gUA8aZf3UlFGEh/BJgEubcq/gm+xWGySJTfIs9hKcKqVtgNTPKsgC9MfWsAxeVOLheaQykqXUN89b9apBClr7aYHji7f8Dif1ZuUW3XqJ5BBTHvDIG1v+n6D+TH6OLX6eS3FHOtyCxvghFZtkrmoeJOakA2KKXBkmdWor1whPdbfRJhWlqb9TCQfwskXfiMc3Yu/oPiZQM43qofIdl0yaIj8qt18io+DZtqPPKBFptZwCa3T8XVcxoDoGSelYvcJ48NJ3UJlM0NshoyvUG/KWZkDEaMZFYsc3LRAj6AyyCs+Nc6Kw+c9kw0MjN7bkv3k6rM=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB6523.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(346002)(396003)(376002)(39830400003)(42882007)(956004)(2906002)(8936002)(83170400001)(5660300002)(44832011)(36756003)(26005)(2616005)(8676002)(16526019)(235185007)(66946007)(38100700001)(4326008)(186003)(53546011)(83380400001)(66556008)(31696002)(66616009)(52116002)(16576012)(36916002)(33964004)(66476007)(31686004)(15974865002)(966005)(6486002)(508600001)(6916009)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?MU5ILzdZQjk3U3drbkdoZ3FyTmMwMUJ0aWZoMWlaWkp2Q2hWUjRJWGt0bTdw?=
 =?utf-8?B?VDQxTkpJRzFiK29jTDBqK0p2TWdRZmV5REJNSTF6RnNQd1ZSRFBZdENhSk5H?=
 =?utf-8?B?OExwZ2g3REs3MVV6cit5cGl3bWZycEw2cWJ2bStTaSsrR1d3OCtaRFRSdWZI?=
 =?utf-8?B?Vzl2SEJZT0M5Q1RtM2ZWMnNEeGdibVo0VnVobDNBemZna3FPL2MreEN5WUtS?=
 =?utf-8?B?WHlLT0FRTTZJSW5rTEovV0NlbVNEc2IyQ3F1aTN4cW05RGYwM3dDSDBQR2hh?=
 =?utf-8?B?dHFzTGR6c0JNUS9ObmRhWUIwcE5uc29WaUdic2p1aWUrdU1FN202a29ZaEsx?=
 =?utf-8?B?THVGbjM4T0thTnBid1VBd2w1Nk5MMnNmMzJtblVyb0dnWGQ3WGJaQU9sazFl?=
 =?utf-8?B?V28wNlBKSzMxNGRuYmIvcFZIaHEzU2Y2akNoeU5YTWU4dVUxRG8yYytPckRN?=
 =?utf-8?B?SS9UcFZyOE5XQVh4MU51aVJLdFl6c1VTYTF6SC8zSnl2SHRJSEsxWEZkVGQ0?=
 =?utf-8?B?dlRiMUg2ZkFraU00NTZYWmx4d0M1cEljUTV2OEtBaVJmK0g0OGkxS2FEUXVW?=
 =?utf-8?B?ZXNmaC9Iako3UFRLdlJmc3FTdXpid2EvSXZ0N3JkV0hZUDRwV1BzTW1iM2Z1?=
 =?utf-8?B?c3dTY1BsaGIrb2gxemRZNEFjYWJnbFBNSUxSVTVHY091aTBsWHBLNUdlY1dp?=
 =?utf-8?B?alUvVkRMVytQbkUxS0F3UHd4WHlCNDRRblN3RDVKdTkzY3BpclZCbW1nMDBV?=
 =?utf-8?B?VUhxQTJ3UEYvdDRpZllzRXFxK0s3SkFjRGJUWXpycUpjdUx0MEhHRk1wYUlF?=
 =?utf-8?B?THVFSU1aRmNOc3FhVGpvd1VPd2dObzB6MWtHcjVWQktDZlhGelJXUVVQVi9T?=
 =?utf-8?B?OUJDcU1ZVTdjRUZRK0hCUDUzRGxpVVUzNkUzaXNZWlRrQ0NHM1pYM3duQk5k?=
 =?utf-8?B?REw0ZDZrbUF1Z01xKzg5a29kbU4yNFp0TkMrOGNiMnJEc2Q0bkcxSXF2aGFI?=
 =?utf-8?B?c3RtU2pMMkpqYnduWjVTeFJSYmtaUksxdzFVZWd2K2l1WXNxRWtaeEFzVnJw?=
 =?utf-8?B?ZVB5VlZjTjFHc0NDQ3lEVWJIMzV5T20za2wxdlVSNTFGdlR6cENIanpCRitC?=
 =?utf-8?B?SFVYbTF2UUNlNXBpZGR5M0VzbXNCWnpVVFFNMUFicEVJaExTdFFrb2JhQzFH?=
 =?utf-8?B?cjcyTVRGWkd2djlKUDY0VTBnSEFwTERwV21WRS8veUllUWFPR0ZnMFZyRmNi?=
 =?utf-8?B?TlZwams2QXB2YjJzcVY4OUh0NUJSWVdncmZtem5xTHd1OWtBaDAxWWl0YXlm?=
 =?utf-8?B?NXRrNk93Q3BNNVJlNzBMUWtHWGNyVUNFNEdUbFVkdUcxWHNNN1RqMm85QUJq?=
 =?utf-8?B?WWhzNjhKb08rdmJ0YWQvdFFKYVNNWDR1amFTOHdMVURwK2JLNVhCc1VtT1cx?=
 =?utf-8?B?Wi9vVkgxTngvQ2JUWmM4dmFNRUluaUNNNlZKQ0FaUEJQSFNaRGNOMHJ5cWlO?=
 =?utf-8?B?YXR1OFhFdm1xMXVIRWY5VEc5VW43NjdzRytBM1BkSFBpRzZDc05uc0NQZlZU?=
 =?utf-8?B?anAxYWhTd3dCTkRUT1piK0FXdkFFTzU4ZG1kRTRVUHJ4VjNNSmN4ckV3N3N1?=
 =?utf-8?B?YlB6ekYxUERTajY0VE1laEtIVU5KcWdGWFlBZ3k2T0pMNVpLSFFMWTJxUUMz?=
 =?utf-8?B?a0JzbjUySVBvVEFDRnQxVDcwMnV5S3prSkhhd1MveGVMSTRKNm1FbTQvM3gr?=
 =?utf-8?Q?ejEEwwx5EWSd0uENevWe20uEh0LIY3xuPyoNIFk?=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6523
X-CodeTwo-MessageID: f85b5869-f083-4676-a942-1da2f1a26b51.20210322153700@westeu12-emailsignatures-cloud.codetwo.com
X-CodeTwoProcessed: true
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR01FT041.eop-EUR01.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	60dc8f38-8b2f-43ae-5424-08d8ed4853ea
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	5NXfPRkWQ+Hy/tC2nWUqvHbYFaEzWlUcKO2Npnyf+uWIN0dKkbWatpPi5gJNpsRZdhZjOGjuro0cjz2iOxhTGR7gATvcYi16PAiY80U3XAFL6sNRoRHnW3wwZqw6QmWwgNWXS00XbFC1wZcbkGSYCFDEsOYVg2SWPsCQ615EGcZNiyH+GgZkt43aquqxi/LZtAETACVqXsDjkJ8y+sIVugny8r/qF0YuDT44FaVOhnqpu1G63lQOGuB2mK/gjqX1ep/nhogtb/NI4Sr5T9HPVf0Po8guQBw++/LjZJ/N6Og7M6IJ7HcgBL8DXme6wE0gM5tu8hsQjKtRxEjbIAGnY16q7lJENKN9ZGx1/ZtXilc4e6XtMbWuaDaZ6rF7fQWwH+8GODW9OuyorCjRQIV9VE/v8fJh1oj7m1uAr+mHwbdZsEIiopRr5Dr4rxFyNwdXpf/A4+wmyNjQab31107ClXKRmBi3xaGwYen/kvowg4OgmTVBpVqy+po3FlkgOSyi/jTaKzA5Iu0cwvzJERfWQBWbVpm/cGJl1oqC33ZiXPdgPz3yWxk6geFZzZ1dGTqXJtEvr0jjM4KfziOC7ta/AQehxrYrG6v/SDIQVU4VwXNEMKoTsu6K8JvjMalRWAhO6Anb5JgEbq60emw4OKGOpNjrAHlNlVtr0XMPDp4S9S+uDaXjDZykiat5SWtJgUHSoUELw8T6se1T5IcdjcjkQfzbkG2UCp05OiEiTIwTn73tJTFtiWo+ae01WetS1GHe01Ll0lL6zdBQCLlLACxuyQ==
X-Forefront-Antispam-Report: 
	CIP:40.68.112.65;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:westeu12-emailsignatures-cloud.codetwo.com;PTR:westeu12-emailsignatures-cloud.codetwo.com;CAT:NONE;SFS:(346002)(376002)(39830400003)(396003)(36840700001)(46966006)(16526019)(66616009)(4326008)(42882007)(53546011)(6486002)(15974865002)(44832011)(70586007)(508600001)(26005)(83380400001)(186003)(336012)(31696002)(2906002)(82310400003)(956004)(2616005)(5660300002)(36860700001)(83170400001)(70206006)(235185007)(356005)(7596003)(47076005)(36756003)(966005)(8676002)(31686004)(16576012)(8936002)(7636003)(36916002)(6916009)(33964004)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: topic.nl
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2021 15:37:01.1698
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f35ef001-09f0-4845-9a10-08d8ed48562e
X-MS-Exchange-CrossTenant-Id: 449607a5-3517-482d-8d16-41dd868cbda3
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=449607a5-3517-482d-8d16-41dd868cbda3;Ip=[40.68.112.65];Helo=[westeu12-emailsignatures-cloud.codetwo.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR01FT041.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6866
X-Groupsio-MsgNum: 90266
Content-Type: multipart/mixed;
	boundary="------------38056E669FA9FF82D85DDA97"
Content-Language: en-US

--------------38056E669FA9FF82D85DDA97
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

If I just bluntly set the CFLAGS and CXXFLAGS like in the attached=20
patch, then the compile succeeds.




Met vriendelijke groet / kind regards,

Mike Looijmans
System Expert


TOPIC Embedded Products B.V.
Materiaalweg 4, 5681 RJ Best
The Netherlands

T: +31 (0) 499 33 69 69
E: mike.looijmans@topicproducts.com
W: www.topic.nl

Please consider the environment before printing this e-mail
On 22-03-2021 16:04, Mike Looijmans via lists.openembedded.org wrote:
> In Line 72 of that makefile:
>
> # set flags for adlc compilation
> CXXFLAGS =3D $(SYSDEFS) $(INCLUDES)
>
>
> So that kills the patch I guess
>
>
>
> Met vriendelijke groet / kind regards,
>
> Mike Looijmans
> System Expert
>
>
> TOPIC Embedded Products B.V.
> Materiaalweg 4, 5681 RJ Best
> The Netherlands
>
> T: +31 (0) 499 33 69 69
> E: mike.looijmans@topicproducts.com
> W: www.topic.nl
>
> Please consider the environment before printing this e-mail
> On 22-03-2021 15:52, Mike Looijmans via lists.openembedded.org wrote:
>> Yes, the patch does get applied, I can see the extra lines in the=20
>> work directory.
>>
>> But it somehow doesn't quite work...
>>
>>
>>
>>
>> Met vriendelijke groet / kind regards,
>>
>> Mike Looijmans
>> System Expert
>>
>>
>> TOPIC Embedded Products B.V.
>> Materiaalweg 4, 5681 RJ Best
>> The Netherlands
>>
>> T: +31 (0) 499 33 69 69
>> E: mike.looijmans@topicproducts.com
>> W: www.topic.nl
>>
>> Please consider the environment before printing this e-mail
>> On 22-03-2021 13:36, Richard Leitner wrote:
>>> If I get it right these flags should be filtered out by the adlc flags
>>> patch [1].
>>>
>>> Can you verify that it's getting applied?
>>>
>>> Unfortunately I don't have a gcc-7 host machine available right now =
=F0=9F=98=95
>>>
>>> regards;rl
>>>
>>> [1]https://git.yoctoproject.org/cgit/cgit.cgi/meta-java/tree/recipes-c=
ore/openjdk/patches-openjdk-8/1009-hotspot-fix-adlc-flags.patch=20
>>>
>>>
>>> On Mon, Mar 22, 2021 at 01:15:14PM +0100, Mike Looijmans wrote:
>>>> Both "gatesgarth".
>>>>
>>>> Issue seems to be that the build host (Ubuntu 18) has gcc 7 and the=
=20
>>>> one used
>>>> for cross-compiling is much newer. Apparently there's something=20
>>>> wrong in the
>>>> makefile that it uses host compiler flags for the build compiler.
>>>>
>>>>
>>>>
>>>>
>>>> Met vriendelijke groet / kind regards,
>>>>
>>>> Mike Looijmans
>>>> System Expert
>>>>
>>>>
>>>> TOPIC Embedded Products B.V.
>>>> Materiaalweg 4, 5681 RJ Best
>>>> The Netherlands
>>>>
>>>> T: +31 (0) 499 33 69 69
>>>> E: mike.looijmans@topicproducts.com
>>>> W: www.topic.nl
>>>>
>>>> Please consider the environment before printing this e-mail
>>>> On 22-03-2021 12:53, Richard Leitner wrote:
>>>>> Hi Mike,
>>>>>
>>>>> which meta-java and oe-core branch are you using?
>>>>>
>>>>> regards;rl
>>>>>
>>>>> On Mon, Mar 22, 2021 at 10:43:53AM +0100, Mike Looijmans wrote:
>>>>>> I cannot get openjre8 to compile. Any ideas what the real issue is?
>>>>>>
>>>>>> Compile for 32-bit ARM is okay, but building for aarch64 fails:
>>>>>>
>>>>>> ...
>>>>>> | g++: error: unrecognized command line option=20
>>>>>> =E2=80=98-fmacro-prefix-map=3D/.../build/tmp-glibc/work/cortexa72-o=
e-linux/openjre-8/272-r0=3D/usr/src/debug/openjre-8/272-r0=E2=80=99
>>>>>> | g++: error: unrecognized command line option=20
>>>>>> =E2=80=98-fmacro-prefix-map=3D/.../build/tmp-glibc/work/cortexa72-o=
e-linux/openjre-8/272-r0=3D/usr/src/debug/openjre-8/272-r0=E2=80=99
>>>>>> |=20
>>>>>> /.../build/tmp-glibc/work/cortexa72-oe-linux/openjre-8/272-r0/jdk8u=
-shenandoah-aarch64-shenandoah-jdk8u272-b10/hotspot/make/linux/makefiles/ad=
lc.make:228:
>>>>>> recipe for target '../generated/adfiles/output_c.o' failed
>>>>>> | make[6]: *** [../generated/adfiles/output_c.o] Error 1
>>>>>> |=20
>>>>>> /.../build/tmp-glibc/work/cortexa72-oe-linux/openjre-8/272-r0/jdk8u=
-shenandoah-aarch64-shenandoah-jdk8u272-b10/hotspot/make/linux/makefiles/ad=
lc.make:228:
>>>>>> recipe for target '../generated/adfiles/main.o' failed
>>>>>> | make[6]: *** [../generated/adfiles/main.o] Error 1
>>>>>> | g++: error: unrecognized command line option=20
>>>>>> =E2=80=98-fmacro-prefix-map=3D/.../build/tmp-glibc/work/cortexa72-o=
e-linux/openjre-8/272-r0=3D/usr/src/debug/openjre-8/272-r0=E2=80=99
>>>>>> |=20
>>>>>> /.../build/tmp-glibc/work/cortexa72-oe-linux/openjre-8/272-r0/jdk8u=
-shenandoah-aarch64-shenandoah-jdk8u272-b10/hotspot/make/linux/makefiles/ad=
lc.make:228:
>>>>>> recipe for target '../generated/adfiles/output_h.o' failed
>>>>>> | make[6]: *** [../generated/adfiles/output_h.o] Error 1
>>>>>> | make[5]: *** [ad_stuff] Error 2
>>>>>> |=20
>>>>>> /.../build/tmp-glibc/work/cortexa72-oe-linux/openjre-8/272-r0/jdk8u=
-shenandoah-aarch64-shenandoah-jdk8u272-b10/hotspot/make/linux/makefiles/to=
p.make:91:
>>>>>> recipe for target 'ad_stuff' failed
>>>>>> |=20
>>>>>> /.../build/tmp-glibc/work/cortexa72-oe-linux/openjre-8/272-r0/jdk8u=
-shenandoah-aarch64-shenandoah-jdk8u272-b10/hotspot/make/linux/Makefile:284=
:
>>>>>> recipe for target 'product' failed
>>>>>> | make[4]: *** [product] Error 2
>>>>>> | Makefile:230: recipe for target 'generic_build2' failed
>>>>>> | make[3]: *** [generic_build2] Error 2
>>>>>> | make[2]: *** [product] Error 2
>>>>>> | Makefile:177: recipe for target 'product' failed
>>>>>> | HotspotWrapper.gmk:44: recipe for target=20
>>>>>> '/.../build/tmp-glibc/work/cortexa72-oe-linux/openjre-8/272-r0/buil=
d/hotspot/_hotspot.timestamp'
>>>>>> failed
>>>>>> | make[1]: ***=20
>>>>>> [/.../build/tmp-glibc/work/cortexa72-oe-linux/openjre-8/272-r0/buil=
d/hotspot/_hotspot.timestamp]
>>>>>> Error 2
>>>>>> |=20
>>>>>> /.../build/tmp-glibc/work/cortexa72-oe-linux/openjre-8/272-r0/jdk8u=
-shenandoah-aarch64-shenandoah-jdk8u272-b10//make/Main.gmk:109:
>>>>>> recipe for target 'hotspot-only' failed
>>>>>> | make: *** [hotspot-only] Error 2
>>>>>> | WARNING:=20
>>>>>> /.../build/tmp-glibc/work/cortexa72-oe-linux/openjre-8/272-r0/temp/=
run.do_compile.9267:189
>>>>>> exit 1 from 'exit 1'
>>>>>> | WARNING: Backtrace (BB generated script):
>>>>>> | =C2=A0=C2=A0=C2=A0 #1: bbfatal_log,=20
>>>>>> /.../build/tmp-glibc/work/cortexa72-oe-linux/openjre-8/272-r0/temp/=
run.do_compile.9267,
>>>>>> line 189
>>>>>> | =C2=A0=C2=A0=C2=A0 #2: die,=20
>>>>>> /.../build/tmp-glibc/work/cortexa72-oe-linux/openjre-8/272-r0/temp/=
run.do_compile.9267,
>>>>>> line 179
>>>>>> | =C2=A0=C2=A0=C2=A0 #3: oe_runmake,=20
>>>>>> /.../build/tmp-glibc/work/cortexa72-oe-linux/openjre-8/272-r0/temp/=
run.do_compile.9267,
>>>>>> line 168
>>>>>> | =C2=A0=C2=A0=C2=A0 #4: autotools_do_compile,=20
>>>>>> /.../build/tmp-glibc/work/cortexa72-oe-linux/openjre-8/272-r0/temp/=
run.do_compile.9267,
>>>>>> line 163
>>>>>> | =C2=A0=C2=A0=C2=A0 #5: do_compile,=20
>>>>>> /.../build/tmp-glibc/work/cortexa72-oe-linux/openjre-8/272-r0/temp/=
run.do_compile.9267,
>>>>>> line 158
>>>>>> | =C2=A0=C2=A0=C2=A0 #6: main,=20
>>>>>> /.../build/tmp-glibc/work/cortexa72-oe-linux/openjre-8/272-r0/temp/=
run.do_compile.9267,
>>>>>> line 202
>>>>>> |
>>>>>> | Backtrace (metadata-relative locations):
>>>>>> | =C2=A0=C2=A0=C2=A0 #1: bbfatal_log, /.../oe-core/meta/classes/log=
ging.bbclass,=20
>>>>>> line 72
>>>>>> | =C2=A0=C2=A0=C2=A0 #2: die, /.../oe-core/meta/classes/base.bbclas=
s, line 56
>>>>>> | =C2=A0=C2=A0=C2=A0 #3: oe_runmake, /.../oe-core/meta/classes/base=
.bbclass,=20
>>>>>> line 65
>>>>>> | =C2=A0=C2=A0=C2=A0 #4: autotools_do_compile,=20
>>>>>> /.../oe-core/meta/classes/autotools.bbclass,
>>>>>> line 243
>>>>>> | =C2=A0=C2=A0=C2=A0 #5: do_compile, autogenerated, line 2
>>>>>> ERROR: Task
>>>>>> (/.../meta-java/recipes-core/openjdk/openjre-8_272.bb:do_compile)=
=20
>>>>>> failed
>>>>>> with exit code '1'
>>>>>>
>>>>>> --=20
>>>>>> Mike Looijmans
>>>>>>
>>>>>>
>>>>>> Met vriendelijke groet / kind regards,
>>>>>>
>>>>>> Mike Looijmans
>>>>>> System Expert
>>>>>>
>>>>>>
>>>>>> TOPIC Embedded Products B.V.
>>>>>> Materiaalweg 4, 5681 RJ Best
>>>>>> The Netherlands
>>>>>>
>>>>>> T: +31 (0) 499 33 69 69
>>>>>> E: mike.looijmans@topicproducts.com
>>>>>> W: www.topic.nl
>>>>>>
>>>>>> Please consider the environment before printing this e-mail
>>>>
>>>> --=20
>>>> Mike Looijmans
>>>>
>>
>>
>>
>>
>
>
>=20
>

--=20
Mike Looijmans


--------------38056E669FA9FF82D85DDA97
Content-Type: text/x-patch; charset="UTF-8"; name="adlc.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="adlc.patch"

diff --git a/hotspot/make/linux/makefiles/adlc.make b/hotspot/make/linux/makefiles/adlc.make
index ae0aa008..622e1be6 100644
--- a/hotspot/make/linux/makefiles/adlc.make
+++ b/hotspot/make/linux/makefiles/adlc.make
@@ -30,11 +30,8 @@ include $(GAMMADIR)/make/$(Platform_os_family)/makefiles/rules.make
 
 # Yocto specific fix - remove target machine flags and replace them with
 # build machine flags, as this part is built using the native toolchain
-CXXFLAGS:=$(filter-out $(TARGET_CXXFLAGS),$(CXXFLAGS))
-CFLAGS:=$(filter-out $(TARGET_CFLAGS),$(CFLAGS))
-
-CXXFLAGS += $(BUILD_CXXFLAGS)
-CFLAGS += $(BUILD_CFLAGS)
+CXXFLAGS = $(BUILD_CXXFLAGS)
+CFLAGS = $(BUILD_CFLAGS)
 
 
 
@@ -69,7 +66,7 @@ Src_Dirs_I += $(GAMMADIR)/src/share/vm/adlc $(GENERATED)
 INCLUDES += $(Src_Dirs_I:%=-I%)
 
 # set flags for adlc compilation
-CXXFLAGS = $(SYSDEFS) $(INCLUDES)
+CXXFLAGS += $(SYSDEFS) $(INCLUDES)
 
 # Force assertions on.
 CXXFLAGS += -DASSERT

--------------38056E669FA9FF82D85DDA97--
