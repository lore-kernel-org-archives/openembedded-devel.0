Return-Path: <mingli.yu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25F3CC433EF
	for <webhook@archiver.kernel.org>; Mon, 24 Jan 2022 06:22:59 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web08.363.1643005377496831782
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 23 Jan 2022 22:22:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=MW5HFaAn;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=8023887b99=mingli.yu@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 20O6Lg23031501
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 24 Jan 2022 06:22:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=subject : from :
 to : references : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=QKKYitbZgKbVesuZrRdiQ7xp7UcJeTp6KVtoBM4fijw=;
 b=MW5HFaAn9V4Y2nnhAMxqremuj1rDPZQH2ERXXJ7/IWywlip+a01HmJ64ogs7iVxVAPF2
 oZwC3xJ/IlzLRkVNksGTRV7gInXVa/LuFxoVdwQSxyHW0/KKzd+EHNwc59KW9MSgVUE0
 XzjsYvV5Z6q3ZgJSlaS2E+AzcWC1dL01OE7BQRbkANY3kV4hG8xsP24NFuLaAgFr6VVL
 +2iWfuurh6SrOIrVJ1r7m5Xq7i5eHSOUinUdGgHBkKXVC+xNuhx44/4UbHTLR+9FIIbg
 DslFN++WoDBaw8kwda7/k6CNwRp5GEbMVYizVGom58tnlkZYaF3SaQqO4Dq06GHKqzX1 wQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3dsj6kr3kf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 24 Jan 2022 06:22:55 +0000
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 20O6Mtmo001114
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 24 Jan 2022 06:22:55 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com
 (mail-sn1anam02lp2040.outbound.protection.outlook.com [104.47.57.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3dsj6kr3ke-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Jan 2022 06:22:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zitaz/28T947/li91GaKMgsFdDIaifTVkPXMbZ3b8tIm9l2VLSE4LDVIDTn9enG4iF8RqZE9QMkagk70Wll0dZmwn0KBmOBRn9U09SngzWIreCTBLanjq4LvsbKM4EssyKmJ4AIBeU2lC1FxDre/ij4wwuREQtShRyFxfSPuQ8P0ltxrmcgRjPWbPgmJrsP7psNXVYl7ttxez3yz+VxyNxGvu/pcGnfb1OuWf4+2agdpmOJdGw78FKHtYYrAT7itGzR8auinMommi/1VfX1QdbIq+oVbXj/au3tDqazuKgI6k9D+m54V307yZfQNRZCW9ngiKS+IoRS4iQaSBugsjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QKKYitbZgKbVesuZrRdiQ7xp7UcJeTp6KVtoBM4fijw=;
 b=jmyaO2unj4IIR7mBC+nmw5uXhkgVEKDCFhnTxI8lDNQuCyhSUziJ+WhlXs4eeUO1HlChylPzI5XEEdMjFJTB1qts44lrQPjRBdDybXMI4hiJd7JAFLEtryP62GnJ7tWoO40rodrXCozhWjyWxBXSJAAW9Nqf2HHZHty7noaQJP9ogXvHmNO7O0oHFwe8/Its9GXAZKLQHJ9oGq5g8eF31ozub5jCO7tZa3ACqVyz756oAI15TQuuGXWSrQxek+xTWVqMtlBxAuEvysxDfBMo475832vO/phQHVt/96tWP3vg8kN8tYL7P9WTPP8ah3vCBeGKFxUXjxUGTbctdqxmXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from CO1PR11MB5009.namprd11.prod.outlook.com (2603:10b6:303:9e::11)
 by MWHPR11MB1791.namprd11.prod.outlook.com (2603:10b6:300:10f::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.12; Mon, 24 Jan
 2022 06:22:53 +0000
Received: from CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::e83e:e5e8:36e7:4d7f]) by CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::e83e:e5e8:36e7:4d7f%5]) with mapi id 15.20.4909.017; Mon, 24 Jan 2022
 06:22:53 +0000
