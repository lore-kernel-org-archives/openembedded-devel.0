Received: from NAM04-SN1-obe.outbound.protection.outlook.com (NAM04-SN1-obe.outbound.protection.outlook.com [40.107.70.84])
 by mx.groups.io with SMTP id smtpd.web09.1105.1611599771407649061
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Jan 2021 10:36:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=YxN4dZ11;
 spf=pass (domain: windriver.com, ip: 40.107.70.84, mailfrom: mark.asselstine@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IfEt8a3U5/7tv8dO55MKJ2KYPcUXyegixjnjN4TgZl+SbR435/Ns4/oUUOjQAPa8wiB0i8wJbDqsf6tbnN6u98I1z+6+Qy7VbTskg9DgklYGXGrAFyf33jv5cAnSbnJEGVhoWYlJHBfyV8C0ZBTndPvc+wP9cwHFYRYON7KvlkLeKdRwAbhrhQIRaSYQOwoq1dGvKZcxxQ3dTI7pW3Qh9i0XJvov9NdJcPptUyREnACuvYkMRgMZyQ54hyKTOk2uEGiu7CGJWJs4C7w2SBmHoEOxFTe4+5zFnBAXC1/5rdsHYjoeUsOiMJfpb+9TZlOhxA7JnTrDlquY/puQgHPiVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HkrFK6U6ra9j2eCX8LwQuAs20kZXoioHc9Vv1Co3HPY=;
 b=TI7r+GzDhegfEoX8X1EOBczsbd3MOEZlgtHuD5Y3utHRzfkiiq+dIBrbqnss0NSX6jDvePHjBCk8OlTmLAHIvyyAVAzRgZBDg4wqQFpGbYdW9KBc0QT0p1Q2agqAVCBos9aO5LIyFkspNpBTZrfv/ubwnqrkayw1AeDEO6lWtMds3LrI0Z1CixiYqyvqICoWp95Xe9SI2sEUgyMEhAaVCqid6MRV/rtQdgx5SjT1BJh2FKSzGrh5Wfrzsw3foWmnZu5ytYvBAWLwu7vASbi11dvJPFopW87xKFSq9FyF8eAh1DOKKcHqsDzSjbXRtQllKtJH7cz2ZDbe5zDjys3EyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HkrFK6U6ra9j2eCX8LwQuAs20kZXoioHc9Vv1Co3HPY=;
 b=YxN4dZ11sUiZRvTPbnxXFO2TdoTG01HhfnrNKSZ6ud2R874TaV2pw8t9PF/A1VH2bm4GchQ/wUYltaS9y3o57zGNwSbaZsPomNhXaQVZw5OVTPDRpNbHNQJAxr10QPFL3BdFlsDQaS73e6T+/ix6Icq4ydpc+TYhSr5Jf3OHFDw=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CO1PR11MB4820.namprd11.prod.outlook.com (2603:10b6:303:6f::8)
 by MWHPR1101MB2286.namprd11.prod.outlook.com (2603:10b6:301:5b::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.13; Mon, 25 Jan
 2021 18:36:10 +0000
Received: from CO1PR11MB4820.namprd11.prod.outlook.com
 ([fe80::35f8:3959:57d5:9d0a]) by CO1PR11MB4820.namprd11.prod.outlook.com
 ([fe80::35f8:3959:57d5:9d0a%4]) with mapi id 15.20.3784.017; Mon, 25 Jan 2021
 18:36:10 +0000
From: "Mark Asselstine" <mark.asselstine@windriver.com>
To: openembedded-devel@lists.openembedded.org, Mario Schuknecht <mario.schuknecht@dresearch-fe.de>
Cc: raj.khem@gmail.com, Mario Schuknecht <mario.schuknecht@dresearch-fe.de>
Subject: Re: [oe][meta-networking][PATCH] dnsmasq: Fix systemd service
Date: Mon, 25 Jan 2021 13:36:06 -0500
Message-ID: <8398216.VV5PYv0bhD@yow-masselst-lx1>
Organization: Wind River
In-Reply-To: <20210125170919.5952-1-mario.schuknecht@dresearch-fe.de>
References: <20210125170919.5952-1-mario.schuknecht@dresearch-fe.de>
X-Originating-IP: [198.84.181.245]
X-ClientProxiedBy: YQBPR0101CA0117.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:5::20) To CO1PR11MB4820.namprd11.prod.outlook.com
 (2603:10b6:303:6f::8)
Return-Path: mark.asselstine@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from yow-masselst-lx1.localnet (198.84.181.245) by YQBPR0101CA0117.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c01:5::20) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.12 via Frontend Transport; Mon, 25 Jan 2021 18:36:09 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a4ae8859-f544-4557-85cb-08d8c16015d7
X-MS-TrafficTypeDiagnostic: MWHPR1101MB2286:
X-Microsoft-Antispam-PRVS: 
	<MWHPR1101MB2286D1F7E4612BC55D4A4830EDBD9@MWHPR1101MB2286.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	+X5afoyft0gKH4dirRqta8uS+MhXioR2Wn9X7acRnePTLBQddBVglrX3e+S7Iaokg+OcmDdPFabjNNLjJ7k59s5youLWIXhU401PJ4eWI4FYpPGHUFZ3GzW829tes5tpkHaJmjxg6iyvj7VL54gdzmv6r2SJ8Gj2y5fRscTp0X9Wq+rX9aSf7m8Wb9jiXrKjNoOVwMuEMi1P/QfuMyGJQRjn3mG30CKaxe/FNL19B7RcJiC3gxv9wWOK+Nepv3MoLSKofM8zzKpKUPz5LDUB5JSTHyLT68GVebh3QKDBS4LH6GI53duFCLnF8Tziw7PaXndtWP8tLtEdX8NiL4fBZwY//DimYGHqoGDm144xTqHeG4tp2L/Y91SzD4z5SV+zAMzxvJkgQHvO1vTAPM5wzE3LQKPzpa1LP/VISEwxHe3z9oeXLFp+r88SMrbnuSTO6G92kUWIrJyqAY4VW+rhYaX6I078mMdGqVDFIBKrUsM=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4820.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(346002)(366004)(396003)(39850400004)(136003)(5660300002)(186003)(16526019)(6486002)(83380400001)(2906002)(33716001)(26005)(8936002)(956004)(66556008)(66476007)(4326008)(478600001)(8676002)(52116002)(9686003)(36916002)(6916009)(6666004)(316002)(6506007)(53546011)(44832011)(66946007)(6512007)(86362001)(39026012);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	aGGU33uhpQQysEv3GbW5Kl84VZTnyoJ+Sam/x/ZZIaWf2m54BT17i+rSqZdQsWr+5HOWO93g4foK0FqzD7GfpYt0UsfVesfmDnF8XP2WdCZta1bcLj0jGzYDlKUbD5iAstSbhPcJQGmwB91aKVX8u5iSw9gQYQfMfQOnZ5ce2zVwRpeWeBHF3QrVNkjACVsfR/xsQxWbBiXM9D8IHpjsrjP11OUGq1haf7r0EyPrqbj3X5bpfq7oGNjzBy7UD94r/zaXzdEFlIqiZ7fK8Z84pvslHUEuBD1F50GAnq1Ch+PlR3CRxe6mOmP0UkpJaWn7bZcVd6bULdHKWfq7CcHX7x8rua7oKOYCw4LTczUu5VUzZS6d5S3kxznNjslSLd811ey15mRRCkqkH3Fo9zfcwWi5/0R7IhLwhOdPgQsTCredTaE4YqtMpaci+OJ/t+2UFnv3uhimSI5C1DdtWem5FY11LE+e0wgFtIIqrnC2WgCBKOt9VvNo1KBz9v+c22z+CYlaIsxpAQKFgBUkXyIIwnr5/SLSr1cy+LFzX/Yfjdge9iwQvakrHRLcAEH5QjjC8+gzEni8AITKfXlpqdNUVY4iV0M5fzl99cTirIlu5wAjnnvEYecoOcw+XG++8b/T4QDEt1D/fiGKYYgQKXygNVuY+YG+0BWxDuDGGd7HnYEW4jHGwdXgKPJ91TsaR+6Zf1gEyx3pemwm0b6ku181IuF2QOVREz1rJBuTwOEmu7iBHs4Vzb5t9fTn4Z+fST4p
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a4ae8859-f544-4557-85cb-08d8c16015d7
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4820.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2021 18:36:10.1467
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZQgNjBNJIU1gaB5Oje6bFPFUkecc8FB57t3d71jYiA8tbhiuv64rxMzSpBzDM8PIMsMoaDzvH4yCXXeDxH9Wx7fJUIDY0tXYGDEZfRY9MXk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1101MB2286
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday, January 25, 2021 12:09:19 P.M. EST Mario Schuknecht wrote:
> Systemd service file option 'ExecStopPre' is warned and ignored by
> systemd. By replacing 'ExecStopPre' with 'ExecStop', the intended
> behavior is realized. The 'ExecStop' commands are executed one after the
> other.
> 
> Signed-off-by: Mario Schuknecht <mario.schuknecht@dresearch-fe.de>
> ---

