Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F538C4332F
	for <webhook@archiver.kernel.org>; Fri,  3 Nov 2023 04:13:12 +0000 (UTC)
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
 by mx.groups.io with SMTP id smtpd.web10.25034.1698984789146028716
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 02 Nov 2023 21:13:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MrI/o0wM;
 spf=pass (domain: gmail.com, ip: 209.85.219.171, mailfrom: ticotimo@gmail.com)
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-d9ca471cf3aso1653790276.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 02 Nov 2023 21:13:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698984788; x=1699589588; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=pg9Q0hmL1BdqXCMAo209qS0maPwguTuGXcWsm8JN48A=;
        b=MrI/o0wMAQLO207XWuIGKLty6HQx3JmHF8H1ChfU6E10fxHA4vrc13oQUHD1AtVPf0
         hHLGaWsVGXRDJASueeg6NivAjihl/3DBt54ROA2V+sVWN9Q95NSUGbvnxgSUVP9neUHd
         NNCV7Pbc5saL3w2zyzAVp3VxhlypmIcvLQcA8SKUcO/p947FyB3c4M20q1fhiDwckGpx
         RL3kAKu/O5kvK9uJvpo57UBnWJtuGWXhkNNMFxHmdld+7Ebcg62CLskWI5bNa8IZcAwF
         H+3tDSjQlxCVv7VmAdQteayqlQJT16YwcWVjPUZACt4X3l0EgnwLYuWe767Y5GHcs8J1
         K4lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698984788; x=1699589588;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pg9Q0hmL1BdqXCMAo209qS0maPwguTuGXcWsm8JN48A=;
        b=qpQBaHu/CwJbVbdsB0NMeUAeexrfgIznROUZcHFilQ6o8rFVDO0kxgCUUsRmXPUSkA
         SJSYlGAyE8BeOpNa1lBjezCsABBivix6NBg8yuk9aBilBi3oAmrLHFg29Op1cqHiPqcj
         EPXKLmcT8VrhbECao2T/U4UPFMFouLQSrtuhIQivY8AVmn8Wvs847SOKutPNFnzyScCR
         Qz1nlCRKrb5HFHeB/JVWR7+C1bj3zq5qRPBAZqQuq+BSx6zapMD1OOmTLPJLIbex98Fc
         cMMKmtlszGcf7FwMaV1H4RmiuVpTEUPEexD2mrccTY2m0K8dYhj7Y0mbTXgO4TGJ6/BV
         u+zg==
X-Gm-Message-State: AOJu0Yzu75gduyY7txOlTFykNhllBBKJgVL31Hj7V1DnN5ckETwlv64q
	VJZjaDte/RQCHmlNR9akTavSbfwq07JVfUatUP4=
X-Google-Smtp-Source: AGHT+IHF8D/iZ2pHSBMeU8+9qLUPyBdhQWLGk6a/XP6TxITnstI4FONi23ucC21VenfSdIkhVJzIi9TJjeNbQbN5aI4=
X-Received: by 2002:a25:e0c9:0:b0:d9a:384a:d4c5 with SMTP id
 x192-20020a25e0c9000000b00d9a384ad4c5mr23304247ybg.33.1698984788235; Thu, 02
 Nov 2023 21:13:08 -0700 (PDT)
MIME-Version: 1.0
References: <9353bb8c5660859357ba062c7d5924051d249b83.camel@linuxfoundation.org>
 <CAMKF1srDOiMrisZJwAm5=ft_pDzncXbaytJfqP4cMW17vv8r4w@mail.gmail.com>
In-Reply-To: <CAMKF1srDOiMrisZJwAm5=ft_pDzncXbaytJfqP4cMW17vv8r4w@mail.gmail.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Thu, 2 Nov 2023 21:12:57 -0700
Message-ID: <CANx9H-Ar+r-mBK8O2SxjfYF9vJdoeFouDTrvfQFQPqUvrAW04A@mail.gmail.com>
Subject: Re: [oe] meta-openembedded CVEs, patch stats and AUH
To: Khem Raj <raj.khem@gmail.com>
Cc: Armin Kuster <akuster808@gmail.com>, Marta Rybczynska <marta.rybczynska@syslinbit.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, Ross Burton <ross.burton@arm.com>, 
	Yoann Congal <yoann.congal@smile.fr>, 
	openembedded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000c81942060937b8d8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 Nov 2023 04:13:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105848

--000000000000c81942060937b8d8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 2, 2023 at 10:51=E2=80=AFAM Khem Raj <raj.khem@gmail.com> wrote=
:

