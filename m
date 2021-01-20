Received: from NAM10-DM6-obe.outbound.protection.outlook.com (NAM10-DM6-obe.outbound.protection.outlook.com [40.107.93.45])
 by mx.groups.io with SMTP id smtpd.web08.27643.1611149618127220885
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Jan 2021 05:33:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=ffWzj7iX;
 spf=pass (domain: windriver.com, ip: 40.107.93.45, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LOJCa88JBAWDlLzNWUjoI4WVDAJXnYJazVcmkp7Ugob3tWt9G7fKEQnIwUlbPi3wgGwIyxnD85pqAvwWEZPF1MzBvi+Gtlvm+58hZFiGsvEQi/gyFEEOIybNuihgmvxc6Ram6nW1vn/E9TEYWhka1SVibaVqDA0J/TEosWA79LU1tq19lUnt6e1A0z4SCE8mIaKqZcSM/eBZ21SX1z0pdwMtsLCgUiX56pfg7dIcAZVpJn6LANhalqCj1k/aF1v5g6H53CobPeiNCM9rImWGleWSrdBqoUebL67A2cH0xJ6q0cNc7J9KoxiCcnV7sQ8ZgC+HUq0xHrqixCD0csX+fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0u+n2VehcLOGpLAiMo0JEnBdM1hL3tFcmmCcaDiBzwg=;
 b=oBkgPmK/LcLKspIfCAlTtBgVbzYB40HkQVkyxzNrxfHiM1e0qCMwIvVtJMYKoNyJKZzTUHqbiJXJL3es4g9WADBssZ6+eZOCitPMCt7LucSHi23mL++R23p0l9ghFrEptjDURDTIW749Sqsqu2wLxoWUZBHxxKbvzcpJ/hs0YEKD27yOJogyIIjZdlQf81Ulv+74rhVmjrXAVJlBAil5+0En7qAgTeBX8khGAe7W3b5xBL/0VB+jK/JfpYf+/e7GiLfTZyvkKn4NgZlCYaqY/AtfvEPU9PiivcvdKeSC1ySHP30T3OL8vP77rBMjZ4Qzuo2PxMldSL57FFu1FQ51Rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0u+n2VehcLOGpLAiMo0JEnBdM1hL3tFcmmCcaDiBzwg=;
 b=ffWzj7iXyBZg5ElJOWTQ61B+zgGt2z59QF4nMKXj8zlQJ0Z+drowwkZN9er9wIVxkcLsA1ImpE6hnnll/oH63XuFtfRiLAYEDVYwUXtaVn/1RsZ4CyLNPJrK7dk1m0X5lY0rkDkMRfpHBwRR/S8nZ9t+/Q5Yw76OPQU4I/LOiEw=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB3190.namprd11.prod.outlook.com (2603:10b6:a03:7b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.11; Wed, 20 Jan
 2021 13:33:37 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447%7]) with mapi id 15.20.3763.014; Wed, 20 Jan 2021
 13:33:36 +0000
Subject: Re: [oe] [meta-python] [PATCH] python3-smbus: upgrade 4.1 -> 4.2
To: zangrc <zangrc.fnst@cn.fujitsu.com>,
 openembedded-devel@lists.openembedded.org
References: <1611069884-4580-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <9c45fb65-245d-4898-0cfd-87b2bd9434ee@windriver.com>
Date: Wed, 20 Jan 2021 08:33:34 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
In-Reply-To: <1611069884-4580-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: CH2PR02CA0006.namprd02.prod.outlook.com
 (2603:10b6:610:4e::16) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by CH2PR02CA0006.namprd02.prod.outlook.com (2603:10b6:610:4e::16) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.11 via Frontend Transport; Wed, 20 Jan 2021 13:33:36 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 36f33d2c-bccb-4dc5-15ed-08d8bd47fd7b
