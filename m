Return-Path: <jeff.dagenais@gmail.com>
Received: from mail-qg0-f50.google.com (mail-qg0-f50.google.com
	[209.85.192.50])
	by mail.openembedded.org (Postfix) with ESMTP id 6FCD27327E
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 Apr 2016 17:21:08 +0000 (UTC)
Received: by mail-qg0-f50.google.com with SMTP id c6so69023396qga.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Apr 2016 10:21:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:subject:date:message-id:to:mime-version;
	bh=X/ZRl38TGWfE6+YC8XcpHU4XET0sC9CZMthsYGWu8q4=;
	b=GyO/NPFASBSbCuW8G1HWrMTmJzFgcRBGMxCtjPZ5K76ldrl+M/Nuklix+S3YRolC8j
	V58JQ0tYgFjifBl8AyOuACvWbiJKlupPvxUKu6q/kREtCx8VexET36UwedJsp8L6NmiS
	LPcSfR3Q37k5md/IgzkRPulSAM7qYX/Fsy1lJTSFbhOblRd+hIxNyZ952pd4O/aEZL96
	e1cfqPRl5ipAld6kEIMw1Cfa9qP0ZY8RDz6TfgVD0lN63zH1uZLY4mo6hkpo8rq9vcGl
	1RhYE9LkqgiEZbmUZwgbozkdVdIKcMYEoNQDdD9A9/eu3B4lndM7TSyMWOq2yuSiVmqs
	J8PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:subject:date:message-id:to:mime-version;
	bh=X/ZRl38TGWfE6+YC8XcpHU4XET0sC9CZMthsYGWu8q4=;
	b=ToUgKEmW/rdv8eeZaxm1wfoFJ48d88A2ahVJCjTmfIKcVJmjJ+jXaE8n822r9KSNbq
	czFkof/iCQmt6YysGNOAYy2cCNZzkGy8LY5JqsJnV70c4vU+uYeU2A04Lbe4Bp4sfUfW
	Hkg9AX44gcAjuW6EhJo4lIKNhpqC+jfFdVY7qaQiD4m/QH/xHq2LuX/iMufrt9psOUp8
	+I6t42tpk4t9BZq90y6i0FtyI4ylzH0VY/rGR2w/qslvZvhDCzM5+SibdavSy/pZu2zd
	FjwCelRkOo26ro7wZXdfTrL7mgY3C9Fpxjcz/1ntlvyCBkcMVge3nbK6BBIe4ffaxmar
	+4wg==
X-Gm-Message-State: AD7BkJJE8z/efOrm/ua+GPeZ8ogJLgVyLRsBtlscJAiLk4NqpbGJCzhZ+sHNgPcdjiD2bw==
X-Received: by 10.140.105.180 with SMTP id c49mr5289368qgf.36.1460049668668;
	Thu, 07 Apr 2016 10:21:08 -0700 (PDT)
Received: from jfdmac.sonatest.net
	(modemcable066.15-37-24.static.videotron.ca. [24.37.15.66])
	by smtp.gmail.com with ESMTPSA id 18sm3780758qhm.9.2016.04.07.10.21.07
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 07 Apr 2016 10:21:07 -0700 (PDT)
From: Jean-Francois Dagenais <jeff.dagenais@gmail.com>
X-Pgp-Agent: GPGMail 2.5.2
Date: Thu, 7 Apr 2016 13:21:05 -0400
Message-Id: <6245F2E3-BAF0-4EE9-AF56-64706B0F8F43@gmail.com>
To: openembedded-devel@lists.openembedded.org
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
X-Mailer: Apple Mail (2.2104)
Subject: meta-qt5: sdk, qtcreator and OE_QMAKE_ variables
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 07 Apr 2016 17:21:08 -0000
X-Groupsio-MsgNum: 60881
Content-Type: multipart/signed;
	boundary="Apple-Mail=_C71973E0-59D2-49EE-8C96-81F6CECB93D8";
	protocol="application/pgp-signature"; micalg=pgp-sha512

--Apple-Mail=_C71973E0-59D2-49EE-8C96-81F6CECB93D8
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

Hi all!

We use QtCreator on the developper desktop for much of our development. =
The
target builds are made with a yocto sdk which we made using =
"populate_sdk" with
qt4 included.

Since we jump from native builds to targeted builds, I devised a way not =
to use
the full sourcing of environment-setup-xyz.sh when invoking qtcreator. =
Doing so
would mess up the native (desktop) builds and we'd have to stop and =
relaunch
qtcreator many times per day. Not to mention the aggravation of not =
being in the
right environment and not realizing it for while when switching tasks.

We create a qtcreator "kit" composed of the yocto SDK's qmake, gcc and =
gdb. All
that is missing then are the OE_QMAKE_xyz variables which are put into =
the qmake
generated Makefiles. Using toolchain_create_sdk_env_script_append as a =
hook, I
generate a text file with the OE_QMAKE_xyz variables pre-expanded in a =
format
suitable of being copy/pasted in the "Batch Edit..." button of the build
environment setup of qtcreator projects.

Works pretty well. (Our targets were both x86_64 and x86 based). This =
was on
fido with qt4. Now moving onto yocto's master branch and meta-qt5, I =
want to
take it further and skip the whole copy/pasted env stuff. Which is an =
annoyance
since we each need to copy/paste for each project we setup in qtcreator =
and are
stored in the "volatile" .pro.user files.

If it is the case that all what's missing are the pre-expansions of =
OE_QMAKE_
variables, it seems like a simple task. I noticed the =
oe-device-extra.pri (from
the "No such file or directory" error messages I get when using the =
SDK). So
starting from the same sdk_env_script_append strategy, I create this =
file at the
proper place. By inspecting the linux-oe-g++/qmake.conf and where it =
includes
oe-device-extra.pri, I figured what the file should contain to properly =
set the
QMake variables whith pre-expanded stuff (targeted items like
arm-piko-linux-gnueabi-g++ etc.) and no longer rely on OE_QMAKE_xyz to =
be in the
environment.

This way I do NOT have to source the environment, the builds succeed and =
once
deployed, they execute (still very early in testing tough).

One more thing, we systematically relocate the SDK install to a path in =
the
user's home. I am in the process of reviewing if there is "leakage" into =
either
/opt/poky/x.y.z/... or my system.

Does anyone have any insights, warning, suggestions regarding this =
strategy? It
seems too easy and pretty to be true, I am thus weary. Perhaps this fits =
only
our limited target scenarios?


Thanks in advance!  Cheers!  /JFD


--Apple-Mail=_C71973E0-59D2-49EE-8C96-81F6CECB93D8
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iF4EAREKAAYFAlcGlwIACgkQjTW55WAAo4+oFwD+IV/hM+ghycPLCOA+XPNvbULs
84ogy5LI6/aqoyx7z20BALzF3dxruqAKG1sbZpgp/jARo7p8d7OfE8quoIwLJC0W
=s6tR
-----END PGP SIGNATURE-----

--Apple-Mail=_C71973E0-59D2-49EE-8C96-81F6CECB93D8--
