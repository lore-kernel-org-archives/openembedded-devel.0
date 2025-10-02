Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E6FDCAC5B0
	for <webhook@archiver.kernel.org>; Thu,  2 Oct 2025 11:50:26 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.62])
 by mx.groups.io with SMTP id smtpd.web10.3240.1759390309863473508
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 02 Oct 2025 00:31:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@hbkworld.com header.s=selector1 header.b=YiR5EthR;
 spf=pass (domain: hbkworld.com, ip: 52.101.72.62, mailfrom: joao.lima@hbkworld.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xlxN8tLpOhRtxeMsxbkWfV6/fCAaNKgo7gNSzLe8/OPkn9bxIrCzgC3H1SJk3iUxUrvE2LDRzOhgA3jrAz4r/oBv7bEclThEEJx22gbmTasSAvrrDk91ooTyje3NF8cVD7V4mg0rMDt/Pk8rr8ajvGGi/K10ZtQ69oryk173Gcr6ghcALMmrmZbAC7pH5COKWLpqW/I0Uao9GH3DSB4/xbsGEYiERT4jpE9K67GNqpHcEy82EGH10+bI8+ANa88RrsCaMkVxzrHOr9b4o+lMqDQBMgTsgf2WlsYntoD3yBcCg4CwG2Z4a19WLe8Yzg8oEeYFrjcM7TRXEhKVlBjiDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yst1mR6iIdmhMkfk6w9MSMMMD6lfDDfR2LE58NOHJNc=;
 b=GfF9hCXjpZLu/ZAldT/uxE6NmjDMlBVPk8dCtV3LZCUpf8WYpkFKpYzVNa8HB+xzJ6pesbQfm5KZCLwQwT60Hc7i1mmyihHUuuAgdkACjpoCqTU65z9vligiBMLj85unQyyIX/HyWHwGT53DLnIVyuUUeNS/zdsGhX/wURgiQo/33Yq/7Wm5855Y7+A0beEnMnocoQCpO0MSNTdKSOFdscMjAW0pc5xhTLmHuFnAHIMoeb58/FAYvDtc0CYFqSu0c+WY3nN2G4VMz7bKUDNlWyvbrW6tk1MbqsGdlEQYv3MrBV9zwguKQsyZe5KbLnQ/AKPzE/ZgflfrMv0o//1pKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hbkworld.com; dmarc=pass action=none header.from=hbkworld.com;
 dkim=pass header.d=hbkworld.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hbkworld.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yst1mR6iIdmhMkfk6w9MSMMMD6lfDDfR2LE58NOHJNc=;
 b=YiR5EthR1VSjoDk5eekMDxZqo6YRbCB4Q2TeckHAd6tAw2HxTu+5A1LnU1RNS+mU7m6zbSZlrikYaIqgAPChyiqfxIo3jodETNtLaNdBcqlCfBett3agZkw8ZM/EngbbNJv7obGGvg9YqTzs2bbs6/aR7KPqsHwHQAGc5v6BA/OYr+9d08SBzhSUNSfZyd9rHYDRaYIGl3i5gT9SpXk4Ya0hTqcMTUwLZyUlUOpS0p/ra3GmS+YpgJ3NxWRKRUmeioaxnjiosbkl0D/2xs05REDQazqW0eYJt8tmQYC4r89tC7Re/pKPzD0kLCMzEztYJF6jZZyX6EidItgFDal7dA==
Received: from DB3PR09MB6202.eurprd09.prod.outlook.com (2603:10a6:10:43a::13)
 by VI0PR09MB8480.eurprd09.prod.outlook.com (2603:10a6:800:2ed::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.18; Thu, 2 Oct
 2025 07:17:00 +0000
Received: from DB3PR09MB6202.eurprd09.prod.outlook.com
 ([fe80::ce00:c6f4:8427:f779]) by DB3PR09MB6202.eurprd09.prod.outlook.com
 ([fe80::ce00:c6f4:8427:f779%6]) with mapi id 15.20.9160.017; Thu, 2 Oct 2025
 07:17:00 +0000
From: =?iso-8859-1?Q?Jo=E3o_Lima?= <joao.lima@hbkworld.com>
To: Khem Raj <raj.khem@gmail.com>, =?iso-8859-1?Q?Lima=2C_Jo=E3o?=
	<joao.raul.434@gmail.com>, "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 0/3] openocd: Add dmem support and update dependencies
Thread-Topic: EXTERNAL: Re: [meta-oe][PATCH 0/3] openocd: Add dmem support and
 update dependencies
Thread-Index: AQHcMu/k+L0B6Fm/TUO8TH6vh9cKOrSucilB
Date: Thu, 2 Oct 2025 07:17:00 +0000
Message-ID: 
 <DB3PR09MB6202132CD2CF6FEBFB54A99C9AE7A@DB3PR09MB6202.eurprd09.prod.outlook.com>
References: <20251001130452.542-1-joao.lima@hbkworld.com>
 <a799cdbe-54b5-484e-84e2-4a847236aa3d@gmail.com>
In-Reply-To: <a799cdbe-54b5-484e-84e2-4a847236aa3d@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9208be00-d674-40fd-8399-cd3587f85bc0_Enabled=True;MSIP_Label_9208be00-d674-40fd-8399-cd3587f85bc0_SiteId=6cce74a3-3975-45e0-9893-b072988b30b6;MSIP_Label_9208be00-d674-40fd-8399-cd3587f85bc0_SetDate=2025-10-02T07:17:00.088Z;MSIP_Label_9208be00-d674-40fd-8399-cd3587f85bc0_Name=Unrestricted;MSIP_Label_9208be00-d674-40fd-8399-cd3587f85bc0_ContentBits=1;MSIP_Label_9208be00-d674-40fd-8399-cd3587f85bc0_Method=Privileged;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=hbkworld.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB3PR09MB6202:EE_|VI0PR09MB8480:EE_
x-ms-office365-filtering-correlation-id: 42b31622-4a27-429b-3cb8-08de0183ae12
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|31052699007|39142699007|366016|1800799024|376014|38070700021|13003099007|7053199007|8096899003;
x-microsoft-antispam-message-info: 
 =?iso-8859-1?Q?PsNuzcEKz9zfKOrDIujcET4geWOQcgQbZTQmsEp38J+GxB32ecsMhkzI1C?=
 =?iso-8859-1?Q?7mlrQhW8M0qy376oikRxFkmvcf8GzziavvqC/Y+pzsdJrS0RWItN8vqZsq?=
 =?iso-8859-1?Q?RnynpWsGDdv3tbVKZUtisohoQ795UE+HVNJ8RVwt+ra3qZDjorCLFwwvMM?=
 =?iso-8859-1?Q?WvLcBD3Tjow97drV9TWTtlr9VQwNuFJA98bv07Z9XkW+z7xLAmyFPh2pzm?=
 =?iso-8859-1?Q?2MYfSbi6bnrmcQu4YY2wlZ7E4NjKvgeiWcbTrucWEnrBTWHJ8FsQ10n42C?=
 =?iso-8859-1?Q?UTo2LpyaAsGW1TdDvz947HWMqK0QM8UoAyBkUHxxkfTSBMt2RnXjcZPpzU?=
 =?iso-8859-1?Q?3hEcf9AA6Amm+SigZHWXKq7g8itL1BE1qW5Rab/qTkTO95u/fLN1sLjcPY?=
 =?iso-8859-1?Q?gUOowxr5McG79Ig3h2Ifsg5++QCam1mIEo8GQzaOSqEM/Aa64y/mhLpTzL?=
 =?iso-8859-1?Q?3ttUslA8i1lIoRbEGcRpk66mdWwaH2RZeZd21ho1x/WSxqkrRi/bj6zx9N?=
 =?iso-8859-1?Q?tyNB4jMo1FMJ9aQlRUxzHPoE49uqf3KpS3uK7VFcxigGC1LaTpXadEg0LF?=
 =?iso-8859-1?Q?aJMIo0kzTcRnCffLSB7zPIyEGf8ACujvsDq1BIZ8X0NEfXbTbwZfQm9J64?=
 =?iso-8859-1?Q?qfMVS3jBjxzZicnG4gboZbiQRxLsPC63/H6PzuFGc0KvaRlSDlDr5rvBSM?=
 =?iso-8859-1?Q?w2KPOR9K+kyhJULLrKKSf8heCBwfJyf9BFyPHiFeLD7O33dfxBMIxPmj58?=
 =?iso-8859-1?Q?xxcyuTncKT24wvkyJy+7c+jz2YpwxUBR0pb0LRp+e++cp8uxXu3g+vH1kE?=
 =?iso-8859-1?Q?Y4JhpjYsWnL7657WH1tDJGhhOsH7amkM6ApD3soZ7awzsMGAUB7HSySroI?=
 =?iso-8859-1?Q?ty4AlAmbwQZVvwlXQPjGT48nt9CnSUxqgvJK1WbnLEZRLafrZZX6nY6MRu?=
 =?iso-8859-1?Q?ljtZid3tS25aWtGX687uldwYDCtCzRahslG+krnAOnutRd+6u/7JPyABnw?=
 =?iso-8859-1?Q?neRNm8hqScT1QWcXoFZNilxf7pfg7yeGj+s/DUt04Jg0ZJSmpSuiQGAzgG?=
 =?iso-8859-1?Q?R6obFxJE64zbLp7eUMtJq1ZwBgGl/Ckbd5EQ1baFnd/tDo5HWErMaXkk20?=
 =?iso-8859-1?Q?LSfI/aqy6XsLSFNUHthUOkAs81sQ3zjAKile2gwr862DzscOs1uLm5wQWP?=
 =?iso-8859-1?Q?BWICSi14hwtURpxfG0RKige4JXoxrq/KvYh/vhhWulwRr6rRqmOdCY8YcI?=
 =?iso-8859-1?Q?8m+9q5cHl74bFKtBnijJcSNKqDk45mKEaAgE4ehnMtbcgXyB96mNA2Lhcn?=
 =?iso-8859-1?Q?vQZnQ8nyRBUmE0aa4wCImVNsxhsHxph8RhDWslkNygsjgfVPJ4ckRdSXBT?=
 =?iso-8859-1?Q?o7DbifniGMyJNP2yAXIkV54wF7GcTtqTkTf8rOr4BbCB/GLrPUNkZQuSfR?=
 =?iso-8859-1?Q?sZZkPBS00VJ9FHeAbPNatBC5UK9gbCxfiOMoynfS7znq/nfdExaABo+QY0?=
 =?iso-8859-1?Q?us+T7A5X2il6a8cdQJte/cv2pqELjy1onbV3L6wJYHdA=3D=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB3PR09MB6202.eurprd09.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(31052699007)(39142699007)(366016)(1800799024)(376014)(38070700021)(13003099007)(7053199007)(8096899003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?HrnV5Y7uGbdSQU3uFgmrEfkhuyNKaOKzC2xgEVN5UfI+VWuSu9GtSotP8d?=
 =?iso-8859-1?Q?lfxs6JyNcrKAPbWn/SWgdLdreediS+ZI6DIiUfmiX9/VwIR1AFCSH9CVno?=
 =?iso-8859-1?Q?AfUk4hza66/a+6CcQcqBlSVa8p9N/dHpbCL/4Y6SMi3wxMQo6Er23t7N9O?=
 =?iso-8859-1?Q?HOFZAh7EcyJmX0NuboReXSRI2dNWTsyFl/hPwugn9/6aYuh53HKrXIgvd8?=
 =?iso-8859-1?Q?sZbU1Bq01qdImC+v84jVDkPooTYnuaWEFTXhxD5psZY1vYp2uO/u1eLJIH?=
 =?iso-8859-1?Q?FclD0TNttHOqOVzu2jcMelLNlmSiU+Z3d+wwDrIS19ZBm3FOgGydoJmy5k?=
 =?iso-8859-1?Q?gVfw0/u2iahtFlSGfaWhrmjKPnaXVZr7Y14OW9xdHrvdlzTGjfGjO5gf5t?=
 =?iso-8859-1?Q?3rlIZULl6yUyo0kMX+e0uirxTc4neHBm6Ok31SzDPuKFKSVRNhvjpflaUM?=
 =?iso-8859-1?Q?izwlKQGxQ2NDTHHzjCnQqXOOFIhw5KH2M4bMyHZXLlpxf4nqpCsyjlBGcS?=
 =?iso-8859-1?Q?1J0sb8FqWFEIzAjAFW/RGx4M77Zo7+WAsDUtI8jKtr7q+JfcyIJGYY96Y/?=
 =?iso-8859-1?Q?/a3gxsHMoMy+58Zw8Ma8i5wI81Qg7r2FXYGFC/KBVDhC5srxJNiH08v0NS?=
 =?iso-8859-1?Q?atRXs7PEerOWE96fUxQoqvSBZZnO7ylVgMvHZT9JLbFuch0fTUoUbsfjJN?=
 =?iso-8859-1?Q?YlZNxxF1gftRDZVLAQjAZ7Z+xiww9UgMJRz+8sOPBtI4IykfRxxjj4tHt6?=
 =?iso-8859-1?Q?U0NOL/QiApPas1M+S041755hNX/PtOKGxEp9UF9nyYiTr1yYOsEyd2Kt0l?=
 =?iso-8859-1?Q?jNdtrNt0Kgduu78nraE7GZA0ODX8xMAk/RiJuExq39e/IRJAw9A9Amrwf4?=
 =?iso-8859-1?Q?VhfrFUrciCUG2Ghn3ccWfK0VbhglS6ZmyB0W5QKQF68dsY5o5b3aWbfokH?=
 =?iso-8859-1?Q?0TmnwZMkZGg1AVtPm58GViWMZQlQHTe5N70OKIniktJH+M2dlMfmM40IC2?=
 =?iso-8859-1?Q?JbsLH2kty/1tJPFT/SvHKH/UeBqqx/Y5eif76xyf3cBrjTkHL54UtYXmPY?=
 =?iso-8859-1?Q?kTWdP8BZM8PH5W4P43CfslR+ZithpEoBeDetZU4P3Lo2pB7bjFUSlRVv9B?=
 =?iso-8859-1?Q?sWqRv0+TFuQHq9Gtu82v2iRwiwa32fm5HariqXffbJTrWxh1hYWCpWLe68?=
 =?iso-8859-1?Q?Ismg6z3xnrQ5SjmmnYkVIen3U/1hmciOxUqSRfFrOeanLg+Wx75sCUKYOu?=
 =?iso-8859-1?Q?M+2E0M60yLcPhbPMI2lqkCpkDGC/btjEdj/QWZwS6LeTMKbpAyUQXO8dm9?=
 =?iso-8859-1?Q?MNqyA6uYrdIaIrZ0V0WJ/FGtJ+8vH7sGUhWtBK+mlO1RjlSGkYkIZlweq/?=
 =?iso-8859-1?Q?qaAMqqnE734xlKyN5l/HhGvTJgTphpQt6B+0OmTiGA99gFHtgmPTmyjvbl?=
 =?iso-8859-1?Q?LsqWNbbdZVXp1vF5qYSjw8xxBD4wjiYF3cre90x/9Qr4SkUmKvSDvBGgIw?=
 =?iso-8859-1?Q?NP1WvpiBA+lfReYa7wjaVTufEyD6hMbAmBIJaUWWdrqlVADdlmrXcw1l85?=
 =?iso-8859-1?Q?DECuiNIFFLLeHR5yNv/Q8QvmxzCPh506ZePCgQP1uhDBqUyaXlNAkea9dG?=
 =?iso-8859-1?Q?lr2rmZ814SVUWmvA2stHEHBwOMofNKqu8G?=
MIME-Version: 1.0
X-OriginatorOrg: hbkworld.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB3PR09MB6202.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42b31622-4a27-429b-3cb8-08de0183ae12
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Oct 2025 07:17:00.5786
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 6cce74a3-3975-45e0-9893-b072988b30b6
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ySAVnx/fAaAWdoBUJ7eVM2o2+6K6PPASN2nyKdPrHtJdYh471O4S754KeHhCtlylijoaJl4ejozQGlIj4i4XkYKaZLu5zupOuFik/WX20U0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR09MB8480
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_DB3PR09MB6202132CD2CF6FEBFB54A99C9AE7ADB3PR09MB6202eurp_"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 02 Oct 2025 11:50:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120168

--_000_DB3PR09MB6202132CD2CF6FEBFB54A99C9AE7ADB3PR09MB6202eurp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Thanks for the feedback.

I'm currently working on top of:
URI:    https://git.openembedded.org/meta-openembedded
Branch: scarthgap
Commit: e8fd97d86af86cdcc5a6eb3f301cbaf6a2084943

Should I rebase my patch series on top of the latest master (or master-next=
) branch, even though I'm targeting the scarthgap branch?
As this is my first submission to the project, I want to ensure I'm followi=
ng the correct process.

Thanks for the submission tip.


Cumprimentos /Kind regards



Jo=E3o Lima

Embedded Software Developer, Genesis High Speed

UNRESTRICTED
________________________________
From: Khem Raj <raj.khem@gmail.com>
Sent: Wednesday, October 1, 2025 5:22 PM
To: Lima, Jo=E3o <joao.raul.434@gmail.com>; openembedded-devel@lists.openem=
bedded.org <openembedded-devel@lists.openembedded.org>; Jo=E3o Lima <joao.l=
ima@hbkworld.com>
Subject: EXTERNAL: Re: [meta-oe][PATCH 0/3] openocd: Add dmem support and u=
pdate dependencies

CAUTION! External Email. Do not click links or open attachments unless you =
recognize the sender and are sure the content is safe.
If you think this is a phishing email, please report it by using the "Phish=
 Alert Report" button in Outlook.

On 10/1/25 6:04 AM, Lima, Jo=E3o wrote:
> From: Joao Lima <joao.lima@hbkworld.com>
>
> This patch series updates OpenOCD to support direct memory access (dmem)
> via SWD emulation for Texas Instruments AM64x and J784s4 platforms.
>
> Changes include:
> 1. Version bumps:
>     - openocd: 91bd431 -> 66ea461
>     - jimtcl: fcbb449 -> f160866
>     - libjaylink: 9aa7a59 -> 0d23921
>
> 2. Platform support patches:
>     - Add SWD native configuration files for AM64x and J784s4 boards
>     - Configure DMEM access parameters in ti_k3.cfg for direct memory ope=
rations
>     - Set up DAPBUS debugger and emulated AP descriptions
>
> 3. Build configuration:
>     - Enable dmem adapter driver (--enable-dmem)
>     - Enable internal jimtcl (--enable-internal-jimtcl)
>     - Add both features to default PACKAGECONFIG
>
> This enables self-hosted debug configurations where OpenOCD runs on one o=
f
> the CPUs inside the SoC.
>
> Upstream-Status: Submitted
> - https://eur01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fopen=
ocd.zylin.com%2F%23%2Fc%2F9020%2F&data=3D05%7C02%7Cjoao.lima%40hbkworld.com=
%7C0be1393f749b4b3a254d08de0106cb07%7C6cce74a3397545e09893b072988b30b6%7C0%=
7C0%7C638949326829662188%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIl=
YiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C80000%=
7C%7C%7C&sdata=3Dmr0knEMNTixqKo20WB6sAP3w0Os3PC%2FHaEMGG%2F3SDjw%3D&reserve=
d=3D0<http://openocd.zylin.com/#/c/9020/>
> - https://eur01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fopen=
ocd.zylin.com%2F%23%2Fc%2F9021%2F&data=3D05%7C02%7Cjoao.lima%40hbkworld.com=
%7C0be1393f749b4b3a254d08de0106cb07%7C6cce74a3397545e09893b072988b30b6%7C0%=
7C0%7C638949326829712748%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIl=
YiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C80000%=
7C%7C%7C&sdata=3D%2F%2Fc%2BmSu3HrA%2F2IWn9jqFAo4x2bNR54ABpO0mSZEZ%2FCM%3D&r=
eserved=3D0<http://openocd.zylin.com/#/c/9021/>
>
> Joao Lima (3):
>    openocd: bump the openocd, jimtcl versions
>    openocd: add dmem support to am64xx and j784s4 platforms
>    openocd: enable dmem and jimtcl
>
>   ...wd_native.cfg-Add-support-for-direct.patch | 77 +++++++++++++++++++
>   ....cfg-Add-support-for-direct-memory-a.patch | 65 ++++++++++++++++
>   .../recipes-devtools/openocd/openocd_git.bb   | 13 +++-
>   3 files changed, 151 insertions(+), 4 deletions(-)
>   create mode 100644 meta-oe/recipes-devtools/openocd/openocd/0001-tcl-bo=
ard-ti_-_swd_native.cfg-Add-support-for-direct.patch
>   create mode 100644 meta-oe/recipes-devtools/openocd/openocd/0002-tcl-ta=
rget-ti_k3.cfg-Add-support-for-direct-memory-a.patch
>


Thanks for the patchset, Please rebase it on latest master branch or
master-next branch and resend. While resending send the whole series
together with git send-email *.patch or something so tools like
patchwork and lore can record this as a series.

HBK FiberSensing S.A. NIF: 506807312 Registered office: Via Jos=E9 R=E9gio,=
 256, 4485-860, Vilar do Pinheiro, Portugal. Esta mensagem e eventuais anex=
os s=E3o confidenciais e destinados exclusivamente ao(s) destinat=E1rio(s) =
indicado(s). Se recebeu esta mensagem por engano, por favor notifique o rem=
etente e elimine-a de imediato. =C9 proibida a divulga=E7=E3o, c=F3pia ou u=
tiliza=E7=E3o n=E3o autorizada do seu conte=FAdo. This message and any atta=
chments are confidential and intended solely for the designated recipient(s=
). If you have received this message in error, please notify the sender and=
 delete it immediately. Unauthorized disclosure, copying, or use of its con=
tents is prohibited.

--_000_DB3PR09MB6202132CD2CF6FEBFB54A99C9AE7ADB3PR09MB6202eurp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Thanks for the feedback.</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
I'm currently working on top of:</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
URI: &nbsp; &nbsp;https://git.openembedded.org/meta-openembedded &nbsp;</di=
v>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Branch: scarthgap &nbsp;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Commit: e8fd97d86af86cdcc5a6eb3f301cbaf6a2084943</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Should I rebase my patch series on top of the latest master (or master-next=
) branch, even though I'm targeting the scarthgap branch?</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
As this is my first submission to the project, I want to ensure I'm followi=
ng the correct process.<br>
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Thanks for the submission tip.</div>
<div class=3D"elementToProof" id=3D"Signature">
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<p style=3D"margin: 0cm; font-family: Calibri, sans-serif; font-size: 11pt;=
" class=3D"elementToProof">
<span style=3D"font-family: Arial, sans-serif; font-size: 9pt; color: black=
;">Cumprimentos
<i>/</i>Kind regards&nbsp;</span></p>
<p style=3D"margin: 0cm; font-family: Calibri, sans-serif; font-size: 11pt;=
" class=3D"elementToProof">
<span style=3D"font-family: Arial, sans-serif; font-size: 9pt; color: black=
;"><b>&nbsp;</b></span></p>
<p style=3D"margin: 0cm; font-family: Calibri, sans-serif; font-size: 11pt;=
" class=3D"elementToProof">
<span style=3D"font-family: Arial, sans-serif; font-size: 9pt; color: black=
;"><b>Jo=E3o Lima</b>&nbsp;</span></p>
<p style=3D"margin: 0cm; font-family: Calibri, sans-serif; font-size: 11pt;=
" class=3D"elementToProof">
<span style=3D"font-family: Arial, sans-serif; font-size: 9pt; color: black=
;">Embedded Software Developer, Genesis High Speed&nbsp;</span></p>
<div class=3D"elementToProof"><br>
</div>
<div style=3D"text-align: center; margin-left: 5pt; font-family: Calibri; f=
ont-size: 7pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
UNRESTRICTED</div>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Khem Raj &lt;raj.khem=
@gmail.com&gt;<br>
<b>Sent:</b> Wednesday, October 1, 2025 5:22 PM<br>
<b>To:</b> Lima, Jo=E3o &lt;joao.raul.434@gmail.com&gt;; openembedded-devel=
@lists.openembedded.org &lt;openembedded-devel@lists.openembedded.org&gt;; =
Jo=E3o Lima &lt;joao.lima@hbkworld.com&gt;<br>
<b>Subject:</b> EXTERNAL: Re: [meta-oe][PATCH 0/3] openocd: Add dmem suppor=
t and update dependencies</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">CAUTION! External Email. Do not click links or ope=
n attachments unless you recognize the sender and are sure the content is s=
afe.<br>
If you think this is a phishing email, please report it by using the &quot;=
Phish Alert Report&quot; button in Outlook.<br>
<br>
On 10/1/25 6:04 AM, Lima, Jo=E3o wrote:<br>
&gt; From: Joao Lima &lt;joao.lima@hbkworld.com&gt;<br>
&gt;<br>
&gt; This patch series updates OpenOCD to support direct memory access (dme=
m)<br>
&gt; via SWD emulation for Texas Instruments AM64x and J784s4 platforms.<br=
>
&gt;<br>
&gt; Changes include:<br>
&gt; 1. Version bumps:<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; - openocd: 91bd431 -&gt; 66ea461<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; - jimtcl: fcbb449 -&gt; f160866<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; - libjaylink: 9aa7a59 -&gt; 0d23921<br>
&gt;<br>
&gt; 2. Platform support patches:<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; - Add SWD native configuration files for AM64x=
 and J784s4 boards<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; - Configure DMEM access parameters in ti_k3.cf=
g for direct memory operations<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; - Set up DAPBUS debugger and emulated AP descr=
iptions<br>
&gt;<br>
&gt; 3. Build configuration:<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; - Enable dmem adapter driver (--enable-dmem)<b=
r>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; - Enable internal jimtcl (--enable-internal-ji=
mtcl)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; - Add both features to default PACKAGECONFIG<b=
r>
&gt;<br>
&gt; This enables self-hosted debug configurations where OpenOCD runs on on=
e of<br>
&gt; the CPUs inside the SoC.<br>
&gt;<br>
&gt; Upstream-Status: Submitted<br>
&gt; - <a href=3D"http://openocd.zylin.com/#/c/9020/">https://eur01.safelin=
ks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fopenocd.zylin.com%2F%23%2Fc%2=
F9020%2F&amp;data=3D05%7C02%7Cjoao.lima%40hbkworld.com%7C0be1393f749b4b3a25=
4d08de0106cb07%7C6cce74a3397545e09893b072988b30b6%7C0%7C0%7C638949326829662=
188%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlA=
iOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C80000%7C%7C%7C&amp;sdata=3D=
mr0knEMNTixqKo20WB6sAP3w0Os3PC%2FHaEMGG%2F3SDjw%3D&amp;reserved=3D0</a><br>
&gt; - <a href=3D"http://openocd.zylin.com/#/c/9021/">https://eur01.safelin=
ks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fopenocd.zylin.com%2F%23%2Fc%2=
F9021%2F&amp;data=3D05%7C02%7Cjoao.lima%40hbkworld.com%7C0be1393f749b4b3a25=
4d08de0106cb07%7C6cce74a3397545e09893b072988b30b6%7C0%7C0%7C638949326829712=
748%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlA=
iOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C80000%7C%7C%7C&amp;sdata=3D=
%2F%2Fc%2BmSu3HrA%2F2IWn9jqFAo4x2bNR54ABpO0mSZEZ%2FCM%3D&amp;reserved=3D0</=
a><br>
&gt;<br>
&gt; Joao Lima (3):<br>
&gt;&nbsp;&nbsp;&nbsp; openocd: bump the openocd, jimtcl versions<br>
&gt;&nbsp;&nbsp;&nbsp; openocd: add dmem support to am64xx and j784s4 platf=
orms<br>
&gt;&nbsp;&nbsp;&nbsp; openocd: enable dmem and jimtcl<br>
&gt;<br>
&gt;&nbsp;&nbsp; ...wd_native.cfg-Add-support-for-direct.patch | 77 +++++++=
++++++++++++<br>
&gt;&nbsp;&nbsp; ....cfg-Add-support-for-direct-memory-a.patch | 65 +++++++=
+++++++++<br>
&gt;&nbsp;&nbsp; .../recipes-devtools/openocd/openocd_git.bb&nbsp;&nbsp; | =
13 +++-<br>
&gt;&nbsp;&nbsp; 3 files changed, 151 insertions(+), 4 deletions(-)<br>
&gt;&nbsp;&nbsp; create mode 100644 meta-oe/recipes-devtools/openocd/openoc=
d/0001-tcl-board-ti_-_swd_native.cfg-Add-support-for-direct.patch<br>
&gt;&nbsp;&nbsp; create mode 100644 meta-oe/recipes-devtools/openocd/openoc=
d/0002-tcl-target-ti_k3.cfg-Add-support-for-direct-memory-a.patch<br>
&gt;<br>
<br>
<br>
Thanks for the patchset, Please rebase it on latest master branch or<br>
master-next branch and resend. While resending send the whole series<br>
together with git send-email *.patch or something so tools like<br>
patchwork and lore can record this as a series.<br>
</div>
</span></font></div>
<br>
HBK FiberSensing S.A. NIF: 506807312 Registered office: Via Jos=E9 R=E9gio,=
 256, 4485-860, Vilar do Pinheiro, Portugal. Esta mensagem e eventuais anex=
os s=E3o confidenciais e destinados exclusivamente ao(s) destinat=E1rio(s) =
indicado(s). Se recebeu esta mensagem por
 engano, por favor notifique o remetente e elimine-a de imediato. =C9 proib=
ida a divulga=E7=E3o, c=F3pia ou utiliza=E7=E3o n=E3o autorizada do seu con=
te=FAdo. This message and any attachments are confidential and intended sol=
ely for the designated recipient(s). If you have
 received this message in error, please notify the sender and delete it imm=
ediately. Unauthorized disclosure, copying, or use of its contents is prohi=
bited.
</body>
</html>

--_000_DB3PR09MB6202132CD2CF6FEBFB54A99C9AE7ADB3PR09MB6202eurp_--

