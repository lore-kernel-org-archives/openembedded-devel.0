Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6281CD3436
	for <webhook@archiver.kernel.org>; Fri,  8 May 2026 14:49:16 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.111.1778251748509531791
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 08 May 2026 07:49:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=PMCRCdxH;
 spf=pass (domain: gmail.com, ip: 209.85.218.53, mailfrom: quaresma.jose@gmail.com)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-ba7a1cc0380so370245066b.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 08 May 2026 07:49:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778251747; cv=none;
        d=google.com; s=arc-20240605;
        b=An6B8aoULMbS1GJJbenpcWak9hN2cFAckV1B4l+V1qasCwBNmQWtvWmqe8M9DiTiTG
         1E32G3hMigU38ye50keQIuIPi5RMleSBOchGgcMz3npA6fd/czy0sQMoqOG8u4mPS5mB
         hzF9AqR9L7+uDYjNVCuTTybj1mfBGMFNQF3+xmVxO4ANKL4nJzuy/IDSGj3+d1wofIzF
         OzfHc0qakKcoLuulrPbuBvqOf4Y4C2bXHv01x8voO0ORfVML3TDMVYwEz9FukA6E1SFt
         8Ab8Elc5Jcuyitn9wudFBVhsXQiNf3b4khJ/+96DeVn5GqzdFjDr4t7LqK7om4ZY3uaz
         34SA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=HtFr2mHIyDzP5yiGHvKDaX0VvK9MzDoTIBRJbS7TbOQ=;
        fh=UPRPs2VgNClpU9dPk8hoVbj3nn0ZDu7crJEkYkfxoIY=;
        b=Cprd1R8/yeRVTyAvyyWa94SWrKO/4lBopd8/FvNqPX5YuJQYtmmD20FDCNl+p8hbfy
         wFEV/8LQ3+DpIv1o1EUGh7w8e2j3hrHimz2ta0phKWlvKwMTK3UwWm4acuDPCJp6aI9S
         8vfH2Dm8Xrbw3W5oEWCUoJ2JifSKZCFirUNmODYFmpllrJT4ubT6r0ZE95zt3LFM/ehV
         4ZqB4LHQX0m+yBLi0r1OjpyyortbYU4Gyw7BM6Bzfi2Iw9MXfBhJs/dj+rqAR/vFo1UU
         Qwp748jGrfWlyT9MR1pRFXaLvUkZ4HZYxtVC9cGTItsNcqNDUjFV7iTG4HJXiaMREGMB
         NFnA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778251747; x=1778856547; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HtFr2mHIyDzP5yiGHvKDaX0VvK9MzDoTIBRJbS7TbOQ=;
        b=PMCRCdxHT9AcHFXesHoiZE9Xoeq2iIIkGErDHdOQNBv4juhegWvQiH29q+qN03CQXO
         gwIaXVXO0n2ywBncRPKOHZtP5h0NDXBsU9A5UEJkROhy4S+eE38RknuIsk/0K+YL8zxZ
         5vyrwWbh7cQo82R4Z4MJMqxp6gshg1kxsGsRwtllkqWRoslhuFiaob57eKjycv5mOzjm
         IwxLq8Hgr0pbJsjGLQUR4WPb7DBdwmABhmXLyeoUfpP6i/sX2VwiPA9u8uCj2eqGITd8
         pbwbdmX0hezVt6+yPqHIYKipE3UFRojO8j59gSIbgKYAwfz7FIYy+yG3XYRB85NBJG4k
         LHJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778251747; x=1778856547;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HtFr2mHIyDzP5yiGHvKDaX0VvK9MzDoTIBRJbS7TbOQ=;
        b=Z7VF24fUfvzpe3Hv2aOPhnJHOCJm5S3CFumahZkdaCOdvgLJ0d6hq42IC0dpx6qWAW
         37oCxJ2ZqcXM3pCP+ShC+WCggs9hVhu8Itg4aZ0+QqLBiPrKkDFFgFFIJLEc9Z82m8zW
         XNqrT4mgeAbkw/SlVHF0S9XHSNUDM4/NV2Skt7tm02MpSZSidWVoSnB55HASDcJMowx2
         0pliMHd06XQJOuZLuqtZcyoelW5BfH+2kkMd4Un5T+sLEfxevYk8KwUm4NDi+qUaNbG2
         5r/A39f16qFBaqN1HbqQuoXRwhqdWe/y8cz9re2Lr8Vv0uC6bn3kRaBD8ZxJ6GK9Z9FF
         bAmw==
