Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E8C5C27C53
	for <webhook@archiver.kernel.org>; Sun,  9 Jun 2024 19:04:56 +0000 (UTC)
Received: from mailout11.t-online.de (mailout11.t-online.de [194.25.134.85])
 by mx.groups.io with SMTP id smtpd.web10.3156.1717959890859832724
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 09 Jun 2024 12:04:51 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.85, mailfrom: f_l_k@t-online.de)
Received: from fwd71.aul.t-online.de (fwd71.aul.t-online.de [10.223.144.97])
	by mailout11.t-online.de (Postfix) with SMTP id BC7E21407B;
	Sun,  9 Jun 2024 21:04:42 +0200 (CEST)
Received: from [192.168.178.67] ([84.163.44.230]) by fwd71.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1sGNqJ-089xzM0; Sun, 9 Jun 2024 21:04:39 +0200
Date: Sun, 09 Jun 2024 21:05:18 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe] [meta-oe][PATCH] libgee: downgrade
 incompatible-pointer-types back to warning
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Message-Id: <UCUTES.9SF6P67CS8Y93@t-online.de>
In-Reply-To: <CAMKF1so+PK9g1Jr5vmbOM2tm0Ond2-ioP_mZZ2MH+0UpHkXv_g@mail.gmail.com>
References: <20240609184503.3742334-1-f_l_k@t-online.de>
	<CAMKF1so+PK9g1Jr5vmbOM2tm0Ond2-ioP_mZZ2MH+0UpHkXv_g@mail.gmail.com>
X-Mailer: geary/44.1
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-et64RxV8iKzZdKz4kljK"
X-TOI-EXPURGATEID: 150726::1717959879-E67A7DDA-7212E2A4/0/0 CLEAN NORMAL
X-TOI-MSGID: 10dfe060-df0d-4937-b50d-137f9b85f4e0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 09 Jun 2024 19:04:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110785

--=-et64RxV8iKzZdKz4kljK
Content-Type: text/plain; charset=us-ascii; format=flowed

On Sun, Jun 9 2024 at 11:57:03 AM -07:00:00, Khem Raj 
<raj.khem@gmail.com> wrote:
> Is this in works upstream ? if not it will be good to atleast report 
> it

I had a look here and to me it seems like it needs to be to be fixed 
mostly in vala
<https://gitlab.com/fweimer-rh/fedora-modernc/-/blob/main/pkg/l/libgee.md?ref_type=heads>


But that has been reported for various distributions, so I guess people 
are aware of the issue
<https://lists.opensuse.org/archives/list/bugs@lists.opensuse.org/message/7GKXU2QW6DCH6AJQ62PLFWDMRNTEM5FD/>
<https://bugs.gentoo.org/920315>



--=-et64RxV8iKzZdKz4kljK
Content-Type: text/html; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

<div id=3D"geary-body" dir=3D"auto">On Sun, Jun 9 2024 at 11:57:03 AM -07:0=
0:00, Khem Raj &lt;raj.khem@gmail.com&gt; wrote:<br><blockquote type=3D"cit=
e"><div class=3D"plaintext" style=3D"white-space: break-spaces;">Is this in=
 works upstream ? if not it will be good to atleast report it</div></blockq=
uote><div><br></div><div>I had a look here and to me it seems like it needs=
 to be to be fixed mostly in vala</div><div><a href=3D"https://gitlab.com/f=
weimer-rh/fedora-modernc/-/blob/main/pkg/l/libgee.md?ref_type=3Dheads">http=
s://gitlab.com/fweimer-rh/fedora-modernc/-/blob/main/pkg/l/libgee.md?ref_ty=
pe=3Dheads</a></div><div><br></div><div><br></div><div>But that has been re=
ported for various distributions, so I guess people are aware of the issue<=
/div><div><a href=3D"https://lists.opensuse.org/archives/list/bugs@lists.op=
ensuse.org/message/7GKXU2QW6DCH6AJQ62PLFWDMRNTEM5FD/">https://lists.opensus=
e.org/archives/list/bugs@lists.opensuse.org/message/7GKXU2QW6DCH6AJQ62PLFWD=
MRNTEM5FD/</a></div><div><a href=3D"https://bugs.gentoo.org/920315">https:/=
/bugs.gentoo.org/920315</a></div><div><br></div></div>
--=-et64RxV8iKzZdKz4kljK--


