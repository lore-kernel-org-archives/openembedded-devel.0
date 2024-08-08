Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5894EC3DA4A
	for <webhook@archiver.kernel.org>; Thu,  8 Aug 2024 16:47:09 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
 by mx.groups.io with SMTP id smtpd.web11.64868.1723135626350355427
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Aug 2024 09:47:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hS0OPCXM;
 spf=pass (domain: gmail.com, ip: 209.85.167.41, mailfrom: ticotimo@gmail.com)
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-52efdf02d13so2290255e87.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 08 Aug 2024 09:47:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723135624; x=1723740424; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=26icBf6BUIqjPoaw78bLL8CWi+12IqFTZp7fouUamVU=;
        b=hS0OPCXMzdB6WRZ6s9S1ttM+S1KifUhpXQAEAo2bJO3Ehf4egbahoj8WlUOU+L8PUo
         EvOr8/kZI1NHcwvRH3NpqrMCSN1YfRnY4i4aJn6/fZlD81KrvNf/J4Y+2ZXg8oi/NPOK
         bCRyf4hKKpqnX2aBf9nM12PcvbzitlCDd7iQjsplCdYnmggqFSJYtPnjWZt31XLoaYTX
         bUt8nLeyLRKzhWh/a0GgmJWLd+DxShHVBOPImyfq2BWvOIAhL+GARKi63n0BS9eMkpCB
         y28TMfdF3HnC4qczHsELqJ5GjsbZp311/3x07xuPymeJTgiUxV62yeYO0IhhHXnUhL1f
         49MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723135624; x=1723740424;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=26icBf6BUIqjPoaw78bLL8CWi+12IqFTZp7fouUamVU=;
        b=hxNDaO7zuYUeK4Jz2/prWo/Oe26oNsPTWW5xsg0z204DT/L7SZtyshQB6rnfvHGKgl
         lwcVNeCFifgEt0EQOTa9YD+dczExDLDXwNnLEDEDh5RK2Fhv3MV48xUEWi9uYzwAzHRx
         z3lCmaXdOh4jGJeqXSkej2FxXLVwCnBCZHEuckeSr4FQMpB5TWSoQQZl5/e4ZDmJL8SH
         pD5MwgjDBTOtUdubmR/klepwqTJyCJkY1ny8m2xDBKRtEJG0wv+BN4zPpNkWZXZaMBOI
         yNnzWA1Q5yT19qSCEyOE7Cn2hdf6R9CsBkhp2jQ6OS5fcTJdqXA66msCSA571dEVzxFz
         S8Yw==
X-Forwarded-Encrypted: i=1; AJvYcCXVGbIM70j2DMY4U0rThjCNgFhuwH6NlIRJo/3OMl+3CzUUUmlbGWJCPWOurWfzchhryCK+mMkyE+UUbAr5j1chenvApyiaURqh8I5+iiTCQqN+ixkNdHHX9A==
X-Gm-Message-State: AOJu0Yz5h7lmQONF6E9Vd45bWdAmwTyS417TYPX64X7abk+2S/hiUAD/
	axx3uDHDRqQFDzg3wI/u0CPTP0o/q6NmLUAv+QbR+bXiyARvlq2JgF/M5ttt4GWhbWvh72uZFqG
	iO3bKad3oJkoyvWkV7hISLI8K6AM=
X-Google-Smtp-Source: AGHT+IEhcFA+YMvcXSNFkOjUwRVvZF4ZKUkIXxsSeCiBxynJwZDzjrWO8FR3CL7NCZTMo42oagTiKmyrTlS+xyGlLXo=
X-Received: by 2002:a05:6512:31c4:b0:52c:df8e:a367 with SMTP id
 2adb3069b0e04-530e588c543mr2580953e87.53.1723135623991; Thu, 08 Aug 2024
 09:47:03 -0700 (PDT)
MIME-Version: 1.0
References: <4453e069-6679-42ae-b3bb-cdd223bf9da1@gmail.com>
 <547021D2-496C-4944-BCDA-438EBD0B42E0@gmail.com> <CAMKF1srA8cZigcRuK6mecudctEjtv+NJQtBbqpZMirWdMRzujQ@mail.gmail.com>
 <sewubxpvgxzg52shb7erornf3llh7u4zuvpifiqz3hg53ekelw@axibx56xtnae> <CAMKF1spUQBUtq3miZ20aCRQFxEsigGSqkBujC61HwvWG6360OQ@mail.gmail.com>
