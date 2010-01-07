Received: from mail-yw0-f178.google.com ([209.85.211.178])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1NSnJ4-0004rD-Jn
	for openembedded-devel@lists.openembedded.org;
	Thu, 07 Jan 2010 09:01:25 +0100
Received: by ywh8 with SMTP id 8so17922417ywh.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 06 Jan 2010 23:59:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=n1yUPogzmytSBKvbJ/h3Bglf3ba//C3yyfl307NVUdo=;
	b=d9iQdRvoXClxrf5cjOwdzhjPdNDfjdX37Ouf8/cIeU3MDBU4ZiGNR2eFuUv1lKzAkm
	+j4zbehhI/74KFF4zuxyaHVkcIBMSKYWp2OyfqsuELuVhLMN4ax5G06GhtOQ4rGVdW3h
	r0MQDW3s+BMf1Y9sku2hyJReSA18GTMsU/ojQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=WKfSs65aPMur6ez462HFA74AVUdMVCj7YS1mtP7KRMkhm5ugwNVh1VT69H0Um3dPnw
	61Kom/8BWCDkljQr6SbaH6mpMr3fy6J149pH1GV58bmiHpd/j1BfHR+Dq8/eZzxejYxM
	zU2WPFBWecZuvmYNmX10BoQ6emwR61atpmYis=
MIME-Version: 1.0
Received: by 10.101.6.30 with SMTP id j30mr24392861ani.64.1262851155747; Wed, 
	06 Jan 2010 23:59:15 -0800 (PST)
In-Reply-To: <hi31m7$hc3$1@ger.gmane.org>
References: <201001060507.31754.holger+oe@freyther.de>
	<hi31m7$hc3$1@ger.gmane.org>
Date: Thu, 7 Jan 2010 08:59:15 +0100
Message-ID: <ac9c93b11001062359n78f55c47lf9f73b78f770d9a5@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.211.178
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: QA Goals for OpenEmbedded
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
X-List-Received-Date: Thu, 07 Jan 2010 08:01:25 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/1/6 Rolf Leggewie <no2spam@nospam.arcornews.de>:
> Holger Hans Peter Freyther wrote:
>> =A0 =A0 =A0 *) Does bitbake world work? If not it would be cool if someo=
ne could take
>> =A0 =A0 =A0 =A0 =A0 =A0 a look?
>
> I was hoping for bitbake world to work as a QA tool. =A0But my efforts on
> the world target didn't really receive a warm welcome. =A0By now world is
> so utterly broken that bitbake won't even ever start to execute any
> tasks (I killed bitbake after two days when it still did nothing the
> last time I tried).
>
> Unfortunately, currently there is no consensus in OE that
> "MACHINE=3D$machine bitbake $bb" shouldn't arbitrarily fail somewhere.

Ideally this should work.
However, in real life there are some restrictions.
e.g. if my machine is a sheevaplug (which does not have a display), it
is completely irrelevant whether Xserver or Qt compiles.

The current situation is though that someone needs or feels
responsible for a recipe and updates that (ideally after testing it on
all the hw he has :-) )
But it is way too cumbersome to build it for all other targets that
are out there. I would be more than happy if I could sent my recipe to
a build bot which then would build it for all kind of machines, and
give me a log to peek at afterwards.
But building locally for all kind of machines I do not own is simply
too resource (CPU and diskspace) consuming.

There are various ways to improve though.
We could enforce that changes first go to some automated QA process
before becoming "official".
Or we could have a notion somewhere which packages are tested/approved
for what machine
Or the recipe itself could state that (maybe even based upon this
automated build system)

I would suggest the TSC also to come up with an opinion on this.

My $ 0.02.

Frans.
> Right now, OE does not have the tools in place to specify that for
> example $bb1 does not compile for $machineA (some people are very
> allergic to COMPATIBLE_MACHINE for no particular reason). =A0Bitbake can'=
t
> do versioned depends and so we can't say that $bb2-$version does not
> compile with gcc less than 3.4.x, for example. =A0Those are just two
> examples. =A0XorA "solved" this in a hackish way with angsstrom.bbclass.
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


