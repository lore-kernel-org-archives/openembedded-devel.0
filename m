Return-Path: <alejandro.delcastillo@ni.com>
X-Greylist: delayed 12695 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 30 Jun 2016 23:37:15 UTC
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
	(mail-bl2nam02on0112.outbound.protection.outlook.com [104.47.38.112])
	by mail.openembedded.org (Postfix) with ESMTP id 49F33600B3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Jun 2016 23:37:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nio365.onmicrosoft.com; s=selector1-ni-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=RQqUFDtobUecJY74YL/rMs9AIYuuaR82yVQINUC4vw8=;
	b=jB7bC5rCwRSJ92Z2Ks2d2IxD8oWMrU9ndONVFtvlsvAnlg3dBeRi44APyLkCxvEMdlFW/e/5f/YGwbZ64m4Dkiu7hD12YjbI4iIQAFHaK7k40OvZvUVtja5YMba7XAVhI7ktDAqr0274YehYDlm1gNbVuLRFalmQ+rFc/bkRtZA=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=alejandro.delcastillo@ni.com; 
Received: from [10.2.33.36] (130.164.62.82) by
	BN1PR04MB844.namprd04.prod.outlook.com (10.255.204.147) with Microsoft
	SMTP Server (TLS) id 15.1.523.12; Thu, 30 Jun 2016 20:05:38 +0000
To: <openembedded-devel@lists.openembedded.org>, <jaap.dejong@nedap.com>,
	opkg-devel <opkg-devel@googlegroups.com>
References: <577525BE.6020602@nedap.com>
From: Alejandro del Castillo <alejandro.delcastillo@ni.com>
Message-ID: <57757B88.1010703@ni.com>
Date: Thu, 30 Jun 2016 15:05:28 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.8.0
MIME-Version: 1.0
In-Reply-To: <577525BE.6020602@nedap.com>
X-Originating-IP: [130.164.62.82]
X-ClientProxiedBy: CY1PR14CA0023.namprd14.prod.outlook.com (10.163.13.161) To
	BN1PR04MB844.namprd04.prod.outlook.com (10.255.204.147)
X-MS-Office365-Filtering-Correlation-Id: 85c55dbe-ab0a-4fe7-9eff-08d3a121e922
X-Microsoft-Exchange-Diagnostics: 1; BN1PR04MB844;
	2:rpI1FbrrzfsIPbDOxqNuXqnJ8QJN30wP4R89blC9/qnxdiZn8li8iRG3xl6/zT8bsAVggZvZQIShF+k8F/eTjJTqVz5JOteHGKjjsCSbdjOrvb1Mofgh4M3XvV2F8bu1jeh510JIYKbieumz/3kKj80a3984j/qTQypuXFg44QPs8ltiLONF6YWyeDC8ubbn;
	3:2m2TxkC9mji+8d0bx1Sbp/YmuZy7PH3UzURdpSL+YOIQZunz5FfNBBT7wysgahfSqffk+o1pGdZixjkVCLc/1t5g1pmiUaptiH/0s99hW8HMfVfDcTn1xB3O+7MmB0me
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:BN1PR04MB844;
X-Microsoft-Exchange-Diagnostics: 1; BN1PR04MB844;
	25:Kh/OPpzhMrG5Vj6DE4Rg7T5f0UiMVOWQeJ4DRriNjxPeWMWu+JlCdnXG4/JpJczInCii0XIHAZj/osrYE/1bYMmB7D7+2Jc7/wQgo+wj+Zdp8h5TMWdLffzxLCSKJJtUrNp1jPjeP39i/qyTw+KV2KmzIzYSYs2c77CnegjbQ+fx4rGYuOWmfYt2DsKGdOMXE/fiLydTJBbf+/jyoT2Y+cDN8MPJ0SnbkAtCcdBlR5gn4QUfj9yrp5EuIKxSSx5FXuBQ9rOkL512ZRrDxP910vkblpH8a43AD4+huhpOEV4z2sVN+PYwqRVuilDt1JO4fC1y7YKsG5hWNkeTkY9E0ZcL4l4L3klureWTLn8N1G+JM6kkPE/f1VLi9B8NLWokQStCsx3FD3u8+2cjf+5nTWNwLhSHdP4ZxFArhZftFYzgEV2XTImeO2PrYuqbgmCHsmSqhXMzRM4+ibNTI9BGxbJ7Jpd5456iTy+pi149D3JMGvO89ab7AXXs9RbwHJVhxYybaFcEt2YiGl3WuJtMi3FOoAnNoNqwEYHrNjhGUGanRxLWaPKWqDWBJYnynD1piK9OZoHvRB4VM062jd6/xXCtAm+GwzSqQ/Av1QSDLI1hlNDRK93BvSMm6nNOQ/oPfCTckitoupcDCUUhVmT/IjQyVTh/dN5605I/Ydnf1Hw+JfWTvhwo5AgfBVLvWlU5/tbQViHJGgK3fvbEJzH3xOui5+KKQVe822ob96O4lPeeUwPCm5ltMKDuCRvfQ+30t+42WjQp34i9jk1jRLO6U+HPNECvWWglSy2H/2iDND02es1Hb9PLo/B6WfY5m2j36cLoJZm/QnUZFkU3wKzliQ==
