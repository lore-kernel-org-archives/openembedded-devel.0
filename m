Return-Path: <sjolley.yp.pm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2ADDEC87FD2
	for <webhook@archiver.kernel.org>; Tue,  5 Aug 2025 07:20:14 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web10.16524.1754378409459152444
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Aug 2025 00:20:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Ftx5ZAms;
 spf=pass (domain: gmail.com, ip: 209.85.216.53, mailfrom: sjolley.yp.pm@gmail.com)
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-31f017262d9so4073261a91.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Aug 2025 00:20:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754378409; x=1754983209; darn=lists.openembedded.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=YolIXUcXxgClAjeAtqp3zZdFwH1MwzSVr81/eGs5Kxw=;
        b=Ftx5ZAmsRmSqv+lDeCKGQsXzz4IXhSRJUlsEejl+ePxxM1XQs8/t/P158lH+P5KB/G
         cP4Ud9kMi+en0g4XYIRJ2/F0pOY0pDTJJZ+8eszruek9aE9zBJ0MZhyQDVB+s5iouB5F
         NUl2lxO7Y3r8/xQ4/z3bxYIg7HvS+QpV4D+Z5/XWd6/YyIF4hByolF1PCIIw4cOGrvZJ
         faw+IcoSHFhi2fujqKAeescT0o8LRKzU/8LzGJtG2omey7QvFBV2hrvTg2EXjKCHlrx0
         D64FkaO3LNHsFy4kFl7EeFZBzQIcb7AAENENCNCFzkGjLzo0GkiNWDC9hK2kuuYefAhl
         IDOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754378409; x=1754983209;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YolIXUcXxgClAjeAtqp3zZdFwH1MwzSVr81/eGs5Kxw=;
        b=T7b8Xon0eXyiV63Eqy3wUpYz0LbjWL4agUf46Zwk3+n3KUGh+p+99Na7kIOFAS44qV
         QuAzMs5irgmFPTYSyeC2E2lk6CHrLpm9j+eZzZ4YVc/XqVfoRZiVHME/YbeS8WjzVbT2
         6xkZjbF7WNl3bANYSJkAQP0tZmJs3BbGShnhA9VRQUD8wXaLPyPiFmHE0I6TpsvDWRwl
         8SOx8QmTIHWvjOcbHyALvVwszxmRhTefxyqNpXzqUvyTFETRD3FuZUw/nJ8fQrbsCVmj
         uVfjZM/fqiD+7DdYiXVZMRepgh0F7ypY3EAirjFim2RKV5RhdOKTZDL7P7EF2Sr0fKzD
         a/Og==
X-Gm-Message-State: AOJu0Yze254QIrN2816EJ3zFHc3B5LQ6OFeTVEXcIlV5fC29T+10Zaj9
	4ojCYSQZ9FfAk/1xhpjroMQ2Vf6ROscNqGeIKVnjzYyzCET4kb1ukH/QX/KBxmbpMiAzVHZFu9k
	iZXuCoyG36To6D7lMavUL/reFl27UD3ukzqs4Xlg=
X-Gm-Gg: ASbGncuwEbXp1IyMVzL2m2r7/xRrzhcpGkZ1bI9tyBxxR2VV/0BfIPXtGRuUmLy1Rj5
	DX4BhjnMUdKLyScQwwcxLwK5VAJxwbmiWZO5IiQDo42Ink0zFbdBfYAKjtsDITpKgh5ZlZAUWtB
	hydgZH2nz1MhisI6P17Pmsac9/DsiH3IL105wFYpkUlQ+1DnbeL8+ge7tS5V5q4v1nNjt5nXAUf
	iWEbO91St5Tp0fnJqC2Tx4Fm6QvIueLiPGnrQrs/aCBROmw0VCm
X-Google-Smtp-Source: AGHT+IEPcQ8F30jRLtpTMLfh5XhMyRtX9Udbwyy3MijEBYuYT52hlOke0dKlkrAnUeT2p/SBVXGwZal4k0udZnlbB3Y=
X-Received: by 2002:a17:90b:1650:b0:31e:f193:1822 with SMTP id
 98e67ed59e1d1-321162c8f2dmr16396318a91.28.1754378408493; Tue, 05 Aug 2025
 00:20:08 -0700 (PDT)
MIME-Version: 1.0
From: Stephen K Jolley <sjolley.yp.pm@gmail.com>
Date: Tue, 5 Aug 2025 00:19:53 -0700
X-Gm-Features: Ac12FXzimXc1mKEBiFQA3-nzS1eNZgMx7F2sfEK9jG29YDRB1ilO4_ET7O-ntOE
Message-ID: <CAK5yBb9Ti88-S1QcD8KTqYTrx0OB4K4Ds0sx+QJvUY9gJT6tzQ@mail.gmail.com>
Subject: Yocto Project Newcomer & Unassigned Bugs - Help Needed
To: openembedded-devel@lists.openembedded.org, 
	Yocto-mailing-list <yocto@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="000000000000d70557063b990d33"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Aug 2025 07:20:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118876

--000000000000d70557063b990d33
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
team) are therefore going to start reporting out the currently 468
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

--000000000000d70557063b990d33
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
herefore going to start reporting out the currently 468 unassigned or newco=
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

--000000000000d70557063b990d33--

