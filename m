Return-Path: <sjolley.yp.pm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14577EB1066
	for <webhook@archiver.kernel.org>; Tue, 10 Mar 2026 14:58:40 +0000 (UTC)
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.42030.1773154709765861940
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 Mar 2026 07:58:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kHBmtVK7;
 spf=pass (domain: gmail.com, ip: 74.125.82.41, mailfrom: sjolley.yp.pm@gmail.com)
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-128d2e3074fso3749509c88.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 10 Mar 2026 07:58:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773154709; cv=none;
        d=google.com; s=arc-20240605;
        b=SSdYuDm2FArjlOZpGm+HizRz/qxPLoQzN8P+0HfIe1ch6Yyib0ujm64jcBRvmg551m
         9Z5Sn7rDCfMRqETIrWMQge341zXaFklTIMwtYCFg5a7FkKGv3EHfI65AWyFg3gvJSIar
         mionlPSx3ZCdGELDf1xuxp5aPVMAHE1XdJbg/lUWtkmb7/O9iDxjHBqmB7Vvue7l6PwE
         1FrxLuyo9IiyS0bGKGXP7J+LegwNUGPbkCPDDYWVZgWAILM4d+8cad5WHPFetQEw1M5U
         eTYHvvqW71JgIEs4t9NKe8H+smY55zC8I6P+v4Jg6BjNyG9BVekWK1vbZLmIHH5KLT6k
         /XpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=A1QIrsyK1lC9BcaNRW2k0qeTAC9CVbE6NxBdd1wz7Jw=;
        fh=BwBMBeEhAt1p6hM5GusaqqLaQ1OVjTC3OuGEHAhdtOU=;
        b=QQI+7rvgReSZIYhKcYA00uD2jzi8G0VjoWLQJfqxFnpwsphdU7Vs+/QF71Y5sk1SGd
         hd/uyplf3LYBlawQ8Fvrs+RcSaoNAG/ILhAT+vO0qsIso3qJgNHoAfhtkHnjc2feM1dj
         tBttOdHbrZ99K44A1osih0rlTVul2UaUgJMc//EBE8KxCZPe9Vvq6aVcewOZ1XyVTzBe
         WUnKWrZ7++aWaZUkdK3oyYTBTX2loF51HMAUEOJ8yQcOjk1vOfg9TUazPzps/0xb0SiN
         yogFdwGaCGK7y4ubv5HIedRI+TNX3KqNrPBqPSYX/VJi5YHbz9O1PO7Kta6ZeJ9POPeN
         bi3A==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773154709; x=1773759509; darn=lists.openembedded.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=A1QIrsyK1lC9BcaNRW2k0qeTAC9CVbE6NxBdd1wz7Jw=;
        b=kHBmtVK766OT5pU1mq7+o4E09gxabxUyAUAv4eVj5dAV3kk+WDYnAUa5cFeVFPNRFp
         QtHB/WZynUv6mkMDyDaxJw+cv2XiBz7Fn2Ur2IF9Os7/g975lfRclH52CmZby2cBdBEN
         3R2/X0M2OWvN94KWvyL/9Gi591/plMVsOJaHyp2g1bUGT/8+iH04+tPB7Txi/UvIYQGc
         MiXvDldXb1esC25qxpJLPmzQGmcHNyoRU304Qptv0hRGwYrUFcQoVduBHBr2615vRsAY
         lYbx1EvTQ6ntfiG84VoC0T6ciQk5dUqIHDgq/LXkx15SmmbZpHi13BTmtAGTIlyUT1Lp
         3GmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773154709; x=1773759509;
        h=to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=A1QIrsyK1lC9BcaNRW2k0qeTAC9CVbE6NxBdd1wz7Jw=;
        b=uc1bIhaTrF1CzJDkwFJWA4p6tg5Y7fiNX6k3AXbjisyFDMctGaSJdPH+hEJ7sRg8RM
         i6H6K+mfSBRGtem6bZsv1++Gdno8g46i+lIQ7Py5USmZdC3Tmgyz3ca2m1OgGuSmfYnN
         qA7xST2tbZQtzNsR4bfqrl6V9YthdVfp3OHDe2WoRhAegXD64DLsZ6znOSUPRkDiem+N
         gs7g2SUJ+p/yAKxJNoELtM3pp5ZAaiNS74A6Ytxt1kjWdvgZVLWjGRKJaCQTxtvZgAGD
         pb8JWr6YeF6ZUgCTDlTcC3Qw8rG2i7ciuLsqTxToAIdVEU8KR/vsGhm3K7kWR9rsWJrR
         sN1A==
X-Gm-Message-State: AOJu0Yxw7tmo8bzssdsgCN0tRKVqNNeq3to7x4zyFrzj62AZGVlr8L3s
	P3+hT3XmhFFuC+nTrQrfANJ/NAoVxZk5dZiq0NLRFw9NhzFpO9U8HClrhSqMY55co4mdxIg9FM3
	nvQW9mm3aLyDm6SJVZhBYG9gpqAy4ll2Ct4Ow
X-Gm-Gg: ATEYQzyaofElYOdkxFSI/Czs1DaXOYP/PR0VCou3Fa86TOvynMqtSVx0u85E5Xb4l9n
	ocAXydKxrHlYNXcg4NxTRskuBBX59dGbq4URTsSI2QH4HlDmQg4Hvt9yezJWWcBgv4dxPE1ZVv7
	fSYY/otO51w/+I//P6TJrJEaVKQpMCmiRqFVfuxTG0C8Duaaw/dcOj7G5adhYdhKvlejd/nB8gj
	HkoAf3VhtYdBmzLUKz2qB69WS8mzZxmp3qRqyorr9NRDYW2t4snnsHRXGL0S3VGpWKTCcmzTzeh
	ThABBehUezxAZeUMBiEXIiRavgLX3KzzSs7ZCCqZ11UPmxMKkW0r6Ef+kwH/nE/i/2RM01MV8Iy
	W9aZ27rPWXnhmQluDvLvigAO2WTh4+0gH0/ygqw==
X-Received: by 2002:a05:7022:324:b0:123:3488:89a3 with SMTP id
 a92af1059eb24-128c2e71a6fmr6240721c88.24.1773154708832; Tue, 10 Mar 2026
 07:58:28 -0700 (PDT)
MIME-Version: 1.0
From: Stephen K Jolley <sjolley.yp.pm@gmail.com>
Date: Tue, 10 Mar 2026 07:58:17 -0700
X-Gm-Features: AaiRm53x7oqsOVuwjB7u66MvoKzG-h0DQO1rzuq7ohF1izezlabItZ-BUoiPxPo
Message-ID: <CAK5yBb9hwRdO+cis9Yud0U3W8iyyzdjy=2qL_7OqTZN0amR8MQ@mail.gmail.com>
Subject: Yocto Project Newcomer & Unassigned Bugs - Help Needed
To: openembedded-devel@lists.openembedded.org, 
	Yocto-mailing-list <yocto@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="0000000000008d435e064cacc067"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 10 Mar 2026 14:58:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125031

--0000000000008d435e064cacc067
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

--0000000000008d435e064cacc067
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

--0000000000008d435e064cacc067--

