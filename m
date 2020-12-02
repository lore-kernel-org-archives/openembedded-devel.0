Received: from NAM04-DM6-obe.outbound.protection.outlook.com (NAM04-DM6-obe.outbound.protection.outlook.com [40.107.102.89])
 by mx.groups.io with SMTP id smtpd.web12.5242.1606918135547175040
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Dec 2020 06:08:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=PjJ3EoM/;
 spf=pass (domain: windriver.com, ip: 40.107.102.89, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nwPLfwW86H9Q/WbwkdQEfUNAud0JT9byN33YDWZ3ZAdQ40ZD3YbK7IAFxHtxQ0Qmk9sUTtHqW6gmqfWmFSWYoiKiI3sx6xT9eDBQPZ04+Hm1uVQeu65N60+s4sDvB2EqFwO75B3mNJ4wwloVATaD685w5+JYVSnYss3qbz/PcVE2CdmrqSGb6r41ciQXMvsLK63NWaE/scqeHXZCzF1L9mHR1iPbXcFrF8FgNx7QF0kThxrt2sC+w8fvrKDiSTUcWUlEfIccouNh54qv7D18NI2KX3/KwU4k2SHG7JOtkKx95Sstp1fY5wTqRLN0eYHUaVRLsERljW1Upo8y07fx4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4wx6+4lKP9IFqtNBwUmtekVyg/LhhI2zPX/EqE9TjOw=;
 b=P5OJcxHl+vKznfrrQGfz4JP3W3YZvc+tUsz3JBGgktviPvat+udW83gTOgliwegq/r9Q0MJeFhMu3WfqTQn2LJ5XxM70ve0LjVufacJWFIJPCcx89+32y85SbOj//uqAqMiSVABQueEB/3am+nfCfe7WaYxB6UqZ/YlNOk9XadKDsW9UdVC/zVbyhXcRbvoAdwtjz3GJsNK6kcQH+SSAImCHJsj0V8haw81fEXUHX5KxRjJBWUJuAJvW+Zh0apFOIxSCr1mRYjRqL86F0vrbVsoVNqmtff4WcYR88KarMTbLvIq5SVEVoZQOhZDxEFQbjbBEHx3gOBkFZ5Df+hx4UA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4wx6+4lKP9IFqtNBwUmtekVyg/LhhI2zPX/EqE9TjOw=;
 b=PjJ3EoM/Nf3EfRrvGN52zmBRTPW9/Mh22gFxOcgTYgaWQK5bN/Ce2p+K1uzYJyGPx1WaBby0FBFZDYJT6treTXRj6S9hv0LFVwPWb3/XgNAIDn4UAHwgoOv6tHnGooW5u2C+QEW5vZXvfi8P0AJIiaL1evepO8zFo4lDiYvfHwA=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by SJ0PR11MB4864.namprd11.prod.outlook.com (2603:10b6:a03:2d4::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.24; Wed, 2 Dec
 2020 14:08:54 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::3b:680c:aa2f:e498]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::3b:680c:aa2f:e498%4]) with mapi id 15.20.3632.017; Wed, 2 Dec 2020
 14:08:54 +0000
