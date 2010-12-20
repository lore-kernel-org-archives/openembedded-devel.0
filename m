Received: from mail-fx0-f42.google.com ([209.85.161.42])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <coolaj86@gmail.com>) id 1PUXB4-0004rO-36
	for openembedded-devel@lists.openembedded.org;
	Mon, 20 Dec 2010 05:16:50 +0100
Received: by fxm11 with SMTP id 11so2307242fxm.29
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 19 Dec 2010 20:16:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type;
	bh=ZVMUmQjMt4ES8ho5juIx5o81CfTi96Zhuq/QtBq2S64=;
	b=HsTvwCBQsTDPpEECBaxB2E9nqyzRbZHfuEsb4nLlhvm55sGYJoiH2oaXKes4RTzXPB
	z5TTZH78yBfFclryDthDKqEZ+dRFqqY+Uv8obOV13kV8VY4JMqXxDJnd0g5bNCg665ru
	rhKrCeVEX48TpSqPyWdV1O4PflOJ1WO65xUz0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type;
	b=gNDversmEoKqjgzaGIAFHpgi19VLZMcdkydLB+D5tEO1k9a18ldT2OgPv7MCqk3xx4
	t3w5+d6zVEvL5ZpfRbovrsYDRn9bGEzOjCCFZl3uyo8RrZlIC73YUZngXfW4kCfjBtda
	q8/USdm6TRQZLcS9yQyobBqi4wgc8hPVyafP0=
Received: by 10.223.103.6 with SMTP id i6mr4073207fao.84.1292818604305; Sun,
	19 Dec 2010 20:16:44 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.110.140 with HTTP; Sun, 19 Dec 2010 20:16:23 -0800 (PST)
In-Reply-To: <AANLkTi=GGyxNfDzV==iO+nNPKqoShRbUXLY-QDAUMzrN@mail.gmail.com>
References: <AANLkTikotnoR4+_vA7_O1xAyRj5FBosconGFkWjSfzr4@mail.gmail.com>
	<AANLkTi=GGyxNfDzV==iO+nNPKqoShRbUXLY-QDAUMzrN@mail.gmail.com>
From: AJ ONeal <coolaj86@gmail.com>
Date: Sun, 19 Dec 2010 21:16:23 -0700
Message-ID: <AANLkTik=T2vcvcpbM2_nxdycS=1EvOJj=mwzp3HHfTZC@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: Building Image with all dbg packages?
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
X-List-Received-Date: Mon, 20 Dec 2010 04:16:50 -0000
Content-Type: text/plain; charset=ISO-8859-1

Is there someway that I can tell it to ignore the several packages that
don't have dbg packages?

ERROR: Required build target coolaj86-image' has no buildable providers.
Missing or unbuildable dependency chain was: ['coolaj86-image',
'upstart-sysvcompat-dbg']

AJ ONeal


On Sun, Dec 19, 2010 at 6:54 PM, Chris Larson <clarson@kergoth.com> wrote:

> On Sun, Dec 19, 2010 at 6:18 PM, AJ ONeal <coolaj86@gmail.com> wrote:
> > How do I get all -dbg packages to be installed by default?
> >
> > I have
> > DISTRO_TYPE = "debug"
> > in build/conf/local.conf
> >
> > but when I gdb stuff I still get a bunch of
> > ?? 0x2345() ??
> >
> > What else should I do?
>
> IMAGE_FEATURES += "dbg"
> --
> Christopher Larson
> clarson at kergoth dot com
> Founder - BitBake, OpenEmbedded, OpenZaurus
> Maintainer - Tslib
> Senior Software Engineer, Mentor Graphics
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

