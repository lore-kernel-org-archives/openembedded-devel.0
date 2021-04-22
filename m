Received: from NAM12-MW2-obe.outbound.protection.outlook.com (NAM12-MW2-obe.outbound.protection.outlook.com [40.107.244.70])
 by mx.groups.io with SMTP id smtpd.web09.8475.1619071736262425047
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Apr 2021 23:08:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=CENm5Ww/;
 spf=pass (domain: windriver.com, ip: 40.107.244.70, mailfrom: qi.chen@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U5eWHuYQG34EPOf9+atXIM8PNf0YfTUBHLSksZPos88wINA3+ABYOxHDae1+AUroF4fu/k0ijxHCetiEXsNKczFa4hqcp4wIsCGGw07bRtQ6e31/tPmuq19UvkP35qXsOSBMsbhTOL2IbgqtSOCRlVAMzNFiH3YPpo9UBb5pK8r9i60NnqOROXqTTiD6Nq+4MVqPJyY1D8GZVyDw3zr42MrXZ41/aiXk7uhD2AHFFjYmSQgEYHquLSvyTvLOLBf4LtLLDD8wPHO3U1gkY0KuksxtA0WDCETJPev2X83qST4feUYHReGdB33oXIUK1K0oTxDo89srOoVi5GV6tvPfLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NItd7eYvGWMhchXZdjPzv2U5bn/UNHH9f3yHBh+LO3A=;
 b=ElxCUChkpb9OT2+MzPmbyJdVlpJEc7CGOCPFHpH0n/tNbGr06X6Z4MAD+ZcQUq6nzfDYuXO3UYVwVaQ5lzsWJmMRRsPjDh0kuN5/ECxGe3rB1nhXbFrV8l/z2Tb54p0b6UoTQVTT8TrnRNOqgjGbH3OdiLxAKdtTa1vxeLq9CYIGz0+uJwhmBGAunO3CrhCCm1iVanRNCEQA92fjqmFIsZTlRwjZ/v/r32FM28goPoHRGPdNjgzy/7UvHmFCEwqOkHbn1FYJouuXnlTBOVeeJFPC8P5FhLi04SINf8JK22vesxQENe1iGySppaorPRmxBOVHQSKCd/kmhT+MhTO8sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NItd7eYvGWMhchXZdjPzv2U5bn/UNHH9f3yHBh+LO3A=;
 b=CENm5Ww/nVUdnEL5DikUk+nHUcyg0WeasNnMhJh7Y4HDoV2ulL0UaC133n3f/tfQDTpuQ71Hz80ncgETfrli0U9YygH49ZsHAulCP/TXODjPPSqke/Vs8IDFYnAeYOSugJ3Hc6v96vJdDCudRpH0dold1p2NZ989IgPMrn9+QVc=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=windriver.com;
Received: from BYAPR11MB3480.namprd11.prod.outlook.com (2603:10b6:a03:79::27)
 by BYAPR11MB2677.namprd11.prod.outlook.com (2603:10b6:a02:cd::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.18; Thu, 22 Apr
 2021 06:08:53 +0000
Received: from BYAPR11MB3480.namprd11.prod.outlook.com
 ([fe80::5091:f32:2586:572b]) by BYAPR11MB3480.namprd11.prod.outlook.com
 ([fe80::5091:f32:2586:572b%7]) with mapi id 15.20.4065.021; Thu, 22 Apr 2021
 06:08:53 +0000
Subject: Re: [oe] [meta-python][hardknott][PATCH] python3-django: fix CVE-2021-28658
To: Trevor Gamblin <trevor.gamblin@windriver.com>,
 openembedded-devel@lists.openembedded.org
References: <20210421141824.2409129-1-trevor.gamblin@windriver.com>
 <16780BC3FD5A103F.32615@lists.openembedded.org>
Cc: akuster808 <akuster808@gmail.com>
From: "Chen Qi" <Qi.Chen@windriver.com>
Message-ID: <5c0d377c-23fb-1e6a-0df9-94aae778bf08@windriver.com>
Date: Thu, 22 Apr 2021 14:17:12 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
In-Reply-To: <16780BC3FD5A103F.32615@lists.openembedded.org>
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK2PR03CA0059.apcprd03.prod.outlook.com
 (2603:1096:202:17::29) To BYAPR11MB3480.namprd11.prod.outlook.com
 (2603:10b6:a03:79::27)
Return-Path: Qi.Chen@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.141] (60.247.85.82) by HK2PR03CA0059.apcprd03.prod.outlook.com (2603:1096:202:17::29) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.20.4087.15 via Frontend Transport; Thu, 22 Apr 2021 06:08:43 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e8b22e81-827b-4e56-97df-08d905551638
X-MS-TrafficTypeDiagnostic: BYAPR11MB2677:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB26773D524934B6587698B758ED469@BYAPR11MB2677.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2512;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	yL3zqv5/Vto3tYPo+A/T64+JKLOiihMzOQxtJ91ZgEGdINVhJuiLThOSJ77SUch3cOVnoDhUo++ApGpaZ8GTiaCWXK+lf+c/3WAj04agqd3qO2426UkMqj8MWOR6lpABNfnL6da8ADhzIfAb7wvqUhFS6Y6hqhPcN9QI6bmkQ7EdrxhGjoOfp9cB7aR65F/KCxgmiwSA3cuWS5qAfniK239PPhkUz1KHsUyDCSh5Uxnr+WtH3fzht6Lbggj44ElwJbOpuzBV+FoLtrS4KhbrOd+0PhAtsiUm2AC8L2Pjwwb+jImgXgETiuhrviBzAi+SdjJ7WI/cD+PfwA22zdz8tW5Wh76qQgPbkDyViN68M7GuXA9e/aJUyU5AGc0vVGfE0GWd6GxMnzaz3VT0WeSRMFg1EnlIrx5IfwTAMbipfErDXFaKgyBuh6cFhDpyURZkPrB+GUL0FVWHSRCZMAvhKijq1k1LHevOXyCI964WvfazG7oixXF6TrnilKe2rZ1ff8nAw+nDtetKhHa5h5GN+VoTPjTYrCza3RSQg0jEAA3e6TGlBYFseA1/IVPlA18/yMg4rzSUPXs5WjJlgkxcKtkuGOqFX0OhgwxaBhdTj6sjlWAMyzw4V/J6GMuanX/UPSEK9nIG8UwnriZO4gPp/F1vzSvxyPdW9hoI4qqSDkVLUfrf/Ij0Z3jyzcpYo+MTpq1Fzy92HioAt8Yc8tKpOlUrHklyspMJL9qb2sjLkgP5znm6kcJjDL3OoqmlGQUX8vAL6TvTY/xEsU3M5a1QYlURHiXK9rbjWpOvV1xk3KFrhHbmqKe9XosJlrwnnEtBYVnUWj9d3O3pMmIfwb5A4ZLqUkkx87Z3CJRULRc5zNc=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB3480.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(366004)(376002)(39850400004)(396003)(136003)(16576012)(2616005)(26005)(31696002)(956004)(52116002)(8676002)(966005)(66556008)(33964004)(86362001)(30864003)(66476007)(4326008)(6666004)(5660300002)(66946007)(16526019)(2906002)(6486002)(31686004)(478600001)(316002)(38350700002)(38100700002)(6706004)(36756003)(66574015)(83380400001)(166002)(186003)(53546011)(8936002)(78286007)(43740500002)(45980500001)(473944003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?UlpnM2xLd2tFSUhLclBvNWkraG1ReW0vRXk0YjNTaks4eG9hcWRLOGF4RC80?=
 =?utf-8?B?cDdFTW1oUmhFTGkwbnp2dlJ0elQzcFR3a3JzZVpQWG1ESzlRZjJjVlUvUEoz?=
 =?utf-8?B?NWxtSWdKUE1aWTN4aS82blV2Q1FmcGRrNGtpYjkvUTJ3aWRCdUJPYnlCNVp5?=
 =?utf-8?B?MzF2T2Qrc1crUi8waFhZWUNhWnYwSisyZzFzZzhyb2hqVmFmN1dSa21HUmFK?=
 =?utf-8?B?ai80V1N4dytnNmZSS2R3MjB5STV6Zjg5VHVSSXlEd1hRS1E3VGZoaHUwVnA0?=
 =?utf-8?B?WGhyYjRFc3JQVjNuMWhnbXoxTDdDN2FaWHVZYkc1YmFpTEhzdEhHQ1hWMEFl?=
 =?utf-8?B?WmZIVTdvaU83UlY5eUZFWVREQ2VmenZFUExUVlJIMGJNSVZwSkZyaUx4eWZN?=
 =?utf-8?B?NWJVaFlHV1ZFY3ZqdEMvNkZCa1dNMmdLZFlZeGx5Rmx3MkFtTGpFVGZxa2NJ?=
 =?utf-8?B?ZGg5RjNqNGZjOURQVTlUOWR3Mm90ZGowV095RDZQbUIzVHN2OHozb21nRVA3?=
 =?utf-8?B?VWdWNWFtK0dicitYVTJMWCtINnR6NUpwejkzY1NSSEJpWEdpMlMzWENDdFlO?=
 =?utf-8?B?bGpNYk1pRVlCOWRBVEVxQWNueGRFY0lYekljSkhWKzVGZFhWeFU1QkorNmpu?=
 =?utf-8?B?aUJXOU1RajdOczNha2Z2RjZ6YWc1TmI1NDRKV0NuTEhJTmVTb3FpcCt6aFNx?=
 =?utf-8?B?Z0piZk5pdzJtTDVqSThkanBUcGMvYXV6TWpEMG5ReG9BVDF2YjZDTCtabk9k?=
 =?utf-8?B?ZlFGUXRnOVh4WEh2THV4LzFBMjM1eXZLUThCdkZrK0dzYVJCYzZ4b05sYzBI?=
 =?utf-8?B?OHpCQXNqNk4vQkJkVUMwR3NJaE96bnJtWnJmL01Ec0NhUXRPdlBXbmtkSzdn?=
 =?utf-8?B?OTJ2UW8zeE9aZDFFWWJDaWw1N3Y5Wjc3a0czK1N3MzhPSzB2VGxhVlptWW9W?=
 =?utf-8?B?SkZLNkZZWER4SFBUWEllYjJQWmxPYndBWC9xUklHb091eEFRWnVyVzZkVGhp?=
 =?utf-8?B?ejFzTThNK2xQb05iY29vWk5VWndySGdDYmI4MW1TSVhJc0RyWTR2MDN6RUZa?=
 =?utf-8?B?VkgyQnBHQjZQd0pseXd1Nk9OMU5MWVpaSEliYkp5QU41dVR6ZGxWdUx1bTJp?=
 =?utf-8?B?NXpWOVZBWUxFM0V2d1NtaFV4ZGNCRXp4MG5wTkp5cWM2SUV0RFB5RWg1Y2pR?=
 =?utf-8?B?bUVvcVVOa3BxdDg2aGtiWlY4WW9ldlVnMFhkL3EydVNBblNoSWd3WmZkaFla?=
 =?utf-8?B?UFdBK2dVcFZYM1VGWFJuek9kK1l0NFVVVlYyNDVHS2VsTHdETFV5b2h0L2ov?=
 =?utf-8?B?emN0VHh2eDlBYXVhTFZ1VmVmYzlWQ1o4bHpEenVQKzRtT3c2azNBTnJwejQr?=
 =?utf-8?B?MjhuelJIeUdUR2EvbWJxbVFvTkg4Zjc1TUNDSlNSREE3OHFHK3huOFNiMHlM?=
 =?utf-8?B?NTlZRWRhRmsxQTNWaHVibGNTT0xWMFljcE9FYXVTNWxRUHNCVFVkNktWWnlm?=
 =?utf-8?B?akNmaGt4Ry95dDhpWGxESGxmVlA3WEdaQTRRUmhMWVIrYUlkYWFGVE1nbDRZ?=
 =?utf-8?B?dlZYS21uRFVZamdOYkZnRTVKZ3pZQ2tnZW9YS2Q3V09sNHdoNXQ5UXVESGht?=
 =?utf-8?B?U1RtVlQxQjBTdTltTjNsdXJya0N2aTNSMk5DeTV4YmhSWXU1Zk9TZFo2eFlI?=
 =?utf-8?B?QXltUm5BVXQxeTZJWTY2d2tPV2Fza3k0ZU5JR1RuQXhrd2tweVpRNFVjZitM?=
 =?utf-8?Q?WgyaOF2S33gyfANhJOg6oxDNQvHekdA5Ik8/Efy?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8b22e81-827b-4e56-97df-08d905551638
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3480.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2021 06:08:53.5076
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +3MvQ014FBAWZCIoGv+W9hx9dfxoleVcWB8yYmZmPr9+nceJVNdr0htApD0w5c3tYgeTnqsHKWprLEYM7d/h6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2677
Content-Type: multipart/alternative;
 boundary="------------9CA3FC716232D88DDEBC1E39"

--------------9CA3FC716232D88DDEBC1E39
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Armin,

This patch has been merged in master.
I've sent out a V2 of the upgrade patch for master branch, which solves 
conflict with this CVE patch.
Once the upgrade patch is merged into master, I'll send it out for the 
hardknott branch.

To put it short, I think hardknott branch should merge this CVE patch.

Best Regards,
Chen Qi


On 04/22/2021 10:11 AM, Chen Qi wrote:
> Hi All,
>
> I'll send out a patch to upgrade it to 2.2.20.
>
> Best Regards,
> Chen Qi
>
> On 04/21/2021 10:18 PM, Trevor Gamblin wrote:
>> From: Stefan Ghinea<stefan.ghinea@windriver.com>
>>
>> Backport the fix from meta-python master-next branch.
>>
>> In Django 2.2 before 2.2.20, 3.0 before 3.0.14, and 3.1 before 3.1.8,
>> MultiPartParser allowed directory traversal via uploaded files with
>> suitably crafted file names. Built-in upload handlers were not affected
>> by this vulnerability.
>>
>> References:
>> https://nvd.nist.gov/vuln/detail/CVE-2021-28658
>>
>> Upstream patches:
>> https://github.com/django/django/commit/4036d62bda0e9e9f6172943794b744a454ca49c2
>>
>> Signed-off-by: Stefan Ghinea<stefan.ghinea@windriver.com>
>> Signed-off-by: Khem Raj<raj.khem@gmail.com>
>> Signed-off-by: Trevor Gamblin<trevor.gamblin@windriver.com>
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
>> +From: Mariusz Felisiak<felisiak.mariusz@gmail.com>
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
>> +Signed-off-by: Stefan Ghinea<stefan.ghinea@windriver.com>
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
>> +SRC_URI +="file://CVE-2021-28658.patch \ +"
>>
>>
>>
>
>
>
> 
>


--------------9CA3FC716232D88DDEBC1E39
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <div class="moz-cite-prefix">Hi Armin,<br>
      <br>
      This patch has been merged in master.<br>
      I've sent out a V2 of the upgrade patch for master branch, which
      solves conflict with this CVE patch.<br>
      Once the upgrade patch is merged into master, I'll send it out for
      the hardknott branch.<br>
      <br>
      To put it short, I think hardknott branch should merge this CVE
      patch.<br>
      <br>
      Best Regards,<br>
      Chen Qi<br>
      <br>
      <br>
      On 04/22/2021 10:11 AM, Chen Qi wrote:<br>
    </div>
    <blockquote cite="mid:16780BC3FD5A103F.32615@lists.openembedded.org" type="cite">
      
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
        <pre wrap="">From: Stefan Ghinea <a moz-do-not-send="true" class="moz-txt-link-rfc2396E" href="mailto:stefan.ghinea@windriver.com">&lt;stefan.ghinea@windriver.com&gt;</a>

Backport the fix from meta-python master-next branch.

In Django 2.2 before 2.2.20, 3.0 before 3.0.14, and 3.1 before 3.1.8,
MultiPartParser allowed directory traversal via uploaded files with
suitably crafted file names. Built-in upload handlers were not affected
by this vulnerability.

References:
<a moz-do-not-send="true" class="moz-txt-link-freetext" href="https://nvd.nist.gov/vuln/detail/CVE-2021-28658">https://nvd.nist.gov/vuln/detail/CVE-2021-28658</a>

Upstream patches:
<a moz-do-not-send="true" class="moz-txt-link-freetext" href="https://github.com/django/django/commit/4036d62bda0e9e9f6172943794b744a454ca49c2">https://github.com/django/django/commit/4036d62bda0e9e9f6172943794b744a454ca49c2</a>

Signed-off-by: Stefan Ghinea <a moz-do-not-send="true" class="moz-txt-link-rfc2396E" href="mailto:stefan.ghinea@windriver.com">&lt;stefan.ghinea@windriver.com&gt;</a>
Signed-off-by: Khem Raj <a moz-do-not-send="true" class="moz-txt-link-rfc2396E" href="mailto:raj.khem@gmail.com">&lt;raj.khem@gmail.com&gt;</a>
Signed-off-by: Trevor Gamblin <a moz-do-not-send="true" class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
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
+From: Mariusz Felisiak <a moz-do-not-send="true" class="moz-txt-link-rfc2396E" href="mailto:felisiak.mariusz@gmail.com">&lt;felisiak.mariusz@gmail.com&gt;</a>
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
+[<a moz-do-not-send="true" class="moz-txt-link-freetext" href="https://github.com/django/django/commit/4036d62bda0e9e9f6172943794b744a454ca49c2">https://github.com/django/django/commit/4036d62bda0e9e9f6172943794b744a454ca49c2</a>]
+
+[SG: Adapted stable/2.2.x patch for 2.2.16]
+Signed-off-by: Stefan Ghinea <a moz-do-not-send="true" class="moz-txt-link-rfc2396E" href="mailto:stefan.ghinea@windriver.com">&lt;stefan.ghinea@windriver.com&gt;</a>
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
+SRC_URI += <a moz-do-not-send="true" class="moz-txt-link-rfc2396E" href="file://CVE-2021-28658.patch%5C+">&quot;file://CVE-2021-28658.patch \
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

--------------9CA3FC716232D88DDEBC1E39--