Subject: Re: [oe] [meta-python][PATCH 00/16] Drop python3-pytest and others
To: Tim Orling <ticotimo@gmail.com>, openembedded-devel@lists.openembedded.org
References: <cover.1606592636.git.ticotimo@gmail.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <2e4b3035-0b91-4ac7-592f-32f2c7ae5574@windriver.com>
Date: Wed, 2 Dec 2020 09:08:50 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
In-Reply-To: <cover.1606592636.git.ticotimo@gmail.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: YTXPR0101CA0025.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::38) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by YTXPR0101CA0025.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00::38) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17 via Frontend Transport; Wed, 2 Dec 2020 14:08:53 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b7c78802-83d9-476e-dd1d-08d896cbcd26
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4864:
X-Microsoft-Antispam-PRVS: 
	<SJ0PR11MB4864144DBB324E70505409AD9FF30@SJ0PR11MB4864.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1923;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	hl3XB/Bc6UU8CyP2gNZ1VApvHqmS1x6CKFkcO8XzAnfMjjaS5JxaQ4Ur2CSJEwRoq2oDWyyKTyX6l7kmpjYfwTfKq4huXtDTMyiViJ6S14/3Y7OH2fjYfYZJdQlSmeOZmfFyOdwzTJw8YMMbgOWI5S3/9NqLgHjcI23KUL5fFvUVrcoafEh/zG44PsEn1ZRKZsc145XMpR7U/1YdqCK0V+Fojhk0pDyeH326Kv3wXzfMdsz1O9YcZCTQQwpla/9Hg4NHol6u37U+mHIEv5AUAP8IoN+GYNrDks8osQnZggeAGFseBKjFLxfEwc9/4JTiVQC7LCyYdGLGBNo6K/FTlzOCa1Vuqsk7uRMQUp3Y/Nr6hvXu7+cLmtWTs4L4Kw043gohIEiUs+X2/I9ozAuULutp/p1EUBI8NiqhIo8WeK3Ado7K86GU3zdyWNRT90AGgoKgugo7sTU/11lfisGobCRLx4RJxn8aDMe+FuSSt6jSsmmCyl5o275/PIS+3JQJ
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(376002)(346002)(396003)(366004)(39850400004)(2906002)(2616005)(26005)(83380400001)(31696002)(16526019)(66556008)(966005)(478600001)(66946007)(31686004)(66476007)(186003)(5660300002)(8936002)(33964004)(4001150100001)(52116002)(956004)(8676002)(53546011)(16576012)(316002)(166002)(36756003)(86362001)(6486002)(44832011)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?KzcxUjVobXBQUWxKNlpTZnJ4eGxMNFZjV1hiMExpOGExVDYxbDZWTXZ0REFT?=
 =?utf-8?B?QkpmcUNMbFVMNXB1Z3R2SGhDbkFlbWo0aFlUOEtzbkIyZk91WWg1b0JvVXBT?=
 =?utf-8?B?UnY2SEZsU0ZtL0VPaG9DaHBDa29vQkNiUFVpVlFCVGpyV0ppWjhldjZLZ0o3?=
 =?utf-8?B?YlFvSFlSRVE0QlJncjFRZDZzeHdTUWhvejhnRElBaVhTZjczblNSZXRJbjln?=
 =?utf-8?B?MHFjYm5Tb3B4T0xmRy9nSHRZbTFxY2FnVUEzQmEzQXRTVmdvZll5Nml1cDBn?=
 =?utf-8?B?Qk4zdlJPSm1jTG9RQUNkSjBZUHRKNTNkWEQrd2ZkWEp5N0dVUG9ZOE13N0pI?=
 =?utf-8?B?dWE5anVOWlMvVWw1dDRrUXljK3RReERKNUxoZGNWVmpHeTBNQWl6R0VVamFY?=
 =?utf-8?B?STNiN1JPZEZ0cExuREtORG9zbExvVExNNXBNU0l1U0w2R004bjBqQityZXgx?=
 =?utf-8?B?MXpLV1hWeGZQTC9UdVQ3SnliU3VxUHk5enR3dkY1RUswMExSTVNoRFVVOGNx?=
 =?utf-8?B?RE9BNFd3M2tNNGFWNHBtVjBHZk85NUhsUllZVk5PSWhKekhwRlFldXg0cDVr?=
 =?utf-8?B?Wkx2Ynd5ZkljOHp4WlR1elJsTUJ4YUdGYk9WNUc2UTJ4eHRjbyt1MGdWa1Ru?=
 =?utf-8?B?aTE0YnpLMFVrN1dSbE5SL1E1cUthWTFHUWl1M1JJeXpkNlR6RDA0SXBJSzlu?=
 =?utf-8?B?UHVVQ0VndXoyd2ZqVHd1VndDQzNmYUZ3YmhuWmI2ek9KRUNmSldGU21jZElp?=
 =?utf-8?B?VDVXZ0NXcndxK3dzSFRwSVlVUThHMEFEeSt2bCtWWUNVelIrZ0o5MDRuVzAy?=
 =?utf-8?B?bE04T1hWbmJOdHFUVkREUUdXRFNpTlBkTzA3S05BNjBpcXl3MGNEcnNQT3Zq?=
 =?utf-8?B?VTdTLy9pcEd6ZmNNT05odnRpRmRQdEtsNWEwQW1mZDlWNWlrUEtyeUVBWGZa?=
 =?utf-8?B?QkJwNWcxYWpCTk9hVUZodmhaZ2ZjZ1pzaklvcXFqSnZpNlFqLzVOdmJhb2d5?=
 =?utf-8?B?N2J3WW1yeG53SzdMUk05NHp6WEVHUDhKRUVmV0IxOVpRQldPR2ora3ZaOGRl?=
 =?utf-8?B?RHJPOGdGMlErSnh5Y1JpWFArSjZldUp5RUpEOEZrbW9kOHdEMDBKQWlCSko5?=
 =?utf-8?B?WXhneTkvWFFyTHdyOXd4TTR0VkVnZkY0OXl3bzF0RFh3aG5CQlFFRDhrenBT?=
 =?utf-8?B?TEV2bnhYMUlqelJJVW0xVTZDcWx0L0VicHlSeU5BTDhiMC8yVU1IS25vSEZa?=
 =?utf-8?B?dXFPOFB1cWsramljMW9UOVhnYk9KSlB0cUMvMEJwU1c1NjZFY0xUdDcrdnpM?=
 =?utf-8?Q?okyoK++RuFxvuSQSfdZ0P+6ju+/XDfV1Hc?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b7c78802-83d9-476e-dd1d-08d896cbcd26
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2020 14:08:53.9537
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ctMDrxwq+4M+UbY3Olxoaug9OJDTAH79/97h3DA5FXiM/0792q7rWAnoS+qkGRktz7zF6cKdtU+e6NB+XOhUAEc0rk6f0dd2LGUacRcnIA8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4864
Content-Type: multipart/alternative;
 boundary="------------B8E1D506B6F58ADEBF42A688"
