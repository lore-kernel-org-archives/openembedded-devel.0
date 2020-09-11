Received: from NAM11-BN8-obe.outbound.protection.outlook.com (NAM11-BN8-obe.outbound.protection.outlook.com [40.107.236.77])
 by mx.groups.io with SMTP id smtpd.web10.5812.1599860410519829799
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 11 Sep 2020 14:40:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=QXgFi9Ia;
 spf=pass (domain: windriver.com, ip: 40.107.236.77, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LdVwrnMCqWrsi7xMKU5jn3hlGeTdBuHkpeyp/w/fXktk1ujUTv79me8xhF93fi7jZvDXTBsNA0zhji7Q7e3guRxXPiHaEnq3FBup3rkmBzEn6jnI2z7XY8Fct/IVlo+P9NZ9Ne3GZVGZ+oG+4vIeKzgtwwUCLsFTGweFoZ6LS/C6yu15ctRpsR+O1nDwtnWoUizB6mCGaJt0aVgs7uD4IdDb+UWp5pZA8+MToYzvwjit2yqTbOGZgW8f4U3brXVGDrs4FoWWw4c95DxUprKT1eKMcICEUZnW5H6hnTwyVLRQxQv7kt4i6N2p8etc7tNZ/B6rXow7SzJ2K0mfjH7Jng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w6IQwn8XzzsiBQw3ZZcUfiQ4UYSFyH/vdPSyx9SUVTs=;
 b=jvxeo86W3M8QoT4vwM3wE0AWUSxlvFgq4owSMmsncmzGjJfIosJE4YDksVKn3QrjgaoKZWW4ePQii3v2gEPYhFhI3S3Vz/LsfiH7/92mZecsfmhvefr8DSHf5lu8TJN8qLzQvdpCMPH9dP1PQUzK1bHuP2u6IR8beWCE7t/lpj+ORHjCxBSnlfWdjgMW5wohKw9+VNPjmkjzjNrPTxPvWOewXG0k4533YD+vMR/G4UcXfG7f8IQiyY7+wcuv0yWnvyuE4Bst7jlxXQiHbDxywDcy2BgkTicc5rPJjLImJBGx7SUjqralfCbHjA5E28ahz6n5ja+PSQeui3oTnS7nAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w6IQwn8XzzsiBQw3ZZcUfiQ4UYSFyH/vdPSyx9SUVTs=;
 b=QXgFi9Iarjmt/g56mF4JyZUxY7SxstgRh3utlxqz34dI/3KU6g/kOWfMnUiCXojjj7fs8t+W/Xcngq0ScuwjxDT+qSBnwg089mw/4WCIJGeBR250+8OdoshoGz0qv3Gr1HPSaIpVBxoxOmYYuq+TfiRQf7C4F1Oz/reklEypUl4=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BY5PR11MB4324.namprd11.prod.outlook.com (2603:10b6:a03:1bd::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16; Fri, 11 Sep
 2020 21:40:08 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8%7]) with mapi id 15.20.3370.017; Fri, 11 Sep 2020
 21:40:08 +0000
Subject: Re: [oe] [meta-python][PATCH] python3-django: add recipe for 3.1.1
To: Tim Orling <ticotimo@gmail.com>
Cc: openembedded-devel@lists.openembedded.org, Khem Raj <raj.khem@gmail.com>
References: <20200911142637.1435646-1-trevor.gamblin@windriver.com>
 <CANx9H-CDW+55z5cHQX0pvnmoCsN72hATBpDz8+H_ud2ukiopRw@mail.gmail.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <a07d51b2-fd5d-5422-4b58-4c358c37b106@windriver.com>
