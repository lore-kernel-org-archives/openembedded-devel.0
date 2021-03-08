Received: from NAM11-CO1-obe.outbound.protection.outlook.com (NAM11-CO1-obe.outbound.protection.outlook.com [40.107.220.56])
 by mx.groups.io with SMTP id smtpd.web12.36101.1615212043408973030
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Mar 2021 06:00:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=UxzjnR84;
 spf=pass (domain: windriver.com, ip: 40.107.220.56, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aOlQEjDMAcm4DnPA5ublAN/V0p9502NP4STZWcheQOVsUv/cjLV649uAjcLiV5N719CNpsF6stLSOwwxDo4CV8PgJA2BHxi+1jg9e8T6GFyBOn6QiMRlhrgqt+zx5wY4m2hQOFFV4f6cwNtuXzE5l3IRKDwgkupvDN0FrURILDX7jytcwTleGtKSk06F8SYFz+o4phyxNrBsP5gk3GOVRNbY3pxTTDWhKsbxRLrGh2Bco5wRrHsmEL5nA8Mm55tVaNGtBFcLcXt2AeKhGlsyflKcQfXwPIqQTab5N+Nd5loLLCysQSBy3NmEEN67mCvV3uAI+dLXxFUtjw/fKXNUvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QW8EEBLhB7EAtHHXWgN5iheKw1Nw7IvK94kao8uG73w=;
 b=kb6VoS80WUSmCYQGqt4BB2GfJTMmF2iSZE7gUGcpvkdfCw8cc4w53Gmgo/8taV7iICQNnXb6SEelWq5p31fSGsN0nk72W6nhqETBUSir4YANn+Nzpcme1lnNbTZyAQcjrrhZ4XuBmZj0NnJMujF+ITQDsFQHOeTnH9ZJ08Y9L6TwndYe2H4vzNRAGOuQhqtPitkZuwaUl8RksYzQwjQLvCOJejPHP+E820LiGOKHd139G2rpnNI2KDbHKpGVuO46ORPXZ9RKwhw2qCLgtU03aVlBv1baDHeyvDlSFadsoVfwr+ZIOCtVuFBhl5M8uBcL2XA9YSape2LRO0xuGhFycA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QW8EEBLhB7EAtHHXWgN5iheKw1Nw7IvK94kao8uG73w=;
 b=UxzjnR84zIvGJahafeE0WrjG+q0hxjjV0KAwK05QF917uRbzvVC19ej+bdyKs9wXftG9OWcd4OxEN7G1Ybaw57K/Ikj4mNPN1aaSc+xbRcV4t2eUL2JRp3GcMoGgjLoO+XOX+UoyIyXmOZ5FxjC23Wwb+u9SyCSRGYRsGQpWlP8=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BY5PR11MB3895.namprd11.prod.outlook.com (2603:10b6:a03:18e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.27; Mon, 8 Mar
 2021 14:00:38 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447%7]) with mapi id 15.20.3890.037; Mon, 8 Mar 2021
 14:00:38 +0000
Subject: Re: [oe] [meta-python][PATCH] python3-twisted: Upgrade 20.3.0 -> 21.2.0
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20210302110606.18503-1-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <8bd894a5-7daf-c8b6-fe15-8c8a32b2d0e5@windriver.com>
Date: Mon, 8 Mar 2021 09:00:35 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
In-Reply-To: <20210302110606.18503-1-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: BN0PR02CA0053.namprd02.prod.outlook.com
 (2603:10b6:408:e5::28) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by BN0PR02CA0053.namprd02.prod.outlook.com (2603:10b6:408:e5::28) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17 via Frontend Transport; Mon, 8 Mar 2021 14:00:38 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e52e96d5-b5c2-4fb6-9681-08d8e23a8da1