X-Forwarded-Encrypted: i=1; AFNElJ/KjDmHUd+4BvDL5XFGMQcWJ0hviA/LXeXxFsvTvfMcMZGzKAuqB03tpW+vcd3C3P2x/YGDlJeLBLCOtro5/6JY56g=@lists.openembedded.org
X-Gm-Message-State: AOJu0Ywkmz1Erc2iS4VlzhaEMaICspAUs74ldA2iCHOd/xTu3ds96X4O
	kiXpWsEBbiGe/Y+MXCvEkKWiOhAksrmemAhwcGG6g3l7DO02kaZvcGqqDF+ue4AngZWJ3+gDAoC
	BTSlHJk44zfmmLEOyxZUnNOBpWcy0iL6ZdWlJ
X-Gm-Gg: Acq92OF1S7NFqUkjJOr0NXnPIF8JjBJukAOSk7RKrTNGON06FvnzgoM1Gauq0dF6z05
	jHUmqU9s969AYTzOSvMt6Dtl4xrje9bSGe/zhPCYrd2cL6qIefh++mkJxvusYfjYn7/Dn2xD3J8
	nRZyDguA7MJzHhwvxRZO2GmfOqU0f+BnlBp1r8NCASaua0/tyEHI+i1kW+M+m+l+c8NSsc5Rx3d
	jvlylh4geizb/wvN8GALD4Pdqe8B59OGKETHs3NSqosV/MuLHEvrICHCX8i4Exthyyybn6bnUXH
	+wUdyN55xN4JAfY96aYixnOVaqNsekOcGBXK3J/SMuBjx22c+ZgBfstuXD0V4jB1/43xfnxK+8r
	THfFVi0qQNI6Z70k=
X-Received: by 2002:a17:907:98d:b0:bc3:6b0e:1686 with SMTP id
 a640c23a62f3a-bc56f30a6bemr736145466b.37.1778251746631; Fri, 08 May 2026
 07:49:06 -0700 (PDT)
MIME-Version: 1.0
References: <20260506-bash-rr-v1-1-507ee57b7fe7@non.se.com>
 <4464a296-b5ef-46e4-a87d-90e9fcb29da3@gmail.com> <CANPvuRn42dyFcaDOhvjTQMkEEyumqaJ1YW3z7D=C_pviKAH_sQ@mail.gmail.com>
 <801db7e6-604a-4965-a984-d3d2e5dce18d@semalibre.com>
In-Reply-To: <801db7e6-604a-4965-a984-d3d2e5dce18d@semalibre.com>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Fri, 8 May 2026 15:48:55 +0100
X-Gm-Features: AVHnY4JCL6B74daPn7a3UxsP1ZklUnw9xapHoq0aDrdGKt7u4B1Mc8MMOXw0_qA
Message-ID: <CANPvuRn70QogSDqbWaYnUr_+27VB9u1V0_ubQKe6+ZSRUT=NJQ@mail.gmail.com>
Subject: Re: [oe] [meta-networking][PATCH] openvpn: change bash rdepends to rrecommends
To: Louis Rannou <louis.rannou@semalibre.com>
Cc: skandigraun@gmail.com, openembedded-devel@lists.openembedded.org, 
	Louis Rannou <louis.rannou@non.se.com>, pascal.eberhard@se.com
Content-Type: multipart/alternative; boundary="000000000000ade7bd06514f7fa2"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 08 May 2026 14:49:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126827

--000000000000ade7bd06514f7fa2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Louis,

Louis Rannou <louis.rannou@semalibre.com> escreveu (quinta, 7/05/2026 =C3=
=A0(s)
15:50):

