Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 912BBC433F5
	for <webhook@archiver.kernel.org>; Sun, 23 Jan 2022 13:00:43 +0000 (UTC)
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com
 [209.85.221.180])
 by mx.groups.io with SMTP id smtpd.web08.9166.1642942842130259606
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 23 Jan 2022 05:00:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=KwaCNli5;
 spf=pass (domain: gmail.com, ip: 209.85.221.180,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-vk1-f180.google.com with SMTP id w17so4346590vko.9
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 23 Jan 2022 05:00:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=gRqLpWf4es+Rmq2mgo96mgCO9tIfsdWRhE/eAW5WMXE=;
        b=KwaCNli5VGIqQSUwz6iP0Guy8qGJONbFF1sDp4AhfdOQXMyJlmIYaYCczs9nYL+m5r
         is96wZn3/2NYUjmRg9novWcjFsd6ntHRsYJgNd+bZ9cIEbNaF5Lc/QQLDcpaCvpDJQrG
         HbOawTq1GkbN4+XoK10NCa0wjc/H6CNr/b53vAu64b0fLqtZq2iG2l54OIC5FRAO9Oxd
         W2xW1I6lcHQ/HOv/dWLyKFeEIhzWQirQPs/2HweE8NShSqI6rZhHfy3klhC8PFa8yft+
         DP3A/TyYc90NU4AxOfDd9piNAOP8qEznJnflvGIaW4baNhLzkmGayeUJQfkCzzU0VC9z
         oY/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gRqLpWf4es+Rmq2mgo96mgCO9tIfsdWRhE/eAW5WMXE=;
        b=PKvcNjQOjN18YDO/zMqNcULXwu69gnsQ+QrquLNcI2UETUhWlvIvhHmykAsnlLoYQU
         SDkUkCq1PQxxnhuxyR7AqLhuKBtz+lCcOQ7Czgl4o/jU3WLWqyOe7P4LWFgDQV1rtxlP
         XF41JBiaVXCMkdzfBqHNCbq/4PNOAdCZjw6w8fAE4Ug5AWfXEp7ShxTcZodmKTrRNhDW
         JQE2TK+5bqWkQn6woE1yhHAdFWTxzfpKRbcyRyZzUd4Ij666gMKniH6YcSgqNC3KcMWR
         QUg+gVLHL8rWc+IxT9YtaIuA6thH3aeCJ/B4sduH9DkAp1nnh3NrxIYFEiDV1q3ofCyO
         tXtA==
X-Gm-Message-State: AOAM533m6NvkojwPA5oUtP5hDdtbMpJ1kaxQstSqMKnL8vpGRwkU+8w5
	8m7/1QrmBG4OK3MDsw1Vq+F/NJ2zBPdSzV0MKM4=
X-Google-Smtp-Source: 
 ABdhPJwVA1G8hdPnIg2F681z1OeJEtO/7kdYAOWCivBhHQwZJol0UwGqPKf6VdeUNND23hDudi6RNOG5OgmkwJvkBvM=
X-Received: by 2002:a1f:94d7:: with SMTP id w206mr830235vkd.1.1642942841144;
 Sun, 23 Jan 2022 05:00:41 -0800 (PST)
MIME-Version: 1.0
References: <20220120203602.3833757-1-f_l_k@t-online.de>
 <33c62297-f753-3c63-d409-d6ed774ace94@t-online.de>
 <CANNYZj9V_6q9S-vovMMw7i3GdJjog==9EXDCJ_+SMnknCNxHuQ@mail.gmail.com>
 <baeb1c77-f334-2282-3a40-19916962332d@t-online.de>
In-Reply-To: <baeb1c77-f334-2282-3a40-19916962332d@t-online.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sun, 23 Jan 2022 14:00:28 +0100
Message-ID: 
 <CANNYZj-0DoW9ehFHpPML2hT-rKBHju3B41j24sA=PAKkXVpNOw@mail.gmail.com>
Subject: Re: [oe] [meta-gnome][PATCHv2] folks: initial add recipe
To: Markus Volk <f_l_k@t-online.de>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000006ec8aa05d63f703d"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 23 Jan 2022 13:00:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95017

--0000000000006ec8aa05d63f703d
Content-Type: text/plain; charset="UTF-8"

You need to add a patch that guards introspection with a meson option,
submit the patch upstream, and then add the patch to the recipe, with a
link (in the patch file) to the upstream submission.

Alex

On Sun, 23 Jan 2022 at 13:14, Markus Volk <f_l_k@t-online.de> wrote:

> yes, but folks is one of that gnome projects that made introspection
> mandatory. I can't find an option to disable it with the meson buildsystem:
>
> https://gitlab.gnome.org/GNOME/folks/-/blob/master/meson_options.txt
>
> So i'm really unsure what to do here.
>
> But i have added some more usable PACKAGECONFIG options and sent a patchv3
> Am 22.01.22 um 20:54 schrieb Alexander Kanavin:
>
> Gobject introspection is inherently hostile to cross compilation
> environments as it requires running a cross-compiled binary with the qemu
> emulator. That does not always work, and if it does not, your build will
> break. So there must be a way to turn it off when it happens.
>
> Alex
>
> On Sat, 22 Jan 2022 at 20:29, Markus Volk <f_l_k@t-online.de> wrote:
>
>> I tried to make the 'folks' backends buildable and it turned out, that
>> there are some more places where vala introspection is missing.
>>
>>
>> https://github.com/openembedded/meta-openembedded/blob/461c04657c3151629b503fe134e9d672520aacbb/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server.bb#L34
>>
>>
>> https://github.com/openembedded/meta-openembedded/blob/566049b4f1ddc049c1f89a5838d1a71bb429faa3/meta-oe/recipes-connectivity/telepathy/telepathy-glib_0.24.1.bb#L17
>>
>>
>> Most gnome projects meanwhile make gobject-introspection mandatory and i
>> can really feel why they are doing so for two important reasons.
>>
>> First it is just mandatory if you want to be able to build the whole
>> gnome universe and second it is in my option one of the greatest
>> features of gtk to be able to write code for it in almost every language
>> available. This should not be an optional feature so people could rely
>> on it.
>>
>> In both recipes introspection is disabled by default and dependent on
>> 'GI_DATA_ENABLED=true'. Wouldn't it be a good idea to just enable
>> Introspection by default? We already inherit gobject-introspection anyway.
>>
>> There are also some more issues in libgdata and libical with
>> introspection i was able to fix locally. Will send patches for it if
>> it'll be ok making introspection mandatory.
>>
>> Am 20.01.22 um 21:36 schrieb Markus Volk:
>> > Signed-off-by: Markus Volk <f_l_k@t-online.de>
>> > ---
>> >   .../folks/folks_0.15.4.bb                     | 24
>> +++++++++++++++++++
>> >   1 file changed, 24 insertions(+)
>> >   create mode 100644 meta-gnome/recipes-connectivity/folks/
>> folks_0.15.4.bb
>> >
>> > diff --git a/meta-gnome/recipes-connectivity/folks/folks_0.15.4.bb
>> b/meta-gnome/recipes-connectivity/folks/folks_0.15.4.bb
>> > new file mode 100644
>> > index 000000000..b4ca551c8
>> > --- /dev/null
>> > +++ b/meta-gnome/recipes-connectivity/folks/folks_0.15.4.bb
>> > @@ -0,0 +1,24 @@
>> > +SUMMARY = "Folks is a contact aggregation library."
>> > +LICENSE = "LGPLv2.1"
>> > +LIC_FILES_CHKSUM =
>> "file://COPYING;md5=2d5025d4aa3495befef8f17206a5b0a1"
>> > +
>> > +DEPENDS = " \
>> > +    glib-2.0 \
>> > +    libgee \
>> > +    libxml2 \
>> > +    dbus-glib \
>> > +    telepathy-glib \
>> > +"
>> > +
>> > +GNOMEBASEBUILDCLASS = "meson"
>> > +
>> > +# gobject-introspection is mandatory and cannot be configured
>> > +REQUIRED_DISTRO_FEATURES = "gobject-introspection-data"
>> > +GIR_MESON_OPTION = ""
>> > +
>> > +EXTRA_OEMESON = "-Deds_backend=false -Dbluez_backend=false
>> -Dofono_backend=false -Dtelepathy_backend=false"
>> > +
>> > +inherit gnomebase gettext gobject-introspection vala features_check
>> > +
>> > +SRC_URI[archive.sha256sum] =
>> "e71099afc9e88fad4e757ae134bc3fd63e12b901ad62b0ed5536afb79124af5f"
>> > +
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#95004):
>> https://lists.openembedded.org/g/openembedded-devel/message/95004
>> Mute This Topic: https://lists.openembedded.org/mt/88611345/1686489
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
>> alex.kanavin@gmail.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>
>>

--0000000000006ec8aa05d63f703d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>You need to add a patch that guards introspection wit=
h a meson option, submit the patch upstream, and then add the patch to the =
recipe, with a link (in the patch file) to the upstream submission.</div><d=
iv><br></div><div>Alex<br></div></div><br><div class=3D"gmail_quote"><div d=
ir=3D"ltr" class=3D"gmail_attr">On Sun, 23 Jan 2022 at 13:14, Markus Volk &=
lt;<a href=3D"mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt; wrote:<br=
></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;=
border-left:1px solid rgb(204,204,204);padding-left:1ex">
 =20
   =20
 =20
  <div>
    <p>yes, but folks is one of that gnome projects that made
      introspection mandatory. I can&#39;t find an option to disable it wit=
h
      the meson buildsystem:</p>
    <p><a href=3D"https://gitlab.gnome.org/GNOME/folks/-/blob/master/meson_=
options.txt" target=3D"_blank">https://gitlab.gnome.org/GNOME/folks/-/blob/=
master/meson_options.txt</a></p>
    <p>So i&#39;m really unsure what to do here.<br>
    </p>
    <p>But i have added some more usable PACKAGECONFIG options and sent
      a patchv3<br>
    </p>
    <div>Am 22.01.22 um 20:54 schrieb Alexander
      Kanavin:<br>
    </div>
    <blockquote type=3D"cite">
     =20
      <div dir=3D"ltr">
        <div>Gobject introspection is inherently hostile to cross
          compilation environments as it requires running a
          cross-compiled binary with the qemu emulator. That does not
          always work, and if it does not, your build will break. So
          there must be a way to turn it off when it happens.</div>
        <div><br>
        </div>
        <div>Alex<br>
        </div>
      </div>
      <br>
      <div class=3D"gmail_quote">
        <div dir=3D"ltr" class=3D"gmail_attr">On Sat, 22 Jan 2022 at 20:29,
          Markus Volk &lt;<a href=3D"mailto:f_l_k@t-online.de" target=3D"_b=
lank">f_l_k@t-online.de</a>&gt; wrote:<br>
        </div>
        <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex">I
          tried to make the &#39;folks&#39; backends buildable and it turne=
d
          out, that <br>
          there are some more places where vala introspection is
          missing.<br>
          <br>
          <a href=3D"https://github.com/openembedded/meta-openembedded/blob=
/461c04657c3151629b503fe134e9d672520aacbb/meta-gnome/recipes-gnome/evolutio=
n-data-server/evolution-data-server.bb#L34" rel=3D"noreferrer" target=3D"_b=
lank">https://github.com/openembedded/meta-openembedded/blob/461c04657c3151=
629b503fe134e9d672520aacbb/meta-gnome/recipes-gnome/evolution-data-server/e=
volution-data-server.bb#L34</a><br>
          <br>
          <a href=3D"https://github.com/openembedded/meta-openembedded/blob=
/566049b4f1ddc049c1f89a5838d1a71bb429faa3/meta-oe/recipes-connectivity/tele=
pathy/telepathy-glib_0.24.1.bb#L17" rel=3D"noreferrer" target=3D"_blank">ht=
tps://github.com/openembedded/meta-openembedded/blob/566049b4f1ddc049c1f89a=
5838d1a71bb429faa3/meta-oe/recipes-connectivity/telepathy/telepathy-glib_0.=
24.1.bb#L17</a><br>
          <br>
          <br>
          Most gnome projects meanwhile make gobject-introspection
          mandatory and i <br>
          can really feel why they are doing so for two important
          reasons.<br>
          <br>
          First it is just mandatory if you want to be able to build the
          whole <br>
          gnome universe and second it is in my option one of the
          greatest <br>
          features of gtk to be able to write code for it in almost
          every language <br>
          available. This should not be an optional feature so people
          could rely <br>
          on it.<br>
          <br>
          In both recipes introspection is disabled by default and
          dependent on <br>
          &#39;GI_DATA_ENABLED=3Dtrue&#39;. Wouldn&#39;t it be a good idea =
to just
          enable <br>
          Introspection by default? We already inherit
          gobject-introspection anyway.<br>
          <br>
          There are also some more issues in libgdata and libical with <br>
          introspection i was able to fix locally. Will send patches for
          it if <br>
          it&#39;ll be ok making introspection mandatory.<br>
          <br>
          Am 20.01.22 um 21:36 schrieb Markus Volk:<br>
          &gt; Signed-off-by: Markus Volk &lt;<a href=3D"mailto:f_l_k@t-onl=
ine.de" target=3D"_blank">f_l_k@t-online.de</a>&gt;<br>
          &gt; ---<br>
          &gt;=C2=A0 =C2=A0.../folks/<a href=3D"http://folks_0.15.4.bb" rel=
=3D"noreferrer" target=3D"_blank">folks_0.15.4.bb</a>=C2=A0
          =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0| 24 +++++++++++++++++++<br>
          &gt;=C2=A0 =C2=A01 file changed, 24 insertions(+)<br>
          &gt;=C2=A0 =C2=A0create mode 100644
          meta-gnome/recipes-connectivity/folks/<a href=3D"http://folks_0.1=
5.4.bb" rel=3D"noreferrer" target=3D"_blank">folks_0.15.4.bb</a><br>
          &gt;<br>
          &gt; diff --git a/meta-gnome/recipes-connectivity/folks/<a href=
=3D"http://folks_0.15.4.bb" rel=3D"noreferrer" target=3D"_blank">folks_0.15=
.4.bb</a>
          b/meta-gnome/recipes-connectivity/folks/<a href=3D"http://folks_0=
.15.4.bb" rel=3D"noreferrer" target=3D"_blank">folks_0.15.4.bb</a><br>
          &gt; new file mode 100644<br>
          &gt; index 000000000..b4ca551c8<br>
          &gt; --- /dev/null<br>
          &gt; +++ b/meta-gnome/recipes-connectivity/folks/<a href=3D"http:=
//folks_0.15.4.bb" rel=3D"noreferrer" target=3D"_blank">folks_0.15.4.bb</a>=
<br>
          &gt; @@ -0,0 +1,24 @@<br>
          &gt; +SUMMARY =3D &quot;Folks is a contact aggregation library.&q=
uot;<br>
          &gt; +LICENSE =3D &quot;LGPLv2.1&quot;<br>
          &gt; +LIC_FILES_CHKSUM =3D
          <a>&quot;file://COPYING;md5=3D2d5025d4aa3495befef8f17206a5b0a1&qu=
ot;</a><br>
          &gt; +<br>
          &gt; +DEPENDS =3D &quot; \<br>
          &gt; +=C2=A0 =C2=A0 glib-2.0 \<br>
          &gt; +=C2=A0 =C2=A0 libgee \<br>
          &gt; +=C2=A0 =C2=A0 libxml2 \<br>
          &gt; +=C2=A0 =C2=A0 dbus-glib \<br>
          &gt; +=C2=A0 =C2=A0 telepathy-glib \<br>
          &gt; +&quot;<br>
          &gt; +<br>
          &gt; +GNOMEBASEBUILDCLASS =3D &quot;meson&quot;<br>
          &gt; +<br>
          &gt; +# gobject-introspection is mandatory and cannot be
          configured<br>
          &gt; +REQUIRED_DISTRO_FEATURES =3D &quot;gobject-introspection-da=
ta&quot;<br>
          &gt; +GIR_MESON_OPTION =3D &quot;&quot;<br>
          &gt; +<br>
          &gt; +EXTRA_OEMESON =3D &quot;-Deds_backend=3Dfalse
          -Dbluez_backend=3Dfalse -Dofono_backend=3Dfalse
          -Dtelepathy_backend=3Dfalse&quot;<br>
          &gt; +<br>
          &gt; +inherit gnomebase gettext gobject-introspection vala
          features_check<br>
          &gt; +<br>
          &gt; +SRC_URI[archive.sha256sum] =3D
          &quot;e71099afc9e88fad4e757ae134bc3fd63e12b901ad62b0ed5536afb7912=
4af5f&quot;<br>
          &gt; +<br>
          <br>
          -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
          Links: You receive all messages sent to this group.<br>
          View/Reply Online (#95004): <a href=3D"https://lists.openembedded=
.org/g/openembedded-devel/message/95004" rel=3D"noreferrer" target=3D"_blan=
k">https://lists.openembedded.org/g/openembedded-devel/message/95004</a><br=
>
          Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/886=
11345/1686489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembed=
ded.org/mt/88611345/1686489</a><br>
          Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.o=
penembedded.org" target=3D"_blank">openembedded-devel+owner@lists.openembed=
ded.org</a><br>
          Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembe=
dded-devel/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openem=
bedded.org/g/openembedded-devel/unsub</a>
          [<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex=
.kanavin@gmail.com</a>]<br>
          -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
          <br>
        </blockquote>
      </div>
    </blockquote>
  </div>

</blockquote></div>

--0000000000006ec8aa05d63f703d--

