Received: from NAM12-DM6-obe.outbound.protection.outlook.com (NAM12-DM6-obe.outbound.protection.outlook.com [40.107.243.46])
 by mx.groups.io with SMTP id smtpd.web08.8191.1615813274194531365
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Mar 2021 06:01:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=R2RJ52CL;
 spf=pass (domain: windriver.com, ip: 40.107.243.46, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TO+rrJZkVzjr0hp8u0+MRstX5SNO99kjLM8NCE92nnMzTRk7Z7/9EZ2psGBvv6vt/uDG6/hO8WlN+5Wt0j8ZW0WwQNjYZeJx4Xgwp1czUxr/GyQgheJymg05IfbRhTmokvszc0svm7k0eG7nPZN/uIO9SVqVlbEMBowSDy3YSciTRalfthCtqMntufP/HsO72mBq2FTdNC6R8gBJcy02/G0kwD24n6PzP2nE6hn/t6ZDW4AitiQ2gwnqVqgIFkrFnUeRJ3ZsqfhRw0Y4HFFbsFETgF+oRCjGQVT0RRBwRU+/HovniX4f+zSlb/FBrJ0M7UbSBDh/qj67quvOKelFNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vJxXS10I638hnDxHMQFxnKafs2pa9kyDWPmFl5GidJU=;
 b=nWhg8IEtfZlHZK4l63nGXn75H8Xzn9D0LE/2w1klQICtFb8TPkSo+zq0oQY0ZXGzdaLsSjkTPjRYmlOuoXDtAAS6P5csJJuW9V9MoW0FcNN0Te0QueSQ48vfRE1xExMt6zujf1EW7/XhMhxcervAg1Jd7o7frKv1R3BN8/dbLehJWZKoEiboNhuPDT5luZhiGI7lNUnjKwN2etmo9c6DilK42QLtMhiTYMiyBOxOgsvKTTxp/LkBxBtwqqyk8T5nLSSfcjXBerzoHnmOxQl7cpb0cqHEyne9LcMgY4Y6qA98vDbM7CB9KuepcU2DtmQk5hHs+bIEOYprPOoHE2ahdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vJxXS10I638hnDxHMQFxnKafs2pa9kyDWPmFl5GidJU=;
 b=R2RJ52CLPz0CDy469Icyqo1m0wyKaSlZjaI0yEsqphlB9O3k582jDuNSu7j7hmav7Jia7jdDgUq2CK/a9knjPNsfTfWg+2AEdBWULsN0M1gewjlztKZEYUnkQ1icT5ncm2yDRStsqD1DbMORKwHIqv4EbwMNjeEAqFvQMgigofE=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB2901.namprd11.prod.outlook.com (2603:10b6:a03:91::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32; Mon, 15 Mar
 2021 13:01:12 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447%7]) with mapi id 15.20.3933.032; Mon, 15 Mar 2021
 13:01:12 +0000
Subject: Re: [oe] [meta-python][PATCH 3/5] python3-pyscaffold: Upgrade 3.3.1 -> 4.0
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20210312162600.8335-1-leon.anavi@konsulko.com>
 <20210312162600.8335-3-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <09689b41-7ff8-bf34-729a-070ee84307b1@windriver.com>
Date: Mon, 15 Mar 2021 09:01:08 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
In-Reply-To: <20210312162600.8335-3-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: BN9PR03CA0362.namprd03.prod.outlook.com
 (2603:10b6:408:f7::7) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by BN9PR03CA0362.namprd03.prod.outlook.com (2603:10b6:408:f7::7) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32 via Frontend Transport; Mon, 15 Mar 2021 13:01:11 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9312e784-3ae3-4680-b9af-08d8e7b268f2
