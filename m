Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1NuX4P-0006DM-EA
	for openembedded-devel@lists.openembedded.org;
	Wed, 24 Mar 2010 21:20:57 +0100
Received: by gyb11 with SMTP id 11so740343gyb.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Mar 2010 13:17:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=lRtfu2ekAKHR+xbSRrW9qLnQTYtnRg7NF55t98g7OwQ=;
	b=YZBUraNulej+DUmZaSTIHatjUyXPqKooDWwGrpZIlyeezkDD1MymUdKR+BUNc+pjLz
	oaWch0B6ENF/LoOnFDOPAWRaeeMAvPuDBmjApW101zrtH1hSzMV8tkKRJj+zcUZo7Urk
	ruprzege2UcQXzHFjk+vsnPppXsGppv4D9NQc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=q/fARq7DYJCIPx98o813aTdHVel8csf3PA2t+v3fYVEilNnKYlrgQY+owBnOyAWdeS
	rvBcypgXsm+nX+DBSNyF4ebDTeU7Ae9z5zCGt00qISLnaQMWBons5lNk8ayO33v36P3q
	u+pJGnRUJP6OY/bSG4pylRgsxBJxfZ/BMx0jg=
MIME-Version: 1.0
Received: by 10.101.155.13 with SMTP id h13mr2634692ano.14.1269461863058; Wed, 
	24 Mar 2010 13:17:43 -0700 (PDT)
In-Reply-To: <b6ebd0a51003240851i3f91860ia1100c4677569cf6@mail.gmail.com>
References: <1269437224.1681.134.camel@rex>
	<ac9c93b11003240815o796152a7y50601b03e91be40@mail.gmail.com>
	<b6ebd0a51003240851i3f91860ia1100c4677569cf6@mail.gmail.com>
Date: Wed, 24 Mar 2010 21:17:43 +0100
Message-ID: <ac9c93b11003241317y2f6a6bbbs78936ee603d8ce3b@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.160.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Checksums in Bitbake
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
X-List-Received-Date: Wed, 24 Mar 2010 20:20:57 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/3/24 Chris Larson <clarson@kergoth.com>:
> On Wed, Mar 24, 2010 at 8:15 AM, Frans Meulenbroeks <
> fransmeulenbroeks@gmail.com> wrote:
>
>> Interesting ideas.
>> I need to let this digest a little =A0bit.
>>
>> Some initial thougths
>> The checksum should also depend on the checksum of the underlying
>> packages. E.g. if A depends on B and the checksum of B changes it
>> should trigger a rebuild of A.
>>
>
> I don't think this is a very good idea, personally. =A0As an option, perh=
aps,
> but we do things the way we do for a reason, just because a dep of mine i=
s
> rebuilt doesn't automatically require that I be rebuilt. =A0I'd suggest m=
oving
> to an alternative which encodes the library ABI and incorporates that int=
o
> the hashes of things that depend upon it, but we can certainly do what yo=
u
> want as an optional feature.

If a dep is rebuild there is a reason for it (bug fix, packaging
changed, changes in exported files etc etc).
This might impact the using recipe.
If baking a file does not result in a rebuild when a dependency is
changed, probably a warning should be given.

Encoding the library ABI is only part of the job. You'd also have to
take the .h files a package exports into account as constants in it
could be changed.
And even the using package could change its behaviour (e.g. because
configure runs differently).
Note also that if we abandon PR we do not really have an easy
mechanism to force recompilation of a package (if a depenency changed
and we want to force a rebuild).

>
> A first crude approach would be to have a hash of the concatenation of
>> the unfolded recipe (so with all includes/requires expanded) and the
>> hashes of the recipes it depends on). Of course this is very rough as
>> even changing whitespace in a recipe will lead to a recompile.
>> A different approach would be to let it depend on PV + PR. That'll put
>> the developer in control (with all related issues, like the developer
>> not bumping PR).
>> And yet a different one would be to use variables and functions from the
>> recipe.
>>
>> I have mixed feelings on whether checksums also would depend on global
>> vars (e.g. code generated by the classes or variables in e.g.
>> local.conf).
>> On the one hand it seems pretty neat, on the other hand I worry about
>> performance (calculating the checksum).
>>
>
> Global variables should absolutely be included, imo. =A0The reason for go=
ing
> with a blacklist rather than a whitelist approach is to, as richard says,
> make it less error prone. =A0It ensures that the failure mode is somethin=
g
> being rebuilt, rather than using possibly incorrect binaries. =A0I'd rath=
er it
> take a bit longer to build than result in questionable output. =A0If
> calculating the checksum time becomes a concern, which I doubt, you could
> hash the configuration metadata at ConfigParsed time and incorporate that
> hash into the hash generated of the recipe. =A0This could increase the
> likelihood of collisions, but I'm not too worried. =A0Let's get things
> working, and determine the bottlenecks at that point.

Agree, but as changes in vars are less likely we could consider having
something to DISTRO_PR.
My nightmare is that if I am going to build console-image (about 3000
tasks) that it goes to check 3000 times if my TMPDIR is not changed.
Some caching will definitely be needed

(btw if we have a checksum per file and have a rule that if the
checksum is newer than the file, it is ok and need not be recomputed
that could help, but it might bring back some of the issues we now
have with stamp).

Frans
> --
> Christopher Larson
> clarson at kergoth dot com
> Founder - BitBake, OpenEmbedded, OpenZaurus
> Maintainer - Tslib
> Senior Software Engineer, Mentor Graphics
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


