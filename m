Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f51.google.com (mail-wm0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id 566A7607A4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Apr 2016 09:22:05 +0000 (UTC)
Received: by mail-wm0-f51.google.com with SMTP id e201so42907631wme.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Apr 2016 02:22:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=5XFGXbKCFOil02EB1eTPkRkobbPWY/4mVjNXyIRnWdw=;
	b=d0NB1xHNuJbAqc7TBn0uedCJxflfSq3JEbmR1v19+VgancZ9BU3amAhB1wOymfJebC
	GhhVS26rQBSk1jU8dgkhunvXpY6jRvSG3kkbZ8OvtxIli/jbhMCHw9VAHZWwY7/AG2L8
	w6J4TMqaDtInHGbVnk3KxXGkTsF6QmoBtATicD1tlWKV9dz6mDJXguw7qIpHRHtNj4H1
	qJ2fzkx6LXRat5ogycPL4XQTUM2VOGMB9g5K7595IzhkESCRv8OZGZ28mM6TjWI0C3mi
	F+UlNTMXGhVbdHl7TLyKiRRW761oBmo41OaDhFaqerca31qi/vlK0jOm+VnUu8d10m2r
	mSJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=5XFGXbKCFOil02EB1eTPkRkobbPWY/4mVjNXyIRnWdw=;
	b=hdBfhod6YNxtcMj+zddEMcHYV5Hh8Goj2uZhvOLeGJDd5h0nb9d9ER7sQejazBdynY
	41BM+X7M0nx+pvmCmWLnWhEKchs3m7GN6Rs0bso9NxzF3NtSe1DSISjarjBdoAuonzGS
	O59wrqcSaCYQRp5SjADH2LfnwJA+5uSh9znxOq7k3ET2x9QlLD2wMcVO/14irTt3NYMz
	1yTdNKJ1cp9vDJysJcwIDdL6lCK2SDVLmu7BUskKYc7GcpZl3tqXxEQmgdXTcco3ai2M
	KOC+/6lgOKnV+MqV1KBfUvgSwabLlTY6H/8bslXo6Yrb2cBxU3gUCEyQghrwuV3vS64e
	XduQ==
X-Gm-Message-State: AOPr4FV0KRie/Y69RrAlKi3M67Cju3cwM+EF5Q6IEATpZ5szUO4yIqjepo4pETghRoAdlQ==
X-Received: by 10.28.127.80 with SMTP id a77mr8502579wmd.84.1461144126045;
	Wed, 20 Apr 2016 02:22:06 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id o1sm4583222wjm.11.2016.04.20.02.22.04
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 20 Apr 2016 02:22:04 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 20 Apr 2016 11:24:04 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160420092404.GA2561@jama>
References: <1460317290-4787-1-git-send-email-schnitzeltony@googlemail.com>
	<1460317290-4787-2-git-send-email-schnitzeltony@googlemail.com>
	<20160412102200.GD2564@jama>
	<CALbNGRQHekxMgsVgQnT8ACK7pKiSTGJ1KRmNLyvH7rsZ=9Zz8w@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CALbNGRQHekxMgsVgQnT8ACK7pKiSTGJ1KRmNLyvH7rsZ=9Zz8w@mail.gmail.com>
User-Agent: Mutt/1.6.0 (2016-04-01)
Subject: Re: [meta-qt5][PATCH v2 01/31] qtbase-native: update sources to 5.6.0
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
X-List-Received-Date: Wed, 20 Apr 2016 09:22:06 -0000
X-Groupsio-MsgNum: 61071
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="AhhlLboLdkugWU4S"
Content-Disposition: inline

--AhhlLboLdkugWU4S
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 12, 2016 at 12:56:02PM +0200, Andreas M=FCller wrote:
> On Tue, Apr 12, 2016 at 12:22 PM, Martin Jansa <martin.jansa@gmail.com> w=
rote:
> > On Sun, Apr 10, 2016 at 09:41:00PM +0200, Andreas M=FCller wrote:
> >> Signed-off-by: Andreas M=FCller <schnitzeltony@googlemail.com>
> >
> > How did you pick these SRCREVs?
> If tag for 5.6.0 available: I picked versions tagged.
> If tag not available I chose revision right before 5.6.1 (as qtqick1)
> out of 5.6 tree.
> >
> > OE @ ~/projects/qt-project/qtbase $ git log --oneline 41706400f605524a5=
a9953714aa0cfbf811dba7e..d0cdc7ad1e2728caf363abf328b2ad81f2ed5a5b
> > d0cdc7a DirectFB: Fix build in C++98 mode
> > 3bcc3037 fix non-git non-prefix shadow builds
> > ae2d11d Add changelog for 5.6.0
> > 38944d6 Fix syncqt.pl not respecting #pragma qt_no_master_include in fi=
les with Windows line endings
> > 469e293 Fix crash when a standard bus isn't available
> > bcdcde0 Doc: Simple CSS style: Convert font-sizes from px to pt
> > 719623a Fix builds without session management.
> > e7bf0ed Add option to disable "session management by closing windows".
> >
> >
> > It's actually missing some changes which were included in previous SRCR=
EV, I usually use latest in e.g. 5.6 branch
> > even when it sets the version for next release (e.g. 5.6.1).
> I was not aware of that. So we'll have to wait for 5.6.1 (whenever it
> appears) if we want released versions without going backwards.
>=20
> As already noted in V2 description: Version mix 5.6.0/5.6.1 causes
> cmake trouble and as heavy user of cmake in meta-qt5-extra I would
> like to avoid...

This revision also has issues building examples, my build failed with:

| /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/q=
tbase/5.6.0+gitAUTOINC+d0cdc7ad1e-r0/git/examples/widgets/mainwindows/appli=
cation/mainwindow.cpp: In constructor 'MainWindow::MainWindow()':
| /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/q=
tbase/5.6.0+gitAUTOINC+d0cdc7ad1e-r0/git/examples/widgets/mainwindows/appli=
cation/mainwindow.cpp:62:5: error: 'setFallbackSessionManagementEnabled' is=
 not a member of 'QGuiApplication'
|      QGuiApplication::setFallbackSessionManagementEnabled(false);
|      ^
| /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/q=
tbase/5.6.0+gitAUTOINC+d0cdc7ad1e-r0/git/examples/widgets/mainwindows/appli=
cation/mainwindow.cpp:63:20: error: 'commitDataRequest' is not a member of =
'QGuiApplication'
|      connect(qApp, &QGuiApplication::commitDataRequest,
|                     ^

Which most likely was fixed with:
> > 719623a Fix builds without session management.
which is missing in this older SRCREV

To move forward I've squashed your SRCREV changes to single commit and now =
I'm preparing another
change which will bump SRCREVs to latest in 5.6 branches. This way people w=
ho care more about exact
5.6.0 version can use meta-qt5 revision with just your change, other people=
 can follow latest 5.6
and get also the examples build fixed from upstream.

Regards,
--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--AhhlLboLdkugWU4S
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlcXSrMACgkQN1Ujt2V2gBznKwCggSwFnVa+GPYHJEDemDiXySTv
j2QAn3xAflUVKtjEkjoq14b0NEu1Oem6
=TDeb
-----END PGP SIGNATURE-----

--AhhlLboLdkugWU4S--
