Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <anders.darander@gmail.com>) id 1QMDjH-0002xi-3O
	for openembedded-devel@lists.openembedded.org;
	Tue, 17 May 2011 08:26:03 +0200
Received: by mail-fx0-f47.google.com with SMTP id 19so319255fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 May 2011 23:23:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type:content-transfer-encoding;
	bh=u3kIlUxv+X3OSj1vzvdoDglreIBynSKLA/8vVjlqhyQ=;
	b=bd6+EeDOWpfQsSCAwXYlDAfC7NkILUDHZL+x2KIfFnO2BZGXyGiMsPhvBijMmiqrUL
	xRHrkkZg5Gj5TN8kjXBsxTW8NX3UVrFcHMUeVShUvHgFMkffJVqNieQwOWgokAQ9gIKt
	pN0RxwNfpaA2AuBTxgRhPPVEKeHLYwENZ7Ui4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=ilJ4vnVgMsraKImpaQE0hjifIGmRuXICP6ACfDoWUvQa8Pv8aTf1payjEHPeq/pFVP
	RPNNrp86UbB7L7nyGAMb+8VUNuqO87UWPLJs02y47aCuFFiKitCYvbChMpVCnj6czWSu
	wM2VeyEXfphVZkytbBldDxHK2hSpc2duLteek=
MIME-Version: 1.0
Received: by 10.223.92.132 with SMTP id r4mr300306fam.142.1305613392318; Mon,
	16 May 2011 23:23:12 -0700 (PDT)
Received: by 10.223.93.206 with HTTP; Mon, 16 May 2011 23:23:12 -0700 (PDT)
In-Reply-To: <1305564582.2429.90.camel@phil-desktop>
References: <1305545218.3424.29.camel@rex>
	<BANLkTimSNvdsc1BoCk4ofNh4-nFuO5bg2A@mail.gmail.com>
	<1305564582.2429.90.camel@phil-desktop>
Date: Tue, 17 May 2011 08:23:12 +0200
Message-ID: <BANLkTimtfuCEo253ye-96xeo1dsvJgRFBw@mail.gmail.com>
From: Anders Darander <anders.darander@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: OpenEmbedded Core - Ready for extended users
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
X-List-Received-Date: Tue, 17 May 2011 06:26:03 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, May 16, 2011 at 18:49, Phil Blundell <philb@gnu.org> wrote:
> On Mon, 2011-05-16 at 14:52 +0200, Frans Meulenbroeks wrote:
>> I think the community could benefit if you add info (a pointer) in this
>> thread
>> - how to set up a build environment
>> - policies on what goes into oe-core and meta-oe and what not (and how t=
o
>> deal with things that do not go into it)

Yes, this is definitely needed. Which type of new
applications/libraries can get into meta-oe, and which are supposed to
be kept in higher layers...

In what cases can additional versions of the recipe in oe-core be
added? E.g. dbus is built using 'EXTRA_OECONF =3D "--with-x"', which at
least on head-less systems seems to be overkill. Still, it's
preferable (from my point of view) to use as much recipes as possible
from oe-core, instead of maintaining separate copy in a local layer.

>> - a migration scenario from the current repo to the new structure (what =
are
>> we doing with the existing recipes)

This is part of what I'm trying to get some time to do now. I've at
least got sofar as to get the build starting, however, before
proceeding further on, I've got to double check our local/modified
copies of a number of recipes (see e.g. the point on dbus above).

When I'm "finished" converting our distribution/repo; I might get some
time to try to write up a short text on this (unless someone already
has done this). However, this is probably a couple of weeks ahead, at
least.

>> I know some (if not all) info has been sent around over time, but I feel=
 it
>> would help if this announcement would carry the info to get people start=
ed
>> (and/or point to a web page that has the above info).

Yes, an agregated / summarized source for this info is definitely needed.

> Yes, agreed, I think that would be useful. =A0The build environment setup
> is certainly a bit different to "classic" oe and it took me a while to
> figure it out. =A0At the time there didn't seem to be much documentation
> on how that stuff was meant to work, though with hindsight I now suspect
> the Poky manual might have been the place to look.

I guess that might be right. Currently the move that I'm doing will be
quite similar to the old oe-style. I've got quite good help by
studying the angstrom setup scripts. The Poky manual seems to use a
style where other meta-layers are installed in the poky-tree, however
I prefer a layout more similar to e.g. angstrom:

own-top level
|- conf/
|- bitbake/
|- openembedded-core/
|- meta-openembedded/

or the angstrom version:
own-top level
|- conf/
|- bitbake/      // not sure on which level bitbake is kept.
\ sources/
  |- openembedded-core
  |- meta-openembedded

Such a layout makes it a lot easier to keep the top-level in a
private/public repo, just referencing the oe-core and meta-oe layers
using git submodules.

Regards,
Anders Darander