X-MS-TrafficTypeDiagnostic: BYAPR11MB3190:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB31908C5079D29F791225AE269FA20@BYAPR11MB3190.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	iQ8H7wcevIl3aroIU5oEUtp1CTt7Bmf7gUHqT7uSMJA/toHymkcHy9D9x1ckvXorIbLre1tEiibcGlJGtLCrVrzsXeKJtGtsj9L9cq4nFY+HbdBvLdbv3mW/paPWINy6MY0zczZU0eaPmv+Ngk+IK6Ppg92kpvAXiV0bvcMgpP/NtWy22EzA/g1E90YhTrLp7XpP8IHtXlddJVATv61m1qbSuZrlpZbgPWV+9p8azbxBQVx2T9tZiQlHY5kRhPPSmOh7Ndy2GqAvMJUHPTxeqEQbS0GwJ08Mh4YOuynZSIfbiaLtbGXbcjfJ7GKVe0PntMwfB91nsgwWimVnhSD9gAmpclL6Y3C8ji5RcWOT6rR8YM9FNIobordA85/R9TOp3s92UI17APQAdDwVV1V1jM+oXhZYQlxvRtfSw7o7gmDqEcwKqWj/D7GaQ7YxLGhxPi2rKHjoABdHMO+crTzjbQpQ5EGMRRHr9Mbi0Zyjvs9s3uFqLEfUd/p16nBfwelY4sPbXRQ5eS0nIz+CV6TQTlVbeH70/9Cv/7jWpuP7ZGVYj0rR1Q6csT9AfmiBWKcL
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(366004)(346002)(396003)(136003)(39850400004)(83380400001)(6486002)(26005)(31686004)(166002)(16526019)(52116002)(44832011)(478600001)(186003)(316002)(31696002)(16576012)(2616005)(66946007)(2906002)(33964004)(36756003)(53546011)(8676002)(966005)(5660300002)(66556008)(86362001)(8936002)(66476007)(956004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?QjlySHlNZ0lEOWZOaWFFVkdQanZ3LzZyTnk4bHZ2T3R1eHpwMkxkV2xiaEJH?=
 =?utf-8?B?ZHBrL2l3Z0VFSnBWZG9oalRIOVAzQjlDYTh2WG9WWTRYTm9BNTd0UjZBREVz?=
 =?utf-8?B?TUtrRTRHbEMvMHZIVHJucWI2RCsyMzdsb1lOWjhRQTB2S0F0L0Y5WXRSd1gv?=
 =?utf-8?B?M2lYRHpld0V5NmdQQTNqaWdHb0w4U1ZyZkpqZEUxSjVTWGYzNFJYZVBYcGZ0?=
 =?utf-8?B?bTJCOWJpUWd2YXpQOXExcTVzNERXdE1uWnFSeXRETkx6K1UxcTRjVURjSVlK?=
 =?utf-8?B?Tk9FbUVLOTJzK0VGdDg4T1NobjM0YkMza2pENTNYVzNwUzg4ZnhadXdxUjk0?=
 =?utf-8?B?Q2tZeVpKQnR6T045ZExXb2lTdXdWMlVncFlDQzBvYk9jbDIxUy9zRnRNclNk?=
 =?utf-8?B?N0lFbW91WXZTZXdDbDJoY2xEenlSbVk4dU1pVWhvLzIra2FDWnJCNHZZVGJ5?=
 =?utf-8?B?cERqTW5Eckx4enZJYkkwTnNQR0JPdUN1b1NFa2piTDlvdFlqTU5qbjliQTVL?=
 =?utf-8?B?ZmVUSnFOdzByYis2TGgrWjhRNi9JaEN5UjQvNXptUVEzVWpPT1N0ZWRFTHY1?=
 =?utf-8?B?VUFuYUFKenVqL2tndmtKaUh6NlRSbThOWVNoVE8wUkwvN2JHTXBYenFObVJP?=
 =?utf-8?B?bGR4SXN6N3hNZVVzbHoyVWtGczd0TktoaStrbElYUVRDVTBGTjNidXhGZCtP?=
 =?utf-8?B?YW04SGxMUHU3U0pYOWNxeVkrb1FBSzFCeEtEeXZia3JOT3BMUml5cWxGWkk0?=
 =?utf-8?B?a25ycU82OUdXNjZOcG9yS1Rla0d5WGJlWmtLTkpIRGg1VW5SYURhTXI2RTBi?=
 =?utf-8?B?dVRYSWE4YlBTSzdwckFtM3E2RW5OWE9CeVU1SGxXZGNNVUVXOS84eWNJOWN5?=
 =?utf-8?B?QkpydUpSK0x2aHdUSkgyODIrMzI4ek9lL2U0NFVRdkxkc1puVC9WZDJUNUNh?=
 =?utf-8?B?d1RVY3dEcy83c3AyOWU0dnlScFptQzllTmswUzhrVHBlbkhLZXQ5YTdqZGdO?=
 =?utf-8?B?TVUzaGVWelZHZld2cnE3ZE1xTitrNVBRdk9KODdIeGE4ejd0RTRGeVI3ZUxs?=
 =?utf-8?B?OU5MdDlHWU5BcFZvcWNVdmdlcmNLWEZKTWV1bjZlVHpFNWVnYTA1dEdrVXpa?=
 =?utf-8?B?NUNmZXgzZW96U0JJT2pCSWh5a0RzYUd1azNEUHNoSjVRWFpNc3VrdmlBdlB2?=
 =?utf-8?B?Z3VqN0hNdGs0eHl0bldtenlQdlpIdDBGTGpMZTFNU09SaTVIS2tIVTVXdFJX?=
 =?utf-8?B?bkZkSlQ5Q2E0VjYyL1lWQlpWKzlYaXJGK2RZb1dsVXhrK2hsa3c5NkRJU09m?=
 =?utf-8?Q?tqhrUeeeLWdOoCrrQSg5JXbeePq4u0A0rP?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 36f33d2c-bccb-4dc5-15ed-08d8bd47fd7b
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2021 13:33:36.8383
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kPrXKU72wB4fpEdADuEBj0r/n3etKBU6kHAePTNO83vk3pOCOpzULVZ2miwFiiYdO4kq0Y+cqaG26L3G4rBVfcdLsR06wYesQfsACGRLzm0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3190
Content-Type: multipart/alternative;
 boundary="------------FF121AAB67BA05A4F089393A"
Content-Language: en-US

--------------FF121AAB67BA05A4F089393A
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-01-19 10:24 a.m., zangrc wrote:
> 4.2 (2020-09-22)
>    manpages: Add BUGS section to let people know how to contact us
>    Makefile: Allow to preset all CFLAGS and LDFLAGS variables
>    tools: Consistently use snprintf instead of sprintf
>           Restrict addresses 0x03-0x07, too (defined by I2C standard)
>    decode-dimms: Print SPD revision for DDR3 too
>                  Print primary bus width for DDR3 and DDR4
>                  List ee1004 as a candidate driver
>                  Display MAC for DDR3
>                  Add MAC abbreviation for DDR4
>                  Round DDR4 speed properly
>                  Detect and report truncated input files
>                  Print kernel driver used
>                  Print DDR memory speed in MT/s
>                  Add DDR5 memory types
>                  Decode manufacturing data for LPDDR3
>                  Fix the version string
>                  Point the user to the right drivers
>                  Update the list of vendors to Jedec JEP106BB
>    decode-vaio: Add support for the at24 driver
>                 Scan more i2c buses
>    i2cset: Fix short writes with mask
>    i2ctransfer: Mention '-a' everywhere in the manpage
>                 Support messages using I2C_M_RECV_LEN
>                 Add check for returned length from driver
>    i2c-stub-from-dump: Read dumps from hexdump -C
>    library: Add a manual page to document the API
>
> Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/{python3-smbus_4.1.bb => python3-smbus_4.2.bb}     | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-smbus_4.1.bb => python3-smbus_4.2.bb} (71%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-smbus_4.1.bb b/meta-python/recipes-devtools/python/python3-smbus_4.2.bb
> similarity index 71%
> rename from meta-python/recipes-devtools/python/python3-smbus_4.1.bb
> rename to meta-python/recipes-devtools/python/python3-smbus_4.2.bb
> index 6b33649434..862a547c00 100644
> --- a/meta-python/recipes-devtools/python/python3-smbus_4.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-smbus_4.2.bb
> @@ -4,8 +4,8 @@ LIC_FILES_CHKSUM = "file://smbusmodule.c;beginline=1;endline=18;md5=46e424fb0459
>   PR = "r1"
>   
>   SRC_URI = "${KERNELORG_MIRROR}/software/utils/i2c-tools/i2c-tools-${PV}.tar.gz "
> -SRC_URI[md5sum] = "3536237a6b51fb10caacdc3b8a496237"
> -SRC_URI[sha256sum] = "ef8f77afc70e7dbfd1171bfeae87a8a7f10074829370ce8d9ccd585a014e0073"
> +SRC_URI[md5sum] = "d6861c89521f2a2773e19edadb2befee"
> +SRC_URI[sha256sum] = "7de18ed890e111fa54ab7ea896804d5faa4d1f0462a258aad9fbb7a8cc6b60cc"
>   
>   DEPENDS += "i2c-tools"
>   
>
> 
>

--------------FF121AAB67BA05A4F089393A
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-01-19 10:24 a.m., zangrc wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:1611069884-4580-1-git-send-email-zangrc.fnst@cn.fujitsu.com">
      <pre class="moz-quote-pre" wrap="">4.2 (2020-09-22)
  manpages: Add BUGS section to let people know how to contact us
  Makefile: Allow to preset all CFLAGS and LDFLAGS variables
  tools: Consistently use snprintf instead of sprintf
         Restrict addresses 0x03-0x07, too (defined by I2C standard)
  decode-dimms: Print SPD revision for DDR3 too
                Print primary bus width for DDR3 and DDR4
                List ee1004 as a candidate driver
                Display MAC for DDR3
                Add MAC abbreviation for DDR4
                Round DDR4 speed properly
                Detect and report truncated input files
                Print kernel driver used
                Print DDR memory speed in MT/s
                Add DDR5 memory types
                Decode manufacturing data for LPDDR3
                Fix the version string
                Point the user to the right drivers
                Update the list of vendors to Jedec JEP106BB
  decode-vaio: Add support for the at24 driver
               Scan more i2c buses
  i2cset: Fix short writes with mask
  i2ctransfer: Mention '-a' everywhere in the manpage
               Support messages using I2C_M_RECV_LEN
               Add check for returned length from driver
  i2c-stub-from-dump: Read dumps from hexdump -C
  library: Add a manual page to document the API

Signed-off-by: Zang Ruochen <a class="moz-txt-link-rfc2396E" href="mailto:zangrc.fnst@cn.fujitsu.com">&lt;zangrc.fnst@cn.fujitsu.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:1611069884-4580-1-git-send-email-zangrc.fnst@cn.fujitsu.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/{python3-smbus_4.1.bb =&gt; python3-smbus_4.2.bb}     | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-smbus_4.1.bb =&gt; python3-smbus_4.2.bb} (71%)

