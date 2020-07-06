Received: from NAM11-BN8-obe.outbound.protection.outlook.com (NAM11-BN8-obe.outbound.protection.outlook.com [40.107.236.77])
 by mx.groups.io with SMTP id smtpd.web12.1645.1594061278040762494
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Jul 2020 11:47:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=GL0iq9VH;
 spf=pass (domain: windriver.com, ip: 40.107.236.77, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nmbFqHgUqZkaLrnjh7qiIA+TG6TH+gXAIavkJ1H0L5jn7NUTK46UmAs+HUQty1NhD1qfr23XXafVprRg0oyBgOuKX/5rn7D1oQz9iAxPVR5rEm84fOF4/jD3mG7OlK86E7R8gsnBqkpXtI7JnN9vzsICWhSAm9gRA2CChpz9cgaHmDWGphuPQdIr1PmOonwNC6N6xpFBV6J97BWKR+GVaLHxs3kkoDLB9G897FJbaQO7PmKobU0M4LQn4Dw+iEUuUAn1LVC98Ny4Sa1loEzWqzhCGpUFWOOxn3nNZw0K1/UNLCHuwOebLgI6EKBinag+aVqfz1larVDjLGUK/43VpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6I6ostjFgmNJ/uYcbK+asK/HDOVfr83pAFt75VAYYtc=;
 b=Agcd2K8zdOMk9TbTYRvBYB6joQ/VbK4srbowzPPICM+AQeQgbBD+ZCB99QX0jKcNGAw3YIWlQ/QKfa/LyMVsOpFHcXALLYebjfh3PSFi6IDru6/jepx5eUDIEmSMGh4QNpqmseamSLrJsoLCScw+37jff01kfFlIiNzbmucedLsJnrRxNltrCqHbUhWBZ141KT/iPQYRckDjdE8RWl691E+vF+3MmX1QG024BLLs3KtOwV/x8Hr9Zy/Mlx+aOrbtV0A/L5vDyLxKbVGVMBSJrRX3OsZkpKxW+azxsmZzzARzo9H5bff+rbBfsGjQ3BRkP0Ix8PyX4FJmBONAVwIQFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6I6ostjFgmNJ/uYcbK+asK/HDOVfr83pAFt75VAYYtc=;
 b=GL0iq9VHn8a+4rtxLJRFuzswcnei0DL1BhNBg9QtU8tjSwcJ05tm/C1t+kdNbTUwcR2R3gdeRVGiN53fTOG9C5Ntt/CqZDKJ/ArLjwaRTpMDx5/TdTJIEZuakLe8ri7UXnnBDbK6/5a2phEVfHO8ubueFhHtRUl9sHan2JzpSH0=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from DM5PR11MB0011.namprd11.prod.outlook.com (2603:10b6:4:6b::29) by
 DM5PR11MB1340.namprd11.prod.outlook.com (2603:10b6:3:15::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3153.20; Mon, 6 Jul 2020 18:47:56 +0000
Received: from DM5PR11MB0011.namprd11.prod.outlook.com
 ([fe80::c970:4bd8:f35c:d6d2]) by DM5PR11MB0011.namprd11.prod.outlook.com
 ([fe80::c970:4bd8:f35c:d6d2%5]) with mapi id 15.20.3153.029; Mon, 6 Jul 2020
 18:47:56 +0000
Subject: Re: [oe] [meta-python][PATCH] python3-requests-toolbelt: Remove py3-mock from rdeps
To: Tim Orling <ticotimo@gmail.com>, Sakib Sajal <sakib.sajal@windriver.com>
Cc: Khem Raj <raj.khem@gmail.com>, openembedded-devel@lists.openembedded.org
References: <20200706145109.600956-1-raj.khem@gmail.com>
 <CANx9H-DHHuFfeM0ab3txSrvgjEHiRLC7Rq4KeRp-BgriAxyGzw@mail.gmail.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <412cff58-b4a4-d726-b4d3-bc96321f4b75@windriver.com>
Date: Mon, 6 Jul 2020 14:47:54 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <CANx9H-DHHuFfeM0ab3txSrvgjEHiRLC7Rq4KeRp-BgriAxyGzw@mail.gmail.com>
X-ClientProxiedBy: YT1PR01CA0109.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2c::18) To DM5PR11MB0011.namprd11.prod.outlook.com
 (2603:10b6:4:6b::29)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.30] (174.115.236.231) by YT1PR01CA0109.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2c::18) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.20 via Frontend Transport; Mon, 6 Jul 2020 18:47:55 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2da77134-9832-4fe1-67d4-08d821dd189a
