Received: from [74.125.46.153] (helo=yw-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1LlqtD-0003fV-Nm
	for openembedded-devel@lists.openembedded.org;
	Mon, 23 Mar 2009 21:36:55 +0100
Received: by yw-out-1718.google.com with SMTP id 9so1545984ywk.42
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Mar 2009 13:35:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:date:x-google-sender-auth:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=MCg5VDd+3WfFjV2KhbdaxsgQqfDFbpaHYEqbIBaCZgI=;
	b=wEnMEM3K7SQSWSdWMx5WtIpE7fkEs6zfH8PvHpAGq6qkgl37gXetsgz77XT98zyiyS
	eznILcXZ26iv7v7oQZ0FoGVdshdzDABJZuI011pG/pKxsop9gE0JYZzip80W0o/Q35ku
	rRjBRJwNVnpfxAh3e2eei2kk3LtlkHdttOP/Y=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=mnBXMG20+reTxpfNn9l2n0YmtzdVhiemXw/y3S3xIVZgsyJ5TOuCTbKdtbnwcNGHxU
	Cd0CBi5zxNUmjio/R+4fPTxheQj8CCtHjyz2vuWkF4F0RS4qRrDPAd13KoVISjf0iXbf
	FfkFIJlVF0WAS3Nqw2kAKeL5yj6c2iUqnRAnk=
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.151.106.4 with SMTP id i4mr13470798ybm.181.1237840531503; Mon, 
	23 Mar 2009 13:35:31 -0700 (PDT)
In-Reply-To: <b6ebd0a50903171218i7f5716afifd99177982b6df5b@mail.gmail.com>
References: <b6ebd0a50903171218i7f5716afifd99177982b6df5b@mail.gmail.com>
Date: Mon, 23 Mar 2009 13:35:31 -0700
X-Google-Sender-Auth: f563261751c821fa
Message-ID: <b6ebd0a50903231335y1ddfcb3bpd447b646e18d439a@mail.gmail.com>
From: Chris Larson <clarson@kergoth.com>
To: openembedded-devel@lists.openembedded.org
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
X-List-Received-Date: Mon, 23 Mar 2009 20:36:56 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 17, 2009 at 12:18 PM, Chris Larson <clarson@kergoth.com> wrote:
> I'd like to propose re-establishing MAINTAINER, set per package, to
> individuals, or left as default for packages which aren't directly
> maintained.
>
> Doing this would:
> - Facilitate dumping a list of unmaintained packages to give to new
> users wanting to volunteer to help us, but not knowing how to
> contribute.
> - Return some individual responsibility to the project, giving one
> person the blame for brokenness for that package, as well as giving
> responsibility for pushing patches upstream to that person. =C2=A0In my
> opinion, a number of the recent issues in the project are due, in
> part, to a lack of that individual responsibility. =C2=A0Everything is
> fuzzy, determined by a group, instead.
> - Allow us to physically separate, in the repository, those packages
> which get the most attention (are maintained) from those which get the
> least (maintained by the entire team). =C2=A0We could finally be *honest*
> with our users about what we work on, telling them that the packages
> which are maintained by the team are in need of an individual
> maintainer, and get less attention, so bugs there will be fixed more
> slowly, and there are no guarantees on functionality there. =C2=A0I think
> it'd be better to have a core set of *functional* recipes than have a
> huge set of "might work, might not" recipes as things stand today. =C2=A0=
In
> my opinion, this would be more likely to give new users stability than
> creating a stable branch, while making better use of our limited
> manpower, rather than increasing the load drastically.

If no one is against this, I'd say we should start taking ownership of
packages and setting MAINTAINER in the recipes, after ensuring that
the packaging code won't put MAINTAINER into the packages.

Unless someone else wants them, as a start, I'd be willing to take
autoconf, automake, libtool, and perhaps autotools.bbclass, though
there's no good mechanism to record that.
--=20
Chris Larson
clarson at kergoth dot com
clarson at mvista dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Software Engineer
MontaVista Software, Inc.


