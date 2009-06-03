Received: from [209.85.218.171] (helo=mail-bw0-f171.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ihar.hrachyshka@gmail.com>) id 1MBpvC-0003x5-FN
	for openembedded-devel@lists.openembedded.org;
	Wed, 03 Jun 2009 14:50:22 +0200
Received: by bwz19 with SMTP id 19so8681841bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 03 Jun 2009 05:41:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=hooYJ9rovEZYlrRSNvwYwkruwLenaEZkJrXRPO+qcr4=;
	b=THE4EfkFkVRE84t7PVz+AlQa0uhsIJPfHq+fxltvqZ0SERET+0HLlxjjfIS4xzzlkM
	jHA+uw2/YXek24Hjc/XrRCfCnLYbt6vL1C+3YqZLlWr/sYOobnMSP0S+kqD7rJZxLPoR
	Yj/o6AKCQGjQmIg6l0HNBxtsxrVzmN0hkwi0Q=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=MyqxfRQDrA1HmhbM1lPcCXOYDCECBKO+Rocv3lHssZ4cKYiapC0ReIoTQVlja4y+Rm
	alQbwk3ffhFjUa5lEhz4QYFu4TN4DWEPjPySJe65rVGQqTodlN9frzEsC/+icCw4Odb6
	7ppwDi+dfctVlgl+O+zuO8kN7oI/iPECf55JM=
MIME-Version: 1.0
Received: by 10.103.214.13 with SMTP id r13mr582811muq.37.1244032883300; Wed, 
	03 Jun 2009 05:41:23 -0700 (PDT)
In-Reply-To: <1243271937.28070.9.camel@hammer.suse.cz>
References: <fce2a370905231344i3eced2bci5e1997d520be705e@mail.gmail.com>
	<20090524204821.GC1445@denix.org>
	<1243271937.28070.9.camel@hammer.suse.cz>
Date: Wed, 3 Jun 2009 15:41:23 +0300
Message-ID: <fce2a370906030541g135880c1q28ce758a0b1a4c9b@mail.gmail.com>
From: Ihar Hrachyshka <ihar.hrachyshka@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] locality of python{} variables (was e2fsprogs-libs is unbuildable for .dev)
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
X-List-Received-Date: Wed, 03 Jun 2009 12:50:22 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Problem is still there (built today from scratch).

