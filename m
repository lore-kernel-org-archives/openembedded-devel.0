Received: from mail-vb0-f50.google.com ([209.85.212.50])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1U7XNQ-0002rU-4W
	for openembedded-devel@lists.openembedded.org;
	Mon, 18 Feb 2013 21:31:52 +0100
Received: by mail-vb0-f50.google.com with SMTP id ft2so3798269vbb.9
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Feb 2013 12:15:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:content-type;
	bh=uEz4JpGKX1K9L9FZG6cMQx9uuWA5WGF97jukvHe/D2o=;
	b=PeWGQQIcZfs1zAhnxGvfTBf0ZbECiFYmvurWppi73kTcojZ7g9wvz5fEsCgg1SGJtK
	m97cq3u6wM5FJSNA7AJSMF3LWpvNdRfifmqNMocHU+lGT/QNVhGf6AX2JhndYR0tpGSc
	OkMO3m9TeKGb9ahqndrooSEBUK8DpYF1bQvYZsq31GQej1aM1QadPrIKA0aJkQyRTCoo
	R+wRp7dznrkF4fZKK1xSTEtSFze4obVSHrXbKOK5i+45JIfgQ4RIA1Qg8NYTIcB7vy2B
	ImVWSHghNeMmUa13o+CJZ5HOWHJJS7W1nowCIZZ8cH1RILmPvuya1V61IcE03aulSoZL
	N0/Q==
MIME-Version: 1.0
X-Received: by 10.52.65.147 with SMTP id x19mr15365611vds.27.1361218543504;
	Mon, 18 Feb 2013 12:15:43 -0800 (PST)
Received: by 10.52.185.168 with HTTP; Mon, 18 Feb 2013 12:15:43 -0800 (PST)
In-Reply-To: <20130218185446.19879.81595@hoothoot>
References: <20130218094145.29630.63354@hoothoot>
	<CAPESJy7YAk9vj56pPkATdJO95xv8gwysyRyA9vyEq5YX-MyD=Q@mail.gmail.com>
	<20130218142026.7849.12017@hoothoot>
	<CAPESJy5Rox_qo+g6T1j0dT0uZ_ZaUyHmZSk8hdwZZDRSh0=UzA@mail.gmail.com>
	<20130218165351.14989.14162@hoothoot>
	<CAF6bG8dwjBY-bQnb8oBRXFZqoK9NzA+T2RGd+=qe0ffZhgKkRA@mail.gmail.com>
	<20130218185446.19879.81595@hoothoot>
Date: Mon, 18 Feb 2013 21:15:43 +0100
Message-ID: <CALbNGRRMEer3+UQN4OsO5zm7tsv7U+BQRH8wHY8yYNVKVw_mHg@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: build dependency cycles in openembedded
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
X-List-Received-Date: Mon, 18 Feb 2013 20:31:53 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Feb 18, 2013 at 7:54 PM, Johannes Schauer <j.schauer@email.de> wrote:
> Hi,
>
> Quoting Marko Lindqvist (2013-02-18 18:22:26)
>> OE has both native build and cross-compile part, and problems can arise in
>> native part too. One example is that pkg-config version used has not been
>> updated for a while since build of newer version would depend on glib, which
>> needs pkg-config to build...
>
> Great example! The same loop exists in binary distributions. Though there it is
> a bit more involved since the notion of binary and source packages exists.
> Therefor the loop you mention is not between the pkg-config and glib source
> packages but between the pkg-config source package and the glib development
> headers binary package libglib2.0-dev. So while the glib source package can be
> built without pkg-config if ./configure is called with manually supplied
> arguments like this:
>
>     ./configure \
>         PKG_CONFIG=false \
>         ZLIB_CFLAGS=-I/usr/include ZLIB_LIBS="-L/usr/lib -lz" \
>         LIBFFI_CFLAGS=-I/usr/include LIBFFI_LIBS="-L/usr/lib -lffi" \
>         --disable-libelf \
>         --with-pcre=internal
>
> The dependency loop does still exist because the binary package libglib2.0-dev
> can only be installed if the pkg-config binary package exists. But the
> pkg-config binary package can only be built from the pkg-config source package
> using the uninstallable libglib2.0-dev binary package....
>
> So while it is good to hear an example for a dependency cycle in OpenEmbedded,
> I now wonder why I didnt find more instances where those impact the development
> and deployment of the OpenEmbedded distribution for new platforms?
>
> cheers, josch
>
FWIW long time ago in meta-oe commit
5b8522e3b592c96ec9325aff4bbaa68972e52d5b gvfs-gdu-volume-monitor was
spitted out into an own recipe to break dependency loop for gvfs.

Andreas