X-MS-TrafficTypeDiagnostic: DM5PR11MB1340:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<DM5PR11MB13403451868FE35BCF0EA9C99F690@DM5PR11MB1340.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2733;
X-Forefront-PRVS: 04569283F9
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	8+bLBk141yPcSGhQadxoN5e+j5hiCnpNKgYzqhIBscR2IpxV3st+GH2AECA9IxuSY1x/yzDL+I9z+oMh/KfKGZrseSXHnygjXsBhEHFlQtabHR3XNK6DEV4nhpBDHszzhnQ+pRn5PKjZ0psDuzFVshJ689gHD76Hv8is4oY+sF5H8BOKseTlPAfqM9rf/KRH9Us9fUrVaQz9yGv5/dl3zNCMBlK1o58pgsFTciV/iXaKjJRgzmS5fLuN5xU5XriqwAP8Nnxo/OB3DfLnKGHLJai9GqwFEmlxPv8fubhhbkFePtTPq+uWdzEf1m6L1roz7v2+jIxcVf12cHPns4P+ga3uj89NbTXgHay5PMtVLzMLQZ0PeYdJw/n4L/vwr14YxmGKiSbKFc5y+wI9yFoC/G/y04+aIx+W9ku8/ak4pavi0NIGl0uruUaweCnRL20D
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR11MB0011.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(376002)(136003)(346002)(39850400004)(366004)(396003)(5660300002)(6486002)(31696002)(31686004)(86362001)(52116002)(26005)(110136005)(36756003)(186003)(16576012)(16526019)(33964004)(53546011)(8676002)(316002)(2906002)(66946007)(6636002)(966005)(8936002)(44832011)(4326008)(2616005)(66556008)(83380400001)(166002)(478600001)(66476007)(956004)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	VLfgPXHIBP5MFGlotkA7TslUIjnau5PHOO5XcUHTp65areHihXWFK+/Ze1r32qiTfCEYXbrSCDJxOOmd6Nos7RIubg1/W5UTFtM7oTW4ZeVnv87R3ls9SInRs4ZMChVVJ0SevIDNoaLnqLKSFubePMSVql3I91qsk3LxbpQJtqYgEgrJzGzsTaq//tenrgjtAaYPaJyP8um3QRm9v3broYSVwV3Ntl5DtMGV+AvP+sV37uzA//kvHUbjsi5+ErauNIwBiCO62FK4G0CbKkPJI+h97RMG8FkY0aU4v/Z1cbiXARTHYQugXCW0vBC37SeFSQnLQ2s0jYogqaife6+GNfLbdQ/KfEqIEKSDRx5VGAAnnMyT/IEVjNnf9X6cZP591058i/P8FdWyK5wnIh/jDukYWzpmJC7JkGwcbujSY3IdoEE0YNhI/KMlE5TsPnPyuB4nq+BngbdYXuceb9AJ4f5IT2vB84EiNmNnQL3/qoVrNz7DnLtCJZt4SjZbRyvx
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2da77134-9832-4fe1-67d4-08d821dd189a
X-MS-Exchange-CrossTenant-AuthSource: DM5PR11MB0011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2020 18:47:55.9045
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EnFbKMTSS4Mf4k+9zDAnRXyhrPNJ9QYwz4JqzjoRjzdqD6xKpQhFBE57O2xTVgjx7Twd6vmTcyvYtRkHAGuyr/Sbd86/mUM/1w+G8Oim+DQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1340
Content-Type: multipart/alternative;
 boundary="------------92A97436FCD4EB0A3E19439F"
Content-Language: en-US

--------------92A97436FCD4EB0A3E19439F
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


