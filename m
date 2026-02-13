Return-Path: <eric.meyers15310@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFEF4EDF168
	for <webhook@archiver.kernel.org>; Fri, 13 Feb 2026 14:21:13 +0000 (UTC)
Received: from mail-vs1-f68.google.com (mail-vs1-f68.google.com [209.85.217.68])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.72689.1770992470234884072
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 13 Feb 2026 06:21:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lIozufC1;
 spf=pass (domain: gmail.com, ip: 209.85.217.68, mailfrom: eric.meyers15310@gmail.com)
Received: by mail-vs1-f68.google.com with SMTP id ada2fe7eead31-5fc414b9c99so598763137.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 13 Feb 2026 06:21:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770992469; cv=none;
        d=google.com; s=arc-20240605;
        b=BggYUytuo+goe0fec39YaX2wmAdt4wNbHX43MWrRA9XFFTJ5i0QISm9rYzHIgIryS9
         CwGlteDXUHOFxlITNqk3fR8icgKxOevRy42+OPVdcsuZg6qHNXptym0a/yHZRyrQ4nvX
         OL2t/4pBT/mM2njOj6zpIAYpWPx3bhatSR9Ahh6qG2gUVh6YOGzj0yusfTrCdiANxnjV
         bnjD/71AP46k6PFBu6Mz/kbxyeWm1JF8eYw5GljgfFavXAQEK0D61QxL4HTmcFM/UXZ4
         Blfdv9HBHCN+nY5Cao8ZBUH40CUH/WQBtCgPBczD4JLolWOsJ8bvN8lfdXnht8LIaDAl
         +5RA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=0mRpvvXgDY0rHrZJMSEJdfnZdg2e4oZ66EiKFR04YsQ=;
        fh=R1b/v2rm2m1KyOdwoCUBwZcBbO4hGy4571MZcGknbU0=;
        b=XK9QQ2Wm7L19xCOOjF3Cb8hcM2ujikIpHIJ/QTcaJkX7xpEw+OxHuutjE4pv6f842T
         ya1aaOOU/6JMqaFy0fv2rHXEGyTAzDHyTxSSlOoeGA39+ki9vn2i+SlLcjcL++hheZxv
         jjENT6E1bYBA5Pv1Oj6saJ9z0UaLmWCpZ+O9VM+33vt/x9vRms9kS08NX34t2VDluqKE
         ANdFKoeGBktvyzwF3jnudkEZrDKF7cIkmctrcSoacdXvhakTAqNfG3nCik8vqowbyx8V
         h4fk+ZQ75RhuRIACicfW+heRN0Ff12tkGwIQk3fkhcErQuHpYsUWyUs6VM+a6p5WYT9M
         OdgQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770992469; x=1771597269; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0mRpvvXgDY0rHrZJMSEJdfnZdg2e4oZ66EiKFR04YsQ=;
        b=lIozufC1vIc000t+8Bx0iiWKclaHiwX9DcFuDW1OOLsOkDNCvpR9sfZZ0aI3fbrYm8
         afGTR2fq/jHdFHmVr8mtMnzO0YvHrEsqp5SqTehzuyyCWQMXXfrIW49ZcuCiZSjk/XZb
         nFyxmjY4U5gQkYqLnnPM5icHZzjGrdMmjmcHv5T3v9AHAnbhNRDtLqrTF0nwxu2R7oGF
         O4YncqNetQK2aXdRIyJZPhsyYPLsijtUM3ZV38S7mfsuH022y8S9nLTHqvwzV2/a3XM1
         2eHk6vIIv1ip+viOIqcun7uIHxUflNK+Zf9G3QS8XwkUX5zhb30amcG6J11Q89ILz391
         YmGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770992469; x=1771597269;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0mRpvvXgDY0rHrZJMSEJdfnZdg2e4oZ66EiKFR04YsQ=;
        b=ZbKCj07IVzi6iQ85AOJWRjf05mqjwT2N3Id89JPUav93G5Y7Nz9WB37fxCkgXK0IY4
         BJpgFgfZNzOfmFsP1EVZC4zyglWDplA26GZhS5iqSDomAGHLKrd+smcSvTty+s0tg/a7
         jWaF1DL+5KH1pmKQJ7DfB4yUXpmp0MD6r9877toA1KsXrX7rzKYnacDk8KWMPJRPe6DN
         XoBagUGpjJj680RWNIrNU0I08Ar4n+Gps7c9W3SDRJIbJrVYMiu+MOdxhd4Czn0YSS7n
         ifrGi5JbUWBYQ43lEjmvta5Yglg4FOuw8r5nckeIgRYuFa68U/Hi081hOJSFvTTEm3aZ
         1r4A==
