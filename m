Return-Path: <michael.weiss@aisec.fraunhofer.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4760AEB64DA
	for <webhook@archiver.kernel.org>; Wed, 12 Jul 2023 17:15:15 +0000 (UTC)
Received: from mail-edgeF24.fraunhofer.de (mail-edgeF24.fraunhofer.de [192.102.164.24])
 by mx.groups.io with SMTP id smtpd.web10.1618.1689182108407748335
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Jul 2023 10:15:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fraunhofer.onmicrosoft.com header.s=selector2-fraunhofer-onmicrosoft-com header.b=ft08FFPu;
 spf=none, err=SPF record not found (domain: aisec.fraunhofer.de, ip: 192.102.164.24, mailfrom: michael.weiss@aisec.fraunhofer.de)
Authentication-Results: mail-edgeF24.fraunhofer.de; dkim=pass (signature verified) header.i=@fraunhofer.onmicrosoft.com
X-IPAS-Result: =?us-ascii?q?A2FQBADn3q5k/xoBYJlaHgEBCxIMQIFEC4IzdYFchFKDT?=
 =?us-ascii?q?40fPy0DgROKQpBxgSyBJQMYNQkPAQEBAQEBAQEBBwEBLgsLBAEBAwEDhH8Ch?=
 =?us-ascii?q?iMmNgcOAQIBAwEBAQEDAgMBAQEBAQEDAQEGAQEBAQEBBgYCgRmFLzkNgnJBI?=
 =?us-ascii?q?00JAQEBAQEBAQEBJwEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBA?=
 =?us-ascii?q?QEBAQcCDShQAQEBAQIBASIPAQ0BAQkBAisBDwsRAwECAQICJgICIQcJAR0IB?=
 =?us-ascii?q?goDAQUCAQEZBIJdAYIoAw4jFKleeoEygQGCCQEBBoEHDAE5Aa5RDQuBIIEeC?=
 =?us-ascii?q?QkBgQstg1uEBx4BiXaCT4EVJwwDgQaBNwcxPoIgQgEBA4Fyg0aCZ1cegSInY?=
 =?us-ascii?q?AIDOxZpPFEoPwICFQQ6BSYLKwQBAVEwBgKCHHQCAgKBcoM+VUCBAwcyT4IUQ?=
 =?us-ascii?q?QEEgVkCAgKIToEnb4EegR56AgkCEWeBCAhegW4+Ag1VCwtjgRyBKYEkAgIRJ?=
 =?us-ascii?q?xMUBU54GwMHA4EFEC8HBDIdCQYJGBgXJQZRBy0kCRMVQQSDUwqBCT8VDhGCU?=
 =?us-ascii?q?SICBzY7G02CagkXDjVTfhAxBBQdgSUEDgMZKx1AAgELcD01CQsbRwIngVcwU?=
 =?us-ascii?q?m4kJKMAAzCCcgd7EwErgRAJRwgaOyuSSrB/cAeCMYFdi32NGoF5hXYGDwQvl?=
 =?us-ascii?q?yOSNpgmjHhng3SWQgIEAgQFAg4IgWkBgg8zPoM2CQo/GQ+OIAwBFRWDPYUUi?=
 =?us-ascii?q?mdzAjkCBwEKAQEDCYI5iQ8BAQ?=
