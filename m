Received: from [74.125.46.154] (helo=yw-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1M7zmC-0002gy-Lr
	for openembedded-devel@lists.openembedded.org;
	Sun, 24 May 2009 00:33:13 +0200
Received: by yw-out-1718.google.com with SMTP id 9so1380028ywk.42
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 23 May 2009 15:25:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=tnca3c6A2yRHDWgtc8q6BVBdxAAyZMeJWa7Xg6kOYsI=;
	b=vTlx/ukxiFuEExz8Gyd0HuByv0xfmiZX8QujLBRwxVrO7mvcZBdqx8opS7OLmxY4b0
	JHYaLMV8grrVQLo4C8ZWRVQaRopOD4opfoazWE0IXh0R9VM0M54dDXgezbS5N3za5ckt
	BycfJCJfiWHHiimlNMqlAeRb1STE6zqXuRsXI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=YGGxoFSuhM9wIAL2Sr8OejcBDNzMNRwXJgjSsYe5IpJxvRz3CBISEIIfo/qSyMsOUl
	iGIakS7cgnkP8bnB2Q2t3Ewy/hmx+ctC4p/NQzrN/SFxSXDzqDZmEkdpuXjhRweNpjNy
	vFtUoNufFuibbcUcyxySItgbubSrMy3DDylFI=
MIME-Version: 1.0
Received: by 10.90.87.5 with SMTP id k5mr4624376agb.20.1243117522847; Sat, 23 
	May 2009 15:25:22 -0700 (PDT)
In-Reply-To: <1243095832.4226.105.camel@lenovo.internal.reciva.com>
References: <20090522213142.GF23842@smtp.west.cox.net>
	<c384c5ea0905230606t48e57c58y658282e25c97fbee@mail.gmail.com>
	<1243095832.4226.105.camel@lenovo.internal.reciva.com>
Date: Sun, 24 May 2009 00:25:22 +0200
Message-ID: <c384c5ea0905231525u2248fcf7ycf512bd48ef05e56@mail.gmail.com>
From: Leon Woestenberg <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: Kernel recipes with broken PRs now
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
X-List-Received-Date: Sat, 23 May 2009 22:33:16 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hello,

On Sat, May 23, 2009 at 6:23 PM, Phil Blundell <philb@gnu.org> wrote:
> On Sat, 2009-05-23 at 15:06 +0200, Leon Woestenberg wrote:
>> Why would a machine or local.conf want to force rebuild by increasing
>> this MACHINE_KERNEL_PR variable??
>
> I think the idea is to rebuild all the module binaries if the kernel
> configuration changes in some incompatible way. =A0However, this does see=
m
>
First concern; why would we want to achieve a rebuild on a changed
configuration for the kernel?

We do not support this for other packages, and if we do, we do this in
the regular way by incrementing PR for a new build recipe.

> like a curious way of achieving it; I would have thought that the
> existing "kernel-abiversion" mechanism, or some extension of that, would
> solve the problem without the need to introduce a new user-controlled
> global variable.
>
I found the construction strange to say the least.

My main concern: I think we should simplify OpenEmbedded, not hack it
kaput with strange constructs like these.

> It does also seem fairly unfortunate that, judging from the first mail
> in this thread, the patch in question has been landed in such a way as
> to effectively (and silently) rewind PR to r0 for any kernel packages
> that haven't been specifically adapted to work with it.
>
Marcin wrote a patch that solves this.

However, I wonder where this is going?

Regards,
--=20
Leon


