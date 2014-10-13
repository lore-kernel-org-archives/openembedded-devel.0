Return-Path: <anders@chargestorm.se>
Received: from stoexhubfe02.domain01.net (STOEXHUBFE02.domain01.net
	[83.145.59.141])
	by mail.openembedded.org (Postfix) with ESMTP id 4F3836A362
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Oct 2014 07:11:07 +0000 (UTC)
Received: from ad.chargestorm.se (62.156.150.204) by stoexhubfe02.domain01.net
	(10.12.10.7) with Microsoft SMTP Server (TLS) id 8.3.279.1;
	Mon, 13 Oct 2014 09:11:06 +0200
Date: Mon, 13 Oct 2014 09:10:37 +0200
From: Anders Darander <anders@chargestorm.se>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Message-ID: <20141013071037.GA5099@ad.chargestorm.se>
Mail-Followup-To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
References: <CANR6C54p6yC1FPviBpmX-qHiF198s3vK7UWEmmDj3hYs7mAovQ@mail.gmail.com>
	<CANR6C57416FmV0MHSKmKLvD=Xdf=Lds5OnrHu_6nCW8z3qB_jg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CANR6C57416FmV0MHSKmKLvD=Xdf=Lds5OnrHu_6nCW8z3qB_jg@mail.gmail.com>
X-Accept-Language: sv, en, de
X-GPG-Fingerprint: 5AF0 B2E9 78FE 9D75 D110  6F8F 3E31 84D7 920E 938C
X-GPG-Key-Id: 0x920E938C
X-GPG-Keyserver: hkp://keys.gnupg.net
Organization: ChargeStorm AB
User-Agent: Mutt/1.5.23 (2014-03-12)
X-GFI-SMTP-Submission: 1
Subject: Re: [meta-qt5] What is needed to build a recipe with CMake?
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
X-List-Received-Date: Mon, 13 Oct 2014 07:11:09 -0000
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

* Nick D'Ademo <nickdademo@gmail.com> [141013 01:50]:
> Has anyone had any success at all building a Qt5-based recipe with CMake?

Yes, I've at least got a local recipe here building KDSoap, which uses
cmake.



> On Wed, Oct 8, 2014 at 1:41 PM, Nick D'Ademo <nickdademo@gmail.com> wrote:

> > Looks like the *qmake* binary cannot be found.

> > The relevant parts of the recipe are as follows:


> > *DEPENDS =3D "qtbase"*

Just as you, I've got hte DEPENDS li=C5=84e above in my recipe. However, I'=
ve
also the following line (situated after the DEPENDS +=3D...)

inherit qmake5

That line should set up all the necessary path's in order to find qmake.

Let us know if this helps you.

Cheers,
Anders

--=20
Abstainer, n.:
	A weak person who yields to the temptation of denying himself a
	pleasure.
		-- Ambrose Bierce, "The Devil's Dictionary"

