Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>)
	id 1PeqoU-0000yx-PS; Mon, 17 Jan 2011 16:16:10 +0100
Received: by wyb40 with SMTP id 40so5296808wyb.6
	for <multiple recipients>; Mon, 17 Jan 2011 07:15:33 -0800 (PST)
Received: by 10.227.24.73 with SMTP id u9mr4232556wbb.168.1295277333075;
	Mon, 17 Jan 2011 07:15:33 -0800 (PST)
Received: from [172.20.1.5] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id
	f35sm3407529wbf.20.2011.01.17.07.15.32
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 17 Jan 2011 07:15:32 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1082)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1295027350.14388.6527.camel@rex>
Date: Mon, 17 Jan 2011 16:15:31 +0100
Message-Id: <66D446A4-9D34-4AF2-B94E-42AF65F57316@dominion.thruhere.net>
References: <1295027350.14388.6527.camel@rex>
To: openembedded-members@lists.openembedded.org
X-Mailer: Apple Mail (2.1082)
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: Yocto Project and OE - Where now?
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
X-List-Received-Date: Mon, 17 Jan 2011 15:16:11 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 14 jan 2011, om 18:49 heeft Richard Purdie het volgende geschreven:

> The vote result showed a strong opinion that Yocto and OE need to find =
a
> way to work together which is something I'm very happy to see. I think
> everyone is waiting for each other to make a move so I'm going to put
> forward some ideas/discussion to try and start the ball rolling. I'm
> filling out ideas here but I want to make it clear this is a straw-man
> to discuss. I have given this a lot of thought though as its attention
> to many of the details that will determine its success.
>=20
> The agreement for OE to take up a seat on the Yocto Steering Group =
seems
> to be progressing and I think that part of things is moving forward =
well
> and the board is handling it. At a technical level we need to have =
some
> discussion though.
>=20
> I think the idea in people's minds is to create an "openembedded-core"
> which would have a new development structure. There are various aims =
for
> doing this but they include:
>=20
> * Formalising processes for making changes
> * Creation of a subset of metadata that has a consistent high quality=20=

>  standard:
>    - removal of legacy components (pkgconfig hacks, libtool hacks,=20
>      legacy staging, unneeded compiler arguments)
>    - consistent metadata layout, spacing, use of variables
>    - migration away from outdated practises (e.g. use BBCLASSEXTEND)
> * Formalise cycles of development, stabilisation and release
> * Ensure a form of standardised basic testing of changes and over =
time,=20
>  extend that testing
>=20
> We've talked about doing this at OEDEMs in the past, we keep talking
> around the issue, we now have an opportunity to attempt it and to make
> it a success. Part of the problem was always manpower to undertake =
some
> of it, Yocto gives us a mechanism to help with that.
>=20
> What would we have to do to make that happen? Roughly speaking I think
> the steps look like:
>=20
> * Agreed to try a new contributions model
> * Setup an openembedded-core repo
> * Populate that repo with some base data
> * Decide where OE core patches would be queued, discussed and =
processed
> * Document the process
> * Start using it
> * Profit!

I think we can start with the following right now:

* setup an oe-core repo
* populate that repo

What I propose to do in parallel to that:

* setup oe-yocto-integration mailinglist
* people interesting in *working*[1] on the integration may subscribe
* hook that ml up to patchwork as a new project

That only leaves:

* contributions model discussion
* patch processing discussion
* documentation
* profit

> For OE, we've talked about cleaning it out for a long time and I think
> meta-openembedded is the solution there with some cleanup happening as
> people transition the recipes they use.

Apart from the weird pythondir() problem that came up last week, =
meta-openembedded is working quite well as layer on top of yocto. It =
would be nice to see more people contribution to it, though.

[snip]

> One other question also springs to mind which is what is the TSC's =
remit
> in this new contribution mode

As we discussed during OEDEM, the TSC needs to go through an election =
cycle to get some new people on. The current TSC is opaque, =
non-responsive and out of touch. I'm not sure a new election is going to =
help fix that, but it's worth a try.

> Ultimately, I think the only way we're going to move forward with this
> is to actually try something.

So lets get started!


[1] Lots of people have love to suggest colours for the bikeshed, but =
few people actually want to do actual painting=


