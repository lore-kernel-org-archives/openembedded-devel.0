Return-Path: <sjolley.yp.pm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78EECD2ED0F
	for <webhook@archiver.kernel.org>; Tue, 20 Jan 2026 12:15:25 +0000 (UTC)
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5118.1768911322196422121
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Jan 2026 04:15:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JjqnFNnT;
 spf=pass (domain: gmail.com, ip: 74.125.82.172, mailfrom: sjolley.yp.pm@gmail.com)
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-2b4520f6b32so7128807eec.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 20 Jan 2026 04:15:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768911321; cv=none;
        d=google.com; s=arc-20240605;
        b=MEzc1QFkvGrYJSQVPSa9F4kCRHOZJmdwrdsi04Sifn0bvtX1MlzJG3CJ7dgfSGOxvv
         cH+8KC4qSJ/xfqatSHgrsFQLYTNQqVwtmgcUuOkPxv1ABjfBbB4gXTefrUZ6It1hM//v
         VDkpK2+zEJvWmSdv1zu+ptSQhvANktcK78PO7ewAtBUSpER4RP2FMhzBMYGcffutjfjV
         MAW9Qx+ntDU8ENHeX7jPQyGgmzIHFCipx209DUIlPAGsMVcJlzH1eCzkJSfZq8iWLwfB
         CuZ8RfBiAzfUeQMRpBCiGjC7ZAVd6pfAMlfxOKFBxzDy/eb6tnLjiiqxV8/Gpz/6zRFz
         0Qcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=8UG5I//qhfAXVkYvAGOVU25HLrOs2wFLOVAa0Jjqqkg=;
        fh=BwBMBeEhAt1p6hM5GusaqqLaQ1OVjTC3OuGEHAhdtOU=;
        b=IBZ0is4/rIRN1ydApAY1Q43E46boza3wJIO7KUMvRNdjF+uDGBCu2na9iuRq5xioM9
         KOX9+gkI5NTrAU2oY4Lhn6RaKWeyGnj+KUCyy6vjT6WZUsaWgA2lTieJdgxY26rg4bxA
         ECccLTXn5hrQ3sqP5LkEM04g3zf4Gh7l0JKSLsbXhjHoeNzOh9ugu+j8J9MNJ7RJzK3r
         MsxMAWykktYqz9Nh4yJyXVN7umlTW7osSiMBXniRS/JWXirAVjoDMpmr8Uw6MY9csSQF
         e9gJy3E9ZRL+OX5qfaGQ6vLP1bIrzx6MGGZQaYuT26x0dnpzuZpFRFkwVVslrq2itO1H
         RzyQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768911321; x=1769516121; darn=lists.openembedded.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=8UG5I//qhfAXVkYvAGOVU25HLrOs2wFLOVAa0Jjqqkg=;
        b=JjqnFNnTWbc6tp6G+9Unf5LFXvdQCn/t4sYRddUymBgkhvfj0Brhk/f8/mmR2g0U1K
         vMKs+0aKa51lVtSEILy9VkiTkjcfnjVe83hgw72/CCTCXQhF5gQCE3Jr+mzRddRq5txw
         V5Dg9XnB1MzBM+YpowcFBzUQrTolxIbiwLlnZVChDHgFhC50C7RAqlVoWP0Ncey/QFEp
         xbP0YnWpZgEdNXcvSTE/jDrfnEea80TYONfAvNnqGYz1Pt6UbaNtegLBkxB6AjCv/GWu
         EVWSmyUW1wfguabOqlknNJuTB6uECRBofBY65NxYsNllgFgyOGEAaYjTpbhxgHGssYaU
         lMvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768911321; x=1769516121;
        h=to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8UG5I//qhfAXVkYvAGOVU25HLrOs2wFLOVAa0Jjqqkg=;
        b=sH+256cD5/t5YYPc8QdMMLI36odkXt6dhUJvZHSXregkL3VXeaRC20DfbjSU92B7PZ
         IyHWJjfM7bkSqnQ49raVOtFGODr6AJxW2v5YLTeUqsLQEX2jJBN4bEwINycIWEFL6UNs
         2g04VxpaD/uMIESxM7JCItLCbJfZTJdrtmLQ1RYG7mutmrG9orVGF20Q+JQ4QdDmtXrA
         RMOpW5rMDGddDTpKl3BAq6ESPyMgLs/uec95PU5vw2EWC3NCChuG+zkG51Afc7X3N41F
         VaMhdkSv4ilattSwtl8CTC2JN2Ph5rPLvt8BHFpg3vEO7A1ATcy0sp1JFfBlUurT673g
         gLYA==
X-Gm-Message-State: AOJu0Yw9pmuq1+i4bY5rTZqsGDepqvyd4geJPLk2yQexj4aWO+2JiLSX
	WZdOK277YR5xneVkrkJQyYqHoIbUs4nsqiM3SEUngOWmKPPzIqIely3j1V/9Y1PEtb3XTNRWUrN
	asx9kYSSwO7qcU9WO71SGSRF/NkGPSM0QL19m
X-Gm-Gg: AZuq6aKOy6cRHJmbKz0atX48HT/EevUTuIEuJxdzWQ2wiaYVun/3b3e9Tkrb3xWgVEF
	u576vh6uWb34IrcswvCkpIL9FZGrQhDmMawWuRJ08VmxAqymmReutDyX4VuNsXg0bzrB8+p0EtE
	FhgUo4GeKS9kGFjRGQBEkvzttrTjekmyVoRS53xHOAdEk1ePwjhKujn4aoHrTn39QqYGWzWmsBG
	lM/jQO7E4BZND4xoxF9mhk5IBpz2XXZYMLyuEVpWDNvFv/vUZ4lOQWwsWDi8cvDCLRu1ZUCw1Zk
	tfuSsxR90t7WcSML5Nn7SChGcFq7d2PhsgDwzG4X6LQ7xz9zegt5Fo0dTxKWnN677licSNxlrjK
	YQZ2DBmzZxAq8tsg=
X-Received: by 2002:a05:693c:3002:b0:2ae:4fcc:7e98 with SMTP id
 5a478bee46e88-2b6fd61757amr1043516eec.17.1768911319745; Tue, 20 Jan 2026
 04:15:19 -0800 (PST)
MIME-Version: 1.0
From: Stephen K Jolley <sjolley.yp.pm@gmail.com>
Date: Tue, 20 Jan 2026 05:15:09 -0700
X-Gm-Features: AZwV_Qi3OE4xGpeO114u4vbudh2ucZSEaLvONf8V22b5fzrkH1sm28l2Xy9V4Vo
Message-ID: <CAK5yBb-AdZC=peLmnQu04+JO2XCZA0d0Qo_K1hAT2xnFkhw70w@mail.gmail.com>
Subject: Yocto Project Newcomer & Unassigned Bugs - Help Needed
To: openembedded-devel@lists.openembedded.org, 
	Yocto-mailing-list <yocto@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="000000000000da45d20648d0c20a"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 20 Jan 2026 12:15:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123668

--000000000000da45d20648d0c20a
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
team) are therefore going to start reporting out the currently 472
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

--000000000000da45d20648d0c20a
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
herefore going to start reporting out the currently 472 unassigned or newco=
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

--000000000000da45d20648d0c20a--

