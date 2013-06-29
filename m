Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f175.google.com (mail-we0-f175.google.com
	[74.125.82.175])
	by mail.openembedded.org (Postfix) with ESMTP id 16B166A4AC
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 29 Jun 2013 15:51:32 +0000 (UTC)
Received: by mail-we0-f175.google.com with SMTP id t59so2069565wes.20
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 29 Jun 2013 08:51:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=MMNNenfmboB0AS1Kogx0DhetAVVZwknM00Sd1w6CZ0Y=;
	b=C4HLvTPIdpqGbGT6XhJW5kBTAMpXYf2LshT1jnOJNYnhDZotDT+ebIQvGhhkeDuxF2
	9VWvmsj/q9P+wyDMRx6G4bAa2gNwXh+q9d5JG6dAK72kMemTl8PAWenU8GNPpIaRGPjK
	AR3gX2K0s65VB6zzj/WAZwF/1Q7FuKOygI97Hj99FYLh1b1SUnlF73C8xwenCdJAGKHR
	QnCWKkkT4V8EEa+Hg/cGFIbO/i26aC1JHlMBkkkLdIJViZiXJVLjOgC2uXOEH/BMj+Zb
	1BR4hXTuuCkr2jyAA+MrUOeFnCsehKBBoAy3eGDoGoIj1HyOFlQoa3ZQ4aHm2jCmvURH
	8QQA==
X-Received: by 10.180.187.136 with SMTP id fs8mr6860517wic.18.1372520754665;
	Sat, 29 Jun 2013 08:45:54 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	b7sm17591635eef.16.2013.06.29.08.45.53
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Sat, 29 Jun 2013 08:45:54 -0700 (PDT)
Date: Sat, 29 Jun 2013 17:46:35 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130629154635.GX3261@jama>
References: <1372437419-31205-1-git-send-email-raj.khem@gmail.com>
	<20130629122713.GT3261@jama>
	<3C785BCF-50C1-4144-8EEC-C2EF2663E2C6@gmail.com>
	<20130629153636.GW3261@jama>
MIME-Version: 1.0
In-Reply-To: <20130629153636.GW3261@jama>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-browser][PATCH V2 1/3] chromium: Remove older recipes
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
X-List-Received-Date: Sat, 29 Jun 2013 15:51:33 -0000
X-Groupsio-MsgNum: 45251
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="KRJ4yArSHF8vY7I3"
Content-Disposition: inline

--KRJ4yArSHF8vY7I3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 29, 2013 at 05:36:36PM +0200, Martin Jansa wrote:
> On Sat, Jun 29, 2013 at 07:30:59AM -0700, Khem Raj wrote:
> >=20
> > On Jun 29, 2013, at 5:27 AM, Martin Jansa <martin.jansa@gmail.com> wrot=
e:
> >=20
> > > Fails to apply cleanly:
> > >=20
> > > patching file recipes-browser/chromium/chromium/google-chrome.desktop
> > > Reversed (or previously applied) patch detected!  Assume -R? [n] ^C
> > >=20
> > >=20
> >=20
> > don't know what going on there in your tree, but I observed that one of=
 the patch is already applied
> > so I rebased the patch set on top of master and resent a V3. retry and =
let me know if it works
> > this time. If not I will push it to a contrib tree and you can cherry p=
ick
>=20
> I've double checked that my tree was identical to origin/master before
> writting this, then I've applied it manually and already pushed it before
> I've replied here, so I wonder if there is another repo which wasn't sync=
ed?
>=20
> Because your rebase should show that everything is already there.
>=20
> I've pushed it to:
> origin  git@github.com:OSSystems/meta-browser.git (push)

Few more details:

Can you compare downloaded patch from patchwork with your local version to =
see if it got broken by patchwork?

I've tried to apply v3 again in older revision and it fails the same.

OE @ ~/meta-browser $ git checkout -b dc77daa292ef10b38fdcd143d6bfae5008a81=
a5a dc77daa292ef10b38fdcd143d6bfae5008a81a5a
Switched to a new branch 'dc77daa292ef10b38fdcd143d6bfae5008a81a5a'

OE @ ~/meta-browser $ pw-am.sh.oe-core 52693
2013-06-29 17:40:39 URL:http://patchwork.openembedded.org/patch/52693/mbox/=
 [68535] -> "pw-am-52693.patch" [1]
Applying: chromium: Remove older recipes
/OE/meta-browser/.git/rebase-apply/patch:347: trailing whitespace.
if [ "${USER}" =3D "root" ] ; then=20
error: patch failed: recipes-browser/chromium/chromium/google-chrome.deskto=
p:1
error: recipes-browser/chromium/chromium/google-chrome.desktop: patch does =
not apply
Patch failed at 0001 chromium: Remove older recipes
The copy of the patch that failed is found in:
   /OE/meta-browser/.git/rebase-apply/patch
When you have resolved this problem, run "git am --resolved".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".

The same when tried from revision 1f633bb291fd71f0265a1402e6d6e53d95e00bd1
which is before that nspr commit you mentioned.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--KRJ4yArSHF8vY7I3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iEYEARECAAYFAlHPAVsACgkQN1Ujt2V2gByW1ACdF2rZRUlN6drK7fef7jtgVgiG
uycAmwbf5hG6TRM90snZ0FBVeX6dadU+
=KRjy
-----END PGP SIGNATURE-----

--KRJ4yArSHF8vY7I3--
