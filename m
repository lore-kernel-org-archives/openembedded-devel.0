Received: from NAM04-DM6-obe.outbound.protection.outlook.com (NAM04-DM6-obe.outbound.protection.outlook.com [40.107.102.86])
 by mx.groups.io with SMTP id smtpd.web11.33843.1612185822168542112
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Feb 2021 05:23:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=PIdAPh5g;
 spf=pass (domain: windriver.com, ip: 40.107.102.86, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JN5F49BpXWG8zn0Z4tig2adGyQMCcRtHe2+btLL8bHowFxsJiC3GIhZkZKks1eGu5M6ZjOpq8+aniWBdwGnKwd6mj5V3aStC22WSa3jGy6C576OxH0kyu7knDsN8mHvlsALrx3j0bEACeJH/qle0odNv+GVwlnCok60yDT30x7MILbc8dugcS5/sIkH+ZrF42uJoiRel7h3m9+mLAmptGMjDNO/uUM+b+2bK4s14PAq/pCQoqrAfQz7IroPeDB3F6HB/vM1R91eLhGXRawrf6ap5Y9I2wit/FHqZ2agWTU0ePO6kcg0jXS9sfkVuHSZ0blzPt+r/YThLAXPFv3akzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3YaACFs6tY2TrLW8uX415IbGLa2Wa+CWYW03k9Gt8TE=;
 b=XiWgyadr/w1MnGMW1mtGE9588X6Ybaoytvd2DbCAyzVsjox06DDxqij0sbz5AshLXi6vJHT6My/0Q9Os2LsuaYcmite3DTiaUmI3TfdU3IKKx1ImW2BgnC0XGC7D34fKm7/T9UaJbtDmtf533IY7wqGh4Btk1Xv/fUdrdDXe5ytenpEUPombMQPynTgxCTfan+PjBSHG1vVN2FHUvRNMwhGZRjRzMZZKlo7pCqI+AHJkwibeitB7nZKblFJ2uzaqPdcJlfV/1oVpOGRrtWzZaT7/Ag1Ch39YwcPQNcb3UqhAR46hU7HYnqD0TUx2eTDh7rCKs3W277L8BfpE/nkwFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3YaACFs6tY2TrLW8uX415IbGLa2Wa+CWYW03k9Gt8TE=;
 b=PIdAPh5g7MSRtx1JdeWGOBWZF1VlT2Uwh51VSYyqXHB36XOqfHehfn4k6Gd5pL8YWyh2wpxKyhSBT2COW7aooM4p7ZiceC04S3fkvlGYpVXmnuUWbLKWN3ERr99FoULsNfPfjl4B7hlMgxptPAhJgbFLlCrsvQrnuP1W3afrdtE=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by SJ0PR11MB5165.namprd11.prod.outlook.com (2603:10b6:a03:2ad::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.19; Mon, 1 Feb
 2021 13:23:41 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447%7]) with mapi id 15.20.3805.024; Mon, 1 Feb 2021
 13:23:41 +0000
Subject: Re: [oe] [meta-python][PATCH 2/5] python3-prompt-toolkit: Upgrade 3.0.11 -> 3.0.14
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20210128102903.11760-1-leon.anavi@konsulko.com>
 <20210128102903.11760-2-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <1d636635-ad13-b783-b753-cc298a2a7d67@windriver.com>
