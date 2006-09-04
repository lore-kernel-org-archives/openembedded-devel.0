Received: from [64.233.166.179] (helo=py-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <pmiscml@gmail.com>) id 1GKLWk-0007yc-Ox
	for openembedded-devel@lists.openembedded.org;
	Mon, 04 Sep 2006 22:58:42 +0200
Received: by py-out-1112.google.com with SMTP id i75so2362443pye
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 04 Sep 2006 13:56:01 -0700 (PDT)
Received: by 10.35.78.1 with SMTP id f1mr10938141pyl;
	Mon, 04 Sep 2006 13:56:01 -0700 (PDT)
Received: from CUBE ( [82.193.96.237])
	by mx.gmail.com with ESMTP id i5sm5221027nzi.2006.09.04.13.55.59;
	Mon, 04 Sep 2006 13:56:01 -0700 (PDT)
Date: Mon, 4 Sep 2006 23:56:03 +0300
From: Paul Sokolovsky <pmiscml@gmail.com>
X-Priority: 3 (Normal)
Message-ID: <13210487720.20060904235603@gmail.com>
To: =?utf-8?Q?=D0=A8yvind_Repvik?= <nail@nslu2-linux.org>
In-Reply-To: <44FC6D96.5030201@nslu2-linux.org>
References: <5144EF5B0ABC6745BEE64C74E43ABD8F11A0D8@moneypenny.softoption.local>
	<44FC6D96.5030201@nslu2-linux.org>
MIME-Version: 1.0
Cc: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@lists.openembedded.org>
Subject: Re: DVB scan utility
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.8
Precedence: list
Reply-To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@lists.openembedded.org>
List-Id: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 04 Sep 2006 20:58:43 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable

Hello =D8yvind,

Monday, September 4, 2006, 9:16:54 PM, you wrote:

> Mark Howells wrote:
>> Hi,
>> =20
>> Can anyone point me toward an OE port (ideally OpenSlug/Slugos binary) o=
f the linuxtv dvb 'scan' utility from HYPERLINK "http://www.linuxtv.org/dow=
nloads/linuxtv-dvb-apps-1.1.1.tar.gz"http://www.linuxtv.org/downloads/linux=
tv-dvb-apps-1.1.1.tar.gz. I've tried creating a bb file to compile it, but =
the Makefile is old and seems only capable of compiling natively. I don't h=
ave a native compiler on my slug - I guess I could install it, but if anyon=
e has a built binary or suitable BB/Make system it would help.

> The reason it compiles native binaries is simply that the Makefile=20
> defines $CC as 'gcc'.

> Applying the included diff should help the Makefile work as it was=20
> intended to do

   Likely, even better idea is to define EXTRA_OEMAKE and override
Makefiles vars there:

EXTRA_OEMAKE =3D "CC=3D'${CC}'"

   Of course, I may be missing something and that might not work for
this package, but looking at the proposed diff, it may be a good idea
to try, if wasn't done.

> Regards,
> =D8yvind Repvik
> SlugOS package manager



--=20
Best regards,
 Paul                            mailto:pmiscml@gmail.com