Content-Language: en-US

--------------B8E1D506B6F58ADEBF42A688
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2020-11-28 2:46 p.m., Tim Orling wrote:
> [Please note this e-mail is from an EXTERNAL e-mail address]
>
> From: Tim Orling <ticotimo@gmail.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
>
> Once the 2 series for moving python3-pytest and the numpy ptest
> dependencies from meta-python are merged to openembedded-core, this
> series drops the moved recipes.
>
> The following changes since commit d9874ce27c7a2ff3ed2a3a2e5f6de810f10421ae:
>
>    python3-transitions: Upgrade 0.8.4 -> 0.8.5 (2020-11-27 11:54:04 -0800)
>
> are available in the Git repository at:
>
>    git://git.openembedded.org/meta-openembedded-contrib timo/drop-moved-python-modules
>    http://cgit.openembedded.org/meta-openembedded-contrib/log/?h=timo/drop-moved-python-modules
>
> Tim Orling (16):
>    python3-atomicwrites: drop (moved to oe-core)
>    python3-attrs: drop (moved to oe-core)
>    python3-iniconfig: drop (moved to oe-core)
>    python3-more-itertools: drop (moved to oe-core)
>    python3-pathlib2: drop (moved to oe-core)
>    python3-toml: drop (moved to oe-core)
>    python3-py: drop (moved to oe-core)
>    python3-setuptools-scm: drop (moved to oe-core)
>    python3-packaging: drop (moved to oe-core)
>    python3-wcwidth: drop (moved to oe-core)
>    python3-zipp: drop (moved to oe-core)
>    python3-importlib-metadata: drop (moved to oe-core)
>    python3-pluggy: drop (moved to oe-core)
>    python3-pytest: drop (moved to oe-core)
>    python3-hypothesis: drop (moved to oe-core)
>    python3-sortedcontainers: drop (moved to oe-core)
>
>   .../python/python3-atomicwrites/run-ptest     |  3 --
>   .../python/python3-atomicwrites_1.4.0.bb      | 25 ------------
>   .../python/python3-attrs_20.3.0.bb            | 20 ----------
>   .../python/python3-hypothesis_5.41.3.bb       | 14 -------
>   .../python3-importlib-metadata_2.0.0.bb       | 18 ---------
>   .../python/python3-iniconfig_1.1.1.bb         |  9 -----
>   .../python/python3-more-itertools/run-ptest   |  3 --
>   .../python/python3-more-itertools_8.5.0.bb    | 24 ------------
>   .../python/python3-packaging_20.4.bb          | 14 -------
>   .../python/python3-pathlib2_2.3.5.bb          | 13 -------
>   .../python/python3-pluggy/run-ptest           |  3 --
>   .../python/python3-pluggy_0.13.1.bb           | 27 -------------
>   .../python/python3-py_1.9.0.bb                | 15 -------
>   ...he-setup_requires-for-setuptools-scm.patch | 39 -------------------
>   .../python/python3-pytest_6.1.2.bb            | 38 ------------------
>   .../python/python3-setuptools-scm_4.1.2.bb    | 21 ----------
>   .../python/python3-sortedcontainers_2.3.0.bb  |  9 -----
>   .../python/python3-toml_0.10.2.bb             | 15 -------
>   .../python/python3-wcwidth/run-ptest          |  3 --
>   .../python/python3-wcwidth_0.2.5.bb           | 25 ------------
>   .../python/python3-zipp_3.4.0.bb              | 19 ---------
>   21 files changed, 357 deletions(-)
>   delete mode 100644 meta-python/recipes-devtools/python/python3-atomicwrites/run-ptest
>   delete mode 100644 meta-python/recipes-devtools/python/python3-atomicwrites_1.4.0.bb
>   delete mode 100644 meta-python/recipes-devtools/python/python3-attrs_20.3.0.bb
>   delete mode 100644 meta-python/recipes-devtools/python/python3-hypothesis_5.41.3.bb
>   delete mode 100644 meta-python/recipes-devtools/python/python3-importlib-metadata_2.0.0.bb
>   delete mode 100644 meta-python/recipes-devtools/python/python3-iniconfig_1.1.1.bb
>   delete mode 100644 meta-python/recipes-devtools/python/python3-more-itertools/run-ptest
>   delete mode 100644 meta-python/recipes-devtools/python/python3-more-itertools_8.5.0.bb
>   delete mode 100644 meta-python/recipes-devtools/python/python3-packaging_20.4.bb
>   delete mode 100644 meta-python/recipes-devtools/python/python3-pathlib2_2.3.5.bb
>   delete mode 100644 meta-python/recipes-devtools/python/python3-pluggy/run-ptest
>   delete mode 100644 meta-python/recipes-devtools/python/python3-pluggy_0.13.1.bb
>   delete mode 100644 meta-python/recipes-devtools/python/python3-py_1.9.0.bb
>   delete mode 100644 meta-python/recipes-devtools/python/python3-pytest/0001-setup.py-remove-the-setup_requires-for-setuptools-scm.patch
>   delete mode 100644 meta-python/recipes-devtools/python/python3-pytest_6.1.2.bb
>   delete mode 100644 meta-python/recipes-devtools/python/python3-setuptools-scm_4.1.2.bb
>   delete mode 100644 meta-python/recipes-devtools/python/python3-sortedcontainers_2.3.0.bb
>   delete mode 100644 meta-python/recipes-devtools/python/python3-toml_0.10.2.bb
>   delete mode 100644 meta-python/recipes-devtools/python/python3-wcwidth/run-ptest
>   delete mode 100644 meta-python/recipes-devtools/python/python3-wcwidth_0.2.5.bb
>   delete mode 100644 meta-python/recipes-devtools/python/python3-zipp_3.4.0.bb
>
> --
> 2.25.0
>
>
> 
>

