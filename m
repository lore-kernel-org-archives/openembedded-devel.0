Received: from NAM11-CO1-obe.outbound.protection.outlook.com (NAM11-CO1-obe.outbound.protection.outlook.com [40.107.220.47])
 by mx.groups.io with SMTP id smtpd.web09.35519.1611578380678936323
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Jan 2021 04:39:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=bl2eQrot;
 spf=pass (domain: windriver.com, ip: 40.107.220.47, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WfenhJmxZQdt7zhxHbw29QzZ79Zp1n1oefh62uDuClTPp2ep1wXwuuPMnhqkhImTvFEpQhBSO4SC+KdWKwgNdx1Ru1Fmp2/r2+ZKPYAkcdryNsHX6opMoTHCy0y9xYqm5xKhWUWVnKkGsgOXDBsiseFoMFjODUEF/e7n11jk42sILrvKTZWcLHHbTNJeV5B8A8KUC/09QQ50tdF6RMEQHcG9ZEd6M72/mJk3vWvuCnk5VysWoAFPyJwA2p+CzQcv0Ty6nRLeqy9FH97CKNxo0nyWeVHHt3PoYBpk+LYITD7qUg6SSBNwPwuLObaZaJN4/EggPs5VjGMqW69epaghPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NlMwLPri5PhRnVEWZT9OGw75DukAISc+EWzapOl4UzA=;
 b=YxtV2/yohz9dqg7NvO9v4zPP3SoLIN8nUvD5043w2HEiePyJB11hrDiwoqALfSfFcpkkIQ/KlC+bYHIOBF50Ww3mK7KEELEGsCkIJctq7VvyycybtnL7gEf+lftYL3oEU1ZVZEudPuoO5R8eRxQfgmF0hJBDblJ16NS6BIaYK8BjfF19XD2qfUqzljO09e/D+tZM7kiBfzuDPut9lZIHT/FU7FSIlbrK3Rgr+WOHrPIb9iSAMfllH4ulOQAn5fc0KgKqdwS39BcKpDO5/GyYmEQqbPljet5KSDKonaUerv6J4n/We62Tqp373gVmE+KzR1uaAAKjtNgLaBBbrfEwDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NlMwLPri5PhRnVEWZT9OGw75DukAISc+EWzapOl4UzA=;
 b=bl2eQrotIJQhQH0JsahypTEPCyNK036dVkB9dsZSJZ2ol74mDF6Q3jKxu9CsUkkB0+OQS5rK61mjYfpr2EWpVBdj8Ndsnbg1iMSK54+qeOE/gQNGouhQyCk6OpgLz0jPDpvYM50KqBFedzbyqaHMpGV3KteIuIf+gFfWsVr2Kbk=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from MN2PR11MB3919.namprd11.prod.outlook.com (2603:10b6:208:13b::27)
 by MN2PR11MB3984.namprd11.prod.outlook.com (2603:10b6:208:153::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.13; Mon, 25 Jan
 2021 12:39:38 +0000
Received: from MN2PR11MB3919.namprd11.prod.outlook.com
 ([fe80::5462:9c04:72b3:6c44]) by MN2PR11MB3919.namprd11.prod.outlook.com
 ([fe80::5462:9c04:72b3:6c44%7]) with mapi id 15.20.3763.019; Mon, 25 Jan 2021
 12:39:38 +0000
Subject: Re: [oe] [meta-python][PATCH 5/5] python3-pyserial: Upgrade 3.4 -> 3.5
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20210120111027.12947-1-leon.anavi@konsulko.com>
 <20210120111027.12947-5-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <aa02d29f-867e-c05f-689d-5b49c6027ad7@windriver.com>
Date: Mon, 25 Jan 2021 07:39:36 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
In-Reply-To: <20210120111027.12947-5-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: CH0PR13CA0020.namprd13.prod.outlook.com
 (2603:10b6:610:b1::25) To MN2PR11MB3919.namprd11.prod.outlook.com
 (2603:10b6:208:13b::27)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by CH0PR13CA0020.namprd13.prod.outlook.com (2603:10b6:610:b1::25) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.5 via Frontend Transport; Mon, 25 Jan 2021 12:39:37 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6f933cff-781f-4307-c55e-08d8c12e474c
X-MS-TrafficTypeDiagnostic: MN2PR11MB3984:
X-Microsoft-Antispam-PRVS: 
	<MN2PR11MB3984B9BFF9D7A5409263BE299FBD9@MN2PR11MB3984.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	bqibYztLb+kM0yVaPuwLwaPLs0wY64/bLbjd3ag7MlbAui2AAsFoyPjp1oF+y8dBwnMLGslqnOG30MxNrLOt9evCwA4ffGrdKIC10a4un2Y0tzCMlfqao95oddRQhgVEYE5GFcJZVeDwd13QFt60lN1awsdi0i/wQWxPZ70VENoiy3cVDVNotnpgbEXeidaEpgdUkYZNAT5f9AjtxAiciviWBmH98Jxypz4f8t1AcV8feqjlREYKxjivQvLBwMz42kfGxklUCtG694gE1DlJsUy9JwLv9dh8BaMPBrma7tYJBRAtfYwg10K+b9t8c3epAn93Z4bOpmXQ/xTLGeBaSjWNV6u1x7Wi6WB9qeBH6F2LA+b3x1EPheW6HzWqG7vIPx0PyxbhQxQIr6tsVdk67nRuiJkQUQ2QXglqo36X+5Zrn7hmUnc+iJLhSbyMJkEwux+XbWf0cYOKjfTvyKpdXLmq2LM0lVqUf8V81fU+EsffNHF9yO+mHANyAFZbMpKFaD91OIPkpuuvYBKBQO50OxYiQtx4SjtCnh7HmAR6x/ICAlHb+8Jont5x1ritFAButs1fMUR0jD9L/sl7vL8edg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR11MB3919.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(346002)(136003)(396003)(366004)(39840400004)(8936002)(33964004)(5660300002)(86362001)(31696002)(2616005)(6486002)(478600001)(44832011)(83380400001)(956004)(31686004)(966005)(66946007)(66476007)(66556008)(36756003)(8676002)(52116002)(2906002)(316002)(16576012)(186003)(16526019)(53546011)(26005)(166002)(43740500002)(45980500001)(460985005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?K1VLRjBYek52bGhMdCt0ckI5TDFRTmthNHNJSWVadWVEWEdMRkphTWFVYTVK?=
 =?utf-8?B?TFRhUy9hR01OejdXYkxBa0lIVTZqZ0NaaXU3elQ2dWh4ajc1TWQzbVpKdG94?=
 =?utf-8?B?S3Q0OXhaL3lweUVaS05rNlZmZTJkaU1leUNHNDdLYk5uTzZxN1RIYVFielNx?=
 =?utf-8?B?dUJGWng5MHo3c2pGWXl2a09zeWZaYVEybWdCTE94S29OODRWbm9Qc3NkbE1Q?=
 =?utf-8?B?UGpWd3hQMDNEV0MyakVaOWV2TXlCdmFZY1V5cm5ReTllb25WaTVOTERLNVNv?=
 =?utf-8?B?OG4yZXhUSEZyZ2ZMa3pCdTB4Yy9ncTIwMFlUUjNYZzdidEM2S0hoQUIvZG5r?=
 =?utf-8?B?dHh3Z3lqVllUZWw4WVZoaVZwWU51VWtFcU52QlgvQy92VkIvb3FZMnJuL2ZB?=
 =?utf-8?B?ZThTMG1PYXAyajFwZUtGMzdrNThNNVJrR2I1dkpnT1pkamptNkpXNVdaTnM5?=
 =?utf-8?B?L2FGS2VaOTdJMGVWWFVERm8vVExyZFJrbkJycjcvQWw1SUo2VitDMVplbXRH?=
 =?utf-8?B?cUNjQkNVd2JSalNzZiszR1UvOS90QzZCNXlNTTZZV3dyUDA0NUE4NCtjM1dL?=
 =?utf-8?B?WDZtYytxdXNUNTBIQ1FLcCtpdzFuOVlYekloNFRwYW5KZTZmb1Z6cHhLc3dU?=
 =?utf-8?B?b1RVeXR3L2NjYUMxWDdRRzlhTnpuOUo3UFBoSmoyUExwQTFQbFR0bFpiTjVh?=
 =?utf-8?B?czVrbGhJbENFb0EyY3NEY2hjT1UxL2h6ZHArRHBvSkpxR05LOGw0NW9nY3BC?=
 =?utf-8?B?QnlmOWFEZkpNK2JWMUxWb0xTSlZOTVM0UE43RXNpRmRPRU9VVGdySDFocVBB?=
 =?utf-8?B?c0ljTUtXWTRZcCtSRnVIYlRZNzliUDF6N0xNMkxieFR6R01QWU1JQlhwZTlD?=
 =?utf-8?B?amc3bUJTNVZMemNyQlkyNXhERm1MU1c0MXRUT1p3Tjh0SGdEeWt5S05yODVT?=
 =?utf-8?B?Z0c2WXFPcnBqcXVTYXRwczIyUUZPTVl5a09tODV0T1FNM09OVElnQnZnMGF1?=
 =?utf-8?B?TXdGUFE5dXBsc09PRzJ5b0tHYWcxUVg2MHk0NFhpcWlyS3JQQVdJSGZ1dERk?=
 =?utf-8?B?YVE4Z1NGUkxEUGZzdlFSRW5hY2J1Wm1aamxCbkhqamxDbFZ1WVFtZkZYWUJx?=
 =?utf-8?B?Ym9iS0dYdG9sT2lPZDJYRHV1MXQwdFpBZHdqeC9KckNTYW9jTG02cmtzeHIv?=
 =?utf-8?B?bFE1VHpXWWNyTm5mdlk3bFhEMnNORVZYTWtzUEh0RVlhZWhBb1ptdjNaU1FY?=
 =?utf-8?B?eUNBTThYa3pZcm56cHdST0Y1MThxbW9YeVpER1ZjZXpQeGQyVndyRmVGM1Bp?=
 =?utf-8?Q?TKnBmDJ1JZsMT90aTGsy5uVs69kjam/O3/?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f933cff-781f-4307-c55e-08d8c12e474c
X-MS-Exchange-CrossTenant-AuthSource: MN2PR11MB3919.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2021 12:39:38.3234
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h6ae0cbSs0GpxMELhitKNYSqOBNfyuOjghXrfH21ZTF4ZoXn3CHxI4kRuNCilLjwncmy57sSKKsVUSLO83+PdD2q0j/DcF/3pGj2euRsGuA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB3984
Content-Type: multipart/alternative;
 boundary="------------A1545D8E7ABED80ABFEB9877"
Content-Language: en-US

--------------A1545D8E7ABED80ABFEB9877
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-01-20 6:10 a.m., Leon Anavi wrote:
> - iAdd a backend for Silicon Labs CP2110/4 HID-to-UART bridge.
>    (depends on hid module)
> - Use absolute import everywhere
> - win32: miniterm Working CMD.exe terminal using Windows 10 ANSI
>    support
> - Make ListPortInfo hashable
> - threaded: "write" returns byte count
> - Add bytesize and stopbits argument parser to tcp_serial_redirect
> - loop: add out_waiting
> - list_ports_linux: Correct "interface" property on Linux hosts
> - Remove Python 3.2 and 3.3 from test
> - doc updates
> - miniterm: add CTRL+T Q as alternative to exit
> - miniterm: suspend function key changed to CTRL-T Z
> - add command line tool entries pyserial-miniterm (replaces
>    miniterm.py) and pyserial-ports (runs serial.tools.list_ports).
> - python -m serial opens miniterm (use w/o args and it will print
>    port list too) [experimental]
> - Don't open port if self.port is not set while entering context
>    manager
> - refactor: raise new instances for PortNotOpenError and
>    SerialTimeoutException
> - list_ports: set default name attribute
> - fix: compare only of the same type in
>    list_ports_common.ListPortInfo
> - rfc2217/close(): fix race-condition
> - return b'' when connection closes on rfc2217 connection
> - rfc2217/close(): fix race condition
> - Fixed flush_input_buffer() for situations where the remote end
>    has closed the socket.
> - reset_input_buffer() can hang on sockets
> - examples: port_publisher python 3 fixes
> - miniterm: Fix miniterm constructor exit_character and
>    menu_character
> - miniterm: use exclusive access for native serial ports by
>    default
> - miniterm: fix double use of CTRL-T + s use z for suspend instead
> - examples: refactor wx example, use Bind to avoid deprecated
>    warnings, IsChecked, unichr
> - posix: fix PosixPollSerial with timeout=None and add cancel
>    support
> - option for low latency mode on linux
> - Add support to xr-usb-serial ports
> - posix: Don't catch the SerialException we just raised
> - posix: Fix custom baud rate to not temporarily set 38400 baud
>    rates on linux
> - list_ports: use hardcoded path to library on osx
>
> Following the rename of miniterm.py and the new command line tool
> entry, task do_install_append has been updated accordingly.
>
> License-Update: Update year
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../{python3-pyserial_3.4.bb => python3-pyserial_3.5.bb}  | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-pyserial_3.4.bb => python3-pyserial_3.5.bb} (85%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-pyserial_3.4.bb b/meta-python/recipes-devtools/python/python3-pyserial_3.5.bb
> similarity index 85%
> rename from meta-python/recipes-devtools/python/python3-pyserial_3.4.bb
> rename to meta-python/recipes-devtools/python/python3-pyserial_3.5.bb
> index d65c9a88b..4be80e28c 100644
> --- a/meta-python/recipes-devtools/python/python3-pyserial_3.4.bb
> +++ b/meta-python/recipes-devtools/python/python3-pyserial_3.5.bb
> @@ -1,14 +1,14 @@
>   SUMMARY = "Serial Port Support for Python"
>   LICENSE = "BSD-3-Clause"
> -LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=d476d94926db6e0008a5b3860d1f5c0d"
> +LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=520e45e59fc2cf94aa53850f46b86436"
>   
> -SRC_URI[md5sum] = "ed6183b15519a0ae96675e9c3330c69b"
> -SRC_URI[sha256sum] = "6e2d401fdee0eab996cf734e67773a0143b932772ca8b42451440cfed942c627"
> +SRC_URI[sha256sum] = "3c77e014170dfffbd816e6ffc205e9842efb10be9f58ec16d3e8675b4925cddb"
>   
>   inherit pypi setuptools3 ptest
>   
>   do_install_append() {
> -    rm -f ${D}${bindir}/miniterm.py
> +    rm -f ${D}${bindir}/pyserial-miniterm
> +    rm -f ${D}${bindir}/pyserial-ports
>       rmdir ${D}${bindir}
>   }
>   
>
> 
>

--------------A1545D8E7ABED80ABFEB9877
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-01-20 6:10 a.m., Leon Anavi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210120111027.12947-5-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">- iAdd a backend for Silicon Labs CP2110/4 HID-to-UART bridge.
  (depends on hid module)
- Use absolute import everywhere
- win32: miniterm Working CMD.exe terminal using Windows 10 ANSI
  support
- Make ListPortInfo hashable
- threaded: &quot;write&quot; returns byte count
- Add bytesize and stopbits argument parser to tcp_serial_redirect
- loop: add out_waiting
- list_ports_linux: Correct &quot;interface&quot; property on Linux hosts
- Remove Python 3.2 and 3.3 from test
- doc updates
- miniterm: add CTRL+T Q as alternative to exit
- miniterm: suspend function key changed to CTRL-T Z
- add command line tool entries pyserial-miniterm (replaces
  miniterm.py) and pyserial-ports (runs serial.tools.list_ports).
- python -m serial opens miniterm (use w/o args and it will print
  port list too) [experimental]
- Don't open port if self.port is not set while entering context
  manager
- refactor: raise new instances for PortNotOpenError and
  SerialTimeoutException
- list_ports: set default name attribute
- fix: compare only of the same type in
  list_ports_common.ListPortInfo
- rfc2217/close(): fix race-condition
- return b'' when connection closes on rfc2217 connection
- rfc2217/close(): fix race condition
- Fixed flush_input_buffer() for situations where the remote end
  has closed the socket.
- reset_input_buffer() can hang on sockets
- examples: port_publisher python 3 fixes
- miniterm: Fix miniterm constructor exit_character and
  menu_character
- miniterm: use exclusive access for native serial ports by
  default
- miniterm: fix double use of CTRL-T + s use z for suspend instead
- examples: refactor wx example, use Bind to avoid deprecated
  warnings, IsChecked, unichr
- posix: fix PosixPollSerial with timeout=None and add cancel
  support
- option for low latency mode on linux
- Add support to xr-usb-serial ports
- posix: Don't catch the SerialException we just raised
- posix: Fix custom baud rate to not temporarily set 38400 baud
  rates on linux
- list_ports: use hardcoded path to library on osx

Following the rename of miniterm.py and the new command line tool
entry, task do_install_append has been updated accordingly.

License-Update: Update year

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20210120111027.12947-5-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../{python3-pyserial_3.4.bb =&gt; python3-pyserial_3.5.bb}  | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pyserial_3.4.bb =&gt; python3-pyserial_3.5.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-pyserial_3.4.bb b/meta-python/recipes-devtools/python/python3-pyserial_3.5.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-pyserial_3.4.bb
rename to meta-python/recipes-devtools/python/python3-pyserial_3.5.bb
index d65c9a88b..4be80e28c 100644
--- a/meta-python/recipes-devtools/python/python3-pyserial_3.4.bb
+++ b/meta-python/recipes-devtools/python/python3-pyserial_3.5.bb
@@ -1,14 +1,14 @@
 SUMMARY = &quot;Serial Port Support for Python&quot;
 LICENSE = &quot;BSD-3-Clause&quot;
-LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE.txt;md5=d476d94926db6e0008a5b3860d1f5c0d">&quot;file://LICENSE.txt;md5=d476d94926db6e0008a5b3860d1f5c0d&quot;</a>
+LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE.txt;md5=520e45e59fc2cf94aa53850f46b86436">&quot;file://LICENSE.txt;md5=520e45e59fc2cf94aa53850f46b86436&quot;</a>
 
-SRC_URI[md5sum] = &quot;ed6183b15519a0ae96675e9c3330c69b&quot;
-SRC_URI[sha256sum] = &quot;6e2d401fdee0eab996cf734e67773a0143b932772ca8b42451440cfed942c627&quot;
+SRC_URI[sha256sum] = &quot;3c77e014170dfffbd816e6ffc205e9842efb10be9f58ec16d3e8675b4925cddb&quot;
 
 inherit pypi setuptools3 ptest
 
 do_install_append() {
-    rm -f ${D}${bindir}/miniterm.py
+    rm -f ${D}${bindir}/pyserial-miniterm
+    rm -f ${D}${bindir}/pyserial-ports
     rmdir ${D}${bindir}
 }
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------A1545D8E7ABED80ABFEB9877--
