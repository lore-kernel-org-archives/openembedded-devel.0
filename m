Return-Path: <devendra.tewari@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A530C433FE
	for <webhook@archiver.kernel.org>; Sat,  8 Oct 2022 11:22:22 +0000 (UTC)
Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com
 [209.85.160.41])
 by mx.groups.io with SMTP id smtpd.web11.2994.1665228134905864635
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 08 Oct 2022 04:22:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=UA2alznO;
 spf=pass (domain: gmail.com, ip: 209.85.160.41,
 mailfrom: devendra.tewari@gmail.com)
Received: by mail-oa1-f41.google.com with SMTP id
 586e51a60fabf-132fb4fd495so8076460fac.12
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 08 Oct 2022 04:22:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=references:to:cc:in-reply-to:date:subject:mime-version:message-id
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=kePaA6nO0jn/HBk6ABRDttc+kZ3hNPLnLRR7Bgg8vWA=;
        b=UA2alznOzfwrP8nPkuKZgG2Yqlb8ZF+Hz+RpRq2fH1ApstAM2SKPrmA8dmE4/yoqBU
         BALXCKUhtmDysuYFmyZM71QFuA+Bfcq3BeUrXQGATUpKKAp1arJfjpc7h9kMyT7bbke4
         tqSqpZepGd7CrxCTvMrcRN76l3x+wzzdqjFBQupHJd2eXRLKD18hP6ebCwaAXJx6MPXw
         AX1jsg1Y926u4Ni77lBRkeLNCAVvhF3OuhRWQcTRSOiFoRKhMFcgiDlBXT5ksx2akG34
         fvz0dw2RqoDry3ywe86YnCD0TV8SFJOG4gNLM0QB5BenpLNHASbBh65g1+3A9SF0l4aY
         Wrbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=references:to:cc:in-reply-to:date:subject:mime-version:message-id
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kePaA6nO0jn/HBk6ABRDttc+kZ3hNPLnLRR7Bgg8vWA=;
        b=2bfHvzfeB5lxkP3au6JNckH/2MfR3gBXIrqooMDCBN3fbFUkGnquIIbeyksulxsF7C
         ICtA6GZa9kQxUHM+8Fazv5ZDo9SDN/EvORYUz+tmtZxosXJaMBUPgMOhf3YA2/9QvU+/
         Ymd392qR6KOvRjRhF5I++d/3hSQ5JP1fgMsd5flg44yiPdpIy4ZLPn/Ez01T4yi3TXB9
         r23sBnmwH3lpfVYE43OqQz9bwOAbkj8sgzEYrfNCQZHYpDhy8CU/8AczgdIEUITNoAnM
         hl9DQcBgNkMcvOBeCML6iGpdfqEEhBc3jzkeo8kRHoB1LO20O1iwKMuVzLDURUVp/B8y
         FN6Q==
X-Gm-Message-State: ACrzQf3tQDVi1V3wd7rhu9BEKy2g5fvX7YHQUH2Y5sj/BV5lAk52Zgaf
	pe9UWVCRM8jyVZiLUKY3oyLper8cnS4=
X-Google-Smtp-Source: 
 AMsMyM6EcqGqpZg0LcZyNy1uPUW3VeGDspHnfcHvWAWrEN1HckIHYxAoo/1hZz+Ui7Ko/UPwxz+/pw==
X-Received: by 2002:a05:6870:e40c:b0:132:8577:98da with SMTP id
 n12-20020a056870e40c00b00132857798damr10549027oag.205.1665228134165;
        Sat, 08 Oct 2022 04:22:14 -0700 (PDT)
Received: from smtpclient.apple ([186.212.115.217])
        by smtp.gmail.com with ESMTPSA id
 k13-20020a4ab28d000000b0044b0465bd07sm2052960ooo.20.2022.10.08.04.22.12
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 08 Oct 2022 04:22:13 -0700 (PDT)
From: Devendra Tewari <devendra.tewari@gmail.com>
Message-Id: <AA2A1A24-3C5A-4C63-891F-1A77F83B7FEF@gmail.com>
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_795DB145-D7EB-4CEB-B378-E15DEDEAE129"
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.200.92\))
Subject: Re: [meta-multimedia][PATCH] libcamera: Bump SRCREV and add libyaml
 to DEPENDS
Date: Sat, 8 Oct 2022 08:21:59 -0300
In-Reply-To: <166517920106.1077487.15426023243871877268@Monstersaurus>
Cc: openembedded-devel@lists.openembedded.org
To: Kieran Bingham <kieran.bingham@ideasonboard.com>
References: <20221004225106.29537-1-devendra.tewari@gmail.com>
 <166517920106.1077487.15426023243871877268@Monstersaurus>
X-Mailer: Apple Mail (2.3731.200.92)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 08 Oct 2022 11:22:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/99097


--Apple-Mail=_795DB145-D7EB-4CEB-B378-E15DEDEAE129
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8



> On 7 Oct 2022, at 18:46, Kieran Bingham =
<kieran.bingham@ideasonboard.com> wrote:
>=20
> Quoting Devendra Tewari (2022-10-04 23:51:06)
>> Signed-off-by: Devendra Tewari <devendra.tewari@gmail.com>
>> ---
>> meta-multimedia/recipes-multimedia/libcamera/libcamera.bb | 4 ++--
>> 1 file changed, 2 insertions(+), 2 deletions(-)
>>=20
>> diff --git =
a/meta-multimedia/recipes-multimedia/libcamera/libcamera.bb =
b/meta-multimedia/recipes-multimedia/libcamera/libcamera.bb
>> index 0b9f3f7a5d6..2d3f5e94937 100644
>> --- a/meta-multimedia/recipes-multimedia/libcamera/libcamera.bb
>> +++ b/meta-multimedia/recipes-multimedia/libcamera/libcamera.bb
>> @@ -12,13 +12,13 @@ SRC_URI =3D " \
>>         =
git://git.libcamera.org/libcamera/libcamera.git;protocol=3Dhttps;branch=3D=
master \
>> "
>>=20
>> -SRCREV =3D "acf8d028edda0a59b10e15962c2606137a4940af"
>> +SRCREV =3D "ed591e705c451d0ce14988ae96829a31a2ae2f9a"
>>=20
>> PV =3D "202105+git${SRCPV}"
>>=20
>> S =3D "${WORKDIR}/git"
>>=20
>> -DEPENDS =3D "python3-pyyaml-native python3-jinja2-native =
python3-ply-native python3-jinja2-native udev gnutls boost =
chrpath-native libevent"
>> +DEPENDS =3D "python3-pyyaml-native python3-jinja2-native =
python3-ply-native python3-jinja2-native udev gnutls boost =
chrpath-native libevent libyaml"
>=20
> I believe boost can now be removed from these dependencies.

I=E2=80=99ve sent out an updated patch without boost. Please ignore this =
patch.

> --
> Kieran
>=20
>=20
>> DEPENDS +=3D "${@bb.utils.contains('DISTRO_FEATURES', 'qt', 'qtbase =
qtbase-native', '', d)}"
>>=20
>> PACKAGES =3D+ "${PN}-gst"
>> --=20
>> 2.37.3

Thanks,
Devendra