On Mon, May 25, 2009 at 8:18 PM, Stanislav Brabec <utx@penguin.cz> wrote:
> Denys Dmytriyenko wrote:
>> http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=3D61f0ac56=
01f6c03871d084f879ef618664d9b2c6
>
> Blindly guessing that variables inside python statement may be global. I
> see no other explanation, how variables can get a value defined in
> another .bb file.
>
> Here is a partial fix (just a variable rename) that allowed to continue
> the build. If my guess is true, then possible problems of
> do_split_packages() may be pretty widespread.
>
> diff --git a/recipes/e2fsprogs-libs/e2fsprogs-libs.inc b/recipes/e2fsprog=
s-libs/e2fsprogs-libs.inc
> index 8b214c1..5b82c11 100644
> --- a/recipes/e2fsprogs-libs/e2fsprogs-libs.inc
> +++ b/recipes/e2fsprogs-libs/e2fsprogs-libs.inc
> @@ -15,12 +15,12 @@ FILES_e2fsprogs-libs-dev_append =3D " ${datadir}/et $=
{datadir}/ss"
> =C2=A0FILES_${PN} =3D "${bindir}"
>
> =C2=A0python populate_packages_prepend () {
> - =C2=A0 =C2=A0 =C2=A0 cv_libdir =3D bb.data.expand('${libdir}', d)
> - =C2=A0 =C2=A0 =C2=A0 cv_libdir_dbg =3D bb.data.expand('${libdir}/.debug=
', d)
> - =C2=A0 =C2=A0 =C2=A0 do_split_packages(d, cv_libdir, '^lib(.*)\.so$', '=
lib%s-dev', 'e2fsprogs-libs %s development package', extra_depends=3D'${PN}=
-dev', allow_links=3DTrue)
> - =C2=A0 =C2=A0 =C2=A0 do_split_packages(d, cv_libdir, '^lib(.*)\.la$', '=
lib%s-dev', 'e2fsprogs-libs %s development package', extra_depends=3D'${PN}=
-dev')
> - =C2=A0 =C2=A0 =C2=A0 do_split_packages(d, cv_libdir, '^lib(.*)\.a$', 'l=
ib%s-dev', 'e2fsprogs-libs %s development package', extra_depends=3D'${PN}-=
dev')
> - =C2=A0 =C2=A0 =C2=A0 do_split_packages(d, cv_libdir, '^lib(.*)\.so\.*',=
 'lib%s', 'e2fsprogs-libs %s library', extra_depends=3D'', allow_links=3DTr=
ue)
> + =C2=A0 =C2=A0 =C2=A0 e2fs_libdir =3D bb.data.expand('${libdir}', d)
> + =C2=A0 =C2=A0 =C2=A0 e2fs_libdir_dbg =3D bb.data.expand('${libdir}/.deb=
ug', d)
> + =C2=A0 =C2=A0 =C2=A0 do_split_packages(d, e2fs_libdir, '^lib(.*)\.so$',=
 'lib%s-dev', 'e2fsprogs-libs %s development package', extra_depends=3D'${P=
N}-dev', allow_links=3DTrue)
> + =C2=A0 =C2=A0 =C2=A0 do_split_packages(d, e2fs_libdir, '^lib(.*)\.la$',=
 'lib%s-dev', 'e2fsprogs-libs %s development package', extra_depends=3D'${P=
N}-dev')
> + =C2=A0 =C2=A0 =C2=A0 do_split_packages(d, e2fs_libdir, '^lib(.*)\.a$', =
'lib%s-dev', 'e2fsprogs-libs %s development package', extra_depends=3D'${PN=
}-dev')
> + =C2=A0 =C2=A0 =C2=A0 do_split_packages(d, e2fs_libdir, '^lib(.*)\.so\.*=
', 'lib%s', 'e2fsprogs-libs %s library', extra_depends=3D'', allow_links=3D=
True)
> =C2=A0}
>
> =C2=A0do_stage () {
> diff --git a/recipes/util-linux-ng/util-linux-ng.inc b/recipes/util-linux=
-ng/util-linux-ng.inc
> index 45fd1a6..9c70b9e 100644
> --- a/recipes/util-linux-ng/util-linux-ng.inc
> +++ b/recipes/util-linux-ng/util-linux-ng.inc
> @@ -123,12 +123,12 @@ do_install () {
> =C2=A0}
>
> =C2=A0python populate_packages_prepend () {
> - =C2=A0 =C2=A0 =C2=A0 cv_libdir =3D bb.data.expand('${libdir}', d)
> - =C2=A0 =C2=A0 =C2=A0 cv_libdir_dbg =3D bb.data.expand('${libdir}/.debug=
', d)
> - =C2=A0 =C2=A0 =C2=A0 do_split_packages(d, cv_libdir, '^lib(.*)\.so$', '=
lib%s-dev', 'util-linux-ng %s development package', extra_depends=3D'${PN}-=
dev', allow_links=3DTrue)
> - =C2=A0 =C2=A0 =C2=A0 do_split_packages(d, cv_libdir, '^lib(.*)\.la$', '=
lib%s-dev', 'util-linux-ng %s development package', extra_depends=3D'${PN}-=
dev')
> - =C2=A0 =C2=A0 =C2=A0 do_split_packages(d, cv_libdir, '^lib(.*)\.a$', 'l=
ib%s-dev', 'util-linux-ng %s development package', extra_depends=3D'${PN}-d=
ev')
> - =C2=A0 =C2=A0 =C2=A0 do_split_packages(d, cv_libdir, '^lib(.*)\.so\.*',=
 'lib%s', 'util-linux-ng %s library', extra_depends=3D'', allow_links=3DTru=
e)
> + =C2=A0 =C2=A0 =C2=A0 ulinxng_libdir =3D bb.data.expand('${libdir}', d)
> + =C2=A0 =C2=A0 =C2=A0 ulinxng_libdir_dbg =3D bb.data.expand('${libdir}/.=
debug', d)
> + =C2=A0 =C2=A0 =C2=A0 do_split_packages(d, ulinxng_libdir, '^lib(.*)\.so=
$', 'lib%s-dev', 'util-linux-ng %s development package', extra_depends=3D'$=
{PN}-dev', allow_links=3DTrue)
> + =C2=A0 =C2=A0 =C2=A0 do_split_packages(d, ulinxng_libdir, '^lib(.*)\.la=
$', 'lib%s-dev', 'util-linux-ng %s development package', extra_depends=3D'$=
{PN}-dev')
> + =C2=A0 =C2=A0 =C2=A0 do_split_packages(d, ulinxng_libdir, '^lib(.*)\.a$=
', 'lib%s-dev', 'util-linux-ng %s development package', extra_depends=3D'${=
PN}-dev')
> + =C2=A0 =C2=A0 =C2=A0 do_split_packages(d, ulinxng_libdir, '^lib(.*)\.so=
\.*', 'lib%s', 'util-linux-ng %s library', extra_depends=3D'', allow_links=
=3DTrue)
> =C2=A0}
>
>
>
> --
> Stanislav Brabec
> http://www.penguin.cz/~utx/zaurus
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


