Return-Path: <otavio.salvador@ossystems.com.br>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C63E5C43334
	for <webhook@archiver.kernel.org>; Fri,  1 Jul 2022 11:45:17 +0000 (UTC)
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com
 [209.85.219.46])
 by mx.groups.io with SMTP id smtpd.web09.37362.1656675913792724290
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 01 Jul 2022 04:45:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ossystems-com-br.20210112.gappssmtp.com header.s=20210112
 header.b=visXeClC;
 spf=pass (domain: ossystems.com.br, ip: 209.85.219.46,
 mailfrom: otavio.salvador@ossystems.com.br)
Received: by mail-qv1-f46.google.com with SMTP id c1so3835410qvi.11
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 01 Jul 2022 04:45:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ossystems-com-br.20210112.gappssmtp.com; s=20210112;
        h=from:mime-version:references:in-reply-to:date:message-id:subject:to
         :cc;
        bh=VnC3sQiRQqtCF3ytSwYSgOWjt2r1Urxz1Uq8duDXioc=;
        b=visXeClC0Z6tUgQRJUSscFRmbzfVoAXulVllPmr9AiFNmEXYr52BROGZ9dwIU3MZ4c
         Vwt7dPCMgnZT4uvPhWHPyoNKfJGohVZ3Lie6bzxUe2O0BEOR/gKyDCZXyCOaSYLYRG1R
         Ll8TZ8Rfj9+/nU4AmJC7mrIO9f9+DhB+KCgXAD6Hrlgu3LQVVW1lW4nfQcD2hPmlVKgU
         AVL7QXZvs63fawIKeURSP3ukOtdLAGcmISKkwLlIL5Mai8lmUhmB/8AYipZY5FBcMqVi
         Pwslo9ubKDsYkrK9RHMB6yl/wIKePWtTTDHkEU2LhIs0Vscio2UnUPpsugcop4QKK1NG
         OZfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:mime-version:references:in-reply-to:date
         :message-id:subject:to:cc;
        bh=VnC3sQiRQqtCF3ytSwYSgOWjt2r1Urxz1Uq8duDXioc=;
        b=p6atiDbmcEuzb0Dl32o0PRzHmEUx/iRNd1u99mTGsI4PZNDn2MU2/98DOWKsWF9o77
         U2iMfO+t2b3C1w1nlaWGGgbu6mSMduof+A5S0qqlxOL2T8BCcYfhpifY4aCtcP88pve1
         aAUzb/NCqIRrNkElF7y+ak2Ar4+ukBjU3OAOO0zNY6TfQ4nVp8bc+EO3i9y48Lhia4iM
         O2xJ/Ql0ckV7rFFBFetU2UgM83zDG3HIdMfBzKWfzxErDme0w3BvNkxbcskjGtxsAlSc
         rbFVAUjz6gYfMbkg+UMupxqshDt/T+mjH97iN3j6powg4E45S0E+1wJtha+LVxxTUSCJ
         I98Q==
X-Gm-Message-State: AJIora89Qo10fzMGoT75PyQeSc0Ad3INE/LTu18/La5Dnv/eKIJ8qTAf
	xypZyCF4oeECcnkB4Bcyq7Pchh+f/lhPjBFv
X-Google-Smtp-Source: 
 AGRyM1s+uIHg8kZveWyJWDh4aU3jwDDWl7dA38GZd+F4s4TH1a8jdK6pBpAYtNRlaBn3Be0SYLld3w==
X-Received: by 2002:a05:6214:238b:b0:470:4e6f:af4e with SMTP id
 fw11-20020a056214238b00b004704e6faf4emr15473952qvb.91.1656675912359;
        Fri, 01 Jul 2022 04:45:12 -0700 (PDT)
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com.
 [209.85.222.172])
        by smtp.gmail.com with ESMTPSA id
 h4-20020a05620a284400b006a787380a5csm18164980qkp.67.2022.07.01.04.45.11
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Jul 2022 04:45:11 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-qk1-f172.google.com with SMTP id n10so1598378qkn.10
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 01 Jul 2022 04:45:11 -0700 (PDT)
X-Received: by 2002:a37:8ec3:0:b0:6ae:e5e2:b956 with SMTP id
 q186-20020a378ec3000000b006aee5e2b956mr9901938qkd.280.1656675911463; Fri, 01
 Jul 2022 04:45:11 -0700 (PDT)
