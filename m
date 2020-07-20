Received: from NAM11-CO1-obe.outbound.protection.outlook.com (NAM11-CO1-obe.outbound.protection.outlook.com [40.107.220.47])
 by mx.groups.io with SMTP id smtpd.web10.2971.1595272643268040544
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Jul 2020 12:17:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=HcopbJld;
 spf=pass (domain: windriver.com, ip: 40.107.220.47, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UglZAlykB1dzIj5EQDWHd0IUo9RAMGJZS3YZc0XyHi4xfONwfy3uFYTBfwB4qRF6MXcykL2NsFOJcBG9ecZTP3kaf5MotmQN/mCTzWXaog2QnARhz7yFApuO0ncvzAKKV6KEmBjAN2qM2PsKGx6okiJo6fyoIBIIZCgE7iw9xPHKX2Q0Q3pMXzhKMmyqLJHOLwnH83M/ptF5IyYNtWkcHGEejFUKgY0Y0LS4vqlDFwG5hljkNbT+kckGfu5Vk6zXtkq7CF2neeC3WqMEHs4R1u/UheK8RoN+/Ed02VqjFRFg2naRIJhIbKdXnuoN5fK0oD837ZRB8cjokpUXElGlcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nd9scvU3OJQfIyrW9xtyIfx7kk3uO5BgoYnmSEmHFpc=;
 b=JVadxSbMxbvtdhD9Dcg8YVIMM6J8tbcxY5DoA4aD8tAdgf2pAEhL6wl4e0COKEPn5zZiZSIB/fBAxdG4HRcy0wZ+PefE6c/HcwaljmdtiHmgaRxRqarYFyL0QjwB/sIcx4ATslC94H7Hoo7eXAkejxXvzilz26S/yZuTkfFLcmU2O0Plb8tcgX4QM1/P9w4eqGBgDoLeBryXzvu+3cWxgY6vJJza5/VlPVKjm6sa78yfVyNF31rGWiGcdkFpX+TFwqxf6YekJWg1Dx3bofgPGhyu1+zEXckVbwhxjC+1G0db3oSJu5sMGaEgAmDnLpx1NhXoQeRVOKbuTEYhNXoEFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nd9scvU3OJQfIyrW9xtyIfx7kk3uO5BgoYnmSEmHFpc=;
 b=HcopbJldqHr88eoWEsfDhFnYmTsG+6f7yg11KmPo8hOGiHsbf5p9TasLyp4c9LphZ6X0IG0E3nuVQku+Y7N7r5XwPCfsiMZWsG93yo0BxMObEfJ7C4i8XrTCZvq/ZDQUyWvr2tNifFSKCfThnJylPM6amFIDy9xQP0lYCEGeaxU=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=windriver.com;
Received: from CY4PR11MB0006.namprd11.prod.outlook.com (2603:10b6:910:7b::18)
 by CY4PR11MB1815.namprd11.prod.outlook.com (2603:10b6:903:125::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.23; Mon, 20 Jul
 2020 19:17:21 +0000
Received: from CY4PR11MB0006.namprd11.prod.outlook.com
 ([fe80::f422:a1ed:36f3:82d4]) by CY4PR11MB0006.namprd11.prod.outlook.com
 ([fe80::f422:a1ed:36f3:82d4%7]) with mapi id 15.20.3195.025; Mon, 20 Jul 2020
 19:17:21 +0000
Subject: Re: [oe] [meta-python][RFC] Organizing meta-python recipes into logical/functional groups
To: Tim Orling <ticotimo@gmail.com>, Khem Raj <raj.khem@gmail.com>
Cc: akuster808 <akuster808@gmail.com>,
 openembeded-devel <openembedded-devel@lists.openembedded.org>,
 "timothy.t.orling@intel.com" <timothy.t.orling@intel.com>
References: <b1d1487b-0691-3429-48dc-a3fc3345c25f@windriver.com>
 <89d4c21c-5ce0-3c68-3252-48c916beb140@gmail.com>
 <CAMKF1srV-ytTj2EHK1VjEo=Qw0OOrtd7qqk6dXgYGMhGt65PPQ@mail.gmail.com>
 <CANx9H-B0RJ6egpHscL25dMSQg-LGOe_DqUeYkxJeW-vLk3Xkqw@mail.gmail.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <29fd6884-d57f-f2a2-9272-e22a11e37ec7@windriver.com>
Date: Mon, 20 Jul 2020 15:17:02 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <CANx9H-B0RJ6egpHscL25dMSQg-LGOe_DqUeYkxJeW-vLk3Xkqw@mail.gmail.com>
X-ClientProxiedBy: YT1PR01CA0005.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::18)
 To CY4PR11MB0006.namprd11.prod.outlook.com (2603:10b6:910:7b::18)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.30] (174.115.236.231) by YT1PR01CA0005.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::18) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.17 via Frontend Transport; Mon, 20 Jul 2020 19:17:20 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7b0a45b8-8e10-4fdb-98a8-08d82ce1867f
