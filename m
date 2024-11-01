Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83761E674AA
	for <webhook@archiver.kernel.org>; Fri,  1 Nov 2024 06:57:33 +0000 (UTC)
Received: from mailout05.t-online.de (mailout05.t-online.de [194.25.134.82])
 by mx.groups.io with SMTP id smtpd.web10.31854.1730444251152814304
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 31 Oct 2024 23:57:31 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.82, mailfrom: f_l_k@t-online.de)
Received: from fwd78.aul.t-online.de (fwd78.aul.t-online.de [10.223.144.104])
	by mailout05.t-online.de (Postfix) with SMTP id 62C48968;
	Fri,  1 Nov 2024 07:57:25 +0100 (CET)
Received: from [192.168.178.67] ([84.154.160.37]) by fwd78.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1t6lb1-15ljIu0; Fri, 1 Nov 2024 07:57:23 +0100
Date: Fri, 01 Nov 2024 07:59:35 +0100
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe] [meta-oe][PATCH v3] snapper: add recipe
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Markus Volk <f_l_k@t-online.de>, raj.khem@gmail.com,
	openembedded-devel@lists.openembedded.org
Message-Id: <BFF9MS.X6W7DWYNAGYK2@t-online.de>
In-Reply-To: <CA+chaQevEQ2=G0Z0QG5FvZ4pSh0F7p-vOG69g1m95vQYPk364A@mail.gmail.com>
References: <20241020150843.1068181-1-raj.khem@gmail.com>
	<CA+chaQcWf6gCEJbQX16zR=B3PUmaR78WCVorvrP4JvQsJAPDPw@mail.gmail.com>
	<JOE8MS.4DEF6FX7L6873@t-online.de>
	<18039C488E2C1344.6352@lists.openembedded.org>
	<CA+chaQevEQ2=G0Z0QG5FvZ4pSh0F7p-vOG69g1m95vQYPk364A@mail.gmail.com>
X-Mailer: geary/46.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-r2NndkeWaM9l+IXmnaH2"
X-TOI-EXPURGATEID: 150726::1730444243-5F7FC5C8-2B1F7E37/0/0 CLEAN NORMAL
X-TOI-MSGID: f4a4d06e-a114-4c6c-8984-6a62bbc9ea2f
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 01 Nov 2024 06:57:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113379

--=-r2NndkeWaM9l+IXmnaH2
Content-Type: text/plain; charset=us-ascii; format=flowed

On Thu, Oct 31 2024 at 11:45:59 PM +01:00:00, Martin Jansa 
<martin.jansa@gmail.com> wrote:
> Not sure if this was worth it :).

An easy way to hack this might also be something like this ?

# Did this just for testing purpose
export nonarch_libdir = "/usr/lib32"

do_install:append() {
 if [ ! "${libdir}" = "${nonarch_libdir}" ]; then mkdir 
${D}${nonarch_libdir};mv ${D}${libdir}/snapper 
${D}${nonarch_libdir}/snapper; fi
}


FILES:${PN} += "${nonarch_libdir}/snapper ${libdir}/pam_snapper 
${systemd_system_unitdir} ${libdir}/security ${datadir}"

Since I'm not building multilib, I just did an export for 
nonarch_libdir to have a difference here for testing. Kind of seemed to 
work.
The 'mkdir' command is probably  only needed in my testcase, because if 
building multilib the ${D}${nonarch_libdir} directory is presumably 
already present

Not pretty but eventually less maintainance than a patch


--=-r2NndkeWaM9l+IXmnaH2
Content-Type: text/html; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

<div id=3D"geary-body" dir=3D"auto">On Thu, Oct 31 2024 at 11:45:59 PM +01:=
00:00, Martin Jansa &lt;martin.jansa@gmail.com&gt; wrote:<br><blockquote ty=
pe=3D"cite"><div class=3D"plaintext" style=3D"white-space: break-spaces;">N=
ot sure if this was worth it :).</div></blockquote><div><br></div><div>An e=
asy way to hack this might also be something like this ?</div><div><br></di=
v><div># Did this just for testing purpose</div><div>export nonarch_libdir =
=3D "/usr/lib32"</div><div><br></div><div>do_install:append() {</div><div>&=
nbsp;if [ ! "${libdir}" =3D "${nonarch_libdir}" ]; then mkdir ${D}${nonarch=
_libdir};mv ${D}${libdir}/snapper ${D}${nonarch_libdir}/snapper; fi</div><d=
iv>}</div><div><br></div><div><br></div><div>FILES:${PN} +=3D "${nonarch_li=
bdir}/snapper ${libdir}/pam_snapper ${systemd_system_unitdir} ${libdir}/sec=
urity ${datadir}"</div><div><br></div><div><div>Since I'm not building mult=
ilib, I just did an export for nonarch_libdir to have a difference here for=
 testing. Kind of seemed to work.</div><div>The 'mkdir' command is probably=
 &nbsp;only needed in my testcase, because if building multilib the ${D}${n=
onarch_libdir} directory is presumably already present</div></div><div><br>=
</div><div>Not pretty but eventually less maintainance than a patch</div></=
div>
--=-r2NndkeWaM9l+IXmnaH2--


