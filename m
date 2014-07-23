Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f169.google.com (mail-ie0-f169.google.com
	[209.85.223.169])
	by mail.openembedded.org (Postfix) with ESMTP id BA67265D9B
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Jul 2014 19:34:24 +0000 (UTC)
Received: by mail-ie0-f169.google.com with SMTP id rd18so1380008iec.14
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Jul 2014 12:34:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	bh=EfwINFOdZDHvWTkqSvi8XvZMN12aPsP0XxHXwktpBDw=;
	b=WeFIhm1lq7H1D0LDvV6F4e5HPg+Z3/svyo1sXrqB4lnRzcVD5p11bakJUkVCOd9Lpw
	puZIRqx2oNWtOzL6UfwL7BGqgqP3hcHGInP4PY5Io4SLDs5jj0VoIey8OxAZ01GsEUmX
	v3R5Gckpzrl4E+wdMC+rYDramQhR790r/dyyzB64NFezEgLJ+hCv+TXgdRaTwlp4C4DN
	oJMWfD4Fh4PTJU02fNvvy0VuABdNXE37Y2oXqJDvRoCBMjSEy3dNWE/kVZTxLw8yz6+x
	OKzY4QIZHs6wMiXZv+wD1MSZOjIDg22oOOX1tpTBHpwSAbQhQVn0tpEunP9gHI1Wh4Bu
	xqbg==
X-Received: by 10.50.13.102 with SMTP id g6mr7185903igc.20.1406144065752; Wed,
	23 Jul 2014 12:34:25 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.78.105 with HTTP; Wed, 23 Jul 2014 12:33:55 -0700 (PDT)
In-Reply-To: <CACgAsMdT_ZUw+z2qQ0CghqLYmKDUybwDYwvHwqu7N5SO6yqWYg@mail.gmail.com>
References: <CACgAsMdT_ZUw+z2qQ0CghqLYmKDUybwDYwvHwqu7N5SO6yqWYg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 23 Jul 2014 12:33:55 -0700
Message-ID: <CAMKF1srhy2BhHSz_ZfgXrSW6tyEd_SDZd-A5fCFGRmH+PxdXCA@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Cc: Yocto discussion list <yocto@yoctoproject.org>
Subject: Re: [Yocto 1.6] PAM _pam_load_conf_file: unable to open /etc/pam.d/system-auth
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 23 Jul 2014 19:34:30 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 22, 2014 at 4:07 PM, Kevyn-Alexandre Par=C3=A9
<kapare@rogue-research.com> wrote:
> Hi,
>
> Just trying to found what's missing for PAM to work so ssh will stop
> exiting with Broken pipe? Quick fix to solve ssh broken pipe is to
> change in /etc/ssh/sshd_config "UsePAM yes" to "UsePAM no". But this
> does not remove my PAM error?

Try the tweaks we did in angstrom for openssh and pam here
https://github.com/Angstrom-distribution/meta-angstrom/tree/master/recipes-=
tweaks

