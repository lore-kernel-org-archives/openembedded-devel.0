Received: from NAM10-MW2-obe.outbound.protection.outlook.com (NAM10-MW2-obe.outbound.protection.outlook.com [40.107.94.60])
 by mx.groups.io with SMTP id smtpd.web08.15748.1612664112571768970
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 06 Feb 2021 18:15:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=mK8ksZbo;
 spf=pass (domain: windriver.com, ip: 40.107.94.60, mailfrom: kai.kang@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PX53xzAoi8+jgVZczVojxXsR4lzMVmVkGryurg3KDB2bgLJu2S3csAIx3N82L4wBDx6a/TrPic9kwA12Ye1jydnAsjtPJro/4V08BG6TbqqS8yOyBNQEHDP6tGdOfyHyx7XR/MVoXnrxwV1DMxcZscOjZ1VL0/iUBzvQbu+kw4Sm/MqCDt9auM89MZzzcYviYGCmLuLWB4w/81quOTR1c3vLWDHZjXouJoBdZ5q19KyngwUI++wxl8+Bs+TiHwVZRQxNEiTNgJ4pfgi81Wa8xMjWlmvszjpd4jHNDzzqjcD1555U258GTZvFJF9jjMuod6v/nOBQZbyxdrZe48jRnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ag8Y3H5uYgB8OKB1PUmuDnr2IHjRrtyK0nsgLdsB7N4=;
 b=fWyc2Wch0Az8hN9amEDmVHstZlHYxpEadNjahDiQnOltY/cpN1hJtJQEyM9gUtSlvf6qHlv6oamsIKGgRTmIIgAhf5bAXuwETVkIIyCAziwrsCJryrlHMiyY+GGrKSsUf3/hRdSQMgFG6xrVzbevGwN2BdrdZKDdgk8DEC7Nbf+fcfRAtTmPFv/ehJChi91M1RY5tKyGtlkGZ6i7FDItlTrdPU52Mw3uzb9zpJSDmu0wROacSRB/phVlFuppU0Y3ueKutCRBK+5HhiZ52YoBFqnPMFMX7ay+hz1Xh4pgga0cuGSt0QLxAII5r9+4INjolwgZnQ/E2pSsB9YybXE3fQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ag8Y3H5uYgB8OKB1PUmuDnr2IHjRrtyK0nsgLdsB7N4=;
 b=mK8ksZbodLbS3tDHO9LnaRUuZtiyK1TjL66BPYRjsifEqWNyXKiBYhX6X6VItl1rtru03Liitg8PQChL5gP1QJ5W+qknAI3WQGfgF2knpOiJU85FMNcp8kaZl/eFTWBFVWOchPV9/NoslEX61ttvBz6WOFOiptGRndasp0mdES4=
Authentication-Results: windriver.com; dkim=none (message not signed)
 header.d=none;windriver.com; dmarc=none action=none
 header.from=windriver.com;
Received: from BYAPR11MB3687.namprd11.prod.outlook.com (2603:10b6:a03:ff::26)
 by BYAPR11MB2584.namprd11.prod.outlook.com (2603:10b6:a02:c8::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.25; Sun, 7 Feb
 2021 02:15:10 +0000
Received: from BYAPR11MB3687.namprd11.prod.outlook.com
 ([fe80::4c15:ab0f:27cd:605]) by BYAPR11MB3687.namprd11.prod.outlook.com
 ([fe80::4c15:ab0f:27cd:605%7]) with mapi id 15.20.3805.024; Sun, 7 Feb 2021
 02:15:10 +0000
Subject: Re: [oe] [meta-qt5][PATCH] qtdeclarative: overwrite do_install_ptest
To: openembedded-devel@lists.openembedded.org
References: <165F787505C8C95B.25477@lists.openembedded.org>
From: "kai" <kai.kang@windriver.com>
Message-ID: <cd831e92-c7f5-db32-f37f-61526156bd02@windriver.com>
Date: Sun, 7 Feb 2021 10:14:57 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <165F787505C8C95B.25477@lists.openembedded.org>
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HKAPR04CA0007.apcprd04.prod.outlook.com
 (2603:1096:203:d0::17) To BYAPR11MB3687.namprd11.prod.outlook.com
 (2603:10b6:a03:ff::26)
Return-Path: kai.kang@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.141] (60.247.85.82) by HKAPR04CA0007.apcprd04.prod.outlook.com (2603:1096:203:d0::17) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.19 via Frontend Transport; Sun, 7 Feb 2021 02:15:07 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 936a8baa-6ebb-4773-5c6d-08d8cb0e3199
X-MS-TrafficTypeDiagnostic: BYAPR11MB2584:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB25849C31303BD77A2F30C6E095B09@BYAPR11MB2584.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1013;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	YEgLXMNS/ISM8YB4rpXi9aYqDOS0Ui/b9svkuTt3KxeOLjkhxWLVD9yanZCthuGVRcb8w4f83041CYIO71TYbqjlDNgOUI8uv4+0CBdNEqh6uqc+S29GJWdJbPTG57AmFkOsKuAaHK8h74ljjPcn7IDzg6JOSAReCYEDk6w0vnTk2FJTuoKtfe1tkeGzzgr60lIGksK/R41oBfvL/OGXOHlnA/3pkJndVwN2QSjE5HMK5Nj8gUrs44+HTDAEB0qbcZbMULg76KyJbtcK1+AdpRHtsboGt+a33lH440yHLDWsL43LCFXBCo1xlm2XYFrve1s1gsaYr2+YGQc2iduh3MWNxy5II0obWnWUTcQ8KRxAyTbDPpzZBdgBP1Vd3fYtinUjGBhjafv9pK/8nz0hWuoL9mv3qV8zJMNTJQFArCAJ/fMbL9IDF+5Jj8okSXVFtIyPeGSrHPFQ2rG/5C44g2hz3ugoG8jg21UQHiBJOAtwEV534HgZP+fz5L2y9ir22TSqzS5n0ShbTK20mXEdNBiKNwBV8r0at/ABSjnXB01IeOHprVO1XWC5tmO673XmHffERJChJ038C98bIO3HpgmC3abOf1BU4odHgPG5Pp9YhXUh9FDrCSxV8z8hiv9OI0ppW2sgosB5GOC8o/giZnSwjXOGcXpbZUm3nSBQSQSnU62qlqHUKKhPR9YfXdvL0j7M+F08PDDWTbZ6YWLyEA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB3687.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(136003)(396003)(376002)(39830400003)(346002)(6486002)(36756003)(6706004)(86362001)(66946007)(33964004)(31686004)(6666004)(8936002)(478600001)(966005)(66476007)(31696002)(6916009)(186003)(166002)(83380400001)(956004)(53546011)(5660300002)(26005)(316002)(2906002)(16526019)(2616005)(8676002)(66556008)(52116002)(16576012)(78286007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?eG1BWTIyTllFRGVQQ3FzVDRDUHpqUVg3TFRxdTFsaEF0ZU5HV1RaL3RRZkQz?=
 =?utf-8?B?VXd0aWhxOHRWN3FjLzNRR1NYbHl2TlpFaitNY0RrNkMzdDUzZlVkWkwzSzJK?=
 =?utf-8?B?cnhJZVRHY29BN3ZieTR2Y2ZKbzgzR3RKRmllczc5bkdGVHVTRklteVpQMmNo?=
 =?utf-8?B?SlMwL2xuM0ZxeEhvd0VWZ3JKdGlXajNURlBqNThUNnV5bUZzM21DTVhhNkhq?=
 =?utf-8?B?MWs2blQ2VVVMQ0tNTHJrSFhraU90NHVLQ2VVL0pSaWxqbzRqc0J5VXlPc2tW?=
 =?utf-8?B?YnNMaVhSWFhPNEVXU0dGdDVOQlB0dXRFbnR3dmFHQVJDS0luM085YUVwVlJC?=
 =?utf-8?B?Y1RmUkVIQnpnRE5hVm04RUdpQUVZbk1FNjdSSDg4VWttL3dKeTV1VS9ydHNP?=
 =?utf-8?B?U2ZLZnVUUTBuTW9wWlhybEhWMFRUakhVdVlVMGpEZXFaMGZONjV4NU93Z3Q0?=
 =?utf-8?B?NGQ3VkFSZmQzbjdOU3hUWE9nZGhEUDJLNFlqdGdUQ2dMazNFRFl6byszNUZU?=
 =?utf-8?B?V2RhV3B5ZWdET2VwMlFpVGdlQStLdXQxK29IT2ZPdUF6ankwRWJPanN0MG1h?=
 =?utf-8?B?eSt3RnRMNWEwZmJVOEtxVkFIL2hPQjUxZDVoYUpxOG03SElGSk02aTJwbzVI?=
 =?utf-8?B?dm9ISnJSOEZzeTZGakFIcDlaOVQ4TUdFSTJueWd3cTBaOGk0d0pYd0xqbHhH?=
 =?utf-8?B?WHhlQlVEY3VBMWl5WmdYWFhQYU1KaEluZCswOTBudjVFa29WWWw2R1kxUzU2?=
 =?utf-8?B?dlE5dkVyNkVHZW9KR0dmYmZNamsrb3IzTFhqSU1HUzVDZDZzVEJUdnJlY1Jm?=
 =?utf-8?B?MmNqcklHaTlFclptNkZoNFhtWlpjQUF6KzROZXg5c0FGSDB5SzVWWlJVa3Jh?=
 =?utf-8?B?STlRTkhXMUZlQWFxcG53aXBmZ1ZBYlA1aFk3YUZtSXRHeVJTNGYzMGxYTjE2?=
 =?utf-8?B?UHA0WTRIRDN4SzJmYW9pTnhWZXFpdzVud1kyYnIyM0NXTlFjM2UvN051dTB6?=
 =?utf-8?B?ZVNzQjdMWURFaFlOK3BZTzM1VXZUQ09pMHNZL1BxNVcwOFlGS0ZMZEYrK0hD?=
 =?utf-8?B?d0h4dm5HVVBzNFRtNHVoWGZaUlkzY1N2ZmZwWEhvVWFRZzA4Q09UNGorZzM4?=
 =?utf-8?B?UXViSHM2SDJiOTVSWXU1alBWRVRLTURnWkMxSElHZFhUU0hsbXRHWjk5aFlh?=
 =?utf-8?B?QitRMkJ2QXJnS1ltMldlN3A1WkdMNk9Hc24rY3ZranRyWVVDRVp6aXpyTEFP?=
 =?utf-8?B?ZFpkblpkWjlIWDB4aUlDeVVCZ2ZoaEFFZFBoa3JrZWhFenNqSmVWd3YwZVQy?=
 =?utf-8?B?ZWZaajh5WjA0b2poU1F2NTl3K1kzSWkzU2I2U0Y1c1hUeUhmbTF4TXF5OWJQ?=
 =?utf-8?B?ZlVCMGRGUGNzVjJLM0xXV2ZENnFOMGZkMWp2Ynpod3NtQWZ4VVhWV3BpaVpi?=
 =?utf-8?B?MlBNK3pYY1ZtUE1wN3R4MTZSZ29NeVBEc2lNNERPQXFHNFgrM09JRnIwb0VB?=
 =?utf-8?B?bTdTeFp3V0ZidzlsSU1mbzBIa2xwTW1VRzd1VFU3T1lUWUNMaFkyaFJ6ejRn?=
 =?utf-8?B?djZzRWFOSGVtbkFqZXpVeFB4eW00eFFxTEYvbHlXaUFxeW9hQlV1VkFGWDZx?=
 =?utf-8?B?VlFQRXNIbHIrd3ZSVnJ4d21NeG92dHBaMmVPSS94alBzTk1KUG9zN0dUVFlL?=
 =?utf-8?B?elN6OU02Wk1lS2tNRDJLNE9uUGFpN0MwUXFRY3dwTEpvTDczQlBFWUNzdDJX?=
 =?utf-8?Q?bTWi1Jy3e2nyyQdg7AJ6KKeTrR83c+7dTUFOTcD?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 936a8baa-6ebb-4773-5c6d-08d8cb0e3199
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3687.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2021 02:15:09.8817
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sPIKSu6P7QjsCgzFjAMrNBHxCw8W8auqahEjLrngohcAg0vu19dGZgKwwkbbg88XoGIgo7UWbfF/E7Af2UEXBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2584
Content-Type: multipart/alternative;
 boundary="------------72C756E6BB7B45DED6C1DACC"
Content-Language: en-US

--------------72C756E6BB7B45DED6C1DACC
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/1/21 8:33 AM, kai wrote:
> From: Kai Kang <kai.kang@windriver.com>
>
> Overwrite and extend do_install_ptest for qtdeclarative. It fixes
> runtime errors:
>
> | FAIL!  : TestQmllint::initTestCase() '!m_dataDirectory.isEmpty()'
>             returned FALSE. ('data' directory not found)
>
> With this change, more tests have been run and the results are better:
>
> passed: 993 -> 2318
> failed: 182 -> 113

Ping.

Kai

>
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ---
>   recipes-qt/qt5/qtdeclarative_git.bb | 19 +++++++++++++++++++
>   1 file changed, 19 insertions(+)
>
> diff --git a/recipes-qt/qt5/qtdeclarative_git.bb b/recipes-qt/qt5/qtdeclarative_git.bb
> index 3ff69d6..91e239f 100644
> --- a/recipes-qt/qt5/qtdeclarative_git.bb
> +++ b/recipes-qt/qt5/qtdeclarative_git.bb
> @@ -27,6 +27,25 @@ PACKAGECONFIG[qml-debug] = "-qml-debug,-no-qml-debug"
>   PACKAGECONFIG[qml-network] = "-qml-network, -no-qml-network"
>   PACKAGECONFIG[static] = ",,qtdeclarative-native"
>   
> +do_install_ptest() {
> +    mkdir -p ${D}${PTEST_PATH}
> +    for var in `find ${B}/tests/auto/ -name tst_*`; do
> +        case=$(basename ${var})
> +        if [ -z `echo ${case} | grep '\.'` ]; then
> +            dname=$(dirname ${var})
> +            pdir=$(basename ${dname})
> +            echo ${pdir}/${case} >> ${D}${PTEST_PATH}/tst_list
> +
> +            mkdir ${D}${PTEST_PATH}/${pdir}
> +            install -m 0744 ${var} ${D}${PTEST_PATH}/${pdir}
> +            data_dir=${S}/${dname##${B}}/data
> +            if [ -d ${data_dir} ]; then
> +                cp -r ${data_dir} ${D}${PTEST_PATH}/${pdir}
> +            fi
> +        fi
> +    done
> +}
> +
>   do_install_append_class-nativesdk() {
>       # qml files not needed in nativesdk
>       rm -rf ${D}${OE_QMAKE_PATH_QML}
>
> 
>

-- 
Kai Kang
Wind River Linux


--------------72C756E6BB7B45DED6C1DACC
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 2/1/21 8:33 AM, kai wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:165F787505C8C95B.25477@lists.openembedded.org">
      <pre class="moz-quote-pre" wrap="">From: Kai Kang <a class="moz-txt-link-rfc2396E" href="mailto:kai.kang@windriver.com">&lt;kai.kang@windriver.com&gt;</a>

Overwrite and extend do_install_ptest for qtdeclarative. It fixes
runtime errors:

| FAIL!  : TestQmllint::initTestCase() '!m_dataDirectory.isEmpty()'
           returned FALSE. ('data' directory not found)

With this change, more tests have been run and the results are better:

passed: 993 -&gt; 2318
failed: 182 -&gt; 113</pre>
    </blockquote>
    <p>Ping.</p>
    <p>Kai<br>
    </p>
    <blockquote type="cite" cite="mid:165F787505C8C95B.25477@lists.openembedded.org">
      <pre class="moz-quote-pre" wrap="">

Signed-off-by: Kai Kang <a class="moz-txt-link-rfc2396E" href="mailto:kai.kang@windriver.com">&lt;kai.kang@windriver.com&gt;</a>
---
 recipes-qt/qt5/qtdeclarative_git.bb | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/recipes-qt/qt5/qtdeclarative_git.bb b/recipes-qt/qt5/qtdeclarative_git.bb
index 3ff69d6..91e239f 100644
--- a/recipes-qt/qt5/qtdeclarative_git.bb
+++ b/recipes-qt/qt5/qtdeclarative_git.bb
@@ -27,6 +27,25 @@ PACKAGECONFIG[qml-debug] = &quot;-qml-debug,-no-qml-debug&quot;
 PACKAGECONFIG[qml-network] = &quot;-qml-network, -no-qml-network&quot;
 PACKAGECONFIG[static] = &quot;,,qtdeclarative-native&quot;
 
+do_install_ptest() {
+    mkdir -p ${D}${PTEST_PATH}
+    for var in `find ${B}/tests/auto/ -name tst_*`; do
+        case=$(basename ${var})
+        if [ -z `echo ${case} | grep '\.'` ]; then
+            dname=$(dirname ${var})
+            pdir=$(basename ${dname})
+            echo ${pdir}/${case} &gt;&gt; ${D}${PTEST_PATH}/tst_list
+
+            mkdir ${D}${PTEST_PATH}/${pdir}
+            install -m 0744 ${var} ${D}${PTEST_PATH}/${pdir}
+            data_dir=${S}/${dname##${B}}/data
+            if [ -d ${data_dir} ]; then
+                cp -r ${data_dir} ${D}${PTEST_PATH}/${pdir}
+            fi
+        fi
+    done
+}
+
 do_install_append_class-nativesdk() {
     # qml files not needed in nativesdk
     rm -rf ${D}${OE_QMAKE_PATH_QML}
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
    <p><br>
    </p>
    <pre class="moz-signature" cols="72">-- 
Kai Kang
Wind River Linux</pre>
  </body>
</html>

--------------72C756E6BB7B45DED6C1DACC--
