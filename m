Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29A71CD98CE
	for <webhook@archiver.kernel.org>; Fri, 12 Jun 2026 14:20:57 +0000 (UTC)
Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com [74.125.224.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.71763.1781274056312714506
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 12 Jun 2026 07:20:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=mWa/68Nz;
 spf=pass (domain: gmail.com, ip: 74.125.224.49, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-66077f6c438so999867d50.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 12 Jun 2026 07:20:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781274055; cv=none;
        d=google.com; s=arc-20240605;
        b=EB3PGsP96mt9sVBxCDbdvQca3Rmd5rfx6gt+ohx/o3wCjMAKWYHRhNtdLQwncivyTW
         oxZ76c1vjLj9YPxnEJFji1DQ1m2y81s/bGzcaKI+EQtyNRf8p1tSoJwPQ8CzkYbCB/av
         bWyUo1UgiLSXt9SRGVs5dnEQmJ7k5Apo2BnScIrOnS0wT5uU/AmbGJlOqxQF6bWMq4I/
         1ek6aaYwl45lLVIoN+DfbF440NuymrdUss/f+FSs+/RmhfjJTMAPgwKspfARoO/VvlI3
         6ohapULZVxXVsOTVXh1ndO0eraTOnIp9hB4ja58C3sFuSGeIVPkPg26UtJiDG2v5C6MW
         RhVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=YYENHrYWM6VnEH2L1DTSBoso1NVh4n950DCMxaQLqNQ=;
        fh=yoF0rHc0I8g5R+4nxyZcEU0XlV6yTz4me1es6sUhvu4=;
        b=WhSS0qq09hSnExJ1NqzjRFKt1w5zrPrOFgKXgdOnEs1FX2/Th3Q/hHCQCvIcsn1VOu
         pQ+BlpW1/lERe/KmTV39ScxFfQMOQxMfT0wK4jblpb8OlvhTlb0836L58tVQN9raOhdM
         MD4Yia3NmqaLmIur/u6AnF9uGwHwZ+Je12A74Hbg0hXeF/7I1kV6TOanjZVEG9zcsl61
         WJ/UukphQh/sgrETPlrXDr9507+9PY7mwLkLFk2H+QDAR22XzT18hcfh6h6XUQsiygWn
         v9Adqf4T65/4JgJiLBZMqUVpkkFl4tOcX9eOXdPebWhihyI2/b9u1Bnt3Kyub5gHID/j
         skSA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781274055; x=1781878855; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=YYENHrYWM6VnEH2L1DTSBoso1NVh4n950DCMxaQLqNQ=;
        b=mWa/68Nz4QXljFP9hKSUg7GOfquEUac5t0KgxYefdb9HrnUg5Q1Gn7+PP36aMMpvom
         Ydgx8dweM/d096UOleVZI+PYTfUpchTN4HHEkZZ5fik7N6W963zph571/pmc0GTs6iMN
         G/EFTosPRXxZ5QABHxGWk0dKS3QYh27wmpbUig4GjTmVKuPmH5KeyJXiQLcOwAVTe60j
         EctZNR1j+vaWBNz+C3KyAISQ1ZlGRfWBoULdeA4bHC+APb4MxBEFU2rJNQ1YOaAF0Ud1
         9nj4c8jQncZGTUQJdCnhQZp6Il0JDq2I3Ua9vnYbyJD9K0MmWJuRbZeo9epHqm2uGUcF
         +llA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781274055; x=1781878855;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YYENHrYWM6VnEH2L1DTSBoso1NVh4n950DCMxaQLqNQ=;
        b=TmQJcdnUvLESmTXdikbOsAx3zO1lAMsm7HW6JfzgIbh9w84nz9n/KCHNfsfzdOanrH
         gh24nyvsU1ne9WI9CPbFL9KngWjKiRJpSjTPhUpLU11D/7tJWlK/PTdIz7IiNL0uxtLU
         BPXnN4ZSHFIl/qAqw3SyCyPU6V1LSVm2oTL1nYe1wGhk+miwMR+mWQW04CAb6lw5qcVq
         n2R4rElI7jh/+N+BHFz+RW65oMmrH9bjCnOlVJ9QmRCxWpkcVxZA8DQA2j+/VcXZBjp7
         x5gYkY1j1I/70zLF2NHM9elIUE3uSKKvB/PJUHLdjNIiF2d6llSI3ipfMXcKyd3j8/uz
         E1tw==
X-Forwarded-Encrypted: i=1; AFNElJ+NuYYN+i1IJThlQLgu+M6DBOUflJT9EZf0DXE4NZa6/d5mEw6bHohFK+dDmzzHzXLxHNxxWmo8bHh91Djeus6Xprk=@lists.openembedded.org
X-Gm-Message-State: AOJu0YwdvIRq6Zzy8TBDFiPjgfIb4WaReIyQWvrp+jbXg/YEh0ha+xU3
	6wU5w/iQFFLqJEzxEIrZ7VRJnIWYglLjg/l8i03nqeyQCJib2TFXFpP6RMLc0gPFWBL+A2J1Im6
	LPgUdsDW4YEFljI4+ltfr8KJebHT+HHE=
X-Gm-Gg: Acq92OEYw+NCttwM3YIhtU2TQLXYNPPkA9O8o/ywdS8W24rsLyV7MMwShEWnAsNpHLM
	HpoNUV3eR/Ef9D445N69n+8kgOMsS5fHrS53ID+UrNYVP/tV16HfeaVArs9cYFhun6pKQ28aepP
	sE8vjvbXB2YWXeZA4cyyWVqkPELkzIzks8IjlDD5KKxOnUI6YWx4GOvDe+4Bl8dJek9W0bpB5j4
	Xc8Bl78JohZL6nKHkUfTOJ40EAMSujZXBnDUzQL9l199VsH+lta+5mMDL/z/g8xYe38vXLy3msF
	uIE0rZaVMpDP4qM+QI/PYm/eBCvxdgb8K3+SRIJvDUR8WNJxQTmSIpeBd9v1xh9cO24Bn/nOkZC
	nPlhlmnXofqWRash034Ybc7jee0k7TkKyuM4cVCoLNFanO6OgSXwN5M1q76zRe4NTGRglyaJJ56
	It1GJVHmSo3MaNbO5T
X-Received: by 2002:a05:690e:1515:b0:65e:5d9c:286c with SMTP id
 956f58d0204a3-6627831e64fmr2771857d50.31.1781274055201; Fri, 12 Jun 2026
 07:20:55 -0700 (PDT)
MIME-Version: 1.0
References: <20260609144855.1473568-1-khem.raj@oss.qualcomm.com>
 <e036c6714991459d21fafd6993fa9495b6d92d9f.camel@linuxfoundation.org> <AS8PR02MB10201184CCE7BEA3F46D555B5EF1B2@AS8PR02MB10201.eurprd02.prod.outlook.com>
In-Reply-To: <AS8PR02MB10201184CCE7BEA3F46D555B5EF1B2@AS8PR02MB10201.eurprd02.prod.outlook.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 12 Jun 2026 07:20:28 -0700
X-Gm-Features: AVVi8Cc4mEdOQEjMRPiK6wTbcGvYpisjXjYjoSMUXMxC4_ziDIB6NR2jrs9rgK8
Message-ID: <CAMKF1so3M1cZ93eBc=HaWd08=7kpNObQ3vfTOhbR_DwWbobGTA@mail.gmail.com>
Subject: Re: [oe] [meta-networking][PATCH] python3-scapy: Replace
 oe.utils.all_distro_featuresc with bb.utils.contains
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: "richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>, 
	"openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>, 
	Khem Raj <khem.raj@oss.qualcomm.com>
Content-Type: multipart/alternative; boundary="0000000000004ed82206540f2f15"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 12 Jun 2026 14:20:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127540

--0000000000004ed82206540f2f15
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 11, 2026 at 9:35=E2=80=AFAM Peter Kjellerstedt <
peter.kjellerstedt@axis.com> wrote:

> > -----Original Message-----
> > From: openembedded-devel@lists.openembedded.org <
> openembedded-devel@lists.openembedded.org> On Behalf Of Richard Purdie
> via lists.openembedded.org
> > Sent: den 10 juni 2026 11:53
> > To: raj.khem@gmail.com; openembedded-devel@lists.openembedded.org
> > Cc: Khem Raj <khem.raj@oss.qualcomm.com>
> > Subject: Re: [oe] [meta-networking][PATCH] python3-scapy: Replace
> oe.utils.all_distro_featuresc with bb.utils.contains
> >
> > On Tue, 2026-06-09 at 07:48 -0700, Khem Raj via lists.openembedded.org
> wrote:
> > > oe.utils.all_distro_features is being removed.
> > >
> > > Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
> > > ---
> > >  meta-networking/recipes-devtools/python/python3-scapy_2.6.1.bb | 2 +=
-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/meta-networking/recipes-devtools/python/
> python3-scapy_2.6.1.bb b/meta-networking/recipes-devtools/python/
> python3-scapy_2.6.1.bb
> > > index 678aec0135..fac14221c5 100644
> > > --- a/meta-networking/recipes-devtools/python/python3-scapy_2.6.1.bb
> > > +++ b/meta-networking/recipes-devtools/python/python3-scapy_2.6.1.bb
> > > @@ -42,7 +42,7 @@ do_install_ptest() {
> > >      # note1: if ipv6 isn't enabled, skip the related test (add '-K
> ipv6' argument)
> > >      # note2: to make this test work, your ISP also must support ipv6
> - the test is trying
> > >      #        to ping google.com through ipv6.
> > > -    if [ "${@oe.utils.all_distro_features(d, 'ipv6', 'true',
> 'false')}" =3D "false" ]; then
> > > +    if [ "${@bb.utils.contains('DISTRO_FEATURES', 'ipv6', 'true',
> 'false', d)}" =3D "false" ]; then
>
> For the record, that can be simplified to:
>
>     if [ -z "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}" ]; then
>
>
I have taken this suggestion.


> > >          sed -i 's/UTscapy.py/UTscapy.py -K ipv6/g'
> ${D}${PTEST_PATH}/run-ptest
> > >      fi
> > >  }
> >
> > Thanks,  I was going to write that patch after your report but you beat
> me
> > too it!
> >
> > Cheers,
> >
> > Richard
>
> //Peter
>
>

