Received: from NAM12-BN8-obe.outbound.protection.outlook.com (NAM12-BN8-obe.outbound.protection.outlook.com [40.107.237.80])
 by mx.groups.io with SMTP id smtpd.web11.8828.1619336891719705048
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 25 Apr 2021 00:48:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=kiGG1inx;
 spf=pass (domain: windriver.com, ip: 40.107.237.80, mailfrom: mingli.yu@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b86AOEqBuh2eiHuiNFbIpjo0ZuFb4/ChLfUCIdSD/cEQW4ylAIBwtELlHD7PlyseY/72zC+ovhn01gL6ecP5DCtBd0Y5upjYxVtN+lCdMZL2iwFRAzaK1kjbEydiL7thBcBVWVS27IBfaCXrbDIpJyv8LFc54QJrbXzMk//oc3ZpMXa/pvM6pHwtdmrRX3jhdNl48rVYcXKKHDNzivLRI4/ok9cATm/uWjf+05lPwWrGdMb5g1M7J+WlyVhICNAc9FJVm97g6tN9nl0kARJ5IQOz7//RX+zJFmhR8MFon2GZrPNe0N8G4SycGAf5qeQCRhxjiyh39qcQTT/apU1bsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f+xOAcRIrzNvT20AU65hu+UM9NJpXSrwwEdKzf6hlyY=;
 b=cfRwSxoqGHMwjztSCCjm/51AteWqUdt1brP6flReTXusY1TQELwCKzXaRPXpwksWeAf6ZeMmaHWoV+vOy8R5990qsYKWCzeBqgOCeYIj9HJfh567SXE4WAQ4xvtrACdX39ETUaLT5KUB36CqwIRLprPTzKteQ+5U06L6VH/Y9pugTjBtiEz5Tfw0MeKTqzpCkROWxksGnTuJUcdYVKcDnBkDvfCAkIT3k42GvPc69pXXb9cfZV9Ys4+z9Gw2WwIX1txzcPGUna0XxdvEC1NwMRP0NZp4RXQWoV3IHkqQDJ8N6wmUg/WiCc85AR5XDdZN3D/IuvB1kA6IkK4HLq/WoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f+xOAcRIrzNvT20AU65hu+UM9NJpXSrwwEdKzf6hlyY=;
 b=kiGG1inxkb63ysfS96jrEW2bXYogSPNAedJE3odLqFtXiVoRnv7Nbcj8qDlX59qsBEGs35U0d4/BH3iQZ6pOWI6dOsXrk0uolqY9osrJbqCrioIhYHOSBWvCjR8Rk0W0BOjnaI5B4OEKVLdkYM6I1rN/CRXIb+unNG0uOsSccos=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CO1PR11MB5009.namprd11.prod.outlook.com (2603:10b6:303:9e::11)
 by MWHPR11MB1949.namprd11.prod.outlook.com (2603:10b6:300:110::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.25; Sun, 25 Apr
 2021 07:48:09 +0000
Received: from CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::c129:2a53:5093:81e8]) by CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::c129:2a53:5093:81e8%3]) with mapi id 15.20.4065.025; Sun, 25 Apr 2021
 07:48:09 +0000
Subject: Re: [oe] [meta-python][hardknott][PATCH 2/2] python3-cryptography: Upgrade to 3.3.2
From: "Yu, Mingli" <mingli.yu@windriver.com>
To: openembedded-devel@lists.openembedded.org
References: <20210423054804.28633-1-mingli.yu@windriver.com>
 <1678669C91285DA3.14065@lists.openembedded.org>
Message-ID: <cba3e546-3938-721f-576b-6d0fc7d1f679@windriver.com>
Date: Sun, 25 Apr 2021 15:47:06 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <1678669C91285DA3.14065@lists.openembedded.org>
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK2PR04CA0054.apcprd04.prod.outlook.com
 (2603:1096:202:14::22) To CO1PR11MB5009.namprd11.prod.outlook.com
 (2603:10b6:303:9e::11)