X-Microsoft-Exchange-Diagnostics: 1; BN1PR04MB844;
	20:Xo5WFj5zZh9JHNiM7ifz4ljZktfpI2Ho69rJydMhGpGEYqiDC0ICNDHKmRqdfhkZ0fTfap8ldEJtuPVETWLkav/1VBZJh7wYg2sRBB7GR+ehlhjVrJgwDujjwp5CToPbLkNVbwMg36ZxDy1EfOWU95v8vbcfiW2gTnERhhlMIHuL6J6kyI/xp8rs2Y3LbsGI52tBpbGij5EXCZvd2nAwthHwZMoa32MIqS8Z9LF848y0JmI15/MTJXeLyWQIOVM4PyS/wVjAOMZU9IaCteNjEv2XRtd4+1K+cdu25GoRqyMyiV03PTrCaTZQWZ5/DWQp0MWoLklJmuBGSCsLUL/mMV48n0YarhLGIzLL5TxlhlqvKBvN5k9xvqLJ+wkCNNCrenlj9vhrBoxFUI04fAYH3QD8GYkUTZfAerAr+gpkg/+nomrEtkt7Q9ZWPy2X9fHlU1k06jGRkCnToWARwq0ORbd41VAtjvFPjd2t117eZwhKsV363zntNrcs01+P3MtJ6tCzF8/69/8BxSGYSruGKInmKRI0/Ku1RD2OrwMoXmZOTOhk2A7gOEX8yqlK+qn6p06i7knIKnmFyiXus/YFX53YN6wjEiN8uuW+dukLY8U=
X-Microsoft-Antispam-PRVS: <BN1PR04MB844C8876D4CC4DDF3CAF01F86240@BN1PR04MB844.namprd04.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(228788266533470)(211936372134217)(211171220733660); 
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(5005006)(8121501046)(3002001)(10201501046);
	SRVR:BN1PR04MB844; BCL:0; PCL:0; RULEID:; SRVR:BN1PR04MB844; 
X-Microsoft-Exchange-Diagnostics: 1; BN1PR04MB844;
	4:X0iWI3I0k9gRLBDjt5Fr33s8Z6eoBy0mcfQmie7RigbYSCZe/TN7+gBTJYPL9hfo0no5vvKoasu59Gi/hcpcy6a/R8BuA5ruWWDHC18op4D9UBR46o7FR4hq3RWMhD45NcH4MrRjsRtSNP+zPAZRw4Gn/8AvgF4Y2ndFqYkga7B/91tpaPRXQpQaz9HgiMH9xmDy2cm4cFtZi1JxYumT799gGH32Fyz3eQgMsieOxs1DmYBxfIqTtHRcH9iHmETBjPgF/a+Xmh9+/MapmqILTjHGXOOFkZIw3YwE0s5qpWBYQuln2TNFjHCGTSvf1dIqulXlf8RZ9C8+NT5rx//v4/dz2HZdwefy0wM0AUN00YZYfB0ZujizOWfH3OlEK+OwmSaXZNp1zqkB8UVTxqX/XVF8FIrwt8R6tY94gfOCXxvfYuabSWvN1Z1kPGVuvC8APQeDOvp/jsQ5c6yJTYju7qBR/W+DlDUvOL1/7TaKN+s=