--0000000000004ed82206540f2f15
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jun 11,=
 2026 at 9:35=E2=80=AFAM Peter Kjellerstedt &lt;<a href=3D"mailto:peter.kje=
llerstedt@axis.com">peter.kjellerstedt@axis.com</a>&gt; wrote:<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex">&gt; -----Original Message--=
---<br>
&gt; From: <a href=3D"mailto:openembedded-devel@lists.openembedded.org" tar=
get=3D"_blank">openembedded-devel@lists.openembedded.org</a> &lt;<a href=3D=
"mailto:openembedded-devel@lists.openembedded.org" target=3D"_blank">openem=
bedded-devel@lists.openembedded.org</a>&gt; On Behalf Of Richard Purdie via=
 <a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D"_bl=
ank">lists.openembedded.org</a><br>
&gt; Sent: den 10 juni 2026 11:53<br>
&gt; To: <a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@g=
mail.com</a>; <a href=3D"mailto:openembedded-devel@lists.openembedded.org" =
target=3D"_blank">openembedded-devel@lists.openembedded.org</a><br>
&gt; Cc: Khem Raj &lt;<a href=3D"mailto:khem.raj@oss.qualcomm.com" target=
=3D"_blank">khem.raj@oss.qualcomm.com</a>&gt;<br>
&gt; Subject: Re: [oe] [meta-networking][PATCH] python3-scapy: Replace oe.u=
tils.all_distro_featuresc with bb.utils.contains<br>
&gt; <br>
&gt; On Tue, 2026-06-09 at 07:48 -0700, Khem Raj via <a href=3D"http://list=
s.openembedded.org" rel=3D"noreferrer" target=3D"_blank">lists.openembedded=
.org</a> wrote:<br>
&gt; &gt; oe.utils.all_distro_features is being removed.<br>
&gt; &gt;<br>
&gt; &gt; Signed-off-by: Khem Raj &lt;<a href=3D"mailto:khem.raj@oss.qualco=
mm.com" target=3D"_blank">khem.raj@oss.qualcomm.com</a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt; =C2=A0meta-networking/recipes-devtools/python/<a href=3D"http://p=
ython3-scapy_2.6.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-scapy_2=
.6.1.bb</a> | 2 +-<br>
&gt; &gt; =C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt; &gt;<br>
&gt; &gt; diff --git a/meta-networking/recipes-devtools/python/<a href=3D"h=
ttp://python3-scapy_2.6.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-=
scapy_2.6.1.bb</a> b/meta-networking/recipes-devtools/python/<a href=3D"htt=
p://python3-scapy_2.6.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-sc=
apy_2.6.1.bb</a><br>
&gt; &gt; index 678aec0135..fac14221c5 100644<br>
&gt; &gt; --- a/meta-networking/recipes-devtools/python/<a href=3D"http://p=
ython3-scapy_2.6.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-scapy_2=
.6.1.bb</a><br>
&gt; &gt; +++ b/meta-networking/recipes-devtools/python/<a href=3D"http://p=
ython3-scapy_2.6.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-scapy_2=
.6.1.bb</a><br>
&gt; &gt; @@ -42,7 +42,7 @@ do_install_ptest() {<br>
&gt; &gt; =C2=A0=C2=A0=C2=A0=C2=A0 # note1: if ipv6 isn&#39;t enabled, skip=
 the related test (add &#39;-K ipv6&#39; argument)<br>
&gt; &gt; =C2=A0=C2=A0=C2=A0=C2=A0 # note2: to make this test work, your IS=
P also must support ipv6 - the test is trying<br>
&gt; &gt; =C2=A0=C2=A0=C2=A0=C2=A0 #=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 to ping <a href=3D"http://google.com" rel=3D"noreferrer" target=3D"_bla=
nk">google.com</a> through ipv6.<br>
&gt; &gt; -=C2=A0=C2=A0=C2=A0 if [ &quot;${@oe.utils.all_distro_features(d,=
 &#39;ipv6&#39;, &#39;true&#39;, &#39;false&#39;)}&quot; =3D &quot;false&qu=
ot; ]; then<br>
&gt; &gt; +=C2=A0=C2=A0=C2=A0 if [ &quot;${@bb.utils.contains(&#39;DISTRO_F=
EATURES&#39;, &#39;ipv6&#39;, &#39;true&#39;, &#39;false&#39;, d)}&quot; =
=3D &quot;false&quot; ]; then<br>
<br>
For the record, that can be simplified to:<br>
<br>
=C2=A0 =C2=A0 if [ -z &quot;${@bb.utils.filter(&#39;DISTRO_FEATURES&#39;, &=
#39;ipv6&#39;, d)}&quot; ]; then<br>
<br></blockquote><div><br></div><div>I have taken this suggestion.</div><di=
v>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt; &gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sed -i &#39;s/UT=
scapy.py/UTscapy.py -K ipv6/g&#39; ${D}${PTEST_PATH}/run-ptest<br>
&gt; &gt; =C2=A0=C2=A0=C2=A0=C2=A0 fi<br>
&gt; &gt; =C2=A0}<br>
&gt; <br>
&gt; Thanks,=C2=A0 I was going to write that patch after your report but yo=
u beat me<br>
&gt; too it!<br>
&gt; <br>
&gt; Cheers,<br>
&gt; <br>
&gt; Richard<br>
<br>
//Peter<br>
<br>
</blockquote></div></div>

--0000000000004ed82206540f2f15--

