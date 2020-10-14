Received: from NAM10-DM6-obe.outbound.protection.outlook.com (NAM10-DM6-obe.outbound.protection.outlook.com [40.107.93.43])
 by mx.groups.io with SMTP id smtpd.web10.836.1602637234742823730
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Oct 2020 18:00:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=KzYeampT;
 spf=pass (domain: windriver.com, ip: 40.107.93.43, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IJ7b+41OtWfZkhvgRrI77mNtIqqWLsCbXPpLWkR5c6/NCtgGlph/qL7b3SEDfUzuwcaXywfRT+4wosFOFvAXFrQtBH83sk0rp3eH424dIJfVeH5Q5e4/cHZzHrreXBPKjRDpZ5j8XRJYRDgNwpXqh6BMK+lDdVreLs2oKfJxqoBHi8+UeuxF/3RjLcwGAUSSzUe/CCwdTuSMkuaStBqeOpOvyAQLO33XkQGf9Ha/tBl5XCaDRJiP3BQp5m1/3xpoS2PjpC/mktJ/07V/LJP69MuMawQ3zEZ3YJlIcHqFurCkYs2pK89GiV1+HXlfTiJbYD96dbZaoCO40DtkRj5dFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zr5TDlMP5LBxVBvlHU4FdrFDBHzz/NfcOqH88CEqcco=;
 b=Xsd/fI+36NjDik2/7d1k4I1afGi/Gkma5I6d2gJutQg83ORTPM6fjAwLTVM4dHffPfhse7KSxDvrZCZaWhm50xkB31+2LQaVn1PDswFjyPtFFWci0PE0tUpwLj7eyr51q70NlI5p+5V4LL3zmyVxhDGUIAhsWHEKWpq+B+AEnso4KHCqYqjmBZy/py1QU2QoZcbp2J7L0L8Lsezw7qmdl+xlKoocpWyX3PC2aYmCF+yBsC1FaIitcBVeEhfvQMPO8YPUYVSpe1UXARwdCne4xJ+gLs65UFofh2njrVmERNGqtwAWuLvzhhWPjPJ6UyyODkHepUfx9LGuGxwdFnbhYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zr5TDlMP5LBxVBvlHU4FdrFDBHzz/NfcOqH88CEqcco=;
 b=KzYeampTmvdP0W4EijOkNPI4Wb76i0rzl1jEzksPQSXuHUtvsWQOtT/PH0fRZYsmOvgGk3/6SJiX8y67Hdw9GFnledvw/K3Dx8nRtchK5rHVwoiqttqdUDYSnd9f+zGbOzDoNSnPVzB3EUHwwzBf3aDRdoXMkap+/Q6nVUbSDb0=
Authentication-Results: cisco.com; dkim=none (message not signed)
 header.d=none;cisco.com; dmarc=none action=none header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB3558.namprd11.prod.outlook.com (2603:10b6:a03:b3::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.25; Wed, 14 Oct
 2020 01:00:32 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::7875:99b3:15ae:5df2]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::7875:99b3:15ae:5df2%7]) with mapi id 15.20.3455.030; Wed, 14 Oct 2020
 01:00:32 +0000
Subject: Re: [oe] [meta-python][PATCH] python3-paramiko: fixing runtime dependencies
To: Khem Raj <raj.khem@gmail.com>, openembedded-devel@lists.openembedded.org
Cc: Siming Yuan <siyuan@cisco.com>
References: <20201007052509.3526946-1-raj.khem@gmail.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <afe5a405-d84f-bac9-8549-578b46020b11@windriver.com>
Date: Tue, 13 Oct 2020 21:00:29 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
In-Reply-To: <20201007052509.3526946-1-raj.khem@gmail.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: BYAPR04CA0021.namprd04.prod.outlook.com
 (2603:10b6:a03:40::34) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by BYAPR04CA0021.namprd04.prod.outlook.com (2603:10b6:a03:40::34) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.20 via Frontend Transport; Wed, 14 Oct 2020 01:00:31 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8442aab7-da03-4a57-a6fb-08d86fdc8cef