According to Lennart's comment on [https://bugs.freedesktop.org/show_bug.cgi?
id=73177] this looks to be aligned. Thanks for sending the update.

Mark

>  .../recipes-support/dnsmasq/files/dnsmasq-resolvconf.service            | 2
> +- 1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git
> a/meta-networking/recipes-support/dnsmasq/files/dnsmasq-resolvconf.service
> b/meta-networking/recipes-support/dnsmasq/files/dnsmasq-resolvconf.service
> index 2980f7def..ef2f3f7e4 100644
> ---
> a/meta-networking/recipes-support/dnsmasq/files/dnsmasq-resolvconf.service
> +++
> b/meta-networking/recipes-support/dnsmasq/files/dnsmasq-resolvconf.service
> @@ -8,7 +8,7 @@ PIDFile=/run/dnsmasq.pid
>  ExecStartPre=/usr/bin/dnsmasq --test
>  ExecStart=/usr/bin/dnsmasq -x /run/dnsmasq.pid -7 /etc/dnsmasq.d
> --local-service ExecStartPost=/usr/bin/dnsmasq-resolvconf-helper start
> -ExecStopPre=/usr/bin/dnsmasq-resolvconf-helper stop
> +ExecStop=/usr/bin/dnsmasq-resolvconf-helper stop
>  ExecStop=/bin/kill $MAINPID
>  ExecReload=/bin/kill -HUP $MAINPID





