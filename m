Return-Path: <eric@eukrea.com>
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
	by mail.openembedded.org (Postfix) with ESMTP id AE7A56AFF4
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  5 Jul 2013 17:45:33 +0000 (UTC)
Received: from e6520eb (tal33-3-82-233-81-124.fbx.proxad.net [82.233.81.124])
	(Authenticated sender: eukrea)
	by smtp3-g21.free.fr (Postfix) with ESMTPSA id 158CEA623E;
	Fri,  5 Jul 2013 19:45:26 +0200 (CEST)
Date: Fri, 5 Jul 2013 19:45:25 +0200
From: Eric =?UTF-8?B?QsOpbmFyZA==?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130705194525.667209b0@e6520eb>
In-Reply-To: <2710952.otpci6RPJ6@helios>
References: <1373043676-5621-1-git-send-email-otavio@ossystems.com.br>
	<2710952.otpci6RPJ6@helios>
Organization: =?UTF-8?B?RXVrcsOpYQ==?= Electromatique
X-Mailer: Claws Mail 3.9.2 (GTK+ 2.24.19; x86_64-redhat-linux-gnu)
Mime-Version: 1.0
Cc: paul.eggleton@linux.intel.com, Otavio Salvador <otavio@ossystems.com.br>
Subject: Re: [meta-oe PATCH] busybox: Follow OE-Core update to 1.12.1 version
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
X-List-Received-Date: Fri, 05 Jul 2013 17:45:34 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Paul,

Le Fri, 05 Jul 2013 18:29:04 +0100,
Paul Eggleton <paul.eggleton@linux.intel.com> a =C3=A9crit :
>=20
> Could someone *please* figure out what this bbappend is needed for and ge=
t it=20
> into OE-Core if it is still needed so we can drop it here?
>=20
it's only here to install /etc/default/busybox-syslog which contains
only one line : OPTIONS=3D"-C64" which sets the size of the logbuffer.
So obviously this could go into OE-Core.

Eric

