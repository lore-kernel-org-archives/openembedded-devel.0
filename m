Received: from mail-ew0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QIUCn-0002kT-Ah
	for openembedded-devel@lists.openembedded.org;
	Sat, 07 May 2011 01:13:05 +0200
Received: by ewy5 with SMTP id 5so1113475ewy.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 06 May 2011 16:10:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type:content-transfer-encoding;
	bh=+z2HuPXf7LeIQUS4mu3U1wMQzK8rj0TyuIa9wSzGR+E=;
	b=JjB2UATvA9Kr2NyXT4h6bcae8uBu9XlXrVQMqrxnhK0w1S3dYTaarpSXgEipjktRgA
	zAbfzIvnLTMQLEHKh6vGFLjxNQr2c+eLMXIoESmyXSF364/DQhhQMZkqos0LYElfC8eG
	kSreHFAZ4O0QyW/EDj+HAjR28OTZjQbyMvkKM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=wX1Kg17Yof0a5usWp5VyHkxRJupbUqOXwTaPwUkTgsSk6l4F+RVcO2JhB1m9XCDg/h
	UD6N6zrFNUGN2QJUcc7rrpo9zFlR2eQKpAAw/8waLCX4zyIvXc29adHbm6v6DvuQ/IIL
	pgFA64MfywluUfeHEEoFCx1o9rCIb00bfFn+w=
Received: by 10.14.15.78 with SMTP id e54mr2198489eee.80.1304723424106; Fri,
	06 May 2011 16:10:24 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.53.5 with HTTP; Fri, 6 May 2011 16:09:53 -0700 (PDT)
In-Reply-To: <iq1p0t$q68$1@dough.gmane.org>
References: <1304653677-2982-1-git-send-email-raj.khem@gmail.com>
	<1304666954.3162.3.camel@lenovo.internal.reciva.com>
	<BANLkTinMP8C0WQ5yEpckn7rM5yMap6QkZg@mail.gmail.com>
	<iq1p0t$q68$1@dough.gmane.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 6 May 2011 16:09:53 -0700
Message-ID: <BANLkTikfVwAR=LEXbe9JXevu3oVze2i2Wg@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] conf/layer.conf: Use .= for BBPATH and += for BBFILES
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
X-List-Received-Date: Fri, 06 May 2011 23:13:05 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, May 6, 2011 at 2:25 PM, Koen Kooi <koen@dominion.thruhere.net> wrot=
e:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> On 06-05-11 21:59, Khem Raj wrote:
>> On Fri, May 6, 2011 at 12:29 AM, Phil Blundell <philb@gnu.org> wrote:
>>> On Thu, 2011-05-05 at 20:47 -0700, raj.khem@gmail.com wrote:
>>>> =C2=A0# We have a conf and classes directory, prepend to BBPATH to pre=
fer our versions
>>>> -BBPATH :=3D "${LAYERDIR}:${BBPATH}"
>>>> +BBPATH .=3D ":${LAYERDIR}"
>>>
>>> This patch seems to cause the code to do the opposite of what the
>>> comment says. =C2=A0If changing it to be an append rather than a prepen=
d is
>>> deliberate, please adjust the comment to match. =C2=A0(It would also be=
 nice
>>> to have some commentary in the commit message explaining why this is
>>> being done, since it isn't obvious to me why append would be better.)
>>>
>> That comment should be fixed. Since previously I has prepend and then
>> changed it to append but forgot
>> to correct the comment.
>> It needed to follow some order for consistency and I chose append. Now
>> it depends on the order of
>> layers specified in BBLAYERS from bblayer.conf. Which means 1st entry
>> gets priority
>> over second entry when bitbake searches BBPATH. Right now there are
>> two criteria's
>> BBFILES are selected per priority set by BBFILES_PRIORITY for the
>> layer but BBPATHs dont have this
>> capability they get searched as they appear in the list. =C2=A0Ideally I
>> would think it would be simpler to have just one order for BBFILES and
>> BBPATH
>> so if BBPATHS followed the BBFILES priority too would make it easier
>> to comprehend.
>
> For meta-oe we need 2 different things:
>
> 1) prepend to BBPATH to get our classes in first (e.g. kernel.bbclass,
> gnome.bbclass)
> 2) append to BBFILES to use our version of recipes (.bbs) and overrides
> (.bbappends)
>
> It seems that using layer priorities won't work the way we need it.

we can change the order in BBLAYERS define in oebb.sh to achieve that
so higest priority layer in terms of BBPATH appears first and so on

>
> regards,
>
> Koen
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
>
> iD8DBQFNxGddMkyGM64RGpERAtQMAJwM1W5k0Z9CgxlBYq82O6b39kLDcwCfTNO7
> Qv6TUjazbpj5vYb6Ex0nxWQ=3D
> =3DJ/NZ
> -----END PGP SIGNATURE-----
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


