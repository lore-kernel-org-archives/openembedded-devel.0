Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f172.google.com (mail-we0-f172.google.com
	[74.125.82.172])
	by mail.openembedded.org (Postfix) with ESMTP id BAD7865CC9
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Jul 2014 20:11:50 +0000 (UTC)
Received: by mail-we0-f172.google.com with SMTP id x48so1762236wes.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Jul 2014 13:11:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=rSek4SMRI5NMDLLGq/5sZv7HGukWILTr7k5qTUsIkRk=;
	b=ChiYR9A0V11iPaR1G5/b8/vcC9cbJOr0iF8nYqClyPf0E+VwocmWd0kXx+THOE3sCD
	e2WSPPvRYi/urE3JbNDZh9j7gdfKIbgP76Ev6FSf/HnBWRUrapJsSQJ1pFG97tOkT3sJ
	3TppiTFhL2YrU6pghdO96/DtMV8dfv3e/93KbWnz0Gz4xQEqGo5wSFNU0Cv74y+aILp/
	YMNgzEyWzSI/KQvn6K7DmbaVGEBlkyboPnxdaktT2ks6e0t5CuW2OwxJ78j46J2A8TV1
	UIy0+ZiXWtEog36nPXRrYCbBGuC5B5OD98E2eyA47NoJ4WZnkAFKDUN9lC69cmSu46HM
	zQAA==
X-Received: by 10.194.185.113 with SMTP id fb17mr9542917wjc.117.1406751111373; 
	Wed, 30 Jul 2014 13:11:51 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	fs17sm7921629wjc.6.2014.07.30.13.11.49 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 30 Jul 2014 13:11:50 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 30 Jul 2014 22:12:14 +0200
To: openembedded-devel@lists.openembedded.org,
	Ross Burton <ross.burton@intel.com>
Message-ID: <20140730201214.GV16445@jama>
References: <1405147077-22498-1-git-send-email-eduardo@monkey.io>
	<20140718181535.GQ2433@jama>
	<CAEaCVQj60r8pmT4RwLWZ3RO5NvkKzbQPHbkdhOqhoX3zbO2mRw@mail.gmail.com>
	<20140718182742.GR2433@jama>
	<CAEaCVQjMYWSZQQYj+wueXund=+XRyfnzXtmrg6WW8FyCSztukQ@mail.gmail.com>
	<20140720214725.GG22875@jama> <20140725100507.GS2492@jama>
	<CAEaCVQjC6f-6o1DhjR_=pCSngLsg8xCFWG+BDCpwZp-kbNKMEw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAEaCVQjC6f-6o1DhjR_=pCSngLsg8xCFWG+BDCpwZp-kbNKMEw@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Directories in CONFFILES Was: [meta-webserver][PATCHv4] monkey: new v1.5.1 release.
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
X-List-Received-Date: Wed, 30 Jul 2014 20:11:57 -0000
X-Groupsio-MsgNum: 51336
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="E0IhBwMLbrMClE+H"
Content-Disposition: inline

--E0IhBwMLbrMClE+H
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 26, 2014 at 09:03:21AM -0600, Eduardo Silva wrote:
> hi Martin,
>=20
>=20
> > > My builds are using "distroless" setup, if you're using poky then it's
> > > possible that there is still sysvinit added in your DISTRO_FEATURES
> > > somewhere (check bitbake -e monkay) so the sysv init script isn't
> > > removed in the end for you.
> >
> > I've just noticed that CONFFILES is set to
> > ${sysconfdir}/monkey/
> >
> > so it's not caused by missing init.d script but whole
> > ${sysconfdir}/monkey/ is empty in PN, can you check what's installed
> > there in your builds?
> >
> > It's either not installed when some dependency is missing or it's
> > included in different package in my build (knowing which file to look
> > for would help).
> >
> >
> thanks for tracking this. In my build using Poky i get installed the
> following files:

I think I've finally found the root cause of this

The problem is that ${sysconfdir}/monkey/ is directory and ipk backend does=
n't
support directories in conffiles.

This is snipped from opkg-utils/opkg-build:

        if [ -f $CONTROL/conffiles ]; then
                for cf in `cat $CONTROL/conffiles`; do
                        if [ ! -f ./$cf ]; then
                                echo "*** Error: $CONTROL/conffiles mention=
s conffile $cf which does not exist" >&2
                                PKG_ERROR=3D1
                        fi
                done
        fi

+ Ross because of following commit in oe-core

Ross, I assume you didn't use os.path.isfile, because
RPM supports directories in conffiles, but maybe you had
plans for opkg-utils?

Do you have patch somewhere to extend opkg-utils to allow
directories in CONFFILES? Fix for this opkg-build check seems
trivial, but I haven't check how opkg will handle this on target.

commit fb87edc881009cf4d582cd95c248884551fe07fe
Author: Ross Burton <ross.burton@intel.com>
Date:   Tue Feb 5 21:12:50 2013 +0000

    package_ipk: check CONFFILES exist before adding them to metadata
   =20
    opkg-build verifies that conffiles exist, so verify that the specified =
files
    actually exist before writing them to conffiles.
   =20
    This mirrors the behaviour of FILES and package_rpm's CONFFILES handlin=
g.
   =20
    Signed-off-by: Ross Burton <ross.burton@intel.com>
    Signed-off-by: Saul Wold <sgw@linux.intel.com>

diff --git a/meta/classes/package_ipk.bbclass b/meta/classes/package_ipk.bb=
class
index d735051..e5e76ef 100644
--- a/meta/classes/package_ipk.bbclass
+++ b/meta/classes/package_ipk.bbclass
@@ -440,7 +440,8 @@ python do_package_ipk () {
                 bb.utils.unlockfile(lf)
                 raise bb.build.FuncFailed("unable to open conffiles for wr=
iting.")
             for f in conffiles_str.split():
-                conffiles.write('%s\n' % f)
+                if os.path.exists(oe.path.join(root, f)):
+                    conffiles.write('%s\n' % f)
             conffiles.close()
=20
         os.chdir(basedir)

Eduardo, temporary work around is either list all CONFFILEs separately or d=
rop
CONFFILES (like I did for world builds)

> root@qemux86:~# find /etc/monkey/
> /etc/monkey/
> /etc/monkey/sites
> /etc/monkey/sites/default
> /etc/monkey/plugins.load
> /etc/monkey/monkey.conf
> /etc/monkey/monkey.mime
> /etc/monkey/plugins
> /etc/monkey/plugins/fastcgi
> /etc/monkey/plugins/fastcgi/fastcgi.conf
> /etc/monkey/plugins/logger
> /etc/monkey/plugins/logger/logger.conf
> /etc/monkey/plugins/mandril
> /etc/monkey/plugins/mandril/mandril.conf
> /etc/monkey/plugins/dirlisting
> /etc/monkey/plugins/dirlisting/dirhtml.conf
> /etc/monkey/plugins/dirlisting/themes
> /etc/monkey/plugins/dirlisting/themes/guineo
> /etc/monkey/plugins/dirlisting/themes/guineo/entry.theme
> /etc/monkey/plugins/dirlisting/themes/guineo/footer.theme
> /etc/monkey/plugins/dirlisting/themes/guineo/header.theme
> /etc/monkey/plugins/cgi
> /etc/monkey/plugins/cgi/cgi.conf
> /etc/monkey/plugins/auth
> /etc/monkey/plugins/auth/monkey.users
> /etc/monkey/plugins/auth/README
> /etc/monkey/plugins/proxy_reverse
> /etc/monkey/plugins/proxy_reverse/proxy_reverse.conf
> /etc/monkey/plugins/cheetah
> /etc/monkey/plugins/cheetah/cheetah.conf
>=20
> if you need any extra info let me know,
>=20
> best
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--E0IhBwMLbrMClE+H
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlPZUZ4ACgkQN1Ujt2V2gBzgxQCgoCqpxRYnB6/upVbtGwuliL3O
n70AoKJ2L7VNoTEVPU+esvj5FOxp23Bq
=f4uE
-----END PGP SIGNATURE-----

--E0IhBwMLbrMClE+H--
