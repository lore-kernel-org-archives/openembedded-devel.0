Received: from service137.mimecast.com ([91.220.42.79])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <john.stirling@audiopartnership.com>)
	id 1TRg9t-0002qS-Lb for openembedded-devel@lists.openembedded.org;
	Fri, 26 Oct 2012 11:24:53 +0200
Received: from Exchange01.audio.local (89-105-112-30.fluidata.co.uk
	[89.105.112.30]) by service137.mimecast.com; Fri, 26 Oct 2012 10:09:57
	+0100
X-MimeOLE: Produced By Microsoft Exchange V6.5
MIME-Version: 1.0
Date: Fri, 26 Oct 2012 10:12:55 +0100
Message-ID: <4772E7C9DD9B9D4EB442B23D7FE42EEA01F32E92@Exchange01.audio.local>
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Thread-Topic: sox-native
thread-index: Ac2zWhW9KqmaGn1yQvOszGxgl018iw==
From: "John Stirling" <john.stirling@audiopartnership.com>
To: <openembedded-devel@lists.openembedded.org>
X-MC-Unique: 112102610095705301
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: sox-native
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
X-List-Received-Date: Fri, 26 Oct 2012 09:24:53 -0000
Content-class: urn:content-classes:message
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable

Hi,

=20

Our OE build is based on angstrom (master) -

=20

https://github.com/Angstrom-distribution/setup-scripts/blob/master/sourc
es/layers.txt

=20

As part of our build we need to use sox to generate some audio files
that are present on the image.

=20

I'm getting stuck trying to build sox-native -

=20

NOTE: Resolving any missing task queue dependencies

ERROR: Nothing PROVIDES 'libav-native' (but
virtual:native:/build/johns/zander/setup-scripts/sources/meta-openembedd
ed/meta-multimedia/recipes-multimedia/sox/sox_14.4.0.bb DEPENDS on or
otherwise requires it)

ERROR: Required build target 'sox-native' has no buildable providers.

Missing or unbuildable dependency chain was: ['sox-native',
'libav-native']

=20

I'm not sure what I need to do to get libav-native working. I tried
adding=20

=20

BBCLASSEXTEND =3D "native"

=20

to libav.inc

=20

which changes the error to -=20

=20

NOTE: Resolving any missing task queue dependencies

ERROR: Nothing PROVIDES 'pulseaudio-native' (but
virtual:native:/build/johns/zander/setup-scripts/sources/meta-openembedd
ed/meta-multimedia/recipes-multimedia/sox/sox_14.4.0.bb DEPENDS on or
otherwise requires it)

ERROR: Required build target 'sox-native' has no buildable providers.

Missing or unbuildable dependency chain was: ['sox-native',
'pulseaudio-native']

=20

I suspect that going through each error and adding a BBCLASSEXTEND line
is not going to work ?

=20

Any assistance on this would be much appreciated.

=20

Thanks

John

=20

=20

=20

=20

=20

=20

=20

=20

=20

=20

=20

Audio Partnership PLC, Gallery Court, Hankey Place, London SE1 4BB, UK=20
Reg No. 2953313
This e-mail is confidential and for the addressee only.=20
Please refer to <a href=3D"http://www.audiopartnership.com/AP-disclaimer.p=
hp">Disclaimer</a>  for important notices.
From sledz@fensuse.internal.dresearch-fe.de Fri Oct 26 11:50:09 2012
Received: from zk223.dresearch-fe.de ([217.92.177.116])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sledz@fensuse.internal.dresearch-fe.de>)
	id 1TRgYL-00039O-Dj for openembedded-devel@lists.openembedded.org;
	Fri, 26 Oct 2012 11:50:09 +0200
Received: from fensuse.internal.dresearch-fe.de
	(fensuse.internal.dresearch-fe.de [172.29.23.6])
	by zk223.dresearch-fe.de (Postfix) with ESMTP id 6B2CEE0117;
	Fri, 26 Oct 2012 09:36:39 +0000 (UTC)
Received: by fensuse.internal.dresearch-fe.de (Postfix, from userid 1000)
	id BFFF0706EF5; Fri, 26 Oct 2012 11:36:38 +0200 (CEST)
From: Steffen Sledz <sledz@dresearch-fe.de>
To: Tom Rini <tom.rini@gmail.com>,
	openembedded-devel@lists.openembedded.org
Date: Fri, 26 Oct 2012 11:36:28 +0200
Message-Id: <cover.1351244110.git.sledz@dresearch-fe.de>
X-Mailer: git-send-email 1.7.10.4
Subject: [oe] [2011.03-maintenance 0/1] pull request 20121026
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/open=
embedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject
