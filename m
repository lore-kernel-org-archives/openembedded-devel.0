Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
 by mx.groups.io with SMTP id smtpd.web12.674.1595024212431178772
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 17 Jul 2020 15:16:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=amQUjqgu;
 spf=pass (domain: gmail.com, ip: 209.85.222.171, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f171.google.com with SMTP id b4so10175706qkn.11
        for <openembedded-devel@lists.openembedded.org>; Fri, 17 Jul 2020 15:16:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PKMp32y0zfJYt35nU6ZcTNEe5i66+1BZrWHoETeaUpc=;
        b=amQUjqguaAM7WQGKA3VkdXBTadF7qusp8bqgOsJScZE+OE1FOBkp+d6CHQ8PZAIhog
         FqZR4PuNDq4Kx+5YQkHl8S1AqfwybGOErPkizpmK4lRy3ubAAbPgUlxy1Qz4vsdxO8Fm
         Xj9V/+7Z0BycNbWMp2QQHQUXZm6itDk9ZniCmdtQtPHwokhMNvUU43JVaVIcfApSlBnn
         zYDZdSifk17680S2Vgv5BtqnspzwBrZtRI4MYMJQYyPBHPghBtz1TlzfwKkzDrvIgZ6X
         nHme9peDjY8URHjMomWHYcrYiex+fDSX5UijmJPderFy+D3P4XLl4DoFna6xP4/fdqQU
         lrCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PKMp32y0zfJYt35nU6ZcTNEe5i66+1BZrWHoETeaUpc=;
        b=eMlNF6RsNQNWCrMYUKAKmoH4oUFZwNc6PxMCglK4yB/uKN58jz8HVsD7RNWYYa5ZKd
         D5UUF1i/BL4sNE9/HehBFLoec5neix90iYljr1GrJ+u35A2CDFyOI70cuN/QehnuAM+I
         AVkWA3avAYZqKcWz53GxJojdTvTaMX1a5t1cwlNKQUwBak1qQ98tKh/wrqws1YVIFZag
         e3BzYcd1uSiYagfcAOcq+pZBO0dLQyBmrex9F+wb2OM39nXuE/Md97Kv840xkSbZZwWw
         31B5x6+qY6bIjSvRg2vmO/Tw8gdziRgWcS+0slJeEJOGa2DCTtZfGDh72s/omD9vdj9D
         iV4A==
X-Gm-Message-State: AOAM533bPBVseiWOrPOiZ301iemNDi/PcylbrL8QkwsVVUUc7GR8MUHw
	Cm1w395xch68YKNc0TDnGy0q4/iRSMmx9qbdEH8=
X-Google-Smtp-Source: ABdhPJzyu2pFQFxp09GwDu20H7xRAJLojS59HRrzyfF40ss9wk1iEYNWNyh7Q0olXzv/OgtGX8DM913eLEhRMjp02pc=
X-Received: by 2002:a05:620a:148d:: with SMTP id w13mr11569711qkj.215.1595024211328;
 Fri, 17 Jul 2020 15:16:51 -0700 (PDT)
MIME-Version: 1.0
References: <b1d1487b-0691-3429-48dc-a3fc3345c25f@windriver.com> <89d4c21c-5ce0-3c68-3252-48c916beb140@gmail.com>
In-Reply-To: <89d4c21c-5ce0-3c68-3252-48c916beb140@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Fri, 17 Jul 2020 15:16:40 -0700
Message-ID: <CAMKF1srV-ytTj2EHK1VjEo=Qw0OOrtd7qqk6dXgYGMhGt65PPQ@mail.gmail.com>
Subject: Re: [meta-python][RFC] Organizing meta-python recipes into logical/functional groups
To: akuster808 <akuster808@gmail.com>
Cc: Trevor Gamblin <trevor.gamblin@windriver.com>, 
	openembeded-devel <openembedded-devel@lists.openembedded.org>, 
	"timothy.t.orling@intel.com" <timothy.t.orling@intel.com>
Content-Type: multipart/alternative; boundary="00000000000086414f05aaaa8386"

--00000000000086414f05aaaa8386
Content-Type: text/plain; charset="UTF-8"

On Fri, Jul 17, 2020 at 9:23 AM akuster808 <akuster808@gmail.com> wrote:

>
>
> On 7/16/20 1:39 PM, Trevor Gamblin wrote:
> > From #oe on IRC:
> >
> > <armpit> tgamblin, regarding meta-python... any thoughts of organizing
> > some  recipes into functional buckets? ie recipe-crypto
> > <armpit> rather then all under -devtools
> > <tgamblin> armpit: I think that makes sense. What do you think
> > moto-timo? What would our categories be?
> > <armpit> the last set of py packages made me think they could have
> > been categorized  into their own bucket.
> >
> > I think this is a good idea. While it isn't hard to find where a
> > particular recipe lives, it could be much better organized. We already
> > have the following in the layer:
> >
> > recipes-core
> > recipes-connectivity
> > recipes-extended
> > recipes-devtools (where most of the recipes actually are)
> >
> > Some ideas for bucket names (other suggestions are welcome):
> >
> > recipes-automation
> > recipes-crypto
> > recipes-frameworks
> > recipes-graphics
> > recipes-multimedia
> > recipes-support
> > recipes-testing
> > recipes-webdev
> >
> > Any additional thoughts on making this change?
>

This change slis good however it would be good to document the suggestions
in readme and then slowly move them


> not from me :)
> -armin
> >
> > Trevor
> >
>
>

--00000000000086414f05aaaa8386
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Fri, Jul 17, 2020 at 9:23 AM akuster808 &lt;<a href=3D"m=
ailto:akuster808@gmail.com">akuster808@gmail.com</a>&gt; wrote:<br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px =
#ccc solid;padding-left:1ex"><br>
<br>
On 7/16/20 1:39 PM, Trevor Gamblin wrote:<br>
&gt; From #oe on IRC:<br>
&gt;<br>
&gt; &lt;armpit&gt; tgamblin, regarding meta-python... any thoughts of orga=
nizing<br>
&gt; some=C2=A0 recipes into functional buckets? ie recipe-crypto<br>
&gt; &lt;armpit&gt; rather then all under -devtools<br>
&gt; &lt;tgamblin&gt; armpit: I think that makes sense. What do you think<b=
r>
&gt; moto-timo? What would our categories be?<br>
&gt; &lt;armpit&gt; the last set of py packages made me think they could ha=
ve<br>
&gt; been categorized=C2=A0 into their own bucket.<br>
&gt;<br>
&gt; I think this is a good idea. While it isn&#39;t hard to find where a<b=
r>
&gt; particular recipe lives, it could be much better organized. We already=
<br>
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
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">This change slis=
 good however it would be good to document the suggestions in readme and th=
en slowly move them=C2=A0</div><div dir=3D"auto"><br></div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;pad=
ding-left:1ex"><br>
not from me :)=C2=A0<br>
-armin<br>
&gt;<br>
&gt; Trevor<br>
&gt;<br>
<br>
</blockquote></div></div>

--00000000000086414f05aaaa8386--