IronPort-PHdr: A9a23:pzFw6B+R0xnUIf9uWWy9ngc9DxPPxp3qa1dGopNykalHN7+j9s6/Y
 h+X7qB3gVvATYjXrOhJj+PGvqyzPA5I7cOPqnkfdpxLWRIfz8IQmg0rGsmeDkPnavXtan9yB
 5FZWVto9G28KxIQFtz3elvSpXO/93sVHBD+PhByPeP7BsvZiMHksoL6+8j9eQJN1ha0fb4gF
 wi8rwjaqpszjJB5I6k8jzrl8FBPffhbw38tGUOLkkTZx+KduaBu6T9RvPRzx4tlauDXb684R
 LpXAXEdPmY56dfCmTLDQACMtR5+Gm8Wxx5DBQWU6xbKdJShszer7OdW5DCKIsm1X+5zfyibz
 5phYwHRqTcMKxdk/ESC2akSxKgOrg759zJR+5OKeq+HJapuX4jDf/86XHdeW95SfA9lLYKSc
 9MxC+Y/AOJxhYa+mWIxjj++KTuXJb7C4BVy2mTX4vRryeM/HFv0+io6Hs0Bt1vTqMfqO5sgF
 u6o/rSP6C3cdK56mjjP+qXpaTsM/u6BV+pxUPv6jll3NyT50m6ghYn1DhmTj8hTkHK9scNvC
 aGz1T4AswFsqAL369Uwr4rHqpkyiV3Dzwdmw5YUcI7wWAt6e9miCJxKq2SAOpBrRt93W2hzo
 3VSItwuvJe6eG0HxJsq6USDLfKdepWO4hXtWfzXLTorzH5mebfqnx+p6gDg0ezzUMCozUxH5
 jRIiNjCt30BllTT58GLR+E7/xKJ1yyGygbT7e9JOwYzk6/aIIQm2bk+itwYtkGrIw==
X-Talos-CUID: 9a23:CmNKyG7ruFwRLKeZ+dss+msOI9IuLGTmy1TgJV2bBWY3ebrLcArF
X-Talos-MUID: 9a23:Z9YXoAgj++8APQnm9U2hO8MpN8gwyoC3UkIxl5AHm8SaCS5IMmiak2Hi
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.01,200,1684792800"; 
   d="scan'208";a="56339920"
Received: from mail-mtaka26.fraunhofer.de ([153.96.1.26])
  by mail-edgeF24.fraunhofer.de with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2023 19:15:05 +0200
IronPort-SDR: 64aedf98_ykQOdxlMnrJRNhwT07okHRxnWAtWMhw28J0VsGp4cmloQCd
 to2p7jGfmdqyfqiDpwFvZxgj/qFf1FPbena3rNg==
X-IPAS-Result: =?us-ascii?q?A0BvCgDn3q5k/3+zYZlaHgEBCxIMQAkcgR8LgWFSBz0xW?=
 =?us-ascii?q?CtZhFGDTQEBhS2GPIE2bAM4AVqKQpBxgSyBJQNNCQ8BAwEBAQEBBwEBLgsLB?=
 =?us-ascii?q?AEBhQYChiACJjYHDgECAQECAQEBAQMCAwEBAQEBAQMBAQUBAQECAQEGBIEKE?=
 =?us-ascii?q?4VoDYYEAQEBAQIBARERDwENAQEJAQIIIwEPCxEDAQIBAgImAgIhBwkBBxYIB?=
 =?us-ascii?q?goDAQUCAQEZBAGCXAGCKAMOIwIBARCddQGBQAKKJnqBMoEBggkBAQYEBIELA?=
 =?us-ascii?q?TkBrlENC4EggR4JCQGBCy2DW4QHHgGJdoJPgRUnDAOBBoE3BzE+giBCAQEDh?=
 =?us-ascii?q?TiCZ1cegSInYAIDOxZpPFEoPwICFQQ6BSYLKwQBAVEwBgKCHHQCAgKBcoM+V?=
 =?us-ascii?q?UCBAwcyT4IUQQEEgVkCAgKIToEnb4EegR56AgkCEWeBCAhegW4+Ag1VCwtjg?=
 =?us-ascii?q?RyBKYEkAgIRJxMUBU54GwMHA4EFEC8HBDIdCQYJGBgXJQZRBy0kCRMVQQSDU?=
 =?us-ascii?q?wqBCT8VDhGCUSICBzY7G02CagkXDjVTfhAxBBQdgSUEDgMZKx1AAgELcD01C?=
 =?us-ascii?q?QsbRwIngVcwUm4kJKMAAzCCcgd7EwErgRAJRwgaOyuSSrB/cAeCMYFdi32NG?=
 =?us-ascii?q?oF5hXYGDwQvlyOSNpgmjV+DdJZCAgQCBAUCDgEBBoFpATWBWTM+gzYJCjwDG?=
 =?us-ascii?q?Q+OIAwBFRWDPYUUimdBMgI5AgcBCgEBAwmCOYkPAQE?=
