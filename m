Received: from NAM12-DM6-obe.outbound.protection.outlook.com (NAM12-DM6-obe.outbound.protection.outlook.com [40.107.243.40])
 by mx.groups.io with SMTP id smtpd.web10.60594.1594050268041310356
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Jul 2020 08:44:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=Wm/cLyTB;
 spf=pass (domain: windriver.com, ip: 40.107.243.40, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nc5CVBcO5SxM8aCLbf38aTeJgM+W5wnFK5R7c7RMqEqeXpnZCiIceUawfkcFGuJv/z/fnPMdpylXSLkVhQcmmAfR3jNNDTBGQrJHJutQVYBWilv4FVv1KNU+ttlxeSelhRhYfnWmCREUOAUHgD3vegwmSf8tQIihg6rUNwx4cRlYwzM0b3DxmSLsi3FuyDPc7uRWuJZgYqHeYpxDHFxSh+KSbE26pzx0lKW/btjx4EeXMp7RxMUTM2mekqvdjBGCQdYJ9EGb+taxjWxQtF3tV7p4HHgRlaH8iRAt+3GDdAxJXqUJxC21h5CUEkjyR62yeQ/3LSP/9r2WNzOB3pA1Sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vsxbZc1J+TQgSbxhNyQUMyD+5jETAQwdxw83n2ICRlA=;
 b=D1pJ64DyATCkCH1J2lfJBGxhM5PNNLLhSo+mZv7oWX/d1xRVH/PBStQPljA4Kb/qSuJCRl5Cu6IB8ciygvUsOQ6gw1XD28cYyJgSdI6hjyZJaBqnC837s09JRWi0vtaBuSKCHKddsKd2EShE/YwLdZdtm6vd5QkVQc1a1SKpA13CpdDWliL37n2B3GwUYmS2VfrrzTlSZ1II0mtpXef9p/fmabyaE9dBvGkkTvJ+RrsqFJyBvQESlCv7pDAHhNNjNBQ0KlOo+coeTGhVcSZLHCpNA8OrOCem+gZ+8LbhP0jUz3R5l221uFuONc6A19JtmLRELwM86F/AmJdrsvyXBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vsxbZc1J+TQgSbxhNyQUMyD+5jETAQwdxw83n2ICRlA=;
 b=Wm/cLyTBksJFpnsX/AjtMtW3/54D30FtunryXSuSHarbZOf1+Jy6NMVDrwnjLLo2v/IBqPd+L9FXiP2RThVQeLnc3tvC2iP90AvCyDM6AzCkI5f+RGsxqBi7Sg90+UUenVxeFFi5gvmZdJ1M0w4D9LUUQmPRNTqb2RIKy9Oovzo=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from DM5PR11MB0011.namprd11.prod.outlook.com (2603:10b6:4:6b::29) by
 DM6PR11MB3275.namprd11.prod.outlook.com (2603:10b6:5:5e::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3153.23; Mon, 6 Jul 2020 15:44:27 +0000
Received: from DM5PR11MB0011.namprd11.prod.outlook.com
 ([fe80::c970:4bd8:f35c:d6d2]) by DM5PR11MB0011.namprd11.prod.outlook.com
 ([fe80::c970:4bd8:f35c:d6d2%5]) with mapi id 15.20.3153.029; Mon, 6 Jul 2020
 15:44:27 +0000
Subject: Re: [oe] [meta-python][PATCH 01/10] python3-importlib-metadata: Upgrade 1.6.1 -> 1.7.0
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200703093020.3514-1-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <795b1df7-ebdb-e109-3e8e-cbd6368b29d9@windriver.com>
Date: Mon, 6 Jul 2020 11:44:25 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200703093020.3514-1-leon.anavi@konsulko.com>
X-ClientProxiedBy: YT1PR01CA0152.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2f::31) To DM5PR11MB0011.namprd11.prod.outlook.com
 (2603:10b6:4:6b::29)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.30] (174.115.236.231) by YT1PR01CA0152.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2f::31) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.21 via Frontend Transport; Mon, 6 Jul 2020 15:44:26 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ee9ed102-f382-4f3a-b460-08d821c376bc
X-MS-TrafficTypeDiagnostic: DM6PR11MB3275:
X-Microsoft-Antispam-PRVS: 
	<DM6PR11MB3275A7271E96469ABF81B05C9F690@DM6PR11MB3275.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1850;
