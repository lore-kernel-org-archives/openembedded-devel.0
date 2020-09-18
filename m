Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com [209.85.218.65])
 by mx.groups.io with SMTP id smtpd.web12.10053.1600425726708627453
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 18 Sep 2020 03:42:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ScqUjN0q;
 spf=pass (domain: gmail.com, ip: 209.85.218.65, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f65.google.com with SMTP id e23so7473926eja.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 18 Sep 2020 03:42:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TguAuvb9JMMfxb5wjz+q7oJpf6geKAg9Sn4Qk0i+QBw=;
        b=ScqUjN0qMAKl9cTPkFduwqu1WEQTe/JnFMiwxL5mN6OEPxv7H4ytVdOW1psc8EIfbY
         Kcc0DA/6XQaSxUUDNIDMuJFz7yFv8GkH/+8pbku8g9Md+Jh5zZ03463Jif59WfGvMpGW
         fvhM5RTkCpMCK1ttSM6w0CtlcFKwaPKGi7dlQvYUWPE8G8fDR82NA9OiEqY2qdOipSwJ
         lslH2Tx2Rfq2E08z4igoIlhLPoSQzXmlI2VXMrxO5YDJgMTmkN4FHBg+yu5mA5qll8B8
         tN3gwPBBHUAHgV2wLBOayzDjxAt8oDVPTIeuxD+11wSpdsXodZnEI36n2NAw1lR8x/Cn
         OSTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TguAuvb9JMMfxb5wjz+q7oJpf6geKAg9Sn4Qk0i+QBw=;
        b=abJBdYgw7IO0B6nMGUbMLa21OJBjRx9nXpIO4siVkGaeM8+k6JptHaPWIeS7Axdcvn
         z2UmpCV1mDozyYvDXp91GsYcvtN1Uhrc8kfFpbPCdYGekUUaRcmdC2efppxCOQTo+V47
         fBvIbzRt5/oTfDWz7hgfVwx6HG1QrNdyFnAf0LdavujoN7Ij4ZTewWcKPW1vGKp8k3u6
         +G6Ri7H+703I6PZijz5r2DTqqITV+5rMFwqT/NHKA3JDY0vssbVXASM0eC9xZ4McBlOG
         R+rTgR/fFz78x5mBW/SPKpJdvF40m1jM4lBq0vwT9LuqNzZnGyqYXePwAddMuhIuNWB/
         q7cA==
X-Gm-Message-State: AOAM532Id3XQ70WPuBk4JBqm71wRVHleRTnjKtkKu0S8BZnHAIhS+2AA
	iiBtlvgrza3NE3Yfq4brL//kPe0O1daX4VuSkO0=
X-Google-Smtp-Source: ABdhPJzIJYyUcn6kFsBdQLfatQa8peAu+/LYsPa0R6nSNNmrq3X1wq4vLKgpwyOWx95zP0Kbrzx51CTr9cBYhETf3uw=
X-Received: by 2002:a17:906:60d5:: with SMTP id f21mr34967587ejk.94.1600425724977;
 Fri, 18 Sep 2020 03:42:04 -0700 (PDT)
MIME-Version: 1.0
References: <20200901223612.1386026-1-raj.khem@gmail.com> <20200901223612.1386026-7-raj.khem@gmail.com>
In-Reply-To: <20200901223612.1386026-7-raj.khem@gmail.com>
From: "Martin Jansa" <Martin.Jansa@gmail.com>
Date: Fri, 18 Sep 2020 12:41:54 +0200
Message-ID: <CA+chaQd-nmJOgDq72LWtKZFcQ0+NTOgQx2QmQNQJCpU2Dm-54Q@mail.gmail.com>
Subject: Re: [oe] [meta-networking][PATCH 07/10] ssmtp: Use update alternatives for conflicts with esmtp
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000d3a5e205af942605"

--000000000000d3a5e205af942605
Content-Type: text/plain; charset="UTF-8"

In my build I don't have mailq, sendmail, newaliases as man pages, but
binaries in sbindir (and the sbinbinary is called newaliases, not newalias)

tmp-glibc/work/core2-64-oe-linux/ssmtp/2.64-r0/image/
tmp-glibc/work/core2-64-oe-linux/ssmtp/2.64-r0/image/usr
tmp-glibc/work/core2-64-oe-linux/ssmtp/2.64-r0/image/usr/share
tmp-glibc/work/core2-64-oe-linux/ssmtp/2.64-r0/image/usr/share/man
tmp-glibc/work/core2-64-oe-linux/ssmtp/2.64-r0/image/usr/share/man/man8
tmp-glibc/work/core2-64-oe-linux/ssmtp/2.64-r0/image/usr/share/man/man8/ssmtp.8
tmp-glibc/work/core2-64-oe-linux/ssmtp/2.64-r0/image/usr/sbin
tmp-glibc/work/core2-64-oe-linux/ssmtp/2.64-r0/image/usr/sbin/mailq
tmp-glibc/work/core2-64-oe-linux/ssmtp/2.64-r0/image/usr/sbin/sendmail
tmp-glibc/work/core2-64-oe-linux/ssmtp/2.64-r0/image/usr/sbin/newaliases
tmp-glibc/work/core2-64-oe-linux/ssmtp/2.64-r0/image/usr/sbin/ssmtp
tmp-glibc/work/core2-64-oe-linux/ssmtp/2.64-r0/image/etc
tmp-glibc/work/core2-64-oe-linux/ssmtp/2.64-r0/image/etc/ssmtp
tmp-glibc/work/core2-64-oe-linux/ssmtp/2.64-r0/image/etc/ssmtp/revaliases

this added u-a is causing following warnings:

WARNING: ssmtp-2.64-r0 do_package: ssmtp: alternative target
(/usr/share/man/man1/mailq.1 or /usr/share/man/man1/mailq.1.ssmtp) does not
exist, skipping...
WARNING: ssmtp-2.64-r0 do_package: ssmtp: alternative target
(/usr/share/man/man1/newaliases.1 or
/usr/share/man/man1/newaliases.1.ssmtp) does not exist, skipping...
WARNING: ssmtp-2.64-r0 do_package: ssmtp: alternative target
(/usr/share/man/man1/sendmail.1 or /usr/share/man/man1/sendmail.1.ssmtp)
does not exist, skipping...
WARNING: ssmtp-2.64-r0 do_package: ssmtp: alternative target
(/usr/sbin/newalias or /usr/sbin/newalias.ssmtp) does not exist, skipping...
WARNING: ssmtp-2.64-r0 do_package: ssmtp: NOT adding alternative provide
/usr/share/man/man1/mailq.1: /usr/share/man/man1/mailq.1.ssmtp does not
exist
WARNING: ssmtp-2.64-r0 do_package: ssmtp: NOT adding alternative provide
/usr/share/man/man1/newaliases.1: /usr/share/man/man1/newaliases.1.ssmtp
does not exist
WARNING: ssmtp-2.64-r0 do_package: ssmtp: NOT adding alternative provide
/usr/share/man/man1/sendmail.1: /usr/share/man/man1/sendmail.1.ssmtp does
not exist
WARNING: ssmtp-2.64-r0 do_package: ssmtp: NOT adding alternative provide
/usr/sbin/newalias: /usr/sbin/newalias.ssmtp does not exist
WARNING: ssmtp-2.64-r0 do_package: ssmtp: alt_link == alt_target:
/usr/share/man/man1/mailq.1 == /usr/share/man/man1/mailq.1
WARNING: ssmtp-2.64-r0 do_package: ssmtp: alt_link == alt_target:
/usr/share/man/man1/newaliases.1 == /usr/share/man/man1/newaliases.1
WARNING: ssmtp-2.64-r0 do_package: ssmtp: alt_link == alt_target:
/usr/share/man/man1/sendmail.1 == /usr/share/man/man1/sendmail.1
WARNING: ssmtp-2.64-r0 do_package: ssmtp: alt_link == alt_target:
/usr/sbin/newalias == /usr/sbin/newalias

I'll send a fix adjusting this shortly, but please check if it produces
different files for you for some reason.

On Wed, Sep 2, 2020 at 12:36 AM Khem Raj <raj.khem@gmail.com> wrote:

> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  .../recipes-support/ssmtp/ssmtp_2.64.bb           | 15 ++++++++++++++-
>  1 file changed, 14 insertions(+), 1 deletion(-)
>
> diff --git a/meta-networking/recipes-support/ssmtp/ssmtp_2.64.bb
> b/meta-networking/recipes-support/ssmtp/ssmtp_2.64.bb
> index 07e3ffed42..3739c496a5 100644
> --- a/meta-networking/recipes-support/ssmtp/ssmtp_2.64.bb
> +++ b/meta-networking/recipes-support/ssmtp/ssmtp_2.64.bb
> @@ -12,7 +12,7 @@ SRC_URI =
> "${DEBIAN_MIRROR}/main/s/${BPN}/${BPN}_${PV}.orig.tar.bz2 \
>  SRC_URI[md5sum] = "65b4e0df4934a6cd08c506cabcbe584f"
>  SRC_URI[sha256sum] =
> "22c37dc90c871e8e052b2cab0ad219d010fa938608cd66b21c8f3c759046fa36"
>
> -inherit autotools
> +inherit autotools update-alternatives
>
>  PACKAGECONFIG ?= "ssl ${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
>
> @@ -33,3 +33,16 @@ do_install_append () {
>      ln -s ssmtp ${D}${sbindir}/newaliases
>      ln -s ssmtp ${D}${sbindir}/mailq
>  }
> +
> +ALTERNATIVE_PRIORITY_${PN} = "100"
> +
> +ALTERNATIVE_${PN} = "mailq newalias sendmail"
> +ALTERNATIVE_LINK_NAME[sendmail] = "${sbindir}/sendmail"
> +ALTERNATIVE_LINK_NAME[newalias] = "${sbindir}/newalias"
> +ALTERNATIVE_LINK_NAME[mailq] = "${sbindir}/mailq"
> +
> +ALTERNATIVE_PRIORITY_${PN}-doc = "100"
> +ALTERNATIVE_${PN}-doc += "mailq.1 newaliases.1 sendmail.1"
> +ALTERNATIVE_LINK_NAME[mailq.1] = "${mandir}/man1/mailq.1"
> +ALTERNATIVE_LINK_NAME[newaliases.1] = "${mandir}/man1/newaliases.1"
> +ALTERNATIVE_LINK_NAME[sendmail.1] = "${mandir}/man1/sendmail.1"
> --
> 2.28.0
>
> 
>

--000000000000d3a5e205af942605
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>In my build I don&#39;t have mailq, sendmail, newalia=
ses as man pages, but binaries in sbindir (and the sbinbinary=C2=A0is calle=
d newaliases, not newalias)</div><div><br></div><div>tmp-glibc/work/core2-6=
4-oe-linux/ssmtp/2.64-r0/image/<br>tmp-glibc/work/core2-64-oe-linux/ssmtp/2=
.64-r0/image/usr<br>tmp-glibc/work/core2-64-oe-linux/ssmtp/2.64-r0/image/us=
r/share<br>tmp-glibc/work/core2-64-oe-linux/ssmtp/2.64-r0/image/usr/share/m=
an<br>tmp-glibc/work/core2-64-oe-linux/ssmtp/2.64-r0/image/usr/share/man/ma=
n8<br>tmp-glibc/work/core2-64-oe-linux/ssmtp/2.64-r0/image/usr/share/man/ma=
n8/ssmtp.8<br>tmp-glibc/work/core2-64-oe-linux/ssmtp/2.64-r0/image/usr/sbin=
<br>tmp-glibc/work/core2-64-oe-linux/ssmtp/2.64-r0/image/usr/sbin/mailq<br>=
tmp-glibc/work/core2-64-oe-linux/ssmtp/2.64-r0/image/usr/sbin/sendmail<br>t=
mp-glibc/work/core2-64-oe-linux/ssmtp/2.64-r0/image/usr/sbin/newaliases<br>=
tmp-glibc/work/core2-64-oe-linux/ssmtp/2.64-r0/image/usr/sbin/ssmtp<br>tmp-=
glibc/work/core2-64-oe-linux/ssmtp/2.64-r0/image/etc<br>tmp-glibc/work/core=
2-64-oe-linux/ssmtp/2.64-r0/image/etc/ssmtp<br>tmp-glibc/work/core2-64-oe-l=
inux/ssmtp/2.64-r0/image/etc/ssmtp/revaliases<br></div><div><br></div><div>=
this added u-a is causing following warnings:</div><div><br></div>WARNING: =
ssmtp-2.64-r0 do_package: ssmtp: alternative target (/usr/share/man/man1/ma=
ilq.1 or /usr/share/man/man1/mailq.1.ssmtp) does not exist, skipping...<br>=
WARNING: ssmtp-2.64-r0 do_package: ssmtp: alternative target (/usr/share/ma=
n/man1/newaliases.1 or /usr/share/man/man1/newaliases.1.ssmtp) does not exi=
st, skipping...<br>WARNING: ssmtp-2.64-r0 do_package: ssmtp: alternative ta=
rget (/usr/share/man/man1/sendmail.1 or /usr/share/man/man1/sendmail.1.ssmt=
p) does not exist, skipping...<br>WARNING: ssmtp-2.64-r0 do_package: ssmtp:=
 alternative target (/usr/sbin/newalias or /usr/sbin/newalias.ssmtp) does n=
ot exist, skipping...<br>WARNING: ssmtp-2.64-r0 do_package: ssmtp: NOT addi=
ng alternative provide /usr/share/man/man1/mailq.1: /usr/share/man/man1/mai=
lq.1.ssmtp does not exist<br>WARNING: ssmtp-2.64-r0 do_package: ssmtp: NOT =
adding alternative provide /usr/share/man/man1/newaliases.1: /usr/share/man=
/man1/newaliases.1.ssmtp does not exist<br>WARNING: ssmtp-2.64-r0 do_packag=
e: ssmtp: NOT adding alternative provide /usr/share/man/man1/sendmail.1: /u=
sr/share/man/man1/sendmail.1.ssmtp does not exist<br>WARNING: ssmtp-2.64-r0=
 do_package: ssmtp: NOT adding alternative provide /usr/sbin/newalias: /usr=
/sbin/newalias.ssmtp does not exist<br>WARNING: ssmtp-2.64-r0 do_package: s=
smtp: alt_link =3D=3D alt_target: /usr/share/man/man1/mailq.1 =3D=3D /usr/s=
hare/man/man1/mailq.1<br>WARNING: ssmtp-2.64-r0 do_package: ssmtp: alt_link=
 =3D=3D alt_target: /usr/share/man/man1/newaliases.1 =3D=3D /usr/share/man/=
man1/newaliases.1<br>WARNING: ssmtp-2.64-r0 do_package: ssmtp: alt_link =3D=
=
=3D alt_target: /usr/share/man/man1/sendmail.1 =3D=3D /usr/share/man/man1/=
sendmail.1<br>WARNING: ssmtp-2.64-r0 do_package: ssmtp: alt_link =3D=3D alt=
_target: /usr/sbin/newalias =3D=3D /usr/sbin/newalias<br><div><br></div><di=
v>I&#39;ll send a fix adjusting this shortly, but please check if it produc=
es different files for you for some reason.</div></div><br><div class=3D"gm=
ail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Sep 2, 2020 at 12:=
36 AM Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com=
</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=
Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D=
"_blank">raj.khem@gmail.com</a>&gt;<br>
---<br>
=C2=A0.../recipes-support/ssmtp/<a href=3D"http://ssmtp_2.64.bb" rel=3D"no=
referrer" target=3D"_blank">ssmtp_2.64.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0| 15 ++++++++++++++-<br>
=C2=A01 file changed, 14 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/meta-networking/recipes-support/ssmtp/<a href=3D"http://ssmtp=
_2.64.bb" rel=3D"noreferrer" target=3D"_blank">ssmtp_2.64.bb</a> b/meta-net=
working/recipes-support/ssmtp/<a href=3D"http://ssmtp_2.64.bb" rel=3D"noref=
errer" target=3D"_blank">ssmtp_2.64.bb</a><br>
index 07e3ffed42..3739c496a5 100644<br>
--- a/meta-networking/recipes-support/ssmtp/<a href=3D"http://ssmtp_2.64.b=
b" rel=3D"noreferrer" target=3D"_blank">ssmtp_2.64.bb</a><br>
+++ b/meta-networking/recipes-support/ssmtp/<a href=3D"http://ssmtp_2.64.b=
b" rel=3D"noreferrer" target=3D"_blank">ssmtp_2.64.bb</a><br>
@@ -12,7 +12,7 @@ SRC_URI =3D &quot;${DEBIAN_MIRROR}/main/s/${BPN}/${BPN}_=
${PV}.orig.tar.bz2 \<br>
=C2=A0SRC_URI[md5sum] =3D &quot;65b4e0df4934a6cd08c506cabcbe584f&quot;<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;22c37dc90c871e8e052b2cab0ad219d010fa938=
608cd66b21c8f3c759046fa36&quot;<br>
<br>
-inherit autotools<br>
+inherit autotools update-alternatives<br>
<br>
=C2=A0PACKAGECONFIG ?=3D &quot;ssl ${@bb.utils.filter(&#39;DISTRO_FEATURES=
&#39;, &#39;ipv6&#39;, d)}&quot;<br>
<br>
@@ -33,3 +33,16 @@ do_install_append () {<br>
=C2=A0 =C2=A0 =C2=A0ln -s ssmtp ${D}${sbindir}/newaliases<br>
=C2=A0 =C2=A0 =C2=A0ln -s ssmtp ${D}${sbindir}/mailq<br>
=C2=A0}<br>
+<br>
+ALTERNATIVE_PRIORITY_${PN} =3D &quot;100&quot;<br>
+<br>
+ALTERNATIVE_${PN} =3D &quot;mailq newalias sendmail&quot;<br>
+ALTERNATIVE_LINK_NAME[sendmail] =3D &quot;${sbindir}/sendmail&quot;<br>
+ALTERNATIVE_LINK_NAME[newalias] =3D &quot;${sbindir}/newalias&quot;<br>
+ALTERNATIVE_LINK_NAME[mailq] =3D &quot;${sbindir}/mailq&quot;<br>
+<br>
+ALTERNATIVE_PRIORITY_${PN}-doc =3D &quot;100&quot;<br>
+ALTERNATIVE_${PN}-doc +=3D &quot;mailq.1 newaliases.1 sendmail.1&quot;<br=
>
+ALTERNATIVE_LINK_NAME[mailq.1] =3D &quot;${mandir}/man1/mailq.1&quot;<br>
+ALTERNATIVE_LINK_NAME[newaliases.1] =3D &quot;${mandir}/man1/newaliases.1=
&quot;<br>
+ALTERNATIVE_LINK_NAME[sendmail.1] =3D &quot;${mandir}/man1/sendmail.1&quo=
t;<br>
-- <br>
2.28.0<br>
<br>
<br>
</blockquote></div>

--000000000000d3a5e205af942605--