--------------B8E1D506B6F58ADEBF42A688
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2020-11-28 2:46 p.m., Tim Orling
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:cover.1606592636.git.ticotimo@gmail.com">
      <pre class="moz-quote-pre" wrap="">[Please note this e-mail is from an EXTERNAL e-mail address]

From: Tim Orling <a class="moz-txt-link-rfc2396E" href="mailto:ticotimo@gmail.com">&lt;ticotimo@gmail.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a><br>
    <blockquote type="cite" cite="mid:cover.1606592636.git.ticotimo@gmail.com">
      <pre class="moz-quote-pre" wrap="">

Once the 2 series for moving python3-pytest and the numpy ptest
dependencies from meta-python are merged to openembedded-core, this
series drops the moved recipes.

The following changes since commit d9874ce27c7a2ff3ed2a3a2e5f6de810f10421ae:

  python3-transitions: Upgrade 0.8.4 -&gt; 0.8.5 (2020-11-27 11:54:04 -0800)

are available in the Git repository at:

  git://git.openembedded.org/meta-openembedded-contrib timo/drop-moved-python-modules
  <a class="moz-txt-link-freetext" href="http://cgit.openembedded.org/meta-openembedded-contrib/log/?h=timo/drop-moved-python-modules">http://cgit.openembedded.org/meta-openembedded-contrib/log/?h=timo/drop-moved-python-modules</a>

