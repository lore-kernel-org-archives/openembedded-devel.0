Received: from [209.85.220.207] (helo=mail-fx0-f207.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ricardo.salveti@openbossa.org>) id 1MOPm4-00018Y-Mm
	for openembedded-devel@lists.openembedded.org;
	Wed, 08 Jul 2009 07:32:57 +0200
Received: by fxm3 with SMTP id 3so1939318fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 07 Jul 2009 22:20:17 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.126.66 with SMTP id b2mr3053086fas.18.1247030417663; Tue, 
	07 Jul 2009 22:20:17 -0700 (PDT)
In-Reply-To: <c2a08bbd0907040026s1d7d617fg95537e865b254761@mail.gmail.com>
References: <c2a08bbd0907040026s1d7d617fg95537e865b254761@mail.gmail.com>
Date: Wed, 8 Jul 2009 02:20:17 -0300
Message-ID: <ae9c9a1c0907072220h2db6bbdan9492bab843afc8a@mail.gmail.com>
From: Ricardo Salveti de Araujo <ricardo.salveti@openbossa.org>
To: openembedded-devel@lists.openembedded.org
Subject: Re: OpenEmbedded goals?
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
X-List-Received-Date: Wed, 08 Jul 2009 05:32:59 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 4, 2009 at 4:26 AM, Mart R.<roosmaa+list@gmail.com> wrote:
> I have been exploring =C5ngstr=F6m and thus OpenEmbedded lately. The
> building process works nicely out of the box, but running it on some
> low end embedded system is out of the question because it is just too
> slow and bloated for my taste. Stripping it down is not an easy job
> either as I would have to edit countless of *.bb files.
>
> Knowing that Portage has USE flags I was interested to see why they
> haven't been implemented to at least some extent in
> BitBake/OpenEmbedded. Having found my answer [1] it still kept nagging
> me why have they not at least enabled such USE flags at distribution
> level?! Sure one can just create a new repository of metadata, but why
> duplicate all that work?

You can somehow use the USE flags in current OE, but I don't know if
it's the best way to go.

I know we already have long discussions about it at this mailing list,
but here are some problems that I think we'll have if we go to this
direction:
 - Much more hard to debug and reproduce the errors (need more
community support, and we already have a quite long list of bugs)
 - When you start to differentiate a lot at the current OE code base,
you'll have recipes that are quite long with many different options,
one for each distro or etc. In the end the reuse of the meta data is
not so good, as people start to get more used to add specific changes
than fixing and changing the meta data in a way everyone could use it.

What I see is that the current OE solution seems to be a valid base
meta data (that can be shared and used by everyone, letting the debug
easier), and most of the differentiation going when selecting the
packages and configuration for the distros.

Maybe selecting better the packages and how you use them at your
distro can help you get a better image. Of course, you could also
create overlays for specific changes if you want to change it more
than just the selection of the packages.

Cheers,
--=20
Ricardo Salveti de Araujo