Date: Mon, 1 Feb 2021 08:23:38 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
In-Reply-To: <20210128102903.11760-2-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: BN0PR04CA0010.namprd04.prod.outlook.com
 (2603:10b6:408:ee::15) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by BN0PR04CA0010.namprd04.prod.outlook.com (2603:10b6:408:ee::15) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.17 via Frontend Transport; Mon, 1 Feb 2021 13:23:40 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2d760fc8-cc93-47a7-5eba-08d8c6b49748
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5165:
X-Microsoft-Antispam-PRVS: 
	<SJ0PR11MB5165E09673698439EF31747D9FB69@SJ0PR11MB5165.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:400;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	YIevd7kgby7SmQ050jWMsPoeN1zM49nkEsztlff47SyLFLaHOVKSvWRQ/cjCpFIRaIqKWdBOfqyEy4y34J+CwNygP059jdAUqFi8I9WjAB6vExn2vFTW3gCB5HuEaLs0niIvPYDI4DlkDJbLdnqPo6ldomZIiyXqkuJNcJlI8PFrZ2w+3s/HsqKPWviX7yTt9AGfGRj8oem5obOaF11+EsbcACaBYIyJeJlMtda7VsPoARqcfRqejjXuhYZ/oRqQ7s2X23qdGTnf7o/v9baAf9KYmssNblfSyRWZW08u2LSNqZdsiFoqzrWFysVluEjXmWdRiTU3ISEzf1qjuus5tJ34tO5uVmZDPFc5N3tSsVmzd8cSE6qWDt4igQrTjrxgm9CNf/tX/PbpfbYBEi9FaPcMm9OYrybxrWc0Bb54SSZ6fUBU8SMUlbrXeMyN/fuyP7l8ABNAj5xUcd77S1W4+Pctv/cGAIiHErrBPhVuc8p3JNmu3CGE3NKkFVvw3DnLPxMztUgOjeOL4tWPdK17ZyMsSoMFCqkEXOn+jIpysRKDGV+t1Muzdk0FPK9uSC15FOvyXHgVqZDAk62N4VsXex+GJ52OJGwFGGS95nkDM3psD1WNm7DfUF9tcZ30vMG2Wzb9hepYk+srKfqRc3p9fbm/41JZ7FHZAhPREnGxp9slJ8QO2d/C9rXYbMvAXVg9
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(346002)(396003)(136003)(39850400004)(376002)(5660300002)(66476007)(33964004)(66946007)(16526019)(2616005)(2906002)(36756003)(186003)(66556008)(86362001)(52116002)(31686004)(6486002)(8676002)(966005)(956004)(53546011)(44832011)(83380400001)(26005)(478600001)(316002)(16576012)(8936002)(31696002)(166002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?UnBDN3g4ZkNpbkdLcnl1dC9HaER5a3dZQTR1SEh2c3NvTGs5UW04WGhtYVNK?=
 =?utf-8?B?SWVNcVF4eUxuS0h0RXJCQk5qSndnQWJvc2FYTFJyTFhnTjhGTXhLbVQ5VmJZ?=
 =?utf-8?B?eldpeDNBb2lCanh0VU5wTTgrcnRyVkU2QkZWcm40WmhtU0kxZlJPVC9oN21j?=
 =?utf-8?B?Q1BaTGs4RzNFMUJiMm9YaGdNNFZVSWVxamp3eFNESEtTcHVhd2t1UytRSUly?=
 =?utf-8?B?bGVTUGxpWk1NSjRNSHp0cDVvbXdwNUl6c3RmbEdFcE5RMHNWSENhVGEzdFVK?=
 =?utf-8?B?RE5oVXpNSzNhTWlMSHJaMjNoWFJ0eTJ6N0Zjc0lGbGR6L1pHWXdVQTkyL3VZ?=
 =?utf-8?B?aFk5VDlLYnVmUS84TW1kNzN3cTVaTFlZVW82YXpTRk5WSUJFYnpOTUlPQnNr?=
 =?utf-8?B?WU8vN2FML2tERHF1SzdKcnRCT3dNNFExMHZjeXJPOWg2NGYreWVhOTJ4UFlk?=
 =?utf-8?B?SFJwb2xONUVqbm9DY1pNZGN6SVdIT21vTG5DVGhtZmNCTEllY0REek9SMm9n?=
 =?utf-8?B?Vm9uWkZJSldBQzZtVzNmUjBKUWpIeGZSVlJ2Vnh3UHNFVEx1ZHJyREo0Qkpr?=
 =?utf-8?B?L0o4cWI2bEdWOWQzeUpHWWkzQytDRjN0OVIxalhjQzVHTmdiZEFkT3hBcVcr?=
 =?utf-8?B?T042bU85U3JZcE8wVGI1MlRZb0xIVEx4MU9uUnE0Y2Y1YTNxaFA2aS9rLzE1?=
 =?utf-8?B?YzJJb25NOGw5MThLQStOVjFVeXdZenBBbllHV1NrRHNIQlJ6c3ovZTZuSjBx?=
 =?utf-8?B?RmNMN3NqZllrUkpkZTNnK29vVTVIcmFRbUNSaUpnd0VRRk1rOCtZRnliaFRE?=
 =?utf-8?B?OTBBTnp6RGlKbEhYZ04razM4T1lpbDhVR2pLcGVqM0UwWUsyTmtYMTg1NGo1?=
 =?utf-8?B?cm1tWVA4RDJSbmhha1U4Ylg4ZDNFcUEwRDNRZDVsNzZIUC9wT2hDTmFwVUVK?=
 =?utf-8?B?eVc0dVpBUDhKQnJuRThyS2dqbzd1SkpvV1I0akF4KzF0RHgyV0pHS0pmVkg3?=
 =?utf-8?B?d0diZDVBMGxmOTVrcVIzS1NQQ2JLUHhrU0k5WkNsdzFpMjY4Yks4NFN0YVFp?=
 =?utf-8?B?dFpkWGdUY1MxYnRHdWcxQ1Vja1Z2eGwrZmhMRy8yM3VMY2lxV1hJZnRwS3E3?=
 =?utf-8?B?bVJLRFVha0c2Q3dGK0dVQVdsZU1oOE9YOVdmVkhtdUlxVHJJWld0L051bTU2?=
 =?utf-8?B?UHI3RWxkWng0bCt1VXQwM3ZzbGdBQk9vRHRMUkJwcGZvR3hyelJCdGFvZW5N?=
 =?utf-8?B?cE8ydDB3NmJhUm1CRzlOaTVPRENwblVnUnpKYlNwMW1ydVcrcUE2TU9PTnVN?=
 =?utf-8?B?WFM1bEZlOEtDY2h2dUQwVDNYNllmV2FpZmU0djcvcnRvZlpZYlQwZ1RhZ241?=
 =?utf-8?B?SE15NS9zRDZtM0ZFcHh3cHZmYStVZlExWVNqNE9MTEVRVHRCZk0zcGZKSVpt?=
 =?utf-8?Q?8Tvh+6EQ?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d760fc8-cc93-47a7-5eba-08d8c6b49748
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2021 13:23:40.9309
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v7+SF1Li9uXYOUN/zu3gDUf24LFQ/8HdoXpxwsOmDliNF4NG+ttt6HFZM1k48DoEPNldiaQ7Xlt9I6iUKe5n4U3751iEUO/tY8wUjpiAlec=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5165
Content-Type: multipart/alternative;
 boundary="------------8135574C6D78432646416C88"
Content-Language: en-US

--------------8135574C6D78432646416C88
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-01-28 5:29 a.m., Leon Anavi wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
> Upgrade to release 3.0.14:
>
> - Disable bell when `PROMPT_TOOLKIT_BELL=false` environment
>    variable has been set.
> - Improve cancellation of history loading.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...rompt-toolkit_3.0.11.bb => python3-prompt-toolkit_3.0.14.bb} | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>   rename meta-python/recipes-devtools/python/{python3-prompt-toolkit_3.0.11.bb => python3-prompt-toolkit_3.0.14.bb} (86%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.11.bb b/meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.14.bb
> similarity index 86%
> rename from meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.11.bb
> rename to meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.14.bb
> index 0b832c064..e5ad069d3 100644
> --- a/meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.11.bb
> +++ b/meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.14.bb
> @@ -3,7 +3,7 @@ HOMEPAGE = "https://python-prompt-toolkit.readthedocs.io/"
>   LICENSE = "BSD-3-Clause"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=b2cde7da89f0c1f3e49bf968d00d554f"
>
> -SRC_URI[sha256sum] = "dc83e6368b0edd9ceabe17a055f2e22f6ed95b9aa39dbd59d0b4f3585bdfe9ed"
> +SRC_URI[sha256sum] = "7e966747c18ececaec785699626b771c1ba8344c8d31759a1915d6b12fad6525"
>
>   inherit pypi setuptools3
>
> --
> 2.17.1
>
>
> 
>

--------------8135574C6D78432646416C88
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-01-28 5:29 a.m., Leon Anavi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210128102903.11760-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">[Please note: This e-mail is from an EXTERNAL e-mail address]

Upgrade to release 3.0.14:

- Disable bell when `PROMPT_TOOLKIT_BELL=false` environment
  variable has been set.
- Improve cancellation of history loading.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20210128102903.11760-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...rompt-toolkit_3.0.11.bb =&gt; python3-prompt-toolkit_3.0.14.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-prompt-toolkit_3.0.11.bb =&gt; python3-prompt-toolkit_3.0.14.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.11.bb b/meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.14.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.11.bb
rename to meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.14.bb
index 0b832c064..e5ad069d3 100644
--- a/meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.11.bb
+++ b/meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.14.bb
@@ -3,7 +3,7 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://python-prompt-toolkit.readthedocs.io/">&quot;https://python-prompt-toolkit.readthedocs.io/&quot;</a>
 LICENSE = &quot;BSD-3-Clause&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=b2cde7da89f0c1f3e49bf968d00d554f">&quot;file://LICENSE;md5=b2cde7da89f0c1f3e49bf968d00d554f&quot;</a>

-SRC_URI[sha256sum] = &quot;dc83e6368b0edd9ceabe17a055f2e22f6ed95b9aa39dbd59d0b4f3585bdfe9ed&quot;
+SRC_URI[sha256sum] = &quot;7e966747c18ececaec785699626b771c1ba8344c8d31759a1915d6b12fad6525&quot;

 inherit pypi setuptools3

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

--------------8135574C6D78432646416C88--
