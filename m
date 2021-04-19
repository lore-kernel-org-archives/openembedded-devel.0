Received: from NAM02-DM3-obe.outbound.protection.outlook.com (NAM02-DM3-obe.outbound.protection.outlook.com [40.107.95.71])
 by mx.groups.io with SMTP id smtpd.web08.912.1618849609259401192
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Apr 2021 09:26:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=WbSamk4f;
 spf=pass (domain: windriver.com, ip: 40.107.95.71, mailfrom: stefan.ghinea@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dw227VRVEPsyJDUocPWKQUf1Wpxvj2M9Q8W1mWY0QzPHnyZdp7Gy6FcTOcvaADuDLw7JlMLnMqcLoTALWbWuAMspYbzKVvBVR+qOZleEMQm9HyvqLuNE2o/EsyQbPThegkA22h4XLt9GO4avgAvwFWuoH/otbChozCZioRtmaYhNO7duEoa5ja33GnCIzlo1i148or8OSji8fIQmY0dWVCp5dh+ZSuu/ytdUESkbQIFdfzFNMMNw7zVtF06vDOPXMUzpm8ub4ekIljeKo6N9omU0dUPFfNH9DAHw2JvaYZI8VtQw/5N3FvbpD9Vro4YfkMHLMPE0yljCWoXstemRkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OGPaPOc8lOjRpcKvx2q2qlXF5/vVgwW0XGBUYsAFz+E=;
 b=a8Vs+kSPrsKKweTeWfXm5+ML5FBtVFa/hFSz05EBWKZc4Oa7Vt/KHx00wSBtrDHtdoANYJRFJfIBv+FMnwWfA9uUgX+HQh477bXfC9j8y+HKEMJUR0WeWhmz3UewT8hpmDp0pBm2SAL7fwWpp2vRT8qdh4RUssN4s2/Ws4o1HwfDSsKkTcAxEEvq99sQGe9addvWgQtjKHFUr3a+R/qFvMFlYfcNbvN3fwe1iVLrzyuMRNHUEzLQ5TXNNNV2ID4hYWNJHNmTSkyhi5vFK0RwFL/b+BwMSL00uSO1Ima0pH4/klBlfThtoAw++eXJ+V4Z1MPteSFDvrv262xpIh0SJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OGPaPOc8lOjRpcKvx2q2qlXF5/vVgwW0XGBUYsAFz+E=;
 b=WbSamk4ftO9GK5utbhXiG5soNhgJzV2KFNHf6QyMIYMKavd5ignGuSk3NPLZrbHrhq+oMr6wwnnb9IEaSqvK+c1JJneGzHxzljGwequaoQmDUB1QRd04hUQpD4512/w68HUwTHh/whYr/jb/ZNZSV5oy42rZNk75x18nGKjNzoU=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from SJ0PR11MB4989.namprd11.prod.outlook.com (2603:10b6:a03:2d9::22)
 by BY5PR11MB4134.namprd11.prod.outlook.com (2603:10b6:a03:18e::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.19; Mon, 19 Apr
 2021 16:26:46 +0000
Received: from SJ0PR11MB4989.namprd11.prod.outlook.com
 ([fe80::7037:7346:6da2:e8cb]) by SJ0PR11MB4989.namprd11.prod.outlook.com
 ([fe80::7037:7346:6da2:e8cb%7]) with mapi id 15.20.4042.024; Mon, 19 Apr 2021
 16:26:46 +0000
Subject: Re: [oe] [PATCH] [oe-devel] [meta-python] python3-django: fix CVE-2021-28658
To: akuster808 <akuster808@gmail.com>,
 openembedded-devel@lists.openembedded.org
References: <20210416152417.26659-1-stefan.ghinea@windriver.com>
 <aab4ed03-1301-99c0-c3fc-3cb051f1fad6@gmail.com>
From: "Stefan Ghinea" <stefan.ghinea@windriver.com>
Organization: WindRiver
Message-ID: <30de691a-714e-1e9e-4684-e147abda3e05@windriver.com>
Date: Mon, 19 Apr 2021 19:26:37 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <aab4ed03-1301-99c0-c3fc-3cb051f1fad6@gmail.com>
X-Originating-IP: [89.137.231.29]
X-ClientProxiedBy: VI1PR06CA0180.eurprd06.prod.outlook.com
 (2603:10a6:803:c8::37) To SJ0PR11MB4989.namprd11.prod.outlook.com
 (2603:10b6:a03:2d9::22)
Return-Path: stefan.ghinea@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.213] (89.137.231.29) by VI1PR06CA0180.eurprd06.prod.outlook.com (2603:10a6:803:c8::37) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.16 via Frontend Transport; Mon, 19 Apr 2021 16:26:45 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4fd6841d-8183-4a7d-7676-08d9034fecaf
X-MS-TrafficTypeDiagnostic: BY5PR11MB4134:
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB41348788F00149D4F2173144F2499@BY5PR11MB4134.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3513;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	MJ1vBLcN3t/DsR5g+CFBGcFpvwiVLplEaL1Ordd4rmmCKUoG5an1XGYkxyB6RDgEwqxtbvU2QF2Y57c2CaWgfevcTRF5ojhVnorbhNHNVmFUxcN2H+XCummaCZL4y/6unlvmKtKjvuYss4kCVudiq+Jh38OwhBMPQ8XvkZupjjzT0l3Zgui4R1XMYmXgQKVASY49kS9uPij8Dl7udRXJ8BeSoSzGGHL6QeisdaQYIVYd8PbH+ZPw3vV1kZTKZ+9kaeAzKTjSWmL8dDWFEHvjeWCD5D2CWZzKpEA7PEaFJnnSeOBzhw9Pxm0boTM0D+XdcqbJ9jRzwTBAcu0WQfJxr+KbYV0h9kLTnEIxmvl4O0S4MuX9FtVtpuBW6ql+QkO3SyhAlR03+4b7E6NTnxhssxJs04XRdyd7nJA6FmQ9Bem62aegXMf9Q3G2m6kqNmOIQK8BhskA788c2vc9fcFsOlAFiHRK4LCfKRG5y7jFrs2bZjov2laW0o+cTl7MCB+6OROPj2TveWPOfp8v6diLEs+4J2Xukqe+PEgcWYCeAuaDyU6NjDVQ6P52l/XmaqkYR6ZX3vFKGcqij58LjJhtlr2/mnjmjjcp0Fp8gfzEzENXJX8LkgNV1+W5f1O+iv2/rmMrq2Q/X/+k9Ct6wZOLyfN9DqMNT/DvqmTbmRQ+KvL6NRH+lobzeFhvxdJRPs1WuEXKas7D64XB++aUA0C1ubbhN+A521ZLJdQOOuG/bO2B6BKPbaXejD2e9uwe3jPygf2hzJhjse8/QmCV9X/iTHShC++C5W7d1Qw3YeKcf6YKQpVOA5yFoghk/D80fy0K
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB4989.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(346002)(366004)(136003)(39850400004)(376002)(31686004)(52116002)(36916002)(66946007)(66556008)(316002)(66574015)(83380400001)(66476007)(16576012)(6486002)(31696002)(53546011)(478600001)(956004)(33964004)(186003)(5660300002)(86362001)(8936002)(16526019)(166002)(30864003)(26005)(8676002)(38350700002)(2906002)(6666004)(38100700002)(966005)(2616005)(36756003)(43740500002)(45980500001)(473944003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?WXBrY0xuR01oaXZPMk00cXQ3bnNqZXVTc0w3c3FOZDZhOXdjVGFFRVVkWk5w?=
 =?utf-8?B?REtLTlVlQy9lNW0veWtmQUVGTms2c3RMb2dRaWE5MENIRTh2bFlRWVdBbDd1?=
 =?utf-8?B?U0ZmU1BReUJuTVY0RWl2cEpORWRLV3BSaUhRNVIvYlBvNDhQL2VxYlVHVnJW?=
 =?utf-8?B?ZUlhVVRrNDJUbUVYY3lVbHRLckdnQ3ptK0JzY0hoZjRURHNpSkNBZGRaSUVw?=
 =?utf-8?B?YmhnTkE1VVBNb2l5SllwL1VpbTR1bGF2cVZCSytQVi8waDFLSTlFQ2xTTWU1?=
 =?utf-8?B?N3J3ZWlsU3p3UnhaTTNSOExVSDgrSXNDL1Z0dXdmdTE5N21ZOFQzMFk5UDBx?=
 =?utf-8?B?QTVWVmNzb0s1b0JEdUdjV1YrbHZWMzFVMFU4R2V2TG54Ui92WHNLdysyR0Fp?=
 =?utf-8?B?YkUxNW1XTEZQNlhxZHpyZlVPM0p3S09tQ0crSVNGK0psY0xKbGwwMi8vQklB?=
 =?utf-8?B?VmhQaG5UdGo0NG03L2Zjb3hCcjBNendSZTdvNWowTUN4ZXZlVmVPb2htcVJL?=
 =?utf-8?B?UkRIaXBNdUs5SzFHc0NUaWQxNmFjSWY1bURySGo4VjBwbExtaHhJdFdnd3Zs?=
 =?utf-8?B?RUJUSmJTNEU0RGVqUTZnNTZmcjA0UjF1Um5aYkxjWGJZbzh6RU13MSs5ZmNR?=
 =?utf-8?B?UzZRdnpPZE5OcDdSWTFSblFkSVdYOVUzaVBKbURranVqUDVsbjZ3a0FxeXl0?=
 =?utf-8?B?N3grNU51T3hPTml6ZnU2RDduMlRCZVdTQ25tYnM4RHVIamcvMXI2cGttKzF1?=
 =?utf-8?B?WEpvQ0xBNXY5ZmNXRlVmejQ3d3AyRDVVa3JKKzlQUWhkREJEVzE2UnJTODVZ?=
 =?utf-8?B?TzRocWR0U1RmNE1iUjhkUzcyaHZtZkMyelIzZVpBbStZQ01rTEFWOUdsdzVH?=
 =?utf-8?B?NHcyWm8wUHlJT3lvaGlTdExKcVJSNDE4R0drTVV6MXRaSGtFODBEMW5XWFFW?=
 =?utf-8?B?WXpIdjJRUDhERTRUTmlZVyttYWZQam5Pb2ZSb1U0NkN1VURnN1htV3Z0U3pV?=
 =?utf-8?B?QkVldkNYT1VQQnhCTm5jMkdraVc4aVBqank3Wk1qU1ZUa0RJUGdXaDVVZmpn?=
 =?utf-8?B?S2doamdpbk1KNGNyT0VxMVQzOGQ2Umw2UldKTWpvN3BIS09iNDlJUE82TEhU?=
 =?utf-8?B?aE9zVnZCME5rcWJ2eEJyc09ja0NqTFFoNkdEa3VoMkZiSGJlT2ZzNUtyQlI5?=
 =?utf-8?B?ZW5vVGV4aHI1UWdGOGVUMFh4VFNpem9lWU10N0psZ0tSYjZOdHB3WFJFcmVv?=
 =?utf-8?B?U09KVUh0S1hTdGtNU1dBcHQzRm12TjhzUG05a25WOStHQlRmalljZGE4R0wr?=
 =?utf-8?B?WDYvR05RbmNtWFJtRjhCOUxqMjBSSkRTTkVvZkhWeU8vWlJ2TUlFTm1xWGhK?=
 =?utf-8?B?cVBsWVpuZWo3UCtrdUp0dDd3WmtYSTloUWV2L0pOcndaSzFLU09rZHlJS1Rt?=
 =?utf-8?B?QnhubVF2MjVya01CVnZvQVZJWExocTNqRytaZHJveXZtMzNrYTZwczFJRkdB?=
 =?utf-8?B?OS9rbnRibGpyZjNkcDMrMkNFNnlTcGJCUG5ZZmZ6QTJUbkZBNjNtTklyamxq?=
 =?utf-8?B?OFM4d0lCdU1PWTU5angzdzRGa1NwZm5hcm03ZVlWRXU0QzMxNGRjR1l6TEpL?=
 =?utf-8?B?b3c1V2NDQktDblliQWMzRDhzU0wxS2k5TjJJUVNJTCszcjhEKzI3RGVxNll2?=
 =?utf-8?B?SVpSc2VrRmh4VVFib21uSk5SeGNNUmJiSVp3R0dRN0tjaVdvS1o4eHBHN2FV?=
 =?utf-8?Q?Sdd9GZrzlLryVOanl+J1u/uFDpvnqNtLHeTt/d3?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4fd6841d-8183-4a7d-7676-08d9034fecaf
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4989.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2021 16:26:46.1043
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 98jQKoj+I65ofPwBMpFSSanpPtwqzaQ0i0m91MgcUaA8gVC/umnTSFBvMJ1usjCWrRuk2XjcCMhN6JlN/HDhKn9q5WgMxZEY1UxMAep1eF0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4134
Content-Type: multipart/alternative;
 boundary="------------9123DDBC90943579A939FD0C"
Content-Language: en-US

--------------9123DDBC90943579A939FD0C
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Hello Armin,

 From my understanding 2.2.x is a LTS release with extended support until April 2022.
Reference:
https://www.djangoproject.com/download/#supported-versions

Best regards,
Stefan

On 4/17/21 02:50, akuster808 wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
> Hello Stehan,
>
> On 4/16/21 8:24 AM, Stefan Ghinea wrote:
>> In Django 2.2 before 2.2.20, 3.0 before 3.0.14, and 3.1 before 3.1.8,
>> MultiPartParser allowed directory traversal via uploaded files with
>> suitably crafted file names. Built-in upload handlers were not affected
>> by this vulnerability.
>>
>> References:
>> https://nvd.nist.gov/vuln/detail/CVE-2021-28658
> Thank you for sending a security fix for this recipe. Do you happen to
> know if the 2.2.x  is an LTS or bugfix only branch?
>
> - Armin
>> Upstream patches:
>> https://github.com/django/django/commit/4036d62bda0e9e9f6172943794b744a454ca49c2
>>
>> Signed-off-by: Stefan Ghinea <stefan.ghinea@windriver.com>
>> ---
>>   .../CVE-2021-28658.patch                      | 289 ++++++++++++++++++
>>   .../python/python3-django_2.2.16.bb           |   2 +
>>   2 files changed, 291 insertions(+)
>>   create mode 100644 meta-python/recipes-devtools/python/python3-django-2.2.16/CVE-2021-28658.patch
>>
>> diff --git a/meta-python/recipes-devtools/python/python3-django-2.2.16/CVE-2021-28658.patch b/meta-python/recipes-devtools/python/python3-django-2.2.16/CVE-2021-28658.patch
>> new file mode 100644
>> index 000000000..325aa0042
>> --- /dev/null
>> +++ b/meta-python/recipes-devtools/python/python3-django-2.2.16/CVE-2021-28658.patch
>> @@ -0,0 +1,289 @@
>> +From 4036d62bda0e9e9f6172943794b744a454ca49c2 Mon Sep 17 00:00:00 2001
>> +From: Mariusz Felisiak <felisiak.mariusz@gmail.com>
>> +Date: Tue, 16 Mar 2021 10:19:00 +0100
>> +Subject: [PATCH] Fixed CVE-2021-28658 -- Fixed potential directory-traversal
>> + via uploaded files.
>> +
>> +Thanks Claude Paroz for the initial patch.
>> +Thanks Dennis Brinkrolf for the report.
>> +
>> +Backport of d4d800ca1addc4141e03c5440a849bb64d1582cd from main.
>> +
>> +Upstream-Status: Backport
>> +CVE: CVE-2021-28658
>> +
>> +Reference to upstream patch:
>> +[https://github.com/django/django/commit/4036d62bda0e9e9f6172943794b744a454ca49c2]
>> +
>> +[SG: Adapted stable/2.2.x patch for 2.2.16]
>> +Signed-off-by: Stefan Ghinea <stefan.ghinea@windriver.com>
>> +---
>> + django/http/multipartparser.py      | 13 ++++--
>> + docs/releases/2.2.16.txt            | 12 +++++
>> + tests/file_uploads/tests.py         | 72 ++++++++++++++++++++++-------
>> + tests/file_uploads/uploadhandler.py | 31 +++++++++++++
>> + tests/file_uploads/urls.py          |  1 +
>> + tests/file_uploads/views.py         | 12 ++++-
>> + 6 files changed, 120 insertions(+), 21 deletions(-)
>> +
>> +diff --git a/django/http/multipartparser.py b/django/http/multipartparser.py
>> +index f6f12ca..5a9cca8 100644
>> +--- a/django/http/multipartparser.py
>> ++++ b/django/http/multipartparser.py
>> +@@ -7,6 +7,7 @@ file upload handlers for processing.
>> + import base64
>> + import binascii
>> + import cgi
>> ++import os
>> + from urllib.parse import unquote
>> +
>> + from django.conf import settings
>> +@@ -205,7 +206,7 @@ class MultiPartParser:
>> +                     file_name = disposition.get('filename')
>> +                     if file_name:
>> +                         file_name = force_text(file_name, encoding, errors='replace')
>> +-                        file_name = self.IE_sanitize(unescape_entities(file_name))
>> ++                        file_name = self.sanitize_file_name(file_name)
>> +                     if not file_name:
>> +                         continue
>> +
>> +@@ -293,9 +294,13 @@ class MultiPartParser:
>> +                 self._files.appendlist(force_text(old_field_name, self._encoding, errors='replace'), file_obj)
>> +                 break
>> +
>> +-    def IE_sanitize(self, filename):
>> +-        """Cleanup filename from Internet Explorer full paths."""
>> +-        return filename and filename[filename.rfind("\\") + 1:].strip()
>> ++    def sanitize_file_name(self, file_name):
>> ++        file_name = unescape_entities(file_name)
>> ++        # Cleanup Windows-style path separators.
>> ++        file_name = file_name[file_name.rfind('\\') + 1:].strip()
>> ++        return os.path.basename(file_name)
>> ++
>> ++    IE_sanitize = sanitize_file_name
>> +
>> +     def _close_files(self):
>> +         # Free up all file handles.
>> +diff --git a/docs/releases/2.2.16.txt b/docs/releases/2.2.16.txt
>> +index 31231fb..4b7021b 100644
>> +--- a/docs/releases/2.2.16.txt
>> ++++ b/docs/releases/2.2.16.txt
>> +@@ -2,6 +2,18 @@
>> + Django 2.2.16 release notes
>> + ===========================
>> +
>> ++*April 6, 2021*
>> ++
>> ++Backported from Django 2.2.20 a fix for a security issue.
>> ++
>> ++CVE-2021-28658: Potential directory-traversal via uploaded files
>> ++================================================================
>> ++
>> ++``MultiPartParser`` allowed directory-traversal via uploaded files with
>> ++suitably crafted file names.
>> ++
>> ++Built-in upload handlers were not affected by this vulnerability.
>> ++
>> + *September 1, 2020*
>> +
>> + Django 2.2.16 fixes two security issues and two data loss bugs in 2.2.15.
>> +diff --git a/tests/file_uploads/tests.py b/tests/file_uploads/tests.py
>> +index ea4976d..2a08d1b 100644
>> +--- a/tests/file_uploads/tests.py
>> ++++ b/tests/file_uploads/tests.py
>> +@@ -22,6 +22,21 @@ UNICODE_FILENAME = 'test-0123456789_中文_Orléans.jpg'
>> + MEDIA_ROOT = sys_tempfile.mkdtemp()
>> + UPLOAD_TO = os.path.join(MEDIA_ROOT, 'test_upload')
>> +
>> ++CANDIDATE_TRAVERSAL_FILE_NAMES = [
>> ++    '/tmp/hax0rd.txt',          # Absolute path, *nix-style.
>> ++    'C:\\Windows\\hax0rd.txt',  # Absolute path, win-style.
>> ++    'C:/Windows/hax0rd.txt',    # Absolute path, broken-style.
>> ++    '\\tmp\\hax0rd.txt',        # Absolute path, broken in a different way.
>> ++    '/tmp\\hax0rd.txt',         # Absolute path, broken by mixing.
>> ++    'subdir/hax0rd.txt',        # Descendant path, *nix-style.
>> ++    'subdir\\hax0rd.txt',       # Descendant path, win-style.
>> ++    'sub/dir\\hax0rd.txt',      # Descendant path, mixed.
>> ++    '../../hax0rd.txt',         # Relative path, *nix-style.
>> ++    '..\\..\\hax0rd.txt',       # Relative path, win-style.
>> ++    '../..\\hax0rd.txt',        # Relative path, mixed.
>> ++    '..&#x2F;hax0rd.txt',       # HTML entities.
>> ++]
>> ++
>> +
>> + @override_settings(MEDIA_ROOT=MEDIA_ROOT, ROOT_URLCONF='file_uploads.urls', MIDDLEWARE=[])
>> + class FileUploadTests(TestCase):
>> +@@ -205,22 +220,8 @@ class FileUploadTests(TestCase):
>> +         # a malicious payload with an invalid file name (containing os.sep or
>> +         # os.pardir). This similar to what an attacker would need to do when
>> +         # trying such an attack.
>> +-        scary_file_names = [
>> +-            "/tmp/hax0rd.txt",          # Absolute path, *nix-style.
>> +-            "C:\\Windows\\hax0rd.txt",  # Absolute path, win-style.
>> +-            "C:/Windows/hax0rd.txt",    # Absolute path, broken-style.
>> +-            "\\tmp\\hax0rd.txt",        # Absolute path, broken in a different way.
>> +-            "/tmp\\hax0rd.txt",         # Absolute path, broken by mixing.
>> +-            "subdir/hax0rd.txt",        # Descendant path, *nix-style.
>> +-            "subdir\\hax0rd.txt",       # Descendant path, win-style.
>> +-            "sub/dir\\hax0rd.txt",      # Descendant path, mixed.
>> +-            "../../hax0rd.txt",         # Relative path, *nix-style.
>> +-            "..\\..\\hax0rd.txt",       # Relative path, win-style.
>> +-            "../..\\hax0rd.txt"         # Relative path, mixed.
>> +-        ]
>> +-
>> +         payload = client.FakePayload()
>> +-        for i, name in enumerate(scary_file_names):
>> ++        for i, name in enumerate(CANDIDATE_TRAVERSAL_FILE_NAMES):
>> +             payload.write('\r\n'.join([
>> +                 '--' + client.BOUNDARY,
>> +                 'Content-Disposition: form-data; name="file%s"; filename="%s"' % (i, name),
>> +@@ -240,7 +241,7 @@ class FileUploadTests(TestCase):
>> +         response = self.client.request(**r)
>> +         # The filenames should have been sanitized by the time it got to the view.
>> +         received = response.json()
>> +-        for i, name in enumerate(scary_file_names):
>> ++        for i, name in enumerate(CANDIDATE_TRAVERSAL_FILE_NAMES):
>> +             got = received["file%s" % i]
>> +             self.assertEqual(got, "hax0rd.txt")
>> +
>> +@@ -518,6 +519,36 @@ class FileUploadTests(TestCase):
>> +         # shouldn't differ.
>> +         self.assertEqual(os.path.basename(obj.testfile.path), 'MiXeD_cAsE.txt')
>> +
>> ++    def test_filename_traversal_upload(self):
>> ++        os.makedirs(UPLOAD_TO, exist_ok=True)
>> ++        self.addCleanup(shutil.rmtree, MEDIA_ROOT)
>> ++        file_name = '..&#x2F;test.txt',
>> ++        payload = client.FakePayload()
>> ++        payload.write(
>> ++            '\r\n'.join([
>> ++                '--' + client.BOUNDARY,
>> ++                'Content-Disposition: form-data; name="my_file"; '
>> ++                'filename="%s";' % file_name,
>> ++                'Content-Type: text/plain',
>> ++                '',
>> ++                'file contents.\r\n',
>> ++                '\r\n--' + client.BOUNDARY + '--\r\n',
>> ++            ]),
>> ++        )
>> ++        r = {
>> ++            'CONTENT_LENGTH': len(payload),
>> ++            'CONTENT_TYPE': client.MULTIPART_CONTENT,
>> ++            'PATH_INFO': '/upload_traversal/',
>> ++            'REQUEST_METHOD': 'POST',
>> ++            'wsgi.input': payload,
>> ++        }
>> ++        response = self.client.request(**r)
>> ++        result = response.json()
>> ++        self.assertEqual(response.status_code, 200)
>> ++        self.assertEqual(result['file_name'], 'test.txt')
>> ++        self.assertIs(os.path.exists(os.path.join(MEDIA_ROOT, 'test.txt')), False)
>> ++        self.assertIs(os.path.exists(os.path.join(UPLOAD_TO, 'test.txt')), True)
>> ++
>> +
>> + @override_settings(MEDIA_ROOT=MEDIA_ROOT)
>> + class DirectoryCreationTests(SimpleTestCase):
>> +@@ -591,6 +622,15 @@ class MultiParserTests(SimpleTestCase):
>> +         }, StringIO('x'), [], 'utf-8')
>> +         self.assertEqual(multipart_parser._content_length, 0)
>> +
>> ++    def test_sanitize_file_name(self):
>> ++        parser = MultiPartParser({
>> ++            'CONTENT_TYPE': 'multipart/form-data; boundary=_foo',
>> ++            'CONTENT_LENGTH': '1'
>> ++        }, StringIO('x'), [], 'utf-8')
>> ++        for file_name in CANDIDATE_TRAVERSAL_FILE_NAMES:
>> ++            with self.subTest(file_name=file_name):
>> ++                self.assertEqual(parser.sanitize_file_name(file_name), 'hax0rd.txt')
>> ++
>> +     def test_rfc2231_parsing(self):
>> +         test_data = (
>> +             (b"Content-Type: application/x-stuff; title*=us-ascii'en-us'This%20is%20%2A%2A%2Afun%2A%2A%2A",
>> +diff --git a/tests/file_uploads/uploadhandler.py b/tests/file_uploads/uploadhandler.py
>> +index 7c6199f..65d70c6 100644
>> +--- a/tests/file_uploads/uploadhandler.py
>> ++++ b/tests/file_uploads/uploadhandler.py
>> +@@ -1,6 +1,8 @@
>> + """
>> + Upload handlers to test the upload API.
>> + """
>> ++import os
>> ++from tempfile import NamedTemporaryFile
>> +
>> + from django.core.files.uploadhandler import FileUploadHandler, StopUpload
>> +
>> +@@ -35,3 +37,32 @@ class ErroringUploadHandler(FileUploadHandler):
>> +     """A handler that raises an exception."""
>> +     def receive_data_chunk(self, raw_data, start):
>> +         raise CustomUploadError("Oops!")
>> ++
>> ++
>> ++class TraversalUploadHandler(FileUploadHandler):
>> ++    """A handler with potential directory-traversal vulnerability."""
>> ++    def __init__(self, request=None):
>> ++        from .views import UPLOAD_TO
>> ++
>> ++        super().__init__(request)
>> ++        self.upload_dir = UPLOAD_TO
>> ++
>> ++    def file_complete(self, file_size):
>> ++        self.file.seek(0)
>> ++        self.file.size = file_size
>> ++        with open(os.path.join(self.upload_dir, self.file_name), 'wb') as fp:
>> ++            fp.write(self.file.read())
>> ++        return self.file
>> ++
>> ++    def new_file(
>> ++        self, field_name, file_name, content_type, content_length, charset=None,
>> ++        content_type_extra=None,
>> ++    ):
>> ++        super().new_file(
>> ++            file_name, file_name, content_length, content_length, charset,
>> ++            content_type_extra,
>> ++        )
>> ++        self.file = NamedTemporaryFile(suffix='.upload', dir=self.upload_dir)
>> ++
>> ++    def receive_data_chunk(self, raw_data, start):
>> ++        self.file.write(raw_data)
>> +diff --git a/tests/file_uploads/urls.py b/tests/file_uploads/urls.py
>> +index 3e7985d..eaac1da 100644
>> +--- a/tests/file_uploads/urls.py
>> ++++ b/tests/file_uploads/urls.py
>> +@@ -4,6 +4,7 @@ from . import views
>> +
>> + urlpatterns = [
>> +     path('upload/', views.file_upload_view),
>> ++    path('upload_traversal/', views.file_upload_traversal_view),
>> +     path('verify/', views.file_upload_view_verify),
>> +     path('unicode_name/', views.file_upload_unicode_name),
>> +     path('echo/', views.file_upload_echo),
>> +diff --git a/tests/file_uploads/views.py b/tests/file_uploads/views.py
>> +index d4947e4..137c6f3 100644
>> +--- a/tests/file_uploads/views.py
>> ++++ b/tests/file_uploads/views.py
>> +@@ -6,7 +6,9 @@ from django.http import HttpResponse, HttpResponseServerError, JsonResponse
>> +
>> + from .models import FileModel
>> + from .tests import UNICODE_FILENAME, UPLOAD_TO
>> +-from .uploadhandler import ErroringUploadHandler, QuotaUploadHandler
>> ++from .uploadhandler import (
>> ++    ErroringUploadHandler, QuotaUploadHandler, TraversalUploadHandler,
>> ++)
>> +
>> +
>> + def file_upload_view(request):
>> +@@ -158,3 +160,11 @@ def file_upload_fd_closing(request, access):
>> +     if access == 't':
>> +         request.FILES  # Trigger file parsing.
>> +     return HttpResponse('')
>> ++
>> ++
>> ++def file_upload_traversal_view(request):
>> ++    request.upload_handlers.insert(0, TraversalUploadHandler())
>> ++    request.FILES  # Trigger file parsing.
>> ++    return JsonResponse(
>> ++        {'file_name': request.upload_handlers[0].file_name},
>> ++    )
>> +--
>> +2.17.1
>> +
>> diff --git a/meta-python/recipes-devtools/python/python3-django_2.2.16.bb b/meta-python/recipes-devtools/python/python3-django_2.2.16.bb
>> index 0715abbd4..eb626e8d3 100644
>> --- a/meta-python/recipes-devtools/python/python3-django_2.2.16.bb
>> +++ b/meta-python/recipes-devtools/python/python3-django_2.2.16.bb
>> @@ -7,3 +7,5 @@ SRC_URI[sha256sum] = "62cf45e5ee425c52e411c0742e641a6588b7e8af0d2c274a27940931b2
>>   RDEPENDS_${PN} += "\
>>       ${PYTHON_PN}-sqlparse \
>>   "
>> +SRC_URI += "file://CVE-2021-28658.patch \
>> +"
>>
>> 
>>

--------------9123DDBC90943579A939FD0C
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <pre>Hello Armin,

From my understanding 2.2.x is a LTS release with extended support until April 2022.
Reference:
<a class="moz-txt-link-freetext" href="https://www.djangoproject.com/download/#supported-versions">https://www.djangoproject.com/download/#supported-versions</a>

Best regards,
Stefan

</pre>
    <div class="moz-cite-prefix">On 4/17/21 02:50, akuster808 wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:aab4ed03-1301-99c0-c3fc-3cb051f1fad6@gmail.com">
      <pre class="moz-quote-pre" wrap="">[Please note: This e-mail is from an EXTERNAL e-mail address]

Hello Stehan,

On 4/16/21 8:24 AM, Stefan Ghinea wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">In Django 2.2 before 2.2.20, 3.0 before 3.0.14, and 3.1 before 3.1.8,
MultiPartParser allowed directory traversal via uploaded files with
suitably crafted file names. Built-in upload handlers were not affected
by this vulnerability.

References:
<a class="moz-txt-link-freetext" href="https://nvd.nist.gov/vuln/detail/CVE-2021-28658">https://nvd.nist.gov/vuln/detail/CVE-2021-28658</a>
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Thank you for sending a security fix for this recipe. Do you happen to
know if the 2.2.x  is an LTS or bugfix only branch?

- Armin
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
Upstream patches:
<a class="moz-txt-link-freetext" href="https://github.com/django/django/commit/4036d62bda0e9e9f6172943794b744a454ca49c2">https://github.com/django/django/commit/4036d62bda0e9e9f6172943794b744a454ca49c2</a>

Signed-off-by: Stefan Ghinea <a class="moz-txt-link-rfc2396E" href="mailto:stefan.ghinea@windriver.com">&lt;stefan.ghinea@windriver.com&gt;</a>
---
 .../CVE-2021-28658.patch                      | 289 ++++++++++++++++++
 .../python/python3-django_2.2.16.bb           |   2 +
 2 files changed, 291 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-django-2.2.16/CVE-2021-28658.patch

diff --git a/meta-python/recipes-devtools/python/python3-django-2.2.16/CVE-2021-28658.patch b/meta-python/recipes-devtools/python/python3-django-2.2.16/CVE-2021-28658.patch
new file mode 100644
index 000000000..325aa0042
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-django-2.2.16/CVE-2021-28658.patch
@@ -0,0 +1,289 @@
+From 4036d62bda0e9e9f6172943794b744a454ca49c2 Mon Sep 17 00:00:00 2001
+From: Mariusz Felisiak <a class="moz-txt-link-rfc2396E" href="mailto:felisiak.mariusz@gmail.com">&lt;felisiak.mariusz@gmail.com&gt;</a>
+Date: Tue, 16 Mar 2021 10:19:00 +0100
+Subject: [PATCH] Fixed CVE-2021-28658 -- Fixed potential directory-traversal
+ via uploaded files.
+
+Thanks Claude Paroz for the initial patch.
+Thanks Dennis Brinkrolf for the report.
+
+Backport of d4d800ca1addc4141e03c5440a849bb64d1582cd from main.
+
+Upstream-Status: Backport
+CVE: CVE-2021-28658
+
+Reference to upstream patch:
+[<a class="moz-txt-link-freetext" href="https://github.com/django/django/commit/4036d62bda0e9e9f6172943794b744a454ca49c2">https://github.com/django/django/commit/4036d62bda0e9e9f6172943794b744a454ca49c2</a>]
+
+[SG: Adapted stable/2.2.x patch for 2.2.16]
+Signed-off-by: Stefan Ghinea <a class="moz-txt-link-rfc2396E" href="mailto:stefan.ghinea@windriver.com">&lt;stefan.ghinea@windriver.com&gt;</a>
+---
+ django/http/multipartparser.py      | 13 ++++--
+ docs/releases/2.2.16.txt            | 12 +++++
+ tests/file_uploads/tests.py         | 72 ++++++++++++++++++++++-------
+ tests/file_uploads/uploadhandler.py | 31 +++++++++++++
+ tests/file_uploads/urls.py          |  1 +
+ tests/file_uploads/views.py         | 12 ++++-
+ 6 files changed, 120 insertions(+), 21 deletions(-)
+
+diff --git a/django/http/multipartparser.py b/django/http/multipartparser.py
+index f6f12ca..5a9cca8 100644
+--- a/django/http/multipartparser.py
++++ b/django/http/multipartparser.py
+@@ -7,6 +7,7 @@ file upload handlers for processing.
+ import base64
+ import binascii
+ import cgi
++import os
+ from urllib.parse import unquote
+
+ from django.conf import settings
+@@ -205,7 +206,7 @@ class MultiPartParser:
+                     file_name = disposition.get('filename')
+                     if file_name:
+                         file_name = force_text(file_name, encoding, errors='replace')
+-                        file_name = self.IE_sanitize(unescape_entities(file_name))
++                        file_name = self.sanitize_file_name(file_name)
+                     if not file_name:
+                         continue
+
+@@ -293,9 +294,13 @@ class MultiPartParser:
+                 self._files.appendlist(force_text(old_field_name, self._encoding, errors='replace'), file_obj)
+                 break
+
+-    def IE_sanitize(self, filename):
+-        &quot;&quot;&quot;Cleanup filename from Internet Explorer full paths.&quot;&quot;&quot;
+-        return filename and filename[filename.rfind(&quot;\\&quot;) + 1:].strip()
++    def sanitize_file_name(self, file_name):
++        file_name = unescape_entities(file_name)
++        # Cleanup Windows-style path separators.
++        file_name = file_name[file_name.rfind('\\') + 1:].strip()
++        return os.path.basename(file_name)
++
++    IE_sanitize = sanitize_file_name
+
+     def _close_files(self):
+         # Free up all file handles.
+diff --git a/docs/releases/2.2.16.txt b/docs/releases/2.2.16.txt
+index 31231fb..4b7021b 100644
+--- a/docs/releases/2.2.16.txt
++++ b/docs/releases/2.2.16.txt
+@@ -2,6 +2,18 @@
+ Django 2.2.16 release notes
+ ===========================
+
++*April 6, 2021*
++
++Backported from Django 2.2.20 a fix for a security issue.
++
++CVE-2021-28658: Potential directory-traversal via uploaded files
++================================================================
++
++``MultiPartParser`` allowed directory-traversal via uploaded files with
++suitably crafted file names.
++
++Built-in upload handlers were not affected by this vulnerability.
++
+ *September 1, 2020*
+
+ Django 2.2.16 fixes two security issues and two data loss bugs in 2.2.15.
+diff --git a/tests/file_uploads/tests.py b/tests/file_uploads/tests.py
+index ea4976d..2a08d1b 100644
+--- a/tests/file_uploads/tests.py
++++ b/tests/file_uploads/tests.py
+@@ -22,6 +22,21 @@ UNICODE_FILENAME = 'test-0123456789_中文_Orléans.jpg'
+ MEDIA_ROOT = sys_tempfile.mkdtemp()
+ UPLOAD_TO = os.path.join(MEDIA_ROOT, 'test_upload')
+
++CANDIDATE_TRAVERSAL_FILE_NAMES = [
++    '/tmp/hax0rd.txt',          # Absolute path, *nix-style.
++    'C:\\Windows\\hax0rd.txt',  # Absolute path, win-style.
++    'C:/Windows/hax0rd.txt',    # Absolute path, broken-style.
++    '\\tmp\\hax0rd.txt',        # Absolute path, broken in a different way.
++    '/tmp\\hax0rd.txt',         # Absolute path, broken by mixing.
++    'subdir/hax0rd.txt',        # Descendant path, *nix-style.
++    'subdir\\hax0rd.txt',       # Descendant path, win-style.
++    'sub/dir\\hax0rd.txt',      # Descendant path, mixed.
++    '../../hax0rd.txt',         # Relative path, *nix-style.
++    '..\\..\\hax0rd.txt',       # Relative path, win-style.
++    '../..\\hax0rd.txt',        # Relative path, mixed.
++    '..&amp;#x2F;hax0rd.txt',       # HTML entities.
++]
++
+
+ @override_settings(MEDIA_ROOT=MEDIA_ROOT, ROOT_URLCONF='file_uploads.urls', MIDDLEWARE=[])
+ class FileUploadTests(TestCase):
+@@ -205,22 +220,8 @@ class FileUploadTests(TestCase):
+         # a malicious payload with an invalid file name (containing os.sep or
+         # os.pardir). This similar to what an attacker would need to do when
+         # trying such an attack.
+-        scary_file_names = [
+-            &quot;/tmp/hax0rd.txt&quot;,          # Absolute path, *nix-style.
+-            &quot;C:\\Windows\\hax0rd.txt&quot;,  # Absolute path, win-style.
+-            &quot;C:/Windows/hax0rd.txt&quot;,    # Absolute path, broken-style.
+-            &quot;\\tmp\\hax0rd.txt&quot;,        # Absolute path, broken in a different way.
+-            &quot;/tmp\\hax0rd.txt&quot;,         # Absolute path, broken by mixing.
+-            &quot;subdir/hax0rd.txt&quot;,        # Descendant path, *nix-style.
+-            &quot;subdir\\hax0rd.txt&quot;,       # Descendant path, win-style.
+-            &quot;sub/dir\\hax0rd.txt&quot;,      # Descendant path, mixed.
+-            &quot;../../hax0rd.txt&quot;,         # Relative path, *nix-style.
+-            &quot;..\\..\\hax0rd.txt&quot;,       # Relative path, win-style.
+-            &quot;../..\\hax0rd.txt&quot;         # Relative path, mixed.
+-        ]
+-
+         payload = client.FakePayload()
+-        for i, name in enumerate(scary_file_names):
++        for i, name in enumerate(CANDIDATE_TRAVERSAL_FILE_NAMES):
+             payload.write('\r\n'.join([
+                 '--' + client.BOUNDARY,
+                 'Content-Disposition: form-data; name=&quot;file%s&quot;; filename=&quot;%s&quot;' % (i, name),
+@@ -240,7 +241,7 @@ class FileUploadTests(TestCase):
+         response = self.client.request(**r)
+         # The filenames should have been sanitized by the time it got to the view.
+         received = response.json()
+-        for i, name in enumerate(scary_file_names):
++        for i, name in enumerate(CANDIDATE_TRAVERSAL_FILE_NAMES):
+             got = received[&quot;file%s&quot; % i]
+             self.assertEqual(got, &quot;hax0rd.txt&quot;)
+
+@@ -518,6 +519,36 @@ class FileUploadTests(TestCase):
+         # shouldn't differ.
+         self.assertEqual(os.path.basename(obj.testfile.path), 'MiXeD_cAsE.txt')
+
++    def test_filename_traversal_upload(self):
++        os.makedirs(UPLOAD_TO, exist_ok=True)
++        self.addCleanup(shutil.rmtree, MEDIA_ROOT)
++        file_name = '..&amp;#x2F;test.txt',
++        payload = client.FakePayload()
++        payload.write(
++            '\r\n'.join([
++                '--' + client.BOUNDARY,
++                'Content-Disposition: form-data; name=&quot;my_file&quot;; '
++                'filename=&quot;%s&quot;;' % file_name,
++                'Content-Type: text/plain',
++                '',
++                'file contents.\r\n',
++                '\r\n--' + client.BOUNDARY + '--\r\n',
++            ]),
++        )
++        r = {
++            'CONTENT_LENGTH': len(payload),
++            'CONTENT_TYPE': client.MULTIPART_CONTENT,
++            'PATH_INFO': '/upload_traversal/',
++            'REQUEST_METHOD': 'POST',
++            'wsgi.input': payload,
++        }
++        response = self.client.request(**r)
++        result = response.json()
++        self.assertEqual(response.status_code, 200)
++        self.assertEqual(result['file_name'], 'test.txt')
++        self.assertIs(os.path.exists(os.path.join(MEDIA_ROOT, 'test.txt')), False)
++        self.assertIs(os.path.exists(os.path.join(UPLOAD_TO, 'test.txt')), True)
++
+
+ @override_settings(MEDIA_ROOT=MEDIA_ROOT)
+ class DirectoryCreationTests(SimpleTestCase):
+@@ -591,6 +622,15 @@ class MultiParserTests(SimpleTestCase):
+         }, StringIO('x'), [], 'utf-8')
+         self.assertEqual(multipart_parser._content_length, 0)
+
++    def test_sanitize_file_name(self):
++        parser = MultiPartParser({
++            'CONTENT_TYPE': 'multipart/form-data; boundary=_foo',
++            'CONTENT_LENGTH': '1'
++        }, StringIO('x'), [], 'utf-8')
++        for file_name in CANDIDATE_TRAVERSAL_FILE_NAMES:
++            with self.subTest(file_name=file_name):
++                self.assertEqual(parser.sanitize_file_name(file_name), 'hax0rd.txt')
++
+     def test_rfc2231_parsing(self):
+         test_data = (
+             (b&quot;Content-Type: application/x-stuff; title*=us-ascii'en-us'This%20is%20%2A%2A%2Afun%2A%2A%2A&quot;,
+diff --git a/tests/file_uploads/uploadhandler.py b/tests/file_uploads/uploadhandler.py
+index 7c6199f..65d70c6 100644
+--- a/tests/file_uploads/uploadhandler.py
++++ b/tests/file_uploads/uploadhandler.py
+@@ -1,6 +1,8 @@
+ &quot;&quot;&quot;
+ Upload handlers to test the upload API.
+ &quot;&quot;&quot;
++import os
++from tempfile import NamedTemporaryFile
+
+ from django.core.files.uploadhandler import FileUploadHandler, StopUpload
+
+@@ -35,3 +37,32 @@ class ErroringUploadHandler(FileUploadHandler):
+     &quot;&quot;&quot;A handler that raises an exception.&quot;&quot;&quot;
+     def receive_data_chunk(self, raw_data, start):
+         raise CustomUploadError(&quot;Oops!&quot;)
++
++
++class TraversalUploadHandler(FileUploadHandler):
++    &quot;&quot;&quot;A handler with potential directory-traversal vulnerability.&quot;&quot;&quot;
++    def __init__(self, request=None):
++        from .views import UPLOAD_TO
++
++        super().__init__(request)
++        self.upload_dir = UPLOAD_TO
++
++    def file_complete(self, file_size):
++        self.file.seek(0)
++        self.file.size = file_size
++        with open(os.path.join(self.upload_dir, self.file_name), 'wb') as fp:
++            fp.write(self.file.read())
++        return self.file
++
++    def new_file(
++        self, field_name, file_name, content_type, content_length, charset=None,
++        content_type_extra=None,
++    ):
++        super().new_file(
++            file_name, file_name, content_length, content_length, charset,
++            content_type_extra,
++        )
++        self.file = NamedTemporaryFile(suffix='.upload', dir=self.upload_dir)
++
++    def receive_data_chunk(self, raw_data, start):
++        self.file.write(raw_data)
+diff --git a/tests/file_uploads/urls.py b/tests/file_uploads/urls.py
+index 3e7985d..eaac1da 100644
+--- a/tests/file_uploads/urls.py
++++ b/tests/file_uploads/urls.py
+@@ -4,6 +4,7 @@ from . import views
+
+ urlpatterns = [
+     path('upload/', views.file_upload_view),
++    path('upload_traversal/', views.file_upload_traversal_view),
+     path('verify/', views.file_upload_view_verify),
+     path('unicode_name/', views.file_upload_unicode_name),
+     path('echo/', views.file_upload_echo),
+diff --git a/tests/file_uploads/views.py b/tests/file_uploads/views.py
+index d4947e4..137c6f3 100644
+--- a/tests/file_uploads/views.py
++++ b/tests/file_uploads/views.py
+@@ -6,7 +6,9 @@ from django.http import HttpResponse, HttpResponseServerError, JsonResponse
+
+ from .models import FileModel
+ from .tests import UNICODE_FILENAME, UPLOAD_TO
+-from .uploadhandler import ErroringUploadHandler, QuotaUploadHandler
++from .uploadhandler import (
++    ErroringUploadHandler, QuotaUploadHandler, TraversalUploadHandler,
++)
+
+
+ def file_upload_view(request):
+@@ -158,3 +160,11 @@ def file_upload_fd_closing(request, access):
+     if access == 't':
+         request.FILES  # Trigger file parsing.
+     return HttpResponse('')
++
++
++def file_upload_traversal_view(request):
++    request.upload_handlers.insert(0, TraversalUploadHandler())
++    request.FILES  # Trigger file parsing.
++    return JsonResponse(
++        {'file_name': request.upload_handlers[0].file_name},
++    )
+--
+2.17.1
+
diff --git a/meta-python/recipes-devtools/python/python3-django_2.2.16.bb b/meta-python/recipes-devtools/python/python3-django_2.2.16.bb
index 0715abbd4..eb626e8d3 100644
--- a/meta-python/recipes-devtools/python/python3-django_2.2.16.bb
+++ b/meta-python/recipes-devtools/python/python3-django_2.2.16.bb
@@ -7,3 +7,5 @@ SRC_URI[sha256sum] = &quot;62cf45e5ee425c52e411c0742e641a6588b7e8af0d2c274a27940931b2
 RDEPENDS_${PN} += &quot;\
     ${PYTHON_PN}-sqlparse \
 &quot;
+SRC_URI += <a class="moz-txt-link-rfc2396E" href="file://CVE-2021-28658.patch\+">&quot;file://CVE-2021-28658.patch \
+&quot;</a>



</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------9123DDBC90943579A939FD0C--
