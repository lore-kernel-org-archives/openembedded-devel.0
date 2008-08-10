Received: from [213.165.64.20] (helo=mail.gmx.net)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <theBohemian@gmx.net>) id 1KSDuP-0006H0-Ex
	for openembedded-devel@lists.openembedded.org;
	Sun, 10 Aug 2008 18:36:45 +0200
Received: (qmail invoked by alias); 10 Aug 2008 16:36:17 -0000
Received: from e178119108.adsl.alicedsl.de (EHLO [192.168.4.110])
	[85.178.119.108]
	by mail.gmx.net (mp036) with SMTP; 10 Aug 2008 18:36:17 +0200
X-Authenticated: #17532834
X-Provags-ID: V01U2FsdGVkX19aJytSlJFaiyL4PSZ9gAVePZ6kHaa+vPkSC9UFH4
	6iHfl4frgLEhk2
Message-ID: <489F1965.2080806@gmx.net>
Date: Sun, 10 Aug 2008 18:37:57 +0200
From: Robert Schuster <theBohemian@gmx.net>
User-Agent: Mozilla-Thunderbird 2.0.0.16 (X11/20080724)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4883BCB1.7020102@atmel.com>	<c384c5ea0807221042y5018e7f2ka7b2915e82e9a554@mail.gmail.com>	<489EEAC6.1030300@gmx.net>
	<g7ms6d$n91$1@ger.gmane.org>
In-Reply-To: <g7ms6d$n91$1@ger.gmane.org>
X-Enigmail-Version: 0.95.0
X-Y-GMX-Trusted: 0
X-FuHaFi: 0.00
Subject: Re: binutils fails for AVR32
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
X-List-Received-Date: Sun, 10 Aug 2008 16:36:45 -0000
X-Groupsio-MsgNum: 5720
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="------------enigC6EBBE808286864B597EB185"

--------------enigC6EBBE808286864B597EB185
Content-Type: multipart/mixed;
 boundary="------------010507070906080701080308"

--------------010507070906080701080308
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi,

Koen Kooi schrieb:
> Robert Schuster wrote:
>> Hi,
>> got an ngw100 and wanted to build angstrom for it and have the same
>> issues as Ulf with binutils-cross.
>=20
> If you work around that you'll notice that gcc-cross doesn't compile
> anymore :( I'm hoping to spend some time on it next week
Oh no. :$

I just prepared a patch that takes Ulf's approach and implements it
indepedent from $BUILD_SYS. I attached the patch but when you say this
will break gcc-cross it is probably moot.

>, but don't let that stop you from fixing it yourself :)
This is my first encounter with AVR32. :)

I just looked at the Makefile that is generated for binutils 2.18.50.0.7
 (machine =3D beagleboard). The *_CONFIGARGS variables do not contain
stuff like host_alias and CC there. I suspect that due to some weird
script problem (perhaps quoting?) things end up in the *_CONFIGARGS
variables that should not be there. The three variables are supposed to
contain the arguments given to the initial 'configure' but in the
avr32's case they contain environment variables.

As Ulf already told it all leads to ac_configure_args (or ac_arg). The
shell code that generates it is different for our binutils (avr32) 2.17
and 2.18.50.0.7. The former is created by autoconf 2.61 (AFAIU it is
re-generated after the avr32 patch is applied), while the latter is
created by 2.61.

--

While writing this my build has failed at gcc-cross. The compiler
crashes while compiling the Objective C library. As a workaround I
disabled it and now it works. So many bugs ... :|

Regards
Robert

--------------010507070906080701080308
Content-Type: text/x-patch;
 name="oe-binutils-avr32-compilefix.patch"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline;
 filename="oe-binutils-avr32-compilefix.patch"

#
# old_revision [20adcf1d7f147947dc29ead2037c53133b6eb39f]
#
# patch "packages/binutils/binutils-avr32.inc"
#  from [7d4de5cdff8cbe23a79ceaf4ae9d202ba3b70583]
#    to [32742801acaf13d8d36e0bccb714fea20c6053da]
#
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--- packages/binutils/binutils-avr32.inc	7d4de5cdff8cbe23a79ceaf4ae9d202b=
a3b70583
+++ packages/binutils/binutils-avr32.inc	32742801acaf13d8d36e0bccb714fea2=
0c6053da
@@ -18,6 +18,14 @@ do_avr32_configure_bfd () {
=20
 do_avr32_configure_bfd () {
         if test ${TARGET_ARCH} =3D=3D avr32; then
+						# fix Makefile brokenness due to unmatched single quotes=20
+						(cd ${B} && sed -i -e "s,'CC=3Dccache,'CC=3D${CC}'," Makefile)=20
+						# *_alias options are not supported in binutils 2.17 and need
+						# to be removed
+						(cd ${B} && sed -i -e "s,'host_alias=3D.*',," Makefile)
+						(cd ${B} && sed -i -e "s,'build_alias=3D.*',," Makefile)
+						(cd ${B} && sed -i -e "s,'target_alias=3D*.',," Makefile)
+
             (cd ${B} && make configure-bfd) || die "Error running 'make =
configure-bfd'"
             (cd ${B}/bfd && make headers) || die "Error running 'make he=
aders'"
         fi

--------------010507070906080701080308--

--------------enigC6EBBE808286864B597EB185
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iEYEAREIAAYFAkifGWUACgkQG9cfwmwwEtoCDgCfZuztx3o5Aive0wdZFwAAov1M
2igAmwZT0lqCnp1F9GbYjuTiYQq++HM/
=P+c1
-----END PGP SIGNATURE-----

--------------enigC6EBBE808286864B597EB185--
