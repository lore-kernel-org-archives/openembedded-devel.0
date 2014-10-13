Return-Path: <anders@chargestorm.se>
Received: from stoexhubfe01.domain01.net (STOEXHUBFE01.domain01.net
	[83.145.59.140])
	by mail.openembedded.org (Postfix) with ESMTP id B7D0460167
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Oct 2014 21:44:15 +0000 (UTC)
Received: from ad.chargestorm.se (195.158.157.135) by
	stoexhubfe01.domain01.net (10.12.10.6) with Microsoft SMTP Server (TLS)
	id 8.3.279.1; Mon, 13 Oct 2014 23:44:14 +0200
Date: Mon, 13 Oct 2014 23:43:42 +0200
From: Anders Darander <anders@chargestorm.se>
To: Nick D'Ademo <nickdademo@gmail.com>
Message-ID: <20141013214342.GA4461@ad.chargestorm.se>
Mail-Followup-To: Nick D'Ademo <nickdademo@gmail.com>,
	openembedded-devel <openembedded-devel@lists.openembedded.org>
References: <CANR6C54p6yC1FPviBpmX-qHiF198s3vK7UWEmmDj3hYs7mAovQ@mail.gmail.com>
	<CANR6C57416FmV0MHSKmKLvD=Xdf=Lds5OnrHu_6nCW8z3qB_jg@mail.gmail.com>
	<20141013071037.GA5099@ad.chargestorm.se>
	<CANR6C54sFocGNOmgQ65vJy_ZEmadg_LBReDQf8w=TKxYKXhxhg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CANR6C54sFocGNOmgQ65vJy_ZEmadg_LBReDQf8w=TKxYKXhxhg@mail.gmail.com>
X-Accept-Language: sv, en, de
X-GPG-Fingerprint: 5AF0 B2E9 78FE 9D75 D110  6F8F 3E31 84D7 920E 938C
X-GPG-Key-Id: 0x920E938C
X-GPG-Keyserver: hkp://keys.gnupg.net
Organization: ChargeStorm AB
User-Agent: Mutt/1.5.23 (2014-03-12)
X-GFI-SMTP-Submission: 1
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
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
X-List-Received-Date: Mon, 13 Oct 2014 21:44:24 -0000
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

* Nick D'Ademo <nickdademo@gmail.com> [141013 23:10]:
>    Are you using Qmake or Cmake to build? (I suspect Qmake).
>    My source code actually has no .PRO file.

Hm, when you state it like that ;)=20
I might very well have changed it to not use cmake... KDSoap is shipping
multiple build systems etc, and as long as I can get it to build...

However, Martin gave you a hint to look at meta-webos-port for more
recipes using cmake.

Have you inherited cmake_qt5? That class ought to set everything up for
you.

Cheers,
Anders

>    On Mon, Oct 13, 2014 at 6:10 PM, Anders Darander
>    <[1]anders@chargestorm.se> wrote:

>      Hi,
>      * Nick D'Ademo <[2]nickdademo@gmail.com> [141013 01:50]:
>      > Has anyone had any success at all building a Qt5-based recipe with
>      CMake?
>      Yes, I've at least got a local recipe here building KDSoap, which
>      uses
>      cmake.
>      > On Wed, Oct 8, 2014 at 1:41 PM, Nick D'Ademo
>      <[3]nickdademo@gmail.com> wrote:
>      > > Looks like the *qmake* binary cannot be found.
>      > > The relevant parts of the recipe are as follows:
>      > > *DEPENDS =3D "qtbase"*
>      Just as you, I've got hte DEPENDS li=C5=84e above in my recipe. Howe=
ver,
>      I've
>      also the following line (situated after the DEPENDS +=3D...)
>      inherit qmake5
>      That line should set up all the necessary path's in order to find
>      qmake.
>      Let us know if this helps you.
>      Cheers,
>      Anders
>      --
>      Abstainer, n.:
>              A weak person who yields to the temptation of denying
>      himself a
>              pleasure.
>                      -- Ambrose Bierce, "The Devil's Dictionary"
>      --
>      _______________________________________________
>      Openembedded-devel mailing list
>      [4]Openembedded-devel@lists.openembedded.org
>      [5]http://lists.openembedded.org/mailman/listinfo/openembedded-devel

> References

>    1. mailto:anders@chargestorm.se
>    2. mailto:nickdademo@gmail.com
>    3. mailto:nickdademo@gmail.com
>    4. mailto:Openembedded-devel@lists.openembedded.org
>    5. http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Anders Darander
ChargeStorm AB		Tel: +46 702 44 84 36
Hospitalsgatan 8	Email: anders@chargestorm.se
602 27 Norrk=C3=B6ping	Web: www.chargestorm.se

