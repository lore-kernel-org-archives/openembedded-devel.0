Return-Path: <sjolley.yp.pm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5EA5F8FA88
	for <webhook@archiver.kernel.org>; Tue, 21 Apr 2026 14:31:55 +0000 (UTC)
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.32285.1776781911007246794
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 21 Apr 2026 07:31:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=fk37FADV;
 spf=pass (domain: gmail.com, ip: 74.125.82.41, mailfrom: sjolley.yp.pm@gmail.com)
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-12c6df0b9bbso479584c88.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 21 Apr 2026 07:31:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776781910; cv=none;
        d=google.com; s=arc-20240605;
        b=MKlLyYB2WehCEPs37O+basGiIEBQZz8rkUktbXVsW4y4EaZkxRVxWNBtMIOD65n7Vf
         wXEzOCJSu/bLFNgl4jZNz6tBbb8LmEoWyEU1/zhTSoKex+IjKx/5nBLQyDzbODdQXmJy
         5grdtNQd4LBRoCLMl5Vc//Lhz5fr0HhAe82/3HrzuYY6gqlh9TfSvb/kj+GK9o0zSyVH
         1DIPykIsgn7rw/gJXTi8nz4HeEWkWLDdmD/KYpbijgvzkxuwPem0zTqpsei08kq4cS2k
         JlM7UDs6dB3VVWSVSDdV2Mm+tHEZ6HI9li1CBzN0ZdpVH8e/U1JG+6wGSJXuIj6AmZOY
         naUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=YWQBQ0/Gyo3+K7dAPlvMP3OHBsszAxAcOSpdr0VumAY=;
        fh=BwBMBeEhAt1p6hM5GusaqqLaQ1OVjTC3OuGEHAhdtOU=;
        b=ATMSvOLSn1KoAYqXV19gA1Tra7jogbzV9upGyslpbtxIu26NIy2MY2bdX7KMFQRr7u
         nhueiHWoSaSowtxZqmBwGPLsAcRAQn7qz1MtG/weYeyxZyWS/JtgiJkxqIQbE5gj+reg
         OA7+Q/NPWigmOBksGegBZJ3lEREVY3yGeodIezxuxGFNr8mofbRf+FjLD+4yjgl0iGwy
         3SsHQnmOI7qfiQE7eTgMTqVQZeCrt/kaJTsHUiA1oTbdqTtXXb7TpzEBgmG6gN8IGwzn
         j6AcfLqMhbhsCDcW8iwues/XH/7ThswT75c2+9K/l4k4k48++0kcgX8cU6c1kZwFMQCc
         jiXw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776781910; x=1777386710; darn=lists.openembedded.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=YWQBQ0/Gyo3+K7dAPlvMP3OHBsszAxAcOSpdr0VumAY=;
        b=fk37FADVvHHpXhYXGE4Mf20/H7VkV1aGhFt85mZrzFNsDTSk2jvEZKP4CPZKaqk6O8
         ibyADOeqt3pmFHhIK69RX0EBqW6GSY2Ak5Cs1Q8F1jD3+XfQhuPgDYVkHLhYTmHrPZbS
         ghZyVXtmIN2zQtg3/IeJiRSMGM7jlaeUl3A1yKQ7MqaOI6BIUI+tMhR4Tzhrw7hQ6Wmt
         HssoFP3rlNu+NUAC4Ke29InaE9OyBCPCwbXqNIp4UHijNGcafYz9qKOvYYPO95tWolrN
         LMHK4AKlDUJJLypJIFMnrReI5vsCeZWK4QCxZyJz7SDgXxfSBaVhDtzq0o4cpKaoiNk9
         iDUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776781910; x=1777386710;
        h=to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YWQBQ0/Gyo3+K7dAPlvMP3OHBsszAxAcOSpdr0VumAY=;
        b=R8RNjFt3ov7G2rTmHIXgk+4V6AtNubacAxAeZhuMq/6PypaivxvmQhOpYJeIkaFzV0
         RmrsO77yEEkwe9JyF5IR7o0ARX5X/j8zjqqH5kyNw3e9UTpdf89iO5uZx2T3zgOO3WOC
         X3RU38/Ujub/uxTDIdCXXjWWuxlofv0CvqkstkZ+Vh6zeE3jzDjp5Va5Jwt/kKIVftSk
         EwGzg3mk9rBJKZ1iNiBJ9ohivUN7fYy+Bkr7QzacoLJLwn5rrKGYGvyWEcR6MY9VIU1L
         G96Ua8dZ9LKRvKnJR6tkQMpLG2weR+fvLcv9ZQeo95tBDJ56HRUOq5YPwthDoB5mekp+
         CUDg==
X-Gm-Message-State: AOJu0YytXQ6NfvcLOAerulxN1Ve6JJFt1GdZatfsRK7yXxlPZJ37TW+V
	E5uHow4T6s57RLIpAHK7hly/JwUe5adFdBsFaAI9bwbMtJYUc310LwXGMZCRSa7ayngS5Y+/ZwS
	FpKDFZtU7kgZ6FBd5SRctzgtwaQwtGzwxq1qf
X-Gm-Gg: AeBDievjjR+oNJ31Fy6Iy5XJ+kuXvPjAwJPRLjfbkL6yauIBEtF9ioc9oXrlJRDGO4A
	5kSaJslfxThcnU65VvJISnzR74bko7kVoPIBys8gPjnbjAsq6YGUsu81YQ7seuSfTpymAQcnzls
	mNmGDHSAcIrfuAFQ9JcXX8WVt/U3Vs63kVZVhbGsFvQWP4FmJAi1U1g/D9LoGTC9E89laUItogz
	Qqfj/3/fuipzd21CPDilBXdF/UQzOE0YdHwwmePyu1V1kP2zlSEdvmmhlY4i8j38rEnxJoP0O6l
	AUqy24uPghoxAj30v+/CE+PQLcfWEm3DY/UX8tuBwki9Oz35ZgmbAuhe8b9g78zJlHp+S/C6sxi
	FkrAiYabbSNNktagTfrVigVk3Di6YbeDzbBZRYVC5PGHIA7LM6DevWq3N7nv/T52pd3IXSAX6NR
	ZA+JCEhUM2Gzb1mQ9C
X-Received: by 2002:a05:7022:458d:b0:128:d51a:5161 with SMTP id
 a92af1059eb24-12c73fa2244mr9270905c88.27.1776781909863; Tue, 21 Apr 2026
 07:31:49 -0700 (PDT)
MIME-Version: 1.0
From: Stephen K Jolley <sjolley.yp.pm@gmail.com>
Date: Tue, 21 Apr 2026 07:31:36 -0700
X-Gm-Features: AQROBzDNGl6I0-iOVvieZMi-g7QlbyBMM9aHxvf_UfAgGKYZqGYUS48rsvfy6XU
Message-ID: <CAK5yBb9hAtsScEKpVeUWcjTRqo3H8pCje72P_spgHuf2CU8iRw@mail.gmail.com>
Subject: Yocto Project Newcomer & Unassigned Bugs - Help Needed
To: openembedded-devel@lists.openembedded.org, 
	Yocto-mailing-list <yocto@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="00000000000094b351064ff9465f"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 21 Apr 2026 14:31:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126531

--00000000000094b351064ff9465f
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
team) are therefore going to start reporting out the currently 446
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

--00000000000094b351064ff9465f
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
herefore going to start reporting out the currently 446 unassigned or newco=
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

--00000000000094b351064ff9465f--

