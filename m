Return-Path: <sjolley.yp.pm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D834FFB5EBE
	for <webhook@archiver.kernel.org>; Tue, 17 Mar 2026 05:26:27 +0000 (UTC)
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.69802.1773725184759999525
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Mar 2026 22:26:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DHSvc8KU;
 spf=pass (domain: gmail.com, ip: 74.125.82.182, mailfrom: sjolley.yp.pm@gmail.com)
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-2c0bb213b16so2297456eec.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 16 Mar 2026 22:26:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773725184; cv=none;
        d=google.com; s=arc-20240605;
        b=dlbizkNRubarlTKVsTS5V4kAzYnCuZg7/vmbluGv+buwDQd76BVlVFQRErG/QDG8dE
         ksVdxM44BgdddE1FcoK+32SKNicTaveNgkRCnnQC/rUPmxG34A0USys0wdsurlSJ0LXS
         TU0c/xGi6ZCnVzo1HHrrRneOrhaTFJbR5YWR2hb8jlLChNu6+MVY5tgibyPs8TYZ3Sl3
         9DA4JwY3QixwLmaIyhbNtFdAXzjnxL2kcN5ooPlLDgrB1WPzMUjAkOksLyWj2v/pjpum
         exSI98Qq5sMel9L36GTr20ZhnVXolZqn194PShCQWrj1Ndk4EP1qy1DUX/STwxt47/Wp
         +lVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=QDJksY9myhq4ja4aUuOUCx6lXiH4BxGIJW3G5gT4QEA=;
        fh=BwBMBeEhAt1p6hM5GusaqqLaQ1OVjTC3OuGEHAhdtOU=;
        b=E2xfklk1DMwqYlBrAtZxXXV4bJR0saoHkidoj06Ak0TfSj27zIOIkmpgVe1xNYvyMu
         ameSw4aIx3tiRc618woLrR2pOu4SqEKpaIZFsXMDjPH4xlv9XjjnOEFGDrpNB/0jJsBj
         Pi/jwG8r6Hbz/BPumxMWCWM/I7nDhlUlthPwbllWvkhHw5u6E4BK2xSzzQDVV9nMaT9/
         thCmeL9oWENYt0P6ShBdIEWDwaLez7+ERP2FmRTh7KvuyjRspMvqHmNU2JRXRp+Vn9m8
         fyZqBcztfgIoaUAmIAZrJZ849REeuu5hJTUlkiIZG2l40vqUs2EHhWRQh3rI+fiPFi2f
         wrEg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773725184; x=1774329984; darn=lists.openembedded.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=QDJksY9myhq4ja4aUuOUCx6lXiH4BxGIJW3G5gT4QEA=;
        b=DHSvc8KUqIy5+U81mWgGunMkErHB867mBo2vVlLSdHcAhkWeRG0kEFX431ruwD/YtH
         ZP/CV0i+Dc7+Q2yAVPBMQc3n5psKg9uhw/G21LtjeCjq+j9DrgPziuLxXIk2ZspCQ2BT
         Iyuyv3ubecaRgSbPpoCIG6bpG5nqjWh2i4Mnywwd9a5GH/f9XzFwkCWc57EKSgxkb3av
         E7lOPMBEQNHy9PS0Z2F69zBa20r59tP/wlcpwOyu0LN2M9awKx6jYIGT1l9MATwUF5SH
         4aECVMHF0h08vFbqKsTC2478rlOfC5N7lYXUG3aCsDIPfVFrVTkJaOcurRoJ7hbLscso
         7elw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773725184; x=1774329984;
        h=to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QDJksY9myhq4ja4aUuOUCx6lXiH4BxGIJW3G5gT4QEA=;
        b=oJ+kQhm+vOU24JEf29Ac9FCwww/jsGV30JdgVcT6rW/3KJbpxua0VpBbvYjSQZUrPr
         JOybG1/newehCxmpMmZRb29txksdVpXJA/nKBOjkt2Abv83ixbwcgka2zFtton42x4Pm
         jxngMXw18H1jqY9lQ0h5grEeM/Wwzxhu26jli8MwhSIbE6ef2+FhFCLKd7tfTMPEJE7Q
         gXt0Vk8AQpWUh9d3h3DBba1LFkhuh3mugDpSQlq02wTe3CRfuzEPqOS+6ZxYdmsUXosf
         4GDLYFn02YH1RGiHs9bwp6V7OOyo5HKJcYzss/V/VVxJ1H+jmTnWL+XiKC3Vhw7KQDiI
         TMCg==
X-Gm-Message-State: AOJu0Yy+oWDCbeVlF9ny1ZvrPcJqd6z/IvwqxJiG6aUAHfxK/ClLUz1z
	6uzUkPcVylaWXJ03xW9PTBHMv5eYVPPhmOfn3CWFKds/1qHo8WuNXS4mM4ZJ+EvP79jkULrhfQW
	BVsACHcH4MI52etTDK0jv79yTBIXitMwLQVn/
X-Gm-Gg: ATEYQzwPYqQ8+d97+p0Kodx0Iz9tPyNJtN+K57XWYmlVlHa849rcVeN8KRUJI2hWUGS
	e5s/ODe85KO+f62tpKHWDzrkk1FdWhbppIABE60RoNn4kftrsENkpkfpsqxrt9ftsT/Iz2/MnX0
	Fhv8XRtN5tfJWQ+wl+mC/PDhUu2dmcIjN21oX331enukYgxQ/own2jwj2tUjnNhzzm6h5TraSvf
	ofyGE6bRlhv37nvMBFbtznDN1HNMSG13rIoayvKT6Ak/Zefsh5Luws5JDrOur8dSzQs/YF1ZbY3
	FEYjTtY+5TXy4ZKO/gZEXYtp9zPW9nZ0XY7daXH4vb3n75mru+8tTf5F7A3lO7ruFuDQJxYcDCq
	wGwbtpGq9/qHRVbtIQOWBRdWyIxw=
X-Received: by 2002:a05:7301:1f17:b0:2c0:c63d:e02e with SMTP id
 5a478bee46e88-2c0c63de76amr3084607eec.3.1773725183881; Mon, 16 Mar 2026
 22:26:23 -0700 (PDT)
MIME-Version: 1.0
From: Stephen K Jolley <sjolley.yp.pm@gmail.com>
Date: Mon, 16 Mar 2026 22:26:12 -0700
X-Gm-Features: AaiRm50TpLYJWtEx_1-ULy104X2VA8l20kyEsiXFQ-1RNxza_CQhaqUseWvf7GM
Message-ID: <CAK5yBb8aTfi8mbBZGMqWvkFOixu4cZK13yXe8y21r8sycY7FDQ@mail.gmail.com>
Subject: Yocto Project Newcomer & Unassigned Bugs - Help Needed
To: openembedded-devel@lists.openembedded.org, 
	Yocto-mailing-list <yocto@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="00000000000083b599064d319380"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 17 Mar 2026 05:26:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125303

--00000000000083b599064d319380
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
team) are therefore going to start reporting out the currently 447
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

--00000000000083b599064d319380
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
herefore going to start reporting out the currently 447 unassigned or newco=
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

--00000000000083b599064d319380--

