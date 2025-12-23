Return-Path: <sjolley.yp.pm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5D29E6F09B
	for <webhook@archiver.kernel.org>; Tue, 23 Dec 2025 15:30:04 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.103072.1766503802359145044
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Dec 2025 07:30:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=c7XiwVAE;
 spf=pass (domain: gmail.com, ip: 209.85.210.178, mailfrom: sjolley.yp.pm@gmail.com)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-7b80fed1505so5355398b3a.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 23 Dec 2025 07:30:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766503801; x=1767108601; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=yCEd1/ZzwnWM1pkNfB5keBhr8vK2ebEku+9BhyL4Jw0=;
        b=c7XiwVAELP9tk9CTpFjSzPf3rU6V2BrznpUz46g8d19I53EHEvxDuumVJwYskUX6hT
         EJsiQs46ASNsJPg8K/JHGHZpZKkG9Q1HF10nW0hdviCLwoTsZFi3Us4w0v1RR2b17K7Y
         Jb/aN0ivML4OYGfNMXsJQCybqnKSfX6WXBZaHfeBcPTnRcwG+xYhYQRE7NzN+5TgWDHZ
         mkcyPzxWLKAJ4hu0fA1okvCRWNkB7RdjGpnoAYMmOFP9ALacj5JjRYqGGihLGFmIHnwW
         OG16kaNvnajiFumsag2uOGZ5of4tDZiizTvCIFl+C1h4yqv37A3P8yD0AhWUKArnxB+8
         wmOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766503801; x=1767108601;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yCEd1/ZzwnWM1pkNfB5keBhr8vK2ebEku+9BhyL4Jw0=;
        b=LGFGksaBRkyZcid+KXhF/yTAcideHHHaPbq+9EWuPN+2ZfBHrTdSpIpyQz2lNPQIAn
         8Nate+Ex5EcYy7YSiVnGf9nS6eRWLaoWORrrce93Jiawh8LoK6RUczE7RCk7K/sB7npO
         f7slph2TDVWt7gv3Rw1QaZ5FI7UtvUGEVG8egYCHcJzoxZgr/VsZI6/zpnO0KL9HbP3B
         rORVjwn6p8Jmlzl9/HtNoYxQGJWlZTwqbzoPTIXwtFKT6vieAh9jKmlOC2HCaCG28LRU
         pslnzxOQS/rYv2h8/M8JZrPQZeXF/rFbVkALJE7AdvUIiuLGkzzs3/9CwWVuavWt5u24
         eBsA==
X-Gm-Message-State: AOJu0YzLU5zpLcUOFoWbIXX6tcjxTdj3JjptZZjxOuNn/JvYY6PwpEcM
	OvXKCIiezMwFErE8mVWPgzoM+u7CJ/Y/8iOtYmFimwGfhoiUkXEHsHJ0CkWoWQ3iIQEPDvPGsBV
	NoYxgztrqOQUmCvIDY64Ou6EWlCGeuG8FL6YB
X-Gm-Gg: AY/fxX6LOKnOhFRrgwDjG8/oxornPX5QmF6lEkuy+7i8De2M7lxd++sKoF3Qja6QQE1
	OjZkD9BA4V+MLvy3zrJupRbqRyFFY82xus0NdRi7TAHxAlWeDcuxIO3/PWyP1e6WSUsJabizjS+
	x2F8gaziQVW119bI4dMCmKIjDphcqAb+PKqwriBpwy15wSypSQ29+2w/UJwj9yGeTw8FP/mQCXa
	5giO6VvbnzenRMVMWW7EMU2ZlXKdZK9zzOwRs4ZcHU1+IBRI0ONXBiDw8uDcjlSDlw/I4F9WgJ/
	nN7AXgW2rbe3DI32lgn6GjjIhU39BBDXkohPUJ5uIKhBIYgyMoebJS/NUb5Kmhi1i9unWjjrhRf
	Eftd07XlStNVjJW0=
X-Google-Smtp-Source: AGHT+IENKoZdso2yXoYzwc/yQoDlfObeKsRoTvCHU1bwt/yzxnZG7ZwV8QjHuzXqWcYRxeoLac37o005eSAy1y7/JF8=
X-Received: by 2002:a05:7022:ef0b:b0:11b:8161:5cfc with SMTP id
 a92af1059eb24-12172306ccfmr16907589c88.36.1766503800674; Tue, 23 Dec 2025
 07:30:00 -0800 (PST)
MIME-Version: 1.0
From: Stephen K Jolley <sjolley.yp.pm@gmail.com>
Date: Tue, 23 Dec 2025 08:29:49 -0700
X-Gm-Features: AQt7F2rBvNoFk8n8xLuG4TSCEjCh6KRz84y05ymLpr0qzSNvMRcD4PboXK06WpY
Message-ID: <CAK5yBb_23TQVPPAf_8fs1pwFoPERFKuHiH48qpkkeXeT00DR5g@mail.gmail.com>
Subject: Yocto Project Newcomer & Unassigned Bugs - Help Needed
To: openembedded-devel@lists.openembedded.org, 
	Yocto-mailing-list <yocto@lists.yoctoproject.org>
Cc: Stephen K Jolley <sjolley.yp.pm@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000889d850646a0373f"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 23 Dec 2025 15:30:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122837

--000000000000889d850646a0373f
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
team) are therefore going to start reporting out the currently 469
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

--000000000000889d850646a0373f
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
herefore going to start reporting out the currently 469 unassigned or newco=
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

--000000000000889d850646a0373f--

