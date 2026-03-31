Return-Path: <sjolley.yp.pm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A99F5109B477
	for <webhook@archiver.kernel.org>; Tue, 31 Mar 2026 14:29:42 +0000 (UTC)
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.21776.1774967377794607560
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 31 Mar 2026 07:29:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=SvQievU8;
 spf=pass (domain: gmail.com, ip: 74.125.82.182, mailfrom: sjolley.yp.pm@gmail.com)
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-2c4db6bca03so1394882eec.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 31 Mar 2026 07:29:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774967377; cv=none;
        d=google.com; s=arc-20240605;
        b=AYEZzUQTJlyM4Mq30oMZsYWCC4P4287p8I/dZMqL1FhAsEbbnBg/gjxUucrnO9lbK9
         adNqVbdAdPJ84JFW8BqOH8qCVCGAVIfsCtsmXxWydlYTHjznHgw0u+8Jcn4m3JSkTegr
         PJ8Y5fFw0ll1DwtFuhZhYZwj4oW308Vb5gGxoQK+8K/iW1hfmHYs7Wqle0MkUE7ttxLo
         akX6HGjxzjLCLDRkYpKbvhRbVHsD/DB1BtMqSOWyfgNcM5k6U0nJF9zNeHqanaNL9GYx
         roMtB0mnQSJxiSIlvFXUuK4TfW3rrl2Ylzj5VKavN0S3WC3VdFhm+p+JZVRMnqt0mAu9
         /ezg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=awpbEO/T/vFuYSoWNp0bRlP3kP/AYYnnHKaOHuI1Lxk=;
        fh=BwBMBeEhAt1p6hM5GusaqqLaQ1OVjTC3OuGEHAhdtOU=;
        b=dRm8WtBgtM4LNrNh/aBu8mOT+tLp4sDwEPEYxSZeV6EENw0emxpSs4oyBTOrkh1S8W
         5qPw6Z/N1y1fmP2/gEGRdSC+HVKegKdom93l8MaQUpteivX0tOQvR7GO5zCsDSwnnFgs
         OiOwP85veApCEOeF+THq5S/TRdwwEwY84jFe+Y/JfDFG4kr/lMHGYE6EX8KfQQo6GzJ4
         EslfOzpOZ6X11/gOADZxb39pJES72IQF+NzH161YQggmdrTiKiTsHLjy2EcyKdPxzKuD
         0kaEonR8le4XkR//gB9IMKNwSCt0Xg5tSH2r5DggbGScFacrVsU5leZI/OC9z0f99nJm
         11XQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774967377; x=1775572177; darn=lists.openembedded.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=awpbEO/T/vFuYSoWNp0bRlP3kP/AYYnnHKaOHuI1Lxk=;
        b=SvQievU8XCLKewfUCa3E8m4/xAH7mAwWln9Ft7qwsxbuKt0HrkERpwRD89wZCMKB+4
         OfcefzevAduAu8OqICQu9fBW2PJgZfKttGnWQ8Equ4rbvSGf8NpTGS/HIQ+VPRGBCjhY
         Ni6+m4skRP+xf6NlcU9Irq63XTfgpn93lrkcxzPCsZ0qSNGBsoErEHQLhW/X1PkFFDZm
         jnq6wxrei9aj9kafVEFe3K9JZWDJgTHV/O4e69hWIuPrz+kTRY2pS/n+V/5hpREnVAZ3
         iiljEytZW36Fn5fyycBjyqi4gxRnlwO6AfGp0dHwpmkSDlZ4/nbW8Z/vbI4x7ajdg4d0
         AKdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774967377; x=1775572177;
        h=to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=awpbEO/T/vFuYSoWNp0bRlP3kP/AYYnnHKaOHuI1Lxk=;
        b=oZ6jow9qEKNp5TArzPm0X0vffWpz7CoMBIzYiApaaJc2b+ohhuhlzC3ZLtF3C3Wi/v
         2IaBUqCVJm5YTmn3ZGYpxoPkHr3QSRDwzHwWc3TcifDsAwyazWo80UuyDelgEM7BvSwK
         7y2meFVd6GvHitnA0dyuWPpEUP1skwOzZm9/fQRYIz5/SbMjTri/ccCoiXwU5lLTZfB+
         rev3iih1c3xuoSil1v48vfW8BCPSbALgcPKi09YDKwJ5sM3jYLOiIdlJfVMu8fK46AcT
         QTh/8QCCvbVfFzZ4lci+yJD0VmIJEPpyi2Uo+rNCdWe6ZfDDE8sUet9rP7dF+7NReNZu
         Kwqg==
X-Gm-Message-State: AOJu0YzeDuJ7WmodFVAzb2n7NYwQeGMb1YADtTsZ4SpaSTXkpvOJoMt7
	Gy/YtbEWkwl+9bbn1TPIEYH7MhVZzqutQQLhK5uL5M4bNWmdtt6ph4/71OmlthOI96eQHEOE0Ve
	Ff7uubEj/61D53S9tHe8CCZ7PhZv1RLu6mrPb
X-Gm-Gg: ATEYQzygDjQBFfI7IRI2rlvzsZN4mj6veMajrkkAJIn4YJh/WlbALLZeXD/QEwqHBCD
	UgJbDEY3LuzPMfl+xj94u7he4uCndcPiQMf2phQBrY/zFNqh2dyRQh0OF7V6qHTFUZKy9Vw/hXu
	u8sYvKk9FSh3Enm+IIQHfdModleNigVXhp8I+vp0+66R4/YultDUz1PlFGOlt/4FCnx63FpPUxj
	nIFftX0qKgDYF9F1R073iyIhqXJz5TRxql8pNq0/Jgk2ELHt9OmmirCMxRN2f+xCYDPdLwkNFou
	Mz2dOHeXBQusIMcpULTqBb8FOraJ/0OsuaQ9unMCkMImLX3TszTblLuHmfBgFg53RYfB3MgTnr9
	LJH+SE+7VHK+Hbn4B/pVHDpGHsb/7lrcZsvVv
X-Received: by 2002:a05:7300:8185:b0:2be:6693:9b4d with SMTP id
 5a478bee46e88-2c7bba67f5emr1968962eec.9.1774967376681; Tue, 31 Mar 2026
 07:29:36 -0700 (PDT)
MIME-Version: 1.0
From: Stephen K Jolley <sjolley.yp.pm@gmail.com>
Date: Tue, 31 Mar 2026 07:29:22 -0700
X-Gm-Features: AQROBzDJGeQREOMrJrFtoL4xfqoZ0PJjmrst0kR51hz41nJfY25Va4jPaFCrnGY
Message-ID: <CAK5yBb9NRHpyoBuu0d-6E-AxGSL7g=OPJuPkPJE=eqN1NAJNKQ@mail.gmail.com>
Subject: Yocto Project Newcomer & Unassigned Bugs - Help Needed
To: openembedded-devel@lists.openembedded.org, 
	Yocto-mailing-list <yocto@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="000000000000f9a023064e52cbe6"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 31 Mar 2026 14:29:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125892

--000000000000f9a023064e52cbe6
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
team) are therefore going to start reporting out the currently 437
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

--000000000000f9a023064e52cbe6
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
herefore going to start reporting out the currently 437 unassigned or newco=
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

--000000000000f9a023064e52cbe6--

