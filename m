Return-Path: <sjolley.yp.pm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E654CD13DA
	for <webhook@archiver.kernel.org>; Tue,  5 May 2026 05:08:58 +0000 (UTC)
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.32639.1777957734085030537
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 04 May 2026 22:08:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=JAEnmPsx;
 spf=pass (domain: gmail.com, ip: 74.125.82.169, mailfrom: sjolley.yp.pm@gmail.com)
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-2f0ad52830cso3303354eec.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 04 May 2026 22:08:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777957733; cv=none;
        d=google.com; s=arc-20240605;
        b=PPz33rB/nz8/BAQ6lkYfUuG/wJMTihIPzTuOcpq66UwP8YBFoG/6tUUV4uhTXCVrtL
         7PbwKcZtkhfidQ18B1Uv5r6MilwBgYmhzfUgiFivuPAfzoRXaf212w+UvajXtkBFwHwd
         Gsu0GeulvMLlhkJbmwiyuDmYN9P83O8QYCrHlcaW9Q5pQV4G9aBtlHBprRgrDDom0jUv
         BbRDPKS3QC1Y0T0LV3fj6wpmoJcIqJTa9eSjokaJPQfK/ApWfxI1eFrJeF5ornL5fhQi
         +MFEXhWpeSfqoUHSr0UkKXotFeui30B/kJECCTxHfzIIIbrigrVQ8j/eE78AFPf6AGB+
         N5Rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=Tj9pF9+FpSBmVP+YCQ6eQByNqKykO4h5CC6ixNWxFDM=;
        fh=BwBMBeEhAt1p6hM5GusaqqLaQ1OVjTC3OuGEHAhdtOU=;
        b=Z1sxm2TDKJloe/W6h5F6osZqsxULL02umy78LwJTiq6DJ7Z9eBa79fIhbg/e/xfzhh
         5SATN9egW1mxoLLEMcwTo/sNoJr+VDEC3igRYasYYstlWctMFXoLTS0SWXsnOYBrPhSi
         gJjT0FXrKJ1GJQrddczLUEBKnsRYOnJsYiHzrwOUpwcqXTbgGKn+y9/qXz89+30esq5f
         ZNhbILcpP/zDR3zXrb2vX9cOIqA1s+R6wtPGqEaXr+KaRenfa9Wx+bn8DYPkEi6QKXCS
         iG6HHIo2jRVN4iXXYieHvv4d0F9pchVqUGQEjYURYkiCluM3sJOabem4WLM/UxY/2Oj6
         70Gw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777957733; x=1778562533; darn=lists.openembedded.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Tj9pF9+FpSBmVP+YCQ6eQByNqKykO4h5CC6ixNWxFDM=;
        b=JAEnmPsx3sBaTcSYePrYxI/0atgqF05DBZwCgwxyNG50RbUmwk/m+8AjW7ZwbC85JF
         CIhLuXgqu3FAJNVjsaNCKPK3Phbqkq9D5x0cp6wUwSeyoBKrWK5b0aOIKSuCaZ0gWVZt
         BaQ7Vp0jdQ1lyJaEAitr73XX4w5/ldvONsMIFvJXoC1HljqYme/eOc7gwruvOplEd/qD
         0tvuyOFmOeINBCKQ1VDuBf6+99RVhwr5x+ZAaTNgaLQrnGS/NIKbsjz5HMQgrUS9+vHR
         gW1811Q29pdFeORn1Fa+o3Z9S+MlSCTdLOL+6zVd0xWJVMotaUBiiti4Vhd1B2b5eu+M
         q1nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777957733; x=1778562533;
        h=to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Tj9pF9+FpSBmVP+YCQ6eQByNqKykO4h5CC6ixNWxFDM=;
        b=jpCLTinDu7rAENWj+k/yl4DEUL361XUmkZ8cazhE40CzBJGuKMVI6K9XHbYHA4sAWZ
         tEmG+VOmCi3ITrtpNh5MltPwMpK2dqjFeih/H5VgCPfXKF3Kv5s+zmfnAzN1fSK6mRgY
         BBT4owZhi7SZ0MX2VF9v04n/DDFzQbtQCOxm+5T18XJ1NW1zBEu7I4xvaXGmagyozeRv
         NFgUMgHM27Zu0mhm3DuheaLNMXqQ4RSoFhIwj3sUuegoQ5PglUBLk7maMWQIZ++htWUn
         LM2clKcFtdWEnsJQIfgZjehsv/R34+/M2vEEBkE2g/YBDqcxy6E9IIfQdHT20uXQv0Di
         lJ/A==
X-Gm-Message-State: AOJu0Yz5hCGsnsl6UiFXyNZCxhgcILj9jnKef4OMhC3bPSzJxoPh5k7G
	A+c9fAogdXWGaZqZtsHyyxAk/Md/EhiU0gLgFXVJob+V5sOYWl32s6UnQuZvArzYiEV+Twv2JvY
	FCAlZ1Ba2rHv5RK5VWPLCOj77dI98SzpuF57N
X-Gm-Gg: AeBDietnw6NQdbmppfjufMzFVnvdlR041r7A/1z6w1kfPaCcpfHwMpSCQJ4OZ4/KhOH
	YiwvlTWrOZOGiSGFpPSb7xZFHsSOEvqBzZiqFrBZ+r2qRDQTFTGvsmZZX+TTxgJmiHjvelp5W+v
	VIW0ufZCZvSJiykSWGbS2uLwmRI9mXDbZih1nk0vCKDxew+gRzkh2pZs5qJUi1CEh/amlG5B4fc
	LfhyxKDhdiKeEw29+1p6yr9cYeicExPQgj4ONtZEI4H/JRtjWuY+dOwc9xz4RKNcWdllGO/gMZX
	u76wWHt9WEkqCldP6fRqxtGoVN4Gon6QggBtcKpLtW6+3ezTc5VVl1S7emScAYYY3PvUZqHdro+
	AV3eE6Er+fk8TIbAbUqxuv41mZ0G/n9MO/mxExWUGYDNG4arI0xP7KwdRh76IFN2MyekQ93y9LV
	ANNKt5JHucj4QiCZ5K0g==
X-Received: by 2002:a05:7301:3b8f:b0:2da:44ac:6d17 with SMTP id
 5a478bee46e88-2efb9c865e9mr5264904eec.17.1777957733136; Mon, 04 May 2026
 22:08:53 -0700 (PDT)
MIME-Version: 1.0
From: Stephen K Jolley <sjolley.yp.pm@gmail.com>
Date: Mon, 4 May 2026 23:08:41 -0600
X-Gm-Features: AVHnY4KtGVtQH1lo_UvIfg_YZIkEFGT-Jwd3Y-80v-CgRgUiItYVbydgJBaaSro
Message-ID: <CAK5yBb_YVwNRkT4veo2gV5rKhV=UVwOmhuY+kxGpHeYgHjfw5A@mail.gmail.com>
Subject: Yocto Project Newcomer & Unassigned Bugs - Help Needed
To: openembedded-devel@lists.openembedded.org, 
	Yocto-mailing-list <yocto@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="0000000000001bfc7306510b0bec"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 May 2026 05:08:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126780

--0000000000001bfc7306510b0bec
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
team) are therefore going to start reporting out the currently 427
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

--0000000000001bfc7306510b0bec
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
herefore going to start reporting out the currently 427 unassigned or newco=
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

--0000000000001bfc7306510b0bec--

