Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1P7RKQ-00039D-WF
	for openembedded-devel@lists.openembedded.org;
	Sun, 17 Oct 2010 13:23:04 +0200
Received: by iwn2 with SMTP id 2so2873297iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 17 Oct 2010 04:22:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=FXZvi63VBXLCMXSoYmtfdbfwDnG9yuV5N8gLjDtPUgA=;
	b=cNWzjpvFAzzelqIgO4h6KF6u7UdObur0T9Iz4Oa4I6vCwmYltrunjJdWAxtmvSqlPa
	BrwE06R0L6cno8U3eKpqFa/FAaGubLMOO7+CoYCPUjJ57yNM6I6E5sXabF4CjiHI6/WD
	4UJ6Gs/d+qnixdupyl9GaMVTTRknqy7nzo/fY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=JElVlcJCfx+iIeIWkN+fNTfBfVI82/6ZmX+2CGTiS+mlpBUoYUZmDxdrdNejrQ9yME
	P0K/96YIsRRrrKtrufxC8k/sbm7xqpd5cH2/cKtT+2aYHlwHZExLG8Y270HSgGP/sgvz
	BOBvFVz8K4EXAYqSAPfVJd9f5NF2ppkNWgOTI=
MIME-Version: 1.0
Received: by 10.231.12.11 with SMTP id v11mr2274402ibv.13.1287314551184; Sun,
	17 Oct 2010 04:22:31 -0700 (PDT)
Received: by 10.231.32.10 with HTTP; Sun, 17 Oct 2010 04:22:31 -0700 (PDT)
In-Reply-To: <50C3C89D-F86C-423F-814A-88602DD959E1@chumby.com>
References: <50C3C89D-F86C-423F-814A-88602DD959E1@chumby.com>
Date: Sun, 17 Oct 2010 13:22:31 +0200
Message-ID: <AANLkTikn1+_p_nwaqR4iV31co+qi_BaNShqx-eYgvgfS@mail.gmail.com>
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
Subject: Re: [PATCH] libsamplerate: Fix checksums to match downloaded file
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
X-List-Received-Date: Sun, 17 Oct 2010 11:23:05 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/10/17 Sean Cross <sean@chumby.com>:
> libsamplerate-0.1.7.tar.gz has changed upstream. =A0The Angstrom mirror h=
as an old version of the file. =A0Pulling it from the source, I see that th=
e following two changes have been made without bumping the version:
>
> diff -ur old-libsamplerate-0.1.7/ChangeLog libsamplerate-0.1.7/ChangeLog
> --- old-libsamplerate-0.1.7/ChangeLog =A0 2009-02-14 11:37:27.000000000 +=
0000
> +++ libsamplerate-0.1.7/ChangeLog =A0 =A0 =A0 2009-02-15 00:17:35.0000000=
00 +0000
> @@ -11,7 +11,7 @@
> =A0 =A0 This bug has zero security implications beyond the ability to cau=
se a
> =A0 =A0 program hitting this bug to exit immediately with a segfault.
> =A0 =A0 See : http://www.mega-nerd.com/erikd/Blog/2009/Feb/14/index.html
> - =A0 =A0Thanks to David Cournapeau for the bug report.
> + =A0 =A0Thanks to David Cournapeau and Lev Givon for the bug report.
>
> =A0 =A0 * doc/win32.html Makefile.am configure.ac
> =A0 =A0 Reinstate Win32/MSVC compile instructions.
> diff -ur old-libsamplerate-0.1.7/Win32/config.h libsamplerate-0.1.7/Win32=
/config.h
> --- old-libsamplerate-0.1.7/Win32/config.h =A0 =A0 =A02009-02-14 11:42:49=
.000000000 +0000
> +++ libsamplerate-0.1.7/Win32/config.h =A02009-02-14 11:46:40.000000000 +=
0000
> @@ -190,8 +190,7 @@
> =A0#define STDC_HEADERS 1
>
> =A0/* Version number of package */
> -<<<<<<< diff from left file
> -#define VERSION "0.1.4"
> +#define VERSION "0.1.7"
>
>
>
> @@ -203,6 +202,3 @@
> =A0*/
>
> =A0#define inline __inline
> -=3D=3D=3D=3D=3D=3D=3D=3D
> -#define VERSION "0.1.7"
> ->>>>>>> diff from right file
>
>
> The following patch corrects the checksums for the new version.
>
> ---
> =A0recipes/libsamplerate/libsamplerate0_0.1.7.bb | =A0 =A04 ++--
> =A01 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/recipes/libsamplerate/libsamplerate0_0.1.7.bb b/recipes/libs=
amplerate/libsamplerate0_0.1.7.bb
> index 737e934..8b457ba 100644
> --- a/recipes/libsamplerate/libsamplerate0_0.1.7.bb
> +++ b/recipes/libsamplerate/libsamplerate0_0.1.7.bb
> @@ -12,5 +12,5 @@ S =3D "${WORKDIR}/libsamplerate-${PV}"
> =A0inherit autotools pkgconfig
>
>
> -SRC_URI[md5sum] =3D "ad093e60ec44f0a60de8e29983ddbc0f"
> -SRC_URI[sha256sum] =3D "e0a646224a0323ac63f56ef009b2d7fee11452a7b8af139b=
19ae71d2890dbc9c"
> +SRC_URI[md5sum] =3D "6731a81cb0c622c483b28c0d7f90867d"
> +SRC_URI[sha256sum] =3D "78ed5d9ff1bf162c4a078f6a3e7432a537dd2f22dc58872b=
081fb01156027fcc"
> --
> 1.7.0.4
>

Yuk; changing the contents of a release.
While I feel this patch is better than nothing (or we need to
maintain/store our own copy and always use that), I suggest at least a
PR bump to trigger a rebuild.

Thinking of it:
We might need a mechanism that the mirrors also get updated.
And it would be nice if the system would attempt a reload from the
source if the version in the downloads dir does not match the
checksums.
That way the problem of people having an older copy of the source in
their downloads dir do get the latest version if upstream changes.
(we might only do this if the recipe is newer than the copy in
downloads, just to avoid fetching over and over again).

Frans


