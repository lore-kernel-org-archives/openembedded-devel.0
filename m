Return-Path: <sjolley.yp.pm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6508BEBFD29
	for <webhook@archiver.kernel.org>; Tue, 14 Apr 2026 04:26:00 +0000 (UTC)
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11534.1776140756169763573
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Apr 2026 21:25:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=P9d74MLH;
 spf=pass (domain: gmail.com, ip: 74.125.82.182, mailfrom: sjolley.yp.pm@gmail.com)
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-2d8fa0fadfeso891722eec.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 13 Apr 2026 21:25:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776140755; cv=none;
        d=google.com; s=arc-20240605;
        b=G869HJOH5s042QF0Z8QlBHhWCf7NwCI1ejysEcRV/kq8QQVzIHR9qsgk0HynUVIJ4p
         ZWfVmfNW4g577+yVG6GEbVUVqDbG+JmcqQRa16JErBgU7j53E0ZXCq+rbMnAR1CmTp4B
         LPVNYnBQFwCuNesuGejYsaXAGQgGkMqgMyIO5eRqto3igKUcE175WhdCC+UkXWUR8QH1
         IVCQozfVxbE9Qk6UJfqL4Xoq5Pp8rzOjCyWl/J7id/8WShDnDZpA4eYWgjM7JpTWQzsI
         e89kU/vgwXfZ7W5TYFMTFR5mj1j0pzKlXg9VZWx7VYOFL39SCWmF31GSNCUle72KbnWO
         IPdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=c9gpA5RWLQkNZeyr5o0rCse02cAXBNK5g1yt218wLkI=;
        fh=BwBMBeEhAt1p6hM5GusaqqLaQ1OVjTC3OuGEHAhdtOU=;
        b=OjYyPnBtNRySjgseogLv651kOus2GwadAUcvcM7J+LKF3CW+7cA5Nbejk1hSmq+5qI
         sqNjVkyzEATn6mdJX5n4U5eTIg09+UqAsxe6g3dqV+dPEzWTka7xQXjPpp0ajkoCR/Yl
         3frGVCx0pg8Ym4QqgcWfC7FFokmJtV4YyRj4AN+9onEbhkSBPn5XIghKs2Dn+LOT3Fht
         6Y8W/1HQTCnA/QjTjhQJcJVu8I9Mlhp3vD//iRZLkl1HJE7C7Ix6BJZuS0KDhvbtf0Dm
         tpOFFkcD45hP5uQv9PdbsbeB5tZ9YIKRg0YF8lzgTmzL7HVSgk57bsy0Mb0yLMctTmG5
         4UKw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776140755; x=1776745555; darn=lists.openembedded.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=c9gpA5RWLQkNZeyr5o0rCse02cAXBNK5g1yt218wLkI=;
        b=P9d74MLHQB+E1j0NMBm5X7Y67iyh74LNH05+OmmNhPqvC6gvfbsADW87CwXxAmVye9
         eu0yhOuWvJ5/NUqaneK4EGepciXpbAKFQboB+uBAomatukjcEnuOiQllLwElfbis0uo2
         IPlVq8Kwi6oQJ0uSaSVpHAedJz6QWsEVdTxR9TtFd0oA5+yB2xpfZpPUjMtrYAU2enuw
         /vGJlU0VUB9jyin5ClPmIZvVIlVsSAGrmxX6qI8CLYeJE1PrOSpDeZ24Tpzi4j9R8vqV
         GtPQM6wZ7MbCRQf+1CGti++/R+7OTd6QHmwlFn/gwVh/T8Yv5SZO4aho7FHYEWPKOuvQ
         TUNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776140755; x=1776745555;
        h=to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=c9gpA5RWLQkNZeyr5o0rCse02cAXBNK5g1yt218wLkI=;
        b=AsmHv84lZfqLp/7PwvppYgEcCjQeNzIBudAJ5G64B40NO53Qavava8LmPnmhliiATe
         e92sSVxG3I+mSEsh/3IkJntiSKpsvEz4Kh1ZHrVmUpSCrXGEUV7VlA31/nwO/6x/fLnJ
         yka9b5jcywUpT2cK2FfeQXlWTREIc16i9b530vYMKBzv9p+TFCFR9n3tFg/wPGDYRux4
         31Nqu7pNxePa4NJcOg2vMSpYS8VZdHoLBAHXqTCpHfDvzsjJpFnppgY+5lf9+xGZmasw
         dxeluvPDgSHfKlBUy7mOBfI2YD0gS0TAr9IvbTz7MKEzxT5a6xkKKx4gogJU4O2vWKx/
         umsA==