> Awesome work !


I agree. This is very exciting.


>
> On Thu, Nov 2, 2023 at 6:49=E2=80=AFAM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> >
> > Patch Metrics and CVEs
> > ----------------------
> >
> > I'm now pleased to say we have CVE and patch metrics being generated
> > (Thanks Yoann and Ross):
> >
> > https://autobuilder.yocto.io/pub/non-release/patchmetrics-meta-oe/
> >
> > which for example generates this:
> >
> >
> https://autobuilder.yocto.io/pub/non-release/patchmetrics-meta-oe/cve-sta=
tus-master.txt
> >
> > (268 CVEs)
> >
> > This doesn't work for the LTS branches since the layer override being
> > used to generate it on master won't work for kirkstone/dunfell.
> >
> > Those reports are generated live onto the site daily but aren't emailed
> > anywhere at this time.
> >
> >
> > Mirroring
> > ---------
> >
> > I covered mirroring for meta-oe layers here:
> >
> > https://lists.openembedded.org/g/openembedded-devel/message/105754
> >
> > Basically it works but we need to decide whether we can fix the
> > warnings to keep this enabled for dunfell/kirkstone.
> >
> >
> > Reproducibility
> > ---------------
> >
> > We can now test reproducibility for meta-oe on the autobuilder:
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/155
> >
> > In order to make this useful we really need a list of known issues so
> > that we can then exclude them and start showing regressions.
> >
> >
> > AUH
> > ---
> >
> > This is now working and generating updates. It takes a while to run and
> > generates a lot of emails.
> >
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/159/builds/8
> > (18 hours so far)
> >
> > meta-oe summary:
> > https://lists.yoctoproject.org/g/test-list/message/425
> > TOTAL: attempted=3D206 succeeded=3D42(20.39%) failed=3D164(79.61%)
> >
> > meta-python summary:
> > https://lists.yoctoproject.org/g/test-list/message/426
> > TOTAL: attempted=3D92 succeeded=3D50(54.35%) failed=3D42(45.65%)
> >
> > meta-perl summary:
> > https://lists.yoctoproject.org/g/test-list/message/434
> > TOTAL: attempted=3D7 succeeded=3D5(71.43%) failed=3D2(28.57%)
> >



> It is good to see this capability on the AB. I previously ran similar AUH
jobs for Perl and Python recipes (including meta-oe via inherit filters) on
some hardware I had access to (thank you Mark Hatley).

We saw some uptick in contributions, mostly to meta-python, as a result of
my prior auh@moto-timo.dev emails. We do not see many folks addressing the
AUH devtool/etc failures and those that do not even succeed to check
upstream status are somewhat masked because no email output is sent (it
only goes to stdout).


> > meta-networking summary:
> > https://lists.yoctoproject.org/g/test-list/message/767
> > TOTAL: attempted=3D43 succeeded=3D8(18.60%) failed=3D35(81.40%)
> >
> > so around ~350 emails of which ~105 were successful upgrades. I'm not
> > sure whether we want to enable that to send to openembedded-devel?
> > There are lot of failures and there are a lot of recipes where the
> > upstream status couldn't be checked. Is anyone interested in working on
> > improving things in either of those areas?
> >
> > There are also various backend improvements we'd love to make to the
> > AUH code now we've seen how it works in practise in this role.
> >
> >
> > Summary
> > -------
> >
> > All things considered, this shows what our tooling is capable of and
> > we've a good baseline. Whether/how we enable/use this going forward
> > depends a lot on whether people are willing to step up and help
> > maintain/process the results. It can't/won't be Khem/I trying to make
> > and keep it all working so this is where we need help from the wider
> > community.
> >


I don=E2=80=99t think anyone (including myself) that are =E2=80=9Clayer mai=
ntainers=E2=80=9D can
handle this volume of updates either. I used to try to keep up, but the
flood of even successful updates is just too great. On average, each recipe
takes 10-60 minutes to upgrade, verify changes, add some helpful git commit
information, build and run time test. Some contributors send upgrades that
build, but runtime testing is lacking and e.g. dependency or license
changes are missed. Ptest could help with catching runtime failures, but we
still need people willing to review and fix the failures. Ptests can also
add a lot of additional dependencies (for which we do not have recipes) and
someone still needs to be responding to any failures. The devtool and other
AUH failures, such as po4a for several years, tell us perhaps some pruning
of recipes is timely.

The quality of these layers is a community effort. There is no magic team
waiting to do the work. It is all of you. It is all of us.

=E2=80=94Tim


