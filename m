Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f43.google.com (mail-wg0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id 192246A456
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  6 Jun 2013 12:34:00 +0000 (UTC)
Received: by mail-wg0-f43.google.com with SMTP id x12so1985870wgg.34
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 06 Jun 2013 05:34:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=LQP0tTAgRhQUytR/TvaAWH8uFeK8PtCvUcbdygdg1oc=;
	b=xgP81f7UInzpCLj5mBaOlaut2Pz/Y5s79njZ4zsinumEwXxGToyCq/vcMnzq3tLu2y
	cYGx6eIFToMpwk7y59Vm7eauv7nzrpXe3ar+HiU580LP0CyiPLIlSqgZUK/+qQC0IZ72
	FRv/P+WFqMzU9x5JCWYCtBE33PpPZS4lpQHT0RYqzuAobCBa55jzRZLdxT8wkkgFdzd1
	RdWSDaBVyckrkVPDnJ1/sHarupbyXooeago7PAufhJJdIeOboqcRD3SOIPr4J3EAcGBq
	Q7JlrUpSpc02Z0kQhAKDBm4TpwhQ3LFxP23qUbUwDSQqMitJeKh9dvCVIzKluQ9iI2L4
	oRdA==
X-Received: by 10.181.13.169 with SMTP id ez9mr2327358wid.8.1370522039180;
	Thu, 06 Jun 2013 05:33:59 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	ca19sm15519881wib.3.2013.06.06.05.33.58
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 06 Jun 2013 05:33:58 -0700 (PDT)
Date: Thu, 6 Jun 2013 14:34:17 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130606123417.GC22710@jama>
References: <1370109802-11739-1-git-send-email-Martin.Jansa@gmail.com>
	<20130602080956.GA3279@jama>
MIME-Version: 1.0
In-Reply-To: <20130602080956.GA3279@jama>
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
X-List-Received-Date: Thu, 06 Jun 2013 12:34:02 -0000
X-Groupsio-MsgNum: 44978
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="F8dlzb82+Fcn6AgP"
Content-Disposition: inline

--F8dlzb82+Fcn6AgP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 02, 2013 at 10:09:56AM +0200, Martin Jansa wrote:
> On Sat, Jun 01, 2013 at 08:03:22PM +0200, Martin Jansa wrote:
> > ---
> >  ...include-Element.h-for-hasTagName-function.patch | 43 ++++++++++++++=
++++++++
> >  meta-efl/recipes-efl/webkit/webkit-efl_svn.bb      |  3 +-
> >  2 files changed, 45 insertions(+), 1 deletion(-)
> >  create mode 100644 meta-efl/recipes-efl/webkit/webkit-efl/0001-ewk-inc=
lude-Element.h-for-hasTagName-function.patch
>=20
> Ignore this one, it works on armv7a, but fails the same on armv4t and
> x86_64 + there is ICE when building for armv5te.

I've merged this in the end, because it fixed webkit-efl build on
jenkins (and it looks like building from scratch works for other archs
I'm building locally too).

Only remaining issue is with -O2 and xscalete DEFAULT_TUNE where it
triggers ICE:

/OE/shr-core/tmp-eglibc/work/xscalete-oe-linux-gnueabi/webkit-efl/1.9.3+svn=
r120144-r3/src/Source/JavaScriptCore/runtime/JSGlobalObjectFunctions.cpp: I=
n functi
on 'JSC::JSValue JSC::_ZN3JSCL6decodeEPNS_9ExecStateEPKcb.constprop.89(JSC:=
:ExecState*, const char*)':
/OE/shr-core/tmp-eglibc/work/xscalete-oe-linux-gnueabi/webkit-efl/1.9.3+svn=
r120144-r3/src/Source/JavaScriptCore/runtime/JSGlobalObjectFunctions.cpp:15=
0:1: error: could not split insn
 }
 ^
(insn 505 8094 507 (set (reg:SI 1 r1 [orig:494 D.142535 ] [494])
        (plus:SI (reg/v:SI 5 r5 [orig:157 character ] [157])
            (const_int -17179934720 [0xfffffffbffff0000]))) /OE/shr-core/tm=
p-eglibc/work/xscalete-oe-linux-gnueabi/webkit-efl/1.9.3+svnr120144-r3/src/=
Source/JavaScriptCore/runtime/JSGlobalObjectFunctions.cpp:108 5 {*arm_addsi=
3}
     (nil))
/OE/shr-core/tmp-eglibc/work/xscalete-oe-linux-gnueabi/webkit-efl/1.9.3+svn=
r120144-r3/src/Source/JavaScriptCore/runtime/JSGlobalObjectFunctions.cpp:15=
0:1: internal compiler error: in final_scan_insn, at final.c:2897
Please submit a full bug report,
with preprocessed source if appropriate.
See <http://gcc.gnu.org/bugs.html> for instructions.
{standard input}: Assembler messages:
{standard input}: Error: open CFI at the end of file; missing .cfi_endproc =
directive

Removing -O2 works, I'll check if this is still happening with gcc-4.8.1 wh=
en we have
recipes for it and report upstream if needed

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--F8dlzb82+Fcn6AgP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iEYEARECAAYFAlGwgckACgkQN1Ujt2V2gBxpJwCeJrzZa4ScevxZchrLV07+ZERd
O9QAn2/iVbfD3sRgz7neH1tz64vwaq+C
=OIXa
-----END PGP SIGNATURE-----

--F8dlzb82+Fcn6AgP--
