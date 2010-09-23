Received: from proxy.dresearch.de ([87.193.137.100] helo=mail.dresearch.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sledz@dresearch.de>) id 1OyknG-0007My-Sh
	for openembedded-devel@lists.openembedded.org;
	Thu, 23 Sep 2010 14:21:01 +0200
Received: from exchange.intern.dresearch.de (owa.xfer-intern.dresearch.de
	[192.168.32.16])
	by mail.dresearch.de (Postfix) with ESMTP id 17AA7491282
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Sep 2010 14:20:51 +0200 (CEST)
Received: from [127.0.0.1] ([10.32.10.2]) by exchange.intern.dresearch.de with
	Microsoft SMTPSVC(6.0.3790.4675); Thu, 23 Sep 2010 14:20:50 +0200
Message-ID: <4C9B463A.9020801@dresearch.de>
Date: Thu, 23 Sep 2010 14:21:14 +0200
From: Steffen Sledz <sledz@dresearch.de>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; de;
	rv:1.9.2.9) Gecko/20100915 Lightning/1.0b2 Thunderbird/3.1.4
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1285241444.3691.60.camel@mattotaupa>
In-Reply-To: <1285241444.3691.60.camel@mattotaupa>
X-OriginalArrivalTime: 23 Sep 2010 12:20:50.0859 (UTC)
	FILETIME=[C2AC8FB0:01CB5B19]
X-SA-Exim-Connect-IP: 87.193.137.100
X-SA-Exim-Mail-From: sledz@dresearch.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: libatasmart_0.13.bb: `No package 'libudev' found` and `./strpool: ./strpool: cannot execute binary file`
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
X-List-Received-Date: Thu, 23 Sep 2010 12:21:01 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Am 23.09.2010 13:30, schrieb Paul Menzel:
> I am trying to build `libatasmart_0.13.bb`.
>=20
> Using Minimal as distribution `do_configure()` fails, because package
> config for libudev is not found.
>=20
>         [=E2=80=A6]
>         | checking for arm-oe-linux-gnueabi-pkg-config... no
>         | checking for pkg-config... /oe/build-minimal-eglibc/minimal-d=
ev/sysroots/i686-linux/usr/bin/pkg-config
>         | configure: WARNING: using cross tools not prefixed with host =
triplet
>         | checking pkg-config is at least version 0.9.0... yes
>         | checking for LIBUDEV... configure: error: Package requirement=
s (libudev) were not met:
>         |
>         | No package 'libudev' found
>         |
>         | Consider adjusting the PKG_CONFIG_PATH environment variable i=
f you
>         | installed software in a non-standard prefix.
>         |
>         | Alternatively, you may set the environment variables LIBUDEV_=
CFLAGS
>         | and LIBUDEV_LIBS to avoid the need to call pkg-config.
>         | See the pkg-config man page for more details.
>         |
>         | ERROR: Function do_configure failed
>         NOTE: package libatasmart-0.13-r1: task do_configure: Failed
>         [=E2=80=A6]
>=20
> `find minimal-dev/ -name *libudev*` did not return anything useful.
> Steffen added `udev` to `DEPENDS` [1] but that does not seem to help.
> (Although I do not know if he saw the same error as I do, because it is
> not mentioned in the commit message.)

Yes i saw exactly this error.

Steffen