>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#105844):
> https://lists.openembedded.org/g/openembedded-devel/message/105844
> Mute This Topic: https://lists.openembedded.org/mt/102342283/924729
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> ticotimo@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000c81942060937b8d8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Thu, Nov 2, 2023 at 10:51=E2=80=AFAM Khem Raj &lt;<a hre=
f=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<br></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left-width:1px;border-left-style:solid;padding-left:1ex;border-left-color:r=
gb(204,204,204)">Awesome work !</blockquote><div dir=3D"auto"><br></div><di=
v dir=3D"auto">I agree. This is very exciting.</div><div dir=3D"auto"><br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left-width:1px;border-left-style:solid;padding-left:1ex;border-left-co=
lor:rgb(204,204,204)" dir=3D"auto"><br>
<br>
On Thu, Nov 2, 2023 at 6:49=E2=80=AFAM Richard Purdie<br>
&lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_blank"=
>richard.purdie@linuxfoundation.org</a>&gt; wrote:<br>
&gt;<br>
&gt; Patch Metrics and CVEs<br>
&gt; ----------------------<br>
&gt;<br>
&gt; I&#39;m now pleased to say we have CVE and patch metrics being generat=
ed<br>
&gt; (Thanks Yoann and Ross):<br>
&gt;<br>
&gt; <a href=3D"https://autobuilder.yocto.io/pub/non-release/patchmetrics-m=
eta-oe/" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yocto.io/=
pub/non-release/patchmetrics-meta-oe/</a><br>
&gt;<br>
&gt; which for example generates this:<br>
&gt;<br>
&gt; <a href=3D"https://autobuilder.yocto.io/pub/non-release/patchmetrics-m=
eta-oe/cve-status-master.txt" rel=3D"noreferrer" target=3D"_blank">https://=
autobuilder.yocto.io/pub/non-release/patchmetrics-meta-oe/cve-status-master=
.txt</a><br>
&gt;<br>
&gt; (268 CVEs)<br>
&gt;<br>
&gt; This doesn&#39;t work for the LTS branches since the layer override be=
ing<br>
&gt; used to generate it on master won&#39;t work for kirkstone/dunfell.<br=
>
&gt;<br>
&gt; Those reports are generated live onto the site daily but aren&#39;t em=
ailed<br>
&gt; anywhere at this time.<br>
&gt;<br>
&gt;<br>
&gt; Mirroring<br>
&gt; ---------<br>
&gt;<br>
&gt; I covered mirroring for meta-oe layers here:<br>
&gt;<br>
&gt; <a href=3D"https://lists.openembedded.org/g/openembedded-devel/message=
/105754" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.or=
g/g/openembedded-devel/message/105754</a><br>
&gt;<br>
&gt; Basically it works but we need to decide whether we can fix the<br>
&gt; warnings to keep this enabled for dunfell/kirkstone.<br>
&gt;<br>
&gt;<br>
&gt; Reproducibility<br>
&gt; ---------------<br>
&gt;<br>
&gt; We can now test reproducibility for meta-oe on the autobuilder:<br>
&gt; <a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/155=
" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproject.org=
/typhoon/#/builders/155</a><br>
&gt;<br>
&gt; In order to make this useful we really need a list of known issues so<=
br>
&gt; that we can then exclude them and start showing regressions.<br>
&gt;<br>
&gt;<br>
&gt; AUH<br>
&gt; ---<br>
&gt;<br>
&gt; This is now working and generating updates. It takes a while to run an=
d<br>
&gt; generates a lot of emails.<br>
&gt;<br>
&gt; <a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/159=
/builds/8" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctopr=
oject.org/typhoon/#/builders/159/builds/8</a><br>
&gt; (18 hours so far)<br>
&gt;<br>
&gt; meta-oe summary:<br>
&gt; <a href=3D"https://lists.yoctoproject.org/g/test-list/message/425" rel=
=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/g/test-lis=
t/message/425</a><br>
&gt; TOTAL: attempted=3D206 succeeded=3D42(20.39%) failed=3D164(79.61%)<br>
&gt;<br>
&gt; meta-python summary:<br>
&gt; <a href=3D"https://lists.yoctoproject.org/g/test-list/message/426" rel=
=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/g/test-lis=
t/message/426</a><br>
&gt; TOTAL: attempted=3D92 succeeded=3D50(54.35%) failed=3D42(45.65%)<br>
&gt;<br>
&gt; meta-perl summary:<br>
&gt; <a href=3D"https://lists.yoctoproject.org/g/test-list/message/434" rel=
=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/g/test-lis=
t/message/434</a><br>
&gt; TOTAL: attempted=3D7 succeeded=3D5(71.43%) failed=3D2(28.57%)<br>
&gt;</blockquote><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left-width:1px;border-left-style:solid;padding-left:1ex;bo=
rder-left-color:rgb(204,204,204)" dir=3D"auto"></blockquote><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;=
border-left-style:solid;padding-left:1ex;border-left-color:rgb(204,204,204)=
" dir=3D"auto"></blockquote><div dir=3D"auto"><br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;bo=
rder-left-style:solid;padding-left:1ex;border-left-color:rgb(204,204,204)" =
dir=3D"auto"><br></blockquote><div dir=3D"auto">It is good to see this capa=
bility on the AB. I previously ran similar AUH jobs for Perl and Python rec=
ipes (including meta-oe via inherit filters) on some hardware I had access =
to (thank you Mark Hatley).</div><div dir=3D"auto"><br></div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px=
;border-left-style:solid;padding-left:1ex;border-left-color:rgb(204,204,204=
)" dir=3D"auto"></blockquote><div dir=3D"auto">We saw some uptick in contri=
butions, mostly to meta-python, as a result of my prior <a href=3D"mailto:a=
uh@moto-timo.dev">auh@moto-timo.dev</a> emails. We do not see many folks ad=
dressing the AUH devtool/etc failures and those that do not even succeed to=
 check upstream status are somewhat masked because no email output is sent =