X-Forefront-PRVS: 04569283F9
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	PI9nNiTQES8/JM6DnLg0bccobYQS7a3P82v3DfkDq+0JcG/UaDzJJQI2jJ9ZALibpkx1RUPuTDv9v7vLG1E2eCCYSt/vw18xEobnlZmkfkuGG0T628s0cg2Qdx+4weQ/+7VNIrXgW297/+nRamvgo5taUz8bdiOCVU0pheZCOYjhWEE0NlQ97nmVOjUYf8ryiGtjnpZetAYeIksfQ4AWnYp7wANToqJ3Dc4THQxWVephAX3H5jn9jq5gtYiIF/DcdgB4mteYL8xgOXm7fGbItblERzMCGmr7cnAbdcgXHZJI3W7MDduT/fyV0vv+WN1FhFo4cROf8okplHoeRDCiZ+7hIR9sl3oeIbLC2lAPBFvP15QQ1wG5zmwmFfOucVFFNIa0dmVXvODzrFY246eg5zPr1k8P+6zyYDF09dDQy12CFt6A01zTix8TBCzNMzFbUTfnNyFfrNUHT5WvF5AIBA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR11MB0011.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(136003)(346002)(376002)(366004)(39850400004)(396003)(33964004)(16576012)(36756003)(26005)(8936002)(8676002)(316002)(31696002)(6486002)(16526019)(86362001)(2616005)(83380400001)(44832011)(186003)(956004)(2906002)(166002)(66946007)(52116002)(31686004)(66556008)(66476007)(5660300002)(53546011)(478600001)(966005)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	9aLVcl+qfcruJ3DYRAhtKOB/bWqtjyhrnRlo8EbJPCeoaiajF7VJGqryATDUHnouEWsz23z1eT0UJ6msaqe6MmPFZpuyrqg3ways9FvBwAFDH0AzPH9odzsu+T8G136sMMtdE95psorMt342MRb4VYuEd/g8ES4krrGHtakolJ4gxzQQa9mSbQxFQPqZHWN61192fx9yJegzjC5KBYyiD69yZmVa4UE8j4LURCMyUi4+gn6ixiDsRZ54y15mCGIn2Hr4y8QeiUqgWtPu6lEQ8aARBuNYBUt6iR38Dj9UoApdAJ57qAoW/vXkRcn2WorN0NyWWx6RtGUIi5xPwm0KbItCwRG9qLXgOJPGgKB8lgSjwpypYqYktwxCjdOLhtBM3Ul/g7YfddJK3zIPAdd4D4XGo/AS14QSqhi2lEQsNnTDIDnpcAjJJZ+308fG62A7vdUgvL5tbXfwy/bxhG/EGnnsnIUx4ydytvzh2Zo5eLzNVZYGstaqUfowCPASRoXG
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee9ed102-f382-4f3a-b460-08d821c376bc
X-MS-Exchange-CrossTenant-AuthSource: DM5PR11MB0011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2020 15:44:27.1660
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lrw52zWuPYel+gSVNJXrZlITF7xGkYyZnV55qGNNgUYuNnM3L39sXXZf894asGetZ0unE6efkFUnRSPVbZX2WjZfRDaQaZvF6jWO2w53lhk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3275
Content-Type: multipart/alternative;
 boundary="------------61C2B4B700978657E9D2A262"
Content-Language: en-US