>
>
> On 5/7/26 10:46, Jose Quaresma wrote:
>
>
>
> Gyorgy Sarvari via lists.openembedded.org <skandigraun=3D
> gmail.com@lists.openembedded.org> escreveu (quinta, 7/05/2026 =C3=A0(s) 0=
8:39):
>
>>
>> On 5/6/26 18:07, Louis Rannou via lists.openembedded.org wrote:
>> > From: Louis Rannou <louis.rannou@non.se.com>
>> >
>> > The dependency to bash is only required for dns-updown scripts. As bas=
h
>> is
>> > under the GPLv3 license, it might be preferred to exclude it.
>> >
>> > Signed-off-by: Louis Rannou <louis.rannou@non.se.com>
>> > ---
>> >  meta-networking/recipes-support/openvpn/openvpn_2.7.0.bb | 2 +-
>> >  1 file changed, 1 insertion(+), 1 deletion(-)
>> >
>> > diff --git a/meta-networking/recipes-support/openvpn/openvpn_2.7.0.bb
>> b/meta-networking/recipes-support/openvpn/openvpn_2.7.0.bb
>> > index 0cbe4641cd..d967a0dc12 100644
>> > --- a/meta-networking/recipes-support/openvpn/openvpn_2.7.0.bb
>> > +++ b/meta-networking/recipes-support/openvpn/openvpn_2.7.0.bb
>> > @@ -47,7 +47,7 @@ PACKAGECONFIG[iproute2] =3D
>> "--enable-iproute2,,iproute2,iproute2-ip"
>> >  PACKAGECONFIG[systemd] =3D "--enable-systemd,--disable-systemd,system=
d"
>> >  PACKAGECONFIG[selinux] =3D
>> "--enable-selinux,--disable-selinux,libselinux"
>> >
>> > -RDEPENDS:${PN}:append =3D " bash"
>> > +RRECOMMENDS:${PN}:append =3D " bash"
>>
>>
>> In case bash is excluded (with PACKAGE_EXCLUDE, INCOMPATIBLE_LICENSE,
>> BAD_RECOMMENDATIONS...) I would expect this change to throw an error
>> still, the latest during package QA, when it scans the scripts for
>> missing dependencies - because the dependency itself is still present.
>> Does it not fail those checks?
>>
> That is correct. The check fails, I ignore how I missed that.
>
>
>> As an alternative, I wonder if it would make sense to install this
>> dns-updown script to a separate package, and make that depend on bash
>> only.
>>
>
> A new package would be more appropriate.
> On the other hand, is bash really necessary? Sometimes it's just shaband
> that's wrong on script
> and POSIx /bin/sh can even be used. Could you try this?
>
> That was also my first thought. The scripts are not POSIX compliant
> unfortunately. It's quite sad as all older scripts used to be.
>
> I'll send a v2 with a package openvpn-dns-updown. Do you think I should
> add a rdepends between openvpn and this ? My first guess would be to not
> take the dependency as the dns-updown scripts are recent.
>

I think we can ignore it for now, and in the meantime, who knows, maybe
someone will port the
script to posix and the package won't be necessary in future versions.

Jose


>
> Louis
>


--=20
Best regards,

Jos=C3=A9 Quaresma

--000000000000ade7bd06514f7fa2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Louis,</div><br><div class=3D"gmail_quote gmail_qu=
ote_container"><div dir=3D"ltr" class=3D"gmail_attr">Louis Rannou &lt;<a hr=
ef=3D"mailto:louis.rannou@semalibre.com">louis.rannou@semalibre.com</a>&gt;=
 escreveu (quinta, 7/05/2026 =C3=A0(s) 15:50):<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex"><u></u>

 =20
   =20
 =20
  <div>
    <br>
    <br>
    <div>On 5/7/26 10:46, Jose Quaresma wrote:<br>
    </div>
    <blockquote type=3D"cite">
      <div dir=3D"ltr">
        <div dir=3D"ltr"><br>
        </div>
        <br>
        <div class=3D"gmail_quote">
          <div dir=3D"ltr" class=3D"gmail_attr">Gyorgy Sarvari via <a href=
=3D"http://lists.openembedded.org" target=3D"_blank">lists.openembedded.org=
</a>
            &lt;skandigraun=3D<a href=3D"mailto:gmail.com@lists.openembedde=
d.org" target=3D"_blank">gmail.com@lists.openembedded.org</a>&gt;
            escreveu (quinta, 7/05/2026 =C3=A0(s) 08:39):<br>
          </div>
          <blockquote class=3D"gmail_quote"><br>
            On 5/6/26 18:07, Louis Rannou via <a href=3D"http://lists.opene=
mbedded.org" rel=3D"noreferrer" target=3D"_blank">lists.openembedded.org</a=
>
            wrote:<br>
            &gt; From: Louis Rannou &lt;<a href=3D"mailto:louis.rannou@non.=
se.com" target=3D"_blank">louis.rannou@non.se.com</a>&gt;<br>
            &gt; <br>
            &gt; The dependency to bash is only required for dns-updown
            scripts. As bash is<br>
            &gt; under the GPLv3 license, it might be preferred to
            exclude it.<br>
            &gt; <br>
            &gt; Signed-off-by: Louis Rannou &lt;<a href=3D"mailto:louis.ra=