X-MS-TrafficTypeDiagnostic: BY5PR11MB3895:
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB38954398DDA1CB29C1520BFA9F939@BY5PR11MB3895.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	eGQ37RpyFz/Bxwom2gdA2L941BkCSu77r1Tk0Pg6hnyOXNfQB3sW+Oz9a/GBG1NC01zOs2quwvx1GLTxnwCOGD+6cO5pt6ID5srSOwoJn97ZL9/jiEarCssqWXOqpeoij3t/xRXrF2VU/JmvVQVSRuP6dtrssPtA4Wn03/fWGFJYYaQPhyIdTXZCK7Eaas8sLH0oAKYui270DyDQ0/yMglIFMu4+Vq0SbRk23PSBT9ubzbBIBEs0ZtWZHsMiiCrdVRYbTDU/03yHqLTddhAGJmqOCIvmoKuvGZ9rIbYG5I6T7sxtuc1g4U289MGH2T/89yv0T2mRDhhwoWV59mcWy8kccCBjaFVp6lidcdT8fwDWdloMEwpGkYHKo1fzPc/xnhwKbZ9ek5S/sqbqn96dmTpatX62b045fkDUgwdGY5R0ZwYhMMfkw+x4RfveJDmSdjHQYRuR05eV9Q+2Gs4Z6JBFfmQr02ZfqjSVDeVlXBZHY0X/7q0RaO8/WiuvTPkXmSM0rtUCGNM/yJXyIOvpSPAXy2qwfoKuYKgve+3uYSlW4NIy0w9sHpUvunBt0sz21GbRDgoSM5+/i13Aka/aB+QmueNq8go1bCIejspyEVNhU8utbJaPESETvYc7TIPg6HLVyM+HduupQc5jHML1qkT2/HSaJzkelnsrzz0jkqs40/euzKFBaSg4cJ2TjU1U
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(366004)(136003)(346002)(396003)(39850400004)(86362001)(33964004)(2906002)(16526019)(26005)(44832011)(53546011)(8676002)(6486002)(956004)(316002)(31696002)(8936002)(186003)(16576012)(2616005)(6666004)(31686004)(166002)(478600001)(36756003)(66476007)(30864003)(66574015)(5660300002)(966005)(66946007)(83380400001)(66556008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?UlQyM2hsOUorYTdpQWM1dG02dUhmdEpkTDJnRjROMHhIUXI5Tm5sdmJTelBN?=
 =?utf-8?B?ampjZC8vVjE4U2oyMStYV05wYVZGamtyTW1XRENoZVZGQ1drcGdXeXErSmQ2?=
 =?utf-8?B?UjA3cUlsNU9uUlZzd1Fic0tLcHJHRHpsYXdvZ0ZWcjBhb3lVZTRrRzBZNUEr?=
 =?utf-8?B?bXNJUVFGd29ETDBtZVhiTkxGSFV3dVB6aXovS045YS9PNVhzSXBTY3BnbzFN?=
 =?utf-8?B?N0FSTXc4SENPK3hMRUJZeDR1Sk4yZkRMQTZyTldYZ2tmdHJ5dWYxOFFNZkpa?=
 =?utf-8?B?VnlQWEgxdUFSK245R21ib3VRRkxrZXJybTJ5dzhWWkNKcUJUdS9kY0hQdWZm?=
 =?utf-8?B?RCsxSHJ4NkRIUDJKQWJFcnoxMDdjN0xnUzJ5bXViM2JtMVdud093cDVXVDJJ?=
 =?utf-8?B?ZklNcmJad1JMN1JyNVUxYkd1eEhuamg0NHBqTnZNVVIva2pKNnJwMmhiS3dY?=
 =?utf-8?B?Uk5sOWdBQkxydFJhWUcxUll3Q0NDc09BalNxbm10SHNuakZTd3g0ZmxGdmov?=
 =?utf-8?B?WHBjL0cvcXdnb0s4VjVFL2h5K2NIbnQxS083Z3VrMU40ZFh4V3pyQVdkMGFJ?=
 =?utf-8?B?T0JZendIREcySXhuV05yRlVwdDg1YXVJOFd2VmJSd091SURkS05odWRIMkJy?=
 =?utf-8?B?TUlrQUFoMm9DcXFQYitpTjlmWEZueVlhdkE1Vi9kL1pEcUlGazNSQ3FhYnAr?=
 =?utf-8?B?ZU03dVlRMlViR0dEMnVSY3oyVlIyR2JNTUU0QW8zSEFpT0FUYzJaNSsvd0RQ?=
 =?utf-8?B?ckV0YW9rMERXNHE4bkpCR09JVnVsM0EwMk5RY2pQZ3c4L2Ywd1p1Qkc4Qll1?=
 =?utf-8?B?VXdHSXRRRTV3SERVRDBHMzg4OWtNU1ZCMlhWTWMybzJLbnhtUDZTcDhCU21w?=
 =?utf-8?B?Y0dXeVk5RVZCZnROdEsyR0RLaEl5ampHTDFPam9zdDk0Rk04dG8zYytUa20z?=
 =?utf-8?B?d2ZEeERMK3BKdWF6RkpYMkVlVWNHZDdHYS9lZGhIczA5OXkyRlBDQXU4cXZo?=
 =?utf-8?B?SnhIYWVuQzQ5TDBHVGRvWW5lQjBOWVFvZzVwaEcxUVBmOVZUcVJCNUFGbnY2?=
 =?utf-8?B?VGlZc055V3pMazA3Zmx0WS9TWW5yV1hiTVVjVW1RSUZHS0tTM3dOOG9GMnJw?=
 =?utf-8?B?WHIrY0lUV3BBcUo5UGw1YVp5Q1pENDNZckl0dmhOODZLVU1mU1orSWcwVmNy?=
 =?utf-8?B?ZDc1c0ViRndYRzlGNnUzanA2SGRvWVJlMmNrSHRlOWVBSDkzQjN3MGNlSUdv?=
 =?utf-8?B?cWRKZHRNUWJ3VHRqTDVQQUFjdnA0YXowaEs0bWIyVkU5dkpvcWsrQ2FvRE5R?=
 =?utf-8?B?QXI4SUtQOFJnZ29RMS9teVJsb2FaYXdwSDJPdXlMank2MGRZcFk4WHNHZUZp?=
 =?utf-8?B?WUUxQXF4bGNseFJpWTQxQklUcndwV0g1dkVpNDdDUFVKOXJNZWd6cWJwMW9h?=
 =?utf-8?B?L3BmWmd4SzJHcS9UWmUxN2FkcjF4dGVIOG5qTkdOTEh6TDJKb00xbW9mMzVy?=
 =?utf-8?B?MTMxbkpDdjgwUHo4c0tEUGxoQ1RYYmljbzUvWXI3dE0xUml4N1hyVmtYWHp3?=
 =?utf-8?B?Qll5ZmMyNlJTQmF0dlg2RWtzNEk5R0wybU4wcitINk9TTWdJS0dsbnhwR2Q5?=
 =?utf-8?B?Y1FNYzdoZU93cFJqeWtKM0ZwRjFCczV3aXEySytiKzhScTNVY2FoMEc4S0hQ?=
 =?utf-8?B?NzRrMnU2R0NGSmNCT1VOb1lKZTBMT2RqNTRXMFFFSU04VUlQRGd5VmZ5bEd4?=
 =?utf-8?Q?ocmIXLdVpxqQWYRag1mBw98/TQNrZ8g9UyR4ylE?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e52e96d5-b5c2-4fb6-9681-08d8e23a8da1
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2021 14:00:38.6931
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LyCds1b4i5TI10qNJoaQQaxO3ZGx+mwS22RxWgoZsGcmt9fcmrwRxZSzdz4sFZUriK0/Oxh0e3o5N9uiJjQlOIKmazIdKal85MA3+IQ0JLw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB3895
Content-Type: multipart/alternative;
 boundary="------------ABECEF7A77ED0367B5C60980"
Content-Language: en-US

--------------ABECEF7A77ED0367B5C60980
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-03-02 6:06 a.m., Leon Anavi wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
> Upgrade to release 21.2.0:
>
> - The enableSessions argument to twisted.internet.ssl.CertificateOptions
>    now actually enables/disables OpenSSL's session cache. Also, due
>    to session-related bugs, it defaults to False.
> - twisted.internet.defer.inlineCallbacks and ensureDeferred will
>    now associate a contextvars.Context with the coroutines they run,
>    meaning that ContextVar objects will maintain their value within
>    the same coroutine, similarly to asyncio Tasks. This functionality
>    requires Python 3.7+, or the contextvars PyPI backport to be
>    installed for Python 3.5-3.6.
> - twisted.internet.defer.Deferred.fromCoroutine has been added.
>    This is similar to the existing ensureDeferred function, but is
>    named more consistently inside Twisted and does not pass through
>    Deferreds.
> - trial now allows the @unittest.skipIf decorator to specify that
>    an entire test class should be skipped.
> - The twisted.python.deprecate.deprecatedKeywordParameter decorator
>    can be used to mark a keyword paramater of a function or method
>    as deprecated.
> - Projects using Twisted can now perform type checking against a
>    Twisted installation, for example using mypy.
> - twisted.python.util.InsensitiveDict now fully implements
>    MutableMapping.
> - Python 3.8 is now tested and supported.
> - Support a coroutine function in twisted.internet.task.react.
> - PyPy 3.7 is now tested and supported.
> - twisted.web.twcgi.CGIProcessProtocol.processEnded(...) now
>    handles an already-finished request, for example when
>    request.connectionLost(...) was called previously.
> - Twisted's dependency on PyHamcrest has been moved from the base
>    package to the new "test" extra. Consequently the test extra
>    must be installed for Twisted's test suite to pass.
> - Fixed serialization of timedelta, date, and time objects in
>    twisted.spread.
> - twisted.internet.asyncioreactor.AsyncioSelectorReactor now raises
>    an exception if instantiated with an event loop which is not
>    compatible with asyncio.SelectorEventLoop. This fixes the
>    AsyncioSelectorReactor in Python 3.8+ on Windows, where in bp-34687
>    the default Windows asyncio event loop was changed to
>    ProactorEventLoop. Applications that use AsyncioSelectorReactor
>    on Windows with Python 3.8+ must call
>    asyncio.set_event_loop_policy(asyncio.WindowsSelectorEventLoopPolicy())
>    before instantiating and running AsyncioSelectorReactor.
> - twisted.internet.process.registerReapProcessHandler and
>    ._BaseProcess.reapProcess will no longer raise a TypeError when
>    processing a None PID
> - INotify will close its file descriptor if a directory is
>    automatically removed by twisted from the watchlist because it's
>    deleted, avoiding orphaned filedescriptors.
> - DelayedCall.reset() is now working properly with asyncioreactor.
> - AsyncioSelectorReactor.seconds() now correctly returns an epoch
>    time.
> - The _connDone parameter has been removed from
>    twisted.internet.abstract.FileDescriptor.loseConnection()'s
>    signature in order to match the signature in the base class
>    twisted.internet._newtls.ConnectionMixin loseConnection().
> - The Gtk3 reactor now runs on Wayland-only sessions
> - Descriptive error messages from twisted.internet.error are now
>    present when running with 'python -OO'.
> - Comparator methods such as eq() now always return NotImplemented
>    for uncomparable types.
> - When installing Twisted it now requires a minimum Python 3.5.4
>    version to match the version used with automated testing. This
>    is the minimum Python version that we know that Twisted works
>    with.
>
> License-Update: Add contributors and update year.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...python3-twisted_20.3.0.bb => python3-twisted_21.2.0.bb} | 7 +++----
>   1 file changed, 3 insertions(+), 4 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-twisted_20.3.0.bb => python3-twisted_21.2.0.bb} (98%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-twisted_20.3.0.bb b/meta-python/recipes-devtools/python/python3-twisted_21.2.0.bb
> similarity index 98%
> rename from meta-python/recipes-devtools/python/python3-twisted_20.3.0.bb
> rename to meta-python/recipes-devtools/python/python3-twisted_21.2.0.bb
> index 697725fd71..e0f1a8ca6e 100644
> --- a/meta-python/recipes-devtools/python/python3-twisted_20.3.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-twisted_21.2.0.bb
> @@ -5,13 +5,11 @@ HOMEPAGE = "http://www.twistedmatrix.com"
>
>   #twisted/topfiles/NEWS:655: - Relicensed: Now under the MIT license, rather than LGPL.
>   LICENSE = "MIT"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=27ac6d9597237e7e76282edd7a40cd68"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=e33c411c0b86b1f3ca299091ed51ca31"
>
> -SRC_URI[sha256sum] = "d72c55b5d56e176563b91d11952d13b01af8725c623e498db5507b6614fc1e10"
> -SRC_URI[md5sum] = "fc16d575730db7d0cddd09fc35af3eea"
> +SRC_URI[sha256sum] = "77544a8945cf69b98d2946689bbe0c75de7d145cdf11f391dd487eae8fc95a12"
>
>   PYPI_PACKAGE = "Twisted"
> -PYPI_PACKAGE_EXT = "tar.bz2"
>
>   inherit pypi setuptools3
>
> @@ -201,6 +199,7 @@ ${libdir}/${PYTHON_DIR}/site-packages/Twisted*egg-info \
>   ${libdir}/${PYTHON_DIR}/site-packages/twisted/logger/ \
>   ${libdir}/${PYTHON_DIR}/site-packages/twisted/_threads/ \
>   ${libdir}/${PYTHON_DIR}/site-packages/twisted/positioning/ \
> +${libdir}/${PYTHON_DIR}/site-packages/twisted/py.typed \
>   "
>
>   FILES_${PN}-mail = " \
> --
> 2.17.1
>
>
> 
>

--------------ABECEF7A77ED0367B5C60980
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-03-02 6:06 a.m., Leon Anavi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210302110606.18503-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">[Please note: This e-mail is from an EXTERNAL e-mail address]

Upgrade to release 21.2.0:

- The enableSessions argument to twisted.internet.ssl.CertificateOptions
  now actually enables/disables OpenSSL's session cache. Also, due
  to session-related bugs, it defaults to False.
- twisted.internet.defer.inlineCallbacks and ensureDeferred will
  now associate a contextvars.Context with the coroutines they run,
  meaning that ContextVar objects will maintain their value within
  the same coroutine, similarly to asyncio Tasks. This functionality
  requires Python 3.7+, or the contextvars PyPI backport to be
  installed for Python 3.5-3.6.
- twisted.internet.defer.Deferred.fromCoroutine has been added.
  This is similar to the existing ensureDeferred function, but is
  named more consistently inside Twisted and does not pass through
  Deferreds.
- trial now allows the @unittest.skipIf decorator to specify that
  an entire test class should be skipped.
- The twisted.python.deprecate.deprecatedKeywordParameter decorator
  can be used to mark a keyword paramater of a function or method
  as deprecated.
- Projects using Twisted can now perform type checking against a
  Twisted installation, for example using mypy.
- twisted.python.util.InsensitiveDict now fully implements
  MutableMapping.
- Python 3.8 is now tested and supported.
- Support a coroutine function in twisted.internet.task.react.
- PyPy 3.7 is now tested and supported.
- twisted.web.twcgi.CGIProcessProtocol.processEnded(...) now
  handles an already-finished request, for example when
  request.connectionLost(...) was called previously.
- Twisted's dependency on PyHamcrest has been moved from the base
  package to the new &quot;test&quot; extra. Consequently the test extra
  must be installed for Twisted's test suite to pass.
- Fixed serialization of timedelta, date, and time objects in
  twisted.spread.
- twisted.internet.asyncioreactor.AsyncioSelectorReactor now raises
  an exception if instantiated with an event loop which is not
  compatible with asyncio.SelectorEventLoop. This fixes the
  AsyncioSelectorReactor in Python 3.8+ on Windows, where in bp-34687
  the default Windows asyncio event loop was changed to
  ProactorEventLoop. Applications that use AsyncioSelectorReactor
  on Windows with Python 3.8+ must call
  asyncio.set_event_loop_policy(asyncio.WindowsSelectorEventLoopPolicy())
  before instantiating and running AsyncioSelectorReactor.
- twisted.internet.process.registerReapProcessHandler and
  ._BaseProcess.reapProcess will no longer raise a TypeError when
  processing a None PID
- INotify will close its file descriptor if a directory is
  automatically removed by twisted from the watchlist because it's
  deleted, avoiding orphaned filedescriptors.
- DelayedCall.reset() is now working properly with asyncioreactor.
- AsyncioSelectorReactor.seconds() now correctly returns an epoch
  time.
- The _connDone parameter has been removed from
  twisted.internet.abstract.FileDescriptor.loseConnection()'s
  signature in order to match the signature in the base class
  twisted.internet._newtls.ConnectionMixin loseConnection().
- The Gtk3 reactor now runs on Wayland-only sessions
- Descriptive error messages from twisted.internet.error are now
  present when running with 'python -OO'.
- Comparator methods such as eq() now always return NotImplemented
  for uncomparable types.
- When installing Twisted it now requires a minimum Python 3.5.4
  version to match the version used with automated testing. This
  is the minimum Python version that we know that Twisted works
  with.

License-Update: Add contributors and update year.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a><br>
    <blockquote type="cite" cite="mid:20210302110606.18503-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...python3-twisted_20.3.0.bb =&gt; python3-twisted_21.2.0.bb} | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-twisted_20.3.0.bb =&gt; python3-twisted_21.2.0.bb} (98%)

diff --git a/meta-python/recipes-devtools/python/python3-twisted_20.3.0.bb b/meta-python/recipes-devtools/python/python3-twisted_21.2.0.bb
similarity index 98%
rename from meta-python/recipes-devtools/python/python3-twisted_20.3.0.bb
rename to meta-python/recipes-devtools/python/python3-twisted_21.2.0.bb
index 697725fd71..e0f1a8ca6e 100644
--- a/meta-python/recipes-devtools/python/python3-twisted_20.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-twisted_21.2.0.bb
@@ -5,13 +5,11 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="http://www.twistedmatrix.com">&quot;http://www.twistedmatrix.com&quot;</a>

 #twisted/topfiles/<a class="moz-txt-link-freetext" href="NEWS:655">NEWS:655</a>: - Relicensed: Now under the MIT license, rather than LGPL.
 LICENSE = &quot;MIT&quot;
-LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=27ac6d9597237e7e76282edd7a40cd68">&quot;file://LICENSE;md5=27ac6d9597237e7e76282edd7a40cd68&quot;</a>
+LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=e33c411c0b86b1f3ca299091ed51ca31">&quot;file://LICENSE;md5=e33c411c0b86b1f3ca299091ed51ca31&quot;</a>

-SRC_URI[sha256sum] = &quot;d72c55b5d56e176563b91d11952d13b01af8725c623e498db5507b6614fc1e10&quot;
-SRC_URI[md5sum] = &quot;fc16d575730db7d0cddd09fc35af3eea&quot;
+SRC_URI[sha256sum] = &quot;77544a8945cf69b98d2946689bbe0c75de7d145cdf11f391dd487eae8fc95a12&quot;

 PYPI_PACKAGE = &quot;Twisted&quot;
-PYPI_PACKAGE_EXT = &quot;tar.bz2&quot;

 inherit pypi setuptools3

@@ -201,6 +199,7 @@ ${libdir}/${PYTHON_DIR}/site-packages/Twisted*egg-info \
 ${libdir}/${PYTHON_DIR}/site-packages/twisted/logger/ \
 ${libdir}/${PYTHON_DIR}/site-packages/twisted/_threads/ \
 ${libdir}/${PYTHON_DIR}/site-packages/twisted/positioning/ \
+${libdir}/${PYTHON_DIR}/site-packages/twisted/py.typed \
 &quot;

 FILES_${PN}-mail = &quot; \
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

--------------ABECEF7A77ED0367B5C60980--