--------------61C2B4B700978657E9D2A262
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 7/3/20 5:30 AM, Leon Anavi wrote:
> Upgrade to release 1.7.0:
>
> - PathNotFoundError now has a custom __str__ mentioning
>    "package metadata" being missing to help guide users to the cause
>     when the package is installed but no metadata is present.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...etadata_1.6.1.bb => python3-importlib-metadata_1.7.0.bb} | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-importlib-metadata_1.6.1.bb => python3-importlib-metadata_1.7.0.bb} (64%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-importlib-metadata_1.6.1.bb b/meta-python/recipes-devtools/python/python3-importlib-metadata_1.7.0.bb
> similarity index 64%
> rename from meta-python/recipes-devtools/python/python3-importlib-metadata_1.6.1.bb
> rename to meta-python/recipes-devtools/python/python3-importlib-metadata_1.7.0.bb
> index c46df8fcdc..de0fc78368 100644
> --- a/meta-python/recipes-devtools/python/python3-importlib-metadata_1.6.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-importlib-metadata_1.7.0.bb
> @@ -5,10 +5,10 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=e88ae122f3925d8bde8319060f2ddb8e"
>   
>   inherit pypi setuptools3
>   
> -SRC_URI = "https://files.pythonhosted.org/packages/aa/9a/8483b77e2decd95963d7e34bc9bc91a26e71fd89b57d8cf978ca24747c7f/importlib_metadata-1.6.1.tar.gz"
> +SRC_URI = "https://files.pythonhosted.org/packages/e2/ae/0b037584024c1557e537d25482c306cf6327b5a09b6c4b893579292c1c38/importlib_metadata-1.7.0.tar.gz"
>   S = "${WORKDIR}/importlib_metadata-${PV}"
> -SRC_URI[md5sum] = "38f795ac13abc923acfd3da06263eb8f"
> -SRC_URI[sha256sum] = "0505dd08068cfec00f53a74a0ad927676d7757da81b7436a6eefe4c7cf75c545"
> +SRC_URI[md5sum] = "4505ea85600cca1e693a4f8f5dd27ba8"
> +SRC_URI[sha256sum] = "90bb658cdbbf6d1735b6341ce708fc7024a3e14e99ffdc5783edea9f9b077f83"
>   
>   DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
>   RDEPENDS_${PN} += "${PYTHON_PN}-zipp ${PYTHON_PN}-pathlib2"
>
> 

--------------61C2B4B700978657E9D2A262
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 7/3/20 5:30 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200703093020.3514-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 1.7.0:

- PathNotFoundError now has a custom __str__ mentioning
  &quot;package metadata&quot; being missing to help guide users to the cause
   when the package is installed but no metadata is present.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200703093020.3514-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...etadata_1.6.1.bb =&gt; python3-importlib-metadata_1.7.0.bb} | 6 &#43;&#43;&#43;---
 1 file changed, 3 insertions(&#43;), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-importlib-metadata_1.6.1.bb =&gt; python3-importlib-metadata_1.7.0.bb} (64%)

diff --git a/meta-python/recipes-devtools/python/python3-importlib-metadata_1.6.1.bb b/meta-python/recipes-devtools/python/python3-importlib-metadata_1.7.0.bb
similarity index 64%
rename from meta-python/recipes-devtools/python/python3-importlib-metadata_1.6.1.bb
rename to meta-python/recipes-devtools/python/python3-importlib-metadata_1.7.0.bb
index c46df8fcdc..de0fc78368 100644
--- a/meta-python/recipes-devtools/python/python3-importlib-metadata_1.6.1.bb
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-importlib-metadata_1.7.0.bb
@@ -5,10 &#43;5,10 @@ LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=e88ae122f3925d8bde8319060f2ddb8e">&quot;file://LICENSE;md5=e88ae122f3925d8bde8319060f2ddb8e&quot;</a>
 
 inherit pypi setuptools3
 
-SRC_URI = <a class="moz-txt-link-rfc2396E" href="https://files.pythonhosted.org/packages/aa/9a/8483b77e2decd95963d7e34bc9bc91a26e71fd89b57d8cf978ca24747c7f/importlib_metadata-1.6.1.tar.gz">&quot;https://files.pythonhosted.org/packages/aa/9a/8483b77e2decd95963d7e34bc9bc91a26e71fd89b57d8cf978ca24747c7f/importlib_metadata-1.6.1.tar.gz&quot;</a>
&#43;SRC_URI = <a class="moz-txt-link-rfc2396E" href="https://files.pythonhosted.org/packages/e2/ae/0b037584024c1557e537d25482c306cf6327b5a09b6c4b893579292c1c38/importlib_metadata-1.7.0.tar.gz">&quot;https://files.pythonhosted.org/packages/e2/ae/0b037584024c1557e537d25482c306cf6327b5a09b6c4b893579292c1c38/importlib_metadata-1.7.0.tar.gz&quot;</a>
 S = &quot;${WORKDIR}/importlib_metadata-${PV}&quot;
-SRC_URI[md5sum] = &quot;38f795ac13abc923acfd3da06263eb8f&quot;
-SRC_URI[sha256sum] = &quot;0505dd08068cfec00f53a74a0ad927676d7757da81b7436a6eefe4c7cf75c545&quot;
&#43;SRC_URI[md5sum] = &quot;4505ea85600cca1e693a4f8f5dd27ba8&quot;
&#43;SRC_URI[sha256sum] = &quot;90bb658cdbbf6d1735b6341ce708fc7024a3e14e99ffdc5783edea9f9b077f83&quot;
 
 DEPENDS &#43;= &quot;${PYTHON_PN}-setuptools-scm-native&quot;
 RDEPENDS_${PN} &#43;= &quot;${PYTHON_PN}-zipp ${PYTHON_PN}-pathlib2&quot;
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------61C2B4B700978657E9D2A262--