diff --git a/meta-python/recipes-devtools/python/python3-smbus_4.1.bb b/meta-python/recipes-devtools/python/python3-smbus_4.2.bb
similarity index 71%
rename from meta-python/recipes-devtools/python/python3-smbus_4.1.bb
rename to meta-python/recipes-devtools/python/python3-smbus_4.2.bb
index 6b33649434..862a547c00 100644
--- a/meta-python/recipes-devtools/python/python3-smbus_4.1.bb
+++ b/meta-python/recipes-devtools/python/python3-smbus_4.2.bb
@@ -4,8 +4,8 @@ LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://smbusmodule.c;beginline=1;endline=18;md5=46e424fb0459PR=">&quot;file://smbusmodule.c;beginline=1;endline=18;md5=46e424fb0459
 PR = &quot;</a>r1&quot;
 
 SRC_URI = &quot;${KERNELORG_MIRROR}/software/utils/i2c-tools/i2c-tools-${PV}.tar.gz &quot;
-SRC_URI[md5sum] = &quot;3536237a6b51fb10caacdc3b8a496237&quot;
-SRC_URI[sha256sum] = &quot;ef8f77afc70e7dbfd1171bfeae87a8a7f10074829370ce8d9ccd585a014e0073&quot;
+SRC_URI[md5sum] = &quot;d6861c89521f2a2773e19edadb2befee&quot;
+SRC_URI[sha256sum] = &quot;7de18ed890e111fa54ab7ea896804d5faa4d1f0462a258aad9fbb7a8cc6b60cc&quot;
 
 DEPENDS += &quot;i2c-tools&quot;
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------FF121AAB67BA05A4F089393A--
