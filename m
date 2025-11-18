Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C8D8CEE32E
	for <webhook@archiver.kernel.org>; Tue, 18 Nov 2025 15:54:30 +0000 (UTC)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.312.1763481265782962508
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 Nov 2025 07:54:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Fo1z6yfp;
 spf=pass (domain: gmail.com, ip: 209.85.128.170, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-786d1658793so51754077b3.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 18 Nov 2025 07:54:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763481265; x=1764086065; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7AtA2m39Qwt6hBaQ4AQfCrmNMBeNso4chtOUrJKaPuM=;
        b=Fo1z6yfp3TiKJoYilI/k94dKrBDGdljVCtjwteF0b76cty0xNt9i/uJjgTJ45OJmTu
         uRhfuv3hn9UOffXJLWlYZq9KijTUcbnDUZfDKzFmYuN+ia1wSxi9+6Eo43C0Y2zMSoGA
         JpXKmwtARmuEYMzzL6AeVQQNhT9dqNBCTr8qEUNm+QAL+c8mAhXwtjbAhGUjeHcrK5/y
         W95wJr2lnciTC7vtF6OCIk8XzdWgt4Cdmg1bwyhauGK/0rmZWZtGCiJCpViiGv6SCO/D
         IYIxY/JIusWqAn+QpkxAJVZNrTCmfyTT4UvBZqxPh73jFfBfqtlbwUUfiDanbVzwrBQY
         AraQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763481265; x=1764086065;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7AtA2m39Qwt6hBaQ4AQfCrmNMBeNso4chtOUrJKaPuM=;
        b=LkPCCILdybSeBrIYur4g+j5hpH7gca7EW3oxbL1TghPkefRrRaJ7YDRxRNdZhb61E1
         gSfiLtFFWiyjtpoSrV2pIZcYsSR+hHWzVgwWIOIebUaoJ+YLlo7yTUkW84at2jDDHPaO
         B7aOuz0eiH8WRQnoYBu7y/rVbEz4e1d6ZhyoqJtuUjEsp6rhO3dq/B10NUwqDR1Dc/rG
         PbxNFPOk9wmTebBSRDHkcv2tnec0GzWNvImFMN7+z9dbtwHyBaOgi1ahPbr6yCHON8qU
         GUYrKGS3e3NNS3Wzi2ii9jyPiKJ6yqj2m74cofb15YCAVDozWVviq28pw9p6sopQH/0b
         p6kQ==
X-Forwarded-Encrypted: i=1; AJvYcCWnJ0GQxMESz5irg3roUywHdXtQEchSjVbQpcO+jtnzjWBsvWIgt+RiItiYHAvo5IoikMVNBL27GmjmQbubVG8ay3o=@lists.openembedded.org
X-Gm-Message-State: AOJu0YxT+Vn7qZIIffPixukg8IQ3td0EiR9gt0NO/G24Vhkoy9a8NNaD
	3aPCxX501XikOpSRhs80+h4AAsRYkHxoGw0nHma/vI9roNdmVEV83Sr3DG2Raa3njRFvt1hlX0y
	fSDFizyENdFSWY9a+qYc1TW7KfDMBook=
X-Gm-Gg: ASbGncsNM6xUkRq0e1WIxaMsIJkm6Yny/Nm6cMLKWtbexatADdnFF5b07UHSJIlDJT0
	9erLedTWkYvDepGitPDs9mso9xNb1E6zlRW+hSgBBfRSBKEBb1oycilBJ1txFH4ZBpOXszApXIO
	6GlidrWjKxWxD7jneBHORRXKSrje5So4JUkQqGJfWV0doWho49blUYlpCYQXigdoPTbEfGojtkg
	a/JZ2reqkwaAi94f/cDxSmw6sUALgzIYh5TMcs+gGD3DyoGDlpCvxvRRez0H7bKfSv8PInP61n0
	NVd1G/4yHxjifx4DtmNUNI5xUur87Z1c18HEMp+veKMCq4foujugW18hqYohzaYW9H3q060WVQA
	veGyQoZnysZDNdEZaJ46WLtahxD6xaasL89ZwN8ELm4kCXA==
X-Google-Smtp-Source: AGHT+IGEeUtNcQ1K2OU2QKUoh9LQTt+VdSWGuZ1cGdcJSYJ65g1V7Vwss3Ww0tK2YIr6Dx4Yw7i+qpmAjh/9rFU8vMs=
X-Received: by 2002:a05:690c:3507:b0:786:96de:af5f with SMTP id
 00721157ae682-78929ef8948mr278649997b3.53.1763481264866; Tue, 18 Nov 2025
 07:54:24 -0800 (PST)
MIME-Version: 1.0
References: <20251117093853.844143-1-skandigraun@gmail.com> <BA866AFA-CD11-4615-8AA4-04646194A330@arm.com>
In-Reply-To: <BA866AFA-CD11-4615-8AA4-04646194A330@arm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 18 Nov 2025 07:54:13 -0800
X-Gm-Features: AWmQ_bltf7ulNebsE3fVO4DHpQmN46B2JcWQ4F90b54ibAhpYrsScrijBG4Zt60
Message-ID: <CAMKF1sq9Oi45L2okL4PtEwCQNmeMAa7UjuNnQOwEd=VUU20JJQ@mail.gmail.com>
Subject: Re: [oe] CVE report - master - 2025-11-17
To: ross.burton@arm.com
Cc: "skandigraun@gmail.com" <skandigraun@gmail.com>, 
	"openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000005c4a690643e07aaa"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Nov 2025 15:54:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121861

--0000000000005c4a690643e07aaa
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 18, 2025 at 6:53=E2=80=AFAM Ross Burton via lists.openembedded.=
org
<ross.burton=3Darm.com@lists.openembedded.org> wrote:

> On 17 Nov 2025, at 09:38, Gyorgy Sarvari via lists.openembedded.org
> <skandigraun=3Dgmail.com@lists.openembedded.org> wrote:
> >
> > - yasm: CVE-2021-33455: https://nvd.nist.gov/vuln/detail/CVE-2021-33455
> > - yasm: CVE-2021-33457: https://nvd.nist.gov/vuln/detail/CVE-2021-33457
> > - yasm: CVE-2021-33458: https://nvd.nist.gov/vuln/detail/CVE-2021-33458
> > - yasm: CVE-2021-33459: https://nvd.nist.gov/vuln/detail/CVE-2021-33459
> > - yasm: CVE-2021-33460: https://nvd.nist.gov/vuln/detail/CVE-2021-33460
> > - yasm: CVE-2021-33461: https://nvd.nist.gov/vuln/detail/CVE-2021-33461
> > - yasm: CVE-2021-33462: https://nvd.nist.gov/vuln/detail/CVE-2021-33462
> > - yasm: CVE-2021-33463: https://nvd.nist.gov/vuln/detail/CVE-2021-33463
> > - yasm: CVE-2021-33465: https://nvd.nist.gov/vuln/detail/CVE-2021-33465
> > - yasm: CVE-2021-33466: https://nvd.nist.gov/vuln/detail/CVE-2021-33466
> > - yasm: CVE-2021-33467: https://nvd.nist.gov/vuln/detail/CVE-2021-33467
> > - yasm: CVE-2021-33468: https://nvd.nist.gov/vuln/detail/CVE-2021-33468
> > - yasm: CVE-2023-30402: https://nvd.nist.gov/vuln/detail/CVE-2023-30402
> > - yasm: CVE-2023-31972: https://nvd.nist.gov/vuln/detail/CVE-2023-31972
> > - yasm: CVE-2023-31973: https://nvd.nist.gov/vuln/detail/CVE-2023-31973
> > - yasm: CVE-2023-31974: https://nvd.nist.gov/vuln/detail/CVE-2023-31974
> > - yasm: CVE-2023-51258: https://nvd.nist.gov/vuln/detail/CVE-2023-51258
>
> Proposal: delete yasm.  It advertises itself as a rewrite of nasm, but
> nasm is still alive and did a major release just a few months ago. Nothin=
g
> else in meta-oe depends on yasm, and according to the layer index[1] the
> only interesting recipe that depends on yasm is chromium, which I basical=
ly
> refuse to believe won=E2=80=99t work with nasm (mainly as the debian pack=
aging for
> chromium doesn=E2=80=99t depend on nasm or yasm[2] so this dependency is =
likely
> obsolete now).
>
> I can send a patch... :)