X-MS-TrafficTypeDiagnostic: CY4PR11MB1815:
X-LD-Processed: 8ddb2873-a1ad-4a18-ae4e-4644631433be,ExtAddr
X-Microsoft-Antispam-PRVS: 
 <CY4PR11MB181536FB5719CDB7501C631B9F7B0@CY4PR11MB1815.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
 EX3KKQz3EyiYdkIqYaFhhm0uCwgePncZnHv9O5vV9UP3nl2PylzlkrCT0euGP52hOHYRlnSjNCMRO34iu6rlHo92t0NECwmkEEW0P8thFrdctN8pOnbPScD3LYeDHp5WK9sLAG/CLF3VOZAp1W8FL9HSE0CY6SmrxeMTWfH6U3JGCGueaeGHY3FyUH+7UDMy+5JpZK7RQ2U8BWZs/GaL+mNEtHZ+IWQyGUmeuOjLiMhTM7rMovx99thZD64UMDShukrd3gQw+9NfchdPRqCCjZr5YSJtNA2CrJHXkj3TkKfHJD8+EYP++9eFaZm9xXoaP73AjTwEU2VuaIUDZRaEUVXvmqvxvhQEFNQjmNdrDZpW6pq+/Q89ehncDNCHMCTmrxUEU54g6Ca/igxdp5uIS4o0INGpJ7DcPLejub7InP+NF+jQRK2KGcvpqFUbvjK++Vq60oxciYAa4KLqIetwuw==
X-Forefront-Antispam-Report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY4PR11MB0006.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(39850400004)(396003)(376002)(136003)(366004)(346002)(966005)(83380400001)(5660300002)(8676002)(166002)(52116002)(6486002)(53546011)(8936002)(86362001)(478600001)(31696002)(33964004)(31686004)(316002)(110136005)(186003)(6666004)(4326008)(54906003)(66946007)(66556008)(2616005)(956004)(16576012)(44832011)(2906002)(36756003)(66476007)(26005)(16526019)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 So66NdVynSXgzCN78zc6kEQ8XZdqjsRuJAmuhVcFAsGRIf11kD2dnNE5hYB/27CDgHwhzerwdfqybuJgRPQXIZMex7crfaoHT1a7++7D/YTyAvDE+Y94ISeY/+Rg3Gu4Ui+1ihC7Pw9Tb8JYuXgPw/tFOin3HieNV1cxRnjOznj0Miew7wLwKm2roFyBG6V21WdHQJzX4e66M+GWeaLbTWKyJfBy3SorN6flAvZ2WFisgXITmv7szKLS30h3PE20sZyyIcYSIHQPgmI4ultTQ96tiS+0fPTD2ZvkY+Rx11TLdqfH7nZt7Wrom4hTi6Mbgju7Uq2rKUE15DoNY4kJyW5Xlg5rdqg22fCLyvs8PS8s0LlVOyCmWDUWczNs/gSMkMo8ZRvwehKxfz7zXkXzwdE9xbzeCi0Nsr0gmAKkKW+kmGMhYNTzLnwjcmcI7MWBhNxCMub0lb7SUcOAhvi+taMmfy4oxIYEu5q9ttEKj7xPvdRM+YrINnjevJW6iP2+
X-MS-Exchange-Transport-Forked: True
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b0a45b8-8e10-4fdb-98a8-08d82ce1867f
X-MS-Exchange-CrossTenant-AuthSource: CY4PR11MB0006.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2020 19:17:20.9757
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xXDGKL9fLHyp6Oy4u45BTY6zMVLPozYQdSCjJgGWibhJ4ss/3LTDdCVLYXcBr+YhfcsiIMGMEehuJtyVUjPTOtewYYug2xuV2+s9cmIgnWs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR11MB1815
Content-Type: multipart/alternative;
 boundary="------------8DFBE2BCF0E9BD89BFBF5633"
