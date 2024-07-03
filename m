Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C052CC2BD09
	for <webhook@archiver.kernel.org>; Wed,  3 Jul 2024 17:53:27 +0000 (UTC)
Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
 by mx.groups.io with SMTP id smtpd.web11.57567.1720029198149944720
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Jul 2024 10:53:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DSEi03py;
 spf=pass (domain: gmail.com, ip: 209.85.161.42, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-5b97a9a9b4bso2251820eaf.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 03 Jul 2024 10:53:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720029197; x=1720633997; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=01RFGCSXrA2r2JFmFIfWyYR6ildje4SA1dMqKq/kM3A=;
        b=DSEi03py8Yvt9Km1XGTULwE1IAFKzc1Zo6JBP+yA4gAILfrVcQIUjidRd38Io0zLyK
         /M+RN771+5jPfXa0H9ak9K0sRTIQP9OYqv72iSS0aJmKP6AnSqX3ZIXq3lX1YgGPiQio
         5FyP0uVwUVTpdwtIbpdQ/8y7g/27VXgBKttHLvHYxeGVBMRNXAcnmKWEBtg5nCGyCedi
         eWVdVZyoguDZmIThjOhU/sQoshLYlrvA+FxGYkJbe7ZhFtLIfneY+oIg+pBBGJJkIuuG
         i3OcFO0oX+WWRoZv7PNvdtE1GsmhsZjfafrO5kU6uXf8U4A2j3+OVHoVwO/OAZ/FRRob
         84TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720029197; x=1720633997;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=01RFGCSXrA2r2JFmFIfWyYR6ildje4SA1dMqKq/kM3A=;
        b=uTy+sSksKVEygFvHLmjfp3C9tqSwfGGeI8QfDaaN99/cRKrnFv80R9McKoWVsIM/ff
         +nhtsAxaOOAoKZEM8jlkILDdadnPZ7CrWCI5oh00uEMKDO9Hpb3euLstKLODjwWpO9qj
         XOgYG5BZm4aFoL86Ct4N0NsrncAfL58rni5vqyh313O5GaCPnt0tu01yyZJoHQfvru8c
         3MmmuiOh3j8YHeb6JmWqeR7z2WiqXXlPMx/bMzFjBJrnExh7aF7hptVUHt0DXo+lRFRy
         gCJSNXkMPKztFpG6k3LzU0BFFVzOv1w7yAzqaxD1NEin24n1KVZnPJuIMmmOEQkIVx5V
         /0UQ==
X-Forwarded-Encrypted: i=1; AJvYcCXYjQ1L/0MbGBabLCMJR1Iw4jPv6hahjACNHhynrktOMgukT1i1zhsljvY4hoJ3dP4Vmi6ezzh1dRU+R1qk/9zBNrBJW5ZscZ3DMsiTNpqS3iXYfPncWD+Nxw==
X-Gm-Message-State: AOJu0Yyz1UlgOkJe9aSm/djP9tAuIY0B+/6I/GnIgbMy5UQs920MfeQT
	3ifMIvneA9q9CWEeOoCLIwZe/V2TrjIj9cu1E4w/kzhbVcUPuPFJfMFPuU8fN2NBp1fheVPGUy1
	28mP2XceR370A+m3vr6yc6ig4zkNVnw==
X-Google-Smtp-Source: AGHT+IE1SOT3M/wtOU/yGURmocRkrj4+KFKTAwiQWmyRkNddI6/82Myd66nkX8cb4M23r2CdDZpf4RYddZSkw+HsJpI=
X-Received: by 2002:a05:6871:58a8:b0:254:a613:1907 with SMTP id
 586e51a60fabf-25db362e353mr10360486fac.56.1720029197163; Wed, 03 Jul 2024
 10:53:17 -0700 (PDT)
MIME-Version: 1.0
References: <20240703164042.20929-1-ninette@thehoodiefirm.com>
 <CAMKF1soc6CDz51w76z+jbK4Py-xRpjZJi48mksyJw1Y65teSAw@mail.gmail.com> <CAG1aeW1Q5QoWcNRUZGYLPpO0L7Q0jFErxEV260iQffPV=mfEPg@mail.gmail.com>
In-Reply-To: <CAG1aeW1Q5QoWcNRUZGYLPpO0L7Q0jFErxEV260iQffPV=mfEPg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 3 Jul 2024 10:53:06 -0700
Message-ID: <CAMKF1so9L9Y00Z_CgrdBhd_9QtgMX-nSCR4hsbUTax=eF1NDgg@mail.gmail.com>
Subject: Re: [oe] [PATCH 0/1] apache2:apache2-native: CVE status update
To: Ninette Adhikari <ninette@neighbourhood.ie>
Cc: engineering@neighbourhood.ie, openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000004ce4a8061c5b8104"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 03 Jul 2024 17:53:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111239

--0000000000004ce4a8061c5b8104
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Please rebase it on latest master and see if it=E2=80=99s still needed

On Wed, Jul 3, 2024 at 10:44=E2=80=AFAM Ninette Adhikari <ninette@neighbour=
hood.ie>
wrote:

> Hi Khem,
> This is meant for the 'master' branch. It is a status update for some CVE=
s.
> I'll make sure to include the branch name in the subject for future
> patches. For this patch, do I need to resend it with an updated subject
> line? Please let me know. Thanks so much!
>
> Ninette
>
> On Wed, Jul 3, 2024 at 9:49=E2=80=AFAM Khem Raj <raj.khem@gmail.com> wrot=
e:
>
>> which branch is it for ?
>> Please mark it accordingly in subject line see -
>>
>> https://docs.yoctoproject.org/dev/contributor-guide/submit-changes.html#=
submitting-changes-to-stable-release-branches
>>
>> On Wed, Jul 3, 2024 at 9:40=E2=80=AFAM Ninette Adhikari via
>> lists.openembedded.org
>> <ninette=3Dthehoodiefirm.com@lists.openembedded.org> wrote:
>> >
>> > Update status for: CVE-2007-0450, CVE-2010-0425
>> >
>> > The current version (2.4.59) is not affected. It only applies for
>> Windows.
>> >
>> > Ninette Adhikari (1):
>> >   apache2:apache2-native: CVE status update
>> >
>> >  meta-webserver/recipes-httpd/apache2/apache2_2.4.59.bb | 2 ++
>> >  1 file changed, 2 insertions(+)
>> >
>> > --
>> > 2.44.0
>> >
>> >
>> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> > Links: You receive all messages sent to this group.
>> > View/Reply Online (#111229):
>> https://lists.openembedded.org/g/openembedded-devel/message/111229
>> > Mute This Topic: https://lists.openembedded.org/mt/107022825/1997914
>> > Group Owner: openembedded-devel+owner@lists.openembedded.org
>> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub
>> [raj.khem@gmail.com]
>> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> >
>>
>

--0000000000004ce4a8061c5b8104
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Please rebase it on latest master and see if it=E2=80=99s=
 still needed=C2=A0</div><div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Wed, Jul 3, 2024 at 10:44=E2=80=AFAM Ninette Adh=
ikari &lt;<a href=3D"mailto:ninette@neighbourhood.ie">ninette@neighbourhood=
.ie</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr"=
><div dir=3D"ltr"><div>Hi Khem,</div><div>This is meant for the &#39;master=
&#39; branch. It is a status update for some CVEs.</div><div>I&#39;ll make =
sure to include the branch name in the subject for future patches. For this=
 patch, do I need to resend it with an updated subject line? Please let me =
know. Thanks so much!</div></div></div><div dir=3D"ltr"><div dir=3D"ltr"><d=
iv><br></div><div>Ninette <br></div></div><br><div class=3D"gmail_quote"><d=
iv dir=3D"ltr" class=3D"gmail_attr">On Wed, Jul 3, 2024 at 9:49=E2=80=AFAM =
Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.kh=
em@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">which branch is it for ?<br>
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

--0000000000004ce4a8061c5b8104--