X-Forwarded-Encrypted: i=1; AJvYcCWzZtp0zKD8Sx43g9L+zoq9UvN9JzGrFTpqdbuGVygrwMSHaJkuZCpBLJ1kTfxDn5pMeF0vnFELk/qnzn4a2jH2Duo=@lists.openembedded.org
X-Gm-Message-State: AOJu0YyJqFYw8jyTZ9q9UuwnIQ83RDZQheFrQ2Kcg+ounscMxdpmtK5G
	JLnVHqL9iUb2c8QxmzOtFU2tw+UM+TvcoSTaOefNm/8SnOnd9yYi6bO4SKuTzPXj2xnensRBOE0
	Q2Q4LxjWDQCU/z6FHSKC7iUuoPHmrX6g=
X-Gm-Gg: AZuq6aIPi92doQEeXU0JuAOIkLTSC9ff3JDuPh4HhEgopoLYBDSwEpADz6gZD/mi5Lg
	9jfY0ugLVLmWHOQpU5jvdcx4ZrmRH7I5L8PO2m17YD53wNKywHElz+PrGqyk12X2G5u62kYNGsC
	MpUsPuYFabgJmFYrCy4W27yc1aHpl7vk8G2AjLhti7djaxJOgsxjCauwOpJsHZJgTaaHnnGq56m
	OLrDAL1LpIqAY7CIPWiS/Sn9XzcmpUgtJD6/Gu/e4/UrFqc1lBp444PKQjLLVFa+zbqzUA09Ty+
	/lX9Bam5dZGRJaAfag==
X-Received: by 2002:a05:6102:41a3:b0:5ee:a590:6b11 with SMTP id
 ada2fe7eead31-5fe1ae5c5d1mr734184137.36.1770992468852; Fri, 13 Feb 2026
 06:21:08 -0800 (PST)
MIME-Version: 1.0
References: <20260212182929.8047-1-eric.meyers@arthrex.com>
 <18939BFE647A0E33.653184@lists.openembedded.org> <7814b942-6309-48eb-8151-658f107f1cb2@gmail.com>
 <CAMKF1sogR_FXy3By7w9sKtH-rCzL5V1=rf1EoXs6wwHFocLssw@mail.gmail.com>
In-Reply-To: <CAMKF1sogR_FXy3By7w9sKtH-rCzL5V1=rf1EoXs6wwHFocLssw@mail.gmail.com>
From: Eric Meyers <eric.meyers15310@gmail.com>
Date: Fri, 13 Feb 2026 08:21:03 -0600
X-Gm-Features: AZwV_QhvytcxOrXy_aO4AOZXylU1zTq4u-1okUXQwUXP97_SN1GQHAWh8c6qaMA
Message-ID: <CA+cKJ+G7imomNAkVicNGCqw807CAKkdLJ814dr97ZCoYvcDGEw@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH v2] redis: Remove debug paths to avoid
 TMPDIR [buildpaths] errors
To: Khem Raj <raj.khem@gmail.com>
Cc: skandigraun@gmail.com, openembedded-devel@lists.openembedded.org, 
	Eric Meyers <eric.meyers@arthrex.com>
Content-Type: multipart/alternative; boundary="0000000000000189d5064ab551e3"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 13 Feb 2026 14:21:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124389

--0000000000000189d5064ab551e3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 12, 2026 at 8:46=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wrote=
:

>
>
> On Thu, Feb 12, 2026 at 2:39=E2=80=AFPM Gyorgy Sarvari via lists.openembe=
dded.org
> <skandigraun=3Dgmail.com@lists.openembedded.org> wrote:
>
>> On 2/12/26 22:09, Gyorgy Sarvari via lists.openembedded.org wrote:
>> > On 2/12/26 19:29, Eric Meyers via lists.openembedded.org wrote:
>> >> Takes similar approach to valkey recipe seen here:
>> >>
>> >>
>> https://github.com/openembedded/meta-openembedded/commit/1b820b98afd55c8=
81822beb9057162dc67ecb386
>> >>
>> >> Signed-off-by: Eric Meyers <eric.meyers@arthrex.com>
>> >> ---
>> >>  meta-oe/recipes-extended/redis/redis_7.2.12.bb | 7 +++++++
>> >>  1 file changed, 7 insertions(+)
>> >>
>> >> diff --git a/meta-oe/recipes-extended/redis/redis_7.2.12.bb
>> b/meta-oe/recipes-extended/redis/redis_7.2.12.bb
>> >> index 8abf758930..589ffd6fb2 100644
>> >> --- a/meta-oe/recipes-extended/redis/redis_7.2.12.bb
>> >> +++ b/meta-oe/recipes-extended/redis/redis_7.2.12.bb
>> >> @@ -52,6 +52,11 @@ do_compile:prepend() {
>> >>  }
>> >>
>> >>  do_install() {
>> >> +    # Remove debug paths to avoid TMPDIR [buildpaths] errors
>> >> +    sed -i -e 's#${TMPDIR}##g' ${S}/src/redis-benchmark
>> >> +    sed -i -e 's#${TMPDIR}##g' ${S}/src/redis-server
>> >> +    sed -i -e 's#${TMPDIR}##g' ${S}/src/redis-cli
>> >> +
>> > If I check the file type of these files, I get this:
>> >
>> https://gist.githubusercontent.com/OldManYellsAtCloud/5892bde7408475a93d=
2faa699ae65aea/raw/3309eb40e0467bd7e2a2bcbd540c822b071242d4/gistfile1.txt
>> >
>> > These are binary files, cutting out parts with sed will break them mos=
t
>> > probably. I think this will need another solution (will take a look at
>> > valkey also, if it has the same)
>> >
>>
>> I have sent an alternative proposal[1] - do you think you could test it
>> if works for you also?
>>
>> [1]: https://lists.openembedded.org/g/openembedded-devel/message/124363
>>
>>
> yeah I think this would ensure that LDFLAGS behaviour prior to OE-core
> change so I would
> take the patch proposed in [1]
>
>
>> >
>> >>      export PREFIX=3D${D}/${prefix}
>> >>      oe_runmake install
>> >>      install -d ${D}/${sysconfdir}/redis
>> >> @@ -71,6 +76,8 @@ do_install() {
>> >>      fi
>> >>  }
>> >>
>> >> +INSANE_SKIP:${PN} +=3D "already-stripped"
>> >> +
>> >>  CONFFILES:${PN} =3D "${sysconfdir}/redis/redis.conf"
>> >>
>> >>  INITSCRIPT_NAME =3D "redis-server"
>> >>
>> >>
>> >>
>> >
>> >
>> >
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#124364):
>> https://lists.openembedded.org/g/openembedded-devel/message/124364
>> Mute This Topic: https://lists.openembedded.org/mt/117779563/1997914
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
>> raj.khem@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>
>>
I'm okay with using patch [1]. Things seem to be building on my end after
pruning sstate/cleaning.

--0000000000000189d5064ab551e3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Thu, Feb 12, 2026 at 8:46=E2=80=AFPM K=
hem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt=
; wrote:</div><div class=3D"gmail_quote gmail_quote_container"><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr"><br=
></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr"=
>On Thu, Feb 12, 2026 at 2:39=E2=80=AFPM Gyorgy Sarvari via <a href=3D"http=
://lists.openembedded.org" target=3D"_blank">lists.openembedded.org</a> &lt=
;skandigraun=3D<a href=3D"mailto:gmail.com@lists.openembedded.org" target=
=3D"_blank">gmail.com@lists.openembedded.org</a>&gt; wrote:<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">On 2/12/26 22:09, Gyorgy Sarvar=
i via <a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=
=3D"_blank">lists.openembedded.org</a> wrote:<br>
&gt; On 2/12/26 19:29, Eric Meyers via <a href=3D"http://lists.openembedded=
.org" rel=3D"noreferrer" target=3D"_blank">lists.openembedded.org</a> wrote=
:<br>
&gt;&gt; Takes similar approach to valkey recipe seen here:<br>
&gt;&gt;<br>
&gt;&gt; <a href=3D"https://github.com/openembedded/meta-openembedded/commi=
t/1b820b98afd55c881822beb9057162dc67ecb386" rel=3D"noreferrer" target=3D"_b=
lank">https://github.com/openembedded/meta-openembedded/commit/1b820b98afd5=
5c881822beb9057162dc67ecb386</a><br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Eric Meyers &lt;<a href=3D"mailto:eric.meyers@arthr=
ex.com" target=3D"_blank">eric.meyers@arthrex.com</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt;=C2=A0 meta-oe/recipes-extended/redis/<a href=3D"http://redis_7.2.1=
2.bb" rel=3D"noreferrer" target=3D"_blank">redis_7.2.12.bb</a> | 7 +++++++<=
br>
&gt;&gt;=C2=A0 1 file changed, 7 insertions(+)<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/meta-oe/recipes-extended/redis/<a href=3D"http://redi=
s_7.2.12.bb" rel=3D"noreferrer" target=3D"_blank">redis_7.2.12.bb</a> b/met=
a-oe/recipes-extended/redis/<a href=3D"http://redis_7.2.12.bb" rel=3D"noref=
errer" target=3D"_blank">redis_7.2.12.bb</a><br>
&gt;&gt; index 8abf758930..589ffd6fb2 100644<br>
&gt;&gt; --- a/meta-oe/recipes-extended/redis/<a href=3D"http://redis_7.2.1=
2.bb" rel=3D"noreferrer" target=3D"_blank">redis_7.2.12.bb</a><br>
&gt;&gt; +++ b/meta-oe/recipes-extended/redis/<a href=3D"http://redis_7.2.1=
2.bb" rel=3D"noreferrer" target=3D"_blank">redis_7.2.12.bb</a><br>
&gt;&gt; @@ -52,6 +52,11 @@ do_compile:prepend() {<br>
&gt;&gt;=C2=A0 }<br>
&gt;&gt;=C2=A0 <br>
&gt;&gt;=C2=A0 do_install() {<br>
&gt;&gt; +=C2=A0 =C2=A0 # Remove debug paths to avoid TMPDIR [buildpaths] e=
rrors<br>
&gt;&gt; +=C2=A0 =C2=A0 sed -i -e &#39;s#${TMPDIR}##g&#39; ${S}/src/redis-b=
enchmark<br>
&gt;&gt; +=C2=A0 =C2=A0 sed -i -e &#39;s#${TMPDIR}##g&#39; ${S}/src/redis-s=
erver<br>
&gt;&gt; +=C2=A0 =C2=A0 sed -i -e &#39;s#${TMPDIR}##g&#39; ${S}/src/redis-c=
li<br>
&gt;&gt; +<br>
&gt; If I check the file type of these files, I get this:<br>
&gt; <a href=3D"https://gist.githubusercontent.com/OldManYellsAtCloud/5892b=
de7408475a93d2faa699ae65aea/raw/3309eb40e0467bd7e2a2bcbd540c822b071242d4/gi=
stfile1.txt" rel=3D"noreferrer" target=3D"_blank">https://gist.githubuserco=
ntent.com/OldManYellsAtCloud/5892bde7408475a93d2faa699ae65aea/raw/3309eb40e=
0467bd7e2a2bcbd540c822b071242d4/gistfile1.txt</a><br>
&gt;<br>
&gt; These are binary files, cutting out parts with sed will break them mos=
t<br>
&gt; probably. I think this will need another solution (will take a look at=
<br>
&gt; valkey also, if it has the same)<br>
&gt;<br>
<br>
I have sent an alternative proposal[1] - do you think you could test it<br>
if works for you also?<br>
<br>
[1]: <a href=3D"https://lists.openembedded.org/g/openembedded-devel/message=
/124363" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.or=
g/g/openembedded-devel/message/124363</a><br>
<br></blockquote><div><br></div><div>yeah I think this would ensure that LD=
FLAGS behaviour prior to OE-core change so I would</div><div>take the patch=
 proposed in [1]</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex">
&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 export PREFIX=3D${D}/${prefix}<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 oe_runmake install<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 install -d ${D}/${sysconfdir}/redis<br>
&gt;&gt; @@ -71,6 +76,8 @@ do_install() {<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 fi<br>
&gt;&gt;=C2=A0 }<br>
&gt;&gt;=C2=A0 <br>
&gt;&gt; +INSANE_SKIP:${PN} +=3D &quot;already-stripped&quot;<br>
&gt;&gt; +<br>
&gt;&gt;=C2=A0 CONFFILES:${PN} =3D &quot;${sysconfdir}/redis/redis.conf&quo=
t;<br>
&gt;&gt;=C2=A0 <br>
&gt;&gt;=C2=A0 INITSCRIPT_NAME =3D &quot;redis-server&quot;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;<br>
&gt; <br>
&gt;<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#124364): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/124364" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/124364</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/117779563/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/117779563/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" targ=
et=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br></blockquote></div></div></blockquote><div><br></div><div>I&#39;m okay =
with using patch [1]. Things seem to be building on my end after pruning=C2=
=A0sstate/cleaning.=C2=A0</div></div></div>

--0000000000000189d5064ab551e3--

