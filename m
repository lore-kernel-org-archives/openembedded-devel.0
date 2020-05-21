Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web10.4827.1590064837531893813
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 May 2020 05:40:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=C0ufM/Ga;
 spf=pass (domain: gmail.com, ip: 209.85.218.51, mailfrom: david.banks.engineer@gmail.com)
Received: by mail-ej1-f51.google.com with SMTP id n24so8649882ejd.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 21 May 2020 05:40:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vdFLo7QOZrGCtWvQX/mCCmb/ae6YGUrPmxk2X3jLLW8=;
        b=C0ufM/GaJ04eV0ovZ50we3F4vKgDCfLq2ETCdDJpXUpIDBg2IXxMKIjEojTyx8CJrl
         JCk9j+/h/5xtPOjs2+bnqxvk2uCJ4cR1wLa3y7qN1Tke4d+mUfJiWVHGIYx1keZSYeyp
         RvTl17Tlwifs+dIrReapbwsC21T0Qyb5P+TpEPcn65UIpASXk/L3mucq3HP1qKi/V8r0
         uf5GyzJHgLEZty0UmF4N0CxUV/nk9ilcqY6Tnt8OSFIUT0Ri6BupUkMab6Jhmo1+mbFe
         7OWjnm+KKrrB3E6B+Rk4o5ZZi2505VnXUUCCr3HuoMbuOnomnmur+noW9pZfQOflwF/E
         HA5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vdFLo7QOZrGCtWvQX/mCCmb/ae6YGUrPmxk2X3jLLW8=;
        b=W7/DQDwhOvOEBa08R9xHDBKJzPgaROdgj7iSQbItlm7WAWhWW5hCmMTBOJgFiEAxaB
         DxMHNVoEu4/dkNygd7QMNUc7IxtXzPlXmnteE2iV3i8bw+uDKEzYEci2uIqb3EiOi/u4
         OZyYJtNpJc0oLqb/0otlM9W269Oa2fqGrTvMYes9cwq6yWyAn5LaWQIj4MiR714/7FOC
         LNyVwDAJDFVag5YcfmosiUBoGqOulHLn8LXmEK3YQKrZ/so5RUKbeawtZeXZ0UlNdUjE
         m2fYuFr9QFeJBD3BZZoc0rtyyL6TrGXBvSbo/sxGLJMGBzI8WDQ6us8yXjIIiT3uQEd0
         KdFg==
X-Gm-Message-State: AOAM532pPtyaU0onWBEg8G00sSlKNeeqoaqzWyZAQDM9Q4kRm6oTEs/6
	4bzMFMDaxemI1vA5+xD/y7C/dS0nGDcZNxHXhuU=
X-Google-Smtp-Source: ABdhPJxwUB8/i8l501GUh0TS7lFKi8el/RmjKVcnLRQMd7QoBDTYqndVhA/Lihltfy8eAgbUljLSDutnpgijF410azg=
X-Received: by 2002:a17:906:4d82:: with SMTP id s2mr3197716eju.542.1590064835984;
 Thu, 21 May 2020 05:40:35 -0700 (PDT)
MIME-Version: 1.0
References: <CAB=WuyaS00Sp1KdA-O-2OMQdwPcx=6p-f03+ZAXVkh-MA9nO2w@mail.gmail.com>
 <CA+chaQcZvRO0UqeHPc4q2njLav0A8nnaNHnARpoRGROzHxsSmQ@mail.gmail.com>
In-Reply-To: <CA+chaQcZvRO0UqeHPc4q2njLav0A8nnaNHnARpoRGROzHxsSmQ@mail.gmail.com>
From: "David Banks" <david.banks.engineer@gmail.com>
Date: Thu, 21 May 2020 08:40:24 -0400
Message-ID: <CAB=WuyY-86PqJRO=LgZKnbG9g-Nds+woAMPhEoHaZnRKb1evuQ@mail.gmail.com>
Subject: Re: [oe] Should meta-python2 include python-numpy?
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000b8011005a627d18e"

--000000000000b8011005a627d18e
Content-Type: text/plain; charset="UTF-8"

Martin,

Good to know I am not alone! I guess I didn't search thoroughly enough
before my message. Thanks for the link!

-David

On Mon, May 18, 2020 at 5:14 PM Martin Jansa <martin.jansa@gmail.com> wrote:

> I've asked the same in December, see:
>
> https://www.openembedded.org/pipermail/openembedded-devel/2019-December/203618.html
>
> I've also included them in my layer:
>
> https://github.com/ros/meta-ros/commit/630d755319c2bb5d33e2f5910877e153eaebc47d
> because I don't want to include meta-python2/zeus branch into my builds,
> I'm using meta-python2 in dunfell based builds (because that's where
> python2 was removed from oe-core and meta-oe) for zeus it's still unclear
> to me what meta-python2/zeus is supposed to be used for.
>
> On Mon, May 18, 2020 at 10:26 PM David Banks <
> david.banks.engineer@gmail.com> wrote:
>
>> Hi,
>>
>> I have a layer the requires python-numpy (specifically python2's numpy).
>> When upgrading to zeus, it no longer works because oe-core no longer
>> provides the python2 version of numpy. For now I just added numpy to my
>> broken layer, but I am wondering if it makes sense to add python2 numpy to
>> meta-python2.
>>
>> Thanks,
>> David
>> 
>>
>

--000000000000b8011005a627d18e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Martin,</div><div><br></div><div>Good to know I am no=
t alone! I guess I didn&#39;t search thoroughly enough before my message. T=
hanks for the link!<br></div><div><br></div><div>-David<br></div></div><br>=
<div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Ma=
y 18, 2020 at 5:14 PM Martin Jansa &lt;<a href=3D"mailto:martin.jansa@gmail=
.com">martin.jansa@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex"><div dir=3D"ltr">I&#39;ve asked the same in Dec=
ember, see:<div><a href=3D"https://www.openembedded.org/pipermail/openembed=
ded-devel/2019-December/203618.html" target=3D"_blank">https://www.openembe=
dded.org/pipermail/openembedded-devel/2019-December/203618.html</a><br></di=
v><div><br></div><div>I&#39;ve also included them in my layer:</div><div><a=
 href=3D"https://github.com/ros/meta-ros/commit/630d755319c2bb5d33e2f591087=
7e153eaebc47d" target=3D"_blank">https://github.com/ros/meta-ros/commit/630=
d755319c2bb5d33e2f5910877e153eaebc47d</a><br></div><div>because I don&#39;t=
 want to include meta-python2/zeus branch into my builds, I&#39;m using met=
a-python2 in dunfell based builds (because that&#39;s where python2 was rem=
oved from oe-core and meta-oe) for zeus it&#39;s still unclear to me what m=
eta-python2/zeus is supposed to be used for.</div></div><br><div class=3D"g=
mail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, May 18, 2020 at 1=
0:26 PM David Banks &lt;<a href=3D"mailto:david.banks.engineer@gmail.com" t=
arget=3D"_blank">david.banks.engineer@gmail.com</a>&gt; wrote:<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div>Hi,</d=
iv><div><br></div><div>I have a layer the requires python-numpy (specifical=
ly python2&#39;s numpy). When upgrading to zeus, it no longer works because=
 oe-core no longer provides the python2 version of numpy. For now I just ad=
ded numpy to my broken layer, but I am wondering if it makes sense to add p=
ython2 numpy to meta-python2.</div><div><br></div><div>Thanks,</div><div>Da=
vid<br></div></div>
<br>
</blockquote></div>
</blockquote></div>

--000000000000b8011005a627d18e--
