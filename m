Received: from mail-yw0-f171.google.com ([209.85.211.171])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Nlpof-0001ta-Pq
	for openembedded-devel@lists.openembedded.org;
	Sun, 28 Feb 2010 21:32:46 +0100
Received: by ywh1 with SMTP id 1so815624ywh.3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 28 Feb 2010 12:29:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=mGw4RnDr/0DM+PnnpyG/g5SwKJig+BOo8bPjB8Y8SB8=;
	b=R08Ats+FddhjtRBqoX8GfN1wgZk83LGVL4FnsBu20utM1/sqIbuSzDC5a5TzuD14Tn
	aaJdEJJJS9xkZ0VTi66vso3ejS7IVN4Km2rcW710mJm9pAdRm4rKC51IyQe15E9TWYtQ
	5aoJ4BpKibkpUjIMtUKUCsp36rnLs50xM7dEE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=mnXQWc1a5wf/aiWwVKl00ijKYCtikMez+RLvOOhB1ZQh+LMFbx0D3wRNwxi2gbKN6t
	uqjR8foFWgA95ir4fAxBfnmjhq40knym4vj161BKysSoG24MAR31+sl7TuSKxEcKPJzj
	zXy9GPegHMHg7pua1mjmSDkDO9wo8k225T48Q=
MIME-Version: 1.0
Received: by 10.101.90.7 with SMTP id s7mr4586403anl.176.1267388992041; Sun, 
	28 Feb 2010 12:29:52 -0800 (PST)
In-Reply-To: <hmeii7$q7e$1@dough.gmane.org>
References: <ac9c93b11002270725t46beb56dx5c4dc63c0f6485ca@mail.gmail.com>
	<20100227165600.GD30145@xora-desktop.xora.org.uk>
	<1267303607.5437.446.camel@lenovo.internal.reciva.com>
	<1267306071.9295.1.camel@trini-m4400> <hmeii7$q7e$1@dough.gmane.org>
Date: Sun, 28 Feb 2010 21:29:51 +0100
Message-ID: <ac9c93b11002281229j6ffb2960p559a0f7d7f2b957d@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.211.171
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
X-List-Received-Date: Sun, 28 Feb 2010 20:32:46 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/2/28 Koen Kooi <k.kooi@student.utwente.nl>:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> On 27-02-10 22:27, Tom Rini wrote:
>> On Sat, 2010-02-27 at 20:46 +0000, Phil Blundell wrote:
>>> On Sat, 2010-02-27 at 16:56 +0000, Graeme Gregory wrote:
>>>> NAK on creating extra levels.
>>>>
>>>> Changing the level where recipes are held is not an option do to the w=
ay
>>>> you tell bitbake how to find them.
>>>>
>>>> BBFILES =3D "${OE}/org.openembedded.dev/recipes/*/*.bb"
>>>
>>> Is that really such a big deal? =A0We seemed to manage to switch BBFILE=
S
>>> from /packages/ to /recipes/ without any major casualties, and I would
>>> have thought that adding an extra level in there would be equally
>>> straightforward. =A0Or of course, even better, the distro-specific reci=
pes
>>> could go in an overlay which the distro config would select.
>>
>> I think you've just hit on a potentially great idea. =A0Say that
>> 'openembedded' supports 'micro' and 'minimal' as two example
>> distributions. =A0Move everyone else into their own distro overlay. =A0T=
he
>> only problem with this, perhaps, is easily adding the distro overlay
>> itself into the right env vars. :(
>
> Move every distro out of OE, that way people need to set the overlays
> correctly.
>
> This does mean that we abandon the "sharing" aspect that started OE
> since every little "improvement" will be done in the distro overlay
> instead of OE.

I would expect that most of the recipes would be in the common area
(at least that is what I would encourage)
If people add fixes in their own overlay only, they also cannot
benefit any more from the improvements from others, so there is some
advantage to sharing too.

FM
>
> Maybe the u-boot custodian model would make sense for that type of scenar=
io.
>
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
>
> iD8DBQFLis2HMkyGM64RGpERAgR2AJ9/q3Xc9iYXzOnmE1DOvameXej0dACeO8eN
> 3CVU85QKVuinvK4wmN0c+lk=3D
> =3Dq0y3
> -----END PGP SIGNATURE-----
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