X-MS-TrafficTypeDiagnostic: BYAPR11MB3558:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB35580A19532266F32157FD189F050@BYAPR11MB3558.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1923;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	QwGvQu86lmMgKukOyZagr7mqThgc1V/kSw9AYOKLgOllPpXkgxRN2a0C1Sg9rpu6r42ii1VtjjCIfDlXrIUVxtwAjQhgrjxwNBmt3OPkHMEXpxEnN9aJBEkka75eDehwk0fmD1HMCyzOF2ZJq7ktdV73EsJimrpJLpQUBdkbhz7Pk2hYB34Cp1LZ8mfaJ4zkQmex/ePCfwNbngdcp3Rvvr0yp9AFVY4DwHbJ+IaCBVJm5qT4DMlLeCrLVxZyv5fuL4TS0Rfo/7P05ZL1mvU71z+pvrItCzoYFjeZS2BjcAaXNlmqPa/elVFPYxAFANX/aOCfgBt2Q5LSDoS7aOQOYdIdrdNLYu1OZRnzO/Rvn7OCvjAyUQxyej68tm0Kvi+Fy8iDIqzyQL6zWRwa911X30oHOd2qoweVW7mCj8Yt4B9KRseOMFIsB7hOqFyqeLRtGiNqSHmmDNB1QEQYoKsFKA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(346002)(396003)(39840400004)(136003)(376002)(53546011)(33964004)(186003)(8936002)(16526019)(966005)(478600001)(8676002)(2906002)(26005)(83380400001)(52116002)(5660300002)(6486002)(4326008)(31696002)(31686004)(66556008)(83080400001)(316002)(66476007)(66946007)(86362001)(166002)(44832011)(36756003)(2616005)(956004)(16576012)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	ASuewMy4vUqjjrM3RDHQiSMpi6qIddJplA0GfJzLei6RqlmQbm6J8k+6m1AHgOvIr14Cldfbr6Mb4Cczk51SH61HQQ9Rs888fFvMdSEa6poBsO6gpQyouP4OFYGiB1sOB/oxfxzzMz2E7v+U9CPDxO4pAeX8gPLnRnzpHqVHETNs1oPW1AmZwXoYCLxwIvCfyiv85e3u7J+UiTeIoF2VVJqhgtHxXP/l9+aUJ162S+x4vcNconQzadEroTU3DDjML0v8I89aIhBXCq0gS2536V7sLb2d6oU/RYzjY2DvvnbVV3UL6jI85UEzVdSjdto0SchH44Jel7pSFTifjQXwe0gqCwN0aKSnPtnbm36LGZbh+Xda3ljDUhkMBtLkw6ldzrPqusfRwzjqvVKAIrhb9TKcnh1H/9+B6rExg1xKgcMTu0X36yvBYmZlyXrvuYL72mZI8koe8DSE6NbAOa/YHAVxhabG5M5rIhhLJr87jtdvZ1+y27gqnd0MiruOVPQS+fih1p9ec4TzVKec22vTaPObDfxBoISm1zXv97II9oNcQq0fYHDhqWqtMKTRTy2AYrZKTkxGvPWv6kariDwKtw5k1nGdGoGowPFWEnBERAguR+cIVlJ1c/1O2h1y+i3di0UaoAhu+EXFlI4Chmzq8w==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8442aab7-da03-4a57-a6fb-08d86fdc8cef
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2020 01:00:32.5167
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: meoSYEurXd3g+8pY1f9IOwnKILeUUk55WxPgXZeMs0YCD7McC6al4LBK/hXfhR3Oflq9H/kJgkn9ZuCiE3Qq5K6TYG9g9SrFYVvTzMVsXOE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3558
Content-Type: multipart/alternative;
 boundary="------------32067AC9A1CE7DA6269B0C3B"
Content-Language: en-US

--------------32067AC9A1CE7DA6269B0C3B
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


On 10/7/20 1:25 AM, Khem Raj wrote:
> From: Siming Yuan <siyuan@cisco.com>
>
> added rdepends to bcrypt, cryptography, pynacl as required by the
> actual python package
>
> Signed-off-by: Siming Yuan <siyuan@cisco.com>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>

Overlooked this one until now, sorry. Looks like it's still missing 
something. Installing python3-paramiko on core-image-minimal, I see:

root@qemux86-64:~# python3
Python 3.8.5 (default, Jul 20 2020, 13:26:22)
[GCC 10.2.0] on linux
Type "help", "copyright", "credits" or "license" for more information.
 >>> import paramiko
Traceback (most recent call last):
   File "<stdin>", line 1, in <module>
   File "/usr/lib/python3.8/site-packages/paramiko/__init__.py", line 
22, in <module>
     from paramiko.transport import SecurityOptions, Transport
   File "/usr/lib/python3.8/site-packages/paramiko/transport.py", line 
37, in <module>
     from paramiko import util
   File "/usr/lib/python3.8/site-packages/paramiko/util.py", line 34, in 
<module>
     from paramiko.config import SSHConfig
   File "/usr/lib/python3.8/site-packages/paramiko/config.py", line 25, 
in <module>
     import getpass