In-Reply-To: <CAMKF1spUQBUtq3miZ20aCRQFxEsigGSqkBujC61HwvWG6360OQ@mail.gmail.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Thu, 8 Aug 2024 09:46:50 -0700
Message-ID: <CANx9H-Csqzgnx-bu4doMPKizQn0GxnE+HsmQ5DN_V3UUmB9DrQ@mail.gmail.com>
Subject: Re: [oe] [meta-python][scarthgap][PATCH] python3-pydantic-core:
 upgrade 2.16.3 -> 2.18.1
To: raj.khem@gmail.com
Cc: Richard Leitner <dev@g0hl1n.net>, debrabander@gmail.com, 
	akuster808 <akuster808@gmail.com>, openembedded-devel@lists.openembedded.org, 
	tim.orling@konsulko.com
Content-Type: multipart/alternative; boundary="000000000000c49a57061f2ec6a2"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 08 Aug 2024 16:47:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111678

--000000000000c49a57061f2ec6a2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I will prepare a series to fix this once and for all in scarthgap. Please
hold on for a day or so.

Thank you to everyone that has been trying to work on this unfortunate
situation.

On Thu, Aug 8, 2024 at 9:45=E2=80=AFAM Khem Raj via lists.openembedded.org
<raj.khem=3Dgmail.com@lists.openembedded.org> wrote:

>
>
> On Thu, Aug 8, 2024 at 12:44=E2=80=AFAM Richard Leitner <dev@g0hl1n.net> =
wrote:
>
>> On Tue, Aug 06, 2024 at 01:09:10PM GMT, Khem Raj wrote:
>> > On Mon, Aug 5, 2024 at 12:08=E2=80=AFAM Frank de Brabander via
>> > lists.openembedded.org <debrabander=3Dgmail.com@lists.openembedded.org=
>
>> > wrote:
>> > >
>> > >
>> > >
>> > > > Op 3 aug 2024 om 18:51 heeft akuster808 <akuster808@gmail.com> het
>> volgende geschreven:
>> > > >
>> > > > =EF=BB=BF
>> > > >
>> > > >> On 7/31/24 4:07 AM, Frank de Brabander wrote:
>> > > >> I was unaware of this discussion when I created the fix for maste=
r.
>> > > >> Note that I've silenced the TMPDIR QA message, this still needs a
>> > > >> proper fix in master as well.
>> > > >>
>> > > >> This indeed needs to be fixed in scarthgap as well, since the
>> > > >> incompatible versions do break some code. My two cents for the
>> available
>> > > >> options:
>> > > >>
>> > > >>  - Revert pydantic upgrade (from 2.7.0 back to 2.6.4)
>> > > >>  - Update pydantic-core to 2.18.1
>> > > >>  - Use master (pydantic 2.7.3 and pydantic-core 2.18.4)
>> > > >>
>> > > >> Would only downgrade if this is the *only* allowed option
>> according to
>> > > >> the LTS branch policy. Version 2.7.x includes new features
>> compared to
>> > > >> 2.6.4. Removing these with a downgrade would violate the LTS patc=
h
>> policy
>> > > >> of not merging "ABI/API breakage".
>> > > >
>> > > > We have had this type of situation with a pkg (A) update in master
>> and then new lts was branched. We found out other later additional pkgs
>> needed to updated to work with pkg (A). pydantic update was in Master
>> before scarthgap was branched.
>> > > >>
>> > > >> Option 2 or 3 are my preferred choices and they fall within the
>> > > >> "fixes for bugs" category of the LTS patch policy. Option 2 is th=
e
>> smallest
>> > > >> change to fix the problem, but option 3 includes some additional
>> upstream
>> > > >> fixes with the update from 2.7.0 to 2.7.3.
>> > > >
>> > > > Master should be failing so if Master gets a revert of pydantic
>> back to 2.6.4, then Scarthgap will follow. Is this an option? - Armin
>> > >
>> > > As far as I know master works now, so a revert would make no sense i=
n
>> that case.
>> >
>> > Hi Armin
>> >
>> > scarthgap is relatively new and I think I would be in favor of making
>> > an exception for this one case.
>>
>> Hi Khem,
>> thanks. Sounds good to me.
>>
>> Do you prefer going to the same pydantic{,-core} version as master,
>> or stick with 2.7.0 and update only pydantic-core to 2.18.1?.
>>
>
> Best is to use the one that will work in tandem well if that would be
> newer one from master than we might have to bring that too
>
>>
>> regards;rl
>>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#111677):
> https://lists.openembedded.org/g/openembedded-devel/message/111677
> Mute This Topic: https://lists.openembedded.org/mt/107073841/924729
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> ticotimo@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000c49a57061f2ec6a2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I will prepare a series to fix this once and for all =
in scarthgap. Please hold on for a day or so.</div><div><br></div><div>Than=
k you to everyone that has been trying to work on this unfortunate situatio=
n.</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr=
">On Thu, Aug 8, 2024 at 9:45=E2=80=AFAM Khem Raj via <a href=3D"http://lis=
ts.openembedded.org">lists.openembedded.org</a> &lt;raj.khem=3D<a href=3D"m=
ailto:gmail.com@lists.openembedded.org">gmail.com@lists.openembedded.org</a=
>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><di=
v dir=3D"auto"><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Thu, Aug 8, 2024 at 12:44=E2=80=AFAM Richard Lei=
tner &lt;<a href=3D"mailto:dev@g0hl1n.net" target=3D"_blank">dev@g0hl1n.net=
</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=
On Tue, Aug 06, 2024 at 01:09:10PM GMT, Khem Raj wrote:<br>
&gt; On Mon, Aug 5, 2024 at 12:08=E2=80=AFAM Frank de Brabander via<br>
&gt; <a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D=
"_blank">lists.openembedded.org</a> &lt;debrabander=3D<a href=3D"mailto:gma=
il.com@lists.openembedded.org" target=3D"_blank">gmail.com@lists.openembedd=
ed.org</a>&gt;<br>
&gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; &gt; Op 3 aug 2024 om 18:51 heeft akuster808 &lt;<a href=3D"mailt=
o:akuster808@gmail.com" target=3D"_blank">akuster808@gmail.com</a>&gt; het =
volgende geschreven:<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; =EF=BB=BF<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;&gt; On 7/31/24 4:07 AM, Frank de Brabander wrote:<br>
&gt; &gt; &gt;&gt; I was unaware of this discussion when I created the fix =
for master.<br>
&gt; &gt; &gt;&gt; Note that I&#39;ve silenced the TMPDIR QA message, this =
still needs a<br>
&gt; &gt; &gt;&gt; proper fix in master as well.<br>
&gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt;&gt; This indeed needs to be fixed in scarthgap as well, sinc=
e the<br>
&gt; &gt; &gt;&gt; incompatible versions do break some code. My two cents f=
or the available<br>
&gt; &gt; &gt;&gt; options:<br>
&gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt;&gt;=C2=A0 - Revert pydantic upgrade (from 2.7.0 back to 2.6.=
4)<br>
&gt; &gt; &gt;&gt;=C2=A0 - Update pydantic-core to 2.18.1<br>
&gt; &gt; &gt;&gt;=C2=A0 - Use master (pydantic 2.7.3 and pydantic-core 2.1=
8.4)<br>
&gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt;&gt; Would only downgrade if this is the *only* allowed optio=
n according to<br>
&gt; &gt; &gt;&gt; the LTS branch policy. Version 2.7.x includes new featur=
es compared to<br>
&gt; &gt; &gt;&gt; 2.6.4. Removing these with a downgrade would violate the=
 LTS patch policy<br>