X-Gm-Message-State: AOJu0Yzl5PwSLHBALjlYeIkcpGu1U20sC3/DdpY9+jLfEnaIn3dDsXtX
	6VWRAIX10ZSwqxTwUMJ688z/+a3JFj1x42UCl8n7t0+h1d/gD9D9Zrl2zJ0CXkYS2P8GGczL8ky
	1y+p1AJNir3+3ZC0JHbP6EjWVx+2mvRW5fKug
X-Gm-Gg: AeBDiesD3RsRpC/tAvulk4b0O+ZGPX9Dv/2sEW8TpCM2UOAFsmm2kQu9NJRLWd80f9y
	uL/51fVVWFJGhlFghUhZhlpQdHxdKyu8Qi3LPRsjOvel7R5Y713qvPYLAKnagdsYeB05WY0ziV4
	QvmvvpBRKahkjf6hlsgGDGckeFoS4p1XYQ9WDdU66HPaVj2EdqbsmMM+Qn3IgZ9I6kIBDg8ADvq
	uTRnre8hQ4L7UmMN8WSzjlYeiaqRI822VteDQrvWI21Wzri+InSuC0+Fk1LL1PjxstBg/d6KG0q
	5FCQP/UvyOcE0lOhBE0ppznLNFqpPDXNqPtQe21CYE9AnpzPCrwO5gxN14MWT+umY8oULyM4a8a
	u8EaFhHd2ihY2MI6Yk3QYet793NOdho2FU9rQmg==
X-Received: by 2002:a05:7300:fb89:b0:2c1:7480:ff9b with SMTP id
 5a478bee46e88-2d4106c7c60mr9086306eec.18.1776140754747; Mon, 13 Apr 2026
 21:25:54 -0700 (PDT)
MIME-Version: 1.0
From: Stephen K Jolley <sjolley.yp.pm@gmail.com>
Date: Mon, 13 Apr 2026 21:25:42 -0700
X-Gm-Features: AQROBzDfJBCfO2gDGe6nWDI8T1IkkWGd2nVYHUKlavrGf3sfpA1ci4zIuHsLX90
Message-ID: <CAK5yBb9Mjth2ahOx4K-VTpTCM=c=zwz03D-swWz6Z=uhByP58w@mail.gmail.com>
Subject: Yocto Project Newcomer & Unassigned Bugs - Help Needed
To: openembedded-devel@lists.openembedded.org, 
	Yocto-mailing-list <yocto@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="000000000000c203f8064f63fe46"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Apr 2026 04:26:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126294

--000000000000c203f8064f63fe46
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

All,

The triage team is starting to try and collect up and classify bugs which a
newcomer to the project would be able to work on in a way which means
people can find them. They're being listed on the triage page under the
appropriate heading:
https://wiki.yoctoproject.org/wiki/Bug_Triage#Newcomer_Bugs Also please
review:
https://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbedded and
how to create a bugzilla account at:
https://bugzilla.yoctoproject.org/createaccount.cgi

The idea is these bugs should be straight forward for a person to help work
on who doesn't have deep experience with the project. If anyone can help,
please take ownership of the bug and send patches! If anyone needs
help/advice there are people on irc who can likely do so, or some of the
more experienced contributors will likely be happy to help too.

