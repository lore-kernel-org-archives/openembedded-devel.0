Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 884EDCFA74F
	for <webhook@archiver.kernel.org>; Fri,  4 Oct 2024 07:22:42 +0000 (UTC)
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by mx.groups.io with SMTP id smtpd.web10.16773.1728026557654777148
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 04 Oct 2024 00:22:37 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.81, mailfrom: f_l_k@t-online.de)
Received: from fwd70.aul.t-online.de (fwd70.aul.t-online.de [10.223.144.96])
	by mailout03.t-online.de (Postfix) with SMTP id 798F53528F;
	Fri,  4 Oct 2024 09:22:21 +0200 (CEST)
Received: from [192.168.178.67] ([84.163.34.163]) by fwd70.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1swcdp-44GAhk0; Fri, 4 Oct 2024 09:22:21 +0200
Date: Fri, 04 Oct 2024 09:24:17 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe] [meta-oe][PATCH] webkitgtk3: update 2.44.3 -> 2.46.0
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Message-Id: <HWLTKS.726242ZDS9WE3@t-online.de>
In-Reply-To: <FC14KS.G22B53FBJ0212@t-online.de>
References: <20240918184731.54155-1-f_l_k@t-online.de>
	<CAMKF1srYntLyTC+rixg+4UgYB8pyCUB7q26nsJWp5ntKM38OJg@mail.gmail.com>
	<FC14KS.G22B53FBJ0212@t-online.de>
X-Mailer: geary/46.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-vRIxG9hlbil/wTH1wMOg"
X-TOI-EXPURGATEID: 150726::1728026541-8963143E-8D769EFD/0/0 CLEAN NORMAL
X-TOI-MSGID: 85e2e1fd-e46a-4f10-b118-942feb9e6201
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 04 Oct 2024 07:22:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112655

--=-vRIxG9hlbil/wTH1wMOg
Content-Type: text/plain; charset=us-ascii; format=flowed

On Fri, Sep 20 2024 at 02:00:15 PM +02:00:00, Markus Volk 
<f_l_k@t-online.de> wrote:
>> it fails to compile on riscv64 and perhaps this commit is to blame
> 
> Yes, looks like this commit is the reason. That missing RISCV64 
> register errors sounds quite unfamiliar to me and I always get lost 
> for hours looking at the webkitgtk code. I'll check if this issue was 
> already addressed  and if so maybe also has been fixed. If not, I'll 
> file an issue for it. The webkitgtk update brings great usability 
> improvements for epiphany but is not a build requirement for epiphany 
> 47.0. Also current gnome-online-accounts seems to work well without 
> the webkitgtk update.  Therefore no need to hurry


I had a closer look at the webkitgtk riscv64 issue. The error with the 
missing RISCV64 registers is due to a typo. But once that was fixed, 
the fun began. Despite looking at the code in a few places, I couldn't 
figure out how to build webassembly with Jit. However, I was able to 
build webassembly without jit, and since I've seen that there are 
general efforts to make things compilable without jit, I wanted to ask 
if jit support is mandatory for riscv64?

webassembly build with jit enabled leads to a similar problem as this 
one some time ago:
[<https://bugs.launchpad.net/ubuntu/+source/webkit2gtk/+bug/2008798>]

It seems to me that riscv64 does not support b3 at all? I'm not 
entirely sure, as I don't even own such a machine, but the fact that 
this typo was not caught for the release version suggests that riscv64 
is not being tested by CI in the webkit project. Therefore I ask.


--=-vRIxG9hlbil/wTH1wMOg
Content-Type: text/html; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

<div id=3D"geary-body" dir=3D"auto">On Fri, Sep 20 2024 at 02:00:15 PM +02:=
00:00, Markus Volk &lt;f_l_k@t-online.de&gt; wrote:<br><blockquote type=3D"=
cite"><blockquote type=3D"cite"><div class=3D"plaintext" style=3D"white-spa=
ce: break-spaces;">it fails to compile on riscv64 and perhaps this commit i=
s to blame</div></blockquote><div><br></div><div>Yes, looks like this commi=
t is the reason. That missing RISCV64 register errors sounds quite unfamili=
ar to me and I always get lost for hours looking at the webkitgtk code. I'l=
l check if this issue was already addressed &nbsp;and if so maybe also has =
been fixed. If not, I'll file an issue for it. The webkitgtk update brings =
great usability improvements for epiphany but is not a build requirement fo=
r epiphany 47.0. Also current gnome-online-accounts seems to work well with=
out the webkitgtk update. &nbsp;Therefore no need to hurry</div></blockquot=
e><div><br></div><div><div><br></div><div>I had a closer look at the webkit=
gtk riscv64 issue. The error with the missing RISCV64 registers is due to a=
 typo. But once that was fixed, the fun began. Despite looking at the code =
in a few places, I couldn't figure out how to build webassembly with Jit. H=
owever, I was able to build webassembly without jit, and since I've seen th=
at there are general efforts to make things compilable without jit, I wante=
d to ask if jit support is mandatory for riscv64?</div><div><br></div><div>=
webassembly build with jit enabled leads to a similar problem as this one s=
ome time ago:</div><div>[<a href=3D"https://bugs.launchpad.net/ubuntu/+sour=
ce/webkit2gtk/+bug/2008798">https://bugs.launchpad.net/ubuntu/+source/webki=
t2gtk/+bug/2008798</a>]</div><div><br></div><div>It seems to me that riscv6=
4 does not support b3 at all? I'm not entirely sure, as I don't even own su=
ch a machine, but the fact that this typo was not caught for the release ve=
rsion suggests that riscv64 is not being tested by CI in the webkit project=
. Therefore I ask.</div></div></div>
--=-vRIxG9hlbil/wTH1wMOg--


