Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f49.google.com (mail-ee0-f49.google.com [74.125.83.49])
	by mail.openembedded.org (Postfix) with ESMTP id 4752C6A4E3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Jun 2013 15:58:06 +0000 (UTC)
Received: by mail-ee0-f49.google.com with SMTP id b57so489847eek.8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Jun 2013 08:58:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=iWEouHVJSXbWfChFsxSBPPmQalV8bVQgHVBephtR5J8=;
	b=gBsYr3nYQPu1ANzd2RHdHPoQ/Ooa0BOt0d0SmGopM+pFcgdDJxPwlMuV7iZW4ENBSg
	8Kzuw/XqufY28bkDy36Fot3W3BsoKoMXm79GceT4WvQlu0gx31GXq++7dnn8TXfjHUBc
	dgpk5gC4NBSD3mdyivw9V65QPFWt1XgOOfnXmlEBva8PBjM5P8qCq9PtAxgmHcsZ4vo9
	l9TujG/kOCZ4dbSFTTIpvT6L+d0QBy1kUzBM70g3pd/sFolQ6n8v4XK+J5YzoE4nxFFs
	7vCao0jq+dmHwt7fM7nLi3/dikNiPRyJ/0JFPAEO3e3i9akwvbiGamV5su7SmxmlaLa8
	7+/w==
X-Received: by 10.14.5.129 with SMTP id 1mr9744774eel.56.1372348686526;
	Thu, 27 Jun 2013 08:58:06 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id i2sm4705540eeu.4.2013.06.27.08.58.05
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 27 Jun 2013 08:58:05 -0700 (PDT)
Date: Thu, 27 Jun 2013 17:58:44 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130627155844.GH3261@jama>
References: <1370109802-11739-1-git-send-email-Martin.Jansa@gmail.com>
	<20130602080956.GA3279@jama> <20130606123417.GC22710@jama>
	<CAMKF1sr20XzmonOmtDExLhZdUts3KgpdiU2uyNVxUKBo5npamg@mail.gmail.com>
	<20130611084204.GB3233@jama>
MIME-Version: 1.0
In-Reply-To: <20130611084204.GB3233@jama>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-efl][PATCH] webkit-efl: Fix build with gcc-4.8
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
X-List-Received-Date: Thu, 27 Jun 2013 15:58:06 -0000
X-Groupsio-MsgNum: 45232
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="z+pzSjdB7cqptWpS"
Content-Disposition: inline

--z+pzSjdB7cqptWpS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 11, 2013 at 10:42:04AM +0200, Martin Jansa wrote:
> On Tue, Jun 11, 2013 at 01:08:13AM -0700, Khem Raj wrote:
> > On Thu, Jun 6, 2013 at 5:34 AM, Martin Jansa <martin.jansa@gmail.com> w=
rote:
> > > On Sun, Jun 02, 2013 at 10:09:56AM +0200, Martin Jansa wrote:
> > >> On Sat, Jun 01, 2013 at 08:03:22PM +0200, Martin Jansa wrote:
> > >> > ---
> > >> >  ...include-Element.h-for-hasTagName-function.patch | 43 +++++++++=
+++++++++++++
> > >> >  meta-efl/recipes-efl/webkit/webkit-efl_svn.bb      |  3 +-
> > >> >  2 files changed, 45 insertions(+), 1 deletion(-)
> > >> >  create mode 100644 meta-efl/recipes-efl/webkit/webkit-efl/0001-ew=
k-include-Element.h-for-hasTagName-function.patch
> > >>
> > >> Ignore this one, it works on armv7a, but fails the same on armv4t and
> > >> x86_64 + there is ICE when building for armv5te.
> > >
> > > I've merged this in the end, because it fixed webkit-efl build on
> > > jenkins (and it looks like building from scratch works for other archs
> > > I'm building locally too).
> > >
> > > Only remaining issue is with -O2 and xscalete DEFAULT_TUNE where it
> > > triggers ICE:
> > >
> > > /OE/shr-core/tmp-eglibc/work/xscalete-oe-linux-gnueabi/webkit-efl/1.9=
=2E3+svnr120144-r3/src/Source/JavaScriptCore/runtime/JSGlobalObjectFunction=
s.cpp: In functi
> > > on 'JSC::JSValue JSC::_ZN3JSCL6decodeEPNS_9ExecStateEPKcb.constprop.8=
9(JSC::ExecState*, const char*)':
> > > /OE/shr-core/tmp-eglibc/work/xscalete-oe-linux-gnueabi/webkit-efl/1.9=
=2E3+svnr120144-r3/src/Source/JavaScriptCore/runtime/JSGlobalObjectFunction=
s.cpp:150:1: error: could not split insn
> > >  }
> > >  ^
> > > (insn 505 8094 507 (set (reg:SI 1 r1 [orig:494 D.142535 ] [494])
> > >         (plus:SI (reg/v:SI 5 r5 [orig:157 character ] [157])
> > >             (const_int -17179934720 [0xfffffffbffff0000]))) /OE/shr-c=
ore/tmp-eglibc/work/xscalete-oe-linux-gnueabi/webkit-efl/1.9.3+svnr120144-r=
3/src/Source/JavaScriptCore/runtime/JSGlobalObjectFunctions.cpp:108 5 {*arm=
_addsi3}
> > >      (nil))
> > > /OE/shr-core/tmp-eglibc/work/xscalete-oe-linux-gnueabi/webkit-efl/1.9=
=2E3+svnr120144-r3/src/Source/JavaScriptCore/runtime/JSGlobalObjectFunction=
s.cpp:150:1: internal compiler error: in final_scan_insn, at final.c:2897
> > > Please submit a full bug report,
> > > with preprocessed source if appropriate.
> > > See <http://gcc.gnu.org/bugs.html> for instructions.
> > > {standard input}: Assembler messages:
> > > {standard input}: Error: open CFI at the end of file; missing .cfi_en=
dproc directive
> > >
> > > Removing -O2 works, I'll check if this is still happening with gcc-4.=
8.1 when we have
> > > recipes for it and report upstream if needed
> >=20
> > hmmm it needs to be reported. Can you generate preprocessed file and
> > put it somewhere accessible
>=20
> I plan to, I just wanted to reproduce it with 4.8.1 and backported
> http://gcc.gnu.org/ml/gcc-cvs/2013-03/msg00784.html to see if it wasn't
> fixed upstream already.
>=20
> I guess we were all waiting for you to return from holidays and update
> gcc to 4.8.1 :).

Done
http://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D57735

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--z+pzSjdB7cqptWpS
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iEYEARECAAYFAlHMYTQACgkQN1Ujt2V2gBzO9ACfdg3T9gCREFtHif7gOJuLI4hC
YzwAoIZj3ns/u7Lie80Yx4Py+ioY6YPB
=sltj
-----END PGP SIGNATURE-----

--z+pzSjdB7cqptWpS--