Date: Fri, 11 Sep 2020 17:40:04 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <CANx9H-CDW+55z5cHQX0pvnmoCsN72hATBpDz8+H_ud2ukiopRw@mail.gmail.com>
X-ClientProxiedBy: YTOPR0101CA0061.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:14::38) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by YTOPR0101CA0061.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:14::38) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16 via Frontend Transport; Fri, 11 Sep 2020 21:40:07 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5ab129d4-6d51-4a80-28b6-08d8569b40ad
X-MS-TrafficTypeDiagnostic: BY5PR11MB4324:
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB43242E75C97390498093B4829F240@BY5PR11MB4324.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3173;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	rg9cWI99MMJHyqqnngZb1xuvRsxv0vznIqCuUhHUY+jcSqHIL/L+4YCb2rtb2IcnvBld+sdf9NiguFpPIb1FZEJnoIz2yM/RXgcq2rQ4GqTGfMBN5CY+NkH1hxKxxvJpdenTYkut9AcyPoVUD4FIZFEka6mmCxQsmKEN5JgDRsoQkEazP/XzMkbTcPeR8+TGHkRd5WoWGJb2X1fhl3mhd4EYnoy7AzbWdxXI9Wg2y4iXcOJDQqXcd7kYysn9UAmQEqxhc04RAanoMeryNM6jAxujcQdUgBQ9neCytMgV07dHVDc0Wwkxvo3WTPW6VGXRGK5twKIb5uHB6zdXwDUWb84d2S3a6IRw1w9a1yqmK6NaEv0VXUvY6Yik1XaTlDXsg+TW7B8AZ04N4bDHwCRhXsL0Epj+94LKyNm/ZbB8e+6DQCtQI54A4dyreD2udma4ziTOLXLl51hfT+AF3HppLw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(376002)(346002)(136003)(366004)(396003)(16576012)(83380400001)(478600001)(36756003)(2616005)(52116002)(33964004)(2906002)(6916009)(6486002)(966005)(4326008)(8936002)(86362001)(31696002)(316002)(166002)(16526019)(186003)(53546011)(31686004)(26005)(66556008)(44832011)(66476007)(5660300002)(66946007)(6666004)(8676002)(956004)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	k9CCyNYuQZ3yCWpX+yvKAu6aL43YvSqWtKNGEIbjQoLe5ANZLRer7vf8UQ4UjfPVr3wMap9gc8gmfLCxGe5HJN0p6tOMKCCjdi3CeYOcRsB2uSUeRm1J0iHbmtqJ/XIlW6KqAVXluXYlrTER03emFX/ueY/WCLLYGTQgqfU5GYVtDs9CvD+O1hHlgUCfC1Ei86+NfKgr3C2yEYWTAdjbx1Zrl6ExWxGjIrvzrVts8gB20c5dyUFBNsNeIsMxvFIVNyCSW+XwWxDP6FsaltW9Y3bDObjfkNa9hDxZnNdriqX1b55qD+ps47ebnWMFcL9G8Tt43OY3ho+wMYOVCIzBMGOGJxpKBCx98riMojCdktW+nrHNmOPIrOTWIaAB6Jg3BKnTqai87LbOlaM7LIKN8KCWhWY8SS/G0StPuksjEblG8fCku2cj9RKPuKx6UGabRn7pzqCyrDcYQwV0xVUMxGVEK2fi0WGhyPqB1ofCu9zpXJreQEqk+5mRDUfxJ56bGqy6DtjRmFn7DajnVcYvZresGYac+5765BDjmlR/eCOUsr1IWDAyiqY+5JVBMRkUIPVm6SV8u22s4XpJRHEuOXgkyg/F2qO+Qj4xhBfq+2Ro9u1QHpucYA48XJE+XGFvYbnATiTRvm/YTl8CVrAC8A==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ab129d4-6d51-4a80-28b6-08d8569b40ad
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2020 21:40:08.1812
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /iv6MOeibcP1wmB05mtVYOyCXBzwM5hoAUT08mpJVKwZV5Yf/qABt4wnYnAH9kl7UUoybqaRDcLYYjD+jthCfwS+o0jm9Krj+EpeUP95Vqg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4324
Content-Type: multipart/alternative;
 boundary="------------27119DCD825447D82B2912CA"
Content-Language: en-US

--------------27119DCD825447D82B2912CA
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


On 9/11/20 5:02 PM, Tim Orling wrote:
> The reason for Django 2.2 is it is LTS. This version will now override 
> unless the user sets PREFERRED_VERSION. The thrash on non-LTS Django 
> is a PITA to support...
Alright, let's hold off on merging this one then. I'll revisit it some 
time in the future.
>
> On Fri, Sep 11, 2020 at 7:26 AM Trevor Gamblin 
> <trevor.gamblin@windriver.com <mailto:trevor.gamblin@windriver.com>> 
> wrote:
>
>     meta-python only contains a recipe for django 2.2.x, so
>
>     add a recipe file for the newest branch.
>
>
>
>     Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com
>     <mailto:trevor.gamblin@windriver.com>>
>
>     ---
>
>      .../recipes-devtools/python/python3-django_3.1.1.bb
>     <http://python3-django_3.1.1.bb>     | 9 +++++++++
>
>      1 file changed, 9 insertions(+)
>
>      create mode 100644
>     meta-python/recipes-devtools/python/python3-django_3.1.1.bb
>     <http://python3-django_3.1.1.bb>
>
>
>
>     diff --git
>     a/meta-python/recipes-devtools/python/python3-django_3.1.1.bb
>     <http://python3-django_3.1.1.bb>
>     b/meta-python/recipes-devtools/python/python3-django_3.1.1.bb
>     <http://python3-django_3.1.1.bb>
>
>     new file mode 100644
>
>     index 000000000..b36cfb699
>
>     --- /dev/null
>
>     +++ b/meta-python/recipes-devtools/python/python3-django_3.1.1.bb
>     <http://python3-django_3.1.1.bb>
>
>     @@ -0,0 +1,9 @@
>
>     +require python-django.inc
>
>     +inherit setuptools3
>
>     +
>
>     +SRC_URI[md5sum] = "d5e894fb3c46064e84e9dc68a08a46d0"
>
>     +SRC_URI[sha256sum] =
>     "59c8125ca873ed3bdae9c12b146fbbd6ed8d0f743e4cf5f5817af50c51f1fc2f"
>
>     +
>
>     +RDEPENDS_${PN} += "\
>
>     +    ${PYTHON_PN}-sqlparse \
>
>     +"
>
>     -- 
>
>     2.26.2
>
>
>
>     
>

