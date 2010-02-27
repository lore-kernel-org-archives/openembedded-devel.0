Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1NlQPH-0004MQ-Ph
	for openembedded-devel@lists.openembedded.org;
	Sat, 27 Feb 2010 18:24:53 +0100
Received: by gyd5 with SMTP id 5so548405gyd.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 27 Feb 2010 09:21:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=tTH2S51Yie67H6L3kV9qwugBcpOBesda54k/SMeGtu4=;
	b=LauOsS3F88oe9cDxfKm7Z2u4ouaC9YEw45HtZ5OAzbzU8j9Gf00EKiio6AqkJTvz7N
	N7eZtWZSzsCMIQb8ah/zWZ3zMVO/SivxeMe25WsxGmBRea/c6UlliioY5wtOUSXZvqgh
	XSsUyXP8jfnTGLqq8/v9n8w9r1/Ts+Zn4M2Sk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=H48Fpo4nhRQv7OeurjWtQLkgulEBxCimVMb0FPVYcyedFz6Lk8m99IDNWgxogjmCw1
	4ygUg2JUs9AE1xwKkhsbj5mOqZxAtu9l7IcIEHgKRjUVr/lb2CS58mg7rjwl3AKSqdHW
	OtwNNhZlurdgQY/E+QdR4ebaXUwMheZToPf/E=
MIME-Version: 1.0
Received: by 10.101.195.29 with SMTP id x29mr2955508anp.93.1267291319026; Sat, 
	27 Feb 2010 09:21:59 -0800 (PST)
In-Reply-To: <20100227165600.GD30145@xora-desktop.xora.org.uk>
References: <ac9c93b11002270725t46beb56dx5c4dc63c0f6485ca@mail.gmail.com>
	<20100227165600.GD30145@xora-desktop.xora.org.uk>
Date: Sat, 27 Feb 2010 18:21:58 +0100
Message-ID: <ac9c93b11002270921rb738980ye29c6fd93913107a@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.160.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_PASS autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC] recipes/images/${distro}
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
X-List-Received-Date: Sat, 27 Feb 2010 17:24:53 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/2/27 Graeme Gregory <dp@xora.org.uk>:
> On Sat, Feb 27, 2010 at 04:25:27PM +0100, Frans Meulenbroeks wrote:
>> Dear all,
>>
>> I =A0think some restructuring is needed wrt distro's and images
>> I did some counting and we currently have 32 distro's (ls
>> conf/distro/*.conf | wc
>> There are a few semi-dups (micro, minimal and oplinux have regular and
>> uclibc versions, angstrom has angstrom-2008.1-legacy.conf =A0and
>> angstrom-2008.1.conf, slugos has slugos, slugos-native and ucslugc)
>>
>> also we have 94 images (ls recipes/images/*.bb | wc)
>> For some of these it is quite obvious for which distro's they are.
>> Mostly because they are prefixed with the distro name (e.g.nylon,
>> slugos, openmoko)
>> but for several others it is less clear. grep -i -l angstromg
>> recipes/images/*.bb | wc gives 30 but not all of them are angstrom
>> specific.
>> E.g. nas-server-image.bb mentions angstrom in the comment but is
>> distro agnostic.
>>
>> Also sometimes the names are confusing. We have a minimal distro but
>> minimal-image.bb is not an image for the minimal distro, but is an
>> angstrom image.
>>
>> My proposal is to create distro specific subdirs and move all images
>> from a distro to that specific subdir
>> That makes it more insightful what belongs to what.
>>
>> (alternatively if creating an additional level within images is
>> considered to be "not a good thing" we could either create directories
>> like images_${distro} or maybe even just ${distro} where a distro can
>> keep its stuff).
>> (or yet alteratively we could prefix the distro specific images with
>> the name of the distro)
>>
>> Your opinion is appreciated (and please do express your preference (if
>> any) for an option (ofc keep-as-is is also possible) or coin another
>> option)
>>
>
> NAK on creating extra levels.
>
> Changing the level where recipes are held is not an option do to the way
> you tell bitbake how to find them.
>
> BBFILES =3D "${OE}/org.openembedded.dev/recipes/*/*.bb"

One could do:
BBFILES =3D "${OE}/org.openembedded.dev/recipes/*/${DISTRO}/*.bb"
BBFILES +=3D "${OE}/org.openembedded.dev/recipes/*/*.bb"
>
> The other option, angstrom images used to be in recipes/angstrom and we
> were asked to move them out so other distros can use them. Id be quite
> happy with them to return to angstrom/ as it seems they are not useful
> to other distros anyway.

Well my main concern is that the current names are kinda misleading.
I got interested in minimal (the distro) but noticed minimal-image is
not for minimal distro (as I had hoped for).
Moving the recipe to the angstrom dir makes things a little bit
cleaner, but does not resolve the name conflict

(and on a personal note: maybe 25+ angstrom recipes is a little bit
overkill, are these all actually used? )

Frans