X-MS-TrafficTypeDiagnostic: BYAPR11MB2901:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB290148C0C27BA1305BD1F0FA9F6C9@BYAPR11MB2901.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1107;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	J9LTAkkeA8OT0+kbZ9yU1uxpFs6d1faejRzmBcTjUTU2mfy4yg9Wht2F+RCAtrX2N0AAgaYPNKG30AkZqrOViUdHuzegq46JMmyFRCsTF4tjd5P3Iggf1olAU1ZoUFeL/Z0wFjVtT2W6hG18Y6WJ9clyBysrmFPbJfUhWKZq3Li9ZZD1V+E0gekg07IRsZD5hPYoiikRH35caFOoLSqESHVfpBi/3+JPdpwDZ3EiWUVTx304ouVFLnt5zovX7flBf+G3FNs/yqiIJV+rZXaFFJSYxMBw76yw1a/B+XLdLuxIq/Gf83NN/hIA4yYqtmOpW1G08KCFSSy49zY/b1IpXd8fmJWJ3NgX4v+jWAfyVy9PjhhLAJZNZLv8iNoMjWQZdceovRb2zfVkmfRwbMOibU88bJLrrQ7GdK7LGKhIV6luOJJjO6nD6vr+YKM0PrriXUtWQgqs6kC9vXAjMj5IEaBnjeIU3iDeZWfeoGMJH9ZnJk7pmt4LIuLidz4qAqzaZ+8txISAdsURNgWwwX1LHSAGejEQxJ6qQMROjURPEsgFXPKlvUKpAFiLSUhikpM0JKPESRIKYlvSA4APiToi24nOi9J+B30MuNtEnJTdBHyHebv3Q2ADHDoDEEwDLGhqe7yyzwWaVm/vdqUQsDdyqmpMvyMyiVgPaZnWxOIxYajYnVe1W7pwosF4pbyn67j/2WYoBmmbgWD/hh/tEmOpjgKfkywbabTBRuWtlQFO0Ac=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(136003)(39840400004)(366004)(396003)(26005)(36756003)(2616005)(8676002)(166002)(956004)(16576012)(186003)(966005)(31686004)(16526019)(478600001)(86362001)(83380400001)(66476007)(8936002)(66556008)(53546011)(5660300002)(33964004)(6486002)(2906002)(6666004)(31696002)(44832011)(316002)(66946007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?dFpzYURTS3hGRVE1V0hjMXRlYkJFbWVncVFRdGt5WlJENmdFSldwVlBtRFU0?=
 =?utf-8?B?L0EwN2xScGdNZzRtUmIrVTVSalgzbVViK1VkYnNHckMrcVhsazZqWkhNZnZI?=
 =?utf-8?B?Nmh1a2IyalE3bDROVlFLbDJUNlJyQ1J0c3B4NlBZWldCZGRvNWpmT2taNWxG?=
 =?utf-8?B?aFdSWFd6d3dTeW1USEZzNGRNT0RDVmpyR2RTb1ZPeUV5U1BmZzNJMGJVV2dP?=
 =?utf-8?B?K3JzZjBVZmlNWHpTNUVVelVYV3RwM2thbnhIZHJpeVVXZHhRaEZmbi9zVFd3?=
 =?utf-8?B?dmk0MUxkNitNVEJFSEtjVkpuU2ZHRHdBNHJWVHkwWCsxZGxSbVQrc3lFaURS?=
 =?utf-8?B?dVBVb1dwR1BqMXRvQkFzWm4wM2xuVmVKRERMakgxT2ptRExoS05GdmZqcjF4?=
 =?utf-8?B?UkIxaHg4SFRhR3NYdk1TdlY3WWMxLzJzbEN0dm83K0hNczNzZk5rSVFpaG1X?=
 =?utf-8?B?aFhuZUVJOEVLVEd4OVFpQ3dZTGFvcVdKU0wzTVQ4d3ZCOHkxeVRrUlFQcWhl?=
 =?utf-8?B?aUlCaFRXajQ2MHZXTGxMK0FpZzZMaHV5dDFwOVMvd3pabFk1TFVkdlpRcjg4?=
 =?utf-8?B?L0dXL2VKcXdNQ2lnSTBTNHhBa2lKSjRBTEFESWJUVlhpN3NGWStMRWRkWWJs?=
 =?utf-8?B?Rk1vdC9nZjhCWDFHdGpRSUFHM28yYVhvdTJlR2h4M1BZOFhJOTVlVVNibkZM?=
 =?utf-8?B?Yng2cit6SHhoN3VTSzZaUXRwMlhMQjFrRG1sMU5kTEw5UHpVdmplNzl2YjJN?=
 =?utf-8?B?dFBuMk5ncmFCN2RpWjdRZWd2cEFqbElHdHYzaThVTVRhakMxNGh0cDJvK1Yv?=
 =?utf-8?B?VDh1RmtPc0o5OW1ZNmxWUGNhbDlINExvQld2UDRBV1k2cDZ6Sm5VMGZCTzAz?=
 =?utf-8?B?d3lWODBkMElGWHlUdWxyM1NUdTRHSzc4bXo5Vjk0Wkxic2NrKzhFQkpaMGx6?=
 =?utf-8?B?dEMwWU9ST2FmaTMxci9jbmFycHN1bXVDbzl6YjhLZk5LS3pSMlhxUDVCajlW?=
 =?utf-8?B?a0R0Z3U5clRkQnNoNDJORUp6NVhKOFpMY3g1dklrSjN3Y3dlcThiSUJiSXQr?=
 =?utf-8?B?T2hNTTFOanExZkEvRk4rN2ZIeGZBcUcvaWw1cytDT1NxTlFRSHMrNUxSTUlC?=
 =?utf-8?B?VVI4Z3NRNzZVQXFPTHpLYkRVeXJlT3E4OFdHU2dRNTl5OHBBR0N0U3NHenpF?=
 =?utf-8?B?cE56S3VWK1BXTmNLVUloalNaMTBWcmp0UzdicTBWcHp0VE5lRnlsNWoyQnpG?=
 =?utf-8?B?Y09TcjBnZGFrV21rclU4Nkk3Z0xxYTE5czdZMFNKNWpNZmltQnN2KytmUDBm?=
 =?utf-8?B?RVFBOFpqUFFSREhLL29XamY1NVBZcCtWa01ZOWFyWXd2aVJXZjJ1TURrMnZH?=
 =?utf-8?B?V05UUzhzV0JobnNUSzB2VXJvYWdSN0g2UGRxUTN0N0RPeHlSWG44SzhENFdu?=
 =?utf-8?B?c3pYTTZCRy9TdkdLUG92MVRrRXBwMFRBYUhjOFBFdTFJbjBlbXAyR1RTSEU0?=
 =?utf-8?B?cGxOWU5uVFUvVnZMdDNSRHZ5SWhTMkxrNkRFLzRBZUpJS3J3dmdlTlFBN1hr?=
 =?utf-8?B?TnRIV0llOWFJdjBnUGE5OStJOElnd2RTWHQyRDVnY0NLWXBLdGVLQ3RDZ1dK?=
 =?utf-8?B?dGMxWHgvdS81dm9oMC82WVdzejhnZmVCYjRQMDRqTDB1NERrS25xdWlPdjZl?=
 =?utf-8?B?ZWtYMUd5NlB6NC9WTlRQZlBZb0F0ZDNFeEhzRU11eWdCR2RKMDBQQUE5Rmhs?=
 =?utf-8?Q?R0jJpV05Otn5gq5vsr+nULFEyfXri95oAkCcPFJ?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9312e784-3ae3-4680-b9af-08d8e7b268f2
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2021 13:01:12.7495
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xrF+XncZ0tqlKxbfnvl4Xem0OtopvNTDW8OjT5c4fJE6WEzYR3JvcjSLXZgh2vot6nLbyaWXzEYd+7oZWKk/0VabMF+OFlUXfcr9yvXwHrI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2901
Content-Type: multipart/alternative;
 boundary="------------025021094D9D0B0FF584298F"
Content-Language: en-US

--------------025021094D9D0B0FF584298F
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-03-12 11:25 a.m., Leon Anavi wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
> Upgrade to release 4.0:
>
> - Cookiecutter, Django and Travis extensions extracted to their
>    own repositories
> - Support for Python 3.4 and 3.5 dropped
> - Dropped deprecated requirements.txt file
> - Added support for global configuration (avoid retyping common
>    putup's options)
> - PyScaffold is no longer a build-time dependency, it just
>    generates the project structure
> - Removed contrib subpackage, vendorized packages are now runtime
>    dependencies
> - setuptools_scm is included by default in setup.cfg, setup.py and
>    pyproject.toml
> - API changed to use pyscaffold.operations instead of integer
>    flags
> - Allow string.Template and callable as file contents in project
>    structure
> - Extract file system functions from utils.py into file_system.py
> - Extract identification/naming functions from utils.py into
>    identification.py
> - Extract action related functions from api/__init__.py to
>    actions.py
> - helpers.{modify,ensure,reject} moved to structure.py
> - helpers.{register,unregister} moved to actions.py
> - New extension for automatically creating virtual environments
>    (--venv)
> - Added instructions to use pip-tools to docs
> - pre-commit extension now attempts to install hooks automatically
> - A nice message is now displayed when PyScaffold finishes running
>    (actions.report_done)
> - Removed mutually exclusive argparse groups for extensions
> - Progressive type annotations adopted in the code base together
>    with mypy linting
> - Simplified isort config
> - pyproject.toml and isolated builds adopted by default
> - Added comment to setup.cfg template instructing about extra links
> - Generate tox.ini by default
> - Replace pkg_resources with importlib.{metadata,resources} and
>    packaging
> - Adopt PEP 420 for namespaces
> - Adopt SPDX identifiers for the license field in setup.cfg
> - Removed deprecated log.configure_logger
> - Add links to issues and pull requests to changelog
> - Add an experimental --interactive mode (inspired by git rebase -i)
> - Reorganise the FAQ (including version questions previously in
>    Features)
> - Updated setuptools and setuptools_scm dependencies to minimal
>    versions 46.1 and 5, respectively
> - Adopted no-guess-dev version scheme from setuptools_scm
>    (semantically all stays the same, but non-tag commits are now
>    versioned LAST_TAG.post1.devN instead of LAST_TAG.post0.devN)
> - Fix problem of not showing detailed log with --verbose if error
>    happens when loading extensions
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../{python3-pyscaffold_3.3.1.bb => python3-pyscaffold_4.0.bb}  | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>   rename meta-python/recipes-devtools/python/{python3-pyscaffold_3.3.1.bb => python3-pyscaffold_4.0.bb} (85%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-pyscaffold_3.3.1.bb b/meta-python/recipes-devtools/python/python3-pyscaffold_4.0.bb
> similarity index 85%
> rename from meta-python/recipes-devtools/python/python3-pyscaffold_3.3.1.bb
> rename to meta-python/recipes-devtools/python/python3-pyscaffold_4.0.bb
> index 9bebcedd3..1ad33c10d 100644
> --- a/meta-python/recipes-devtools/python/python3-pyscaffold_3.3.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-pyscaffold_4.0.bb
> @@ -12,6 +12,6 @@ inherit pypi setuptools3
>
>   PYPI_PACKAGE = "PyScaffold"
>
> -SRC_URI[sha256sum] = "1c3a2b76e60319b6ffc2a8b54e240382109c6241576bf0a47ea476c7194f6a69"
> +SRC_URI[sha256sum] = "7012ae5f9c95b910a39a099824104dc888beb932de86b07514882f3511bc6c74"
>
>   BBCLASSEXTEND = "native nativesdk"
> --
> 2.17.1
>
>
> 
>

--------------025021094D9D0B0FF584298F
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-03-12 11:25 a.m., Leon Anavi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210312162600.8335-3-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">[Please note: This e-mail is from an EXTERNAL e-mail address]

Upgrade to release 4.0:

- Cookiecutter, Django and Travis extensions extracted to their
  own repositories
- Support for Python 3.4 and 3.5 dropped
- Dropped deprecated requirements.txt file
- Added support for global configuration (avoid retyping common
  putup's options)
- PyScaffold is no longer a build-time dependency, it just
  generates the project structure
- Removed contrib subpackage, vendorized packages are now runtime
  dependencies
- setuptools_scm is included by default in setup.cfg, setup.py and
  pyproject.toml
- API changed to use pyscaffold.operations instead of integer
  flags
- Allow string.Template and callable as file contents in project
  structure
- Extract file system functions from utils.py into file_system.py
- Extract identification/naming functions from utils.py into
  identification.py
- Extract action related functions from api/__init__.py to
  actions.py
- helpers.{modify,ensure,reject} moved to structure.py
- helpers.{register,unregister} moved to actions.py
- New extension for automatically creating virtual environments
  (--venv)
- Added instructions to use pip-tools to docs
- pre-commit extension now attempts to install hooks automatically
- A nice message is now displayed when PyScaffold finishes running
  (actions.report_done)
- Removed mutually exclusive argparse groups for extensions
- Progressive type annotations adopted in the code base together
  with mypy linting
- Simplified isort config
- pyproject.toml and isolated builds adopted by default
- Added comment to setup.cfg template instructing about extra links
- Generate tox.ini by default
- Replace pkg_resources with importlib.{metadata,resources} and
  packaging
- Adopt PEP 420 for namespaces
- Adopt SPDX identifiers for the license field in setup.cfg
- Removed deprecated log.configure_logger
- Add links to issues and pull requests to changelog
- Add an experimental --interactive mode (inspired by git rebase -i)
- Reorganise the FAQ (including version questions previously in
  Features)
- Updated setuptools and setuptools_scm dependencies to minimal
  versions 46.1 and 5, respectively
- Adopted no-guess-dev version scheme from setuptools_scm
  (semantically all stays the same, but non-tag commits are now
  versioned LAST_TAG.post1.devN instead of LAST_TAG.post0.devN)
- Fix problem of not showing detailed log with --verbose if error
  happens when loading extensions

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20210312162600.8335-3-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../{python3-pyscaffold_3.3.1.bb =&gt; python3-pyscaffold_4.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pyscaffold_3.3.1.bb =&gt; python3-pyscaffold_4.0.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-pyscaffold_3.3.1.bb b/meta-python/recipes-devtools/python/python3-pyscaffold_4.0.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-pyscaffold_3.3.1.bb
rename to meta-python/recipes-devtools/python/python3-pyscaffold_4.0.bb
index 9bebcedd3..1ad33c10d 100644
--- a/meta-python/recipes-devtools/python/python3-pyscaffold_3.3.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pyscaffold_4.0.bb
@@ -12,6 +12,6 @@ inherit pypi setuptools3

 PYPI_PACKAGE = &quot;PyScaffold&quot;

-SRC_URI[sha256sum] = &quot;1c3a2b76e60319b6ffc2a8b54e240382109c6241576bf0a47ea476c7194f6a69&quot;
+SRC_URI[sha256sum] = &quot;7012ae5f9c95b910a39a099824104dc888beb932de86b07514882f3511bc6c74&quot;

 BBCLASSEXTEND = &quot;native nativesdk&quot;
--
2.17.1

</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------025021094D9D0B0FF584298F--