--Apple-Mail=_795DB145-D7EB-4CEB-B378-E15DEDEAE129
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; =
charset=3Dutf-8"></head><body style=3D"overflow-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: =
after-white-space;"><br><div><br><blockquote type=3D"cite"><div>On 7 Oct =
2022, at 18:46, Kieran Bingham &lt;kieran.bingham@ideasonboard.com&gt; =
wrote:</div><br class=3D"Apple-interchange-newline"><div><meta =
charset=3D"UTF-8"><span style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: 400; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none; float: none; display: inline !important;">Quoting Devendra Tewari =
(2022-10-04 23:51:06)</span><br style=3D"caret-color: rgb(0, 0, 0); =
font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: 400; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;"><blockquote type=3D"cite" style=3D"font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: 400; letter-spacing: normal; orphans: auto; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; =
-webkit-text-stroke-width: 0px; text-decoration: none;">Signed-off-by: =
Devendra Tewari =
&lt;devendra.tewari@gmail.com&gt;<br>---<br>meta-multimedia/recipes-multim=
edia/libcamera/libcamera.bb | 4 ++--<br>1 file changed, 2 insertions(+), =
2 deletions(-)<br><br>diff --git =
a/meta-multimedia/recipes-multimedia/libcamera/libcamera.bb =
b/meta-multimedia/recipes-multimedia/libcamera/libcamera.bb<br>index =
0b9f3f7a5d6..2d3f5e94937 100644<br>--- =
a/meta-multimedia/recipes-multimedia/libcamera/libcamera.bb<br>+++ =
b/meta-multimedia/recipes-multimedia/libcamera/libcamera.bb<br>@@ -12,13 =
+12,13 @@ SRC_URI =3D " =
\<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;git://git.libcamera.o=
rg/libcamera/libcamera.git;protocol=3Dhttps;branch=3Dmaster =
\<br>"<br><br>-SRCREV =3D =
"acf8d028edda0a59b10e15962c2606137a4940af"<br>+SRCREV =3D =
"ed591e705c451d0ce14988ae96829a31a2ae2f9a"<br><br>PV =3D =
"202105+git${SRCPV}"<br><br>S =3D "${WORKDIR}/git"<br><br>-DEPENDS =3D =
"python3-pyyaml-native python3-jinja2-native python3-ply-native =
python3-jinja2-native udev gnutls boost chrpath-native =
libevent"<br>+DEPENDS =3D "python3-pyyaml-native python3-jinja2-native =
python3-ply-native python3-jinja2-native udev gnutls boost =
chrpath-native libevent libyaml"<br></blockquote><br style=3D"caret-color:=
 rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; font-style: =
normal; font-variant-caps: normal; font-weight: 400; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;"><span style=3D"caret-color: rgb(0, 0, 0); =
font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: 400; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;">I =
believe boost can now be removed from these dependencies.</span><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: 400; =
letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: =
none;"></div></blockquote><div><br></div><div>I=E2=80=99ve sent out an =
updated patch without boost. Please ignore this =
patch.</div><br><blockquote type=3D"cite"><div><span style=3D"caret-color:=
 rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; font-style: =
normal; font-variant-caps: normal; font-weight: 400; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline =
!important;">--</span><br style=3D"caret-color: rgb(0, 0, 0); =
font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: 400; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;"><span style=3D"caret-color: rgb(0, 0, 0); =
font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: 400; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline =
!important;">Kieran</span><br style=3D"caret-color: rgb(0, 0, 0); =
font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: 400; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;"><br style=3D"caret-color: rgb(0, 0, 0); =
font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: 400; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;"><br style=3D"caret-color: rgb(0, 0, 0); =
font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: 400; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;"><blockquote type=3D"cite" style=3D"font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: 400; letter-spacing: normal; orphans: auto; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; =
-webkit-text-stroke-width: 0px; text-decoration: none;">DEPENDS +=3D =
"${@bb.utils.contains('DISTRO_FEATURES', 'qt', 'qtbase qtbase-native', =
'', d)}"<br><br>PACKAGES =3D+ "${PN}-gst"<br>--<span =
class=3D"Apple-converted-space">&nbsp;</span><br>2.37.3</blockquote></div>=
</blockquote></div><br><div>Thanks,</div><div>Devendra</div><div><br></div=
></body></html>=

--Apple-Mail=_795DB145-D7EB-4CEB-B378-E15DEDEAE129--

