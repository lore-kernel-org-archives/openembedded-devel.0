Received: from mail-ej1-f68.google.com (mail-ej1-f68.google.com [209.85.218.68])
 by mx.groups.io with SMTP id smtpd.web10.45256.1598628049278263580
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 28 Aug 2020 08:20:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=orp2SznT;
 spf=pass (domain: gmail.com, ip: 209.85.218.68, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f68.google.com with SMTP id j25so2003338ejk.9
        for <openembedded-devel@lists.openembedded.org>; Fri, 28 Aug 2020 08:20:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3p5MhomzOKw2LctVu9Myc++jJNDbfyqoJBm9vMWXObU=;
        b=orp2SznTYjmmnKtbZT/jLLjCnDo9gIAk+o0QnHzMCHk5VdM44qIdECjRS78BH6PnFK
         kU/ThwIX9jLsKX+W2c6iLgjf1P8lLLR1MCBWyYI3qLohGZq4Kglb4kdiMP2Ndojsbgwl
         CV997FU0Qv0GJ/+pe/q/UPTLr8xJDa//On9xZ/kCHslVCscS54TPCiwoaTNwkj23Yzgf
         d39UQ0hNsvvIntDEuow5i1udUFeiMVrQSfwoXmyApW8bELrdRJOeaH2c0WK3ZuneR1eZ
         Qr6rMUBrZim+zYOOloQ5a/QQeKoR6RJuEiZxUhWGj7wUgDDthNvDewCB7Zp2xaaKx8ad
         4/YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3p5MhomzOKw2LctVu9Myc++jJNDbfyqoJBm9vMWXObU=;
        b=YdT/eei9qLQE1VR0YyCuVwg3sDDE+91IhXweny09QEW9eTmlpD5QxIf4KgT3+BFwaT
         vXwH4uTU9An1mdfWUgVbzuyAPNUEg4rnztTeH89BsSw0nXhjFg/4IOxP2pO5A8EWE+HM
         sG0pp89FOuBvszLIoBGSIqCLmzaMlylzxGRx9hkE3F7zjMSGLVrEp5G07+qsQAHzkjjA
         scDbDTy4oQysZtkSM6Npq7M7cMBq/upNdWR0J5rwJgmPT+4poPIZ59H22oXUIARi32hB
         iDQF9mKE+yBc9QfPpKPwO96OFQmvvGODenEnFTS+w9nIT/GasBbH6b6eJJ9wQyCCxzyB
         CT+w==
X-Gm-Message-State: AOAM532gOdNdz/8M3TuDgVSAhIKZZuKQXfOy2+C+xr6rj2lL2sktFBVH
	xPADWMNq6F67ObLMZTEpMxda3f0M6QBUW678e+E=
X-Google-Smtp-Source: ABdhPJw8D+FkvMjTxUSJK5MZ5NwtdY2XHV8xzPjO7sUOjZ+x+TwmE6KDZUagq/UMzCk2RVOf81q7w6SCfLpWcGSROGw=
X-Received: by 2002:a17:906:76c7:: with SMTP id q7mr2437913ejn.541.1598628047616;
 Fri, 28 Aug 2020 08:20:47 -0700 (PDT)
MIME-Version: 1.0
References: <20200826091503.35364-1-mikko.rapeli@bmw.de>
In-Reply-To: <20200826091503.35364-1-mikko.rapeli@bmw.de>
From: "Martin Jansa" <Martin.Jansa@gmail.com>
Date: Fri, 28 Aug 2020 17:20:36 +0200
Message-ID: <CA+chaQfSstmfrfDc6wQ2PcWrLt5y5BrLDSihEuYEDJf+PUXD1Q@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] nss: fix postinst script for nativesdk build
To: Mikko Rapeli <mikko.rapeli@bmw.de>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000e7fc6505adf19899"

--000000000000e7fc6505adf19899
Content-Type: text/plain; charset="UTF-8"

This breaks running postinst in do_rootfs, it tries to run
/usr/bin/shlibsign from host which fails when doesn't exist and then it
complains about exit 1 called after that:

WARNING: nss.postinst returned 127, marking as unpacked only, configuration
required on target.
ERROR: Postinstall scriptlets of ['nss'] have failed. If the intention is
to defer them to first boot,
then please place them into pkg_postinst_ontarget_${PN} ().
Deferring to first boot via 'exit 1' is no longer supported.

On Wed, Aug 26, 2020 at 11:15 AM Mikko Rapeli <mikko.rapeli@bmw.de> wrote:

> It's better to refer to binaries in postinst script with
> full path which also works on SDK when
> /opt/nativesysroot/usr/bin is not in PATH.
>
> Fixes install of nativesdk-nss:
>
> Configuring nativesdk-nss.
> /var/lib/opkg/info/nativesdk-nss.postinst: line 14: signlibs.sh: not found
>
> Signed-off-by: Mikko Rapeli <mikko.rapeli@bmw.de>
> ---
>  meta-oe/recipes-support/nss/nss_3.54.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta-oe/recipes-support/nss/nss_3.54.bb
> b/meta-oe/recipes-support/nss/nss_3.54.bb
> index 4923f6868..dc5cafbf1 100644
> --- a/meta-oe/recipes-support/nss/nss_3.54.bb
> +++ b/meta-oe/recipes-support/nss/nss_3.54.bb
> @@ -244,13 +244,13 @@ pkg_postinst_${PN} () {
>              DN=`dirname $I`
>              BN=`basename $I .chk`
>              FN=$DN/$BN.so
> -            shlibsign -i $FN
> +            ${bindir}/shlibsign -i $FN
>              if [ $? -ne 0 ]; then
>                  exit 1
>              fi
>          done
>      else
> -        signlibs.sh
> +        ${bindir}/signlibs.sh
>      fi
>  }
>
> --
> 2.20.1
>
> 
>

--000000000000e7fc6505adf19899
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">This breaks running postinst in do_rootfs, it tries to run=
 /usr/bin/shlibsign from host which fails when doesn&#39;t exist and then i=
t complains about exit 1 called after that:<div><br></div><div>WARNING: nss=
.postinst returned 127, marking as unpacked only, configuration required on=
 target.<br>ERROR: Postinstall scriptlets of [&#39;nss&#39;] have failed. I=
f the intention is to defer them to first boot,<br>then please place them i=
nto pkg_postinst_ontarget_${PN} ().<br>Deferring to first boot via &#39;exi=
t 1&#39; is no longer supported.<br></div></div><br><div class=3D"gmail_quo=
te"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Aug 26, 2020 at 11:15 AM =
Mikko Rapeli &lt;<a href=3D"mailto:mikko.rapeli@bmw.de">mikko.rapeli@bmw.de=
</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=
It&#39;s better to refer to binaries in postinst script with<br>
full path which also works on SDK when<br>
/opt/nativesysroot/usr/bin is not in PATH.<br>
<br>
Fixes install of nativesdk-nss:<br>
<br>
Configuring nativesdk-nss.<br>
/var/lib/opkg/info/nativesdk-nss.postinst: line 14: signlibs.sh: not found=
<br>
<br>
Signed-off-by: Mikko Rapeli &lt;<a href=3D"mailto:mikko.rapeli@bmw.de" tar=
get=3D"_blank">mikko.rapeli@bmw.de</a>&gt;<br>
---<br>
=C2=A0meta-oe/recipes-support/nss/<a href=3D"http://nss_3.54.bb" rel=3D"no=
referrer" target=3D"_blank">nss_3.54.bb</a> | 4 ++--<br>
=C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/meta-oe/recipes-support/nss/<a href=3D"http://nss_3.54.bb" re=
l=3D"noreferrer" target=3D"_blank">nss_3.54.bb</a> b/meta-oe/recipes-suppor=
t/nss/<a href=3D"http://nss_3.54.bb" rel=3D"noreferrer" target=3D"_blank">n=
ss_3.54.bb</a><br>
index 4923f6868..dc5cafbf1 100644<br>
--- a/meta-oe/recipes-support/nss/<a href=3D"http://nss_3.54.bb" rel=3D"no=
referrer" target=3D"_blank">nss_3.54.bb</a><br>
+++ b/meta-oe/recipes-support/nss/<a href=3D"http://nss_3.54.bb" rel=3D"no=
referrer" target=3D"_blank">nss_3.54.bb</a><br>
@@ -244,13 +244,13 @@ pkg_postinst_${PN} () {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DN=3D`dirname $I`<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0BN=3D`basename $I .chk`<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0FN=3D$DN/$BN.so<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 shlibsign -i $FN<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${bindir}/shlibsign -i $FN<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if [ $? -ne 0 ]; then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0exit 1<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0done<br>
=C2=A0 =C2=A0 =C2=A0else<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 signlibs.sh<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ${bindir}/signlibs.sh<br>
=C2=A0 =C2=A0 =C2=A0fi<br>
=C2=A0}<br>
<br>
-- <br>
2.20.1<br>
<br>
<br>
</blockquote></div>

--000000000000e7fc6505adf19899--
