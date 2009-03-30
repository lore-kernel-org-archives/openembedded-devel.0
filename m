Received: from [212.27.42.6] (helo=smtp6-g21.free.fr)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jeremy.laine@bolloretelecom.eu>) id 1LoOV4-0002zl-Cz
	for openembedded-devel@lists.openembedded.org;
	Mon, 30 Mar 2009 22:54:30 +0200
Received: from smtp6-g21.free.fr (localhost [127.0.0.1])
	by smtp6-g21.free.fr (Postfix) with ESMTP id 9A7C8E081FE
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Mar 2009 22:52:20 +0200 (CEST)
Received: from sharky.jerryweb.org (mna75-4-81-56-56-40.fbx.proxad.net
	[81.56.56.40])
	by smtp6-g21.free.fr (Postfix) with ESMTP id B470CE08125
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Mar 2009 22:52:17 +0200 (CEST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by sharky.jerryweb.org (Postfix) with ESMTP id 2000F1840CC
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Mar 2009 22:52:17 +0200 (CEST)
Message-ID: <49D13101.3090309@bolloretelecom.eu>
Date: Mon, 30 Mar 2009 22:52:17 +0200
From: =?ISO-8859-1?Q?Jeremy_Lain=E9?= <jeremy.laine@bolloretelecom.eu>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.8.1.19) Gecko/20090103 Lightning/0.8 Thunderbird/2.0.0.19
	Mnenhy/0.7.5.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <49C9FEFF.2010802@bolloretelecom.eu>	<49CBD43B.6070402@bolloretelecom.eu>
	<20090327171729.413357e7@kmfms>
In-Reply-To: <20090327171729.413357e7@kmfms>
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
X-List-Received-Date: Mon, 30 Mar 2009 20:54:30 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

> Looks like something stuck around from 4.4.3.

You need to explicitly mark qt4-tools-native 4.5.0 as preferred in your l=
ocal.conf. For
instance I have:

PREFERRED_VERSION_qt4-tools-native =3D "4.5.0"
PREFERRED_VERSION_qt4-x11-free =3D "4.5.0"
PREFERRED_VERSION_qt4-embedded =3D "4.5.0"

Also, you might consider using "oestats" so we can track successful / fai=
led builds:

http://wiki.openembedded.net/index.php/How_do_I_send_automatic_success_an=
d_failure_reports

Cheers,
--=20
Jeremy LAINE
Bollor=E9 telecom | 11bis, rue Scribe | F-75009 Paris