Subject: Re: [oe] [meta-oe][hardknott][PATCH] mariadb: Upgrade to 10.5.13
From: "Yu, Mingli" <mingli.yu@windriver.com>
To: openembedded-devel@lists.openembedded.org, akuster808@gmail.com
References: <16C2FD9A4E76CEEA.15364@lists.openembedded.org>
Message-ID: <d8028f58-cedc-66c0-5f6a-29b916ccab6b@windriver.com>
Date: Mon, 24 Jan 2022 14:22:45 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <16C2FD9A4E76CEEA.15364@lists.openembedded.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR06CA0242.apcprd06.prod.outlook.com
 (2603:1096:4:ac::26) To CO1PR11MB5009.namprd11.prod.outlook.com
 (2603:10b6:303:9e::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 583a49f4-01d4-49d5-82e2-08d9df01f437
X-MS-TrafficTypeDiagnostic: MWHPR11MB1791:EE_
X-Microsoft-Antispam-PRVS: 
	<MWHPR11MB17912F76815C5EEE12FEF8D6F15E9@MWHPR11MB1791.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:758;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Rv/Q6WpZOivkCDXmmjVqysIoB3AXMwrsK9/O536Pvt1oMASxf42zUyYFWD9Ni4G9qgGtZevUiLyphMy7WLEIEglXcj3XlMi4j0gUW1r+saBQIsETCQSyXc/PbqLyhSmNfR2OWbattlC6uaUzhfLkz3pBTzZhT3eec4ZedJN1utUpAdnvywYMyZclMKRxrTlHFr2gFjvjxO+tzsh+RwO0hbMRgEwG61Ch5IDsoEfan33xOYjezWKtFRUHECQuY0aAQqXH7B1iDbuI4fuypqyYQ1KYdHLW9dCpKUDF9lRt62Jj2s11niK+95Bg9/RJyTcFeQXTXCOwuldycyCIRwmQg1Rmmusu1DnwnIyIbxQSb/alVjofa7W6X/ofVNcbmDHmxrwMwFCrqIajX4yQrBzpK/84N8QLFoM1HfEwjioh6/uCoSBDC3jXmbch8xxDJ/9saq/+psPHtZSfHj12aPPStdKFrEte16XNn0AfoKTxRqMu8/Knx/scQOjvk+bC2tpPrXX4yQQKYLm5RFkZSJiutBGf4J0HpqOu8P7Xy/21JlmxtgOXh88SRdIEOSfRksJfiJsKMTahODOe0VAA07dPp5HTzo/ZkcqNVxcJ/J76E3BUkPGlRa87xq2f/Hvo8A20/IAPgJnyfibXPgMCNRRaE8hlAslCWXVK49vHVXPKe/XDyb7EczEQOKlaOUKMPxAfCS7x4FDWN86MJ6H3PGpRFTAe04tGryJEpof7Kd0pfdhWawdPsobmKhK+kDzPfF1p36ATcfb+RmBrulejOniJTCiY95aXmMZPijCcCD6abAbTAvJ6H3bU6f+NZRrI2AgzJB1UKgsgEMQI0wxF589Q3m+i+K2R2JjTu46f+OpsR4nYOLZoFBRDUtUiDTE8K46AJFw1gefQ2MHCVpInjRWJHA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5009.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(2906002)(66946007)(8936002)(31696002)(31686004)(38350700002)(26005)(2616005)(52116002)(38100700002)(8676002)(66556008)(66476007)(5660300002)(186003)(6512007)(316002)(83380400001)(6666004)(86362001)(6506007)(53546011)(508600001)(966005)(6486002)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?V1ZzT1hOVm9UNEtNbzdCa0FkU29GbDdNc0VOYUkvV2hYeTVPaldENGhGRDNP?=
 =?utf-8?B?WnhBZWJSZzhjS1NHL0hleWpJaTBxSWlaYUw4eWRiQVV4UnFBZGVwTzN5QmJG?=
 =?utf-8?B?MDAyT1IvZkVtTHpUaHlTZmQxY2RkZmZiNVNmaW1XYXJIUm5ZSnl1aXB5Yity?=
 =?utf-8?B?TWw5UVorTTlRbVNGb1ZNWjQ2SW1Cd2VwYWV3MW1zSURjdk5uK2VGSWZTR0px?=
 =?utf-8?B?bXBtL2tqaC9MUVhPNDRXYTFBWkRwNGFhRjFMTnNHVllNVVkwZEZRK2hmcVVm?=
 =?utf-8?B?WHNOOWhPSDA5VlRFUk15SlF6TVFVdVczNFhhV29aQ05ocG15czEwNkthcVlu?=
 =?utf-8?B?TVB6U2pGdVFCY3MvZjYxeU5McHNrNVZPNGRoeEMyTzY1ZUk3V3NTWHVqNWMx?=
 =?utf-8?B?TmxSRHcxQkhhaldUck1EQlBWckVLbVo2ZTluS0FHa0R2cGYrYjYwWmxDdjUz?=
 =?utf-8?B?WGhjeVBNUWVTR1c4V2dETi9PTjdYVVFMN1NMM08rRnJ3MkhteW5UTDRsUm5s?=
 =?utf-8?B?dGlpQ2lGNVJkRStyTzVjaTB0T2l4OEtRMEEwcVdrays4RVJIRjhQUWhrRzNn?=
 =?utf-8?B?NFo0bkRlQm5GUFhNdzJMeUV6NkxGbWsyTVowa3pWTk14THliSGVkbHB4UExN?=
 =?utf-8?B?MUR4TG41Z0JpT01MNkh1RCtTeWZnUHZsRHRaWENnc2FYaExnZHFFVSt5dE9Z?=
 =?utf-8?B?Qk5xelF6dW9VMjhkdFJIZkV4VHJMbU9WY1JFQ0R6R1M1WFFYbDk1MWcxSE4r?=
 =?utf-8?B?bHRiMWFhRXVKNkp4UkQ3dHNxMXJheldMTEw4WnRkVVZpQ3hrWEhTVm9CaUFo?=
 =?utf-8?B?aWl3bldqM1M3RjJNM1d2YXZxWnMwZ2ZOSzBOOXYvTW15ekJwOTZqaHBaKy8y?=
 =?utf-8?B?ZGQ1blIxS29qRzh0Nlk4UmMySmNKM1Z4YjI3SG1yWkdMK2FHdDFiNnAwY2xa?=
 =?utf-8?B?LzNSQUxjc1lmQS9jK2V2alFiOVhBV2s4K0g3NUNROTJWSktmNzUwWTU1SnlJ?=
 =?utf-8?B?ZkdQdzA1VEZGeDRONFpvaWNUa2RrYW1PODVNYnJmYjlCQXF1ZkF6RXRQWkdu?=
 =?utf-8?B?WHU2R0tWT1loeWFCZ1BLY3FickVOT282L3JsTTdYM1p1aUlua1RQb2lWdm42?=
 =?utf-8?B?UWJuV3pqMTFCY2h5aUM1MHBXSlBWVWVDNUlwVVBLVHl1RGdjdWRYM2hKRnNS?=
 =?utf-8?B?Zm1GSlRicGdTSjhNOUxuczFvQ1ZHMlk3MjMwZ2g1MHAxMVA5elRsNEgvcThn?=
 =?utf-8?B?L3hYaDhlS013WUFOTXhxcDdwWkxjVEJVTWlDdlZyNDg2eXFOL1ZDVDJGUUFK?=
 =?utf-8?B?WmRnT0UrdUlkSysvS1BVcEwwL1BHNXNwUVlvNmYyR3pudDJVakZmd29KRFJM?=
 =?utf-8?B?MHdWbHpOQ0dtSjhGNlA3bER3MURVQThTV2QvYnBvWGtNSXpXSjlHTmdudUZP?=
 =?utf-8?B?Z0duQVNVSDVVWnJnaFJUeHN3dEJtNXFQVmNwdHZsSnV3Z0t0d1BzdFVTd1pa?=
 =?utf-8?B?UnY1Y1ZEVTFDY3JCTkZzVHl4a0ZWMDhBN01CeGtsTjN0RGdyTm1oZWphb0N3?=
 =?utf-8?B?aERHYTFMZ1QzeENwSitHS0tSVTJORG9vTHRFaldpR05BUkNKUWJoOTBZd2I4?=
 =?utf-8?B?cWd4MlVOQm9aaDRWbHd1bmFhV1U2Y2xySEE0YmswK0JwTFVRUmdMS2E4OTNM?=
 =?utf-8?B?ak1Hb1hSTnZ2MXlkTUJLRGV0VkdsN1E4bHNBY2plRUdENnNjWTNBNUpFMktv?=
 =?utf-8?B?dmpTcUdMZ1c3a2x2TTBqY2l5WWhqMUQ5dUZnWnNkSWJhVWlVUXhKaDFvNStQ?=
 =?utf-8?B?bzd5S0d4OFpTOHhqdXdaRnl1dWxLSTRuU1ZYbnl3dFpwdWg5d1hWT0pZSTl6?=
 =?utf-8?B?L01NZ0VuYy9WVTVzR29EeVluMHFMQVFOMzFaSEJaRXJ1RURTY2prWkJTNlB1?=
 =?utf-8?B?RktPRm90U2hrYmZPNitJWC8zK3NRNkd3bStxM280djJVSTl1d1oxd1EvWTlr?=
 =?utf-8?B?L0c5WWNFUGI0VTZXVUE5SStXZFcxekNwTlI2MTFLaGJIcWxEWnhvVjRFRkxE?=
 =?utf-8?B?Mm0yK0JBSlNKd0JQS2xDdGFKRkJDWlNENFpTcndIWUxYaTR6TmUvZlhXME9X?=
 =?utf-8?B?QlRiSkxGWEtMdVVtaUwxandUaDl3L21JcVMydUozMXR4T3VXNDhGTGtWOTJk?=
 =?utf-8?Q?TzLrr1GAc0kUXLsbMrg6qDQ=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 583a49f4-01d4-49d5-82e2-08d9df01f437
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5009.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2022 06:22:53.5813
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 lmXkdpfTpYqmHUy2Bt5wl95wN0zf/QfZ5x0izULTJ8QQd8KXwdGl0+jGWGLh9keM8oRNAVKU+Gt+aJ73ZqQG1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1791
X-Proofpoint-GUID: OTf-v8D4SKSGk3rtrwC2BsM7JLf6tdfG
X-Proofpoint-ORIG-GUID: MouQu9B9VcFoGR097RB5S7D3PnMwMB6i
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-24_04,2022-01-21_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0
 priorityscore=1501 impostorscore=0 adultscore=0 mlxscore=0
 lowpriorityscore=0 clxscore=1015 mlxlogscore=999 spamscore=0 bulkscore=0
 suspectscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2201110000 definitions=main-2201240041
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 24 Jan 2022 06:22:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95030

Ping.

Thanks,

On 12/22/21 1:47 PM, Yu, Mingli wrote:
> From: Mingli Yu <mingli.yu@windriver.com>
> 
> Remove c11_atomics.patch as the logic is already included in the
> new version [1].
> 
> [1] https://github.com/MariaDB/server/commit/f502ccbcb5dfce29067434885a23db8d1bd5f134
> 
> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> ---
>   ...e_10.5.12.bb => mariadb-native_10.5.13.bb} |  0
>   meta-oe/recipes-dbs/mysql/mariadb.inc         |  3 +-
>   .../mysql/mariadb/c11_atomics.patch           | 82 -------------------
>   ...{mariadb_10.5.12.bb => mariadb_10.5.13.bb} |  0
>   4 files changed, 1 insertion(+), 84 deletions(-)
>   rename meta-oe/recipes-dbs/mysql/{mariadb-native_10.5.12.bb => mariadb-native_10.5.13.bb} (100%)
>   delete mode 100644 meta-oe/recipes-dbs/mysql/mariadb/c11_atomics.patch
>   rename meta-oe/recipes-dbs/mysql/{mariadb_10.5.12.bb => mariadb_10.5.13.bb} (100%)
> 
> diff --git a/meta-oe/recipes-dbs/mysql/mariadb-native_10.5.12.bb b/meta-oe/recipes-dbs/mysql/mariadb-native_10.5.13.bb
> similarity index 100%
> rename from meta-oe/recipes-dbs/mysql/mariadb-native_10.5.12.bb
> rename to meta-oe/recipes-dbs/mysql/mariadb-native_10.5.13.bb
> diff --git a/meta-oe/recipes-dbs/mysql/mariadb.inc b/meta-oe/recipes-dbs/mysql/mariadb.inc
> index 3ecb29256..4a7b3cac4 100644
> --- a/meta-oe/recipes-dbs/mysql/mariadb.inc
> +++ b/meta-oe/recipes-dbs/mysql/mariadb.inc
> @@ -13,7 +13,6 @@ SRC_URI = "https://archive.mariadb.org/${BP}/source/${BP}.tar.gz \
>              file://configure.cmake-fix-valgrind.patch \
>              file://support-files-CMakeLists.txt-fix-do_populate_sysroot.patch \
>              file://0001-disable-ucontext-on-musl.patch \
> -           file://c11_atomics.patch \
>              file://clang_version_header_conflict.patch \
>              file://fix-arm-atomic.patch \
>              file://0001-Fix-library-LZ4-lookup.patch \
> @@ -25,7 +24,7 @@ SRC_URI = "https://archive.mariadb.org/${BP}/source/${BP}.tar.gz \
>             "
>   SRC_URI_append_libc-musl = " file://ppc-remove-glibc-dep.patch"
>   
> -SRC_URI[sha256sum] = "ab4f1ca69a30c5372e191a68e8b543a74168327680fb1f4067e8cc0a5582e4bd"
> +SRC_URI[sha256sum] = "16f008c66831130e9263b2601265d566ffc4e890d37bacecd4dcecebfd0d1c58"
>   
>   UPSTREAM_CHECK_URI = "https://github.com/MariaDB/server/releases"
>   
> diff --git a/meta-oe/recipes-dbs/mysql/mariadb/c11_atomics.patch b/meta-oe/recipes-dbs/mysql/mariadb/c11_atomics.patch
> deleted file mode 100644
> index 1c76ab391..000000000
> --- a/meta-oe/recipes-dbs/mysql/mariadb/c11_atomics.patch
> +++ /dev/null
> @@ -1,82 +0,0 @@
> -From 976468458d53d8bb71acf48ddfc852a60557acb9 Mon Sep 17 00:00:00 2001
> -From: =?UTF-8?q?Vicen=C8=9Biu=20Ciorbaru?= <vicentiu@mariadb.org>
> -Date: Thu, 23 Jul 2020 00:02:21 -0700
> -Subject: [PATCH] Link with libatomic to enable C11 atomics support
> -
> -   Some architectures (mips) require libatomic to support proper
> -   atomic operations. Check first if support is available without
> -   linking, otherwise use the library.
> -
> -Upstream-Status: Pending
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> -Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> ----
> - configure.cmake      | 20 +++++++++++++++++++-
> - mysys/CMakeLists.txt |  4 ++++
> - sql/CMakeLists.txt   |  4 ++++
> - 3 files changed, 27 insertions(+), 1 deletion(-)
> -
> -diff --git a/configure.cmake b/configure.cmake
> -index 4fc324a9..23a2ea91 100644
> ---- a/configure.cmake
> -+++ b/configure.cmake
> -@@ -862,7 +862,25 @@ int main()
> -   long long int *ptr= &var;
> -   return (int)__atomic_load_n(ptr, __ATOMIC_SEQ_CST);
> - }"
> --HAVE_GCC_C11_ATOMICS)
> -+HAVE_GCC_C11_ATOMICS_WITHOUT_LIBATOMIC)
> -+IF (HAVE_GCC_C11_ATOMICS_WITHOUT_LIBATOMIC)
> -+  SET(HAVE_GCC_C11_ATOMICS True)
> -+ELSE()
> -+  SET(OLD_CMAKE_REQUIRED_LIBRARIES ${CMAKE_REQUIRED_LIBRARIES})
> -+  LIST(APPEND CMAKE_REQUIRED_LIBRARIES "atomic")
> -+  CHECK_CXX_SOURCE_COMPILES("
> -+  int main()
> -+  {
> -+    long long int var= 1;
> -+    long long int *ptr= &var;
> -+    return (int)__atomic_load_n(ptr, __ATOMIC_SEQ_CST);
> -+  }"
> -+  HAVE_GCC_C11_ATOMICS_WITH_LIBATOMIC)
> -+  IF(HAVE_GCC_C11_ATOMICS_WITH_LIBATOMIC)
> -+    SET(HAVE_GCC_C11_ATOMICS True)
> -+  ENDIF()
> -+  SET(CMAKE_REQUIRED_LIBRARIES ${OLD_CMAKE_REQUIRED_LIBRARIES})
> -+ENDIF()
> -
> - IF(WITH_VALGRIND)
> -   SET(HAVE_valgrind 1)
> -diff --git a/mysys/CMakeLists.txt b/mysys/CMakeLists.txt
> -index 6aab788f..91b9c393 100644
> ---- a/mysys/CMakeLists.txt
> -+++ b/mysys/CMakeLists.txt
> -@@ -154,6 +154,10 @@ TARGET_LINK_LIBRARIES(mysys dbug strings ${ZLIB_LIBRARY}
> -  ${LIBNSL} ${LIBM} ${LIBRT} ${CMAKE_DL_LIBS} ${LIBSOCKET} ${LIBEXECINFO})
> - DTRACE_INSTRUMENT(mysys)
> -
> -+IF (HAVE_GCC_C11_ATOMICS_WITH_LIBATOMIC)
> -+  TARGET_LINK_LIBRARIES(mysys atomic)
> -+ENDIF()
> -+
> - IF(HAVE_BFD_H)
> -   TARGET_LINK_LIBRARIES(mysys bfd)
> - ENDIF(HAVE_BFD_H)
> -diff --git a/sql/CMakeLists.txt b/sql/CMakeLists.txt
> -index b9cd418f..d42e5017 100644
> ---- a/sql/CMakeLists.txt
> -+++ b/sql/CMakeLists.txt
> -@@ -222,6 +222,10 @@ ELSE()
> -   SET(MYSQLD_SOURCE main.cc ${DTRACE_PROBES_ALL})
> - ENDIF()
> -
> -+IF (HAVE_GCC_C11_ATOMICS_WITH_LIBATOMIC)
> -+  TARGET_LINK_LIBRARIES(sql atomic)
> -+ENDIF()
> -+
> - IF(MSVC OR CMAKE_SYSTEM_NAME MATCHES AIX)
> -   SET(libs_to_export_symbols sql mysys dbug strings)
> -   # Create shared library of already compiled object
> ---
> -2.25.1
> -
> diff --git a/meta-oe/recipes-dbs/mysql/mariadb_10.5.12.bb b/meta-oe/recipes-dbs/mysql/mariadb_10.5.13.bb
> similarity index 100%
> rename from meta-oe/recipes-dbs/mysql/mariadb_10.5.12.bb
> rename to meta-oe/recipes-dbs/mysql/mariadb_10.5.13.bb
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#94478): https://lists.openembedded.org/g/openembedded-devel/message/94478
> Mute This Topic: https://lists.openembedded.org/mt/87893323/3618448
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [mingli.yu@windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