Tim Orling (16):
  python3-atomicwrites: drop (moved to oe-core)
  python3-attrs: drop (moved to oe-core)
  python3-iniconfig: drop (moved to oe-core)
  python3-more-itertools: drop (moved to oe-core)
  python3-pathlib2: drop (moved to oe-core)
  python3-toml: drop (moved to oe-core)
  python3-py: drop (moved to oe-core)
  python3-setuptools-scm: drop (moved to oe-core)
  python3-packaging: drop (moved to oe-core)
  python3-wcwidth: drop (moved to oe-core)
  python3-zipp: drop (moved to oe-core)
  python3-importlib-metadata: drop (moved to oe-core)
  python3-pluggy: drop (moved to oe-core)
  python3-pytest: drop (moved to oe-core)
  python3-hypothesis: drop (moved to oe-core)
  python3-sortedcontainers: drop (moved to oe-core)

 .../python/python3-atomicwrites/run-ptest     |  3 --
 .../python/python3-atomicwrites_1.4.0.bb      | 25 ------------
 .../python/python3-attrs_20.3.0.bb            | 20 ----------
 .../python/python3-hypothesis_5.41.3.bb       | 14 -------
 .../python3-importlib-metadata_2.0.0.bb       | 18 ---------
 .../python/python3-iniconfig_1.1.1.bb         |  9 -----
 .../python/python3-more-itertools/run-ptest   |  3 --
 .../python/python3-more-itertools_8.5.0.bb    | 24 ------------
 .../python/python3-packaging_20.4.bb          | 14 -------
 .../python/python3-pathlib2_2.3.5.bb          | 13 -------
 .../python/python3-pluggy/run-ptest           |  3 --
 .../python/python3-pluggy_0.13.1.bb           | 27 -------------
 .../python/python3-py_1.9.0.bb                | 15 -------
 ...he-setup_requires-for-setuptools-scm.patch | 39 -------------------
 .../python/python3-pytest_6.1.2.bb            | 38 ------------------
 .../python/python3-setuptools-scm_4.1.2.bb    | 21 ----------
 .../python/python3-sortedcontainers_2.3.0.bb  |  9 -----
 .../python/python3-toml_0.10.2.bb             | 15 -------
 .../python/python3-wcwidth/run-ptest          |  3 --
 .../python/python3-wcwidth_0.2.5.bb           | 25 ------------
 .../python/python3-zipp_3.4.0.bb              | 19 ---------
 21 files changed, 357 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-atomicwrites/run-ptest
 delete mode 100644 meta-python/recipes-devtools/python/python3-atomicwrites_1.4.0.bb
 delete mode 100644 meta-python/recipes-devtools/python/python3-attrs_20.3.0.bb
 delete mode 100644 meta-python/recipes-devtools/python/python3-hypothesis_5.41.3.bb
 delete mode 100644 meta-python/recipes-devtools/python/python3-importlib-metadata_2.0.0.bb
 delete mode 100644 meta-python/recipes-devtools/python/python3-iniconfig_1.1.1.bb
 delete mode 100644 meta-python/recipes-devtools/python/python3-more-itertools/run-ptest
 delete mode 100644 meta-python/recipes-devtools/python/python3-more-itertools_8.5.0.bb
 delete mode 100644 meta-python/recipes-devtools/python/python3-packaging_20.4.bb
 delete mode 100644 meta-python/recipes-devtools/python/python3-pathlib2_2.3.5.bb
 delete mode 100644 meta-python/recipes-devtools/python/python3-pluggy/run-ptest
 delete mode 100644 meta-python/recipes-devtools/python/python3-pluggy_0.13.1.bb
 delete mode 100644 meta-python/recipes-devtools/python/python3-py_1.9.0.bb
 delete mode 100644 meta-python/recipes-devtools/python/python3-pytest/0001-setup.py-remove-the-setup_requires-for-setuptools-scm.patch
 delete mode 100644 meta-python/recipes-devtools/python/python3-pytest_6.1.2.bb
 delete mode 100644 meta-python/recipes-devtools/python/python3-setuptools-scm_4.1.2.bb
 delete mode 100644 meta-python/recipes-devtools/python/python3-sortedcontainers_2.3.0.bb
 delete mode 100644 meta-python/recipes-devtools/python/python3-toml_0.10.2.bb
 delete mode 100644 meta-python/recipes-devtools/python/python3-wcwidth/run-ptest
 delete mode 100644 meta-python/recipes-devtools/python/python3-wcwidth_0.2.5.bb
 delete mode 100644 meta-python/recipes-devtools/python/python3-zipp_3.4.0.bb

--
2.25.0

</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------B8E1D506B6F58ADEBF42A688--
