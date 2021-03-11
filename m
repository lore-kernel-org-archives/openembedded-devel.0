Received: from NAM11-DM6-obe.outbound.protection.outlook.com (NAM11-DM6-obe.outbound.protection.outlook.com [40.107.223.85])
 by mx.groups.io with SMTP id smtpd.web08.9006.1615480898751127224
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 11 Mar 2021 08:41:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=gMfiuyRm;
 spf=pass (domain: windriver.com, ip: 40.107.223.85, mailfrom: sakib.sajal@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oNqH6ZzAYCwW932PuCTgY/P3AFMoV5nMaA9hQNApYekXRnSDl3BwdFHUpnwHaE+r0TPOkphlQLYGPKvi6rg/jxZQRtmYOKAAjn2dFl8emK2zWVCSLFZFEiDkc2btuLc8K8Pob9FOV9xMFpbPQUpk8FVdrXAFIY0QHcjYzuhcdh19G8mOKpuNBtnES0LsazMtijyhlWKxhnoEze40vKT0uY9RJFgBBV/Q8tZ1pCi9EWCXaEiKIRa0lmAKpx7is/Zq0/EW5Hx5RmrPjCeVDr0RQwavkumlvosCDnTuxoiVYV+U6YI2XJxu+Tt4IPBAP7q7BOuBylBM6GnE3BbGDHhr1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G4DaMJF/ZJosXu86r/N80yvF1uXLaTeqcdyuam1CNhU=;
 b=M3L5jfAbums8PJmbBk/Ji0EMXPfLZxnJrVPGOKBIuaVuAjRI9mmQsFw498KnXLH2K9FUkj5bUBY8uTjc+fm8i+gY+Wt18gmmkNlruVdcR48dVtMJK7aUf15bjuVBiqwxPp9WFcsDp/m34qkfX0AxQd/QQfR/TPfDaZjOxAXMDbS7mZmT4+NFNNLPwhb9MOcWHmvN9NglmPdBzDsQDupTQ0bJkif7tJiWRVWZ3r33BrFbt13BOcOFxvyDYFXGHDsFDXHxOmtOsogrOVlMZ0p+uVPdiw2D5NycXRa46th2V8tQsQZonbfcwEEytVDOcVvmw/PfcRRuL6uHSkaJbMGy+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G4DaMJF/ZJosXu86r/N80yvF1uXLaTeqcdyuam1CNhU=;
 b=gMfiuyRme5JDEBTCg2GP8v2fMNsBnxJqKW6ABLg66SITYwBOkjdcI4xnrbhvG7oL8eWkgUMJ+7i4Y6mlkd+CEu9L0QmNR9i+h9zbrNvGfz+8URksgK/AIJVcjD/zjOoMdHhyf5Mb90zeDFz99d//cQNV/dmGZgqgduO6z2VuUlY=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from DM6PR11MB2538.namprd11.prod.outlook.com (2603:10b6:5:be::20) by
 DM6PR11MB3995.namprd11.prod.outlook.com (2603:10b6:5:6::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3912.17; Thu, 11 Mar 2021 16:41:37 +0000
Received: from DM6PR11MB2538.namprd11.prod.outlook.com
 ([fe80::25ca:eb0e:8908:9fa7]) by DM6PR11MB2538.namprd11.prod.outlook.com
 ([fe80::25ca:eb0e:8908:9fa7%7]) with mapi id 15.20.3912.030; Thu, 11 Mar 2021
 16:41:36 +0000
Subject: Re: [oe] [meta-oe][PATCH] grpc: upgrade 1.36.1 -> 1.36.2
From: "Sakib Sajal" <sakib.sajal@windriver.com>
To: openembedded-devel@lists.openembedded.org
References: <166B54E0208DA20A.13992@lists.openembedded.org>
Message-ID: <0c2518e8-dbb1-766d-02f1-ed17ce410bb1@windriver.com>
Date: Thu, 11 Mar 2021 11:41:33 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <166B54E0208DA20A.13992@lists.openembedded.org>
X-Originating-IP: [184.146.108.8]
X-ClientProxiedBy: MN2PR19CA0016.namprd19.prod.outlook.com
 (2603:10b6:208:178::29) To DM6PR11MB2538.namprd11.prod.outlook.com
 (2603:10b6:5:be::20)
Return-Path: sakib.sajal@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.2.48] (184.146.108.8) by MN2PR19CA0016.namprd19.prod.outlook.com (2603:10b6:208:178::29) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17 via Frontend Transport; Thu, 11 Mar 2021 16:41:36 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 703edb29-7bde-4928-74ea-08d8e4ac8965
X-MS-TrafficTypeDiagnostic: DM6PR11MB3995:
X-Microsoft-Antispam-PRVS: 
	<DM6PR11MB39952BF186848CE3B4AC8D23F2909@DM6PR11MB3995.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:369;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	KkKLRHITRMCn14E4qcZVMI0gBiISMogHDeuwuy/fY2D76PJTx998HN+s0ws0az3fbHhse3QzEng/kKkmsAz02+vGE1YGdOkttPPRW3EqGQM8Gt4IjUataJZ6brdVbY40m5vnv0Zjtn36/CjVlbvLDss+e/X9HcRO5dUCD5G96UGZy/9l+1kQBtfXJIgAHz74ff6t07Jg8wj4Z7EIB/IUBYRQfeTuaEhRr3fHIBr2DOkc09P1yH5NKDJ0lhbcMq+GOrO9Nnhx3TpVGy35WhOL5WeIfEIFenLprbstSGx/f+9aATuUfMss2IOpzK4NPFlXJ8tOiv89jH1gk1qIYNXstUeJ9haiR6rK/Qjf5XPhrBSTSubGtl5je2OnqtCJtqheEh5Riz658nzNhsb1DyW995E0B7gqPmUCMSX4kvu6cMTFWPyoyyQvTIhrUJqEtFmGknHuWtmsxXZ1u+T3DbhkhIdLgIM4mE94JCYIJKx4JjDYjpCkWAZsnheryfKrjT4pb3A03DDd+ocUTTqa0qHOOtWw3gBVe9pfr/DvT2Amn4b6wW5N88uujGRG8h7uIlwqUOMK3x02K1tqh7Ncfh+ygPKMhMj5bCO+slny7Gw3RoDTqi2MO7QWm//uuKASpDuvlsIxwV0SPw8WdvNAfTnAof093z5xEecfzPmEJTUJNusVp5oUyHZMNnCcL1yfdJbg
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB2538.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(39850400004)(376002)(396003)(366004)(136003)(6666004)(186003)(16526019)(66946007)(956004)(86362001)(8676002)(36756003)(31686004)(6916009)(966005)(52116002)(16576012)(26005)(316002)(6486002)(31696002)(33964004)(53546011)(478600001)(5660300002)(83380400001)(66476007)(166002)(66556008)(2906002)(8936002)(2616005)(44832011)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?R1pSbmx4NjJ4YXd5ZTM4bVNaRXVMNkMxcENJSktEaVZLNGpkcndKWW5ScCti?=
 =?utf-8?B?MitBaFJPcnFZWk5NTmJEK2NVTENhSGZ1OFBqRjV5TzZuckxJQVZtZXZ6Y2hT?=
 =?utf-8?B?WGNOOGdjcGhHbGdwa2NJdC82d24rdGl0Q2l2dGtXUldoaGFmZ0QwRzZhMWRh?=
 =?utf-8?B?Zk5veXZiZXJnbU12Nk8yMnJHMFVFbWRVcWoycU9HWWVnemNKUURGOXdVeHJ2?=
 =?utf-8?B?Y2xSclZpNGJGVzFUT1BUQjVJd0NZY3gyL0JZaHRDMGlkTDZlWEtKeGY0Z1J4?=
 =?utf-8?B?ang4MkU2ZXhPcy9IYkh6KzNoK1ZpNHg4bTFDSVlMRzA4VmxHcGpxVTdndGhD?=
 =?utf-8?B?N0hkRTVodFQ3NXJraitIOHMvdkg1Yy8zaEQ4emgyL0J1WmR5VVZ4TGlPRTNZ?=
 =?utf-8?B?VG42MTBwQzFPclN0ZFVCTy9Gb2thVkhBZVR0TFFINmpGMFlDNXBBdW1xTkha?=
 =?utf-8?B?VEVGUFlVWFlYM1ZOc25EUjNsc0ZBVzh4S1JGQWZzTDFEY1NyWCtrRHdKZEd2?=
 =?utf-8?B?UFZ6RE5UYlAvU011WTgwUStiMkFkaER3KzFtZlRXcTBhTFdlR0JLWStwV2RM?=
 =?utf-8?B?aHRHSi9Ya251T0NocjVxNnlHRmtVUWx4cHY0ckQxUThCTlg2OGJsOTduc0Vz?=
 =?utf-8?B?ZEI5dTFhMk5HcElOYWFtY29sSjdMREVXQ250aEh5bUhlaGZGQVhRTlFlOTBK?=
 =?utf-8?B?dlVxYWNVRExpYjcxTGlMdFpZVEZrMG5veGNZc2tNYjFVYmlhRno3U1hhYzFN?=
 =?utf-8?B?NE1LaEphVFBTVEloVW1GbXMzdG5jNU1RMEtjNHZ0U2JycHlmclBiK3ZUYkw0?=
 =?utf-8?B?elMyb2NjSzk4eEdvRk95MW5sWUduMzIxVGN6U0pOUHNDdzZGcG96U3J1bm5X?=
 =?utf-8?B?MDVHSjVvUmd5NVp1WHBaS3RLaTlKazJxV3RWNGw3dEliVUNLZEd5S3VoS21X?=
 =?utf-8?B?bkZIM1daQ0drRHZwS3RWOWRMeWhTeHJ0M3BKNll4VGVCdHVoejJTSE1hV1kw?=
 =?utf-8?B?QldubDVQTWlkVUJ3TFE1SnZmWWtHWEQyLzQ4c29HSk9YUFl3NDZWamN3WFli?=
 =?utf-8?B?UlNJZXprcElKRzJDNjBhdkdTTzRzUXhscE5yblloZ2xoV1EvbjQ1WTl4RmRl?=
 =?utf-8?B?Y21XZ3FVUk5Ua2psN1ZiTDNSR1p5aVZBUWFMMFcyQzFpYVdMWEVZaHh6WS8r?=
 =?utf-8?B?NisxRVhOVTFpWktlWFpvM3BTUVBqcjZVNFRrejNDWUltMEtKNXNRYmxOTWlB?=
 =?utf-8?B?NTltL1BUNWFyeVlkRUgyNEZ1aTJVR2tWWHBQUXZ3OU56Z3AxZWhzY3JhN2E5?=
 =?utf-8?B?bVV3dnhlSURCaEdPTnRqeDZ1YkpPMFA4LzZ4cTlsZEFZN3piMEFnWmc3Rkhk?=
 =?utf-8?B?SFhlVHluUVRaWE5XWkR6aDIwVGFRTStuN3NpU0ZVOUpTaXFRYXVPR3JGSm40?=
 =?utf-8?B?WjA5NkhRVWdSZkhrT1lERWcyY0ZmQU5rRmE3dEJQRjh3dWtLdElJeWlJUUd5?=
 =?utf-8?B?RnZQa2NDdzd1TUpnNDlybGN6djRWVHVoSmF4UVVxRmpTcElUcUo1MDJIemdB?=
 =?utf-8?B?TEw1Q2krZHRhVENmR0ZLMmY2RFppeDhjNDNhNGVmOVN5YVE2SWwxbzZDSk9r?=
 =?utf-8?B?azlKcnVSUUxQTHcraGVua1pzaFdoNytKWGtvdEVkS1k2WDJPSFN0M25raWJo?=
 =?utf-8?B?cVRINlpiRzdyMzEwQzVDcTZNVXZTbkk3SVZXdll0TFZuNTJ0WGpuRnRnN1pI?=
 =?utf-8?Q?PKzvgZZdzky155p9KrzzwatTjzyjMQjyPxIzKpS?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 703edb29-7bde-4928-74ea-08d8e4ac8965
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2538.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2021 16:41:36.6099
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1rBrdmu9zELKi4uzl/sXDxe6YFJfbwolc0kwdbJ2X6PUk5NuGD3joDgNFdOw7NhGmfjC8b7GngWk3TfBYlzBIbKwhLVKdB47dR2nMxhu+4I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3995
Content-Type: multipart/alternative;
 boundary="------------1076270A2D2C51A720AE7643"
Content-Language: en-US

--------------1076270A2D2C51A720AE7643
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-03-11 10:56 a.m., Sakib Sajal wrote:
> Changelog:
> https://github.com/grpc/grpc/releases/tag/v1.36.2
>
> Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
> ---
>   .../recipes-devtools/grpc/{grpc_1.36.1.bb => grpc_1.36.2.bb}    | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>   rename meta-oe/recipes-devtools/grpc/{grpc_1.36.1.bb => grpc_1.36.2.bb} (98%)
>
> diff --git a/meta-oe/recipes-devtools/grpc/grpc_1.36.1.bb b/meta-oe/recipes-devtools/grpc/grpc_1.36.2.bb
> similarity index 98%
> rename from meta-oe/recipes-devtools/grpc/grpc_1.36.1.bb
> rename to meta-oe/recipes-devtools/grpc/grpc_1.36.2.bb
> index eb137bef5..17e70aebf 100644
> --- a/meta-oe/recipes-devtools/grpc/grpc_1.36.1.bb
> +++ b/meta-oe/recipes-devtools/grpc/grpc_1.36.2.bb
> @@ -16,7 +16,7 @@ RDEPENDS_${PN}-compiler = "${PN}"
>   RDEPENDS_${PN}-dev += "${PN}-compiler"
>   
>   S = "${WORKDIR}/git"
> -SRCREV_grpc = "3b7f86e3516746c5f0db1947e0d65e94159bcb12"
> +SRCREV_grpc = "c3438a0c5d7bc499eb31fd4853ca72c771f758a5"
>   BRANCH = "v1.36.x"
>   SRC_URI = "git://github.com/grpc/grpc.git;protocol=https;name=grpc;branch=${BRANCH} \
>              "
>
> 
>
Build statistics:

BUILDALL-QEMU LOG FOR grpc
START TIME: 2021-03-10_11:41:00
HOSTNAME: ala-lpggp3
HOST OS: Ubuntu 18.04.3 LTS
HOST KERNEL: 5.4.0-62-generic
===============
BUILD RESULTS:
[glibc]
FAIL: qemuarmv5
PASS: qemumips
PASS: qemux86-64
PASS: qemuarm64
PASS: qemumips64
PASS: qemuarm
FAIL: qemuppc
PASS: qemuriscv64
PASS: qemux86
[musl]
FAIL: qemuarmv5
PASS: qemumips
PASS: qemux86-64
PASS: qemuarm64
PASS: qemumips64
PASS: qemuarm
FAIL: qemuppc
PASS: qemuriscv64
PASS: qemux86
===============
PASSED: 14
FAILED: 4


Sakib


--------------1076270A2D2C51A720AE7643
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-03-11 10:56 a.m., Sakib Sajal
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:166B54E0208DA20A.13992@lists.openembedded.org">
      <pre class="moz-quote-pre" wrap="">Changelog:
<a class="moz-txt-link-freetext" href="https://github.com/grpc/grpc/releases/tag/v1.36.2">https://github.com/grpc/grpc/releases/tag/v1.36.2</a>

Signed-off-by: Sakib Sajal <a class="moz-txt-link-rfc2396E" href="mailto:sakib.sajal@windriver.com">&lt;sakib.sajal@windriver.com&gt;</a>
---
 .../recipes-devtools/grpc/{grpc_1.36.1.bb =&gt; grpc_1.36.2.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/grpc/{grpc_1.36.1.bb =&gt; grpc_1.36.2.bb} (98%)

diff --git a/meta-oe/recipes-devtools/grpc/grpc_1.36.1.bb b/meta-oe/recipes-devtools/grpc/grpc_1.36.2.bb
similarity index 98%
rename from meta-oe/recipes-devtools/grpc/grpc_1.36.1.bb
rename to meta-oe/recipes-devtools/grpc/grpc_1.36.2.bb
index eb137bef5..17e70aebf 100644
--- a/meta-oe/recipes-devtools/grpc/grpc_1.36.1.bb
+++ b/meta-oe/recipes-devtools/grpc/grpc_1.36.2.bb
@@ -16,7 +16,7 @@ RDEPENDS_${PN}-compiler = &quot;${PN}&quot;
 RDEPENDS_${PN}-dev += &quot;${PN}-compiler&quot;
 
 S = &quot;${WORKDIR}/git&quot;
-SRCREV_grpc = &quot;3b7f86e3516746c5f0db1947e0d65e94159bcb12&quot;
+SRCREV_grpc = &quot;c3438a0c5d7bc499eb31fd4853ca72c771f758a5&quot;
 BRANCH = &quot;v1.36.x&quot;
 SRC_URI = &quot;git://github.com/grpc/grpc.git;protocol=https;name=grpc;branch=${BRANCH} \
            &quot;
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
    <p>Build statistics:</p>
    <p>BUILDALL-QEMU LOG FOR grpc<br>
      START TIME: 2021-03-10_11:41:00<br>
      HOSTNAME: ala-lpggp3<br>
      HOST OS: Ubuntu 18.04.3 LTS<br>
      HOST KERNEL: 5.4.0-62-generic<br>
      ===============<br>
      BUILD RESULTS:<br>
      [glibc]<br>
      FAIL: qemuarmv5<br>
      PASS: qemumips<br>
      PASS: qemux86-64<br>
      PASS: qemuarm64<br>
      PASS: qemumips64<br>
      PASS: qemuarm<br>
      FAIL: qemuppc<br>
      PASS: qemuriscv64<br>
      PASS: qemux86<br>
      [musl]<br>
      FAIL: qemuarmv5<br>
      PASS: qemumips<br>
      PASS: qemux86-64<br>
      PASS: qemuarm64<br>
      PASS: qemumips64<br>
      PASS: qemuarm<br>
      FAIL: qemuppc<br>
      PASS: qemuriscv64<br>
      PASS: qemux86<br>
      ===============<br>
      PASSED: 14<br>
      FAILED: 4 <br>
    </p>
    <p><br>
    </p>
    <p>Sakib<br>
    </p>
  </body>
</html>

--------------1076270A2D2C51A720AE7643--
