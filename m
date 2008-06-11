Received: from [209.85.132.241] (helo=an-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1K6Lhf-0001mK-In
	for openembedded-devel@lists.openembedded.org;
	Wed, 11 Jun 2008 10:29:11 +0200
Received: by an-out-0708.google.com with SMTP id b38so596152ana.83
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Jun 2008 01:23:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to
	:subject:in-reply-to:mime-version:content-type
	:content-transfer-encoding:content-disposition:references;
	bh=FuWHDwIIIeMyuU18SP9GFPZamrij/wkymZFc71hHg14=;
	b=BBlq3IGviAAuzklFjO92UJVGqul4lNX21VvfZEtOEmkj7YvDt0EpS6L6OuxZx0b80w
	i4/u2XhGUDt8901hBp9mXAjdfxVxcQGnBAnRimPfMOniPawrkhIXq61JGO/198KfQ1+R
	ysnHZmwDHcIB5PfMCzf1a1F4kFcF80MfJtxFk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:in-reply-to:mime-version
	:content-type:content-transfer-encoding:content-disposition
	:references;
	b=CHBVqe+UenKql7JKFk55/pWeEl4fXoHTjhiQbcdrEoYpd5eH50tXQ5dxYGxAErig1v
	1TVw7Fyaqp65Tu6z+rpcxhrNIEhupo4cFdR+SHipiyBMU+nWmmZ/hok4IGNpvISVm66i
	eNc4p1x/khb1DKwH+X9yIbTmaHeGiiV/vmDx0=
Received: by 10.100.127.15 with SMTP id z15mr7046505anc.80.1213172621340;
	Wed, 11 Jun 2008 01:23:41 -0700 (PDT)
Received: by 10.100.174.18 with HTTP; Wed, 11 Jun 2008 01:23:41 -0700 (PDT)
Message-ID: <c384c5ea0806110123k4682543btfd87a864f374741f@mail.gmail.com>
Date: Wed, 11 Jun 2008 10:23:41 +0200
From: "Leon Woestenberg" <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1213135673.5013.60.camel@dax.rpnet.com>
MIME-Version: 1.0
References: <g2h415$pk1$1@ger.gmane.org> <484ED558.7070907@bolloretelecom.eu>
	<1213135673.5013.60.camel@dax.rpnet.com>
Subject: Re: pkg_postinst_* not working anymore -> broken packages
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10
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
X-List-Received-Date: Wed, 11 Jun 2008 08:29:11 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Hello Richard,

On Wed, Jun 11, 2008 at 12:07 AM, Richard Purdie <rpurdie@rpsys.net> wrote:
> On Tue, 2008-06-10 at 21:26 +0200, Jeremy Lain=E9 wrote:
> Are there any other open bitbake issues we need to account for before we
> make a new release?
>
I would like to re-issue the problem where bitbake gives an ERROR that
multiple packages provide something and that bitbake then happily
starts building two packages.

Even though the user has specified one.
In one case this happens even when the user has specified a specific
provider but that provider is somehow not fully "providing something
but should".

After the two packages built, there is no way to get rid of this behaviour.

Regards,
--=20
Leon


