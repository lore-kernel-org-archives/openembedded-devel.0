Received: from mail-il1-f177.google.com (mail-il1-f177.google.com [209.85.166.177])
 by mx.groups.io with SMTP id smtpd.web12.289.1595026157097493446
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 17 Jul 2020 15:49:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=AEVmxO6h;
 spf=pass (domain: gmail.com, ip: 209.85.166.177, mailfrom: ticotimo@gmail.com)
Received: by mail-il1-f177.google.com with SMTP id a11so8693244ilk.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 17 Jul 2020 15:49:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7AFcXOjszkSchAt2fhSwMGJL5SzROTAS7WwsG/LqGKo=;
        b=AEVmxO6hV3BWCp80jz06j6aSntIwkyo3chDRYfWg/Qv/ahUbqIcEVzVpDWeN8h4Irn
         4VFTm/Qz8ivwPXt8UJGcSksd5+SaFrpZeMqMDU7hdXlnv6fAsQqVUY4R0G/8FWKhPZt3
         SRDxusW+bAzIXbR8ZPdkbVoUVMmwRlav8WLp+v0XonlZKr0BbpDz7sZytnsliflx8dE6
         t2goVtntTzcX1WZpxyFRedrLwEvuslSh0X17pDBdI8sFwrsY10Q876Crsg50DayuwDPT
         ou5w7KuiRWH67cFg2gVo+Y1J9K3akC98r2xtrCpHJTFQobSfUDAIiG4OZz6iEwQ/cyM/
         LCfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7AFcXOjszkSchAt2fhSwMGJL5SzROTAS7WwsG/LqGKo=;
        b=p9VNUigFR6xUbVVrvRXotQEYUET0l/FZi/1FMmwyCdOCiCdgNz6WZj3jH1Fkwa9Jkp
         SNYc+IoKnYewR2KGpK0GoR2FA1g2Jiu3BSBklcxet/59lg08U0++iFv/+NPgyd37Rw10
         thIwyWqC4XXjB9X7fSN6i6tis4CuTvzGTVL1VzLj0gOjyZPgWgIOVadihRaEO0Mkr+nw
         nLK8GiKR1pgV1hW5bzZEbQrwLetJYxuy8yHpYBIpcl2Uya+ggiyLxuJxiw1/aSMFbrpc
         SkKbg9lHg2pbHHBu029RV/riZx9DPlTPqIsdpqZ+JjWHeC9fH2p6La52H+GO1VMWUbY7
         owEg==
X-Gm-Message-State: AOAM532sADBHVKnxk0t9jIUDRB0Nsev7VkkYGggibhcL2XfGuHmF4fyK
	4DsYlx6zz18ev/VbZMDqKI3voHKFR5v5meF8boY=
X-Google-Smtp-Source: ABdhPJyRh0HQVoFzwoWeI7Cec+219M1ymZ6A4MzXIn4UUYN5Ii/g4W0fOEOzCvdRcLtqZJp/bDboOfJvCfM6hUp5Yk4=
X-Received: by 2002:a92:bf0c:: with SMTP id z12mr11501137ilh.151.1595026156362;
 Fri, 17 Jul 2020 15:49:16 -0700 (PDT)
MIME-Version: 1.0
References: <b1d1487b-0691-3429-48dc-a3fc3345c25f@windriver.com>
 <89d4c21c-5ce0-3c68-3252-48c916beb140@gmail.com> <CAMKF1srV-ytTj2EHK1VjEo=Qw0OOrtd7qqk6dXgYGMhGt65PPQ@mail.gmail.com>
In-Reply-To: <CAMKF1srV-ytTj2EHK1VjEo=Qw0OOrtd7qqk6dXgYGMhGt65PPQ@mail.gmail.com>
From: "Tim Orling" <ticotimo@gmail.com>
Date: Fri, 17 Jul 2020 15:49:04 -0700
Message-ID: <CANx9H-B0RJ6egpHscL25dMSQg-LGOe_DqUeYkxJeW-vLk3Xkqw@mail.gmail.com>
Subject: Re: [oe] [meta-python][RFC] Organizing meta-python recipes into logical/functional groups
To: Khem Raj <raj.khem@gmail.com>
Cc: Trevor Gamblin <trevor.gamblin@windriver.com>, akuster808 <akuster808@gmail.com>, 
	openembeded-devel <openembedded-devel@lists.openembedded.org>, 
	"timothy.t.orling@intel.com" <timothy.t.orling@intel.com>
Content-Type: multipart/alternative; boundary="000000000000751f8405aaaaf767"

--000000000000751f8405aaaaf767
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 17, 2020 at 3:16 PM Khem Raj <raj.khem@gmail.com> wrote:

>
>
> On Fri, Jul 17, 2020 at 9:23 AM akuster808 <akuster808@gmail.com> wrote:
>
>>
>>
>> On 7/16/20 1:39 PM, Trevor Gamblin wrote:
>> > From #oe on IRC:
>> >
>> > <armpit> tgamblin, regarding meta-python... any thoughts of organizin=
g
>> > some  recipes into functional buckets? ie recipe-crypto
>> > <armpit> rather then all under -devtools
>> > <tgamblin> armpit: I think that makes sense. What do you think
>> > moto-timo? What would our categories be?
>> > <armpit> the last set of py packages made me think they could have
>> > been categorized  into their own bucket.
>> >
>> > I think this is a good idea. While it isn't hard to find where a
>> > particular recipe lives, it could be much better organized. We alread=
y
>> > have the following in the layer:
>> >
>> > recipes-core
>> > recipes-connectivity
>> > recipes-extended
>> > recipes-devtools (where most of the recipes actually are)
>> >
>> > Some ideas for bucket names (other suggestions are welcome):
>> >
>> > recipes-automation
>> > recipes-crypto
>> > recipes-frameworks
>> > recipes-graphics
>> > recipes-multimedia
>> > recipes-support
>> > recipes-testing
>> > recipes-webdev
>> >
>> > Any additional thoughts on making this change?
>>
>
> This change slis good however it would be good to document the suggestio=
ns
> in readme and then slowly move them
>
good idea Khem.

I had the idea we could look to =E2=80=9CTopics=E2=80=9D on pypi.org for t=
he
classification...just a thought.

https://pypi.org/search/
And then expand =E2=80=9CTopic=E2=80=9D

This might have the benefit of being discoverable via devtool/recipetool


>
>> not from me :)
>> -armin
>> >
>> > Trevor
>> >
>>
>>=20
>

--000000000000751f8405aaaaf767
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Fri, Jul 17, 2020 at 3:16 PM Khem Raj &lt;<a href=3D"ma=
ilto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-wi=
dth:1px;border-left-style:solid;padding-left:1ex;border-left-color:rgb(204,=
204,204)"><div><br></div><div><br><div class=3D"gmail_quote"></div></div><d=
iv><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri,=
 Jul 17, 2020 at 9:23 AM akuster808 &lt;<a href=3D"mailto:akuster808@gmail.=
com" target=3D"_blank">akuster808@gmail.com</a>&gt; wrote:<br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-wi=
dth:1px;border-left-style:solid;padding-left:1ex;border-left-color:rgb(204,=
204,204)"><br>
<br>
On 7/16/20 1:39 PM, Trevor Gamblin wrote:<br>
&gt; From #oe on IRC:<br>
&gt;<br>
&gt; &lt;armpit&gt; tgamblin, regarding meta-python... any thoughts of org=
anizing<br>
&gt; some=C2=A0 recipes into functional buckets? ie recipe-crypto<br>
&gt; &lt;armpit&gt; rather then all under -devtools<br>
&gt; &lt;tgamblin&gt; armpit: I think that makes sense. What do you think<=
br>
&gt; moto-timo? What would our categories be?<br>
&gt; &lt;armpit&gt; the last set of py packages made me think they could h=
ave<br>
&gt; been categorized=C2=A0 into their own bucket.<br>
&gt;<br>
&gt; I think this is a good idea. While it isn&#39;t hard to find where a<=
br>
&gt; particular recipe lives, it could be much better organized. We alread=
y<br>
&gt; have the following in the layer:<br>
&gt;<br>
&gt; recipes-core<br>
&gt; recipes-connectivity<br>
&gt; recipes-extended<br>
&gt; recipes-devtools (where most of the recipes actually are)<br>
&gt;<br>
&gt; Some ideas for bucket names (other suggestions are welcome):<br>
&gt;<br>
&gt; recipes-automation<br>
&gt; recipes-crypto<br>
&gt; recipes-frameworks<br>
&gt; recipes-graphics<br>
&gt; recipes-multimedia<br>
&gt; recipes-support<br>
&gt; recipes-testing<br>
&gt; recipes-webdev<br>
&gt;<br>
&gt; Any additional thoughts on making this change?<br>
</blockquote><div dir=3D"auto"><br></div></div></div><div><div class=3D"gm=
ail_quote"><div dir=3D"auto">This change slis good however it would be good=
 to document the suggestions in readme and then slowly move them=C2=A0</div=
><div dir=3D"auto"></div></div></div></blockquote><div dir=3D"auto">good id=
ea Khem.</div><div dir=3D"auto"><br></div><div dir=3D"auto">I had the idea =
we could look to =E2=80=9CTopics=E2=80=9D on <a href=3D"http://pypi.org">py=
pi.org</a> for the classification...just a thought.</div><div dir=3D"auto">=
<div dir=3D"auto"><br></div><div><a href=3D"https://pypi.org/search/">https=
://pypi.org/search/</a></div>And then expand =E2=80=9CTopic=E2=80=9D</div><=
div dir=3D"auto"><br></div><div dir=3D"auto">This might have the benefit of=
 being discoverable via devtool/recipetool</div><div dir=3D"auto"><br></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left-width:1px;border-left-style:solid;padding-left:1ex;border-left-color:=
rgb(204,204,204)"><div><div class=3D"gmail_quote"><div dir=3D"auto"><br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left-width:1px;border-left-style:solid;padding-left:1ex;border-left-colo=
r:rgb(204,204,204)"><br>
not from me :)=C2=A0<br>
-armin<br>
&gt;<br>
&gt; Trevor<br>
&gt;<br>
<br>
</blockquote></div></div>
<br>
</blockquote></div></div>

--000000000000751f8405aaaaf767--
