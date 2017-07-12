Return-Path: <liu.ming50@gmail.com>
Received: from mail-vk0-f48.google.com (mail-vk0-f48.google.com
	[209.85.213.48])
	by mail.openembedded.org (Postfix) with ESMTP id 9132F77CC2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Jul 2017 03:44:51 +0000 (UTC)
Received: by mail-vk0-f48.google.com with SMTP id f68so2513214vkg.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Jul 2017 20:44:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=+VRYarlUQb4MYAZt7Tt6KJCOQNmjBE8Z0Gn/CvB8MUQ=;
	b=sdqIsfjDUpF854+bQgYtR4qKZj2HYkiXdFbMxpOd3rcIXIQjemj8p2DVn43KSHs4/W
	i4w0izuuGKdX1A4CEnzRhf8Ky/JXwaVl8mBgBGOl0YLiRjEOSlODuhn2bmyoVbSSpbOj
	x4L53R3UzxfB+YYbFyfOzfi7OzqT132dTQN/nhnpdk05dYkBhGZTM39XnYOHliIctBDE
	smkMxl9+y1HQd03sRY/+FIxgJiI8oHWWs2QECY4Ii6abByEdtmlSOsuysyEvCiaU9SKz
	mdkIoYgRXgeZ38bsYYYz99KCRz1lUS/8HVM9QumEINdfExLhRqEwEwgucxwOTsc5z8WE
	JO7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=+VRYarlUQb4MYAZt7Tt6KJCOQNmjBE8Z0Gn/CvB8MUQ=;
	b=ZOv+3+ciuTk5CyBlxa3t+YdPIRR9LRx2SL6BMkDoP+YKgZb0/MmWPnxBDtrEkrjAzR
	6N3EsTkxDWBP/wwrhFyj07V02M/cWl4jH2qeOZ5iFE12kgI3VPqRXqo8+Xjsg7BpJ4Rv
	UZIJRoOSG3iub1Q0Hxe6LmmQUk898MpcoXlFc74sTpPrujsDi5RS/JvGrzbZBvaBEtJB
	aAWNmUtF3Sv+owPp4hpCj3hf8bUXA2Qv8dx6Yk6JbFohD+fr4r6Tn/xK7oX9azVXWHcF
	ZwnBDbZoCk9+SX99BbPgYMnwggu0ScWVcSz3SrVUQEmMUGD+g8kvuZMJ7/kdGnKQhX7k
	saJA==
X-Gm-Message-State: AIVw113kmiE+oISfUcpKnk7J0OcxChfDB6dxzIYulOefzSFtzXHDpkq0
	vK87tPLT5bi7CdgKw67PT8KZJGlxrg==
X-Received: by 10.31.230.66 with SMTP id d63mr210950vkh.10.1499831092368; Tue,
	11 Jul 2017 20:44:52 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.78.91 with HTTP; Tue, 11 Jul 2017 20:44:51 -0700 (PDT)
In-Reply-To: <0A125451-F862-48AD-8905-27348AFEFB0E@linux.intel.com>
References: <1499791478-2407-1-git-send-email-liu.ming50@gmail.com>
	<1499791478-2407-4-git-send-email-liu.ming50@gmail.com>
	<18D3A338-C9CF-4313-A570-DB325E456160@linux.intel.com>
	<CALatG=4gZNNnL66_8zepakvwvy2J9snr2k3Y0hiYQNAoSFM_Ew@mail.gmail.com>
	<0A125451-F862-48AD-8905-27348AFEFB0E@linux.intel.com>
From: Ming Liu <liu.ming50@gmail.com>
Date: Wed, 12 Jul 2017 05:44:51 +0200
Message-ID: <CALatG=41hQ1ZgkROHNM-s+bhgKNeDprAp4UaucVYx_nPBbE_bw@mail.gmail.com>
To: Tim Orling <timothy.t.orling@linux.intel.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: Ming Liu <peter.x.liu@external.atlascopco.com>,
	openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe/meta-perl] [PATCH 3/8] libterm-readkey-perl: add recipe
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 12 Jul 2017 03:44:51 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, TIm:

I also had considered splitting po4a perl modules to a sub package to
follow perl module naming scheme, but I finally decided to use the same
package naming as it is on debian/ubuntu distributions(just a single main
package named po4a), which I think is easier to be maintained/understood by
developers/users, especially for those who are comfortable with debian
systems.

//MIng Liu

2017-07-12 4:51 GMT+02:00 Tim Orling <timothy.t.orling@linux.intel.com>:

>
> On Jul 11, 2017, at 7:07 PM, Ming Liu <liu.ming50@gmail.com> wrote:
>
> Hi, Tim:
>
> po4a is providing some perl modules and also some normal binaries, and
> it's named as "po4a" on debian/ubuntu distributions as well, that's why I
> did not take po4a-perl as its name, shouldn't we let it have a identical
> name as debian distributions have, to follow debian naming?
>
>
> In that case the po4a recipe is unclear and too simple. I would expect to
> see the libraries broken out into a sub package which does follow Debian
> naming. There is nothing in the recipe or commit message to indicate it i=
s
> NOT a standard perl package.  It will be read by non-informed users as op=
en
> season to use any naming scheme they want. Hence my concern.
>
> Just my 2 cents.
>
> =E2=80=94Tim
>
> the best,
> thank you
>
> 2017-07-12 0:34 GMT+02:00 Tim Orling <timothy.t.orling@linux.intel.com>:
>
>> The original po4a recipe should have been named libpo4a-perl, to follow
>> Debian naming. Notice that every other perl module you have in DEPENDS o=
r
>> RRECOMMENDS __are__ following Debian naming. Please help us keep the
>> metadata consistent in the meta-perl layer. Thank you.
>>
>> See 4.2 in:
>> https://www.debian.org/doc/packaging-manuals/perl-policy/ch-
>> module_packages.html
>>
>>
>> > On Jul 11, 2017, at 9:44 AM, liu.ming50@gmail.com wrote:
>> >
>> > From: Ming Liu <peter.x.liu@external.atlascopco.com>
>> >
>> > Term::ReadKey - A perl module for simple terminal control.
>> >
>> > It's being strongly recommended by po4a.
>> >
>> > Signed-off-by: Ming Liu <peter.x.liu@external.atlascopco.com>
>> > ---
>> > .../libterm/libterm-readkey-perl_2.37.bb           | 36
>> ++++++++++++++++++++++
>> > 1 file changed, 36 insertions(+)
>> > create mode 100644 meta-perl/recipes-perl/libterm/
>> libterm-readkey-perl_2.37.bb
>> >
>> > diff --git a/meta-perl/recipes-perl/libterm/libterm-readkey-perl_2.37.
>> bb b/meta-perl/recipes-perl/libterm/libterm-readkey-perl_2.37.bb
>> > new file mode 100644
>> > index 0000000..6b76682
>> > --- /dev/null
>> > +++ b/meta-perl/recipes-perl/libterm/libterm-readkey-perl_2.37.bb
>> > @@ -0,0 +1,36 @@
>> > +SUMMARY =3D "Term::ReadKey - A perl module for simple terminal contro=
l."
>> > +DESCRIPTION =3D "Term::ReadKey is a compiled perl module dedicated to
>> providing simple \
>> > +control over terminal driver modes (cbreak, raw, cooked, etc.,)
>> support \
>> > +for non-blocking reads, if the architecture allows, and some
>> generalized \
>> > +handy functions for working with terminals. One of the main goals is
>> to \
>> > +have the functions as portable as possible, so you can just plug in
>> "use \
>> > +Term::ReadKey" on any architecture and have a good likelihood of it \
>> > +working."
>> > +HOMEPAGE =3D "http://search.cpan.org/~jstowe/TermReadKey-${PV}"
>> > +SECTION =3D "libraries"
>> > +
>> > +LICENSE =3D "Artistic-1.0 | GPLv1+"
>> > +LIC_FILES_CHKSUM =3D "file://README;md5=3Dc275db663c8
>> 489a5709ebb22b185add5"
>> > +
>> > +SRC_URI =3D "${CPAN_MIRROR}/authors/id/J/JS/JSTOWE/TermReadKey-${PV}.=
tar
>> .gz"
>> > +
>> > +SRC_URI[md5sum] =3D "e8ea15c16333ac4f8d146d702e83cc0c"
>> > +SRC_URI[sha256sum] =3D "4a9383cf2e0e0194668fe2bd546e8
>> 94ffad41d556b41d2f2f577c8db682db241"
>> > +
>> > +S =3D "${WORKDIR}/TermReadKey-${PV}"
>> > +
>> > +# It needs depend on native to let dynamic loader use native modules
>> > +# rather than target ones.
>> > +DEPENDS =3D "libterm-readkey-perl-native"
>> > +
>> > +inherit cpan
>> > +
>> > +do_configure_append () {
>> > +    # Hack the dynamic module loader so that it use native modules
>> since it can't load
>> > +    # the target ones.
>> > +    if [ "${BUILD_SYS}" !=3D "${HOST_SYS}" ]; then
>> > +        sed -i -e "s#-I\$(INST_ARCHLIB)#-I${STAG
>> ING_BINDIR_NATIVE}/perl-native/perl/vendor_perl/${@get_perl_version(d)}#=
g"
>> Makefile
>> > +    fi
>> > +}
>> > +
>> > +BBCLASSEXTEND =3D "native"
>> > --
>> > 2.7.4
>> >
>> > --
>> > _______________________________________________
>> > Openembedded-devel mailing list
>> > Openembedded-devel@lists.openembedded.org
>> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>
>>
>
>

