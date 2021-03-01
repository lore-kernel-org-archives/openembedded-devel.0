Received: from NAM11-BN8-obe.outbound.protection.outlook.com (NAM11-BN8-obe.outbound.protection.outlook.com [40.107.236.79])
 by mx.groups.io with SMTP id smtpd.web12.1067.1614621029773830376
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Mar 2021 09:50:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=Fl0nbR0o;
 spf=pass (domain: windriver.com, ip: 40.107.236.79, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JKYHnrw5EkeDZ/CT8tUtpFh9RzL2inmmTUqBXE+dmBARsW8ASmx8VCJNkin+uixk01OoyFGJKEJEv9YMqSwoNxM4Ipxk0f1Z/lA79G7amF4ysKzic11esuPi6sWCk0KBanPPh2fPXBUGmvEQ8ziILEbaEXoKQaRvxhMKPIHOR6UPqKGvYlBp0k0HbwCtzzfXiDN0JFc8lr7KDUYN+x/d2BmrkYtNbv7NpKvNHP3HSySe0+w/FWxkguRf5v1FLic5YMMDZXeBJ+wjCNS+nFrhXvwU/TRx8h8yg3SaqRxk610SPB1cRWB1r4LPlwjdlQ0btmWXTHEmQs14K/BP9lupWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xtUWnKDWe/uIQNRHGg52FJdIqUEyNC6PVC3gLLAs6N8=;
 b=lAmEpf1Ty0jPDjQS3/0497mBMssdQNv2mHx0H+UU+Rc8ESY/Nc46ch6pXE0pXfbDi5TkpVZh2oBULX6NIsERMcDCkz5YHfu/wvP3Pu+/Hww4DLp96n6AGhH4iRHe011ciKnTvKJgnkG4+nXoGBTk1lyBQZSoMobXHp3VVFFht5jzn9XxqlBbnS0RaAdbF+49/QVPWWwdKzLpfRycWfHmlK0Lci0RO99V/WFC6gxbRAIsRUFlPvb2lhesKbSqBt6Da6eNFLmQHznOSp5nWP4w6Z9lVdTGTU7OGIwWOPDVLESjS0U7WVgMZ8HwSwlMFCONp9I59lr6A+iiY29XAr/DeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xtUWnKDWe/uIQNRHGg52FJdIqUEyNC6PVC3gLLAs6N8=;
 b=Fl0nbR0oFqEjeO5ADL5EIiCvHhkJ2cwrBL8Rj8y9HYOQIJNq2VrzRUuYpv1jjws2eytYd2jzFptgu6i7kdjAYtJT3O1IRI1H2J4w6DyknCTHK8JOLmoAmnBMuW+ztOvQTlaJrgmpX+AY17OG0mRVXHfywfjk1QfGFuS+Kpq8g8s=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB3303.namprd11.prod.outlook.com (2603:10b6:a03:18::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.23; Mon, 1 Mar
 2021 17:50:27 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447%7]) with mapi id 15.20.3890.028; Mon, 1 Mar 2021
 17:50:27 +0000
Subject: Re: [oe] [meta-python][PATCH 4/5] python3-rsa: Upgrade 4.7.1 -> 4.7.2
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20210225160544.8994-1-leon.anavi@konsulko.com>
 <20210225160544.8994-4-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <a3488b4e-2d35-35a1-cdb4-85c5733a0053@windriver.com>
Date: Mon, 1 Mar 2021 12:50:24 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
In-Reply-To: <20210225160544.8994-4-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: BN6PR19CA0096.namprd19.prod.outlook.com
 (2603:10b6:404:133::34) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by BN6PR19CA0096.namprd19.prod.outlook.com (2603:10b6:404:133::34) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.19 via Frontend Transport; Mon, 1 Mar 2021 17:50:26 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 05db30b3-c1e2-40e6-ca49-08d8dcda7f55
