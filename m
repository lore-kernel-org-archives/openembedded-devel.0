Received: from mail-qy0-f182.google.com ([209.85.216.182])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sylvain.pare@gmail.com>) id 1R1G02-0005FN-69
	for openembedded-devel@lists.openembedded.org;
	Wed, 07 Sep 2011 13:08:58 +0200
Received: by qyk9 with SMTP id 9so4598825qyk.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 07 Sep 2011 04:03:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=S2sl0kMyYFsWvY70fW5E2rO3DI24UuIIAMp0xSA3Hvc=;
	b=GtbZhhjKrd75tfsEjusq8AaCjfX36xQcg/cCVksyhGoXkuVkExOLNtNNecNK/3Vxs2
	lRyHY7vCUzadMzf5PeO1aVIYsFtMH9b3lBRynZ/QWFKzWfEe0qE+KjzIGIkquMpry4I8
	bmTprXtJPtmmWgvN18OR3Osakch8b0AtnMPuY=
Received: by 10.229.72.162 with SMTP id m34mr4847181qcj.189.1315393435146;
	Wed, 07 Sep 2011 04:03:55 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.229.88.144 with HTTP; Wed, 7 Sep 2011 04:03:35 -0700 (PDT)
In-Reply-To: <1315392954.17658.16.camel@mattotaupa>
References: <1315385957-13742-1-git-send-email-sylvain.pare@gmail.com>
	<1315392954.17658.16.camel@mattotaupa>
From: =?ISO-8859-1?Q?Sylvain_Par=E9?= <sylvain.pare@gmail.com>
Date: Wed, 7 Sep 2011 13:03:35 +0200
Message-ID: <CACrTVgKmtbR3_BTm0+9DBAqOZJF4KJm4hBhXRMurR+t+1noeAw@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org, 
	Paul Menzel <paulepanter@users.sourceforge.net>
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [PATCH v2] binutils: update to 2.21.1a
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
X-List-Received-Date: Wed, 07 Sep 2011 11:08:58 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

Dear Paul,

Yes the old patch did not work anymore so I took the one form oe-core . did
not wanted to waste my time more.
Then yes sorry for the build error :
I did a last moment change to 2.21.1a which breaks my current patch..
so I apologize for my numerous mistakes here.. I hope I will not learn for
my mistakes too much in the future.
I have sent a new version (V3 10minutes ago) this one should be fine despit=
e
this copy/pasted patch.
Thank you again for your patience.

Regards,

Sylvain

2011/9/7 Paul Menzel <paulepanter@users.sourceforge.net>

