Received: from [212.27.42.1] (helo=smtp1-g21.free.fr)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jeremy.laine@bolloretelecom.eu>) id 1Low8k-0007fG-R1
	for openembedded-devel@lists.openembedded.org;
	Wed, 01 Apr 2009 10:49:43 +0200
Received: from smtp1-g21.free.fr (localhost [127.0.0.1])
	by smtp1-g21.free.fr (Postfix) with ESMTP id A2D239400A0
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  1 Apr 2009 10:47:23 +0200 (CEST)
Received: from sharky.jerryweb.org (mna75-4-81-56-56-40.fbx.proxad.net
	[81.56.56.40])
	by smtp1-g21.free.fr (Postfix) with ESMTP id BA6D994009B
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  1 Apr 2009 10:47:20 +0200 (CEST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by sharky.jerryweb.org (Postfix) with ESMTP id E2F5E184007
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  1 Apr 2009 10:47:20 +0200 (CEST)
Message-ID: <49D32A18.6010807@bolloretelecom.eu>
Date: Wed, 01 Apr 2009 10:47:20 +0200
From: =?ISO-8859-15?Q?Jeremy_Lain=E9?= <jeremy.laine@bolloretelecom.eu>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.8.1.19) Gecko/20090103 Lightning/0.8 Thunderbird/2.0.0.19
	Mnenhy/0.7.5.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <49D3220F.8070602@gmail.com>
In-Reply-To: <49D3220F.8070602@gmail.com>
Subject: Re: qt4-tools-native_4.4.3.bb failed
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
X-List-Received-Date: Wed, 01 Apr 2009 08:49:43 -0000
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: quoted-printable

Enrico,

It looks like g++ is not picking up libz from native staging:

g++ -fno-exceptions -Wl,-rpath,/home/enrico/oe/tmp/staging/i686-linux/usr=
/lib
-Wl,-rpath,/home/enrico/oe/tmp/staging/i686-linux/usr/lib -o ../../../bin=
/uic
[snip]
.obj/release-static-emb-x86/qfsfileengine_iterator_unix.o     -lz -ldl
/usr/bin/ld: cannot find -lz

This is very odd as qt4-tools-native DEPENDS on zlib-native, so libz shou=
ld be available.
Could you please post the output of:

ls -l /home/enrico/oe/tmp/staging/i686-linux/usr/lib/libz.*

Cheers,
--=20
Jeremy LAINE
Bollor=E9 telecom | 11bis, rue Scribe | F-75009 Paris