ModuleNotFoundError: No module named 'getpass'
 >>>

> ---
>   .../recipes-devtools/python/python3-paramiko_2.7.2.bb        | 5 +++++
>   1 file changed, 5 insertions(+)
>
> diff --git a/meta-python/recipes-devtools/python/python3-paramiko_2.7.2.bb b/meta-python/recipes-devtools/python/python3-paramiko_2.7.2.bb
> index 324847c31b..1b81171f68 100644
> --- a/meta-python/recipes-devtools/python/python3-paramiko_2.7.2.bb
> +++ b/meta-python/recipes-devtools/python/python3-paramiko_2.7.2.bb
> @@ -12,3 +12,8 @@ inherit pypi setuptools3
>   
>   CLEANBROKEN = "1"
>   
> +RDEPENDS_${PN} += "\
> +    ${PYTHON_PN}-bcrypt \
> +    ${PYTHON_PN}-cryptography \
> +    ${PYTHON_PN}-pynacl \
> +"
>
> 
>

--------------32067AC9A1CE7DA6269B0C3B
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 10/7/20 1:25 AM, Khem Raj wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20201007052509.3526946-1-raj.khem@gmail.com">
      <pre class="moz-quote-pre" wrap="">From: Siming Yuan <a class="moz-txt-link-rfc2396E" href="mailto:siyuan@cisco.com">&lt;siyuan@cisco.com&gt;</a>

added rdepends to bcrypt, cryptography, pynacl as required by the
actual python package

Signed-off-by: Siming Yuan <a class="moz-txt-link-rfc2396E" href="mailto:siyuan@cisco.com">&lt;siyuan@cisco.com&gt;</a>
Signed-off-by: Khem Raj <a class="moz-txt-link-rfc2396E" href="mailto:raj.khem@gmail.com">&lt;raj.khem@gmail.com&gt;</a></pre>
    </blockquote>
    <p>Overlooked this one until now, sorry. Looks like it's still
      missing something. Installing python3-paramiko on
      core-image-minimal, I see:</p>
    <p>root@qemux86-64:~# python3<br>
      Python 3.8.5 (default, Jul 20 2020, 13:26:22) <br>
      [GCC 10.2.0] on linux<br>
      Type &quot;help&quot;, &quot;copyright&quot;, &quot;credits&quot; or &quot;license&quot; for more
      information.<br>
      &gt;&gt;&gt; import paramiko<br>
      Traceback (most recent call last):<br>
      &nbsp; File &quot;&lt;stdin&gt;&quot;, line 1, in &lt;module&gt;<br>
      &nbsp; File &quot;/usr/lib/python3.8/site-packages/paramiko/__init__.py&quot;,
      line 22, in &lt;module&gt;<br>
      &nbsp;&nbsp;&nbsp; from paramiko.transport import SecurityOptions, Transport<br>
      &nbsp; File &quot;/usr/lib/python3.8/site-packages/paramiko/transport.py&quot;,
      line 37, in &lt;module&gt;<br>
      &nbsp;&nbsp;&nbsp; from paramiko import util<br>
      &nbsp; File &quot;/usr/lib/python3.8/site-packages/paramiko/util.py&quot;, line
      34, in &lt;module&gt;<br>
      &nbsp;&nbsp;&nbsp; from paramiko.config import SSHConfig<br>
      &nbsp; File &quot;/usr/lib/python3.8/site-packages/paramiko/config.py&quot;, line
      25, in &lt;module&gt;<br>
      &nbsp;&nbsp;&nbsp; import getpass<br>
      ModuleNotFoundError: No module named 'getpass'<br>
      &gt;&gt;&gt;<br>
    </p>
    <blockquote type="cite" cite="mid:20201007052509.3526946-1-raj.khem@gmail.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../recipes-devtools/python/python3-paramiko_2.7.2.bb        | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-paramiko_2.7.2.bb b/meta-python/recipes-devtools/python/python3-paramiko_2.7.2.bb
index 324847c31b..1b81171f68 100644
--- a/meta-python/recipes-devtools/python/python3-paramiko_2.7.2.bb
+++ b/meta-python/recipes-devtools/python/python3-paramiko_2.7.2.bb
@@ -12,3 +12,8 @@ inherit pypi setuptools3
 
 CLEANBROKEN = &quot;1&quot;
 
+RDEPENDS_${PN} += &quot;\
+    ${PYTHON_PN}-bcrypt \
+    ${PYTHON_PN}-cryptography \
+    ${PYTHON_PN}-pynacl \
+&quot;
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------32067AC9A1CE7DA6269B0C3B--