&gt; &gt; &gt;&gt; of not merging &quot;ABI/API breakage&quot;.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; We have had this type of situation with a pkg (A) update in =
master and then new lts was branched. We found out other later additional p=
kgs needed to updated to work with pkg (A). pydantic update was in Master b=
efore scarthgap was branched.<br>
&gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt;&gt; Option 2 or 3 are my preferred choices and they fall wit=
hin the<br>
&gt; &gt; &gt;&gt; &quot;fixes for bugs&quot; category of the LTS patch pol=
icy. Option 2 is the smallest<br>
&gt; &gt; &gt;&gt; change to fix the problem, but option 3 includes some ad=
ditional upstream<br>
&gt; &gt; &gt;&gt; fixes with the update from 2.7.0 to 2.7.3.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Master should be failing so if Master gets a revert of pydan=
tic back to 2.6.4, then Scarthgap will follow. Is this an option? - Armin<b=
r>
&gt; &gt;<br>
&gt; &gt; As far as I know master works now, so a revert would make no sens=
e in that case.<br>
&gt; <br>
&gt; Hi Armin<br>
&gt; <br>
&gt; scarthgap is relatively new and I think I would be in favor of making<=
br>
&gt; an exception for this one case.<br>
<br>
Hi Khem,<br>
thanks. Sounds good to me.<br>
<br>
Do you prefer going to the same pydantic{,-core} version as master,<br>
or stick with 2.7.0 and update only pydantic-core to 2.18.1?.<br>
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">Best is to use t=
he one that will work in tandem well if that would be newer one from master=
 than we might have to bring that too=C2=A0</div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex"><br>
regards;rl<br>
</blockquote></div></div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#111677): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/111677" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/111677</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/107073841/924=
729" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/107073841/924729</a><br>
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

--000000000000c49a57061f2ec6a2--