X-Forefront-PRVS: 0989A7979C
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(4630300001)(6009001)(6049001)(7916002)(199003)(53754006)(24454002)(189002)(377454003)(5001770100001)(97736004)(77096005)(15975445007)(4001350100001)(107886002)(83506001)(7846002)(87266999)(64126003)(33656002)(50986999)(305945005)(106356001)(105586002)(59896002)(54356999)(7736002)(68736007)(8676002)(76176999)(80316001)(19580405001)(19580395003)(2906002)(6116002)(3846002)(47776003)(36756003)(586003)(50466002)(23746002)(81166006)(81156014)(92566002)(66066001)(65806001)(189998001)(65816999)(86362001)(101416001)(42186005)(230700001)(2950100001)(65956001)(99136001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BN1PR04MB844; H:[10.2.33.36];
	FPR:; SPF:None; PTR:InfoNoRecords; A:1; MX:1; LANG:en; 
Received-SPF: None (protection.outlook.com: ni.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?Windows-1252?Q?1; BN1PR04MB844;
	23:zI3km5a8/B9dd5NRNAwFriMOY4ejpI1kddEoeW?=
	=?Windows-1252?Q?h+2bVqsKOu4WmeUlyb+6Q+AFL4HEUYjoc3J9eBGmMwOlHvnT8CCthv1Z?=
	=?Windows-1252?Q?+MqYlD1QPjk0cSlXbm5BdB4nBpmY3PK4CSIEqlo9GZomHAblQfjDOGxr?=
	=?Windows-1252?Q?wYdrMlA+eEEQi0qp3IXLfvl1SefBfDWdy/xz0ahDIfgMaKCRBBp4JV1E?=
	=?Windows-1252?Q?FSVskHgerGp1K2ITFwApoQ4p9DlN4Z9suPSSeZUg9R1P2NpFkuQUCn95?=
	=?Windows-1252?Q?38vtzWzporxlbRLXvlQQcfPVvm8x/f0wXmV5/Ud0HQkW+pC11z/asOvv?=
	=?Windows-1252?Q?+NRLSOfmROcSySc7d+bd8/x3rv4Pd0Ksak0nOClZt3NW3991DlJZGEsC?=
	=?Windows-1252?Q?hYN66Jt9la1Hz9uaPKHSyMScSTXgrjxp3KsgevNoECiIBo37Pj9OoM15?=
	=?Windows-1252?Q?EFaPJXkrDBB6onMT/rWFyj+gEZKj9/x35pnGpqAfvXwYbP2mHMlByXSg?=
	=?Windows-1252?Q?tfwNbCVRX+tAVZuI8k2h2XUQaVQIRJAQOddEBPGsFv+YhAdqhRuxJHIR?=
	=?Windows-1252?Q?xlPIZ1YJrf23/Zh8B7B67+e2M0cgcDn2WLva7QkFz7VbGj2LUnooJpg3?=
	=?Windows-1252?Q?MiW2221AjSpe2kM+Q5waafgkHgIVLCAye+EjnDRud38yuvNZzMfH5d+k?=
	=?Windows-1252?Q?VC7cuNjEKwtGrHsxLGt/P17nSpbNYyG5+Q3rEaLL0978Ivi/gbdrFEj/?=
	=?Windows-1252?Q?P5ljlowVzxbUCiLozqw+JZ2xaYrET+3LIJFnfK1ormNnxl5nlx+K7UYl?=
	=?Windows-1252?Q?oNcHhHW9BaE/Bj0gP9ufdBK6DvY63mZlnoAhmIQB/XcWLC9ML3egRmm2?=
	=?Windows-1252?Q?1RzHziHkfa3JxIgfy3wXOWcQ+ANiEnbF+6Qn7xLxWKh4gil0uwCTS/6D?=
	=?Windows-1252?Q?Pyhu2LicK+T1yYLjqWIsDrx+ylx0U9gmHpjX7IlZUIPYp1BvY86bU5VE?=
	=?Windows-1252?Q?NMSVEJI1yrDIWAnnuOLK7fGBRWL54Nhnq025uqkZEAiijwgjBghVVehS?=
	=?Windows-1252?Q?3u/+sc38xK1/XOG4/+IeMjPYA0CqisHMjHo4UTjFhfsKFxG+AakysU8b?=
	=?Windows-1252?Q?M+ZrU6hFHZMYPK3HoWvk6cNTQvs0Q9VNT2PRJALorSJlu80ILZe/m9qZ?=
	=?Windows-1252?Q?1lHiYiCC3EMqIfREvdjs4glmPwuEeWv+rTWraTndugeKIjhYmXQ6cTkv?=
	=?Windows-1252?Q?Z7NENHQpNQIqfBIyf89K3NEXgjV4U1s/K6jptKbSEFZRRDLhDgw8x+tW?=
	=?Windows-1252?Q?uKYclGbLYCLCpaPpevG2yiaNSzVQOm99fMsQ225eEF1zdTMtWK7QsAqJ?=
	=?Windows-1252?Q?GLheSjF0bL2suBg3ONqGliT3XGtE+MWHBEX+VaHLSDY5QCX9zNcQUAtj?=
	=?Windows-1252?Q?DaIdwkho2EwjQvPD9Q?=
X-Microsoft-Exchange-Diagnostics: 1; BN1PR04MB844;
	6:MHk2tmbXql0HKwCRqeSYeSr10J6Vptc1wixU32wkf5JX1D1689cyVjAxiahW/TLFxqJ5/9Oq31t7VMVy3ufiSApU4iUYqONQ4lwESwuoLad3ORQM0z08R0D52yXBEGdr/t0xSCp0jXz/VvPh+VD23Nd7eY7Xmy3rGh/Z7uOmSNWRpWFwciykE9D0b7+dYUpG0qxQjWaLs3QvEaCx5itbPwsYOI9PIyu8x5aDwd0XSPSa64d+tyEGvGaPT2jsj31hhs7CGR6tnNr/WsWKbey29/5adghMgLr3ZT+csCLEbpfSFG3zM3cD3bpKYexX/gev;
	5:Wa0Zfa55S9x5B/DYqb8VSmJ3AG1Br1uCffhLh9Xsln8AL6NDcqRiNZ2Ol8YpWzITPytfu/xayZbuyj82UGQXTiNb9z/8IHOjq8Fyr3ob8utbKgDdbSJiPsVaO2uDSl5gAAkT3f6yqDrq6vBo+YA6UA==;
	24:63hBC4xTv3GwQ/qWEG/70HGIi44gH1J52EAtML/IXzCvA7nCCrNPetsilKvn3vF1y3uScNwXzcpDdC09ye+VtO5RPbQrHXX79lcEkC5zurE=;
	7:1TdGRhEeij38Di3/6ah38mdDKj/WFkzBHWejFi+oLfjYZ+ETDN9BVe9fNTtdtmzo9fLsWhnKbq8yDRX1qcx7PAsL+6GXHvAjgKbSb5B21d6mG/5NX9lwXgXB8TNi2v+4mmV0kRG5mMkxlYTzEydCET7b5YbBixVy5fEJf+q3r3DEMZCVdy6NMSwvi6tycR950+NALgQ3nZ2zgPXcL72+PHiOLGQ60mta9Q92z0KzJo/LSjVGB7Jc3h6wkFLmzHd4jX4EFKffesfs/P5po6dBig==
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2016 20:05:38.3936 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN1PR04MB844
Subject: Re: opkg v0.3.2 bug
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 30 Jun 2016 23:37:16 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit



On 06/30/2016 08:59 AM, Jaap de Jong wrote:
> Hi All,
> 
> I've already put this in https://groups.google.com/forum/#!topic/opkg-devel but
> I really want to hear what your experiences are.

I am cc'ing opkg-devel@googlegroups.org

> I have this package A for which package B has a dependency?
> 
> I was using v0.2.3 before and 'opkg remove A' did not remove it.
> 
> With v0.3.2 the same errors:
> Removing package A from root...
> Collected errors:
>  * print_dependents_warning: Package A is depended upon by packages:
>  * print_dependents_warning:         B
>  * print_dependents_warning: These might cease to work if package A is removed.
>  * print_dependents_warning: Force removal of this package with --force-depends.
>  * print_dependents_warning: Force removal of this package and its dependents
>  * print_dependents_warning: with --force-removal-of-dependent-packages.
> 
> But package A is removed nevertheless....
> This sounds as a severe error!
> Or is it me doing something wrong??

This is a regression from 0.3.1, caused by the re-architecture that changed the
internal solver to have it solve first, install/upgrade/remove later (instead of
installing/removing/upgrading as it solved). As is common with these errors, the
fix is a one line change on opkg_solver_remove (*sigh*).

Can you please file a bug report on https://bugzilla.yoctoproject.org ?
I am thinking this is serious enough to warrant a bug fix release of opkg
(0.3.3), which I will post next week.

BTW, this is an internal solver only error, the libsolv backend works fine.

Thanks for reporting the regression

-- 
Cheers,

Alejandro

