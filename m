Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Pr7SM-0002oi-8t
	for openembedded-devel@lists.openembedded.org;
	Sun, 20 Feb 2011 12:28:03 +0100
Received: by iyj8 with SMTP id 8so4944977iyj.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Feb 2011 03:26:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type:content-transfer-encoding;
	bh=ioSK0ZFiWAC01o/OYEtuFoS5ZXhPdYpCVMh/UpVq1sM=;
	b=JkQc556bPOoy1cBDOM4AmEpzvrvkmle0jy8NwTShY9zoI2EXeBDGykzV/nKxMRvYp8
	0HQZ7tJNc3lI/eTcePQs411qjNyxFHIdScaxz8tdm0aY0YTSB8fhK6sMu3fx5Ya8YheX
	uXe0q7Nz7KwIWaotN4qIKjhbYDmg+u0d44cHk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=LJJqvU34YbBWdcBrf8XMHc1vSwn1raAh/hqse5SfI2mebkt058NObKVIQTnZ3Oz2Z0
	cc5K+DOR3BxFN/4WBLMFfvHmNwkl32sUygWrnlDHZphRVyShZEG4KcfTZ2A2Z0nonRpi
	bLThNEOUEnKRe4rHiA1gSLv5+n3hdcV3LLf7s=
MIME-Version: 1.0
Received: by 10.42.7.129 with SMTP id e1mr345553ice.500.1298201206126; Sun, 20
	Feb 2011 03:26:46 -0800 (PST)
Received: by 10.231.30.73 with HTTP; Sun, 20 Feb 2011 03:26:46 -0800 (PST)
In-Reply-To: <E1Pr64K-0003ub-00.nyrl-mail-ru@f253.mail.ru>
References: <E1Pr64K-0003ub-00.nyrl-mail-ru@f253.mail.ru>
Date: Sun, 20 Feb 2011 12:26:46 +0100
Message-ID: <AANLkTimPH65gqiSJGt9YtgJ2afpmPqX=snyMmMzP_+d4@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: MACHINE_KERNEL_PR overrides PR for modules
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 20 Feb 2011 11:28:03 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2011/2/20 Denis Dydychkin <nyrl@mail.ru>:
>
>
> When recipe inherits module.bbclass, it will get its PR overwritten if
> MACHINE_KERNEL_PR is defined. The outcome is that bumping PR within recip=
e has
> no effect, as well as SRCREV does not work anymore, which is especially
> important when working with latest version from repos.
>
> The following patch fixes this problem by appending MACHINE_KERNEL_PR to =
PR
> instead of replacing it. "+k" is added to get resulting PR looks like "r1=
+kr22"
> or "r1+svnr222+kr33" since MACHINE_KERNEL_PR is usually defined as "rXX".
>
>
> --- classes/module-base.bbclass 2011-02-17 16:14:45.792425264 +0300
> +++ classes/module-base.bbclass 2011-02-17 16:36:00.088425246 +0300
> @@ -11,7 +11,8 @@
> =A0 =A0 machine_kernel_pr =3D bb.data.getVar('MACHINE_KERNEL_PR', d, True=
)
>
> =A0 =A0 if machine_kernel_pr:
> - =A0 =A0 =A0 bb.data.setVar('PR', machine_kernel_pr, d)
> + =A0 =A0 =A0 pr =3D bb.data.getVar('PR', d, True) + "+k" + machine_kerne=
l_pr
> + =A0 =A0 =A0 bb.data.setVar('PR', pr, d)
> =A0}
>
> =A0export KERNEL_VERSION =3D "${@base_read_file('${STAGING_KERNEL_DIR}/ke=
rnel-abiversion')}"

Actually also just noticed this problem after building iscsi-target
for openrd (r19) and calamari (which to my surprise gave r1)

The patch does look ok to me, but I can imagine that we also want to
bump PE or so (to avoid that the new PR from this code is smaller than
the old PR
(acutally thinking about it, if we put kernel pr first (without the k)
and then something like m followed by PR, it might not require bumping
PE).

Frans