X-MS-TrafficTypeDiagnostic: BYAPR11MB3303:
X-MS-Exchange-MinimumUrlDomainAge: openembedded.org#6614
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB330373E55E2DAB3304708A629F9A9@BYAPR11MB3303.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:469;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	JEAwVoeTO58a3Qycj6J9V5Zj9ZB/183ij858aW/uvi2XFqlUCuC8Itnh7WIlZOVvBMdPhAdiRz24RqIUL4simOfAjiDhD7kx0+CvlkcAGNdDs2SJTVpagoOza6bqI3M/t+hewgtsPG1Fq8/xbLSuNmcRSdnrlrNx//g3SjFH1WTOBRtIyjKp0GHTZWEZzMqxMeMUp4oruu+L07HJ+btfA1alVM9AC7uJ8Fe0sq1VtkdDSfAcvynm4WL0s4L/hCKqfMYiNQnmndIYLdd9xDCJqGsNfH/t3GKSC4xeXChvduCSw5iLwgnAdKL8PtLZVTurgovZc0Pz1T19fHmbKtq6bz6qIX962sVlGIMJdNrWWNDetBJV0AxTQCpSSUWWdgyPs+l1H/Lnw9so2JUI2QBCXND0VkN26fro1Rda0CQGE4Rc7fLhXTpoU0ws42CV0C/Qoot6CvTQT5tzVUddituJAv81tFHtsoK9mT2L44DZ7479UiaQ9rsV2P+YQ/gJpKAsKTHGFSyfoxBFielFuFJcPrZeggomzaAroxJgK/RMcw9jfD6QsFGuJCuuZfnPAB3zC0sseslaJ0cQ/G0KFV8kvEJis+HhuWc1MLOK4aIv/Y06zbqpsNf8mdn3g1jzswGmC3DA8jSuMgnE5I23KO60/cziF6kASaOAM2biwwwMLbLZRUjDtU31vdKwAMTS74Nf
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(136003)(396003)(346002)(376002)(366004)(31686004)(66946007)(8936002)(26005)(8676002)(2906002)(6486002)(16576012)(66476007)(316002)(66556008)(86362001)(478600001)(5660300002)(33964004)(83380400001)(186003)(956004)(36756003)(44832011)(16526019)(2616005)(31696002)(53546011)(966005)(166002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?SXVPTmZDdk15bld3OUpHbzczMm5WZytMcGFNakpCWFJoenNqS2VtbzBFSWVp?=
 =?utf-8?B?bEU2S1k4UTQ1eTVycjRteDlscXdNaFhHOEs0eFdpeUJLUm5Cc0NDS0JwY2R4?=
 =?utf-8?B?dGJIcmp2a1pPakJtaGF0THhWaHBDWWV1NlNTU1RkY2Rkam9zSU94OEFaaUxG?=
 =?utf-8?B?OFBubGpjS25RUDVMWVFkSFNmSVd0MVhtZzNhUGRzS2pvRXZ0enhuVG9NRTVI?=
 =?utf-8?B?akRhelhPNFF5MUZScFJhS08xelJBUURCYzVqM3hGTGxWcXJDbFpON2xHUm1q?=
 =?utf-8?B?eXdXRXhDTWMzVmVlOWdER0ZETE1FUVo2V2JWd2VtUS9PeTE4SFFPanE3TzJl?=
 =?utf-8?B?cTg0cDdRRHZVeTRhYlFiejI1U2tVN2R0Nlh6Yy9kYS9qcEh1SmYrTVJqSW8v?=
 =?utf-8?B?UTlaR1FjcWsxbTlUTnUyckF3M2k3OGRHUFlSY0RZODJrOE1odkVKMk5aSnIv?=
 =?utf-8?B?SHVEdmlSVkRQN0RDd3VWajlmeGJrYlFtS0xXWU41NTV4bHpYTEpkUytpL2J3?=
 =?utf-8?B?ZVFGL3NCYWtob25rOFVlc3hMaEJoMFR2OXpueHhTVnVvOVVPa1dPRFFmdURw?=
 =?utf-8?B?ZThXNG1nZCtkdFp1RDlhdU96bEdlTFpOTEJOVjZWM091YVZFTW1FUUdPRFlv?=
 =?utf-8?B?c1VYcUxHM1hNYk1aQm05R3JaWGJmT1laVWM3RUpSSFlER3YxRnUyOHUvaDUv?=
 =?utf-8?B?M2RIcjBTYndWajFxMXFBWEs2QmpaMzg0Wkt6bUQ0c3FxVU1ZYTB4aVRVY05p?=
 =?utf-8?B?Qm1NbytMZUpmZ1c3ZXVpd0tBeHR6YlpEWnFMcjVmUC9mOUN3aTYyZXQ2TzZT?=
 =?utf-8?B?ZjVSM0g0Nm1FRlE2L1hRSE1EdFFEWTFVeWNHOTBKU2YxSEZtczBhYkNPU0l0?=
 =?utf-8?B?NDBIQXFJSHFYMEZxSVYvdmNXckd3SEVOWWloaU91OWpBalRKL2J0UGxQR3Ry?=
 =?utf-8?B?L0NmRWh3ejZNN0ZtVjVlODQ1aEM0L2xCMVZEeXlzcGUzTVdER0xNS0tiYTIy?=
 =?utf-8?B?bUpidjNzNm9pNFJaQkR4VmdoM1ZEcno4NXBQTjNiRmlzbEg3dUZNZUxveFAv?=
 =?utf-8?B?enN1YUVzd3RqSGd5QnltZ2Izb0NGc09rcGZ2Sy9LM0Jnd2x5ZUdXcS8yWU15?=
 =?utf-8?B?N0VYUVF5Qm5NLytDNjhYa3BKVUZjSEVkQ2Y2eUVmN2NoWWhJbGlrd3NDcitV?=
 =?utf-8?B?RjlkeWRNSWNjcG5TSFpBV0R5WHNvUlNxeEUxeVlEUkhHZ3ZXM0VWUnB6ZlhC?=
 =?utf-8?B?RE1KVEwvamhlQnQ1Myt6NlBmSExLODZPcUxXQXgyK2RFbjBJZEM4cWZZSzl3?=
 =?utf-8?B?SDJ0VzVMS09ZdmdUYktsQ0dsUlRKaXdmNHVQOEtoa1VCc0QycUdYWElnelRF?=
 =?utf-8?B?WDQrR0tkRXYyZmVCaE92dmFmSzB0SkE1dXNMWVJrWGdMVnZZdUwrZzNzd3pW?=
 =?utf-8?B?L0NveWtWRVNOSkMwOHNiSnVHd3R6Y0h0UkFDZWpFeGtWVS9zSFFHVmxFTVpE?=
 =?utf-8?B?aHVDU2tza09QOE1zWmtZL01LUDVFeWloa1UxclJ6Sm5BZzhTYWk0c2xSUEpW?=
 =?utf-8?B?eldRNTJGTFlrOVJmRHBCcTNiaGpRRWs2QVprTkM3RGNaejBUSm1vUkl4YWsw?=
 =?utf-8?B?SWR6NGYxSzd2aXh3bnhNMFk5TEJTMUhxS1I3UC9kOTh4ckFSSU82UHppQzRM?=
 =?utf-8?B?T2djT1hZaVBiYnUvRzl5RnNUQjd1RmRNM2lnOUMvVTRxT0ZuNXVYUmRXZHhy?=
 =?utf-8?Q?2yzgEiJFNA+yboP1lhyhqLh1/fDRV1RK9M6BUOR?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05db30b3-c1e2-40e6-ca49-08d8dcda7f55
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2021 17:50:27.3963
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k1RkGPBw27jwNVVQtFdGBAQkwCEOHRd28M8WGRxWNQ+vUmqDL/NHr7Lg+8nZ5fTsvASif798hnO87G041lv4ZzQX/aRMxAoI0nlDDKrTxuo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3303
Content-Type: multipart/alternative;
 boundary="------------7FCE46D22733CFE6F187BB3E"
Content-Language: en-US

--------------7FCE46D22733CFE6F187BB3E
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-02-25 11:05 a.m., Leon Anavi wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
> Upgrade to release 4.7.2:
>
> - Fix picking/unpickling issue introduced in 4.7
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/{python3-rsa_4.7.1.bb => python3-rsa_4.7.2.bb}       | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>   rename meta-python/recipes-devtools/python/{python3-rsa_4.7.1.bb => python3-rsa_4.7.2.bb} (92%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-rsa_4.7.1.bb b/meta-python/recipes-devtools/python/python3-rsa_4.7.2.bb
> similarity index 92%
> rename from meta-python/recipes-devtools/python/python3-rsa_4.7.1.bb
> rename to meta-python/recipes-devtools/python/python3-rsa_4.7.2.bb
> index 43e7ca0854..dcb42aaa9c 100644
> --- a/meta-python/recipes-devtools/python/python3-rsa_4.7.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-rsa_4.7.2.bb
> @@ -4,7 +4,7 @@ AUTHOR = "Sybren A. Stuvel"
>   LICENSE = "Apache-2.0"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=c403f6882d4f97a9cd927df987d55634"
>
> -SRC_URI[sha256sum] = "9d74d1ff850745c9802cd6b53382bfeec7f6dbe4e26ee2759241ed1e7b0ecf5d"
> +SRC_URI[sha256sum] = "9d689e6ca1b3038bc82bf8d23e944b6b6037bc02301a574935b2dd946e0353b9"
>
>   inherit pypi setuptools3 update-alternatives
>
> --
> 2.17.1
>
>
> 
>

--------------7FCE46D22733CFE6F187BB3E
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-02-25 11:05 a.m., Leon Anavi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210225160544.8994-4-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">[Please note: This e-mail is from an EXTERNAL e-mail address]

Upgrade to release 4.7.2:

- Fix picking/unpickling issue introduced in 4.7

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20210225160544.8994-4-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/{python3-rsa_4.7.1.bb =&gt; python3-rsa_4.7.2.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-rsa_4.7.1.bb =&gt; python3-rsa_4.7.2.bb} (92%)

diff --git a/meta-python/recipes-devtools/python/python3-rsa_4.7.1.bb b/meta-python/recipes-devtools/python/python3-rsa_4.7.2.bb
similarity index 92%
rename from meta-python/recipes-devtools/python/python3-rsa_4.7.1.bb
rename to meta-python/recipes-devtools/python/python3-rsa_4.7.2.bb
index 43e7ca0854..dcb42aaa9c 100644
--- a/meta-python/recipes-devtools/python/python3-rsa_4.7.1.bb
+++ b/meta-python/recipes-devtools/python/python3-rsa_4.7.2.bb
@@ -4,7 +4,7 @@ AUTHOR = &quot;Sybren A. Stuvel&quot;
 LICENSE = &quot;Apache-2.0&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=c403f6882d4f97a9cd927df987d55634">&quot;file://LICENSE;md5=c403f6882d4f97a9cd927df987d55634&quot;</a>

-SRC_URI[sha256sum] = &quot;9d74d1ff850745c9802cd6b53382bfeec7f6dbe4e26ee2759241ed1e7b0ecf5d&quot;
+SRC_URI[sha256sum] = &quot;9d689e6ca1b3038bc82bf8d23e944b6b6037bc02301a574935b2dd946e0353b9&quot;

 inherit pypi setuptools3 update-alternatives

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

--------------7FCE46D22733CFE6F187BB3E--
