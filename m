Received: from [202.173.155.195] (helo=birgitte.twibble.org)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <lenehan@twibble.org>) id 1HyeIf-0002oS-AK
	for openembedded-devel@lists.openembedded.org;
	Thu, 14 Jun 2007 03:39:02 +0200
Received: from localhost (localhost.localdomain [127.0.0.1])
	by birgitte.twibble.org (Postfix) with ESMTP id 2384B10D69F;
	Thu, 14 Jun 2007 11:35:55 +1000 (EST)
Received: from birgitte.twibble.org ([127.0.0.1])
	by localhost (birgitte [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 27553-03; Thu, 14 Jun 2007 11:35:54 +1000 (EST)
Received: from nynaeve.twibble.org (nynaeve.twibble.org [202.173.155.194])
	by birgitte.twibble.org (Postfix) with ESMTP id A959110D69E;
	Thu, 14 Jun 2007 11:35:54 +1000 (EST)
Received: by nynaeve.twibble.org (Postfix, from userid 500)
	id 6F814B70149; Thu, 14 Jun 2007 11:35:54 +1000 (EST)
Date: Thu, 14 Jun 2007 11:35:54 +1000
From: Jamie Lenehan <lenehan@twibble.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20070614013553.GA4558@twibble.org>
References: <4665CF19.2030501@dominion.kabel.utwente.nl>
	<ae36f8040706051806q120be1bdyae9da9c8f754ab59@mail.gmail.com>
	<4666520C.8060000@dominion.kabel.utwente.nl>
	<4666576A.9030608@dominion.kabel.utwente.nl>
	<ae36f8040706060937la8400adr2f98d7db547a2664@mail.gmail.com>
	<ae36f8040706061036i3662ee38x104bb1896550b64@mail.gmail.com>
	<ae36f8040706061143o47650436we993cf24bd807174@mail.gmail.com>
	<ae36f8040706071545i772205b2m85d251b45c7f26d7@mail.gmail.com>
	<20070613123908.GA19284@twibble.org>
	<ae36f8040706130931r4e81a08bi8ca10417336df3b5@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <ae36f8040706130931r4e81a08bi8ca10417336df3b5@mail.gmail.com>
User-Agent: Mutt/1.5.12-2006-07-14
X-Virus-Scanned: by amavisd at twibble.org
Subject: Re: problems doing bitbake task-base
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 14 Jun 2007 01:39:02 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 14, 2007 at 02:32:47AM +1000, "Lu=EDs Cargnini" wrote:
> So what you are telling me is this perl is been compiled to run over my=
 host
> machine ?

Yes.

> So it is not been cross-compiled for my target ?

THe perl build system uses itself during the build. Obviously it
can't use itself when built for the target. So we have to build perl
first and then trick the perl build into using parts of the native
build while trying to cross-compile for the target (shared
libraries).

So anything perl related *always* (including any perl modules) always
needs to compile the native version first before the verison for the
target.

[...]
> just put it as a pre-requisite for OE installation !
> my perl --version of gentoo installed version:
> enterprise ~ # perl --version

We can't use the host perl because we need both the native and target
versions to match - this means not just version numbers but
*everything*, every option and every installed module.

Also while you have have the same verison of perl there's no
guarantee that this would be the case.

[...]
--=20
 Jamie Lenehan <lenehan@twibble.org>