nnou@non.se.com" target=3D"_blank">louis.rannou@non.se.com</a>&gt;<br>
            &gt; ---<br>
            &gt;=C2=A0 meta-networking/recipes-support/openvpn/<a href=3D"h=
ttp://openvpn_2.7.0.bb" rel=3D"noreferrer" target=3D"_blank">openvpn_2.7.0.=
bb</a>
            | 2 +-<br>
            &gt;=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
            &gt; <br>
            &gt; diff --git a/meta-networking/recipes-support/openvpn/<a hr=
ef=3D"http://openvpn_2.7.0.bb" rel=3D"noreferrer" target=3D"_blank">openvpn=
_2.7.0.bb</a>
            b/meta-networking/recipes-support/openvpn/<a href=3D"http://ope=
nvpn_2.7.0.bb" rel=3D"noreferrer" target=3D"_blank">openvpn_2.7.0.bb</a><br=
>
            &gt; index 0cbe4641cd..d967a0dc12 100644<br>
            &gt; --- a/meta-networking/recipes-support/openvpn/<a href=3D"h=
ttp://openvpn_2.7.0.bb" rel=3D"noreferrer" target=3D"_blank">openvpn_2.7.0.=
bb</a><br>
            &gt; +++ b/meta-networking/recipes-support/openvpn/<a href=3D"h=
ttp://openvpn_2.7.0.bb" rel=3D"noreferrer" target=3D"_blank">openvpn_2.7.0.=
bb</a><br>
            &gt; @@ -47,7 +47,7 @@ PACKAGECONFIG[iproute2] =3D
            &quot;--enable-iproute2,,iproute2,iproute2-ip&quot;<br>
            &gt;=C2=A0 PACKAGECONFIG[systemd] =3D
            &quot;--enable-systemd,--disable-systemd,systemd&quot;<br>
            &gt;=C2=A0 PACKAGECONFIG[selinux] =3D
            &quot;--enable-selinux,--disable-selinux,libselinux&quot;<br>
            &gt;=C2=A0 <br>
            &gt; -RDEPENDS:${PN}:append =3D &quot; bash&quot;<br>
            &gt; +RRECOMMENDS:${PN}:append =3D &quot; bash&quot;<br>
            <br>
            <br>
            In case bash is excluded (with PACKAGE_EXCLUDE,
            INCOMPATIBLE_LICENSE,<br>
            BAD_RECOMMENDATIONS...) I would expect this change to throw
            an error<br>
            still, the latest during package QA, when it scans the
            scripts for<br>
            missing dependencies - because the dependency itself is
            still present.<br>
            Does it not fail those checks?<br>
          </blockquote>
        </div>
      </div>
    </blockquote>
    That is correct. The check fails, I ignore how I missed that.=C2=A0<br>
    <br>
    <blockquote type=3D"cite">
      <div dir=3D"ltr">
        <div class=3D"gmail_quote">
          <blockquote class=3D"gmail_quote"><br>
            As an alternative, I wonder if it would make sense to
            install this<br>
            dns-updown script to a separate package, and make that
            depend on bash only.<br>
          </blockquote>
          <div><br>
          </div>
          <div>A new package would be more appropriate.</div>
          <div>On the other hand, is bash really necessary? Sometimes
            it&#39;s just shaband that&#39;s wrong on script</div>
          <div>and POSIx /bin/sh can even be used.=C2=A0Could you try this?=
</div>
        </div>
      </div>
    </blockquote>
    That was also my first thought. The scripts are not POSIX compliant
    unfortunately. It&#39;s quite sad as all older scripts used to be.<br>
    <br>
    I&#39;ll send a v2 with a package openvpn-dns-updown. Do you think I
    should add a rdepends between openvpn and this ? My first guess
    would be to not take the dependency as the dns-updown scripts are
    recent.<br></div></blockquote><div><br></div><div>I think we can ignore=
 it for now, and in the meantime, who knows, maybe someone will port the</d=
iv><div>script to posix and the package won&#39;t be necessary in future ve=
rsions.</div><div><br></div><div>Jose=C2=A0</div><div>=C2=A0</div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex"><div>
    <br>
    Louis
  </div>

</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature"><div dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</div></=
div></div></div>

--000000000000ade7bd06514f7fa2--

