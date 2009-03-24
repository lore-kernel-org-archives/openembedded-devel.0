Received: from [74.125.46.152] (helo=yw-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1Lm8GI-0002DI-Me
	for openembedded-devel@openembedded.org; Tue, 24 Mar 2009 16:09:54 +0100
Received: by yw-out-1718.google.com with SMTP id 9so2085863ywk.30
	for <openembedded-devel@openembedded.org>;
	Tue, 24 Mar 2009 08:08:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:date:x-google-sender-auth:message-id:subject:from:to:cc
	:content-type:content-transfer-encoding;
	bh=IhL4K2sASYGg1PugEmeZmp6QOZgf9bZ4l/vkAJROsG8=;
	b=Z/xpHtokIgXHoBpX0jYrJHgpLVQsyyVwyYJflxvFby2q64+9loN4q4NWcK/+kAfA+z
	t9U74KzNNVMvpOwHArX68ouBruzJ8NE0nd8aczqCT7bHGkLbja2tWVHuVP30aXbG6YIe
	N8CsnWlCslI6wKM2NtdSqUbtv7zVDp97+IhFQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	b=NHZMlqaLFW4eMWtT4+9xpE5e5LRYfm5d4FIVEFq4ukfDVC4lfpLPSIw+uNqZg2kblN
	Tfq0/pIQz1+BljyZLaYTpQRhF6CUvsfKALeJBoKK9N95hz2afMpUDFCSpYFKLXqGlPNw
	SFrcoFySaB6655nvMI7XXdX757MJ0xok0kdNo=
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.151.110.9 with SMTP id n9mr15179165ybm.9.1237907305559; Tue, 
	24 Mar 2009 08:08:25 -0700 (PDT)
In-Reply-To: <1237885606.5348.8.camel@dax.rpnet.com>
References: <b6ebd0a50903171218i7f5716afifd99177982b6df5b@mail.gmail.com>
	<b6ebd0a50903231335y1ddfcb3bpd447b646e18d439a@mail.gmail.com>
	<1237885606.5348.8.camel@dax.rpnet.com>
Date: Tue, 24 Mar 2009 08:08:25 -0700
X-Google-Sender-Auth: 6964b9fffd3b772c
Message-ID: <b6ebd0a50903240808p4e07c61g6a088df634e161b2@mail.gmail.com>
From: Chris Larson <clarson@kergoth.com>
To: openembedded-devel@lists.openembedded.org
Cc: openembedded-devel@openembedded.org
Subject: Re: Package Maintenance
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
X-List-Received-Date: Tue, 24 Mar 2009 15:09:55 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 24, 2009 at 2:06 AM, Richard Purdie <rpurdie@rpsys.net> wrote:
> On Mon, 2009-03-23 at 13:35 -0700, Chris Larson wrote:
>> On Tue, Mar 17, 2009 at 12:18 PM, Chris Larson <clarson@kergoth.com> wro=
te:
>> > I'd like to propose re-establishing MAINTAINER, set per package, to
>> > individuals, or left as default for packages which aren't directly
>> > maintained.
>> >
>> > Doing this would:
>> > - Facilitate dumping a list of unmaintained packages to give to new
>> > users wanting to volunteer to help us, but not knowing how to
>> > contribute.
>> > - Return some individual responsibility to the project, giving one
>> > person the blame for brokenness for that package, as well as giving
>> > responsibility for pushing patches upstream to that person. =C2=A0In m=
y
>> > opinion, a number of the recent issues in the project are due, in
>> > part, to a lack of that individual responsibility. =C2=A0Everything is
>> > fuzzy, determined by a group, instead.
>> > - Allow us to physically separate, in the repository, those packages
>> > which get the most attention (are maintained) from those which get the
>> > least (maintained by the entire team). =C2=A0We could finally be *hone=
st*
>> > with our users about what we work on, telling them that the packages
>> > which are maintained by the team are in need of an individual
>> > maintainer, and get less attention, so bugs there will be fixed more
>> > slowly, and there are no guarantees on functionality there. =C2=A0I th=
ink
>> > it'd be better to have a core set of *functional* recipes than have a
>> > huge set of "might work, might not" recipes as things stand today. =C2=
=A0In
>> > my opinion, this would be more likely to give new users stability than
>> > creating a stable branch, while making better use of our limited
>> > manpower, rather than increasing the load drastically.
>>
>> If no one is against this, I'd say we should start taking ownership of
>> packages and setting MAINTAINER in the recipes, after ensuring that
>> the packaging code won't put MAINTAINER into the packages.
>>
>> Unless someone else wants them, as a start, I'd be willing to take
>> autoconf, automake, libtool, and perhaps autotools.bbclass, though
>> there's no good mechanism to record that.
>
> Can we use something other than the MAINTAINER variable? The package
> classes inject that value into the packages and that is really something
> that should be set by the distribution. I'd don't want to end up back in
> the position where that variable doesn't have a clear meaning.
>
> It was also intended that the Maintainers file we added when MAINTAINERS
> were removes would replace these variables in individual recipes. That
> file format was designed to be machine readable so someone could have
> written a script to find out who maintained a class/.bb/.conf file. This
> has the advantage that is can handle .bbclass file maintainership which
> is an issue with the MAINTAINERS variable...

Well, that works too, I don't particularly care how we do it, as long
as we do it :)  Is the Maintainers file actually being maintained? ;)
--=20
Chris Larson
clarson at kergoth dot com
clarson at mvista dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Software Engineer
MontaVista Software, Inc.