(it only goes to stdout).</div><div dir=3D"auto"><br></div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;b=
order-left-style:solid;padding-left:1ex;border-left-color:rgb(204,204,204)"=
 dir=3D"auto"><br>
&gt; meta-networking summary:<br>
&gt; <a href=3D"https://lists.yoctoproject.org/g/test-list/message/767" rel=
=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/g/test-lis=
t/message/767</a><br>
&gt; TOTAL: attempted=3D43 succeeded=3D8(18.60%) failed=3D35(81.40%)<br>
&gt;<br>
&gt; so around ~350 emails of which ~105 were successful upgrades. I&#39;m =
not<br>
&gt; sure whether we want to enable that to send to openembedded-devel?<br>
&gt; There are lot of failures and there are a lot of recipes where the<br>
&gt; upstream status couldn&#39;t be checked. Is anyone interested in worki=
ng on<br>
&gt; improving things in either of those areas?<br>
&gt;<br>
&gt; There are also various backend improvements we&#39;d love to make to t=
he<br>
&gt; AUH code now we&#39;ve seen how it works in practise in this role.<br>
&gt;<br>
&gt;<br>
&gt; Summary<br>
&gt; -------<br>
&gt;<br>
&gt; All things considered, this shows what our tooling is capable of and<b=
r>
&gt; we&#39;ve a good baseline. Whether/how we enable/use this going forwar=
d<br>
&gt; depends a lot on whether people are willing to step up and help<br>
&gt; maintain/process the results. It can&#39;t/won&#39;t be Khem/I trying =
to make<br>
&gt; and keep it all working so this is where we need help from the wider<b=
r>
&gt; community.<br>
&gt;</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">I don=E2=80=
=99t think anyone (including myself) that are =E2=80=9Clayer maintainers=E2=
=80=9D can handle this volume of updates either. I used to try to keep up, =
but the flood of even successful updates is just too great. On average, eac=
h recipe takes 10-60 minutes to upgrade, verify changes, add some helpful g=
it commit information, build and run time test. Some contributors send upgr=
ades that build, but runtime testing is lacking and e.g. dependency or lice=
nse changes are missed. Ptest could help with catching runtime failures, bu=
t we still need people willing to review and fix the failures. Ptests can a=
lso add a lot of additional dependencies (for which we do not have recipes)=
 and someone still needs to be responding to any failures. The devtool and =
other AUH failures, such as po4a for several years, tell us perhaps some pr=
uning of recipes is timely.</div><div dir=3D"auto"><br></div><div dir=3D"au=
to">The quality of these layers is a community effort. There is no magic te=
am waiting to do the work. It is all of you. It is all of us.</div><div dir=
=3D"auto"><br></div><div dir=3D"auto">=E2=80=94Tim</div><div dir=3D"auto"><=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left-width:1px;border-left-style:solid;padding-left:1ex;border-lef=
t-color:rgb(204,204,204)" dir=3D"auto"><br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#105844): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/105844" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/105844</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/102342283/924=
729" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/102342283/924729</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:ticotimo@gmail.com" targ=
et=3D"_blank">ticotimo@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--000000000000c81942060937b8d8--