--------------27119DCD825447D82B2912CA
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 9/11/20 5:02 PM, Tim Orling wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:CANx9H-CDW+55z5cHQX0pvnmoCsN72hATBpDz8+H_ud2ukiopRw@mail.gmail.com">
      
      <div dir="auto">The reason for Django 2.2 is it is LTS. This
        version will now override unless the user sets
        PREFERRED_VERSION. The thrash on non-LTS Django is a PITA to
        support...</div>
    </blockquote>
    Alright, let's hold off on merging this one then. I'll revisit it
    some time in the future.<br>
    <blockquote type="cite" cite="mid:CANx9H-CDW+55z5cHQX0pvnmoCsN72hATBpDz8+H_ud2ukiopRw@mail.gmail.com">
      <div><br>
        <div class="gmail_quote">
          <div dir="ltr" class="gmail_attr">On Fri, Sep 11, 2020 at 7:26
            AM Trevor Gamblin &lt;<a href="mailto:trevor.gamblin@windriver.com" moz-do-not-send="true">trevor.gamblin@windriver.com</a>&gt;
            wrote:<br>
          </div>
          <blockquote class="gmail_quote" style="margin:0 0 0
            .8ex;border-left:1px #ccc solid;padding-left:1ex">meta-python
            only contains a recipe for django 2.2.x, so<br>
            <br>
            add a recipe file for the newest branch.<br>
            <br>
            <br>
            <br>
            Signed-off-by: Trevor Gamblin &lt;<a href="mailto:trevor.gamblin@windriver.com" target="_blank" moz-do-not-send="true">trevor.gamblin@windriver.com</a>&gt;<br>
            <br>
            ---<br>
            <br>
            &nbsp;.../recipes-devtools/python/<a href="http://python3-django_3.1.1.bb" rel="noreferrer" target="_blank" moz-do-not-send="true">python3-django_3.1.1.bb</a>&nbsp;
            &nbsp; &nbsp; | 9 +++++++++<br>
            <br>
            &nbsp;1 file changed, 9 insertions(+)<br>
            <br>
            &nbsp;create mode 100644 meta-python/recipes-devtools/python/<a href="http://python3-django_3.1.1.bb" rel="noreferrer" target="_blank" moz-do-not-send="true">python3-django_3.1.1.bb</a><br>
            <br>
            <br>
            <br>
            diff --git a/meta-python/recipes-devtools/python/<a href="http://python3-django_3.1.1.bb" rel="noreferrer" target="_blank" moz-do-not-send="true">python3-django_3.1.1.bb</a>
            b/meta-python/recipes-devtools/python/<a href="http://python3-django_3.1.1.bb" rel="noreferrer" target="_blank" moz-do-not-send="true">python3-django_3.1.1.bb</a><br>
            <br>
            new file mode 100644<br>
            <br>
            index 000000000..b36cfb699<br>
            <br>
            --- /dev/null<br>
            <br>
            +++ b/meta-python/recipes-devtools/python/<a href="http://python3-django_3.1.1.bb" rel="noreferrer" target="_blank" moz-do-not-send="true">python3-django_3.1.1.bb</a><br>
            <br>
            @@ -0,0 +1,9 @@<br>
            <br>
            +require python-django.inc<br>
            <br>
            +inherit setuptools3<br>
            <br>
            +<br>
            <br>
            +SRC_URI[md5sum] = &quot;d5e894fb3c46064e84e9dc68a08a46d0&quot;<br>
            <br>
            +SRC_URI[sha256sum] =
            &quot;59c8125ca873ed3bdae9c12b146fbbd6ed8d0f743e4cf5f5817af50c51f1fc2f&quot;<br>
            <br>
            +<br>
            <br>
            +RDEPENDS_${PN} += &quot;\<br>
            <br>
            +&nbsp; &nbsp; ${PYTHON_PN}-sqlparse \<br>
            <br>
            +&quot;<br>
            <br>
            -- <br>
            <br>
            2.26.2<br>
            <br>
            <br>
            <br>
            <br>
            <br>
          </blockquote>
        </div>
      </div>
    </blockquote>
  </body>
</html>

--------------27119DCD825447D82B2912CA--
