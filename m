Received: from [212.27.42.2] (helo=smtp2-g21.free.fr)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jeremy.laine@bolloretelecom.eu>) id 1LmbZ5-0005wU-5o
	for openembedded-devel@lists.openembedded.org;
	Wed, 25 Mar 2009 23:27:15 +0100
Received: from smtp2-g21.free.fr (localhost [127.0.0.1])
	by smtp2-g21.free.fr (Postfix) with ESMTP id 7F4E54B00FA
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Mar 2009 23:25:35 +0100 (CET)
Received: from sharky.jerryweb.org (mna75-4-81-56-56-40.fbx.proxad.net
	[81.56.56.40])
	by smtp2-g21.free.fr (Postfix) with ESMTP id 9BA0C4B003F
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Mar 2009 23:25:33 +0100 (CET)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by sharky.jerryweb.org (Postfix) with ESMTP id 48E1918400B
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Mar 2009 23:25:37 +0100 (CET)
Message-ID: <49CAAF60.3020807@bolloretelecom.eu>
Date: Wed, 25 Mar 2009 23:25:36 +0100
From: =?UTF-8?B?SmVyZW15IExhaW7DqQ==?= <jeremy.laine@bolloretelecom.eu>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.8.1.19) Gecko/20090103 Lightning/0.8 Thunderbird/2.0.0.19
	Mnenhy/0.7.5.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <49C9FEFF.2010802@bolloretelecom.eu>
	<1237985345.8711.6.camel@opal>	<49CA6B02.9070600@bolloretelecom.eu>
	<gqdso9$7bi$1@ger.gmane.org>
In-Reply-To: <gqdso9$7bi$1@ger.gmane.org>
Subject: Re: Dropping qt4-x11-free versions 4.1.2 and 4.3.3?
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
X-List-Received-Date: Wed, 25 Mar 2009 22:27:15 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

>> * what are qmake2-sdk and uicmoc4-sdk? The package using this is
>> "meta-toolchain-neuros".
>=20
> It's for people wanting to develop the neuros stuff below with an 'sdk'=
.

Hm.. I'm not too sure how to go about writing an "SDK" package, but am wi=
lling to learn if
given some pointers.

>> * who is the maintainer for the neuros-* packages? They are in a
>> really sad state (staging
>> rules are only half-written so they mostly don't build), and they
>> keep coming up when I
>> grep for Qt-related stuff. I am wondering whether they don't belong in
>> "nonworking"..
>=20
> I guess I'm the closest thing to a maintainer for those. They built for
> me when I tried last (last year)

OK, my comment wasn't very helpful and probably exaggerated. Here is the =
status for
neuros-public/*:

* neuros-app-photoalbum: OK
* neuros-app-vplayer: FAILED (nstorageiconlabel.h: No such file or direct=
ory)
* neuros-lib-gui: FAILED (ndatetimelabel.h: No such file or directory)
* neuros-lib-widgets: OK (but only stages a library, no headers, could be=
 the cause of above)
* neuros-mainmenu : OK
* neuros-nwm: OK
* neuros-qt-plugins: OK

--=20
Jeremy LAINE
Bollor=C3=A9 telecom | 11bis, rue Scribe | F-75009 Paris