Content-Language: en-US

--------------8DFBE2BCF0E9BD89BFBF5633
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


On 7/17/20 6:49 PM, Tim Orling wrote:
>
>
> On Fri, Jul 17, 2020 at 3:16 PM Khem Raj <raj.khem@gmail.com 
> <mailto:raj.khem@gmail.com>> wrote:
>
>
>
>     On Fri, Jul 17, 2020 at 9:23 AM akuster808 <akuster808@gmail.com
>     <mailto:akuster808@gmail.com>> wrote:
>
>
>
>         On 7/16/20 1:39 PM, Trevor Gamblin wrote:
>         > From #oe on IRC:
>         >
>         > <armpit> tgamblin, regarding meta-python... any thoughts of
>         organizing
>         > some  recipes into functional buckets? ie recipe-crypto
>         > <armpit> rather then all under -devtools
>         > <tgamblin> armpit: I think that makes sense. What do you think
>         > moto-timo? What would our categories be?
>         > <armpit> the last set of py packages made me think they
>         could have
>         > been categorized  into their own bucket.
>         >
>         > I think this is a good idea. While it isn't hard to find where a
>         > particular recipe lives, it could be much better organized.
>         We already
>         > have the following in the layer:
>         >
>         > recipes-core
>         > recipes-connectivity
>         > recipes-extended
>         > recipes-devtools (where most of the recipes actually are)
>         >
>         > Some ideas for bucket names (other suggestions are welcome):
>         >
>         > recipes-automation
>         > recipes-crypto
>         > recipes-frameworks'll put a patch in
>         > recipes-graphics
>         > recipes-multimedia
>         > recipes-support
>         > recipes-testing
>         > recipes-webdev
>         >
>         > Any additional thoughts on making this change?
>
>
>     This change slis good however it would be good to document the
>     suggestions in readme and then slowly move them
>
> good idea Khem.
Alright, I can submit a patch.
>
> I had the idea we could look to “Topics” on pypi.org <http://pypi.org> 
> for the classification...just a thought.
>
> https://pypi.org/search/
> And then expand “Topic”
>
> This might have the benefit of being discoverable via devtool/recipetool

I like this idea, but what about modules that fit under multiple topics? 
There are plenty of modules on the PyPI index that belong to 2+ topics, 
and some that don't seem to have any.

It would be cool if we could map it to PyPI's classifiers like that, but 
I suspect we'll have to keep fewer, more broad categories to make things 
sane.

Trevor

>
>
>
>         not from me :)
>         -armin
>         >
>         > Trevor
>         >
>
>
>
> 

--------------8DFBE2BCF0E9BD89BFBF5633
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 7/17/20 6:49 PM, Tim Orling wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:CANx9H-B0RJ6egpHscL25dMSQg-LGOe_DqUeYkxJeW-vLk3Xkqw@mail.gmail.com">
      
      <div><br>
      </div>
      <div><br>
        <div class="gmail_quote">
          <div dir="ltr" class="gmail_attr">On Fri, Jul 17, 2020 at 3:16
            PM Khem Raj &lt;<a href="mailto:raj.khem@gmail.com" moz-do-not-send="true">raj.khem@gmail.com</a>&gt; wrote:<br>
          </div>
          <blockquote class="gmail_quote" style="margin:0px 0px 0px
0.8ex;border-left-width:1px;border-left-style:solid;padding-left:1ex;border-left-color:rgb(204,204,204)">
            <div><br>
            </div>
            <div><br>
            </div>
            <div>
              <div class="gmail_quote">
                <div dir="ltr" class="gmail_attr">On Fri, Jul 17, 2020
                  at 9:23 AM akuster808 &lt;<a href="mailto:akuster808@gmail.com" target="_blank" moz-do-not-send="true">akuster808@gmail.com</a>&gt;
                  wrote:<br>
                </div>
                <blockquote class="gmail_quote" style="margin:0px 0px
                  0px
