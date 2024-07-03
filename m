Return-Path: <ninette@neighbourhood.ie>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3F49C30653
	for <webhook@archiver.kernel.org>; Wed,  3 Jul 2024 18:10:27 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
 by mx.groups.io with SMTP id smtpd.web11.57937.1720030224354106579
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Jul 2024 11:10:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@thehoodiefirm-com.20230601.gappssmtp.com header.s=20230601 header.b=ARYBPmId;
 spf=neutral (domain: thehoodiefirm.com, ip: 209.85.208.50, mailfrom: ninette@thehoodiefirm.com)
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-58b0dddab63so4311307a12.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 03 Jul 2024 11:10:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thehoodiefirm-com.20230601.gappssmtp.com; s=20230601; t=1720030223; x=1720635023; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qy++w0EvffpvOQ6PE/xT9+wPEMP3/cVYjScVrXa1XMQ=;
        b=ARYBPmIdIotVkpkbH+AIeEhpX0bULJRC7rBLMLn9vm2lcNXAi+WfebHZJQ7HegxHiF
         m8pCtYNsNSnG1duKP6vpNPBikqi3pNuzCg6ENsOg8q+KW3K0bSUxx4vuRrQ55tUwnrbH
         0PvdUUaumDQOkfarME39AcOKt7enWwDufwJYedBkN0uWKZtDNQe/UbuAaw8Ule01WoRY
         zv4MusnwHs2vrqvgJQ5PEp5QvtoFPp5J5I8pAN3aNayrqo7OuYNQ4p0/YSNkid4O7BY7
         PYAi9jPl1Vjwcq2tf9DIkdkoTWDi+eLiCBdGorxIMXG2UWYFdu6dlYBld4fj29noMn0N
         jQuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720030223; x=1720635023;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qy++w0EvffpvOQ6PE/xT9+wPEMP3/cVYjScVrXa1XMQ=;
        b=E38/rKSKonb0yf7xtCmyTGIIxrBvMg99poji0R25/aFNpvOVw0unairZ/Hvz3CO2QY
         CjDsdDwIM9aegJ0txDQjduhjFoXp8mbKkf/T13ILFMCWot90Amt8yVrxYcJnDRXV9qiW
         I5pm4IziiYVvk8Z5Gl+JQr+B4BJrFN5jV7a/m3IT83WpL898J3AuFJMUCAJENniZ/RzH
         +5xqWb9k37tp4nheepWHnR0vuMJdVfm0yHzB8/tlciwTsBRpZEVo2yOv93UewjeVSm9y
         nKF03QSRqgEXqPebnZWTaF7SxOaiAakGCQvZhQJV6PMZ+adGH1qP/aI408hIdz0moqMK
         Kj0A==
X-Forwarded-Encrypted: i=1; AJvYcCUPzYM7pc3YHOOVntowgFPKlJ1KS+eoCLpb/LDe+FfR8wNhvyIwS9GHMukv0ORZEqHP776fObIVtS6iw9OlHeFcB8rOWWkgt+hIUkiliCi/dO9Mfl/gum0bDQ==
X-Gm-Message-State: AOJu0Yy6gqXp+siTLJQprYfSBf5uwBpwmDCvOJhZ51LaRTI51Ibag69V
	qwhjkHcC96bgYSM7rSU+xqj/oOc/uBZF+B3aDuatjq7nUTeBZP4kqIzpqfkpgVtPRV+c5LXmxlm
	3M94xjvd5Nyf+TjnPhgHudW2aZtFmlRdHFSsZ+Q==
X-Google-Smtp-Source: AGHT+IHKrcwWS8vyT00ldFe3TSfefxSTAniwi3EgxDhdyyabJkX+KcOYv2LVpcbp28pYXE4hdbxqKlbSu3/TJpjEiNI=
X-Received: by 2002:a17:906:a51:b0:a77:b06d:180a with SMTP id
 a640c23a62f3a-a77b06d201bmr21974566b.48.1720030222605; Wed, 03 Jul 2024
 11:10:22 -0700 (PDT)
