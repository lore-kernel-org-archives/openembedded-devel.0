Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f47.google.com (mail-ee0-f47.google.com [74.125.83.47])
	by mail.openembedded.org (Postfix) with ESMTP id B1BE56A99A
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Jun 2013 08:41:41 +0000 (UTC)
Received: by mail-ee0-f47.google.com with SMTP id e49so3491144eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Jun 2013 01:41:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=VjFC49K7VHV9ghOsw0znwPstxBC7XuZBcwD47k61SXY=;
	b=PWRYwqLxxTO7FjFLWtWjpLTM0KTs7OFYRUHSaTjn9OxhgBAmVLe63rZjdE7yveuAyu
	icoOwsamLUxWlm+hQsc9403kSAsyHrU/a8ygB0AIgC8QZIeWUO0OmRnoWk57IyxFi/1s
	fnZtelAWBRtTRi8MUnN9BWKydm5i//gfuOpf8ry4DD/5mTOJhXOuIxHOqQn8cGg8siDz
	UYBF2HABMc8Lu9rcNOBt8EL+3ibFGEhFYCFhQRdMnS7MYzYnKZR8sp95nh9Op0JYox5z
	TlEY9tTFgLmXoAhePf94dm/ek0kM8EzJUspe39wwnod/jbkTmeBNbJR3IXH5zm904T61
	Whag==
X-Received: by 10.14.32.197 with SMTP id o45mr15483061eea.9.1370940101312;
	Tue, 11 Jun 2013 01:41:41 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	y10sm28854355eev.3.2013.06.11.01.41.40
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Tue, 11 Jun 2013 01:41:40 -0700 (PDT)
Date: Tue, 11 Jun 2013 10:42:04 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130611084204.GB3233@jama>
References: <1370109802-11739-1-git-send-email-Martin.Jansa@gmail.com>
	<20130602080956.GA3279@jama> <20130606123417.GC22710@jama>
	<CAMKF1sr20XzmonOmtDExLhZdUts3KgpdiU2uyNVxUKBo5npamg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1sr20XzmonOmtDExLhZdUts3KgpdiU2uyNVxUKBo5npamg@mail.gmail.com>
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
X-List-Received-Date: Tue, 11 Jun 2013 08:41:42 -0000
X-Groupsio-MsgNum: 45027
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="tsOsTdHNUZQcU9Ye"
Content-Disposition: inline

--tsOsTdHNUZQcU9Ye
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 11, 2013 at 01:08:13AM -0700, Khem Raj wrote:
> On Thu, Jun 6, 2013 at 5:34 AM, Martin Jansa <martin.jansa@gmail.com> wro=
te:
> > On Sun, Jun 02, 2013 at 10:09:56AM +0200, Martin Jansa wrote:
> >> On Sat, Jun 01, 2013 at 08:03:22PM +0200, Martin Jansa wrote:
> >> > ---
> >> >  ...include-Element.h-for-hasTagName-function.patch | 43 +++++++++++=
+++++++++++
> >> >  meta-efl/recipes-efl/webkit/webkit-efl_svn.bb      |  3 +-
> >> >  2 files changed, 45 insertions(+), 1 deletion(-)
> >> >  create mode 100644 meta-efl/recipes-efl/webkit/webkit-efl/0001-ewk-=
include-Element.h-for-hasTagName-function.patch
> >>
> >> Ignore this one, it works on armv7a, but fails the same on armv4t and
> >> x86_64 + there is ICE when building for armv5te.
> >
> > I've merged this in the end, because it fixed webkit-efl build on
> > jenkins (and it looks like building from scratch works for other archs
> > I'm building locally too).
> >
> > Only remaining issue is with -O2 and xscalete DEFAULT_TUNE where it
> > triggers ICE:
> >
> > /OE/shr-core/tmp-eglibc/work/xscalete-oe-linux-gnueabi/webkit-efl/1.9.3=
+svnr120144-r3/src/Source/JavaScriptCore/runtime/JSGlobalObjectFunctions.cp=
p: In functi
> > on 'JSC::JSValue JSC::_ZN3JSCL6decodeEPNS_9ExecStateEPKcb.constprop.89(=
JSC::ExecState*, const char*)':
> > /OE/shr-core/tmp-eglibc/work/xscalete-oe-linux-gnueabi/webkit-efl/1.9.3=
+svnr120144-r3/src/Source/JavaScriptCore/runtime/JSGlobalObjectFunctions.cp=
p:150:1: error: could not split insn
> >  }
> >  ^
> > (insn 505 8094 507 (set (reg:SI 1 r1 [orig:494 D.142535 ] [494])
> >         (plus:SI (reg/v:SI 5 r5 [orig:157 character ] [157])
> >             (const_int -17179934720 [0xfffffffbffff0000]))) /OE/shr-cor=
e/tmp-eglibc/work/xscalete-oe-linux-gnueabi/webkit-efl/1.9.3+svnr120144-r3/=
src/Source/JavaScriptCore/runtime/JSGlobalObjectFunctions.cpp:108 5 {*arm_a=
ddsi3}
> >      (nil))
> > /OE/shr-core/tmp-eglibc/work/xscalete-oe-linux-gnueabi/webkit-efl/1.9.3=
+svnr120144-r3/src/Source/JavaScriptCore/runtime/JSGlobalObjectFunctions.cp=
p:150:1: internal compiler error: in final_scan_insn, at final.c:2897
> > Please submit a full bug report,
> > with preprocessed source if appropriate.
> > See <http://gcc.gnu.org/bugs.html> for instructions.
> > {standard input}: Assembler messages:
> > {standard input}: Error: open CFI at the end of file; missing .cfi_endp=
roc directive
> >
> > Removing -O2 works, I'll check if this is still happening with gcc-4.8.=
1 when we have
> > recipes for it and report upstream if needed
>=20
> hmmm it needs to be reported. Can you generate preprocessed file and
> put it somewhere accessible

I plan to, I just wanted to reproduce it with 4.8.1 and backported
http://gcc.gnu.org/ml/gcc-cvs/2013-03/msg00784.html to see if it wasn't
fixed upstream already.

I guess we were all waiting for you to return from holidays and update
gcc to 4.8.1 :).

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--tsOsTdHNUZQcU9Ye
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iEYEARECAAYFAlG24twACgkQN1Ujt2V2gBw6CwCgrXT2qZ2cf5m73ABbCAYCS8Y8
EDQAn030i3435hE8CWNnPM1OT3Lxv+fC
=LafS
-----END PGP SIGNATURE-----

--tsOsTdHNUZQcU9Ye--