IronPort-PHdr: A9a23:6+5O5xExfAHzS17vS3Fsv51Gf29NhN3EVzX9l7I53usdOq325Y/re
 Vff7K8w0gyBVtDB5vZNm+fa9LrtXWUQ7JrS1RJKfMlCTRYYj8URkQE6RsmDDEzwNvnxaCImW
 s9FUQwt5CSgPExYE9r5fQeXrGe78DgSHRvyL09yIOH0EZTVlMO5y6W5/JiABmcAhG+Te7R3f
 jm/sQiDjdQcg4ZpNvQUxwDSq3RFPsV6l0hvI06emQq52tao8cxG0gF9/sws7dVBVqOoT+Edd
 vl1HD8mOmY66YjQuB/PQBGmylAcX24VwX8qSwLFuRXxWJqgtSzKnOkt2TXLZ8DdcakkRjDh/
 fksbgPRqBoNHCAA0XHcluUtgIcO83fD7xYqzZKMMK+7DOcgZI3PbIMKZEFfXOpxTjFeB5u/R
 KgrIOsvIb5mq4XDml8nhxT9OzCTJ8fv5g1zpyLb94cAj/8ALliXxgs+Eog8llLOrcr6M4gVV
 fKqw5X6ijveXe4R/C/i89XkMR8Ts9ytRpldLtXcwxEuNjLuyUXIiavZYwil+uEdgkKdtsY+d
 viJ1Uco90Jt/GiI3scxgLORq5AJ71PK2T5eg4syH/+nS15aNI3sAN5RrSacL4xsXoY4Tnp1v
 Dpv0rQdos3TlEkizZ0mw1vad/WkWtLWpBz5XfuXITB2iWgjdL/szxqx8E310uTnTYH0y1dFq
 CNZj8PB/m4AzR3d68WLC7N9806t1CzJ1lX75PtNPEY0kqTWMdgmxLsxnYAUqkPNAmn9n0Ces
 Q==
IronPort-Data: A9a23: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
 lk9rN5eOjf4aaNoplLw
IronPort-HdrOrdr: A9a23:zDad26jOfv8F/wrCSqMObL/oDnBQXzt13DAbv31ZSRFFG/FwyP
 rAoB1L73PJYWgqNU3I+ergBEGBKUmsjKKdkrNhRotKOzOWx1dATbsSkbcKpgePJ8SQzJ856U
 4NSdkFNDS0NykGsS+Y2njJLz9D+qjkzEnAv463pB0MPGJXguNbnn9E426gYzxLrWJ9dP0E/f
 Snl6x6TnabCBAqhpPRPAh6YwGPnayCqLvWJTo9QzI34giHij2lrJb8Dhijxx8bFxdC260r/2
 TpmxHwovzLiYDw9jbsk0voq7hGktrozdVOQOSKl8guMz3pziKlfp5oVbGutC085Muv9FEput
 /RpApIBbU511rhOkWO5Tf90Qjp1zgjr1fk1F+jmHPm5ff0QTorYvAx8r5xQ1/80Q4Nrdt82K
 VE0yayrJxMFy7Nmyz7+pzhSwxqvlDcmwtsrccjy1hkFacOYr5YqoISuGlPFo0bIS784Ic7VM
 FzEcDn4upMe1/yVQGUgoBW+q3sYp0PJGbHfqBb0fblkAS+3UoJgnfw/fZv0Evpr/kGOtt5D+
 etCNUdqFgBdL5SUUtHPpZ1fSKGMB2/ffvyChPhHb3GLtBwB5ufke+/3Fxy3pDvRKA1
X-Talos-CUID: =?us-ascii?q?9a23=3APjj4f2qAiUA+Ndkuf0dBmbDmUekvaiTg3nv5GXO?=
 =?us-ascii?q?xOXgwZrCXUFKZyJoxxg=3D=3D?=
