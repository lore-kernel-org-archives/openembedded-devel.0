Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f175.google.com (mail-ea0-f175.google.com
	[209.85.215.175])
	by mail.openembedded.org (Postfix) with ESMTP id 32FB66BB33
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  4 Oct 2013 10:08:57 +0000 (UTC)
Received: by mail-ea0-f175.google.com with SMTP id m14so1674549eaj.20
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 04 Oct 2013 03:08:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=on+gSFMaYjHx3+sPTMhQUXB1j86zEybPbt94bgac1eE=;
	b=vaGxK3EkR4c/H2h6K5TiWyRQ9mJlqHymWub31lrgJihzPiyTs8IR2giUMugOOWOCGp
	THd4VtNFvaf67UEncz7CUFgtaj+DjtAeAttNwwncoipoWQ2hm2ZERqf9PeUGZCzuiUiP
	vou4m28/fcKnkV0mbQ/uluHRVxBKEcsSaEXGCi3XypHiEPl4w7j+U8h2GtycSTC76tdz
	AgKSFLF/6RFZNqZUt/B4PiOJQ/UqrgP8qrPhS8/nLTS8yJupvv7gfD+QU/shhTskKFPY
	W2jX7okzzu5+chm0L2vvgyX/9/0ra2JfcEHGzT7BclmurjO6QpGdTXo6WW+Kb74kAB0o
	ZX+g==
X-Received: by 10.14.4.1 with SMTP id 1mr20786919eei.21.1380881338457;
	Fri, 04 Oct 2013 03:08:58 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	h45sm26260366eeg.5.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 04 Oct 2013 03:08:57 -0700 (PDT)
Date: Fri, 4 Oct 2013 12:09:04 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Message-ID: <20131004100904.GC6240@jama>
References: <CAP71WjxknZx_g_1zgCgebb8_PnDW3Ry9NdtLPuDay-7ZgWp4CA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAP71WjxknZx_g_1zgCgebb8_PnDW3Ry9NdtLPuDay-7ZgWp4CA@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	openembedded-devel@lists.openembedded.org
Subject: Re: ruby-native problem (on dylan)
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 04 Oct 2013 10:08:58 -0000
X-Groupsio-MsgNum: 46436
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="OBd5C1Lgu00Gd/Tn"
Content-Disposition: inline

--OBd5C1Lgu00Gd/Tn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 04, 2013 at 10:09:53AM +0200, Nicolas Dechesne wrote:
> hi,
>=20
> we got some build failures in our autobuilders last night, which
> seemed to be related to ruby-native. We use dylan, but I believe the
> same problem is there in master/dora too.
>=20
> The exact build error was in qtwebkit do_compile:
>=20
> ruby /mnt/ci_build/workspace/project/branches/dylan/label/oe_persistent_c=
loud/machines/genericarmv7a/build/tmp/work/armv7ahf-vfp-neon-project-linux-=
gnueabi/qtwebkit/5.0.2-r0.0/qtwebkit-opensource-src-5.0.2/Source/JavaScript=
Core/offlineasm/generate_offset_extractor.rb
> /mnt/ci_build/workspace/project/branches/dylan/label/oe_persistent_cloud/=
machines/genericarmv7a/build/tmp/work/armv7ahf-vfp-neon-project-linux-gnuea=
bi/qtwebkit/5.0.2-r0.0/qtwebkit-opensource-src-5.0.2/Source/JavaScriptCore/=
llint/LowLevelInterpreter.asm
> LLIntDesiredOffsets.h
>=20
> <internal:gem_prelude>:1:in `require': cannot load such file --
> rubygems.rb (LoadError)
> from <internal:gem_prelude>:1:in `<compiled>'
>=20
> Yesterday I had 'moved' our BUILDDIR location. However for every build, w=
e:
>  - delete the TMPDIR completely
>  - reuse our sstate
>=20
> The problem seems to be that 'ruby' has hard coded paths in the
> binary. This is discussed in [1] or more at length in [2], and easy to
> check:

Try to add this in qtwebkit.inc:

# make sure rb files are used from sysroot, not from host
# ruby-1.9.3-always-use-i386.patch is doing target_cpu=3D`echo $target_cpu =
| sed s/i.86/i386/`
# we need to replace it too (a bit longer version without importing re)
RUBY_SYS =3D "${@ '${BUILD_SYS}'.replace('i486', 'i386').replace('i586', 'i=
386').replace('i686', 'i386') }"
export RUBYLIB=3D"${STAGING_DATADIR_NATIVE}/rubygems:${STAGING_LIBDIR_NATIV=
E}/ruby:${STAGING_LIBDIR_NATIVE}/ruby/${RUBY_SYS}"

if you can confirm it works for you I'll push it to meta-qt5.

>=20
> $ strings tmp/sysroots/x86_64-linux/usr/bin/ruby | grep project
> /work/project/build/tmp/sysroots/x86_64-linux/usr
> /work/project/build/tmp/sysroots/x86_64-linux/usr/lib/ruby/site_ruby
> /work/project/build/tmp/sysroots/x86_64-linux/usr/lib/ruby/site_ruby/x86_=
64-linux
> /work/project/build/tmp/sysroots/x86_64-linux/usr/lib/ruby/vendor_ruby
> /work/project/build/tmp/sysroots/x86_64-linux/usr/lib/ruby/vendor_ruby/x8=
6_64-linux
> /work/project/build/tmp/sysroots/x86_64-linux/usr/share/rubygems
> /work/project/build/tmp/sysroots/x86_64-linux/usr/lib/ruby
> /work/project/build/tmp/sysroots/x86_64-linux/usr/lib/ruby/x86_64-linux
>=20
> So, the 'ruby' binary which was in the sstate, knew about the *old*
> paths. When building today, ruby was pulled from sstate, but TMPDIR
> has changed now, and the hardcoded paths no longer exists, leading to
> the build failure.
>=20
> I verified that the following 'solved' the build issue:
> $ bitbake -c cleansstate ruby-native
> $ bitbake ruby-native
> $ bitbake qtwebkit
>=20
> There seems to be a configure option, --enable-load-relative, after
> using this option in ruby build, still ruby fails to start for the
> same reason. I might have done something wrong, but i wanted to bring
> it on the list, to see if anyone has a better solution, as it seems
> like a big issue.
>=20
> thanks
>=20
> nicolas
>=20
>=20
> [1] http://stackoverflow.com/questions/10221387/moving-ruby-installation-=
causes-it-to-not-function-how-to-get-around-this
> [2] http://yehudakatz.com/2012/06/

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--OBd5C1Lgu00Gd/Tn
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.21 (GNU/Linux)

iEYEARECAAYFAlJOk8AACgkQN1Ujt2V2gBw9mACfdrojhdWzWBXlmI77OdQE0sTH
Fy0Anj1ty2qCsQnMlOEv3THVcxR3kUSU
=Avdr
-----END PGP SIGNATURE-----

--OBd5C1Lgu00Gd/Tn--
