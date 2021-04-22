Received: from NAM12-DM6-obe.outbound.protection.outlook.com (NAM12-DM6-obe.outbound.protection.outlook.com [40.107.243.58])
 by mx.groups.io with SMTP id smtpd.web10.6792.1619057001795386280
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Apr 2021 19:03:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=NGNcDdet;
 spf=pass (domain: windriver.com, ip: 40.107.243.58, mailfrom: qi.chen@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NskfhZYlJwCOlRl0Eesum0/I/oQ2UunA44OgPB5SW1iNsgb2+HZut/1Hh7Yat+iGwg4yJNB1IJ/pLoGR3QeUq8MYo5ui6bZ1NuFKhPEKNhQW11VOSjq+1GzK8ZfwojcrhTCZeSkxtL8SoHDi6WkJW6F50PUF+H7jwVzmVY+EUVs7jS+dTAfT2/8suPGsHGLB0JvzjgFMpYefDyEzMhRf0IQ4cZ7vmxwgIEDeeWcvOVzBM97Wz6iYXF+I39rK9fkcWSxIsm17QzedPkYVJgdW6yJCoZiLOlEr4CGw5UGyj4LoPFQSy4XeXCEHp7m4GstVQqVrgIf1K0uTlVlHQi7lgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TQ5hZRiigb2tw4U61MvPs3r6E1phxBE7knrIrSRdqvo=;
 b=a5O98GKMZDenmhWB4k1+HpCd21WPQ+S48w5ygwaXNjga6GbLXjbusL9j/uEWj7tYUE16VqbP4GR7aHZTY3YQ/MuezWWMWsK7q1IWmsr85EsA5A1Fuh/ekL02ApIAunRklvpndCQyFD6P4I5uu5kUd4GQ9C1YcMobvUq31YRd8WWP6nd/jNOxfCPb8jbIsESO1OVv7WqrZqfw80CIngZ/lUNRrl4b4vpNhd/oR4jzl5gPClcrrfDQCRx/jQKeA2wgOREa2XnjSylH630UBcwxT84CR75NLwPf1CzZKj7frS94ixhKZFNuirhuBsactgtO/xYSkf0lJ5KcuCk0kSRrJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TQ5hZRiigb2tw4U61MvPs3r6E1phxBE7knrIrSRdqvo=;
 b=NGNcDdetgYuWPHVs3z3/ZeBYF13jHjzwjI7yyt3NXNCxIkwTaF+KuPH+sZ2DawWheOupL3VX7kQaOnC03+To0KQ/s2ErFIrcjAXTqfHg16UG0iXh2a7uy23c7GcRwBSD9TSbbjPy5+dQ5OtzMC0ZscQ79Mc22jEZaT8CkPg/rMo=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BYAPR11MB3480.namprd11.prod.outlook.com (2603:10b6:a03:79::27)
 by BYAPR11MB2533.namprd11.prod.outlook.com (2603:10b6:a02:c8::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.19; Thu, 22 Apr
 2021 02:03:19 +0000
Received: from BYAPR11MB3480.namprd11.prod.outlook.com
 ([fe80::5091:f32:2586:572b]) by BYAPR11MB3480.namprd11.prod.outlook.com
 ([fe80::5091:f32:2586:572b%7]) with mapi id 15.20.4065.021; Thu, 22 Apr 2021
 02:03:19 +0000
Subject: Re: [oe] [meta-python][hardknott][PATCH] python3-django: fix CVE-2021-28658
To: Trevor Gamblin <trevor.gamblin@windriver.com>,
 openembedded-devel@lists.openembedded.org
References: <20210421141824.2409129-1-trevor.gamblin@windriver.com>
From: "Chen Qi" <Qi.Chen@windriver.com>
Message-ID: <6bd10d6e-f9ce-8764-8d89-83273529bfce@windriver.com>
Date: Thu, 22 Apr 2021 10:11:47 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
In-Reply-To: <20210421141824.2409129-1-trevor.gamblin@windriver.com>
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HKAPR03CA0032.apcprd03.prod.outlook.com
 (2603:1096:203:c9::19) To BYAPR11MB3480.namprd11.prod.outlook.com
 (2603:10b6:a03:79::27)
Return-Path: Qi.Chen@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.141] (60.247.85.82) by HKAPR03CA0032.apcprd03.prod.outlook.com (2603:1096:203:c9::19) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.20.4087.16 via Frontend Transport; Thu, 22 Apr 2021 02:03:18 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d8a8a714-d118-4277-3651-08d90532cca3
X-MS-TrafficTypeDiagnostic: BYAPR11MB2533:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB253387CF0B849AED9EF0D1F7ED469@BYAPR11MB2533.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	BIXieIj0bFvFMWSI5Cc0JylhYQLgNv/fJQCfwg7MMwTgcGjK9ma2bdcNYCeXhX59Hixaq4bbuAeEkPN7yivX/Tve55Dy2d87lpIQMpLZPWR87YxOL/kBZicQfywuLNyL3ZTh5qwrrTQgdZeeyuXmUqvEZJsJIkIN+fD2IwjLSykS2Q40r0YsrvmnED3gsJzor/aTdHLUDPojbD+Nb9HqvSFr1ymWbEZe4az7rw5eW4E3KRUd+/Kz9u3F2KuNEq1hqauhfzGhVEEV8e2PR30Ui/Uimc/mf6FLXok63VdfQe6V2lvBEOvazrUC9CdZoRTrZEHkPVQYPJSDaqIeEr4vkebF7Wrzh/T2ucVKec5I2jOpSi7qpmWfwO0ztdlmRJ6UMUo5FtDQWBSRZMltWwWSMtPfBwjkKUJBBh3nc/J7Hx/vjBjiJZro8vjs01PhQpWAzPPl2lv0Ya9AUFtOaTeeIVq6N2xW++wIeNxQWe9w66EJFw6xIiycnbDOb1zVX6zqEnsxvn0f8xsC6ICCU/nYfe35by2MSKDVaLnYagykPkhscH2EEf9gPnGyRxICW9Pv72UTNiWAlQ1KFnnMxEb/NtXYwRgiqP0zaKSezVR/nfZKIw/c4HCkBBNv67bkaa2HMWB7YSPIH6l5/SthFsPJXD1XpHpNigkDAsJU78aU1s1efgoYZUeQTkwC0yTIIet2cGIBv4mDwPl88fDQKKzK38NkBUQtWX2dZJDB3K6Fz/n710YAQKwXBWMZ9Lb6KqOSWbM5dNO5cNBhwOFZBfzOCDaZp5SdX5YLnC6Idnz4EaeQSzs5silSlIamSxZlEb2BkhR7FFkp+T3OPpfCza5BhA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB3480.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(396003)(366004)(136003)(346002)(39850400004)(166002)(38350700002)(16526019)(478600001)(30864003)(6706004)(186003)(53546011)(83380400001)(2616005)(31686004)(38100700002)(66574015)(16576012)(966005)(86362001)(8676002)(956004)(8936002)(31696002)(26005)(66476007)(36756003)(66556008)(6666004)(66946007)(2906002)(6486002)(316002)(33964004)(52116002)(5660300002)(78286007)(43740500002)(45980500001)(473944003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?aDNrY3c4K0Jtai92VXhlRVZhdDhnNGFpVnNUSXVWYmx1YzNxMk1qamhqWjU1?=
 =?utf-8?B?aWFNY2tsS0FMSDllazE5b3JkRVN3NEVIYmhpNzdBcVJlazM3ZnQ3QVhBM1FH?=
 =?utf-8?B?VkEwdlVEWUNab1lwa3JtSlNTbWh0ZkxnUVBkbmxLVVNxZDYzU2dkMkV3dlZt?=
 =?utf-8?B?V1FHYS8rdldLMkpLekxJbXIzaHRabmsrK3R4OW14YjhROXUzRmxpU2xuUWZi?=
 =?utf-8?B?SzZNMmRxdkx2T3UydFhRMHJKaWtoVFMrQkpJQ3VGSm5wQWJyT1FtZ0svdGVl?=
 =?utf-8?B?dkpzdW9uYmV1TS9OYlRTMTVYZmVqSTFZZDBYUkxla1pXU3FmVmh2MnU4S1R3?=
 =?utf-8?B?TVF5em5iSmI0am51Q2RKSlJXc2JHM0NINEtGSjNDb203K2ticnRRWTBocWFn?=
 =?utf-8?B?aGh4eU9QWnNWdnVRV2doV2xNdHlmWTVYMktFQm5nUVVJd0NUZldqQTM5dzI1?=
 =?utf-8?B?YmRwZUlYUzlVLzFieFFFQk83OExFazE1RVpFb1FSUzMyM1AwcVBKVER6Q1ps?=
 =?utf-8?B?YUhYQ3VQZ0FOSG5qSVR3SEluc2podnhqU1dLQXIvaEdsVVZkVFNBa2pqWk53?=
 =?utf-8?B?L0dUQWs2cEI2SlBicUN3cnYweWlickVDOGFVY2hjOGdETFBPQ1BZZlY3M0ov?=
 =?utf-8?B?eXVHS3EzQ2lEclRXcVh4VUgzUnRuMkU5TkxyL3ZHRFhkaE1HbTY2RFRqZEln?=
 =?utf-8?B?S2NWVEtJTnl1YkhzRVFsZDVJV21RdlNtTFBTWGtONkJkdEs5K2VFcTZlVW5z?=
 =?utf-8?B?UXp2dVZmakZhQWR3czg1YmpFbTdNU0ttVmI4QnNPdDB2Q1YxMEFhSjNnWlBP?=
 =?utf-8?B?UXBoRmQ2emlpUkRjVWgrVkVCc3dGY3NubHNBZnlvYXFDTWl1b1dDbFdsV2th?=
 =?utf-8?B?NFJCOXZJekdUdjJMOWpyaHpTaXdsclMxOGtjZFh5VUxNT2hnTitpa2NndDVB?=
 =?utf-8?B?SkppQ2xHSkNXa2pLMEV0U2ZsVnYzVkRSWkxBUFk4YUNGZDF5b3czNS8wd2Mv?=
 =?utf-8?B?NHBrVnBSRTMwOGVxeWRuUlhHaEhsS3g0MDN2NjRwbzNDcXpNZHRjYzNSNkpU?=
 =?utf-8?B?SE5MQ2VJR2FIM0gybHJZTlJOc3JabHQwalIvVlRqd1pSMlIzQTlJM1ZoM0NP?=
 =?utf-8?B?QXNueU9RbWp5OFQ2aUJudU4yK1ZEZkpOc0VpK0dPRldYZHRid2szZmR5WVpW?=
 =?utf-8?B?ZE5Bc1JHa0FGVytMSWVPMlVwWkxCTWNNSkhhbW5oT2oxbUNEK2thY0dlK3VU?=
 =?utf-8?B?MjZRN2g2YTM0dUdJRkZMdkt2WURrWUV5WTVJTUs0Y1YwTXF1dXMwT0duR0JN?=
 =?utf-8?B?QTJzWkx1eUdhU3U2cmJzdGo4cVlxVzBpcjI0aUNNOENYR3dzR2FQUXZJTXZl?=
 =?utf-8?B?OFdJUjdQTTdPNHlLWFVCbE9JeUY0RnBtZUszTy9yS1pCbWhQNUhNMmwvbTBp?=
 =?utf-8?B?bzA2OG8rK3hTR3Q1OTFWemV5Z211MW5xTGhNYnpTZ0VDdzFuTGxNQmNuOEsw?=
 =?utf-8?B?NDJ2eDNwbHhJQUx3bUVoSlErOE1uekJaVVZPUHNMVWZ1Zm5qM2pvZGVqMkoy?=
 =?utf-8?B?YjlBWVBVa09XTGk3VTluZ3MrcXZiWUN2S1psSzJSaDhwNEJBUStPb1l5S1pU?=
 =?utf-8?B?RktEdG02RjJYcVlvNGVxaTk5em9MREtna0Fwb2JvWG10UGt3dlJURU9TNlpl?=
 =?utf-8?B?Z043WkdLWC8yUzZSOE9BV251UXA1bFJhRGZoVlY5Mm1kSlpJWTNSTkxSc2NT?=
 =?utf-8?Q?l+wWbLthz6G4DOGayJi/8Qpe+9N9yopcUaIQY43?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8a8a714-d118-4277-3651-08d90532cca3
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3480.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2021 02:03:19.6064
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D/u5pGH2bwVhKEqxB2f6DKhxmJbtu7MC2+I87Qz1WW62WyXKfb0VDvctm17O6327ziH9wdGPQ4MC63jM5uGutw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2533
Content-Type: multipart/alternative;
 boundary="------------32E5186E48A3CBFF91DC3FAF"

--------------32E5186E48A3CBFF91DC3FAF
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi All,

I'll send out a patch to upgrade it to 2.2.20.

Best Regards,
Chen Qi

On 04/21/2021 10:18 PM, Trevor Gamblin wrote:
> From: Stefan Ghinea <stefan.ghinea@windriver.com>
>
> Backport the fix from meta-python master-next branch.
>
> In Django 2.2 before 2.2.20, 3.0 before 3.0.14, and 3.1 before 3.1.8,
> MultiPartParser allowed directory traversal via uploaded files with
> suitably crafted file names. Built-in upload handlers were not affected
> by this vulnerability.
>
> References:
> https://nvd.nist.gov/vuln/detail/CVE-2021-28658
>
> Upstream patches:
> https://github.com/django/django/commit/4036d62bda0e9e9f6172943794b744a454ca49c2
>
> Signed-off-by: Stefan Ghinea <stefan.ghinea@windriver.com>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../CVE-2021-28658.patch                      | 289 ++++++++++++++++++
>   .../python/python3-django_2.2.16.bb           |   2 +
>   2 files changed, 291 insertions(+)
>   create mode 100644 meta-python/recipes-devtools/python/python3-django-2.2.16/CVE-2021-28658.patch
>
> diff --git a/meta-python/recipes-devtools/python/python3-django-2.2.16/CVE-2021-28658.patch b/meta-python/recipes-devtools/python/python3-django-2.2.16/CVE-2021-28658.patch
> new file mode 100644
> index 000000000..325aa0042
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-django-2.2.16/CVE-2021-28658.patch
> @@ -0,0 +1,289 @@
> +From 4036d62bda0e9e9f6172943794b744a454ca49c2 Mon Sep 17 00:00:00 2001
> +From: Mariusz Felisiak <felisiak.mariusz@gmail.com>
> +Date: Tue, 16 Mar 2021 10:19:00 +0100
> +Subject: [PATCH] Fixed CVE-2021-28658 -- Fixed potential directory-traversal
> + via uploaded files.
> +
> +Thanks Claude Paroz for the initial patch.
> +Thanks Dennis Brinkrolf for the report.
> +
> +Backport of d4d800ca1addc4141e03c5440a849bb64d1582cd from main.
> +
> +Upstream-Status: Backport
> +CVE: CVE-2021-28658
> +
> +Reference to upstream patch:
> +[https://github.com/django/django/commit/4036d62bda0e9e9f6172943794b744a454ca49c2]
> +
> +[SG: Adapted stable/2.2.x patch for 2.2.16]
> +Signed-off-by: Stefan Ghinea <stefan.ghinea@windriver.com>
> +---
> + django/http/multipartparser.py      | 13 ++++--
> + docs/releases/2.2.16.txt            | 12 +++++
> + tests/file_uploads/tests.py         | 72 ++++++++++++++++++++++-------
> + tests/file_uploads/uploadhandler.py | 31 +++++++++++++
> + tests/file_uploads/urls.py          |  1 +
> + tests/file_uploads/views.py         | 12 ++++-
> + 6 files changed, 120 insertions(+), 21 deletions(-)
> +
> +diff --git a/django/http/multipartparser.py b/django/http/multipartparser.py
> +index f6f12ca..5a9cca8 100644
> +--- a/django/http/multipartparser.py
> ++++ b/django/http/multipartparser.py
> +@@ -7,6 +7,7 @@ file upload handlers for processing.
> + import base64
> + import binascii
> + import cgi
> ++import os
> + from urllib.parse import unquote
> +
> + from django.conf import settings
> +@@ -205,7 +206,7 @@ class MultiPartParser:
> +                     file_name = disposition.get('filename')
> +                     if file_name:
> +                         file_name = force_text(file_name, encoding, errors='replace')
> +-                        file_name = self.IE_sanitize(unescape_entities(file_name))
> ++                        file_name = self.sanitize_file_name(file_name)
> +                     if not file_name:
> +                         continue
> +
> +@@ -293,9 +294,13 @@ class MultiPartParser:
> +                 self._files.appendlist(force_text(old_field_name, self._encoding, errors='replace'), file_obj)
> +                 break
> +
> +-    def IE_sanitize(self, filename):
> +-        """Cleanup filename from Internet Explorer full paths."""
> +-        return filename and filename[filename.rfind("\\") + 1:].strip()
> ++    def sanitize_file_name(self, file_name):
> ++        file_name = unescape_entities(file_name)
> ++        # Cleanup Windows-style path separators.
> ++        file_name = file_name[file_name.rfind('\\') + 1:].strip()
> ++        return os.path.basename(file_name)
> ++
> ++    IE_sanitize = sanitize_file_name
> +
> +     def _close_files(self):
> +         # Free up all file handles.
> +diff --git a/docs/releases/2.2.16.txt b/docs/releases/2.2.16.txt
> +index 31231fb..4b7021b 100644
> +--- a/docs/releases/2.2.16.txt
> ++++ b/docs/releases/2.2.16.txt
> +@@ -2,6 +2,18 @@
> + Django 2.2.16 release notes
> + ===========================
> +
> ++*April 6, 2021*
> ++
> ++Backported from Django 2.2.20 a fix for a security issue.
> ++
> ++CVE-2021-28658: Potential directory-traversal via uploaded files
> ++================================================================
> ++
> ++``MultiPartParser`` allowed directory-traversal via uploaded files with
> ++suitably crafted file names.
> ++
> ++Built-in upload handlers were not affected by this vulnerability.
> ++
> + *September 1, 2020*
> +
> + Django 2.2.16 fixes two security issues and two data loss bugs in 2.2.15.
> +diff --git a/tests/file_uploads/tests.py b/tests/file_uploads/tests.py
> +index ea4976d..2a08d1b 100644
> +--- a/tests/file_uploads/tests.py
> ++++ b/tests/file_uploads/tests.py
> +@@ -22,6 +22,21 @@ UNICODE_FILENAME = 'test-0123456789_中文_Orléans.jpg'
> + MEDIA_ROOT = sys_tempfile.mkdtemp()
> + UPLOAD_TO = os.path.join(MEDIA_ROOT, 'test_upload')
> +
> ++CANDIDATE_TRAVERSAL_FILE_NAMES = [
> ++    '/tmp/hax0rd.txt',          # Absolute path, *nix-style.
> ++    'C:\\Windows\\hax0rd.txt',  # Absolute path, win-style.
> ++    'C:/Windows/hax0rd.txt',    # Absolute path, broken-style.
> ++    '\\tmp\\hax0rd.txt',        # Absolute path, broken in a different way.
> ++    '/tmp\\hax0rd.txt',         # Absolute path, broken by mixing.
> ++    'subdir/hax0rd.txt',        # Descendant path, *nix-style.
> ++    'subdir\\hax0rd.txt',       # Descendant path, win-style.
> ++    'sub/dir\\hax0rd.txt',      # Descendant path, mixed.
> ++    '../../hax0rd.txt',         # Relative path, *nix-style.
> ++    '..\\..\\hax0rd.txt',       # Relative path, win-style.
> ++    '../..\\hax0rd.txt',        # Relative path, mixed.
> ++    '..&#x2F;hax0rd.txt',       # HTML entities.
> ++]
> ++
> +
> + @override_settings(MEDIA_ROOT=MEDIA_ROOT, ROOT_URLCONF='file_uploads.urls', MIDDLEWARE=[])
> + class FileUploadTests(TestCase):
> +@@ -205,22 +220,8 @@ class FileUploadTests(TestCase):
> +         # a malicious payload with an invalid file name (containing os.sep or
> +         # os.pardir). This similar to what an attacker would need to do when
> +         # trying such an attack.
> +-        scary_file_names = [
> +-            "/tmp/hax0rd.txt",          # Absolute path, *nix-style.
> +-            "C:\\Windows\\hax0rd.txt",  # Absolute path, win-style.
> +-            "C:/Windows/hax0rd.txt",    # Absolute path, broken-style.
> +-            "\\tmp\\hax0rd.txt",        # Absolute path, broken in a different way.
> +-            "/tmp\\hax0rd.txt",         # Absolute path, broken by mixing.
> +-            "subdir/hax0rd.txt",        # Descendant path, *nix-style.
> +-            "subdir\\hax0rd.txt",       # Descendant path, win-style.
> +-            "sub/dir\\hax0rd.txt",      # Descendant path, mixed.
> +-            "../../hax0rd.txt",         # Relative path, *nix-style.
> +-            "..\\..\\hax0rd.txt",       # Relative path, win-style.
> +-            "../..\\hax0rd.txt"         # Relative path, mixed.
> +-        ]
> +-
> +         payload = client.FakePayload()
> +-        for i, name in enumerate(scary_file_names):
> ++        for i, name in enumerate(CANDIDATE_TRAVERSAL_FILE_NAMES):
> +             payload.write('\r\n'.join([
> +                 '--' + client.BOUNDARY,
> +                 'Content-Disposition: form-data; name="file%s"; filename="%s"' % (i, name),
> +@@ -240,7 +241,7 @@ class FileUploadTests(TestCase):
> +         response = self.client.request(**r)
> +         # The filenames should have been sanitized by the time it got to the view.
> +         received = response.json()
> +-        for i, name in enumerate(scary_file_names):
> ++        for i, name in enumerate(CANDIDATE_TRAVERSAL_FILE_NAMES):
> +             got = received["file%s" % i]
> +             self.assertEqual(got, "hax0rd.txt")
> +
> +@@ -518,6 +519,36 @@ class FileUploadTests(TestCase):
> +         # shouldn't differ.
> +         self.assertEqual(os.path.basename(obj.testfile.path), 'MiXeD_cAsE.txt')
> +
> ++    def test_filename_traversal_upload(self):
> ++        os.makedirs(UPLOAD_TO, exist_ok=True)
> ++        self.addCleanup(shutil.rmtree, MEDIA_ROOT)
> ++        file_name = '..&#x2F;test.txt',
> ++        payload = client.FakePayload()
> ++        payload.write(
> ++            '\r\n'.join([
> ++                '--' + client.BOUNDARY,
> ++                'Content-Disposition: form-data; name="my_file"; '
> ++                'filename="%s";' % file_name,
> ++                'Content-Type: text/plain',
> ++                '',
> ++                'file contents.\r\n',
> ++                '\r\n--' + client.BOUNDARY + '--\r\n',
> ++            ]),
> ++        )
> ++        r = {
> ++            'CONTENT_LENGTH': len(payload),
> ++            'CONTENT_TYPE': client.MULTIPART_CONTENT,
> ++            'PATH_INFO': '/upload_traversal/',
> ++            'REQUEST_METHOD': 'POST',
> ++            'wsgi.input': payload,
> ++        }
> ++        response = self.client.request(**r)
> ++        result = response.json()
> ++        self.assertEqual(response.status_code, 200)
> ++        self.assertEqual(result['file_name'], 'test.txt')
> ++        self.assertIs(os.path.exists(os.path.join(MEDIA_ROOT, 'test.txt')), False)
> ++        self.assertIs(os.path.exists(os.path.join(UPLOAD_TO, 'test.txt')), True)
> ++
> +
> + @override_settings(MEDIA_ROOT=MEDIA_ROOT)
> + class DirectoryCreationTests(SimpleTestCase):
> +@@ -591,6 +622,15 @@ class MultiParserTests(SimpleTestCase):
> +         }, StringIO('x'), [], 'utf-8')
> +         self.assertEqual(multipart_parser._content_length, 0)
> +
> ++    def test_sanitize_file_name(self):
> ++        parser = MultiPartParser({
> ++            'CONTENT_TYPE': 'multipart/form-data; boundary=_foo',
> ++            'CONTENT_LENGTH': '1'
> ++        }, StringIO('x'), [], 'utf-8')
> ++        for file_name in CANDIDATE_TRAVERSAL_FILE_NAMES:
> ++            with self.subTest(file_name=file_name):
> ++                self.assertEqual(parser.sanitize_file_name(file_name), 'hax0rd.txt')
> ++
> +     def test_rfc2231_parsing(self):
> +         test_data = (
> +             (b"Content-Type: application/x-stuff; title*=us-ascii'en-us'This%20is%20%2A%2A%2Afun%2A%2A%2A",
> +diff --git a/tests/file_uploads/uploadhandler.py b/tests/file_uploads/uploadhandler.py
> +index 7c6199f..65d70c6 100644
> +--- a/tests/file_uploads/uploadhandler.py
> ++++ b/tests/file_uploads/uploadhandler.py
> +@@ -1,6 +1,8 @@
> + """
> + Upload handlers to test the upload API.
> + """
> ++import os
> ++from tempfile import NamedTemporaryFile
> +
> + from django.core.files.uploadhandler import FileUploadHandler, StopUpload
> +
> +@@ -35,3 +37,32 @@ class ErroringUploadHandler(FileUploadHandler):
> +     """A handler that raises an exception."""
> +     def receive_data_chunk(self, raw_data, start):
> +         raise CustomUploadError("Oops!")
> ++
> ++
> ++class TraversalUploadHandler(FileUploadHandler):
> ++    """A handler with potential directory-traversal vulnerability."""
> ++    def __init__(self, request=None):
> ++        from .views import UPLOAD_TO
> ++
> ++        super().__init__(request)
> ++        self.upload_dir = UPLOAD_TO
> ++
> ++    def file_complete(self, file_size):
> ++        self.file.seek(0)
> ++        self.file.size = file_size
> ++        with open(os.path.join(self.upload_dir, self.file_name), 'wb') as fp:
> ++            fp.write(self.file.read())
> ++        return self.file
> ++
> ++    def new_file(
> ++        self, field_name, file_name, content_type, content_length, charset=None,
> ++        content_type_extra=None,
> ++    ):
> ++        super().new_file(
> ++            file_name, file_name, content_length, content_length, charset,
> ++            content_type_extra,
> ++        )
> ++        self.file = NamedTemporaryFile(suffix='.upload', dir=self.upload_dir)
> ++
> ++    def receive_data_chunk(self, raw_data, start):
> ++        self.file.write(raw_data)
> +diff --git a/tests/file_uploads/urls.py b/tests/file_uploads/urls.py
> +index 3e7985d..eaac1da 100644
> +--- a/tests/file_uploads/urls.py
> ++++ b/tests/file_uploads/urls.py
> +@@ -4,6 +4,7 @@ from . import views
> +
> + urlpatterns = [
> +     path('upload/', views.file_upload_view),
> ++    path('upload_traversal/', views.file_upload_traversal_view),
> +     path('verify/', views.file_upload_view_verify),
> +     path('unicode_name/', views.file_upload_unicode_name),
> +     path('echo/', views.file_upload_echo),
> +diff --git a/tests/file_uploads/views.py b/tests/file_uploads/views.py
> +index d4947e4..137c6f3 100644
> +--- a/tests/file_uploads/views.py
> ++++ b/tests/file_uploads/views.py
> +@@ -6,7 +6,9 @@ from django.http import HttpResponse, HttpResponseServerError, JsonResponse
> +
> + from .models import FileModel
> + from .tests import UNICODE_FILENAME, UPLOAD_TO
> +-from .uploadhandler import ErroringUploadHandler, QuotaUploadHandler
> ++from .uploadhandler import (
> ++    ErroringUploadHandler, QuotaUploadHandler, TraversalUploadHandler,
> ++)
> +
> +
> + def file_upload_view(request):
> +@@ -158,3 +160,11 @@ def file_upload_fd_closing(request, access):
> +     if access == 't':
> +         request.FILES  # Trigger file parsing.
> +     return HttpResponse('')
> ++
> ++
> ++def file_upload_traversal_view(request):
> ++    request.upload_handlers.insert(0, TraversalUploadHandler())
> ++    request.FILES  # Trigger file parsing.
> ++    return JsonResponse(
> ++        {'file_name': request.upload_handlers[0].file_name},
> ++    )
> +--
> +2.17.1
> +
> diff --git a/meta-python/recipes-devtools/python/python3-django_2.2.16.bb b/meta-python/recipes-devtools/python/python3-django_2.2.16.bb
> index 0715abbd4..eb626e8d3 100644
> --- a/meta-python/recipes-devtools/python/python3-django_2.2.16.bb
> +++ b/meta-python/recipes-devtools/python/python3-django_2.2.16.bb
> @@ -7,3 +7,5 @@ SRC_URI[sha256sum] = "62cf45e5ee425c52e411c0742e641a6588b7e8af0d2c274a27940931b2
>   RDEPENDS_${PN} += "\
>       ${PYTHON_PN}-sqlparse \
>   "
> +SRC_URI += "file://CVE-2021-28658.patch \
> +"
>
>
> 
>


--------------32E5186E48A3CBFF91DC3FAF
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <div class="moz-cite-prefix">Hi All,<br>
      <br>
      I'll send out a patch to upgrade it to 2.2.20.<br>
      <br>
      Best Regards,<br>
      Chen Qi<br>
      <br>
      On 04/21/2021 10:18 PM, Trevor Gamblin wrote:<br>
    </div>
    <blockquote cite="mid:20210421141824.2409129-1-trevor.gamblin@windriver.com" type="cite">
      <pre wrap="">From: Stefan Ghinea <a class="moz-txt-link-rfc2396E" href="mailto:stefan.ghinea@windriver.com">&lt;stefan.ghinea@windriver.com&gt;</a>

Backport the fix from meta-python master-next branch.

In Django 2.2 before 2.2.20, 3.0 before 3.0.14, and 3.1 before 3.1.8,
MultiPartParser allowed directory traversal via uploaded files with
suitably crafted file names. Built-in upload handlers were not affected
by this vulnerability.

References:
<a class="moz-txt-link-freetext" href="https://nvd.nist.gov/vuln/detail/CVE-2021-28658">https://nvd.nist.gov/vuln/detail/CVE-2021-28658</a>

Upstream patches:
<a class="moz-txt-link-freetext" href="https://github.com/django/django/commit/4036d62bda0e9e9f6172943794b744a454ca49c2">https://github.com/django/django/commit/4036d62bda0e9e9f6172943794b744a454ca49c2</a>

Signed-off-by: Stefan Ghinea <a class="moz-txt-link-rfc2396E" href="mailto:stefan.ghinea@windriver.com">&lt;stefan.ghinea@windriver.com&gt;</a>
Signed-off-by: Khem Raj <a class="moz-txt-link-rfc2396E" href="mailto:raj.khem@gmail.com">&lt;raj.khem@gmail.com&gt;</a>
Signed-off-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
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
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <br>
      <pre wrap="">


</pre>
    </blockquote>
    <p><br>
    </p>
  </body>
</html>

--------------32E5186E48A3CBFF91DC3FAF--