0.8ex;border-left-width:1px;border-left-style:solid;padding-left:1ex;border-left-color:rgb(204,204,204)"><br>
                  <br>
                  On 7/16/20 1:39 PM, Trevor Gamblin wrote:<br>
                  &gt; From #oe on IRC:<br>
                  &gt;<br>
                  &gt; &lt;armpit&gt; tgamblin, regarding meta-python...
                  any thoughts of organizing<br>
                  &gt; some&nbsp; recipes into functional buckets? ie
                  recipe-crypto<br>
                  &gt; &lt;armpit&gt; rather then all under -devtools<br>
                  &gt; &lt;tgamblin&gt; armpit: I think that makes
                  sense. What do you think<br>
                  &gt; moto-timo? What would our categories be?<br>
                  &gt; &lt;armpit&gt; the last set of py packages made
                  me think they could have<br>
                  &gt; been categorized&nbsp; into their own bucket.<br>
                  &gt;<br>
                  &gt; I think this is a good idea. While it isn't hard
                  to find where a<br>
                  &gt; particular recipe lives, it could be much better
                  organized. We already<br>
                  &gt; have the following in the layer:<br>
                  &gt;<br>
                  &gt; recipes-core<br>
                  &gt; recipes-connectivity<br>
                  &gt; recipes-extended<br>
                  &gt; recipes-devtools (where most of the recipes
                  actually are)<br>
                  &gt;<br>
                  &gt; Some ideas for bucket names (other suggestions
                  are welcome):<br>
                  &gt;<br>
                  &gt; recipes-automation<br>
                  &gt; recipes-crypto<br>
                  &gt; recipes-frameworks'll put a patch in<br>
                  &gt; recipes-graphics<br>
                  &gt; recipes-multimedia<br>
                  &gt; recipes-support<br>
                  &gt; recipes-testing<br>
                  &gt; recipes-webdev<br>
                  &gt;<br>
                  &gt; Any additional thoughts on making this change?<br>
                </blockquote>
                <div dir="auto"><br>
                </div>
              </div>
            </div>
            <div>
              <div class="gmail_quote">
                <div dir="auto">This change slis good however it would
                  be good to document the suggestions in readme and then
                  slowly move them&nbsp;</div>
              </div>
            </div>
          </blockquote>
          <div dir="auto">good idea Khem.</div>
        </div>
      </div>
    </blockquote>
    Alright, I can submit a patch.<br>
    <blockquote type="cite" cite="mid:CANx9H-B0RJ6egpHscL25dMSQg-LGOe_DqUeYkxJeW-vLk3Xkqw@mail.gmail.com">
      <div>
        <div class="gmail_quote">
          <div dir="auto"><br>
          </div>
          <div dir="auto">I had the idea we could look to “Topics” on <a href="http://pypi.org" moz-do-not-send="true">pypi.org</a>
            for the classification...just a thought.</div>
          <div dir="auto">
            <div dir="auto"><br>
            </div>
            <div><a href="https://pypi.org/search/" moz-do-not-send="true">https://pypi.org/search/</a></div>
            And then expand “Topic”</div>
          <div dir="auto"><br>
          </div>
          <div dir="auto">This might have the benefit of being
            discoverable via devtool/recipetool</div>
        </div>
      </div>
    </blockquote>
    <p>I like this idea, but what about modules that fit under multiple
      topics? There are plenty of modules on the PyPI index that belong
      to 2&#43; topics, and some that don't seem to have any.</p>
    <p>It would be cool if we could map it to PyPI's classifiers like
      that, but I suspect we'll have to keep fewer, more broad
      categories to make things sane.</p>
    <p>Trevor<br>
    </p>
    <blockquote type="cite" cite="mid:CANx9H-B0RJ6egpHscL25dMSQg-LGOe_DqUeYkxJeW-vLk3Xkqw@mail.gmail.com">
      <div>
        <div class="gmail_quote">
          <div dir="auto"><br>
          </div>
          <blockquote class="gmail_quote" style="margin:0px 0px 0px
0.8ex;border-left-width:1px;border-left-style:solid;padding-left:1ex;border-left-color:rgb(204,204,204)">
            <div>
              <div class="gmail_quote">
                <div dir="auto"><br>
                </div>
                <blockquote class="gmail_quote" style="margin:0px 0px
                  0px
0.8ex;border-left-width:1px;border-left-style:solid;padding-left:1ex;border-left-color:rgb(204,204,204)"><br>
                  not from me :)&nbsp;<br>
                  -armin<br>
                  &gt;<br>
                  &gt; Trevor<br>
                  &gt;<br>
                  <br>
                </blockquote>
              </div>
            </div>
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

--------------8DFBE2BCF0E9BD89BFBF5633--