I think we need to ensure chromium can still build without it otherwise I
am with you on this proposal

>
>
> Cheers,
> Ross
>
> [1]
> https://layers.openembedded.org/layerindex/branch/master/recipes/?q=3Ddep=
ends%3Ayasm-native
> [2]
> https://salsa.debian.org/chromium-team/chromium/-/blob/master/debian/cont=
rol
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#121860):
> https://lists.openembedded.org/g/openembedded-devel/message/121860
> Mute This Topic: https://lists.openembedded.org/mt/116334910/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000005c4a690643e07aaa
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote gmail_quote_container"><d=
iv dir=3D"ltr" class=3D"gmail_attr">On Tue, Nov 18, 2025 at 6:53=E2=80=AFAM=
 Ross Burton via <a href=3D"http://lists.openembedded.org">lists.openembedd=
ed.org</a> &lt;ross.burton=3D<a href=3D"mailto:arm.com@lists.openembedded.o=
rg">arm.com@lists.openembedded.org</a>&gt; wrote:<br></div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;pad=
ding-left:1ex">On 17 Nov 2025, at 09:38, Gyorgy Sarvari via <a href=3D"http=
://lists.openembedded.org" rel=3D"noreferrer" target=3D"_blank">lists.opene=
mbedded.org</a> &lt;skandigraun=3D<a href=3D"mailto:gmail.com@lists.openemb=
edded.org" target=3D"_blank">gmail.com@lists.openembedded.org</a>&gt; wrote=
:<br>
&gt; <br>
&gt; - yasm: CVE-2021-33455: <a href=3D"https://nvd.nist.gov/vuln/detail/CV=
E-2021-33455" rel=3D"noreferrer" target=3D"_blank">https://nvd.nist.gov/vul=
n/detail/CVE-2021-33455</a><br>
&gt; - yasm: CVE-2021-33457: <a href=3D"https://nvd.nist.gov/vuln/detail/CV=
E-2021-33457" rel=3D"noreferrer" target=3D"_blank">https://nvd.nist.gov/vul=
n/detail/CVE-2021-33457</a><br>
&gt; - yasm: CVE-2021-33458: <a href=3D"https://nvd.nist.gov/vuln/detail/CV=
E-2021-33458" rel=3D"noreferrer" target=3D"_blank">https://nvd.nist.gov/vul=
n/detail/CVE-2021-33458</a><br>
&gt; - yasm: CVE-2021-33459: <a href=3D"https://nvd.nist.gov/vuln/detail/CV=
E-2021-33459" rel=3D"noreferrer" target=3D"_blank">https://nvd.nist.gov/vul=
n/detail/CVE-2021-33459</a><br>
&gt; - yasm: CVE-2021-33460: <a href=3D"https://nvd.nist.gov/vuln/detail/CV=
E-2021-33460" rel=3D"noreferrer" target=3D"_blank">https://nvd.nist.gov/vul=
n/detail/CVE-2021-33460</a><br>
&gt; - yasm: CVE-2021-33461: <a href=3D"https://nvd.nist.gov/vuln/detail/CV=
E-2021-33461" rel=3D"noreferrer" target=3D"_blank">https://nvd.nist.gov/vul=
n/detail/CVE-2021-33461</a><br>
&gt; - yasm: CVE-2021-33462: <a href=3D"https://nvd.nist.gov/vuln/detail/CV=
E-2021-33462" rel=3D"noreferrer" target=3D"_blank">https://nvd.nist.gov/vul=
n/detail/CVE-2021-33462</a><br>
&gt; - yasm: CVE-2021-33463: <a href=3D"https://nvd.nist.gov/vuln/detail/CV=
E-2021-33463" rel=3D"noreferrer" target=3D"_blank">https://nvd.nist.gov/vul=
n/detail/CVE-2021-33463</a><br>
&gt; - yasm: CVE-2021-33465: <a href=3D"https://nvd.nist.gov/vuln/detail/CV=
E-2021-33465" rel=3D"noreferrer" target=3D"_blank">https://nvd.nist.gov/vul=
n/detail/CVE-2021-33465</a><br>
&gt; - yasm: CVE-2021-33466: <a href=3D"https://nvd.nist.gov/vuln/detail/CV=
E-2021-33466" rel=3D"noreferrer" target=3D"_blank">https://nvd.nist.gov/vul=
n/detail/CVE-2021-33466</a><br>
&gt; - yasm: CVE-2021-33467: <a href=3D"https://nvd.nist.gov/vuln/detail/CV=
E-2021-33467" rel=3D"noreferrer" target=3D"_blank">https://nvd.nist.gov/vul=
n/detail/CVE-2021-33467</a><br>
&gt; - yasm: CVE-2021-33468: <a href=3D"https://nvd.nist.gov/vuln/detail/CV=
E-2021-33468" rel=3D"noreferrer" target=3D"_blank">https://nvd.nist.gov/vul=
n/detail/CVE-2021-33468</a><br>
&gt; - yasm: CVE-2023-30402: <a href=3D"https://nvd.nist.gov/vuln/detail/CV=
E-2023-30402" rel=3D"noreferrer" target=3D"_blank">https://nvd.nist.gov/vul=
n/detail/CVE-2023-30402</a><br>
&gt; - yasm: CVE-2023-31972: <a href=3D"https://nvd.nist.gov/vuln/detail/CV=
E-2023-31972" rel=3D"noreferrer" target=3D"_blank">https://nvd.nist.gov/vul=
n/detail/CVE-2023-31972</a><br>
&gt; - yasm: CVE-2023-31973: <a href=3D"https://nvd.nist.gov/vuln/detail/CV=
E-2023-31973" rel=3D"noreferrer" target=3D"_blank">https://nvd.nist.gov/vul=
n/detail/CVE-2023-31973</a><br>
&gt; - yasm: CVE-2023-31974: <a href=3D"https://nvd.nist.gov/vuln/detail/CV=
E-2023-31974" rel=3D"noreferrer" target=3D"_blank">https://nvd.nist.gov/vul=
n/detail/CVE-2023-31974</a><br>
&gt; - yasm: CVE-2023-51258: <a href=3D"https://nvd.nist.gov/vuln/detail/CV=
E-2023-51258" rel=3D"noreferrer" target=3D"_blank">https://nvd.nist.gov/vul=
n/detail/CVE-2023-51258</a><br>
<br>
Proposal: delete yasm.=C2=A0 It advertises itself as a rewrite of nasm, but=
 nasm is still alive and did a major release just a few months ago. Nothing=
 else in meta-oe depends on yasm, and according to the layer index[1] the o=