Return-Path: mingli.yu@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.140] (60.247.85.82) by HK2PR04CA0054.apcprd04.prod.outlook.com (2603:1096:202:14::22) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.20 via Frontend Transport; Sun, 25 Apr 2021 07:48:08 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cea2dafa-465b-4e1f-041a-08d907be7863
X-MS-TrafficTypeDiagnostic: MWHPR11MB1949:
X-Microsoft-Antispam-PRVS: 
	<MWHPR11MB1949A993A1F6EC9A45E32BB4F1439@MWHPR11MB1949.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:826;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	4N37eI07toz09sn0OUd3OBSU/65jw9jvwGK7Kf9jI68FwA+PTB5b0uEOVjYaviconCtdzX9Eh4AMu9+n4nQWLeIZXGplh9jYadDPEYMKpWeL2MG4ZiO06HKGXvS3FNeByiM/SBcktFgFnghd8QHgzEGjghKdCbMecLzq5xQhNYC8abMkSK0m/eV0l0U4hZUu+S86pILCEZ5h7DvemsGnxttw+6iADPGYzO+Q+xTVmQTlx+4AmsteMHOlOdeFn4pBzIF3lp6L6ag5GsTdVIMFxZ3DmH230tyK5GiE80Np+LKWFqvfRyoen3aMpW254OFaivqUbu0i4w/NaJrZc7l9RNbe1YrR3raz646+a3WTA56w2U4hGzy2aLmnkZewRi5xq1fBfpWoOlpX/fK5TxnhAuhYvFaI4yL6yWFbUiZ7qDMwylUdiTrnFlPcp8m7rKP5ncdLQZeD9REjDElKiXSJ9yiNdcxI8PjjiaI+HAJ5qRlyxE1rgqUk6le/KEvWHlYRHCVPxCeJ+Hqww18ow6yjbp097EyWyeEGqr1+AitAgHW6EVsu7NOuXbgGq0JEY+olbjR9P7/aZ6Cp+VfuBk1pjuHTwMtFfJZ1rRIhgNXpfHdvjt+jmKKl2jo3ftUpPpHCzyphYFOocjULtsZG5fTUufurUWWzd9MNhFgc8Tg6uUcxB9Cqf7/hF5T0H3roizaG4EO5CeZwVTG+oeP//wF9h/2nRdUP+bDaYdL/RYLTZg9Fs44kllnbxFsJExPJgZMw13NmiFS0JZhHzdUpiUpq6Tl6UIUJjYqLeN6YGZN2qU5kZq6CnDmKF93sEhnJe72H
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5009.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(136003)(39830400003)(396003)(346002)(376002)(52116002)(8936002)(8676002)(36756003)(38100700002)(31686004)(2906002)(53546011)(6706004)(6916009)(38350700002)(26005)(31696002)(66476007)(478600001)(66556008)(966005)(186003)(16526019)(5660300002)(16576012)(6486002)(316002)(66946007)(86362001)(956004)(2616005)(83380400001)(78286007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?dUpJKzV3Zi8rNFB4QlUrRi9YUnhnL2tlVE5jWTAyUTZpbGtDNi8rbTAvc3N1?=
 =?utf-8?B?a0dJNk9CNWNqOWlWUFB5RGZzTFpuK1ZKeWV1d1RhK0l2RUVZRllvd2xPMGFC?=
 =?utf-8?B?MHNON1h1NFFGcFNzVFF6QmEyeURFTkZEYm5aVitKdHVKcVMxSUxKMFljTjRL?=
 =?utf-8?B?NUFGVitvSk1BclJHeVIzYWU0SUlFQVVDamhVTldIaWsxcGdDSkxMa3k0RnYv?=
 =?utf-8?B?SDhwakNsOEVML2NaRWxMWThUSVZtek0ydkxzeC9lVnZTSkxMZnl0VTZHa01y?=
 =?utf-8?B?cXdoNCtKU3diYkNWQjFFOUtuY2FzTFpzU1NxNklxMUVrcUxPd0pUMUpPSlhk?=
 =?utf-8?B?anRQSC9HWTljQnBrLzNzSUFvSjdOdHR3MXREcDRLaktlWTV4WmJZdFE1UU9S?=
 =?utf-8?B?NVAzVU80VkNPSmdSRThYd25IOEx2RnRaaFBYK3A2V2V1Q2hUbGxiYnpZYzlq?=
 =?utf-8?B?Wi9YeWNvWE5jd01HVlBDWThRSGVsbUR0cUN5RG5sbjNNZXMyaG9GUmN2OGYx?=
 =?utf-8?B?TUhqb1NOM0pjWUZzZWMwTmppU1BvcmFwMW9OVVBFYUJjSkZ3SHJVSWUzeUVX?=
 =?utf-8?B?TWxKSjBmaUVzVnJFeDFDN3AwR2VIRVk2aUZrWWoyejZaRGJzMkwwaG0zRk9Z?=
 =?utf-8?B?V0dNZkFUYmFtMkZoUUFTbU8wTm02YW1VazRSdnVoM2xmeVJ4eFo3ekRzbzQw?=
 =?utf-8?B?a05UQ3UrTC93a3VtUEJoeHg1bys0eVBzT1VOZWZBV0JNRk5NQk5pRWpuS2JC?=
 =?utf-8?B?T0RIZGZORFJ1anZZS084WitmS0orRU9kVHdBUjd4TGJ4V1ppZWt6T0pjaW13?=
 =?utf-8?B?SnRLV2c0ckMvdjBxdGRBbzJhUWNVQlFhdnQyUmFpb0VXSHEyS0E3azJWZ2tn?=
 =?utf-8?B?Y3k4Qkd2QVhqTXRDbVZmQ0xHQWd1WlVrNUhYMVZJMWFlQ2JLMDZRU2ZFeTFU?=
 =?utf-8?B?OXBvRFZ4MVRKUk5hcG55UXE0ZE5GelAwYWsyWEI2YWRnNGlHMkVvWlkxZW4y?=
 =?utf-8?B?Yzh3V1Q3U0xHZkhENUljVzRZeUNUQlN6RjJYMTJTSnBuRS90YlRJc3RLbjU5?=
 =?utf-8?B?UTVwRkxOdjdYZE5XZ092Qm4rc1M0TjhSQnlQZ1A0QmdMc281ZTM2VG9ZZmNl?=
 =?utf-8?B?RWhsRFI5SXpQYlh1QmpreThtZGFxUE1HUUVnSW5iOHpXVGF2bDdnU1htcEFD?=
 =?utf-8?B?VnBaVHhSam1wS2gwc0pYSDRnczR3MzVmZ0ZHYW9JN1JNeE13ZU1LYWxRamo2?=
 =?utf-8?B?QW5hUm5td0ZmTmliUWd2c1djbzBwenlka3BIMFhBcmdKZHBDL0MyRHJXOUIy?=
 =?utf-8?B?TVBnUDViVGNadnFjUXY0ZnlhczF4bGRBOTVrMU04MEJ2UXFWbkl6clJld2xs?=
 =?utf-8?B?NWZ2S3JuY3FiOENrR1ZoVGMvQmhxeHpzcHcySndJd3dWZGlHbjdoM1VtUTlQ?=
 =?utf-8?B?RERxKzFZNHZGZ1BxL2pBWm04OEZQejEzVHBtazlpSkl5blkxcld5dHIvbW5t?=
 =?utf-8?B?QXZIdTZlQXZiNFViaVVVQVoreGxrYWFIK0M1Rno2VHF4NDIwL0dtdlR5dXd0?=
 =?utf-8?B?bkVRUnRUa1BPejdKWlorSlJhdEJQM0lnQXJhcld1MDBLKzA4S0UxbEVvVE96?=
 =?utf-8?B?eWtyZzE2SnpBeWRPL3RHdUZLZVRKcTNQUmNscEQ2Zm5PN0l4Z0liaUVOSTB6?=
 =?utf-8?B?T21yeGxhbkdTUWYrSmtCTmpabnBCckxOZndZYTNrTDdMK0locTVFeFhVZkN1?=
 =?utf-8?Q?d4c3Lizv717Px7z98agnLkdQyEhyEMj8edjTdcB?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cea2dafa-465b-4e1f-041a-08d907be7863
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5009.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2021 07:48:09.5308
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GuGaWV2kih8hRdfyvA8CXlfpvQNmtGC8iU/qCSMNoSj+LMZ8TduD5+Pb42D9MNukmmgR5SCM+ELxhP0+wZhPzQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1949
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Ping.

Thanks,

On 4/23/21 1:48 PM, Yu, Mingli wrote:
> From: Mingli Yu <mingli.yu@windriver.com>
> 
> Fix a security issue CVE-2020-36242 where certain sequences of
> ``update()`` calls when symmetrically encrypting very large
> payloads (>2GB) could result in an integer overflow, leading to
> buffer overflows.
> 
> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...hon3-cryptography_3.3.1.bb => python3-cryptography_3.3.2.bb} | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>   rename meta-python/recipes-devtools/python/{python3-cryptography_3.3.1.bb => python3-cryptography_3.3.2.bb} (94%)
> 
> diff --git a/meta-python/recipes-devtools/python/python3-cryptography_3.3.1.bb b/meta-python/recipes-devtools/python/python3-cryptography_3.3.2.bb
> similarity index 94%
> rename from meta-python/recipes-devtools/python/python3-cryptography_3.3.1.bb
> rename to meta-python/recipes-devtools/python/python3-cryptography_3.3.2.bb
> index 79a7ac1bf..0a36ffe1b 100644
> --- a/meta-python/recipes-devtools/python/python3-cryptography_3.3.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-cryptography_3.3.2.bb
> @@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=bf405a8056a6647e7d077b0e7bc36aba"
>   
>   LDSHARED += "-pthread"
>   
> -SRC_URI[sha256sum] = "7e177e4bea2de937a584b13645cab32f25e3d96fc0bc4a4cf99c27dc77682be6"
> +SRC_URI[sha256sum] = "5a60d3780149e13b7a6ff7ad6526b38846354d11a15e21068e57073e29e19bed"
>   
>   SRC_URI += " \
>       file://run-ptest \
> 
> 
> 
> 
> 
