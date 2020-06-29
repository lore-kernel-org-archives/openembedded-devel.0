Received: from NAM12-DM6-obe.outbound.protection.outlook.com (NAM12-DM6-obe.outbound.protection.outlook.com [40.107.243.85])
 by mx.groups.io with SMTP id smtpd.web12.13369.1593414125258096656
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Jun 2020 00:02:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=mPQVceCR;
 spf=pass (domain: windriver.com, ip: 40.107.243.85, mailfrom: qi.chen@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h25eqAVT5pBVJRsPGC42V7FYgQ6pZOiTOre/ofHOX1xwu5f8UMK7hatlVRo6UdYJuNz0zVOX5vUM4O8ud8ncbg4hJlMVc7DrBtR7OlOxTOhyB4vhIMtI92D1P0MRt5gn3OBfREc7Om6KRQ7h5DP2q5A4OsZcdvJ3pmCJg2S5T3O9WbwGMFSectIpK/Wj1MnQ4vGWGbHm1de+z13Bb2VMJ06s/aOB4vOGPPSksTBom72uGAhzoGIcYSgPgQLEJF3m4kO4Cp9z3HIKASsjHO97msN3c+ELRd9CyUBfaPpoQYIC+iZ9MHtHcVEVSv8QyU3BuEUgF1Rq94jGPh3xH6DkCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T9Tn+D33hgpk8fB2uWzQ0eufalPH+d0k97GqbAgTnaI=;
 b=NVsn5YJhLTwmaJTBYmVyl9Z5zRSucNjdCKBwluXOuKazas/FKsKgVK5GZ8oKI8+GES2Um904W89zXnr235yt+xiqR60PF5Eiivhy/BMpzoPu5RaX3UifBMArFVG/Ak8tj3HUOOL+6ksYVUuQPEEbrCbHHL0KA1enB1uCef6+/6YNYdwKPFVqa4EOm7WH+FxFpiAdHGFKQ5APciUZOUGyzRJvsLygDUG4V2MEBOwwBJD/v9rMSCy/DNxEG75FVbKqpyr7FRcdCBvfBQgjEfKK7h5jIIn6iWLEeLBwE6rIdCRmjGOrJIz6eyIbtFLqX79IQ45569QrFPb8AvpLVLdrIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T9Tn+D33hgpk8fB2uWzQ0eufalPH+d0k97GqbAgTnaI=;
 b=mPQVceCRR2huuBJEcyUNF5B7IRyvk92CBDg8jzQJIqYnSpMZlnc3Z2ZDC5vU17iKebDVtvrJk9MA5CcS+/G+i+1VVPR6xZstNZnw/ZDT3KI/yVM+cWY6QV9QAf5D5xmd1J89pSBj16RE1iMjuC0LwONsPOH6L1qeeyd+DAaE2b8=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BYAPR11MB3480.namprd11.prod.outlook.com (2603:10b6:a03:79::27)
 by BY5PR11MB4388.namprd11.prod.outlook.com (2603:10b6:a03:1c9::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.20; Mon, 29 Jun
 2020 07:02:03 +0000
Received: from BYAPR11MB3480.namprd11.prod.outlook.com
 ([fe80::e91c:b2c9:b293:dab2]) by BYAPR11MB3480.namprd11.prod.outlook.com
 ([fe80::e91c:b2c9:b293:dab2%7]) with mapi id 15.20.3131.026; Mon, 29 Jun 2020
 07:02:03 +0000
Subject: Re: [oe] [meta-oe][PATCH] multipath-tools: fix compiling parallel issue
To: Scott Murray <scott.murray@konsulko.com>,
 hongxu <hongxu.jia@windriver.com>
References: <20200526062714.4000-1-hongxu.jia@windriver.com>
 <alpine.LFD.2.22.394.2006231320130.2920@godzilla.spiteful.org>
Cc: raj.khem@gmail.com, openembedded-devel@lists.openembedded.org
From: "Chen Qi" <Qi.Chen@windriver.com>
Message-ID: <5a7869aa-be14-52e9-65b3-b1706685128e@windriver.com>
Date: Mon, 29 Jun 2020 15:05:30 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
In-Reply-To: <alpine.LFD.2.22.394.2006231320130.2920@godzilla.spiteful.org>
X-ClientProxiedBy: HK2PR04CA0070.apcprd04.prod.outlook.com
 (2603:1096:202:15::14) To BYAPR11MB3480.namprd11.prod.outlook.com
 (2603:10b6:a03:79::27)
Return-Path: Qi.Chen@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.161] (60.247.85.82) by HK2PR04CA0070.apcprd04.prod.outlook.com (2603:1096:202:15::14) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.20.3131.21 via Frontend Transport; Mon, 29 Jun 2020 07:02:01 +0000
X-Originating-IP: [60.247.85.82]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b21ede23-7f7c-4614-a94a-08d81bfa5363
X-MS-TrafficTypeDiagnostic: BY5PR11MB4388:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB4388CFE1339AEB620CB00A7DED6E0@BY5PR11MB4388.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-Forefront-PRVS: 044968D9E1
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Rm+rulBYts3tCYElP6WO9/emrz+MpTXipkqblglpxGvreXKkJZgDv3P95sZuVsmnR8ZRym2Tr7YvutcH7Mjj9UXpkY7skQfOxT2SPVt5YMw2+1RAL9alvj4fzlDfDHHpMq1qx96flOWk7/p1x1NSjVi3anM9feiS8zCLgAGyaFaqFElkXHlTsELLjHtaaI4kTTF9MvZTp6iQScKxyEih4ou/WiE2mT86mQ5O2V9jUtI/F3DSFZzWj9EVdzZinmxaLte+UEde7PQi6PGvjpQiQF1Xi/eViTuxkBAEYTAwA4cFeM0AIwcMelhGzgfJCHhe+/7ka4BeXm6dpTIA8yeq/6dJyL4v4goNRBiIJ26YN+xxqkgGJsS9NYwnkGNPiTEvJbW9C7O3DJaxXoFJDhdYa0fc+sTqWmv7D/VnTssdLNQx87tYGv43tjye+H8wzLP2wfKbv49ZMEqC1+kDpv5yYYTAhjTQkFGxXYY5TgTTgdRKdFOxEiTEYwBxzbCJFyAx5Lhkt058ck4AOtw59B8yMA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB3480.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(346002)(376002)(39840400004)(396003)(136003)(366004)(66556008)(66946007)(66476007)(956004)(316002)(6706004)(6486002)(31696002)(16526019)(186003)(6636002)(5660300002)(86362001)(2906002)(110136005)(83380400001)(8676002)(16576012)(8936002)(6666004)(36756003)(31686004)(4326008)(966005)(33964004)(166002)(53546011)(478600001)(2616005)(52116002)(26005)(78286006)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	5O/6jQES3h+f3uZP0Q+ojBSiqZlYQh0yTkDUJd8icjP7oh4WhjCrxuj09+sKT9Wa1Jnz8Q3Kicoq2EdLI69ziQWUdmFJHkhMqT0nBv2GPnxtQSTNppg8hb6ByMk5eQUca54W+tG4Zt6dsuh2rWs8Sg6xFSPcxqW25ikXQnb9IOH1/pkb6FM/MiyYPtC260a5TCKdYn/tiWTdZ7Na5koqEn1wFUXQ6yY+BQfkV4f4TFGQ9byVUh+SNVvYtCeRcXC+ck4wlSF0/Rb+pKJA2w3kUCppTUy4jVg/y0O0ExgBDQqj2B8jPt32Ke8oFJLXWqnMb/Q5hYA/NmGrU8CAzatQ50TASFaMyZtPMDMn2oDfkePG/tZMF4zomR9Z5II7+EiVdhpNR7flLLZw4ophiXqTyBq+pv4nEZoVkAyl4tSFT6aAiV5RYf+JBCgVYnICAQp6Qom8MJ+Pl7sxpbfHkrTi09qShXE28UaHULIHh1ef9EM=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b21ede23-7f7c-4614-a94a-08d81bfa5363
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3480.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2020 07:02:02.9888
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a+GAed0JQeaA7ZCxOT6395T2gd78Gl5to4d7GpkDWtjmXr1KtPQuJN8iLGARQeI3zSAxbjTLAYDGOfAEiEXZKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4388
Content-Type: multipart/alternative;
 boundary="------------F5DC23AEF5CAF757780D86B8"

--------------F5DC23AEF5CAF757780D86B8
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 06/24/2020 01:24 AM, Scott Murray wrote:
> On Mon, 25 May 2020, hongxu wrote:
>
>> Add explicit dependency on libraries
>> [snip]
>> gcc/i686-overc-linux/10.1.0/ld: cannot find -lmpathpersist
>> collect2: error: ld returned 1 exit status
>> Makefile:36: recipe for target 'multipathd' failed
>> make[1]: *** [multipathd] Error 1
>> make[1]: Leaving directory 'git/multipathd'
>> Makefile:29: recipe for target 'multipathd' failed
>> make: *** [multipathd] Error 2
>> ln -sf libmpathpersist.so.0 libmpathpersist.so
>> [snip]
>>
>> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> [Snip]
>
> Just a heads up, this change seems perhaps insufficient, in one of my
> first test builds of AGL with latest dunfell meta-oe, I hit this failure:
>
> /ws/scottm/dev/agl/agl-repo/build-qemux86-64/tmp/work/corei7-64-agl-linux/multipath-tools/0.8.4-r0/recipe-sysroot-native/usr/bin/x86_64-agl-linux/../../libexec/x86_64-agl-linux/gcc/x86_64-agl-linux/9.3.0/ld:
> err
> or in libsg.o(.eh_frame); no .eh_frame_hdr table will be created
> /ws/scottm/dev/agl/agl-repo/build-qemux86-64/tmp/work/corei7-64-agl-linux/multipath-tools/0.8.4-r0/recipe-sysroot-native/usr/bin/x86_64-agl-linux/../../libexec/x86_64-agl-linux/gcc/x86_64-agl-linux/9.3.0/ld:
> BFD
>   (GNU Binutils) 2.34.0.20200220 internal error, aborting at
> ../../bfd/merge.c:933 in _bfd_merged_section_offset
>
> /ws/scottm/dev/agl/agl-repo/build-qemux86-64/tmp/work/corei7-64-agl-linux/multipath-tools/0.8.4-r0/recipe-sysroot-native/usr/bin/x86_64-agl-linux/../../libexec/x86_64-agl-linux/gcc/x86_64-agl-linux/9.3.0/ld:
> Ple
> ase report this bug.
>
> collect2: error: ld returned 1 exit status
> make[1]: *** [Makefile:24: libcheckreadsector0.so] Error 1
> make[1]: *** Waiting for unfinished jobs....
>
> It built fine on a retry.  My guess is there's still a race between ld and
> one of the inputs being generated.
>
> Scott
>
>

I also got a similar error.
ld: error in libsg.o(.eh_frame); no .eh_frame_hdr table will be created
....
ld: BFD (GNU Binutils) 2.34.0.20200220 internal error, aborting at 
../../bfd/merge.c:933 in _bfd_merged_section_offset
....
| make[1]: *** [Makefile:24: libcheckcciss_tur.so] Error 1
| make[1]: *** Waiting for unfinished jobs....

Looking at the Makefile, it has:
*LIBS= \**
**        libcheckcciss_tur.so \**
**        libcheckreadsector0.so \**
**        libchecktur.so \**
**        libcheckdirectio.so \**
**        libcheckemc_clariion.so \**
**        libcheckhp_sw.so \**
**        libcheckrdac.so**
**
**all: $(LIBS)*

and

*libcheck%.so: libsg.o %.o**
**        $(CC) $(LDFLAGS) $(SHARED_FLAGS) -o $@ $^*
and

*%.o:    %.c**
**        @echo building $@ because of $?**
**        $(CC) $(CFLAGS) $(CPPFLAGS) -c -o $@ $<*

 From the Makefile, there seems no race condition.

Khem, do you have some idea what's going on?

Best Regards,
Chen Qi

>
>
> 



--------------F5DC23AEF5CAF757780D86B8
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <div class="moz-cite-prefix">On 06/24/2020 01:24 AM, Scott Murray
      wrote:<br>
    </div>
    <blockquote cite="mid:alpine.LFD.2.22.394.2006231320130.2920@godzilla.spiteful.org" type="cite">
      <pre wrap="">On Mon, 25 May 2020, hongxu wrote:

</pre>
      <blockquote type="cite">
        <pre wrap="">Add explicit dependency on libraries
[snip]
gcc/i686-overc-linux/10.1.0/ld: cannot find -lmpathpersist
collect2: error: ld returned 1 exit status
Makefile:36: recipe for target 'multipathd' failed
make[1]: *** [multipathd] Error 1
make[1]: Leaving directory 'git/multipathd'
Makefile:29: recipe for target 'multipathd' failed
make: *** [multipathd] Error 2
ln -sf libmpathpersist.so.0 libmpathpersist.so
[snip]

Signed-off-by: Hongxu Jia <a class="moz-txt-link-rfc2396E" href="mailto:hongxu.jia@windriver.com">&lt;hongxu.jia@windriver.com&gt;</a>
</pre>
      </blockquote>
      <pre wrap="">[Snip]

Just a heads up, this change seems perhaps insufficient, in one of my
first test builds of AGL with latest dunfell meta-oe, I hit this failure:

/ws/scottm/dev/agl/agl-repo/build-qemux86-64/tmp/work/corei7-64-agl-linux/multipath-tools/0.8.4-r0/recipe-sysroot-native/usr/bin/x86_64-agl-linux/../../libexec/x86_64-agl-linux/gcc/x86_64-agl-linux/9.3.0/ld:
err
or in libsg.o(.eh_frame); no .eh_frame_hdr table will be created
/ws/scottm/dev/agl/agl-repo/build-qemux86-64/tmp/work/corei7-64-agl-linux/multipath-tools/0.8.4-r0/recipe-sysroot-native/usr/bin/x86_64-agl-linux/../../libexec/x86_64-agl-linux/gcc/x86_64-agl-linux/9.3.0/ld:
BFD
 (GNU Binutils) 2.34.0.20200220 internal error, aborting at
../../bfd/merge.c:933 in _bfd_merged_section_offset

/ws/scottm/dev/agl/agl-repo/build-qemux86-64/tmp/work/corei7-64-agl-linux/multipath-tools/0.8.4-r0/recipe-sysroot-native/usr/bin/x86_64-agl-linux/../../libexec/x86_64-agl-linux/gcc/x86_64-agl-linux/9.3.0/ld:
Ple
ase report this bug.

collect2: error: ld returned 1 exit status
make[1]: *** [Makefile:24: libcheckreadsector0.so] Error 1
make[1]: *** Waiting for unfinished jobs....

It built fine on a retry.  My guess is there's still a race between ld and
one of the inputs being generated.

Scott


</pre>
    </blockquote>
    <br>
    I also got a similar error.<br>
    ld: error in libsg.o(.eh_frame); no .eh_frame_hdr table will be
    created<br>
    ....<br>
    ld: BFD (GNU Binutils) 2.34.0.20200220 internal error, aborting at
    ../../bfd/merge.c:933 in _bfd_merged_section_offset<br>
    ....<br>
    | make[1]: *** [Makefile:24: libcheckcciss_tur.so] Error 1<br>
    | make[1]: *** Waiting for unfinished jobs....<br>
    <br>
    Looking at the Makefile, it has:<br>
    <b>LIBS= \</b><b><br>
    </b><b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; libcheckcciss_tur.so \</b><b><br>
    </b><b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; libcheckreadsector0.so \</b><b><br>
    </b><b>&nbsp;&nbsp; &nbsp; &nbsp;&nbsp; libchecktur.so \</b><b><br>
    </b><b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; libcheckdirectio.so \</b><b><br>
    </b><b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; libcheckemc_clariion.so \</b><b><br>
    </b><b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; libcheckhp_sw.so \</b><b><br>
    </b><b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; libcheckrdac.so</b><b><br>
    </b><b><br>
    </b><b>all: $(LIBS)</b><br>
    <br>
    and<br>
    <br>
    <b>libcheck%.so: libsg.o %.o</b><b><br>
    </b><b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $(CC) $(LDFLAGS) $(SHARED_FLAGS) -o $@ $^</b><br>
    and <br>
    <br>
    <b>%.o:&nbsp;&nbsp;&nbsp; %.c</b><b><br>
    </b><b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; @echo building $@ because of $?</b><b><br>
    </b><b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $(CC) $(CFLAGS) $(CPPFLAGS) -c -o $@ $&lt;</b><br>
    <br>
    From the Makefile, there seems no race condition.<br>
    <br>
    Khem, do you have some idea what's going on?<br>
    <br>
    Best Regards,<br>
    Chen Qi<br>
    <br>
    <blockquote cite="mid:alpine.LFD.2.22.394.2006231320130.2920@godzilla.spiteful.org" type="cite"><br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <br>
      <pre wrap="">
</pre>
    </blockquote>
    <p><br>
    </p>
  </body>
</html>

--------------F5DC23AEF5CAF757780D86B8--