On 7/6/20 11:01 AM, Tim Orling wrote:
>
>
> On Mon, Jul 6, 2020 at 7:51 AM Khem Raj <raj.khem@gmail.com 
> <mailto:raj.khem@gmail.com>> wrote:
>
>     python3-mock does not exist as independent package
>
>
> Sakib,
> Perhaps you were bringing it in from meta-cloud-services?
> http://layers.openembedded.org/layerindex/recipe/120255/
Yeah, he's been adding things to support python3-requests-toolbelt (with 
my help), but we missed that dependency. I think requests-toolbelt is 
minor enough (while being a useful addition) that it should be in 
meta-python alongside python3-requests, so for completeness' sake we 
should move python3-mock in as well.
>
>
>     Signed-off-by: Khem Raj <raj.khem@gmail.com
>     <mailto:raj.khem@gmail.com>>
>     Cc: Sakib Sajal <sakib.sajal@windriver.com
>     <mailto:sakib.sajal@windriver.com>>
>     ---
>      .../recipes-devtools/python/python3-requests-toolbelt_0.9.1.bb
>     <http://python3-requests-toolbelt_0.9.1.bb>  | 1 -
>      1 file changed, 1 deletion(-)
>
>     diff --git
>     a/meta-python/recipes-devtools/python/python3-requests-toolbelt_0.9.1.bb
>     <http://python3-requests-toolbelt_0.9.1.bb>
>     b/meta-python/recipes-devtools/python/python3-requests-toolbelt_0.9.1.bb
>     <http://python3-requests-toolbelt_0.9.1.bb>
>     index e075c019d0..27d122cd52 100644
>     ---
>     a/meta-python/recipes-devtools/python/python3-requests-toolbelt_0.9.1.bb
>     <http://python3-requests-toolbelt_0.9.1.bb>
>     +++
>     b/meta-python/recipes-devtools/python/python3-requests-toolbelt_0.9.1.bb
>     <http://python3-requests-toolbelt_0.9.1.bb>
>     @@ -20,7 +20,6 @@ RDEPENDS_${PN} += " \
>      RDEPENDS_${PN}-ptest += " \
>             ${PYTHON_PN}-pytest \
>             ${PYTHON_PN}-betamax \
>     -       ${PYTHON_PN}-mock \
>      "
>
>      do_install_ptest() {
>     -- 
>     2.27.0
>
>
>
> 

--------------92A97436FCD4EB0A3E19439F
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 7/6/20 11:01 AM, Tim Orling wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:CANx9H-DHHuFfeM0ab3txSrvgjEHiRLC7Rq4KeRp-BgriAxyGzw@mail.gmail.com">
      
      <div><br>
      </div>
      <div><br>
        <div class="gmail_quote">
          <div dir="ltr" class="gmail_attr">On Mon, Jul 6, 2020 at 7:51
            AM Khem Raj &lt;<a href="mailto:raj.khem@gmail.com" moz-do-not-send="true">raj.khem@gmail.com</a>&gt; wrote:<br>
          </div>
          <blockquote class="gmail_quote" style="margin:0 0 0
            .8ex;border-left:1px #ccc solid;padding-left:1ex">python3-mock
            does not exist as independent package<br>
          </blockquote>
          <div dir="auto"><br>
          </div>
          <div dir="auto">Sakib,</div>
          <div dir="auto">Perhaps you were bringing it in from
            meta-cloud-services?</div>
          <div dir="auto">
            <div><a href="http://layers.openembedded.org/layerindex/recipe/120255/" moz-do-not-send="true">http://layers.openembedded.org/layerindex/recipe/120255/</a></div>
          </div>
        </div>
      </div>
    </blockquote>
    Yeah, he's been adding things to support python3-requests-toolbelt
    (with my help), but we missed that dependency. I think
    requests-toolbelt is minor enough (while being a useful addition)
    that it should be in meta-python alongside python3-requests, so for
    completeness' sake we should move python3-mock in as well.<br>
    <blockquote type="cite" cite="mid:CANx9H-DHHuFfeM0ab3txSrvgjEHiRLC7Rq4KeRp-BgriAxyGzw@mail.gmail.com">
      <div>
        <div class="gmail_quote">
          <div dir="auto"><br>
          </div>
          <blockquote class="gmail_quote" style="margin:0 0 0
            .8ex;border-left:1px #ccc solid;padding-left:1ex"><br>
            Signed-off-by: Khem Raj &lt;<a href="mailto:raj.khem@gmail.com" target="_blank" moz-do-not-send="true">raj.khem@gmail.com</a>&gt;<br>
            Cc: Sakib Sajal &lt;<a href="mailto:sakib.sajal@windriver.com" target="_blank" moz-do-not-send="true">sakib.sajal@windriver.com</a>&gt;<br>
            ---<br>
            &nbsp;.../recipes-devtools/python/<a href="http://python3-requests-toolbelt_0.9.1.bb" rel="noreferrer" target="_blank" moz-do-not-send="true">python3-requests-toolbelt_0.9.1.bb</a>&nbsp;
            &nbsp;| 1 -<br>
            &nbsp;1 file changed, 1 deletion(-)<br>
            <br>
            diff --git a/meta-python/recipes-devtools/python/<a href="http://python3-requests-toolbelt_0.9.1.bb" rel="noreferrer" target="_blank" moz-do-not-send="true">python3-requests-toolbelt_0.9.1.bb</a>
            b/meta-python/recipes-devtools/python/<a href="http://python3-requests-toolbelt_0.9.1.bb" rel="noreferrer" target="_blank" moz-do-not-send="true">python3-requests-toolbelt_0.9.1.bb</a><br>
            index e075c019d0..27d122cd52 100644<br>
            --- a/meta-python/recipes-devtools/python/<a href="http://python3-requests-toolbelt_0.9.1.bb" rel="noreferrer" target="_blank" moz-do-not-send="true">python3-requests-toolbelt_0.9.1.bb</a><br>
            &#43;&#43;&#43; b/meta-python/recipes-devtools/python/<a href="http://python3-requests-toolbelt_0.9.1.bb" rel="noreferrer" target="_blank" moz-do-not-send="true">python3-requests-toolbelt_0.9.1.bb</a><br>
            @@ -20,7 &#43;20,6 @@ RDEPENDS_${PN} &#43;= &quot; \<br>
            &nbsp;RDEPENDS_${PN}-ptest &#43;= &quot; \<br>
            &nbsp; &nbsp; &nbsp; &nbsp; ${PYTHON_PN}-pytest \<br>
            &nbsp; &nbsp; &nbsp; &nbsp; ${PYTHON_PN}-betamax \<br>
            -&nbsp; &nbsp; &nbsp; &nbsp;${PYTHON_PN}-mock \<br>
            &nbsp;&quot;<br>
            <br>
            &nbsp;do_install_ptest() {<br>
            -- <br>
            2.27.0<br>
            <br>
            <br>
          </blockquote>
        </div>
      </div>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------92A97436FCD4EB0A3E19439F--
