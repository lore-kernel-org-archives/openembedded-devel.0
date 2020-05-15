Received: from mail-ej1-f68.google.com (mail-ej1-f68.google.com [209.85.218.68])
 by mx.groups.io with SMTP id smtpd.web11.15319.1589555269607546464
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 May 2020 08:07:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=MTRTthWJ;
 spf=pass (domain: gmail.com, ip: 209.85.218.68, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f68.google.com with SMTP id h21so2488440ejq.5
        for <openembedded-devel@lists.openembedded.org>; Fri, 15 May 2020 08:07:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zMtgxH6fvVEFM3hXyOWJBv7XkUAMfdFDzy3wwl3HMKY=;
        b=MTRTthWJMa5m5PTHpEEh/rm8YtxgxGHYwPDV7IEzJcND3N1wjB/24gpQDcXxcLX8QI
         7bPOMC+5QlV2Vbiz+IkskWI0zTkYRTNgI1Sfe8Qp2JrIct5mXpguhOcS4OPKjITXd9OC
         J9PMMVyy5qPyzcyl1+0QF6mB0ezH54TmyZJ8ow+k6gELpRGEmsXw7rhdYlMPpKn9BP44
         hlqjQjOoQDqrLFUMM9goZuR2SeSVlYHFgPB3V36lrd1uOo5U5Vq758IvYpUTKvBiRUpb
         SKQgUQtas0o3B812WMtKsv6dfnDDqb3wM5xPOni1/zUcoDfUKd8DITD+GTJvstsDGvX3
         XijQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zMtgxH6fvVEFM3hXyOWJBv7XkUAMfdFDzy3wwl3HMKY=;
        b=P20YEKJDq6uQ1OzHKNkR4M4rFjbfcwnz3mJyVAWBSsiS9zJ9Pk16viiKhY8ooqvHou
         btSl3/IRaKjJDqCzfC1aj0thj0wuyIUjl6FRPtWYPEYGJvaPYjJ20ELCtlYzpLVmBKYm
         1LuIv/MiQGdILDqkVX0RTduKAsveYfwDGTUJUpxbYT0KdB3zVNof52GNh+F71SzzxkHS
         BTsHLwfnaFL2uS5J1Sadr6JpRve9VVtVfdEGzNTa6ITSwcnlu2Xu+PEJn6s9WLGGw8h3
         QrtRChUBxeLDR0DxEArLinEfaCeBBuCysYWribzq7sl20OQ1ROsXvtf4qFpFyeh+tn97
         dDMw==
X-Gm-Message-State: AOAM531J36V2H9WdlCQUoRddGsUlmiLTw5aGfflf81Eo6Xlge+DfwEqw
	GZJW90k1p5mIdHmwilR2QEi637XZqQuBw05QWbo=
X-Google-Smtp-Source: ABdhPJxCQqmx4Ivn4wSmh4NSSXrKuiP2MkD02AekBNt15nIgqMGz4kOKEl/kc3ztKUPLdr75UhnzrnUcXARrxhNuZnM=
X-Received: by 2002:a17:906:bc4c:: with SMTP id s12mr3294471ejv.285.1589555268118;
 Fri, 15 May 2020 08:07:48 -0700 (PDT)
MIME-Version: 1.0
References: <20200515121436.2078760-1-sean@geanix.com> <CAP71Wjw91K67Z2fV9AyySsapyjmg20WE4c3JY84kr5+i0=u-Og@mail.gmail.com>
In-Reply-To: <CAP71Wjw91K67Z2fV9AyySsapyjmg20WE4c3JY84kr5+i0=u-Og@mail.gmail.com>
From: "Martin Jansa" <Martin.Jansa@gmail.com>
Date: Fri, 15 May 2020 17:07:37 +0200
Message-ID: <CA+chaQeKWuojLcT8Hq+CwycKS9Apgf2kwwmTP+6R4Zwb9OqY1Q@mail.gmail.com>
Subject: Re: [oe] [meta-oe] [PATCH] gpsd: fix build on aarch64
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Cc: Sean Nyekjaer <sean@geanix.com>, 
	openembedded-devel <openembedded-devel@lists.openembedded.org>, 
	Alistair Francis <alistair23@gmail.com>
Content-Type: multipart/alternative; boundary="0000000000001b6df405a5b12d09"

--0000000000001b6df405a5b12d09
Content-Type: text/plain; charset="UTF-8"

I was seeing this issue also on arm (raspberrypi4), so it's not specific to
aarch64 as subject says.

With this fix I'm still seeing build failure:
| ppsthread.c:1281: error: undefined reference to 'pthread_create'

going back to 3.19 fixes both issues (so it's not caused by my setup).

On Fri, May 15, 2020 at 2:24 PM Nicolas Dechesne <
nicolas.dechesne@linaro.org> wrote:

>
>
> On Fri, May 15, 2020 at 2:14 PM Sean Nyekjaer <sean@geanix.com> wrote:
>
>> Explicitly add ${CC} as linker, for it to understand -Wl option.
>>
>> Signed-off-by: Sean Nyekjaer <sean@geanix.com>
>> ---
>>
>> Alistair please check in your setup :)
>>
>
> I had found the same error on dragonboard/arm64. This patch fixes the
> build problem. Note that I have only done build test, not run time.
> thanks!
>
>
>>
>>  meta-oe/recipes-navigation/gpsd/gpsd_3.20.bb | 3 +++
>>  1 file changed, 3 insertions(+)
>>
>> diff --git a/meta-oe/recipes-navigation/gpsd/gpsd_3.20.bb
>> b/meta-oe/recipes-navigation/gpsd/gpsd_3.20.bb
>> index 0914f7ec2..5463c8231 100644
>> --- a/meta-oe/recipes-navigation/gpsd/gpsd_3.20.bb
>> +++ b/meta-oe/recipes-navigation/gpsd/gpsd_3.20.bb
>> @@ -35,6 +35,7 @@ EXTRA_OESCONS = " \
>>      systemd='${SYSTEMD_OESCONS}' \
>>      libdir='${libdir}' \
>>      manbuild='false' \
>> +    LINK='${CC}' \
>>      ${PACKAGECONFIG_CONFARGS} \
>>  "
>>  # this cannot be used, because then chrpath is not found and only static
>> lib is built
>> @@ -44,6 +45,7 @@ do_compile_prepend() {
>>      export PKG_CONFIG_PATH="${PKG_CONFIG_PATH}"
>>      export
>> PKG_CONFIG="PKG_CONFIG_SYSROOT_DIR=\"${PKG_CONFIG_SYSROOT_DIR}\" pkg-config"
>>      export STAGING_PREFIX="${STAGING_DIR_HOST}/${prefix}"
>> +    export LD="${CC}"
>>      export LINKFLAGS="${LDFLAGS}"
>>  }
>>
>> @@ -51,6 +53,7 @@ do_install() {
>>      export PKG_CONFIG_PATH="${PKG_CONFIG_PATH}"
>>      export
>> PKG_CONFIG="PKG_CONFIG_SYSROOT_DIR=\"${PKG_CONFIG_SYSROOT_DIR}\" pkg-config"
>>      export STAGING_PREFIX="${STAGING_DIR_HOST}/${prefix}"
>> +    export LD="${CC}"
>>      export LINKFLAGS="${LDFLAGS}"
>>
>>      export DESTDIR="${D}"
>> --
>> 2.26.2
>>
>>
>> 
>

--0000000000001b6df405a5b12d09
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I was seeing this issue also on arm (raspberrypi4), so it&=
#39;s not specific to aarch64 as subject says.<div><br></div><div>With this=
 fix I&#39;m still seeing=C2=A0build failure:</div><div>| ppsthread.c:1281:=
 error: undefined reference to &#39;pthread_create&#39;<br></div><div><br><=
/div><div>going back to 3.19 fixes both issues (so it&#39;s not caused by m=
y setup).</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Fri, May 15, 2020 at 2:24 PM Nicolas Dechesne &lt;<a hr=
ef=3D"mailto:nicolas.dechesne@linaro.org">nicolas.dechesne@linaro.org</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div d=
ir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote"><div d=
ir=3D"ltr" class=3D"gmail_attr">On Fri, May 15, 2020 at 2:14 PM Sean Nyekja=
er &lt;<a href=3D"mailto:sean@geanix.com" target=3D"_blank">sean@geanix.com=
</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=
Explicitly add ${CC} as linker, for it to understand -Wl option.<br>
<br>
Signed-off-by: Sean Nyekjaer &lt;<a href=3D"mailto:sean@geanix.com" target=
=
=3D"_blank">sean@geanix.com</a>&gt;<br>
---<br>
<br>
Alistair please check in your setup :)<br></blockquote><div><br></div><div=
>I had found the same error on dragonboard/arm64. This patch fixes the buil=
d problem. Note that I have only done build test, not run time.</div><div>t=
hanks!</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex">
<br>
=C2=A0meta-oe/recipes-navigation/gpsd/<a href=3D"http://gpsd_3.20.bb" rel=
=3D"noreferrer" target=3D"_blank">gpsd_3.20.bb</a> | 3 +++<br>
=C2=A01 file changed, 3 insertions(+)<br>
<br>
diff --git a/meta-oe/recipes-navigation/gpsd/<a href=3D"http://gpsd_3.20.b=
b" rel=3D"noreferrer" target=3D"_blank">gpsd_3.20.bb</a> b/meta-oe/recipes-=
navigation/gpsd/<a href=3D"http://gpsd_3.20.bb" rel=3D"noreferrer" target=
=3D"_blank">gpsd_3.20.bb</a><br>
index 0914f7ec2..5463c8231 100644<br>
--- a/meta-oe/recipes-navigation/gpsd/<a href=3D"http://gpsd_3.20.bb" rel=
=3D"noreferrer" target=3D"_blank">gpsd_3.20.bb</a><br>
+++ b/meta-oe/recipes-navigation/gpsd/<a href=3D"http://gpsd_3.20.bb" rel=
=3D"noreferrer" target=3D"_blank">gpsd_3.20.bb</a><br>
@@ -35,6 +35,7 @@ EXTRA_OESCONS =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0systemd=3D&#39;${SYSTEMD_OESCONS}&#39; \<br>
=C2=A0 =C2=A0 =C2=A0libdir=3D&#39;${libdir}&#39; \<br>
=C2=A0 =C2=A0 =C2=A0manbuild=3D&#39;false&#39; \<br>
+=C2=A0 =C2=A0 LINK=3D&#39;${CC}&#39; \<br>
=C2=A0 =C2=A0 =C2=A0${PACKAGECONFIG_CONFARGS} \<br>
=C2=A0&quot;<br>
=C2=A0# this cannot be used, because then chrpath is not found and only st=
atic lib is built<br>
@@ -44,6 +45,7 @@ do_compile_prepend() {<br>
=C2=A0 =C2=A0 =C2=A0export PKG_CONFIG_PATH=3D&quot;${PKG_CONFIG_PATH}&quot=
;<br>
=C2=A0 =C2=A0 =C2=A0export PKG_CONFIG=3D&quot;PKG_CONFIG_SYSROOT_DIR=3D\&q=
uot;${PKG_CONFIG_SYSROOT_DIR}\&quot; pkg-config&quot;<br>
=C2=A0 =C2=A0 =C2=A0export STAGING_PREFIX=3D&quot;${STAGING_DIR_HOST}/${pr=
efix}&quot;<br>
+=C2=A0 =C2=A0 export LD=3D&quot;${CC}&quot;<br>
=C2=A0 =C2=A0 =C2=A0export LINKFLAGS=3D&quot;${LDFLAGS}&quot;<br>
=C2=A0}<br>
<br>
@@ -51,6 +53,7 @@ do_install() {<br>
=C2=A0 =C2=A0 =C2=A0export PKG_CONFIG_PATH=3D&quot;${PKG_CONFIG_PATH}&quot=
;<br>
=C2=A0 =C2=A0 =C2=A0export PKG_CONFIG=3D&quot;PKG_CONFIG_SYSROOT_DIR=3D\&q=
uot;${PKG_CONFIG_SYSROOT_DIR}\&quot; pkg-config&quot;<br>
=C2=A0 =C2=A0 =C2=A0export STAGING_PREFIX=3D&quot;${STAGING_DIR_HOST}/${pr=
efix}&quot;<br>
+=C2=A0 =C2=A0 export LD=3D&quot;${CC}&quot;<br>
=C2=A0 =C2=A0 =C2=A0export LINKFLAGS=3D&quot;${LDFLAGS}&quot;<br>
<br>
=C2=A0 =C2=A0 =C2=A0export DESTDIR=3D&quot;${D}&quot;<br>
-- <br>
2.26.2<br>
<br>
<br>
</blockquote></div></div>
<br>
</blockquote></div>

--0000000000001b6df405a5b12d09--
