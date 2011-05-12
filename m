Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QKRhu-00007N-5b
	for openembedded-devel@lists.openembedded.org;
	Thu, 12 May 2011 10:57:18 +0200
Received: by fxm19 with SMTP id 19so1027213fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 May 2011 01:54:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=7Nxkc4Y5J2u6yH+OTU+3RG2IdfvHCbtNkFFUeCcnoxQ=;
	b=BDkLzLXlBWSbfHcvmECMSpG3F3RXjo/zkUkeq60yhNmB+ntK9JjoqSJGX39j1ycro4
	Q5runEHrIEBh2gmy8pDmcfls5VLJ289M3K/svzm8MqeR7c4e458b6CNTmiykvsI+LoE0
	LhWRv8owE9+lxvsfmUw2vYedO3nNa9fQ31RQA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=c5SfMmZtON29ugSAHtjPm52Gr8vXBws5EmBVqDgKLJQysJ669wsszIQBvTqZKbkFvS
	gGxmrfWMiZwRLLySxi4kUWAzdvYaefVCEX/izzv5vyOhIJmxHfdc5t8YY/s0dTm9QHLl
	g9K1cIbcqweXEx4lVoXTUzOHdE0iaJXRv6c5Y=
Received: by 10.223.127.210 with SMTP id h18mr1470923fas.73.1305190467918;
	Thu, 12 May 2011 01:54:27 -0700 (PDT)
Received: from localhost ([94.230.152.115])
	by mx.google.com with ESMTPS id r13sm375561fax.8.2011.05.12.01.54.26
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 12 May 2011 01:54:26 -0700 (PDT)
Date: Thu, 12 May 2011 10:54:20 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Paul Menzel <paulepanter@users.sourceforge.net>
Message-ID: <20110512085420.GD3423@jama.jama.net>
References: <1305190050.4254.14.camel@mattotaupa>
MIME-Version: 1.0
In-Reply-To: <1305190050.4254.14.camel@mattotaupa>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: libshr-glib: task configure fails with `/bin/sh: gdbus-codegen: command not found`
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
X-List-Received-Date: Thu, 12 May 2011 08:57:18 -0000
X-Groupsio-MsgNum: 31936
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="mJm6k4Vb/yFcL9ZU"
Content-Disposition: inline

--mJm6k4Vb/yFcL9ZU
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 12, 2011 at 10:47:30AM +0200, Paul Menzel wrote:
> Dear OE folks,
>=20
>=20
> as a result of I think commit 82f8341d [1]
>=20
> 	commit 82f8341d6282d6ae29e80eb3cdf312b6deda9b4c
> 	Author: Martin Jansa <Martin.Jansa@gmail.com>
> 	Date:   Sun May 8 07:08:16 2011 +0200
>=20
> 		  glib-2.0_git: include gdbus-codegen files in -dev
> 		 =20
> 		  Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>=20
> I am seeing the following error message in task configure of
> `libshr-glib` using `minimal` for `MACHINE =3D "beagleboard"`.
>=20
> 	[=E2=80=A6]
> 	for f in /oe/build-minimal-eglibc/minimal-dev/sysroots/armv7a-oe-linux-g=
nueabi//usr/share/shr-specs/xml/*.xml; do OUT=3D`echo $f | sed 's/.*\///g; =
s/^org\.shr\./shr-/g; s/.xml//g; s/\.//g;' | awk  '{ printf tolower($1)}'`;=
 gdbus-codegen  --interface-prefix org.shr --generate-c-code $OUT $f; echo =
"#include <$OUT.h>" >> shr-bindings.h; done
> 	/bin/sh: gdbus-codegen: command not found
> 	/bin/sh: gdbus-codegen: command not found
> 	/bin/sh: gdbus-codegen: command not found
> 	/bin/sh: gdbus-codegen: command not found
> 	/bin/sh: gdbus-codegen: command not found
> 	/bin/sh: gdbus-codegen: command not found
> 	/bin/sh: gdbus-codegen: command not found
> 	/bin/sh: gdbus-codegen: command not found
> 	/bin/sh: gdbus-codegen: command not found
> 	touch shr-bindings.h
> 	[=E2=80=A6]
>=20
> Is that related?

Not really, gdbus-codegen was provided by gdbus-binding-tool, but this
recipe is no longer supported by libshr-glib which now uses newer
gdbus-codegen version which was merged to glib sources (2.29.3 and
newer)
http://git.openembedded.org/cgit.cgi/openembedded/commit/?id=3D22b4f7926170=
ec14253a6d60f6d98f5eb3ec7f27

That's why this _git recipe has
DEFAULT_PREFERENCE_shr =3D "1"

and libshr-glib no longer depends on gdbus-binding-tool, but expects
glib-2.0-native to be new enough
http://git.openembedded.org/cgit.cgi/openembedded/commit/?id=3Df6c2ad4e6513=
83ab09be1f5b394aa7014233cfc5

and also few more libs/daemons were changed to support newer glib
glib-2.0_git: add RREPLACES for gdbus-binding-tool	Martin Jansa
libphone-ui: bump SRCREV for glib-2.29	Martin Jansa
libshr-glib: bump SRCREV for glib-2.29 support and use gdbus-codegen from g=
li...	Martin Jansa
phoneuid: bump SRCREV for glib-2.29	Martin Jansa
phonefsod: bump SRCREV for glib-2.29

So if you need any of those, you have to manually clean
gdbus-binding-tool-native/gdbus-binding-tool on your buildhost (to clean
sysroot and shlibs) and then prefer glib-2.0-2.29.3.

Regards,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--mJm6k4Vb/yFcL9ZU
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iEYEARECAAYFAk3LoDwACgkQN1Ujt2V2gByb+ACdGgj9qcHc38mTRLVDnVjEs43O
qegAn3IHw3iUct14MOw8Yyk0FK9ngySO
=a+fr
-----END PGP SIGNATURE-----

--mJm6k4Vb/yFcL9ZU--
