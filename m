Return-Path: <sjolley.yp.pm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C08EFEB365C
	for <webhook@archiver.kernel.org>; Tue,  3 Mar 2026 03:35:44 +0000 (UTC)
Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10586.1772508940351684744
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 02 Mar 2026 19:35:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fd2x9NPB;
 spf=pass (domain: gmail.com, ip: 74.125.82.47, mailfrom: sjolley.yp.pm@gmail.com)
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-1270ac5d3efso5083282c88.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 02 Mar 2026 19:35:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772508939; cv=none;
        d=google.com; s=arc-20240605;
        b=NUVyLVLnW3RWaWkADi/Wq4T0JaQCl8jqih0UsqYKJ7Ee0RwfoglM9vDSMEqee2KGl8
         xEloQicMe3ck6LQBMZzJ4QI4bZdFJiFX94hWI7nQZOWqo5BDnjGCrwhG2+ecPsd91UiI
         wxshWRqcn6CxhiDCL/RF3fsmlWohN3vkPULeKlyM/taxFaWpCF1ifVvIa6zPb3x4hY6z
         PsBQNwmGzwAPVVulKeoP7yWla/Qhm1avSIwdC4w/bD6p9GIUdc2VOsu7BKFMSWQpNUHG
         5sIpstaYO2ERTo31N8FIjDsuJ8h4842ZFI63RvFJcKuwtwj9KXiu6yalZ1KOvrWnaaPF
         qYuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=Nk3a45olFxA21kDt9wbaO9lVOejjYJyy47jwjYy5HhA=;
        fh=BwBMBeEhAt1p6hM5GusaqqLaQ1OVjTC3OuGEHAhdtOU=;
        b=Rtqx1vUTSsziURg+b1/5RDnNNy64kyG1LJWOkzVqmdDK5foGUQOCwWBvqAdWvAQ5V8
         BdqLjqbcgROspyuLIA8o5tuH5TbCV2N3DGbLSu9v7b9qZvfTsaEMH1aR6F7PLjXrYmYw
         S6S62i2Y04gyfPWD84YUnQq2O2sgSn1oaJZtZ9RwAuZ96yl4+4+TQ3TKcDSokBPpcVF/
         JXNlHGsUL32+ytDkEMkGoaJBMaGpYgtpU9TacfCWurEhtPkz0F24JXgh05iaHRnCOPu4
         70/YSfXceiB7eCqbJK0W9JXyHGi1jnQstsXXUdR0cX7aQzfiP/Mu2QRsgI42kK0Ankqi
         TjlQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772508939; x=1773113739; darn=lists.openembedded.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Nk3a45olFxA21kDt9wbaO9lVOejjYJyy47jwjYy5HhA=;
        b=fd2x9NPBOq5m5vSGOq4pvic9kcwDIV6GhHp37d52KTFUUbVxhXgFjUx1o4fg7lt5aX
         lKd5NBfMHvNVR+CDFdI2LBpa3Gkl+Pdse0yVdW4kD7c+jvZXhEfAc+YmNdbfoMw/EHq9
         FTUuPRbMYyJnRE+ieSWTEDMARW9hWNjOkLJ4lGx7Xf0p4pqhT1SltM5o0F8PRlgm1GDI
         UN8PU+7GrimOA4Im+PXSS/92Cztghe7O2bCC/zHlKK93kip8vQMHoc5c37L7IVJTQIeP
         KGUWYmQ3qNkkHvutBX7ZuY4QJtysSWMlrEFYuE9duYOjyfZ4UXbDPoZF99z9+3aNild3
         tOog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772508939; x=1773113739;
        h=to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Nk3a45olFxA21kDt9wbaO9lVOejjYJyy47jwjYy5HhA=;
        b=vFCHooQ1cCbSfqzn4ozOYa3Mjrt/PhP7RBVd09qxgfRkEw2aKekP8qtKoWoJ0lB+ad
         EvZk8h35JwCXE1ceXM2taiE9R2O6340lwVMutDm5j8HUpA5V9OT8e0QW/fKXDBeoEuiH
         9WNa77JZX7kVLFjlOrTnaY3vjWyO/Lv9Z+ORWFrLwJnLLZYVs3WNiJY8cQRTOOEYa1pP
         PG9bewK3QyZcQRpHrJfFlSsf/PrdiMd8bEyF3rzZQHxSR/liPROqlyKSJooLqXFhdVXk
         1NZt7vk3hKki84j1btHhy8RJn8OdlIYgtAOlZs9dy2C476d97vsr4i825XbF/f6ycyAM
         Ot8w==
X-Gm-Message-State: AOJu0YxC87yfII9Mz7OpzzLP0eLFs9PHiA/cA9Ahfen29uDuBu0TtDgC
	22rANyALsCr/FebfNyy6NkKNA0cJIsvleIcnikg7XmY7v1PMVhSn0GVxrDaQAzdLLqWjMGEXysU
	hRHjYIN8efOO/TCpfRDB/S81wjX8n54WEMcx9
X-Gm-Gg: ATEYQzyrLNQgcfh8GaVyeKAD0DtyOdUg/jg5rVDrvvdUPxGnObJVHR9KKfhS8+CQd0c
	VWgClvHKCXYXEWY9f29SRI9SYOCfmwWAioUMWpPp0JMYpFQu6F0pHxC2nGzYQNcqojAnLzc+9rG
	NPnyDnrdLLZjHkl7zLL1RD2mZrnE8ubWHgfwe1Osz/BZMI1Q4kRjSpWNBJoQzYgTdB95FooWIM9
	c27aZAZ7JHwFQFGEeKKuJHoV/pD/6ABDqEIRCT4i5wsOvKEC4XvkBL91r7yGH4HYLlHtNDWU8+8
	ztL15lPkJydgF796wuNzsMKJtkaP0h6n0Povyya/y2pyAj/+FhCDlcbEWGl38c/41tTHfeNyCvm
	/h+2a188UcjkUJLqx6T11eMv8aEP5IzWb6bbJMA==
X-Received: by 2002:a05:7300:d4ce:b0:2bd:c872:415e with SMTP id
 5a478bee46e88-2bde1e6b822mr5264513eec.37.1772508939376; Mon, 02 Mar 2026
 19:35:39 -0800 (PST)
MIME-Version: 1.0
From: Stephen K Jolley <sjolley.yp.pm@gmail.com>
Date: Mon, 2 Mar 2026 20:35:27 -0700
X-Gm-Features: AaiRm51dYItJ48VMZR3Ib1UrM0souvoYNKh9MS2VfsICeGcxtJVvovAnL40wTG0
Message-ID: <CAK5yBb_j9S_kLMpoZNdj0Wg7C2_4GZxiCgGcMB0iU5L5sQtHAw@mail.gmail.com>
Subject: Yocto Project Newcomer & Unassigned Bugs - Help Needed
To: openembedded-devel@lists.openembedded.org, 
	Yocto-mailing-list <yocto@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="000000000000b15afb064c1665a7"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 03 Mar 2026 03:35:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124824

--000000000000b15afb064c1665a7
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
team) are therefore going to start reporting out the currently 455
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

--000000000000b15afb064c1665a7
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
herefore going to start reporting out the currently 455 unassigned or newco=
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

--000000000000b15afb064c1665a7--

