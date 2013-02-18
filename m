Received: from mout.web.de ([212.227.15.4])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <j.schauer@email.de>) id 1U7WBz-0000yX-67
	for openembedded-devel@lists.openembedded.org;
	Mon, 18 Feb 2013 20:16:02 +0100
Received: from localhost ([212.201.44.247]) by smtp.web.de (mrweb003) with
	ESMTPSA (Nemesis) id 0MAvFE-1TzmcN0sU8-00Abwn for
	<openembedded-devel@lists.openembedded.org>;
	Mon, 18 Feb 2013 19:54:47 +0100
MIME-Version: 1.0
From: Johannes Schauer <j.schauer@email.de>
User-Agent: alot/0.3.3+
To: openembedded-devel@lists.openembedded.org
References: <20130218094145.29630.63354@hoothoot>
	<CAPESJy7YAk9vj56pPkATdJO95xv8gwysyRyA9vyEq5YX-MyD=Q@mail.gmail.com>
	<20130218142026.7849.12017@hoothoot>
	<CAPESJy5Rox_qo+g6T1j0dT0uZ_ZaUyHmZSk8hdwZZDRSh0=UzA@mail.gmail.com>
	<20130218165351.14989.14162@hoothoot>
	<CAF6bG8dwjBY-bQnb8oBRXFZqoK9NzA+T2RGd+=qe0ffZhgKkRA@mail.gmail.com>
In-Reply-To: <CAF6bG8dwjBY-bQnb8oBRXFZqoK9NzA+T2RGd+=qe0ffZhgKkRA@mail.gmail.com>
Message-ID: <20130218185446.19879.81595@hoothoot>
Date: Mon, 18 Feb 2013 19:54:46 +0100
X-Provags-ID: V02:K0:AaXGcmSMjjU2idIpC2YC7wwUJ99uPU/RWRR/GPHy1px
	j8chEq2ms3GVOxQTbCJFVWN5fr419XZsznRgoSrDUgTiYol2AP
	J1n6iVhJXmwWJoAcLSEhPPOqvmJZBTDtG/Ugb/R/K6U1tHKRQ+
	sm6A8muZ12ksKHe1ngafD+4NJ65x8NRXfxlNa7sICZ9Bgu2qWn
	dlMBkxdfNjIyodCAWUntw==
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
X-List-Received-Date: Mon, 18 Feb 2013 19:16:02 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Quoting Marko Lindqvist (2013-02-18 18:22:26)
> OE has both native build and cross-compile part, and problems can arise in
> native part too. One example is that pkg-config version used has not been
> updated for a while since build of newer version would depend on glib, wh=
ich
> needs pkg-config to build...

Great example! The same loop exists in binary distributions. Though there i=
t is
a bit more involved since the notion of binary and source packages exists.
Therefor the loop you mention is not between the pkg-config and glib source
packages but between the pkg-config source package and the glib development
headers binary package libglib2.0-dev. So while the glib source package can=
 be
built without pkg-config if ./configure is called with manually supplied
arguments like this:

    ./configure \
        PKG_CONFIG=3Dfalse \
        ZLIB_CFLAGS=3D-I/usr/include ZLIB_LIBS=3D"-L/usr/lib -lz" \
        LIBFFI_CFLAGS=3D-I/usr/include LIBFFI_LIBS=3D"-L/usr/lib -lffi" \
        --disable-libelf \
        --with-pcre=3Dinternal

The dependency loop does still exist because the binary package libglib2.0-=
dev
can only be installed if the pkg-config binary package exists. But the
pkg-config binary package can only be built from the pkg-config source pack=
age
using the uninstallable libglib2.0-dev binary package....

So while it is good to hear an example for a dependency cycle in OpenEmbedd=
ed,
I now wonder why I didnt find more instances where those impact the develop=
ment
and deployment of the OpenEmbedded distribution for new platforms?

cheers, josch