nly interesting recipe that depends on yasm is chromium, which I basically =
refuse to believe won=E2=80=99t work with nasm (mainly as the debian packag=
ing for chromium doesn=E2=80=99t depend on nasm or yasm[2] so this dependen=
cy is likely obsolete now).<br>
<br>
I can send a patch... :)</blockquote><div dir=3D"auto"><br></div><div dir=
=3D"auto">I think we need to ensure chromium can still build without it oth=
erwise I am with you on this proposal=C2=A0</div><blockquote class=3D"gmail=
_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:=
1ex" dir=3D"auto"><br>
<br>
Cheers,<br>
Ross<br>
<br>
[1] <a href=3D"https://layers.openembedded.org/layerindex/branch/master/rec=
ipes/?q=3Ddepends%3Ayasm-native" rel=3D"noreferrer" target=3D"_blank">https=
://layers.openembedded.org/layerindex/branch/master/recipes/?q=3Ddepends%3A=
yasm-native</a><br>
[2] <a href=3D"https://salsa.debian.org/chromium-team/chromium/-/blob/maste=
r/debian/control" rel=3D"noreferrer" target=3D"_blank">https://salsa.debian=
.org/chromium-team/chromium/-/blob/master/debian/control</a><br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#121860): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/121860" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/121860</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/116334910/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/116334910/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" targ=
et=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--0000000000005c4a690643e07aaa--

