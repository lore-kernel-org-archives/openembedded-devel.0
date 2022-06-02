Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E2D5C43334
	for <webhook@archiver.kernel.org>; Thu,  2 Jun 2022 14:47:11 +0000 (UTC)
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com
 [209.85.219.49])
 by mx.groups.io with SMTP id smtpd.web11.7468.1654181228513435582
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 02 Jun 2022 07:47:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=NcVA1A4v;
 spf=pass (domain: gmail.com, ip: 209.85.219.49, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f49.google.com with SMTP id s10so535130qvt.8
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 02 Jun 2022 07:47:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WaZm92bZSugVaAwL5WQ15vvbwrWlbC503XBZrXejnFw=;
        b=NcVA1A4vtai7dTCrNxM+ba5oO/yo1972s0p0ak0/OA0R0s6VNTtFxBUzG/KQlhR+XF
         lZpAly6eVv3edV0+rGerP2FQlDn7j46LEj4pjb3Rwvllg+AfeCqaPvD3iSHHK51g03vd
         xSgfogeP7df75nKrkHH5XpMRGRhgP0HpzFE9gPgsHzC8tRguNsI06QjHf3ki/4DYxlPF
         mgStTbGcnNSivaHCRsbtejbLGTauNtWUZt8kXXcVY1Og2jYpZCE7zqbrKszagwmr3Swh
         zUKRElJm+RRbTgjeIuYjU7SltQIRVpLGeS+7zb9u8cd+GsvOZV0L5UFxlI9ekwRp3qiR
         4jgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WaZm92bZSugVaAwL5WQ15vvbwrWlbC503XBZrXejnFw=;
        b=fA6vy/EVnvL0fmUxIy+dw9ajGahTWqsK/4iHrzpoSlH81+x2xecyVk5cBeUq4AcL/x
         XEa1vtPH87nzvEZYiyXqwGur6cTPx9nQb4nSUNEm+hMxHkpPOFqTTao40PcddGnsDeJ5
         0RUTQqlo8pvI9jRYP1/YuCWsf80VaRcjDTpXl4wGCqKzcCRI2F0QJeSRmCaYvEsJNcUQ
         WEmjlN900nVG2rttNkgGmC4qUcHa3gXkS7tQLcmRODfyqusXtRH5ijfuWwzJziLD268H
         hO/vxhn7N5Tn3TON3XcMkt7jb4GILO08ZggrLxmn4W2S8F5WYXmszfhApcUpgdfd3Hsd
         jG+Q==
X-Gm-Message-State: AOAM533tiFiTuLrngHTdQEJmqkLaxUDYUuIwM+3bKYgAYRaPCbbajYTX
	VVcMocmR6KTLB3wbNOkn4yND1GdYfRHXK3ufZWw=
X-Google-Smtp-Source: 
 ABdhPJzkpcZeoULxTIiJmdpXw+/NVSCAWxG6zUl4yfVd7mEHIFXk49jDmiy3zSSwgAi5g8LsQsn1CsCZE6wh3RYR0oE=
X-Received: by 2002:ad4:5de6:0:b0:462:180d:7038 with SMTP id
 jn6-20020ad45de6000000b00462180d7038mr53062411qvb.16.1654181227504; Thu, 02
 Jun 2022 07:47:07 -0700 (PDT)
MIME-Version: 1.0
References: <6bdffec7-eb98-b2ba-a89a-a13cf4ac5a85@gmail.com>
 <29102.1654151443160260957@lists.openembedded.org>
In-Reply-To: <29102.1654151443160260957@lists.openembedded.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 2 Jun 2022 07:46:56 -0700
Message-ID: 
 <CAMKF1sq+qqh7ZqedWrEeRKiKVMFGpKfbrs=OY5dREfQJadv7_A@mail.gmail.com>
Subject: Re: [oe] [meta-python][dunfell][PATCH 1/9] python3-pillow: Upgrade
 6.2.1 -> 7.2.0
To: Ranjitsinh Rathod <ranjitsinhrathod1991@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000075a85b05e078142b"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 02 Jun 2022 14:47:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97385

--00000000000075a85b05e078142b
Content-Type: text/plain; charset="UTF-8"

What changes are there in new version is there anything of concern ?
Sometimes we may be fine to bump a revision of it only contains smaller
fixes

On Wed, Jun 1, 2022 at 11:30 PM Ranjitsinh Rathod <
ranjitsinhrathod1991@gmail.com> wrote:

> Hi Armin,
>
> I understand that we are not upgrading versions on the LTS branch, but
> this series of upgrades fixing the below CVEs.
> CVE-2019 <https://asc.bmwgroup.net/mgujira/browse/CVE-2019>-19911 CVE-2020
> <https://asc.bmwgroup.net/mgujira/browse/CVE-2020>-10177 CVE-2020
> <https://asc.bmwgroup.net/mgujira/browse/CVE-2020>-10378 CVE-2020
> <https://asc.bmwgroup.net/mgujira/browse/CVE-2020>-10379 CVE-2020
> <https://asc.bmwgroup.net/mgujira/browse/CVE-2020>-10994 CVE-2020
> <https://asc.bmwgroup.net/mgujira/browse/CVE-2020>-11538 CVE-2020
> <https://asc.bmwgroup.net/mgujira/browse/CVE-2020>-35653 CVE-2020
> <https://asc.bmwgroup.net/mgujira/browse/CVE-2020>-35654 CVE-2020
> <https://asc.bmwgroup.net/mgujira/browse/CVE-2020>-35655 CVE-2020
> <https://asc.bmwgroup.net/mgujira/browse/CVE-2020>-5310 CVE-2020
> <https://asc.bmwgroup.net/mgujira/browse/CVE-2020>-5311 CVE-2020
> <https://asc.bmwgroup.net/mgujira/browse/CVE-2020>-5312 CVE-2020
> <https://asc.bmwgroup.net/mgujira/browse/CVE-2020>-5313 CVE-2021
> <https://asc.bmwgroup.net/mgujira/browse/CVE-2021>-23437 CVE-2021
> <https://asc.bmwgroup.net/mgujira/browse/CVE-2021>-25287 CVE-2021
> <https://asc.bmwgroup.net/mgujira/browse/CVE-2021>-25288 CVE-2021
> <https://asc.bmwgroup.net/mgujira/browse/CVE-2021>-25289 CVE-2021
> <https://asc.bmwgroup.net/mgujira/browse/CVE-2021>-25290 CVE-2021
> <https://asc.bmwgroup.net/mgujira/browse/CVE-2021>-25291 CVE-2021
> <https://asc.bmwgroup.net/mgujira/browse/CVE-2021>-25292 CVE-2021
> <https://asc.bmwgroup.net/mgujira/browse/CVE-2021>-25293 CVE-2021
> <https://asc.bmwgroup.net/mgujira/browse/CVE-2021>-27921 CVE-2021
> <https://asc.bmwgroup.net/mgujira/browse/CVE-2021>-27922 CVE-2021
> <https://asc.bmwgroup.net/mgujira/browse/CVE-2021>-27923 CVE-2021
> <https://asc.bmwgroup.net/mgujira/browse/CVE-2021>-28675 CVE-2021
> <https://asc.bmwgroup.net/mgujira/browse/CVE-2021>-28676 CVE-2021
> <https://asc.bmwgroup.net/mgujira/browse/CVE-2021>-28677 CVE-2021
> <https://asc.bmwgroup.net/mgujira/browse/CVE-2021>-28678 CVE-2021
> <https://asc.bmwgroup.net/mgujira/browse/CVE-2021>-34552 CVE-2022
> <https://asc.bmwgroup.net/mgujira/browse/CVE-2022>-22815 CVE-2022
> <https://asc.bmwgroup.net/mgujira/browse/CVE-2022>-22816 CVE-2022
> <https://asc.bmwgroup.net/mgujira/browse/CVE-2022>-22817 CVE-2022
> <https://asc.bmwgroup.net/mgujira/browse/CVE-2022>-24303
>
> To solve these many CVEs by applying a patch would be really tough and
> maintaining patches too. What is your opinion here?
>
> Thanks,
> Ranjitsinh Rathod
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#97380):
> https://lists.openembedded.org/g/openembedded-devel/message/97380
> Mute This Topic: https://lists.openembedded.org/mt/91473921/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--00000000000075a85b05e078142b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">What changes are there in new version is there anything o=
f concern ? Sometimes we may be fine to bump a revision of it only contains=
 smaller fixes=C2=A0</div><div><br><div class=3D"gmail_quote"><div dir=3D"l=
tr" class=3D"gmail_attr">On Wed, Jun 1, 2022 at 11:30 PM Ranjitsinh Rathod =
&lt;<a href=3D"mailto:ranjitsinhrathod1991@gmail.com">ranjitsinhrathod1991@=
gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Hi Armin=
,<br><br>I understand that we are not upgrading versions on the LTS branch,=
 but this series of upgrades fixing the below CVEs.<br><a style=3D"color:#0=
654ac;font-family:monospace;font-size:small;white-space:pre-wrap;background=
-color:#ffffff" href=3D"https://asc.bmwgroup.net/mgujira/browse/CVE-2019" t=
arget=3D"_blank">CVE-2019</a><span style=3D"color:#353535;font-family:monos=
pace;font-size:small;white-space:pre-wrap">-19911 </span><a style=3D"color:=
#0654ac;font-family:monospace;font-size:small;white-space:pre-wrap;backgrou=
nd-color:#ffffff" href=3D"https://asc.bmwgroup.net/mgujira/browse/CVE-2020"=
 target=3D"_blank">CVE-2020</a><span style=3D"color:#353535;font-family:mon=
ospace;font-size:small;white-space:pre-wrap">-10177 </span><a style=3D"colo=
r:#0654ac;font-family:monospace;font-size:small;white-space:pre-wrap;backgr=
ound-color:#ffffff" href=3D"https://asc.bmwgroup.net/mgujira/browse/CVE-202=
0" target=3D"_blank">CVE-2020</a><span style=3D"color:#353535;font-family:m=
onospace;font-size:small;white-space:pre-wrap">-10378 </span><a style=3D"co=
lor:#0654ac;font-family:monospace;font-size:small;white-space:pre-wrap;back=
ground-color:#ffffff" href=3D"https://asc.bmwgroup.net/mgujira/browse/CVE-2=
020" target=3D"_blank">CVE-2020</a><span style=3D"color:#353535;font-family=
:monospace;font-size:small;white-space:pre-wrap">-10379 </span><a style=3D"=
color:#0654ac;font-family:monospace;font-size:small;white-space:pre-wrap;ba=
ckground-color:#ffffff" href=3D"https://asc.bmwgroup.net/mgujira/browse/CVE=
-2020" target=3D"_blank">CVE-2020</a><span style=3D"color:#353535;font-fami=
ly:monospace;font-size:small;white-space:pre-wrap">-10994 </span><a style=
=3D"color:#0654ac;font-family:monospace;font-size:small;white-space:pre-wra=
p;background-color:#ffffff" href=3D"https://asc.bmwgroup.net/mgujira/browse=
/CVE-2020" target=3D"_blank">CVE-2020</a><span style=3D"color:#353535;font-=
family:monospace;font-size:small;white-space:pre-wrap">-11538 </span><a sty=
le=3D"color:#0654ac;font-family:monospace;font-size:small;white-space:pre-w=
rap;background-color:#ffffff" href=3D"https://asc.bmwgroup.net/mgujira/brow=
se/CVE-2020" target=3D"_blank">CVE-2020</a><span style=3D"color:#353535;fon=
t-family:monospace;font-size:small;white-space:pre-wrap">-35653 </span><a s=
tyle=3D"color:#0654ac;font-family:monospace;font-size:small;white-space:pre=
-wrap;background-color:#ffffff" href=3D"https://asc.bmwgroup.net/mgujira/br=
owse/CVE-2020" target=3D"_blank">CVE-2020</a><span style=3D"color:#353535;f=
ont-family:monospace;font-size:small;white-space:pre-wrap">-35654 </span><a=
 style=3D"color:#0654ac;font-family:monospace;font-size:small;white-space:p=
re-wrap;background-color:#ffffff" href=3D"https://asc.bmwgroup.net/mgujira/=
browse/CVE-2020" target=3D"_blank">CVE-2020</a><span style=3D"color:#353535=
;font-family:monospace;font-size:small;white-space:pre-wrap">-35655 </span>=
<a style=3D"color:#0654ac;font-family:monospace;font-size:small;white-space=
:pre-wrap;background-color:#ffffff" href=3D"https://asc.bmwgroup.net/mgujir=
a/browse/CVE-2020" target=3D"_blank">CVE-2020</a><span style=3D"color:#3535=
35;font-family:monospace;font-size:small;white-space:pre-wrap">-5310 </span=
><a style=3D"color:#0654ac;font-family:monospace;font-size:small;white-spac=
e:pre-wrap;background-color:#ffffff" href=3D"https://asc.bmwgroup.net/mguji=
ra/browse/CVE-2020" target=3D"_blank">CVE-2020</a><span style=3D"color:#353=
535;font-family:monospace;font-size:small;white-space:pre-wrap">-5311 </spa=
n><a style=3D"color:#0654ac;font-family:monospace;font-size:small;white-spa=
ce:pre-wrap;background-color:#ffffff" href=3D"https://asc.bmwgroup.net/mguj=
ira/browse/CVE-2020" target=3D"_blank">CVE-2020</a><span style=3D"color:#35=
3535;font-family:monospace;font-size:small;white-space:pre-wrap">-5312 </sp=
an><a style=3D"color:#0654ac;font-family:monospace;font-size:small;white-sp=
ace:pre-wrap;background-color:#ffffff" href=3D"https://asc.bmwgroup.net/mgu=
jira/browse/CVE-2020" target=3D"_blank">CVE-2020</a><span style=3D"color:#3=
53535;font-family:monospace;font-size:small;white-space:pre-wrap">-5313 </s=
pan><a style=3D"color:#0654ac;font-family:monospace;font-size:small;white-s=
pace:pre-wrap;background-color:#ffffff" href=3D"https://asc.bmwgroup.net/mg=
ujira/browse/CVE-2021" target=3D"_blank">CVE-2021</a><span style=3D"color:#=
353535;font-family:monospace;font-size:small;white-space:pre-wrap">-23437 <=
/span><a style=3D"color:#0654ac;font-family:monospace;font-size:small;white=
-space:pre-wrap;background-color:#ffffff" href=3D"https://asc.bmwgroup.net/=
mgujira/browse/CVE-2021" target=3D"_blank">CVE-2021</a><span style=3D"color=
:#353535;font-family:monospace;font-size:small;white-space:pre-wrap">-25287=
 </span><a style=3D"color:#0654ac;font-family:monospace;font-size:small;whi=
te-space:pre-wrap;background-color:#ffffff" href=3D"https://asc.bmwgroup.ne=
t/mgujira/browse/CVE-2021" target=3D"_blank">CVE-2021</a><span style=3D"col=
or:#353535;font-family:monospace;font-size:small;white-space:pre-wrap">-252=
88 </span><a style=3D"color:#0654ac;font-family:monospace;font-size:small;w=
hite-space:pre-wrap;background-color:#ffffff" href=3D"https://asc.bmwgroup.=
net/mgujira/browse/CVE-2021" target=3D"_blank">CVE-2021</a><span style=3D"c=
olor:#353535;font-family:monospace;font-size:small;white-space:pre-wrap">-2=
5289 </span><a style=3D"color:#0654ac;font-family:monospace;font-size:small=
;white-space:pre-wrap;background-color:#ffffff" href=3D"https://asc.bmwgrou=
p.net/mgujira/browse/CVE-2021" target=3D"_blank">CVE-2021</a><span style=3D=
"color:#353535;font-family:monospace;font-size:small;white-space:pre-wrap">=
-25290 </span><a style=3D"color:#0654ac;font-family:monospace;font-size:sma=
ll;white-space:pre-wrap;background-color:#ffffff" href=3D"https://asc.bmwgr=
oup.net/mgujira/browse/CVE-2021" target=3D"_blank">CVE-2021</a><span style=
=3D"color:#353535;font-family:monospace;font-size:small;white-space:pre-wra=
p">-25291 </span><a style=3D"color:#0654ac;font-family:monospace;font-size:=
small;white-space:pre-wrap;background-color:#ffffff" href=3D"https://asc.bm=
wgroup.net/mgujira/browse/CVE-2021" target=3D"_blank">CVE-2021</a><span sty=
le=3D"color:#353535;font-family:monospace;font-size:small;white-space:pre-w=
rap">-25292 </span><a style=3D"color:#0654ac;font-family:monospace;font-siz=
e:small;white-space:pre-wrap;background-color:#ffffff" href=3D"https://asc.=
bmwgroup.net/mgujira/browse/CVE-2021" target=3D"_blank">CVE-2021</a><span s=
tyle=3D"color:#353535;font-family:monospace;font-size:small;white-space:pre=
-wrap">-25293 </span><a style=3D"color:#0654ac;font-family:monospace;font-s=
ize:small;white-space:pre-wrap;background-color:#ffffff" href=3D"https://as=
c.bmwgroup.net/mgujira/browse/CVE-2021" target=3D"_blank">CVE-2021</a><span=
 style=3D"color:#353535;font-family:monospace;font-size:small;white-space:p=
re-wrap">-27921 </span><a style=3D"color:#0654ac;font-family:monospace;font=
-size:small;white-space:pre-wrap;background-color:#ffffff" href=3D"https://=
asc.bmwgroup.net/mgujira/browse/CVE-2021" target=3D"_blank">CVE-2021</a><sp=
an style=3D"color:#353535;font-family:monospace;font-size:small;white-space=
:pre-wrap">-27922 </span><a style=3D"color:#0654ac;font-family:monospace;fo=
nt-size:small;white-space:pre-wrap;background-color:#ffffff" href=3D"https:=
//asc.bmwgroup.net/mgujira/browse/CVE-2021" target=3D"_blank">CVE-2021</a><=
span style=3D"color:#353535;font-family:monospace;font-size:small;white-spa=
ce:pre-wrap">-27923 </span><a style=3D"color:#0654ac;font-family:monospace;=
font-size:small;white-space:pre-wrap;background-color:#ffffff" href=3D"http=
s://asc.bmwgroup.net/mgujira/browse/CVE-2021" target=3D"_blank">CVE-2021</a=
><span style=3D"color:#353535;font-family:monospace;font-size:small;white-s=
pace:pre-wrap">-28675 </span><a style=3D"color:#0654ac;font-family:monospac=
e;font-size:small;white-space:pre-wrap;background-color:#ffffff" href=3D"ht=
tps://asc.bmwgroup.net/mgujira/browse/CVE-2021" target=3D"_blank">CVE-2021<=
/a><span style=3D"color:#353535;font-family:monospace;font-size:small;white=
-space:pre-wrap">-28676 </span><a style=3D"color:#0654ac;font-family:monosp=
ace;font-size:small;white-space:pre-wrap;background-color:#ffffff" href=3D"=
https://asc.bmwgroup.net/mgujira/browse/CVE-2021" target=3D"_blank">CVE-202=
1</a><span style=3D"color:#353535;font-family:monospace;font-size:small;whi=
te-space:pre-wrap">-28677 </span><a style=3D"color:#0654ac;font-family:mono=
space;font-size:small;white-space:pre-wrap;background-color:#ffffff" href=
=3D"https://asc.bmwgroup.net/mgujira/browse/CVE-2021" target=3D"_blank">CVE=
-2021</a><span style=3D"color:#353535;font-family:monospace;font-size:small=
;white-space:pre-wrap">-28678 </span><a style=3D"color:#0654ac;font-family:=
monospace;font-size:small;white-space:pre-wrap;background-color:#ffffff" hr=
ef=3D"https://asc.bmwgroup.net/mgujira/browse/CVE-2021" target=3D"_blank">C=
VE-2021</a><span style=3D"color:#353535;font-family:monospace;font-size:sma=
ll;white-space:pre-wrap">-34552 </span><a style=3D"color:#0654ac;font-famil=
y:monospace;font-size:small;white-space:pre-wrap;background-color:#ffffff" =
href=3D"https://asc.bmwgroup.net/mgujira/browse/CVE-2022" target=3D"_blank"=
>CVE-2022</a><span style=3D"color:#353535;font-family:monospace;font-size:s=
mall;white-space:pre-wrap">-22815 </span><a style=3D"color:#0654ac;font-fam=
ily:monospace;font-size:small;white-space:pre-wrap;background-color:#ffffff=
" href=3D"https://asc.bmwgroup.net/mgujira/browse/CVE-2022" target=3D"_blan=
k">CVE-2022</a><span style=3D"color:#353535;font-family:monospace;font-size=
:small;white-space:pre-wrap">-22816 </span><a style=3D"color:#0654ac;font-f=
amily:monospace;font-size:small;white-space:pre-wrap;background-color:#ffff=
ff" href=3D"https://asc.bmwgroup.net/mgujira/browse/CVE-2022" target=3D"_bl=
ank">CVE-2022</a><span style=3D"color:#353535;font-family:monospace;font-si=
ze:small;white-space:pre-wrap">-22817 </span><a style=3D"color:#0654ac;font=
-family:monospace;font-size:small;white-space:pre-wrap;background-color:#ff=
ffff" href=3D"https://asc.bmwgroup.net/mgujira/browse/CVE-2022" target=3D"_=
blank">CVE-2022</a><span style=3D"color:#353535;font-family:monospace;font-=
size:small;white-space:pre-wrap">-24303<br><br>To solve these many CVEs by =
applying a patch would be really tough and maintaining patches too. What is=
 your opinion here? </span>
<div><span style=3D"color:#353535;font-family:monospace;font-size:small;whi=
te-space:pre-wrap"><br>Thanks,<br>Ranjitsinh Rathod</span></div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#97380): <a href=3D"https://lists.openembedded.org/g/ope=
nembedded-devel/message/97380" rel=3D"noreferrer" target=3D"_blank">https:/=
/lists.openembedded.org/g/openembedded-devel/message/97380</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/91473921/1997=
914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/91473921/1997914</a><br>
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

--00000000000075a85b05e078142b--