> Dear Sylvain,
>
>
> Am Mittwoch, den 07.09.2011, 10:59 +0200 schrieb Sylvain 'GarthPS' Par=E9=
:
> > I did finally a complet rework of my patch. It will be the last one as =
I
> should better work
> > on new oe than on old one.
>
> this text is not suitable for a commit message.
>
> > This patch use an ugly copy/past of libtool-2.4-update.patch from oe-co=
re
> to overwrite it but it worked here.
> > For thos interested.
>
> Why is that necessary? Did the old one not work?
>
> > Signed-off-by: Sylvain 'GarthPS' Par=E9 <sylvain.pare@gmail.com>
> > ---
> >  conf/distro/include/sane-toolchain.inc             |    2 +-
> >  .../110-arm-eabi-conf.patch                        |    0
> >  .../binutils-2.16.1-e300c2c3.patch                 |    0
> >  ...tils-2.16.91.0.6-objcopy-rename-errorcode.patch |    0
> >  .../binutils-2.19.1-ld-sysroot.patch               |    0
> >  .../binutils-arm-pr7093.patch                      |    0
> >  .../binutils-uclibc-100-uclibc-conf.patch          |    0
> >  ...binutils-uclibc-300-001_ld_makefile_patch.patch |    0
> >  ...binutils-uclibc-300-006_better_file_error.patch |    0
> >  ...ils-uclibc-300-012_check_ldrunpath_length.patch |    0
> >  .../binutils-uclibc-gas-needs-libm.patch           |    0
> >  .../fix-clone-conflicts.patch                      |    0
> >  .../binutils-2.21.1a/libtool-2.4-update.patch      |18730
> +++++++++++++++++++
> >  .../binutils-2.21/libtool-2.4-update.patch         |18731
> --------------------
> >  ...s-sdk_2.21.bb =3D> binutils-cross-sdk_2.21.1a.bb} |    0
> >  ...ils-cross_2.21.bb =3D> binutils-cross_2.21.1a.bb} |    0
> >  recipes/binutils/binutils_2.21.1a.bb               |   21 +
> >  recipes/binutils/binutils_2.21.bb                  |   21 -
> >  18 files changed, 18752 insertions(+), 18753 deletions(-)
> >  rename recipes/binutils/{binutils-2.21 =3D>
> binutils-2.21.1a}/110-arm-eabi-conf.patch (100%)
> >  rename recipes/binutils/{binutils-2.21 =3D>
> binutils-2.21.1a}/binutils-2.16.1-e300c2c3.patch (100%)
> >  rename recipes/binutils/{binutils-2.21 =3D>
> binutils-2.21.1a}/binutils-2.16.91.0.6-objcopy-rename-errorcode.patch (10=
0%)
> >  rename recipes/binutils/{binutils-2.21 =3D>
> binutils-2.21.1a}/binutils-2.19.1-ld-sysroot.patch (100%)
> >  rename recipes/binutils/{binutils-2.21 =3D>
> binutils-2.21.1a}/binutils-arm-pr7093.patch (100%)
> >  rename recipes/binutils/{binutils-2.21 =3D>
> binutils-2.21.1a}/binutils-uclibc-100-uclibc-conf.patch (100%)
> >  rename recipes/binutils/{binutils-2.21 =3D>
> binutils-2.21.1a}/binutils-uclibc-300-001_ld_makefile_patch.patch (100%)
> >  rename recipes/binutils/{binutils-2.21 =3D>
> binutils-2.21.1a}/binutils-uclibc-300-006_better_file_error.patch (100%)
> >  rename recipes/binutils/{binutils-2.21 =3D>
> binutils-2.21.1a}/binutils-uclibc-300-012_check_ldrunpath_length.patch
> (100%)
> >  rename recipes/binutils/{binutils-2.21 =3D>
> binutils-2.21.1a}/binutils-uclibc-gas-needs-libm.patch (100%)
> >  rename recipes/binutils/{binutils-2.21 =3D>
> binutils-2.21.1a}/fix-clone-conflicts.patch (100%)
> >  create mode 100644
> recipes/binutils/binutils-2.21.1a/libtool-2.4-update.patch
> >  delete mode 100644
> recipes/binutils/binutils-2.21/libtool-2.4-update.patch
> >  rename recipes/binutils/{binutils-cross-sdk_2.21.bb =3D>
> binutils-cross-sdk_2.21.1a.bb} (100%)
> >  rename recipes/binutils/{binutils-cross_2.21.bb =3D>
> binutils-cross_2.21.1a.bb} (100%)
> >  create mode 100644 recipes/binutils/binutils_2.21.1a.bb
> >  delete mode 100644 recipes/binutils/binutils_2.21.bb
>
> [=85]
>
> Anyway, the build fails with your patch.
>
>        NOTE: package binutils-cross-2.21.1a-r14.3: task do_patch: Started
>        ERROR: Execution of 'quilt
> --quiltrc=3D/oe/build-minimal-eglibc/minimal-dev/sysroots/i686-linux/usr/=
bin/quiltrc
> push' failed with exit code 1:
>        Applying patch binutils-uclibc-100-uclibc-conf.patch
>        patching file configure
>        Hunk #1 FAILED at 2206.
>        Hunk #2 FAILED at 2504.
>        2 out of 2 hunks FAILED -- rejects in file configure
>        patching file gprof/configure
>        Hunk #1 FAILED at 4124.
>        1 out of 1 hunk FAILED -- rejects in file gprof/configure
>        Patch binutils-uclibc-100-uclibc-conf.patch does not apply (enforc=
e
> with -f)
>
> NOTE: package binutils-cross-2.21.1a-r14.3: task patch_do_patch: Failed
> ERROR: Function 'patch_do_patch' failed
>
>
> Thanks,
>
> Paul
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
>