X-Talos-MUID: 9a23:smbLewqvdDaEaRur6gQezxpHDNl3vo60NGMqvogN+NOdDC0reA7I2Q==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.01,200,1684792800"; 
   d="scan'208";a="57978592"
Received: from 153-97-179-127.vm.c.fraunhofer.de (HELO smtp.exch.fraunhofer.de) ([153.97.179.127])
  by mail-mtaKA26.fraunhofer.de with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2023 19:15:03 +0200
Received: from XCH-HYBRID-04.ads.fraunhofer.de (10.225.9.46) by
 XCH-HYBRID-04.ads.fraunhofer.de (10.225.9.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.16; Wed, 12 Jul 2023 19:15:03 +0200
Received: from DEU01-FR2-obe.outbound.protection.outlook.com (104.47.11.170)
 by XCH-HYBRID-04.ads.fraunhofer.de (10.225.9.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.16 via Frontend Transport; Wed, 12 Jul 2023 19:15:03 +0200
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QshMnHsemiWTkScpmn2nWl/PPzkyAyAzvdGhrksoNJo+ZTsA/+5TihccEpXAoY7zV1zK8XW2tcZyWAI0PdkgSzXSQcMKC5UnqaAHfvDwrRKgUEnbnWN4hBGh05DQBoEX6uh381MtUEuxTgobnYTtB92N+7zRxuR8lK5oerMr6yTA9AYCfqjUnC6TZYLjTflsU4x9GGmSWBOoIf1KhhANI9F4x5e3syjHrT/ni7oWU7wVre57W30RkMMOiR7rU5aKmZnyiu5rQ3nhX8cZ/DQqvFVlaBO+wwZMRZ+wlP5VBywSqlM4mt3ttoPtjdoQSmc0xN7GNnSnEchoXxmvaltsCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lcne9ooXBk8it92eCTqxwl+z6/NtQHUbCvQIxctA5dM=;
 b=LNJSHfagP+a9L++sKRjF12YbO6MswQlvn7uGspQ/AaImTaYI5euG1UmTZiPkpr6phLFg/6Hd6z00dnu07xR4tt0BSwxfft3e+8VduzqQndZnc41db7wIYfS2vxih0TINi9fFUA0jGsZnfOTDrcO11ta235yE03pJu9YmjSuH0ljbJX/Gqlf/237umrRfGwh4jSaUWVfJgPWMAIE3HIvPq+z0Mc21MrHkoYXAdX3bZfmmoUIU6g1lhPeC73a6QBu+QxbOMJWdonpIfheo30nbDvQUwLsusxADAD+x/GeoGVedoCaGKxUmmOuEJ1qI+yP7wlOUVhyzktojJeCEIXZJXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aisec.fraunhofer.de; dmarc=pass action=none
 header.from=aisec.fraunhofer.de; dkim=pass header.d=aisec.fraunhofer.de;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fraunhofer.onmicrosoft.com; s=selector2-fraunhofer-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lcne9ooXBk8it92eCTqxwl+z6/NtQHUbCvQIxctA5dM=;
 b=ft08FFPu6rFzy8xICvjDHquwmpkCKLGiFt0VldVUlABg+VQWKLhDZSI5EBBR4sIW19rove2ZNNriwgoGolzwgTZ/fuZu/Mpws5D+gZzEIsCE7web0iIYC/x0HOT4SXDmxYBn1D6KrN6Ag4+t68OphubR0EztMkfDsO+eoRJwkxI=
Received: from BEZP281MB2791.DEUP281.PROD.OUTLOOK.COM (2603:10a6:b10:50::14)
 by FR0P281MB3403.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:53::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.24; Wed, 12 Jul
 2023 17:15:01 +0000
Received: from BEZP281MB2791.DEUP281.PROD.OUTLOOK.COM
 ([fe80::b216:2c77:51d6:a6a]) by BEZP281MB2791.DEUP281.PROD.OUTLOOK.COM
 ([fe80::b216:2c77:51d6:a6a%5]) with mapi id 15.20.6588.017; Wed, 12 Jul 2023
 17:15:01 +0000
Message-ID: <bed46315-47fb-7746-3280-dd3b703270e2@aisec.fraunhofer.de>
Date: Wed, 12 Jul 2023 19:14:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [oe] [meta-oe][PATCH] pv: Show progress bar even if no terminal
 is set as in 1.6.6
To: Khem Raj <raj.khem@gmail.com>
CC: <openembedded-devel@lists.openembedded.org>
References: <20230712145735.88665-1-michael.weiss@aisec.fraunhofer.de>
 <CAMKF1so6vWnWDdDADO-N6gcc1UiYyZgGCefDC-_LXkSjP+QcTw@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Michael_Wei=c3=9f?= <michael.weiss@aisec.fraunhofer.de>
In-Reply-To: <CAMKF1so6vWnWDdDADO-N6gcc1UiYyZgGCefDC-_LXkSjP+QcTw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0254.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:af::9) To BEZP281MB2791.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:50::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BEZP281MB2791:EE_|FR0P281MB3403:EE_
X-MS-Office365-Filtering-Correlation-Id: 030d0d5e-c16a-435a-3f7a-08db82fb869f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zYI9JDkPfxGAXTThDjzukkW6mpAnZM3ZEhOwzIoLyua2LTsGoDdDfqb3YZl7TIULV0fws9OKcmHYHr4vPgRRj5ZNWCv6GN5WPKZ9pUB3/za9s7IDYQiMoVswroWM6kZMiIZ4/IK9SDORbBSkKUjBP9UwfLmVIJ6IKe/dAePwwqPQSWcYKnJAaFiEj++emJC8LRHJhDaIyhovhYIaLAJvK7Reg5ops94TTaXDi2/p9ruV/am4mauEvqaJLH9ZFR1CIHspa4ZPjJpQAiZ0794Dgj6qaneBWfojbgkn759f/4DoPWSzzddrRM3IOH/cmQyyq4WW0ZCDl1syYs5rFBYj8KdHQCCKbFK9e9BhkG3fmdvbC3PfoNZzUqcMWmvKAdLrLrFx3gWo5PJ7yjRymCn2ZumnAfwWN4CN1Jqh1l43DWqzAUFwZMWu6vD6Fvb1782PhB1UPMqA0mXi4NRpOf453S6H4Qeb+v7KknbjfjcRvbtYSFmte5uwG/HdaGuCw77h0fYSy3VZZZt21sMYiSDxuDynEasRRtx5cN8y/PU01FgDZxpmqlrwr62XEG1bbMdzNjX+mxS/iEL5PlmChL+U2uxdjroWHm4nv/hVCF8+fPrTZoy+4fuIkyNDrVHvbB3ZcEhdvuQcNMjvpTjpfEWBPuKXwNLytjoF+M4v0cDepxBr2U7DhBUsfU522QLUcAEr
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BEZP281MB2791.DEUP281.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(136003)(396003)(366004)(376002)(346002)(451199021)(478600001)(6486002)(186003)(53546011)(6506007)(6512007)(966005)(2906002)(316002)(41300700001)(66946007)(66556008)(66476007)(6916009)(4326008)(5660300002)(8936002)(8676002)(38100700002)(82960400001)(86362001)(31696002)(2616005)(83380400001)(31686004)(66899021)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MnNnMEp1b2E0ajdoTjBsVWtSTm9aeld2ckovd0szWDRDL0FYbGx3TzJKTkla?=
 =?utf-8?B?QU5RaGI3YytkblVweHV5SFJlYzE3bExOeWxGTUlLYjZnYW5pZWRadENrL0Ri?=
 =?utf-8?B?a3N4aDhUYTJrWmVZUDlMKy9mMTUzbHNTeUhaTDlwd0tCOWZZYnY2ZFVJaWxN?=
 =?utf-8?B?OTUrcnhlaGZNVkJFNGx6ZHljaTJrK3BlMUJFcXcvMUJSbmNtb2M1UUE3VjZj?=
 =?utf-8?B?bGJ1MjZwRFJDbHpmWUJlMmh6eVVIUGJIQUVzdytSNHF4cHZOdzlkWEVsYTJL?=
 =?utf-8?B?NG5EejRwT0M0NGNzellPS0JQY0FMR3N5YlVTY2dic2xLVCswMXpJRTJyM0Va?=
 =?utf-8?B?bDhqS1RvdGFLclAwTnpPb29la1RGOGVoaS9QRk5WR3pjclJteGxRNHdoSW1M?=
 =?utf-8?B?SzJ4enp0Q3VHdW5uR25aN1l4UWhDdHNaaVdleGkvMGo4a0pzTzZ6M09kUkh4?=
 =?utf-8?B?aW9adWtXY1B1NTVrWmdaa3FLMFdPZ0RKcmVDSXdoaXlRb2VTd2FvZjBvRDdJ?=
 =?utf-8?B?RUR4YnQ4allWVytBdVpGVE9Wa2J6dnZrMDl4QWNSYzl4U3JVSzg1OUs2MDM2?=
 =?utf-8?B?bnI5ZlF0Nkc1ZUQrc1hkN29qWnRnMmo5MEsrZXFNTkZqdDNzRzFnVFl6dXZ2?=
 =?utf-8?B?ZkIwN3FtZUpYVGxMUHRSK0pYendud3RKMElFWlVHNWQ0Snd0dnJxaFVwQzdj?=
 =?utf-8?B?bmJqNWk4VUNuN0xLeFg1Q3JETTlJeEcyMEFycnJhMWtRMWRJek0vS0szczh0?=
 =?utf-8?B?S2lqdXhxMk5jZDZ4LzM1ZDFCdUhDMU1nSUQ1ZHZUNTVhUWRxSmQycEUyZkhq?=
 =?utf-8?B?T1R0Smc5dVFWVkJXeWR5dnpodTRDSW1mZmo1OGl5OFNpaEtNWGwxcUxnVkJW?=
 =?utf-8?B?dXRkUnAxWG1UQnhFNHFncVB5YVhoUlRZNE5lanZMeUtrU0hlR2tMeGRJbG9R?=
 =?utf-8?B?Q01MWmV6TVRpZ1N0bzBGYkJBd01iRmFvYUE0eVRFck5CWVgvTkNRU1h4YnQv?=
 =?utf-8?B?Zi8wV3hOTE1hanFVUFJGRi9reDFuTkg1eXJScnZvVUpHN1FhT21HZHZuTmxu?=
 =?utf-8?B?Yk5GdkRmSkZ3bHdxdHNHRkhoWEw1UVJsOFh1QmdBSE1qejFmVkhXSDhqdDJZ?=
 =?utf-8?B?RERvbGRERldYVmlLZ2JMZ2pMeDdDdzFXKzJDQmhLUTRaRE92TC85c3BraG1H?=
 =?utf-8?B?bEEwUGQ3cXdwUTdzSDZvYkVBZ3NabUpCZ1ZhUTZma3ZLMnZxSHQ1SVJPMzZJ?=
 =?utf-8?B?Rk95OFdNc0JpTGRPS2tHWStGTytqN0RSRVZYWC9iak0waC9XcEUyUS84NU1T?=
 =?utf-8?B?c1gyRHdId0w3bi9zK0VzNEpncFpJcEM0ZGNPcFBNc2QxKysxYkN5T2ErYjNn?=
 =?utf-8?B?S2pvTXBST3N0RzVEZU9rUUorSjhoZjR1UzdFdWJ2Uk1JTUZQYS9RYTdzdEJr?=
 =?utf-8?B?NE5kK1FJVjhqSDdFMDVoUGlIQWVta3hlL1hmeXVZUmdkRUwzc0szcTY2dVEx?=
 =?utf-8?B?eEtUeUdVQ3NsSUJlcnltMGg2YldMU3hCQWFVSFhkaWNOTElVK1BxK2RmbzU5?=
 =?utf-8?B?WmkrWTNLNWRsVDc5b1JPUVFINUFEM3prR0o0U2dhQzlneE5Ta0ovNCsrMytU?=
 =?utf-8?B?TGdDSUhXMHZUWmgvVmhiY1E2Q20vRDFlVVZvaGNXQitac2dMNWxEOW5oRmlN?=
 =?utf-8?B?bmtiUzhoR0tPRnBzUDlKM3lvekUrMTJzTGJuK3NaQTlkWDI0dUQyby9oZzFk?=
 =?utf-8?B?NC9Uc3p0Rk5YQlhsZmhxRFptMFNFdVplK0tWVWtnVHhRd1AxaURYSkVpSHZK?=
 =?utf-8?B?dW9jb2ZYanV4cFJYTUkzQ2tRRjBHN1Z5WllFMyt6WFRZQ1U2SlhNajlJbDBK?=
 =?utf-8?B?eU1hbWN0bGZUdFFqTjBLbEYvUnl6dGxpR2RxUTJwQjc0RWczVk13RDlQSVYz?=
 =?utf-8?B?TnR1ZnJtbVM3VDdiV1RGOTNmcExzNEFycVMyQUlqUTA2UTVYUVpqYjIvZzFh?=
 =?utf-8?B?VmdiTjVMbHdaQ1hCenNqR1ZYWVVIWXNLcGlqenhwYWIyQnFHMzVUeDF0c3Fx?=
 =?utf-8?B?Wm9YQXlJNUd1TEV0TklrcFdrUlM1N21Ma2ZRMXQ3RXdJNDZqbGsrbE5STDJn?=
 =?utf-8?B?VENGMnp0N2cxbnFSTDhIZmxDZHJYci9nV0JZWVBFajJ3bThlVGZaUjdOQWo1?=
 =?utf-8?B?QlN3YjZjWHFWamJWZ0oxOU1KQWVlVUdkL3RsLzd2OUViTlBpWUx4SVN0OW9q?=
 =?utf-8?Q?mtlGarkRqJ7HvKFcXqLj5rtPVXj7d8JNar2T6D4HCA=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 030d0d5e-c16a-435a-3f7a-08db82fb869f
X-MS-Exchange-CrossTenant-AuthSource: BEZP281MB2791.DEUP281.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2023 17:15:01.1729
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f930300c-c97d-4019-be03-add650a171c4
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: trks3c6PxJHTe5RjxnLb8hanP4EmiY6J7s40YZupMZyKbO+ddq6z2Rh8qoWuMT+rfyVp5TVO+8xf7V6X1LG4ZPWTc+O7kjNdm/SED1kVcFi+kkF1omslLzirAk0hwhGZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FR0P281MB3403
X-OriginatorOrg: aisec.fraunhofer.de
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Jul 2023 17:15:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103846

On 12.07.23 18:02, Khem Raj wrote:
> On Wed, Jul 12, 2023 at 7:58 AM Michael Weiß
> <michael.weiss@aisec.fraunhofer.de> wrote:
>>
>> The currently used version 1.6.20 of pv does not show the progress
>> bar if no controlling terminal is set. Added a patch which restores
>> previous behavior of pv as in version 1.6.6.
>>
>> Tested with pv in the busybox initscript of GyroidOS which is
>> running on /dev/console (which has no controlling tty). With this
>> fix, we get the progress bar back on /dev/console as before.
>>
>> This was also submitted upstream but dangling since several Months:
>>         https://github.com/a-j-wood/pv/pull/64
>>
>> Signed-off-by: Michael Weiß <michael.weiss@aisec.fraunhofer.de>
>> ---
>>  ...e-error-of-tcgetpgrp-in-pv_in_foregr.patch | 38 +++++++++++++++++++
>>  meta-oe/recipes-support/pv/pv_1.6.20.bb       |  1 +
>>  2 files changed, 39 insertions(+)
>>  create mode 100644 meta-oe/recipes-support/pv/pv/0001-pv-display-handle-error-of-tcgetpgrp-in-pv_in_foregr.patch
>>
>> diff --git a/meta-oe/recipes-support/pv/pv/0001-pv-display-handle-error-of-tcgetpgrp-in-pv_in_foregr.patch b/meta-oe/recipes-support/pv/pv/0001-pv-display-handle-error-of-tcgetpgrp-in-pv_in_foregr.patch
>> new file mode 100644
>> index 000000000..3c364dcc4
>> --- /dev/null
>> +++ b/meta-oe/recipes-support/pv/pv/0001-pv-display-handle-error-of-tcgetpgrp-in-pv_in_foregr.patch
>> @@ -0,0 +1,38 @@
>> +From c5cd932fb08e7ce90cdbf9ae6c5cc7e65ac0738e Mon Sep 17 00:00:00 2001
>> +From: =?UTF-8?q?Michael=20Wei=C3=9F?= <michael.weiss@aisec.fraunhofer.de>
>> +Date: Tue, 9 May 2023 20:00:26 +0200
>> +Subject: [PATCH] pv/display: handle error of tcgetpgrp() in pv_in_foreground()
>> +MIME-Version: 1.0
>> +Content-Type: text/plain; charset=UTF-8
>> +Content-Transfer-Encoding: 8bit
>> +
>> +Show pv progress bar even if no terminal is set, e.g., in a busybox
>> +init script. The description of pv_in_forground() states it will
>> +return true "if we aren't outputting to a terminal". However, this
>> +is not the case since tcgetpgrg() will return an error and set ERRNO
>> +to ENOTTY if the output fd is not an tty. We now handle this error
>> +correctly and pv_in_foreground() returns also true in that case.
>> +
>> +Signed-off-by: Michael Weiß <michael.weiss@aisec.fraunhofer.de>
>> +---
>> + src/pv/display.c | 4 ++++
>> + 1 file changed, 4 insertions(+)
>> +
>> +diff --git a/src/pv/display.c b/src/pv/display.c
>> +index aff643b..8d1f4c9 100644
>> +--- a/src/pv/display.c
>> ++++ b/src/pv/display.c
>> +@@ -48,6 +48,10 @@ bool pv_in_foreground(void)
>> +
>> +       our_process_group = getpgrp();
>> +       tty_process_group = tcgetpgrp(STDERR_FILENO);
>> ++
>> ++      if (tty_process_group == -1 && errno == ENOTTY)
>> ++              return true;
>> ++
>> +       if (our_process_group == tty_process_group)
>> +               return true;
>> +
>> +--
>> +2.30.2
>> +
>> diff --git a/meta-oe/recipes-support/pv/pv_1.6.20.bb b/meta-oe/recipes-support/pv/pv_1.6.20.bb
>> index 867a621d1..87b764ac5 100644
>> --- a/meta-oe/recipes-support/pv/pv_1.6.20.bb
>> +++ b/meta-oe/recipes-support/pv/pv_1.6.20.bb
>> @@ -5,6 +5,7 @@ LICENSE = "Artistic-2.0"
>>  LIC_FILES_CHKSUM = "file://doc/COPYING;md5=9c50db2589ee3ef10a9b7b2e50ce1d02"
>>
>>  SRC_URI = "https://www.ivarch.com/programs/sources/${BP}.tar.bz2 \
>> +           file://0001-pv-display-handle-error-of-tcgetpgrp-in-pv_in_foregr.patch" \
> 
> There is a spurious end of quote ( " ) above. How was this patch tested ?

I just ported the patch from our own layer from a bbappend file where the included
patch from pv itself was tested for several month now.
Seems that I have forgotten a "git add" when I was amending to fix that error.
Though the typo was fixed only in my workdir during tests.
I'll come up with a v2 shortly. Thanks for spotting this.

> 
>>             file://run-ptest \
>>  "
>>  SRC_URI[sha256sum] = "e831951eff0718fba9b1ef286128773b9d0e723e1fbfae88d5a3188814fdc603"
>> --
>> 2.30.2
>>
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#103842): https://lists.openembedded.org/g/openembedded-devel/message/103842
>> Mute This Topic: https://lists.openembedded.org/mt/100101204/1997914
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>