Also, the triage team meets weekly and does its best to handle the bugs
reported into the Bugzilla. The number of people attending that meeting has
fallen, as have the number of people available to help fix bugs. One of the
things we hear users report is they don't know how to help. We (the triage
team) are therefore going to start reporting out the currently 439
unassigned or newcomer bugs.

We're hoping people may be able to spare some time now and again to help
out with these. Bugs are split into two types, "true bugs" where things
don't work as they should and "enhancements" which are features we'd want
to add to the system. There are also roughly four different "priority"
classes right now, =E2=80=9C5.3=E2=80=9D, =E2=80=9C6.0", "5.99" and "Future=
", the more
pressing/urgent issues being in "5.3" and then =E2=80=9C6.0=E2=80=9D.

Please review this link and if a bug is something you would be able to help
with either take ownership of the bug, or send me (sjolley.yp.pm@gmail.com)
an e-mail with the bug number you would like and I will assign it to you
(please make sure you have a Bugzilla account). The list is at:
https://wiki.yoctoproject.org/wiki/Bug_Triage_Archive#Unassigned_or_Newcome=
r_Bugs

Thanks,



*Stephen K. Jolley*

*Yocto Project Program Manager*

(    *Cell*:                (208) 244-4460

* *Email*:                 *s
<stephen.k.jolley@intel.com>jolley.yp.pm@gmail.com <jolley.yp.pm@gmail.com>=
*

--000000000000c203f8064f63fe46
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><span style=3D"font-size:11pt;font-family:Calibri,Ari=
al">All,<br><br>The triage team is starting to try and collect up and class=
ify bugs which a newcomer to the project would be able to work on in a way =
which means people can find them. They&#39;re being listed on the triage pa=
ge under the appropriate heading: <a href=3D"https://wiki.yoctoproject.org/=
wiki/Bug_Triage#Newcomer_Bugs">https://wiki.yoctoproject.org/wiki/Bug_Triag=
e#Newcomer_Bugs</a>  Also please review: <a href=3D"https://www.openembedde=
d.org/wiki/How_to_submit_a_patch_to_OpenEmbedded">https://www.openembedded.=
org/wiki/How_to_submit_a_patch_to_OpenEmbedded</a> and how to create a bugz=
illa account at: <a href=3D"https://bugzilla.yoctoproject.org/createaccount=
.cgi">https://bugzilla.yoctoproject.org/createaccount.cgi</a><br><br>The id=
ea is these bugs should be straight forward for a person to help work on wh=
o doesn&#39;t have deep experience with the project.  If anyone can help, p=
lease take ownership of the bug and send patches!  If anyone needs help/adv=
ice there are people on irc who can likely do so, or some of the more exper=
ienced contributors will likely be happy to help too.<br><br>Also, the tria=
ge team meets weekly and does its best to handle the bugs reported into the=
 Bugzilla. The number of people attending that meeting has fallen, as have =
the number of people available to help fix bugs. One of the things we hear =
users report is they don&#39;t know how to help. We (the triage team) are t=
herefore going to start reporting out the currently 439 unassigned or newco=
mer bugs.<br><br>We&#39;re hoping people may be able to spare some time now=
 and again to help out with these.  Bugs are split into two types, &quot;tr=
ue bugs&quot; where things don&#39;t work as they should and &quot;enhancem=
ents&quot; which are features we&#39;d want to add to the system.  There ar=
e also roughly four different &quot;priority&quot; classes right now, =E2=
=80=9C5.3=E2=80=9D, =E2=80=9C6.0&quot;, &quot;5.99&quot; and &quot;Future&q=
uot;, the more pressing/urgent issues being in &quot;5.3&quot; and then =E2=
=80=9C6.0=E2=80=9D.<br><br>Please review this link and if a bug is somethin=
g you would be able to help with either take ownership of the bug, or send =
me (<a href=3D"mailto:sjolley.yp.pm@gmail.com">sjolley.yp.pm@gmail.com</a>)=
 an e-mail with the bug number you would like and I will assign it to you (=
please make sure you have a Bugzilla account).  The list is at: <a href=3D"=
https://wiki.yoctoproject.org/wiki/Bug_Triage_Archive#Unassigned_or_Newcome=
r_Bugs">https://wiki.yoctoproject.org/wiki/Bug_Triage_Archive#Unassigned_or=
_Newcomer_Bugs</a></span></div><div dir=3D"ltr" class=3D"gmail_signature" d=
ata-smartmail=3D"gmail_signature"><div dir=3D"ltr"><div dir=3D"ltr"><p clas=
s=3D"MsoNormal" style=3D"background-image:initial;background-position:initi=
al;background-repeat:initial"><span style=3D"font-size:12pt;font-family:Ari=
al,sans-serif">Thanks,<span></span></span></p>

<p class=3D"MsoNormal" style=3D"background-image:initial;background-positio=
n:initial;background-repeat:initial"><span style=3D"font-size:12pt;font-fam=
ily:Arial,sans-serif">=C2=A0<span></span></span></p>

<p class=3D"MsoNormal" style=3D"background-image:initial;background-positio=
n:initial;background-repeat:initial"><b><i><span style=3D"font-size:16pt;co=
lor:purple">Stephen K. Jolley</span></i></b><span style=3D"font-size:12pt;f=
ont-family:Arial,sans-serif"><span></span></span></p>

<p class=3D"MsoNormal" style=3D"background-image:initial;background-positio=
n:initial;background-repeat:initial"><b><span style=3D"font-size:8pt;font-f=
amily:&quot;Courier New&quot;;color:blue">Yocto Project Program Manager</sp=
an></b></p>

<p class=3D"MsoNormal" style=3D"background-image:initial;background-positio=
n:initial;background-repeat:initial"><span style=3D"font-size:9pt;font-fami=
ly:Wingdings;color:black">(</span><span style=3D"font-size:9pt;font-family:=
&quot;MS Sans Serif&quot;,serif;color:teal">=C2=A0=C2=A0=C2=A0=C2=A0</span>=
<b><span style=3D"font-size:8pt;font-family:&quot;Comic Sans MS&quot;;color=
:teal">Cell</span></b><span style=3D"font-size:9pt;font-family:&quot;MS San=
s Serif&quot;,serif;color:teal">:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 </span><span style=3D"font=
-size:9pt;font-family:&quot;MS Sans Serif&quot;,serif">(208) 244-4460</span=
><span style=3D"font-size:12pt;font-family:Arial,sans-serif"><span></span><=
/span></p>

<p class=3D"MsoNormal" style=3D"background-image:initial;background-positio=
n:initial;background-repeat:initial"><span style=3D"font-size:9pt;font-fami=
ly:Wingdings">*=C2=A0</span><b><span lang=3D"FR" style=3D"font-size:8pt;fon=
t-family:&quot;Comic Sans MS&quot;;color:teal">Email</span></b><span lang=
=3D"FR" style=3D"font-size:9pt;font-family:&quot;MS Sans Serif&quot;,serif;=
color:teal">:</span><span lang=3D"FR" style=3D"font-size:9pt;font-family:&q=
uot;MS Sans Serif&quot;,serif">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0</span><u><span=
 lang=3D"FR" style=3D"font-size:9pt;font-family:&quot;MS Sans Serif&quot;,s=
erif;color:blue"><span style=3D"color:rgb(17,85,204)"><a href=3D"mailto:ste=
phen.k.jolley@intel.com" target=3D"_blank">s</a><a href=3D"mailto:jolley.yp=
.pm@gmail.com" target=3D"_blank">jolley.yp.pm@gmail.com</a></span></span></=
u></p></div></div></div></div>

--000000000000c203f8064f63fe46--