MIME-Version: 1.0
References: <20240703164042.20929-1-ninette@thehoodiefirm.com>
 <CAMKF1soc6CDz51w76z+jbK4Py-xRpjZJi48mksyJw1Y65teSAw@mail.gmail.com>
 <CAG1aeW1Q5QoWcNRUZGYLPpO0L7Q0jFErxEV260iQffPV=mfEPg@mail.gmail.com> <CAMKF1so9L9Y00Z_CgrdBhd_9QtgMX-nSCR4hsbUTax=eF1NDgg@mail.gmail.com>
In-Reply-To: <CAMKF1so9L9Y00Z_CgrdBhd_9QtgMX-nSCR4hsbUTax=eF1NDgg@mail.gmail.com>
From: Ninette Adhikari <ninette@neighbourhood.ie>
Date: Wed, 3 Jul 2024 11:10:11 -0700
Message-ID: <CAG1aeW2+nEeB8A6viC0YUGx7J3wCHfxbDC5BGRn71OwiYwKCSA@mail.gmail.com>
Subject: Re: [oe] [PATCH 0/1] apache2:apache2-native: CVE status update
To: Khem Raj <raj.khem@gmail.com>
Cc: engineering@neighbourhood.ie, openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000006bfc13061c5bbe7a"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 03 Jul 2024 18:10:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111240

--0000000000006bfc13061c5bbe7a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I pulled the latest and I see the apache2 version is updated to 2.4.60. But
the CVE list
<https://autobuilder.yocto.io/pub/non-release/patchmetrics-meta-oe/cve-stat=
us-master.txt>
still has the following CVEs listed: CVE-2007-0450, CVE-2010-0425
I'll send a new patch against the latest master branch to update status of
the CVEs.
Thanks!
Ninette

On Wed, Jul 3, 2024 at 10:53=E2=80=AFAM Khem Raj <raj.khem@gmail.com> wrote=
:

> Please rebase it on latest master and see if it=E2=80=99s still needed
>
> On Wed, Jul 3, 2024 at 10:44=E2=80=AFAM Ninette Adhikari <ninette@neighbo=
urhood.ie>
> wrote:
>
>> Hi Khem,
>> This is meant for the 'master' branch. It is a status update for some
>> CVEs.
>> I'll make sure to include the branch name in the subject for future
>> patches. For this patch, do I need to resend it with an updated subject
>> line? Please let me know. Thanks so much!
>>
>> Ninette
>>
>> On Wed, Jul 3, 2024 at 9:49=E2=80=AFAM Khem Raj <raj.khem@gmail.com> wro=
te:
>>
>>> which branch is it for ?
>>> Please mark it accordingly in subject line see -
>>>
>>> https://docs.yoctoproject.org/dev/contributor-guide/submit-changes.html=
#submitting-changes-to-stable-release-branches
>>>
>>> On Wed, Jul 3, 2024 at 9:40=E2=80=AFAM Ninette Adhikari via
>>> lists.openembedded.org
>>> <ninette=3Dthehoodiefirm.com@lists.openembedded.org> wrote:
>>> >
>>> > Update status for: CVE-2007-0450, CVE-2010-0425
>>> >
>>> > The current version (2.4.59) is not affected. It only applies for
>>> Windows.
>>> >
>>> > Ninette Adhikari (1):
>>> >   apache2:apache2-native: CVE status update
>>> >
>>> >  meta-webserver/recipes-httpd/apache2/apache2_2.4.59.bb | 2 ++
>>> >  1 file changed, 2 insertions(+)
>>> >
>>> > --
>>> > 2.44.0
>>> >
>>> >
>>> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>> > Links: You receive all messages sent to this group.
>>> > View/Reply Online (#111229):
>>> https://lists.openembedded.org/g/openembedded-devel/message/111229
>>> > Mute This Topic: https://lists.openembedded.org/mt/107022825/1997914
>>> > Group Owner: openembedded-devel+owner@lists.openembedded.org
>>> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsu=
b
>>> [raj.khem@gmail.com]
>>> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>> >
>>>
>>

--0000000000006bfc13061c5bbe7a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div>I pulled the latest and I see the ap=
ache2 version is updated to 2.4.60. But the <a href=3D"https://autobuilder.=
yocto.io/pub/non-release/patchmetrics-meta-oe/cve-status-master.txt" target=
=3D"_blank">CVE list</a> still has the following CVEs listed: CVE-2007-0450=
, CVE-2010-0425<br></div><div>I&#39;ll send a new patch against the latest =
master branch to update status of the CVEs.<br></div><div>Thanks!<br></div>=
<div>Ninette<br> </div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr=
" class=3D"gmail_attr">On Wed, Jul 3, 2024 at 10:53=E2=80=AFAM Khem Raj &lt=
;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com=
</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=
<div dir=3D"auto">Please rebase it on latest master and see if it=E2=80=99s=
 still needed=C2=A0</div><div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Wed, Jul 3, 2024 at 10:44=E2=80=AFAM Ninette Adh=
ikari &lt;<a href=3D"mailto:ninette@neighbourhood.ie" target=3D"_blank">nin=
ette@neighbourhood.ie</a>&gt; wrote:<br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr"><div>Hi Khem,</div><=
div>This is meant for the &#39;master&#39; branch. It is a status update fo=
r some CVEs.</div><div>I&#39;ll make sure to include the branch name in the=
 subject for future patches. For this patch, do I need to resend it with an=
 updated subject line? Please let me know. Thanks so much!</div></div></div=
><div dir=3D"ltr"><div dir=3D"ltr"><div><br></div><div>Ninette <br></div></=
div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On=
 Wed, Jul 3, 2024 at 9:49=E2=80=AFAM Khem Raj &lt;<a href=3D"mailto:raj.khe=
m@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt; wrote:<br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">which branch is it for ?<b=
r>
Please mark it accordingly in subject line see -<br>
<a href=3D"https://docs.yoctoproject.org/dev/contributor-guide/submit-chang=
es.html#submitting-changes-to-stable-release-branches" rel=3D"noreferrer" t=
arget=3D"_blank">https://docs.yoctoproject.org/dev/contributor-guide/submit=
-changes.html#submitting-changes-to-stable-release-branches</a><br>
<br>
On Wed, Jul 3, 2024 at 9:40=E2=80=AFAM Ninette Adhikari via<br>
<a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D"_bla=
nk">lists.openembedded.org</a><br>
&lt;ninette=3D<a href=3D"mailto:thehoodiefirm.com@lists.openembedded.org" t=
arget=3D"_blank">thehoodiefirm.com@lists.openembedded.org</a>&gt; wrote:<br=
>
&gt;<br>
&gt; Update status for: CVE-2007-0450, CVE-2010-0425<br>
&gt;<br>
&gt; The current version (2.4.59) is not affected. It only applies for Wind=
ows.<br>
&gt;<br>
&gt; Ninette Adhikari (1):<br>
&gt;=C2=A0 =C2=A0apache2:apache2-native: CVE status update<br>
&gt;<br>
&gt;=C2=A0 meta-webserver/recipes-httpd/apache2/<a href=3D"http://apache2_2=
.4.59.bb" rel=3D"noreferrer" target=3D"_blank">apache2_2.4.59.bb</a> | 2 ++=
<br>
&gt;=C2=A0 1 file changed, 2 insertions(+)<br>
&gt;<br>
&gt; --<br>
&gt; 2.44.0<br>
&gt;<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#111229): <a href=3D"https://lists.openembedded.org=
/g/openembedded-devel/message/111229" rel=3D"noreferrer" target=3D"_blank">=
https://lists.openembedded.org/g/openembedded-devel/message/111229</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/10702282=
5/1997914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.=
org/mt/107022825/1997914</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openem=
bedded.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.o=
rg</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
devel/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedde=
d.org/g/openembedded-devel/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com"=
 target=3D"_blank">raj.khem@gmail.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
</blockquote></div>
</div>
</blockquote></div></div>
</blockquote></div><br></div>

--0000000000006bfc13061c5bbe7a--