MIME-Version: 1.0
References: <20220627133914.14615-1-javier.viguera@digi.com>
In-Reply-To: <20220627133914.14615-1-javier.viguera@digi.com>
Date: Fri, 1 Jul 2022 08:44:59 -0300
X-Gmail-Original-Message-ID: 
 <CAP9ODKqZTpwwUP8QiZiRVFPNT-fUhv8zm6sboChC7U72=X9gYw@mail.gmail.com>
Message-ID: 
 <CAP9ODKqZTpwwUP8QiZiRVFPNT-fUhv8zm6sboChC7U72=X9gYw@mail.gmail.com>
Subject: Re: [oe] [meta-networking][kirkstone][PATCH] networkmanager: fix
 build with enabled ppp
To: Javier Viguera <javier.viguera@digi.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
	akuster808 <akuster808@gmail.com>
Content-Type: multipart/alternative; boundary="00000000000035f7c205e2bceb8a"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 01 Jul 2022 11:45:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97663

--00000000000035f7c205e2bceb8a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Em seg., 27 de jun. de 2022 =C3=A0s 10:39, Javier Viguera via
lists.openembedded.org <javier.viguera=3Ddigi.com@lists.openembedded.org>
escreveu:

> If 'ppp' packageconfig option is enabled, but the build system does NOT
> have pppd binary installed, the build fails with:
>
> | Has header "pppd/pppd.h" : YES
> | Program pppd /sbin/pppd /usr/sbin/pppd found: NO
> |
> | ../NetworkManager-1.36.2/meson.build:570:4: ERROR: Assert failed: pppd
> required but not found, please provide a valid pppd path or use -Dppp=3Df=
alse
> to disable it
>
> This is due to meson trying to look for the 'pppd' binary in the build
> system when it should not. If the build system does not contain pppd,
> the build fails.
>
> Signed-off-by: Javier Viguera <javier.viguera@digi.com>
>

Please send it against master, first, then we can ask for backports.

--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750

--00000000000035f7c205e2bceb8a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Em seg., 27 de jun. de 2022 =C3=A0s 1=
0:39, Javier Viguera via <a href=3D"http://lists.openembedded.org">lists.op=
enembedded.org</a> &lt;javier.viguera=3D<a href=3D"mailto:digi.com@lists.op=
enembedded.org">digi.com@lists.openembedded.org</a>&gt; escreveu:<br></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">If &#39;ppp&#39; packagec=
onfig option is enabled, but the build system does NOT<br>
have pppd binary installed, the build fails with:<br>
<br>
| Has header &quot;pppd/pppd.h&quot; : YES<br>
| Program pppd /sbin/pppd /usr/sbin/pppd found: NO<br>
|<br>
| ../NetworkManager-1.36.2/meson.build:570:4: ERROR: Assert failed: pppd re=
quired but not found, please provide a valid pppd path or use -Dppp=3Dfalse=
 to disable it<br>
<br>
This is due to meson trying to look for the &#39;pppd&#39; binary in the bu=
ild<br>
system when it should not. If the build system does not contain pppd,<br>
the build fails.<br>
<br>
Signed-off-by: Javier Viguera &lt;<a href=3D"mailto:javier.viguera@digi.com=
" target=3D"_blank">javier.viguera@digi.com</a>&gt;<br></blockquote><div><b=
r></div><div>Please send it against master, first, then we can ask for back=
ports.</div><div>=C2=A0</div></div>-- <br><div dir=3D"ltr" class=3D"gmail_s=
ignature">Otavio Salvador =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 O.S. Systems<br><a href=3D=
"http://www.ossystems.com.br" target=3D"_blank">http://www.ossystems.com.br=
</a> =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://code.ossystems.com.br" ta=
rget=3D"_blank">http://code.ossystems.com.br</a><br>Mobile: +55 (53) 9 9981=
-7854 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Mobile: +1 (347) 903-9750</div></di=
v>

--00000000000035f7c205e2bceb8a--

