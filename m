Return-Path: <sjolley.yp.pm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BC48E94612
	for <webhook@archiver.kernel.org>; Mon,  9 Feb 2026 21:41:59 +0000 (UTC)
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6069.1770673319233944648
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Feb 2026 13:41:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MoCZVE+D;
 spf=pass (domain: gmail.com, ip: 74.125.82.174, mailfrom: sjolley.yp.pm@gmail.com)
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-2ba6f43fb37so161540eec.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 09 Feb 2026 13:41:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770673318; cv=none;
        d=google.com; s=arc-20240605;
        b=OW0rIacSU2HOyXE1257LO6dUHVjrB1Q7yAVAiLFD64crKOTyldZ0CRQ0xgQKl2AH55
         ywas3bNmm4M3qfx+V/om6Qlq51OzYGghndYKuRgjNirgz/N8w0dgYUNNWlsOJ7VHgR8x
         R65iDu695P2SLrtealeQYAcByGarDooaasI36qUQC/wmWTjxNylDywRKHDJM1NHw1UVx
         eCtaVUwtjrYuhLcJZWX06aIgHb6NLmNra6bSQ1dG0vPARFhd/XWdYUgZ+Vo32bwa4+r2
         k7WUmqIh92r3Jt+l88CXjJLIHmZ6xByjPyorLGpQUxcFcuyDl+oMjUXkVUYPqPermkX3
         Q2KA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=3P2m3Wbr3TeA3hPX93GFWTd01xxH/GT6dW4jH1fGrI4=;
        fh=BwBMBeEhAt1p6hM5GusaqqLaQ1OVjTC3OuGEHAhdtOU=;
        b=GI/6ybygN0SdwY7IAxVs7rWzTaU0FyVY+/tsQQJVrL+qmJs1wSRHUtBRQjy6JdWekp
         KKNFdO5f7No+o9MWJhIsTGAQMbidFkxOumAuXUUolhJdKyqcvqq3m4AZJkqpUQrocjOy
         mv3inbE+VPzxXFxffpbGOMZkyCGGsjHWbf1mjWdsRO+fviOSxHWXQbfBp0Yy6tejFmnS
         mAuo+vbvxN8XsAZHAJ2Uol/gdZvs4iSYG2LEkODmPNfvdIHTpkRfDoH7LlpBuPWvoLgl
         6m8F/GVQm5EoGuS5zR7Nu4jH7Qx6YN/D94c8Ltl8H4zP6vhDQq3GzKpayOl4AY7nrqJ+
         EpmQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770673318; x=1771278118; darn=lists.openembedded.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=3P2m3Wbr3TeA3hPX93GFWTd01xxH/GT6dW4jH1fGrI4=;
        b=MoCZVE+D4sBu+ln/gsbxNuZ2Nc/nfrtm5Zs+cGMdEqi1Knrqn9sYWdoXkJFeF01vhO
         5F0kJq+1u4rZinpsE/xWrV3uYFvsYB6DcM6O+t+dmmzeigK2niKAIWxi+m+40XmhyQ7P
         OJ5WBMuG3K9/SbxDMt46xSeNVF2EmZBF4At74Xg/MhpUPcXZqLqaFRZIcLuG+MPpVF7V
         rExT+JVr0/YW1vSmvRE161wV+XWA8GoLirxzlZYow2xbWFq2/UzQWsEuAjSjYHhbJ9VZ
         jJPFo0I0CH6HaiaKkUcG4oQd1ALhhqkJ/bWlbGIgYEq5IcjF1OBM7oYdyS8aE33SjWaF
         /56A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770673318; x=1771278118;
        h=to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3P2m3Wbr3TeA3hPX93GFWTd01xxH/GT6dW4jH1fGrI4=;
        b=tBOtk/FSeIHQttooq1VKXAxH4T7PMxMJLIjksClfluoXfJU5lWmo7nLHsYW990WFiu
         DlYUJUtkP2dYxhi+xtvCSeWd/IPwQfCIapElbHr93u5hd4zUgmJCog7YmOl9q5gJs476
         aXCBGpEYO48voxoJtRH4mh6Mtmnh3TW0fBC8ZFMmiwcqSy5aWmxw2YpOP7LcxdL1QtuT
         t30kOFNx8sqyujY+FWEfmufek2cDkj7vtcy299x7+Z5n5wiAR+1HMtk/i+H+w8rz03xF
         vK504DBX0eebCrW+/kbAMCN/9FyZo6XrFjQKVJV/9hXnThcx7s5sqAXVWVKRwX7Q5u4L
         gIwQ==
X-Gm-Message-State: AOJu0Yz56HoNpqmvevPhDU/87ACnxefS0mo0QjVGhK6+rN5TfM2bA5HH
	l5O3qa9lU0Vkcp/teJdIJ+krVilVix/NhBTHaxd1kVNCMVfrs7QKlIjTjT1z3Y3DNCysHQ/9m6P
	0LAfuJcdQqIocpCruIkVhlGGKV1mtIjT1wGxx
X-Gm-Gg: AZuq6aLMqSIYUz6lC0ZXtPOyoC0aFe4gaKn9CaPqOsG7sSIc0XOzcEPW60m0gAIWF8M
	zUkeuhGY7UwpRAF8TllreI6dv9xekRhks5yh27MXulWcC65mvKnhva6a+Ex/0X9goiyzX7tzKQ2
	bQPJeONf9bh9prNyGguq/SGMk8EZqK9r2S5X7n5FLz7/4feN21b+2gNpXYw0Q1y/0cGeSkk/B70
	aeRzJKZgKV/dsvAVmwpC6l/rwSK6V1p5VWiBtYFPM+IzWDZM9W21cegNm3zjr3Chaonm0UQOAnA
	fS2Byy9EOhF4aL+pAMyefklq+SiQct+i563T3jygBxREdr/dCjICu9XRbA==
X-Received: by 2002:a05:693c:40d3:b0:2b8:f1b4:ca57 with SMTP id
 5a478bee46e88-2b8f1b4d6c1mr2282322eec.20.1770673318346; Mon, 09 Feb 2026
 13:41:58 -0800 (PST)
MIME-Version: 1.0
From: Stephen K Jolley <sjolley.yp.pm@gmail.com>
Date: Mon, 9 Feb 2026 18:41:47 -0300
X-Gm-Features: AZwV_QgvvUu9zojBFLErZxvYFYo1H8NZWs8WJ3yx4PenYnIyyq7zUzhCiMEExZI
Message-ID: <CAK5yBb-19dCEjQubF7kZ+fc6GhycwZR1KQKcLU-MmtxHPinSWA@mail.gmail.com>
Subject: Yocto Project Newcomer & Unassigned Bugs - Help Needed
To: openembedded-devel@lists.openembedded.org, 
	Yocto-mailing-list <yocto@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="0000000000002744cb064a6b0227"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 09 Feb 2026 21:41:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124314

--0000000000002744cb064a6b0227
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
team) are therefore going to start reporting out the currently 466
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

--0000000000002744cb064a6b0227
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
herefore going to start reporting out the currently 466 unassigned or newco=
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

--0000000000002744cb064a6b0227--

