Received: from static.26.116.47.78.clients.your-server.de ([78.47.116.26]
	helo=phalanx.drlauer-research.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mickey@vanille-media.de>) id 1Oy9dB-0005Uq-0O
	for openembedded-devel@lists.openembedded.org;
	Tue, 21 Sep 2010 22:40:01 +0200
Received: from [192.168.1.89] (unknown [83.52.9.84])
	by phalanx.drlauer-research.com (Postfix) with ESMTP id 13D615847EB;
	Tue, 21 Sep 2010 22:46:23 +0200 (CEST)
Mime-Version: 1.0 (Apple Message framework v1081)
From: "Dr. Michael Lauer" <mickey@vanille-media.de>
In-Reply-To: <1285021068.2453.80.camel@mattotaupa>
Date: Tue, 21 Sep 2010 22:39:50 +0200
Message-Id: <B0FC541D-E768-4B3B-95FF-E9EC5C5C51BF@vanille-media.de>
References: <1284228112.14396.159.camel@mattotaupa>
	<1285021068.2453.80.camel@mattotaupa>
To: Paul Menzel <paulepanter@users.sourceforge.net>
X-Mailer: Apple Mail (2.1081)
X-SA-Exim-Connect-IP: 78.47.116.26
X-SA-Exim-Mail-From: mickey@vanille-media.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,HTML_MESSAGE
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: minimal-uclibc: freesmartphone/libfsobasics_git.bb: do_compile() failed: utilities.c:35:22: fatal error: execinfo.h: No such file or directory
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
X-List-Received-Date: Tue, 21 Sep 2010 20:40:01 -0000
Content-Type: text/plain;
	charset=windows-1252
Content-Transfer-Encoding: quoted-printable

Hi Paul,

>> 	utilities.c:35:22: fatal error: execinfo.h: No such file or =
directory
>> 	compilation terminated.
>> 	make[3]: *** [utilities.lo] Error 1
>> 	make[3]: Leaving directory =
`/oe/build-minimal-uclibc/minimal-uclibc-dev/work/armv7a-oe-linux-uclibcea=
bi/libfsobasics-1_0.9.10+gitr0+b163e36f9c960c6fea92168e88201be98dcceaef-r2=
.0/git/libfsobasics/fsobasics'
>> 	make[2]: *** [all] Error 2
>> 	make[2]: Leaving directory =
`/oe/build-minimal-uclibc/minimal-uclibc-dev/work/armv7a-oe-linux-uclibcea=
bi/libfsobasics-1_0.9.10+gitr0+b163e36f9c960c6fea92168e88201be98dcceaef-r2=
.0/git/libfsobasics/fsobasics'
>> 	make[1]: *** [all-recursive] Error 1
>> 	make[1]: Leaving directory =
`/oe/build-minimal-uclibc/minimal-uclibc-dev/work/armv7a-oe-linux-uclibcea=
bi/libfsobasics-1_0.9.10+gitr0+b163e36f9c960c6fea92168e88201be98dcceaef-r2=
.0/git/libfsobasics'
>> 	make: *** [all] Error 2
>> 	FATAL: oe_runmake failed
>> 	ERROR: Function do_compile failed
>>=20
>> Does anyone have a clue on how that can be fixed.
>=20
> `execinfo.h` is not available in uClibc and is a =93GNUism=94 [2]. The
> dependency in in `linux.vapi` [3] and got included in [4].
>=20
> Unfortunately I do not know how to exclude that. I guess Autotools
> should check if `execinfo.h` is available and only use it if it is. =
But
> I do not know how to do that. Michael, are those libraries intended to
> be used with uClibc?

Yeah. I'll think about a way to fix it when I'm back
end of next week (currently on vacation).

> If this is too much work, how can I exclude this recipe from
> console-image for minimal-uclibc?

I bet there are some of my debugging utilities dragging
this in, check =96 and remove for now =96 these.

Cheers,

:M:


