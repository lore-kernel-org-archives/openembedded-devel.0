Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PCrcH-00022q-9n
	for openembedded-devel@lists.openembedded.org;
	Mon, 01 Nov 2010 11:27:54 +0100
Received: by iwn42 with SMTP id 42so6342625iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 01 Nov 2010 03:27:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=dWLO7iEkecEzIu2oTZYbj/FDvQ3Bu47ibGMIhKYQzSw=;
	b=SSOvU79JkAceyD3SDbkk5p4WWxV/MfrnzRzzzjkTmdjnMMzPhG9ndN8pqvHU/j2lE6
	vkYCHujjOq+ZBPxjxTqH7RLinLo2/3xZYBf2p8Crg9lM69K4SLODa/fC/yen6ZFggNt0
	Tky7amKe6LPQuSpdFSgAWHpO68hy8Qys7UMRU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=X7XIonN+GytohaOqOQPgxqiIf70rLQ2ox9oge+/uYocHsgt6uSF1xfum8JDXe0RKIQ
	UcDw6hyhq7PWqmF6rLdlPRM6XLI1tIj4zS7D/7MZZasJpK1yAB12CqT5956DJ9pvisxT
	IlXl5fLOjD8D3lQjVNjK+jdAVO+CYWhbHIlOg=
MIME-Version: 1.0
Received: by 10.42.225.131 with SMTP id is3mr2116530icb.2.1288607223052; Mon,
	01 Nov 2010 03:27:03 -0700 (PDT)
Received: by 10.231.40.13 with HTTP; Mon, 1 Nov 2010 03:27:03 -0700 (PDT)
In-Reply-To: <ialv3j$7nq$1@dough.gmane.org>
References: <AANLkTin70=KBJDjW8K6ViS5X03ZaE92680oR88hhy9eK@mail.gmail.com>
	<AANLkTimEKL_6r_DZmq_W2i9eqHPgbRFc-oFMftKNFBJv@mail.gmail.com>
	<iakpd7$ja7$1@dough.gmane.org>
	<AANLkTikmqiDqWpHS=K73N8z6a0VPU8k7zMCP7yrb=G-Y@mail.gmail.com>
	<ialv3j$7nq$1@dough.gmane.org>
Date: Mon, 1 Nov 2010 11:27:03 +0100
Message-ID: <AANLkTimpD7qUE5DPJuoWVaAfZ9cChZpNn+fYp=XmfPDN@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: testing branch 2010-10-29
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
X-List-Received-Date: Mon, 01 Nov 2010 10:27:54 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/11/1 Koen Kooi <k.kooi@student.utwente.nl>:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> On 01-11-10 08:49, Frans Meulenbroeks wrote:
>
>> PS: a few comments wrt the libcdio issue:
>>
>> - it would have been nice if this was discussed with the recipe
>> maintainer. This is in accordance with our commit policy [2, 4th
>> block]. I strongly doubt that this has happened (and apologies if this
>> is a faulty assumption).
>
> Since I'm not sure if you're getting at the fix or breakage, I will talk
> about the breakage commit:
>
> I don't tend to discuss things with myself since it creeps people out :)

:-)

The confusion was caused by the fact that this one:
http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=3D92e23e98bdb=
d1bdacb23f5d2c848159cbab6d057
touches both libcdio.inc and libcddb_1.3.2.bb
In the latter one you removed among others:
-MAINTAINER =3D "Andreas Frisch <andreas.frisch@multimedia-labs.de>"

Have the changes in that file been discussed with Andreas ?

Also the libcdio 0.82 recipe was added by Khem on sep 30:
http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=3Dc5a25043727=
3e98fd66a13cfa6f5088b9ae68a97
because 0.81 was not cross-compile safe, after which Andreas made some
improvements to it.
The MAINTAINERS file also does not list you as maintainer for this
recipe. Guess this is a good case why it is useful to list the
maintainer in the recipe.

Anyway that (and the fact that we are poor on ACK-ing recipes) caused
me to push Andreas' patch (after verifying that it builds).

> I created the cdio recipe myself in 2009 and pushed in januari 2010.
> The funny thing is that all the breakage occured by this:
>
> http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=3Db672b28ba=
6a29e2715c91fcbbda8b2776b6f1105
>
> That commit has no ACKs so SOBs from me, so I wonder why it went in.

As explained above because you were not identified as the maintainer
as you did not write or push the 0.82 recipe and are not listed as
such in the MAINTAINERS file.

And (unrelated to this issue) I do not see the same prudence you
expect from others when you modify recipes that are maintained by
others.
"Do unto others as you would have them do unto you"

>
>> (btw: a good place would probably be [3] and yeah, I am aware of the
>> debian renaming [4], but I am also aware of [5] which as an example
>> says:
>> FILES_${PN} =3D "\
>> =A0 =A0 ${bindir}/* \
>> =A0 =A0 ${sbindir}/* \
>> =A0 =A0 ${libexecdir}/* \
>> =A0 =A0 ${libdir}/lib*.so.* \
>> =A0 =A0 .....
>> which was exactly what was in the original commit [6]:
>> +FILES_${PN} =3D "${libdir}/lib${PN}${SOLIB}"
>
> But there's no file called liblibcdio.so.x.y, only libcdio.so.x.y. The
> original recipe already had a way to split all the libs automatically.

That code was still there.

+python populate_packages_prepend () {
+ glibdir =3D bb.data.expand('${libdir}', d)
+ do_split_packages(d, glibdir, '^lib(.*)\.so\..*', 'lib%s',
'gstreamer %s library', extra_depends=3D'', allow_links=3DTrue)
+}

Not sure how well it applies with the FILES_${PN} breakage.

On a personal note:
I feel that python functions like this,  clever as they are, do
severely reduce the understandability and maintainability of the
recipe.
Not everybody is a python wiz. I feel recipes should be easy to
understand for the average developer.
Personally I would prefer just iterating the files in a FILES* assignment.
That makes things so much better understandable (and yes if a new file
is added in a newer version of the recipe it will not be added
automagically. However there will be a note to warn that the new file
is not packaged)

>
> Thankfully the incremental angstrom autobuilder caught that issue and
> was fixed shortly after.

Which is good :-)

Frans.

PS: since you are so concerned about libcdio, would you please fix the
dependencies or the configure.
configure --help says
...
  --enable-cddb           include CDDB lookups in cd_info (default enabled)
  --enable-vcd-info      include Video CD Info from libvcd
...

Seems like whatever is build depends on whether libcddb is build before or =
not.
Andreas fixed that by adding a dependency on libcddb, but you undid
that in http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=3D92e=
23e98bdbd1bdacb23f5d2c848159cbab6d057

And while you're at it perhaps add in the MAINTAINERS file that you
are the maintainer of this recipe.


