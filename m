Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4D7DCD4851
	for <webhook@archiver.kernel.org>; Tue, 12 May 2026 14:53:23 +0000 (UTC)
Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com [74.125.224.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.77353.1778597596717799606
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 May 2026 07:53:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Om4cZdOP;
 spf=pass (domain: gmail.com, ip: 74.125.224.42, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-651c366f7efso5740537d50.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 12 May 2026 07:53:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778597596; cv=none;
        d=google.com; s=arc-20240605;
        b=fbVFsQka22zm2PBHUpZ7xHtBHt9l4Y5L7j+iPNb3AZpf0pyOEQIPDEViYUqmn4Qrl5
         R+cwBek2OOmOCzWshv1veGFUyLCGIq4eSabp7kpaGlS7vLNoNXnqf3GErx3zMy9Vexe6
         4LfEDQj7ub+ZPbiVThE23W5xIALjUU2uHLgw7qhmYfualQ8uTRWn8Z1RzE5eeDaB6DTz
         g9P9OsMBM8LadLRh6KlnE8WJpMTmWVEzRsPV1mw9KCZsQLweuBDTSmh6EIxi2E7pZ4eY
         R8v3zzVE5Z6e/6YvU+3b0/R2aBZw8eL7OdiqP7Zz2qsF8pBh6zGNSuH26Dv95PwxoCQX
         LuFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=HQxrgEVZoPAXHjCWfAs5OiLambtJWJZE+7H+joJQ+30=;
        fh=BweJFI7uJ9oaV/GYRDjLPRD3TWxUGQYfg9nwy/AIVLg=;
        b=bEGg6i75tPdb3umLmjLoc7hB8yA52Al9faTHWn2TjBTpy9koe3NPxd2b+db2ZTMYn2
         O3UB7Hbu/AfTN7eRQNze2DmyWTXosAEy0hjKR+M2Bz8COVjwEEBGt5io4powUFjnSheI
         EL8oPeGaghl038GAZL7CR4lswfZ24gW1wdsb8Kak2MXmZ4dXqHhlfTm9pAn+jgAbMiqQ
         Ww8c4mmUP4jLE4ipllb8wVywmfZ+p0pH4rNx/MIikgJIjqVE8uqtfLYRkAEDy5KwsIkM
         JA4fozlojCsl+49ERJlkkTL+Baj0NP7bfXx8glCf+WnlOwCLoqnXo8PSi3JMgsTvh5wi
         W8NA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778597596; x=1779202396; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HQxrgEVZoPAXHjCWfAs5OiLambtJWJZE+7H+joJQ+30=;
        b=Om4cZdOPr8FOKrfjbmYSQ8tB/+exfn20wUD1NjikHQFE3K9t8VQ8YAuaTJAhNtQrtE
         SSsfXy5s/k+oqz4/snqXwdDIATzaeQ3p5HF5ChlKD2zwJJVZRcwO0XxQ6t+5gCGvUvjR
         7n3aDB4Qhtlh/qFXwI4PCjxazL9hw1DBVnCOBXlzBmXZErZ+XFY5nLxYPSPYrxx/+FLj
         GDD1mPzAfq2wN/v+R2pt+lbIXdoKZJBvxCDRtMlw7vSfYHbPzM7EjwYdjr2uTZ+EQxHg
         PShLoExTNdtnBfsnJcbkzLkAYza0RCiOqSz8S2wAc7VovpnHX0JhXZ0Gr2AtWQ4JC4zI
         +LNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778597596; x=1779202396;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HQxrgEVZoPAXHjCWfAs5OiLambtJWJZE+7H+joJQ+30=;
        b=q2BqfSrZZ5TPlfZDFx9rNgflRMyh4/KyjZO60YcEuaITKvQ/KfvRcwtQLcljhvDIVH
         /+/b7muwUtjaZ49hqLZ9Ay9GVq2SKN5c57eO6aR6GdLDLNUgYzVCekfWrUMCtZf1dnhX
         MVHznix6xeBxLKuT/nowAL/LVG5Na6kjgqzGiFRSh3koi157C9UUkKVOWUKkaeO+R1Ax
         ifjXbvo7nliyUvbEq1jzOFx3qXxu9oPjXEdIX4FCIS+OYaqeXxpIDqlwCnLseSBli7gI
         X8U7/H/ZitEJ154K2Aefjcd/1Py+frjOb9fov9TIJNr5r4cq6jtgeFT6H+r7EaMzL0w0
         kYUg==
X-Gm-Message-State: AOJu0Yw6UsI53iaLPQmJhR9pcuGFEsoSsp3xSmIPf+JMJ6I47GI7CuYL
	gzcGm2gHsJ//DzNLaGR9BFQo/DWWHQo/1LWjQ6AJi8QxK3GXS69DRwyi28wdg0g3A+xPPtKaB8A
	e+JiwAhmU89AwI1oKjm2BRmbqA97fgh0=
X-Gm-Gg: Acq92OGouYF1oCFoo7gI7WuTlLUn5YLRRVwSW5B0ESAF88DuYD209bVD/pgNLEJODFz
	FzuKr4B35Fy/ekxSWw06j8zsM3XLKASaXruSRo1yaanWoVONFBHDjuob+q4Ef+GaKEwptgNP3Jt
	jrDb5G2kaHANseMJEgXfvhuldSoiIF/OgDoMiIG3qhktnrFC1XVVTtC7xV/mqjpBFuTXngdPKuL
	xmuG0YHlgbwtaUvSISDCuSAe/KDNU8jDIdnXCNYAGwibwhRm5jmHhk+dTJAxw5boM2z4w3L3hi0
	LsG1Wm7gUSHL+MbsbqoNdD/HT5NTSEVIwSEAEQlqtNYAysvs/2GGdydyVrMdA7SdRCIhn2z8Fk7
	SJGQzk7S74tgf/BbYIY5li32ETT0ZAg6BNGPcDSBsPEZVEyIFNFBN+y4iBqKls8ONG3H4qHIxN/
	OhlClg
X-Received: by 2002:a05:690e:190e:b0:657:e42c:ed01 with SMTP id
 956f58d0204a3-65da85cb69cmr12484563d50.50.1778597595532; Tue, 12 May 2026
 07:53:15 -0700 (PDT)
MIME-Version: 1.0
References: <20260511-bash-rr-v2-1-4987ca21e7d8@non.se.com>
 <CAMKF1soSKFt_BdUsN-ir=BWRsJOOwPPV9YYfR0HEcYZ2-uj-GA@mail.gmail.com>
 <a083ae32-59d7-4128-9507-77faae3960f5@semalibre.com> <CAMKF1sq_QkHqQOSvQUH=v40KhP+gW4hGqxughRuDD-LutMQ5gQ@mail.gmail.com>
 <cbbba7e5-abfd-4ca5-9af2-c35a09399c6d@semalibre.com>
In-Reply-To: <cbbba7e5-abfd-4ca5-9af2-c35a09399c6d@semalibre.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 12 May 2026 07:53:03 -0700
X-Gm-Features: AVHnY4Ih_RzzYtc9mkrbnV6jpl1PlsQBGT2Gfhi6mUURvsavkFBNbv_OSZPhrVg
Message-ID: <CAMKF1sqE1qye5s67nZy0pE2iMm3tvdq4E58yMe8AL-uqF+RA+Q@mail.gmail.com>
Subject: Re: [oe] [meta-networking][PATCH v2] openvpn: create an extra package
 for the dns-updown script
To: Louis Rannou <louis.rannou@semalibre.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>, 
	Louis Rannou <louis.rannou@non.se.com>, pascal.eberhard@se.com
Content-Type: multipart/alternative; boundary="000000000000e1523e0651a005a8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 12 May 2026 14:53:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126869

--000000000000e1523e0651a005a8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks

On Tue, May 12, 2026, 7:08=E2=80=AFAM Louis Rannou <louis.rannou@semalibre.=
com>
wrote:

> 12 mai 2026 15:32:07 Khem Raj <raj.khem@gmail.com>:
>
> > Hi Louis,
> >
> > Thank you for the update on the test results.
> >
> > Regarding the errors you mentioned, could you please clarify if these
> occur both with and without the proposed change to the openvpn recipe? I =
am
> interested to know if these are pre-existing issues or if they are specif=
ic
> to the new package structure.
>
> Hello,
>
> This is coming from the past. Below are the errors on wrynose head for
> qemuarm64:
>
>
> root@qemuarm64:~# grep -A1 -B1 ERROR logs
> Timestamp (0) of auth-token is out of the renewal window
> ERROR: --auth-token wrong size (21!=3D60)
> PASS: [       OK ] auth_token_test_empty_user
> --
> [ RUN      ] tls_crypt_v2_wrap_too_long_metadata
> ERROR: could not crypt: insufficient space in dst
> PASS: [       OK ] tls_crypt_v2_wrap_too_long_metadata
> --
> [ RUN      ] test_get_user_pass_inline_creds_assertions
> FATAL ERROR:ERROR: UT username is empty
> Expected assertion FATAL ERROR occurred
> PASS: [       OK ] test_get_user_pass_inline_creds_assertions
> [ RUN      ] test_get_user_pass_authfile_stdin_assertions
> FATAL ERROR:ERROR: UT username is empty
> Expected assertion FATAL ERROR occurred
> PASS: [       OK ] test_get_user_pass_authfile_stdin_assertions
> [ RUN      ] test_get_user_pass_authfile_file_assertions
> FATAL ERROR:Error reading username from UT authfile:
> ./unit_tests/openvpn/input/empty.txt
> Expected assertion FATAL ERROR occurred
> FATAL ERROR:Error reading password from UT authfile:
> ./unit_tests/openvpn/input/empty.txt
> Expected assertion FATAL ERROR occurred
> PASS: [       OK ] test_get_user_pass_authfile_file_assertions
>
> Louis
>
> >
> > -Khem
> >
> >
> > On Tue, May 12, 2026, 1:09=E2=80=AFAM Louis Rannou <louis.rannou@semali=
bre.com>
> wrote:
> >> 12 mai 2026 06:35:59 Khem Raj <raj.khem@gmail.com>:
> >>
> >>>
> >>>
> >>> On Mon, May 11, 2026 at 4:56=E2=80=AFAM Louis Rannou via
> lists.openembedded.org[http://lists.openembedded.org][
> http://lists.openembedded.org] <louis.rannou=3D
> semalibre.com@lists.openembedded.org> wrote:
> >>>> From: Louis Rannou <louis.rannou@non.se.com>
> >>>>
> >>>> The dns-updown script is written in bash which is under the GPLv3
> >>>> license. As this script is optional, it is preffered to have it in a=
n
> extra
> >>>> package.
> >>>
> >>> Does ptest work ok after this change ?
> >>
> >> I get some errors but I suppose they are parts of the test as the
> result looks fine:
> >>
> >> DURATION: 84
> >> END: /usr/lib/openvpn/ptest
> >> 2026-05-12T07:56
> >> STOP: ptest-runner
> >> TOTAL: 1 FAIL: 0
> >>
> >>
> >>>
> >>>>
> >>>> Signed-off-by: Louis Rannou <louis.rannou@non.se.com>
> >>>> ---
> >>>> change in v2: new package openvpn-dns-updown
> >>>> ---
> >>>>  meta-networking/recipes-support/openvpn/openvpn_2.7.0.bb[
> http://openvpn_2.7.0.bb][http://openvpn_2.7.0.bb] | 5 +++--
> >>>>  1 file changed, 3 insertions(+), 2 deletions(-)
> >>>>
> >>>> diff --git a/meta-networking/recipes-support/openvpn/openvpn_2.7.0.b=
b
> [http://openvpn_2.7.0.bb][http://openvpn_2.7.0.bb]
> b/meta-networking/recipes-support/openvpn/openvpn_2.7.0.bb[
> http://openvpn_2.7.0.bb][http://openvpn_2.7.0.bb]
> >>>> index 0cbe4641cd..6ddebde4d1 100644
> >>>> --- a/meta-networking/recipes-support/openvpn/openvpn_2.7.0.bb[
> http://openvpn_2.7.0.bb][http://openvpn_2.7.0.bb]
> >>>> +++ b/meta-networking/recipes-support/openvpn/openvpn_2.7.0.bb[
> http://openvpn_2.7.0.bb][http://openvpn_2.7.0.bb]
> >>>> @@ -47,7 +47,7 @@ PACKAGECONFIG[iproute2] =3D
> "--enable-iproute2,,iproute2,iproute2-ip"
> >>>>  PACKAGECONFIG[systemd] =3D "--enable-systemd,--disable-systemd,syst=
emd"
> >>>>  PACKAGECONFIG[selinux] =3D
> "--enable-selinux,--disable-selinux,libselinux"
> >>>>
> >>>> -RDEPENDS:${PN}:append =3D " bash"
> >>>> +RDEPENDS:${PN}-dns-updown:append =3D " bash"
> >>>>  RDEPENDS:${PN}-ptest:append =3D " bash"
> >>>>
> >>>>  do_install:append() {
> >>>> @@ -114,7 +114,7 @@ do_install_ptest() {
> >>>>      cp -f ${S}/tests/t_lpback.sh ${D}/${PTEST_PATH}
> >>>>  }
> >>>>
> >>>> -PACKAGES =3D+ " ${PN}-sample "
> >>>> +PACKAGES =3D+ " ${PN}-dns-updown ${PN}-sample "
> >>>>
> >>>>  RRECOMMENDS:${PN} =3D "kernel-module-tun"
> >>>>
> >>>> @@ -124,5 +124,6 @@ FILES:${PN} +=3D
> "${systemd_system_unitdir}/openvpn-server@.service \
> >>>>                  ${systemd_system_unitdir}/openvpn-client@.service \
> >>>>                  ${nonarch_libdir}/tmpfiles.d \
> >>>>                 "
> >>>> +FILES:${PN}-dns-updown =3D "${libexecdir}/openvpn/dns-updown"
> >>>>  FILES:${PN}-sample =3D "${sysconfdir}/openvpn/sample/ \
> >>>>                       "
> >>>>
> >>>> ---
> >>>> base-commit: 420222862f5a6d95023b8f5f3b7e1808b2264ef9
> >>>> change-id: 20260506-bash-rr-5fd0820519e4
> >>>>
> >>>> Best regards,
> >>>> --
> >>>> Louis Rannou <louis.rannou@non.se.com>
> >>>>
> >>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >>>> Links: You receive all messages sent to this group.
> >>>> View/Reply Online (#126849):
> https://lists.openembedded.org/g/openembedded-devel/message/126849
> >>>> Mute This Topic: https://lists.openembedded.org/mt/119254470/1997914
> >>>> Group Owner: openembedded-devel+owner@lists.openembedded.org[
> openembedded-devel%2Bowner@lists.openembedded.org][
> openembedded-devel%2Bowner@lists.openembedded.org[
> openembedded-devel%252Bowner@lists.openembedded.org]]
> >>>> Unsubscribe:
> https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> >>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >>>>
> >>
>
>

--000000000000e1523e0651a005a8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Thanks=C2=A0</div><br><div class=3D"gmail_quote gmail_quo=
te_container"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, May 12, 2026, 7=
:08=E2=80=AFAM Louis Rannou &lt;<a href=3D"mailto:louis.rannou@semalibre.co=
m">louis.rannou@semalibre.com</a>&gt; wrote:<br></div><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex">
=20
 =20
=20
 <div>
  <span dir=3D"ltr" style=3D"margin-top:0px;margin-bottom:0px">12 mai 2026 =
15:32:07 Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blan=
k" rel=3D"noreferrer">raj.khem@gmail.com</a>&gt;:</span>
  <br>
  <br><span dir=3D"ltr" style=3D"margin-top:0px;margin-bottom:0px">&gt; Hi =
Louis,</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0px;margin-bottom:0px">&gt;</sp=
an>
  <br><span dir=3D"ltr" style=3D"margin-top:0px;margin-bottom:0px">&gt; Tha=
nk you for the update on the test results.</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0px;margin-bottom:0px">&gt;</sp=
an>
  <br><span dir=3D"ltr" style=3D"margin-top:0px;margin-bottom:0px">&gt; Reg=
arding the errors you mentioned, could you please clarify if these occur bo=
th with and without the proposed change to the openvpn recipe? I am interes=
ted to know if these are pre-existing issues or if they are specific to the=
 new package structure.</span>
  <br>
  <br><span dir=3D"ltr" style=3D"margin-top:0px;margin-bottom:0px">Hello,</=
span>
  <br>
  <br><span dir=3D"ltr" style=3D"margin-top:0px;margin-bottom:0px">This is =
coming from the past. Below are the errors on wrynose head for qemuarm64:</=
span>
  <br>
  <br>
  <br><span dir=3D"ltr" style=3D"margin-top:0px;margin-bottom:0px">root@qem=
uarm64:~# grep -A1 -B1 ERROR logs</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0px;margin-bottom:0px">Timestam=
p (0) of auth-token is out of the renewal window</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0px;margin-bottom:0px">ERROR: -=
-auth-token wrong size (21!=3D60)</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0px;margin-bottom:0px">PASS: [=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 OK ] auth_token_test_empty_user</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0px;margin-bottom:0px">--</span=
>
  <br><span dir=3D"ltr" style=3D"margin-top:0px;margin-bottom:0px">[ RUN=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 ] tls_crypt_v2_wrap_too_long_metadata</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0px;margin-bottom:0px">ERROR: c=
ould not crypt: insufficient space in dst</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0px;margin-bottom:0px">PASS: [=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 OK ] tls_crypt_v2_wrap_too_long_metada=
ta</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0px;margin-bottom:0px">--</span=
>
  <br><span dir=3D"ltr" style=3D"margin-top:0px;margin-bottom:0px">[ RUN=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 ] test_get_user_pass_inline_creds_assertions</s=
pan>
  <br><span dir=3D"ltr" style=3D"margin-top:0px;margin-bottom:0px">FATAL ER=
ROR:ERROR: UT username is empty</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0px;margin-bottom:0px">Expected=
 assertion FATAL ERROR occurred</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0px;margin-bottom:0px">PASS: [=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 OK ] test_get_user_pass_inline_creds_a=
ssertions</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0px;margin-bottom:0px">[ RUN=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 ] test_get_user_pass_authfile_stdin_assertions<=
/span>
  <br><span dir=3D"ltr" style=3D"margin-top:0px;margin-bottom:0px">FATAL ER=
ROR:ERROR: UT username is empty</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0px;margin-bottom:0px">Expected=
 assertion FATAL ERROR occurred</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0px;margin-bottom:0px">PASS: [=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 OK ] test_get_user_pass_authfile_stdin=
_assertions</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0px;margin-bottom:0px">[ RUN=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 ] test_get_user_pass_authfile_file_assertions</=
span>
  <br><span dir=3D"ltr" style=3D"margin-top:0px;margin-bottom:0px">FATAL ER=
ROR:Error reading username from UT authfile: ./unit_tests/openvpn/input/emp=
ty.txt</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0px;margin-bottom:0px">Expected=
 assertion FATAL ERROR occurred</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0px;margin-bottom:0px">FATAL ER=
ROR:Error reading password from UT authfile: ./unit_tests/openvpn/input/emp=
ty.txt</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0px;margin-bottom:0px">Expected=
 assertion FATAL ERROR occurred</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0px;margin-bottom:0px">PASS: [=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 OK ] test_get_user_pass_authfile_file_=
assertions</span>
  <br>
  <br><span dir=3D"ltr" style=3D"margin-top:0px;margin-bottom:0px">Louis</s=
pan>
  <br>
  <br><span dir=3D"ltr" style=3D"margin-top:0px;margin-bottom:0px">&gt;</sp=
an>
  <br><span dir=3D"ltr" style=3D"margin-top:0px;margin-bottom:0px">&gt; -Kh=
em</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0px;margin-bottom:0px">&gt;</sp=
an>
  <br><span dir=3D"ltr" style=3D"margin-top:0px;margin-bottom:0px">&gt;</sp=
an>
  <br><span dir=3D"ltr" style=3D"margin-top:0px;margin-bottom:0px">&gt; On =
Tue, May 12, 2026, 1:09=E2=80=AFAM Louis Rannou &lt;<a href=3D"mailto:louis=
.rannou@semalibre.com" target=3D"_blank" rel=3D"noreferrer">louis.rannou@se=
malibre.com</a>&gt; wrote:</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0px;margin-bottom:0px">&gt;&gt;=
 12 mai 2026 06:35:59 Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" ta=
rget=3D"_blank" rel=3D"noreferrer">raj.khem@gmail.com</a>&gt;:</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0px;margin-bottom:0px">&gt;&gt;=
</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0px;margin-bottom:0px">&gt;&gt;=
&gt;</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0px;margin-bottom:0px">&gt;&gt;=
&gt;</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0px;margin-bottom:0px">&gt;&gt;=
&gt; On Mon, May 11, 2026 at 4:56=E2=80=AFAM Louis Rannou via <a href=3D"ht=
tp://lists.openembedded.org" target=3D"_blank" rel=3D"noreferrer">lists.ope=
nembedded.org</a>[<a href=3D"http://lists.openembedded.org" target=3D"_blan=
k" rel=3D"noreferrer">http://lists.openembedded.org</a>][<a href=3D"http://=
lists.openembedded.org" target=3D"_blank" rel=3D"noreferrer">http://lists.o=
penembedded.org</a>] &lt;louis.rannou=3D<a href=3D"mailto:semalibre.com@lis=
ts.openembedded.org" target=3D"_blank" rel=3D"noreferrer">semalibre.com@lis=
ts.openembedded.org</a>&gt; wrote:</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0px;margin-bottom:0px">&gt;&gt;=
&gt;&gt; From: Louis Rannou &lt;<a href=3D"mailto:louis.rannou@non.se.com" =
target=3D"_blank" rel=3D"noreferrer">louis.rannou@non.se.com</a>&gt;</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0px;margin-bottom:0px">&gt;&gt;=
&gt;&gt;</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0px;margin-bottom:0px">&gt;&gt;=
&gt;&gt; The dns-updown script is written in bash which is under the GPLv3<=
/span>
  <br><span dir=3D"ltr" style=3D"margin-top:0px;margin-bottom:0px">&gt;&gt;=
&gt;&gt; license. As this script is optional, it is preffered to have it in=
 an extra</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0px;margin-bottom:0px">&gt;&gt;=
&gt;&gt; package.</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0px;margin-bottom:0px">&gt;&gt;=
&gt;</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0px;margin-bottom:0px">&gt;&gt;=
&gt; Does ptest work ok after this=C2=A0change=C2=A0?</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0px;margin-bottom:0px">&gt;&gt;=
</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0px;margin-bottom:0px">&gt;&gt;=
 I get some errors but I suppose they are parts of the test as the result l=
ooks fine:</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0px;margin-bottom:0px">&gt;&gt;=
</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0px;margin-bottom:0px">&gt;&gt;=
 DURATION: 84</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0px;margin-bottom:0px">&gt;&gt;=
 END: /usr/lib/openvpn/ptest</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0px;margin-bottom:0px">&gt;&gt;=
 2026-05-12T07:56</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0px;margin-bottom:0px">&gt;&gt;=
 STOP: ptest-runner</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0px;margin-bottom:0px">&gt;&gt;=
 TOTAL: 1 FAIL: 0</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0px;margin-bottom:0px">&gt;&gt;=
</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0px;margin-bottom:0px">&gt;&gt;=
</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0px;margin-bottom:0px">&gt;&gt;=
&gt; =C2=A0</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0px;margin-bottom:0px">&gt;&gt;=
&gt;&gt;</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0px;margin-bottom:0px">&gt;&gt;=
&gt;&gt; Signed-off-by: Louis Rannou &lt;<a href=3D"mailto:louis.rannou@non=
.se.com" target=3D"_blank" rel=3D"noreferrer">louis.rannou@non.se.com</a>&g=
t;</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0px;margin-bottom:0px">&gt;&gt;=
&gt;&gt; ---</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0px;margin-bottom:0px">&gt;&gt;=
&gt;&gt; change in v2: new package openvpn-dns-updown</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0px;margin-bottom:0px">&gt;&gt;=
&gt;&gt; ---</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0px;margin-bottom:0px">&gt;&gt;=
&gt;&gt; =C2=A0meta-networking/recipes-support/openvpn/<a href=3D"http://op=
envpn_2.7.0.bb" target=3D"_blank" rel=3D"noreferrer">openvpn_2.7.0.bb</a>[<=
a href=3D"http://openvpn_2.7.0.bb" target=3D"_blank" rel=3D"noreferrer">htt=
p://openvpn_2.7.0.bb</a>][<a href=3D"http://openvpn_2.7.0.bb" target=3D"_bl=
ank" rel=3D"noreferrer">http://openvpn_2.7.0.bb</a>] | 5 +++--</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0px;margin-bottom:0px">&gt;&gt;=
&gt;&gt; =C2=A01 file changed, 3 insertions(+), 2 deletions(-)</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0px;margin-bottom:0px">&gt;&gt;=
&gt;&gt;</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0px;margin-bottom:0px">&gt;&gt;=
&gt;&gt; diff --git a/meta-networking/recipes-support/openvpn/<a href=3D"ht=
tp://openvpn_2.7.0.bb" target=3D"_blank" rel=3D"noreferrer">openvpn_2.7.0.b=
b</a>[<a href=3D"http://openvpn_2.7.0.bb" target=3D"_blank" rel=3D"noreferr=
er">http://openvpn_2.7.0.bb</a>][<a href=3D"http://openvpn_2.7.0.bb" target=
=3D"_blank" rel=3D"noreferrer">http://openvpn_2.7.0.bb</a>] b/meta-networki=
ng/recipes-support/openvpn/<a href=3D"http://openvpn_2.7.0.bb" target=3D"_b=
lank" rel=3D"noreferrer">openvpn_2.7.0.bb</a>[<a href=3D"http://openvpn_2.7=
.0.bb" target=3D"_blank" rel=3D"noreferrer">http://openvpn_2.7.0.bb</a>][<a=
 href=3D"http://openvpn_2.7.0.bb" target=3D"_blank" rel=3D"noreferrer">http=
://openvpn_2.7.0.bb</a>]</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0px;margin-bottom:0px">&gt;&gt;=
&gt;&gt; index 0cbe4641cd..6ddebde4d1 100644</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0px;margin-bottom:0px">&gt;&gt;=
&gt;&gt; --- a/meta-networking/recipes-support/openvpn/<a href=3D"http://op=
envpn_2.7.0.bb" target=3D"_blank" rel=3D"noreferrer">openvpn_2.7.0.bb</a>[<=
a href=3D"http://openvpn_2.7.0.bb" target=3D"_blank" rel=3D"noreferrer">htt=
p://openvpn_2.7.0.bb</a>][<a href=3D"http://openvpn_2.7.0.bb" target=3D"_bl=
ank" rel=3D"noreferrer">http://openvpn_2.7.0.bb</a>]</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0px;margin-bottom:0px">&gt;&gt;=
&gt;&gt; +++ b/meta-networking/recipes-support/openvpn/<a href=3D"http://op=
envpn_2.7.0.bb" target=3D"_blank" rel=3D"noreferrer">openvpn_2.7.0.bb</a>[<=
a href=3D"http://openvpn_2.7.0.bb" target=3D"_blank" rel=3D"noreferrer">htt=
p://openvpn_2.7.0.bb</a>][<a href=3D"http://openvpn_2.7.0.bb" target=3D"_bl=
ank" rel=3D"noreferrer">http://openvpn_2.7.0.bb</a>]</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0px;margin-bottom:0px">&gt;&gt;=
&gt;&gt; @@ -47,7 +47,7 @@ PACKAGECONFIG[iproute2] =3D &quot;--enable-iprou=
te2,,iproute2,iproute2-ip&quot;</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0px;margin-bottom:0px">&gt;&gt;=
&gt;&gt; =C2=A0PACKAGECONFIG[systemd] =3D &quot;--enable-systemd,--disable-=
systemd,systemd&quot;</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0px;margin-bottom:0px">&gt;&gt;=
&gt;&gt; =C2=A0PACKAGECONFIG[selinux] =3D &quot;--enable-selinux,--disable-=
selinux,libselinux&quot;</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0px;margin-bottom:0px">&gt;&gt;=
&gt;&gt;</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0px;margin-bottom:0px">&gt;&gt;=
&gt;&gt; -RDEPENDS:${PN}:append =3D &quot; bash&quot;</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0px;margin-bottom:0px">&gt;&gt;=
&gt;&gt; +RDEPENDS:${PN}-dns-updown:append =3D &quot; bash&quot;</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0px;margin-bottom:0px">&gt;&gt;=
&gt;&gt; =C2=A0RDEPENDS:${PN}-ptest:append =3D &quot; bash&quot;</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0px;margin-bottom:0px">&gt;&gt;=
&gt;&gt;</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0px;margin-bottom:0px">&gt;&gt;=
&gt;&gt; =C2=A0do_install:append() {</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0px;margin-bottom:0px">&gt;&gt;=
&gt;&gt; @@ -114,7 +114,7 @@ do_install_ptest() {</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0px;margin-bottom:0px">&gt;&gt;=
&gt;&gt; =C2=A0 =C2=A0 =C2=A0cp -f ${S}/tests/t_lpback.sh ${D}/${PTEST_PATH=
}</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0px;margin-bottom:0px">&gt;&gt;=
&gt;&gt; =C2=A0}</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0px;margin-bottom:0px">&gt;&gt;=
&gt;&gt;</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0px;margin-bottom:0px">&gt;&gt;=
&gt;&gt; -PACKAGES =3D+ &quot; ${PN}-sample &quot;</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0px;margin-bottom:0px">&gt;&gt;=
&gt;&gt; +PACKAGES =3D+ &quot; ${PN}-dns-updown ${PN}-sample &quot;</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0px;margin-bottom:0px">&gt;&gt;=
&gt;&gt;</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0px;margin-bottom:0px">&gt;&gt;=
&gt;&gt; =C2=A0RRECOMMENDS:${PN} =3D &quot;kernel-module-tun&quot;</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0px;margin-bottom:0px">&gt;&gt;=
&gt;&gt;</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0px;margin-bottom:0px">&gt;&gt;=
&gt;&gt; @@ -124,5 +124,6 @@ FILES:${PN} +=3D &quot;${systemd_system_unitdi=
r}/openvpn-server@.service \</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0px;margin-bottom:0px">&gt;&gt;=
&gt;&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${sy=
stemd_system_unitdir}/openvpn-client@.service \</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0px;margin-bottom:0px">&gt;&gt;=
&gt;&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${no=
narch_libdir}/tmpfiles.d \</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0px;margin-bottom:0px">&gt;&gt;=
&gt;&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;</sp=
an>
  <br><span dir=3D"ltr" style=3D"margin-top:0px;margin-bottom:0px">&gt;&gt;=
&gt;&gt; +FILES:${PN}-dns-updown =3D &quot;${libexecdir}/openvpn/dns-updown=
&quot;</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0px;margin-bottom:0px">&gt;&gt;=
&gt;&gt; =C2=A0FILES:${PN}-sample =3D &quot;${sysconfdir}/openvpn/sample/ \=
</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0px;margin-bottom:0px">&gt;&gt;=
&gt;&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 &quot;</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0px;margin-bottom:0px">&gt;&gt;=
&gt;&gt;</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0px;margin-bottom:0px">&gt;&gt;=
&gt;&gt; ---</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0px;margin-bottom:0px">&gt;&gt;=
&gt;&gt; base-commit: 420222862f5a6d95023b8f5f3b7e1808b2264ef9</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0px;margin-bottom:0px">&gt;&gt;=
&gt;&gt; change-id: 20260506-bash-rr-5fd0820519e4</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0px;margin-bottom:0px">&gt;&gt;=
&gt;&gt;</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0px;margin-bottom:0px">&gt;&gt;=
&gt;&gt; Best regards,</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0px;margin-bottom:0px">&gt;&gt;=
&gt;&gt; --</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0px;margin-bottom:0px">&gt;&gt;=
&gt;&gt; Louis Rannou &lt;<a href=3D"mailto:louis.rannou@non.se.com" target=
=3D"_blank" rel=3D"noreferrer">louis.rannou@non.se.com</a>&gt;</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0px;margin-bottom:0px">&gt;&gt;=
&gt;&gt;</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0px;margin-bottom:0px">&gt;&gt;=
&gt;&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0px;margin-bottom:0px">&gt;&gt;=
&gt;&gt; Links: You receive all messages sent to this group.</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0px;margin-bottom:0px">&gt;&gt;=
&gt;&gt; View/Reply Online (#126849): <a href=3D"https://lists.openembedded=
.org/g/openembedded-devel/message/126849" target=3D"_blank" rel=3D"noreferr=
er">https://lists.openembedded.org/g/openembedded-devel/message/126849</a><=
/span>
  <br><span dir=3D"ltr" style=3D"margin-top:0px;margin-bottom:0px">&gt;&gt;=
&gt;&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/1192=
54470/1997914" target=3D"_blank" rel=3D"noreferrer">https://lists.openembed=
ded.org/mt/119254470/1997914</a></span>
  <br><span dir=3D"ltr" style=3D"margin-top:0px;margin-bottom:0px">&gt;&gt;=
&gt;&gt; Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.op=
enembedded.org" target=3D"_blank" rel=3D"noreferrer">openembedded-devel+own=
er@lists.openembedded.org</a>[<a href=3D"mailto:openembedded-devel%252Bowne=
r@lists.openembedded.org" target=3D"_blank" rel=3D"noreferrer">openembedded=
-devel%2Bowner@lists.openembedded.org</a>][<a href=3D"mailto:openembedded-d=
evel%252Bowner@lists.openembedded.org" target=3D"_blank" rel=3D"noreferrer"=
>openembedded-devel%2Bowner@lists.openembedded.org</a>[<a href=3D"mailto:op=
enembedded-devel%25252Bowner@lists.openembedded.org" target=3D"_blank" rel=
=3D"noreferrer">openembedded-devel%252Bowner@lists.openembedded.org</a>]]</=
span>
  <br><span dir=3D"ltr" style=3D"margin-top:0px;margin-bottom:0px">&gt;&gt;=
&gt;&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembed=
ded-devel/unsub" target=3D"_blank" rel=3D"noreferrer">https://lists.openemb=
edded.org/g/openembedded-devel/unsub</a> [<a href=3D"mailto:raj.khem@gmail.=
com" target=3D"_blank" rel=3D"noreferrer">raj.khem@gmail.com</a>]</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0px;margin-bottom:0px">&gt;&gt;=
&gt;&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0px;margin-bottom:0px">&gt;&gt;=
&gt;&gt;</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0px;margin-bottom:0px">&gt;&gt;=
</span>
  <br>
  <br>
 </div>
</blockquote></div>

--000000000000e1523e0651a005a8--

