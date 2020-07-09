Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web11.157.1594313300178105547
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Jul 2020 09:48:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=d/i+izKK;
 spf=pass (domain: gmail.com, ip: 209.85.218.52, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f52.google.com with SMTP id ga4so2980521ejb.11
        for <openembedded-devel@lists.openembedded.org>; Thu, 09 Jul 2020 09:48:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=UOsskDG8ZQ6Ox3yFithuBIyYay8t5nHmeszdYweS280=;
        b=d/i+izKKrIejfAS1b8xZImcNYLQSGJJ+8BG97sf3toVoylyeYcf4oeFrIGS+jIs6+O
         /Dq1VoIL5jfSc45xu4ArWY1wRacEq/sGg9faEN6yOMa0KxQSAlrvvYjemRc9li4s/5c2
         rkQJRPMU7cTZw85Sm/icVp2DXK1Ibqqd+r0CFms3jLBNX0AczjNagEDHwi9+EjXavxD+
         pJhPQ5BGQ6FNG8cSNqkk/3S8QBkK9B4Te4Kg3Q3ijG4Xr4cbY1cQRWLBw3GNjk8VLKXK
         INmu/F2bXla0/1A1IQJ+2xc8/UKK5hK7be/ZGYrrVGxR6EKAb1PXmKWHAzxzSKRRpf3b
         cXRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UOsskDG8ZQ6Ox3yFithuBIyYay8t5nHmeszdYweS280=;
        b=TSEcwCxqFCMiLC3RviqP+aRAc1VSgCaXvCtCWC8jEsqRmMnSfsUMRyVF8eNKUsaRbO
         V/dcXDgQ5ekLrNDWgKpgav5w7zaJjF+AqwFT7eA83ishh7l4rcMWVJCdKXPpEfrkGjTS
         vkC3OeORg4pN409Ax1JHDQ+j2RBJQV1muU/UijZOtvOpvB+KyC8lP48w43a4KUZb5HJw
         FQBO2LLxaPM4YnwxrA1zFmcewA2DTklaaeRyybam3Vff33GveSiKhUs9JGd9SSOKz1gx
         eSWuwiceNnvJcsgneF3GFTHKRdo8iHpoTDJQQFDyLNpmzQeJgc1NPzk7aJdpITcM28zB
         VMbg==
X-Gm-Message-State: AOAM533e7492N+NwpzXBTqNZDToqAM8znXsK1rrDmayYlgsbYnYOVDUQ
	EagcQ+HONRVlOHViHgX7VmScDNhSenfgQ7x5c3I=
X-Google-Smtp-Source: ABdhPJws/3AnPluxfNLH6f/QZR1xpDsgnZBVrnxAOAPYVJ6Fplt6JhgkBLU2wlTYID/IQz4oRRSZQJUbohG4mNp53pg=
X-Received: by 2002:a17:906:940f:: with SMTP id q15mr58643116ejx.470.1594313298617;
 Thu, 09 Jul 2020 09:48:18 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1593561840.git.akuster808@gmail.com> <fc1b28e574a01410f082034c1f8212139b6107e1.1593561840.git.akuster808@gmail.com>
 <CA+chaQc92KeJnoG+NPi6EvKMHNnLCbN8AFPS9Usdc1S1WNHu9A@mail.gmail.com> <24a9b660-a636-a614-4e5c-62bc9782ade3@gmail.com>
In-Reply-To: <24a9b660-a636-a614-4e5c-62bc9782ade3@gmail.com>
From: "Martin Jansa" <Martin.Jansa@gmail.com>
Date: Thu, 9 Jul 2020 18:48:07 +0200
Message-ID: <CA+chaQen7fpxTQ2eT933-5pZjsSpT0pJhciP2UY8V5rwe-6X1w@mail.gmail.com>
Subject: Re: [oe] [dunfel 03/32] jsoncpp: upgrade 1.9.2 -> 1.9.3
To: akuster808 <akuster808@gmail.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000d32b5805aa04fde8"

--000000000000d32b5805aa04fde8
Content-Type: text/plain; charset="UTF-8"

I don't have a strong opinion about this one.

It's easy enough to undo by downstream layers if they care about ABI.

At LGE we do have some prebuilt binaries which use jsoncpp, so we do care,
but haven't updated to dunfell yet and when we do get those prebuilt
binaries to be rebuilt, we might as well use newer jsoncpp (and in that
case might backport this upgrade anyway even if it gets reverted in
dunfell).

Maybe someone else will share an opinion on this as well.

On Thu, Jul 9, 2020 at 6:06 PM akuster808 <akuster808@gmail.com> wrote:

>
>
> On 7/9/20 8:21 AM, Martin Jansa wrote:
>
> FYI this "small" upgrade changes ABI version from libjsoncpp22
> to libjsoncpp24 which might cause some issues to people who expect
> relatively stable ABIs in LTS dunfell.
>
>
> Well that is not good. I did look at the details but apparently I failed
> to catch the "soversion" change.
>
> Would you recommend reverting this?
>
> -armin
>
>
> On Wed, Jul 1, 2020 at 2:07 AM akuster <akuster808@gmail.com> wrote:
>
>> From: Pierre-Jean Texier <pjtexier@koncepto.io>
>>
>> See full changelog
>> https://github.com/open-source-parsers/jsoncpp/releases/tag/1.9.3
>>
>> Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> (cherry picked from commit 65e124eef373680726ac045677cbec7d9080a289)
>> Signed-off-by: Armin Kuster <akuster808@gmail.com>
>> ---
>>  .../jsoncpp/{jsoncpp_1.9.2.bb => jsoncpp_1.9.3.bb}              | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>  rename meta-oe/recipes-devtools/jsoncpp/{jsoncpp_1.9.2.bb =>
>> jsoncpp_1.9.3.bb} (93%)
>>
>> diff --git a/meta-oe/recipes-devtools/jsoncpp/jsoncpp_1.9.2.bb
>> b/meta-oe/recipes-devtools/jsoncpp/jsoncpp_1.9.3.bb
>> similarity index 93%
>> rename from meta-oe/recipes-devtools/jsoncpp/jsoncpp_1.9.2.bb
>> rename to meta-oe/recipes-devtools/jsoncpp/jsoncpp_1.9.3.bb
>> index a88410f2ff..97c6361ad8 100644
>> --- a/meta-oe/recipes-devtools/jsoncpp/jsoncpp_1.9.2.bb
>> +++ b/meta-oe/recipes-devtools/jsoncpp/jsoncpp_1.9.3.bb
>> @@ -11,7 +11,7 @@ SECTION = "libs"
>>  LICENSE = "MIT"
>>  LIC_FILES_CHKSUM = "file://LICENSE;md5=fa2a23dd1dc6c139f35105379d76df2b"
>>
>> -SRCREV = "d2e6a971f4544c55b8e3b25cf96db266971b778f"
>> +SRCREV = "6aba23f4a8628d599a9ef7fa4811c4ff6e4070e2"
>>  SRC_URI = "git://github.com/open-source-parsers/jsoncpp"
>>
>>  S = "${WORKDIR}/git"
>> --
>> 2.17.1
>>
>> 
>>
>
>

--000000000000d32b5805aa04fde8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I don&#39;t have a strong opinion about this one.<div><br>=
</div><div>It&#39;s easy enough to undo by downstream layers if they care a=
bout ABI.</div><div><br></div><div>At LGE we do have some prebuilt binaries=
 which use jsoncpp, so we do care, but haven&#39;t updated to dunfell yet a=
nd when we do get those prebuilt binaries to be rebuilt, we might as well u=
se newer jsoncpp (and in that case might backport this upgrade anyway even =
if it gets reverted in dunfell).</div><div><br></div><div>Maybe someone els=
e will share an opinion=C2=A0on this as well.</div></div><br><div class=3D"=
gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jul 9, 2020 at 6=
:06 PM akuster808 &lt;<a href=3D"mailto:akuster808@gmail.com">akuster808@gm=
ail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">
  
    
  
  <div>
    <br>
    <br>
    <div>On 7/9/20 8:21 AM, Martin Jansa wrote:<br>
    </div>
    <blockquote type=3D"cite">
      
      <div dir=3D"ltr">FYI this &quot;small&quot; upgrade changes ABI vers=
ion
        from=C2=A0libjsoncpp22 to=C2=A0libjsoncpp24 which might cause some=
 issues
        to people who expect relatively stable ABIs in LTS dunfell.</div>
    </blockquote>
    <br>
    Well that is not good. I did look at the details but apparently I
    failed to catch the &quot;soversion&quot; change.<br>
    <br>
    Would you recommend reverting this?<br>
    <br>
    -armin<br>
    <blockquote type=3D"cite"><br>
      <div class=3D"gmail_quote">
        <div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jul 1, 2020 at 2:07 =
AM
          akuster &lt;<a href=3D"mailto:akuster808@gmail.com" target=3D"_b=
lank">akuster808@gmail.com</a>&gt; wrote:<br>
        </div>
        <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">From:
          Pierre-Jean Texier &lt;<a href=3D"mailto:pjtexier@koncepto.io" t=
arget=3D"_blank">pjtexier@koncepto.io</a>&gt;<br>
          <br>
          See full changelog <a href=3D"https://github.com/open-source-par=
sers/jsoncpp/releases/tag/1.9.3" rel=3D"noreferrer" target=3D"_blank">https=
://github.com/open-source-parsers/jsoncpp/releases/tag/1.9.3</a><br>
          <br>
          Signed-off-by: Pierre-Jean Texier &lt;<a href=3D"mailto:pjtexier=
@koncepto.io" target=3D"_blank">pjtexier@koncepto.io</a>&gt;<br>
          Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com=
" target=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
          (cherry picked from commit
          65e124eef373680726ac045677cbec7d9080a289)<br>
          Signed-off-by: Armin Kuster &lt;<a href=3D"mailto:akuster808@gma=
il.com" target=3D"_blank">akuster808@gmail.com</a>&gt;<br>
          ---<br>
          =C2=A0.../jsoncpp/{<a href=3D"http://jsoncpp_1.9.2.bb" rel=3D"no=
referrer" target=3D"_blank">jsoncpp_1.9.2.bb</a>
          =3D&gt; <a href=3D"http://jsoncpp_1.9.3.bb" rel=3D"noreferrer" t=
arget=3D"_blank">jsoncpp_1.9.3.bb</a>}=C2=A0
          =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
          =C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
          =C2=A0rename meta-oe/recipes-devtools/jsoncpp/{<a href=3D"http:/=
/jsoncpp_1.9.2.bb" rel=3D"noreferrer" target=3D"_blank">jsoncpp_1.9.2.bb</a=
>
          =3D&gt; <a href=3D"http://jsoncpp_1.9.3.bb" rel=3D"noreferrer" t=
arget=3D"_blank">jsoncpp_1.9.3.bb</a>}
          (93%)<br>
          <br>
          diff --git a/meta-oe/recipes-devtools/jsoncpp/<a href=3D"http://=
jsoncpp_1.9.2.bb" rel=3D"noreferrer" target=3D"_blank">jsoncpp_1.9.2.bb</a>
          b/meta-oe/recipes-devtools/jsoncpp/<a href=3D"http://jsoncpp_1.9=
.3.bb" rel=3D"noreferrer" target=3D"_blank">jsoncpp_1.9.3.bb</a><br>
          similarity index 93%<br>
          rename from meta-oe/recipes-devtools/jsoncpp/<a href=3D"http://j=
soncpp_1.9.2.bb" rel=3D"noreferrer" target=3D"_blank">jsoncpp_1.9.2.bb</a><=
br>
          rename to meta-oe/recipes-devtools/jsoncpp/<a href=3D"http://jso=
ncpp_1.9.3.bb" rel=3D"noreferrer" target=3D"_blank">jsoncpp_1.9.3.bb</a><br=
>
          index a88410f2ff..97c6361ad8 100644<br>
          --- a/meta-oe/recipes-devtools/jsoncpp/<a href=3D"http://jsoncpp=
_1.9.2.bb" rel=3D"noreferrer" target=3D"_blank">jsoncpp_1.9.2.bb</a><br>
          +++ b/meta-oe/recipes-devtools/jsoncpp/<a href=3D"http://jsoncpp=
_1.9.3.bb" rel=3D"noreferrer" target=3D"_blank">jsoncpp_1.9.3.bb</a><br>
          @@ -11,7 +11,7 @@ SECTION =3D &quot;libs&quot;<br>
          =C2=A0LICENSE =3D &quot;MIT&quot;<br>
          =C2=A0LIC_FILES_CHKSUM =3D
          <a>&quot;file://LICENSE;md5=3Dfa2a23dd1dc6c139f35105379d76df2b&q=
uot;</a><br>
          <br>
          -SRCREV =3D &quot;d2e6a971f4544c55b8e3b25cf96db266971b778f&quot;=
<br>
          +SRCREV =3D &quot;6aba23f4a8628d599a9ef7fa4811c4ff6e4070e2&quot;=
<br>
          =C2=A0SRC_URI =3D &quot;git://<a href=3D"http://github.com/open-=
source-parsers/jsoncpp" rel=3D"noreferrer" target=3D"_blank">github.com/ope=
n-source-parsers/jsoncpp</a>&quot;<br>
          <br>
          =C2=A0S =3D &quot;${WORKDIR}/git&quot;<br>
          -- <br>
          2.17.1<br>
          <br>
          <br>
        </blockquote>
      </div>
    </blockquote>
    <br>
  </div>

</blockquote></div>

--000000000000d32b5805aa04fde8--
