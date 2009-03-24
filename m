Received: from [212.27.42.2] (helo=smtp2-g21.free.fr)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jeremy.laine@bolloretelecom.eu>) id 1Lm5GZ-0007OO-6B
	for openembedded-devel@lists.openembedded.org;
	Tue, 24 Mar 2009 12:58:00 +0100
Received: from smtp2-g21.free.fr (localhost [127.0.0.1])
	by smtp2-g21.free.fr (Postfix) with ESMTP id 827F04B01B0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Mar 2009 12:56:28 +0100 (CET)
Received: from sharky.jerryweb.org (mna75-4-81-56-56-40.fbx.proxad.net
	[81.56.56.40])
	by smtp2-g21.free.fr (Postfix) with ESMTP id 9B14A4B0105
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Mar 2009 12:56:26 +0100 (CET)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by sharky.jerryweb.org (Postfix) with ESMTP id DC2E627844C
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Mar 2009 12:56:29 +0100 (CET)
Message-ID: <49C8CA6D.6010703@bolloretelecom.eu>
Date: Tue, 24 Mar 2009 12:56:29 +0100
From: =?ISO-8859-1?Q?Jeremy_Lain=E9?= <jeremy.laine@bolloretelecom.eu>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.8.1.19) Gecko/20090103 Lightning/0.8 Thunderbird/2.0.0.19
	Mnenhy/0.7.5.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <49BFA406.6030802@bolloretelecom.eu>	<20090317143526.3e79150c@vanille.zapto.org>	<49BFADB1.3090207@bolloretelecom.eu>
	<20090317171705.208a7d31@kmfms>	<49C107E3.30505@bolloretelecom.eu>
	<gpr569$535$1@ger.gmane.org>
	<1d6c95c90903201026g709b2adfja5f5a6f8384cc798@mail.gmail.com>
In-Reply-To: <1d6c95c90903201026g709b2adfja5f5a6f8384cc798@mail.gmail.com>
Subject: Re: Dropping qtopia-core-4.3.3.bb and qtopia4core.bbclass
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
X-List-Received-Date: Tue, 24 Mar 2009 11:58:01 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

> In the same build that you cross-compile qt4-x11-free, you can compile
> native qt-tools (qmake/moc/uic/rcc), just using properly 'platform'
> and 'xplatform' configure flags and two different specs.

Absolutely, I have always wondered why this was done separately in OE. An=
other advantage
of doing this is that you will always have the right "qmake" to go with y=
our headers/libs.

> I already created qt4.bbclass that is based on qt4/qt_*.inc and do all
> the required work to build qt. The native qt tools binaries and the
> specs are being sent to staging and a new qmake.bbclass are using them
> to build qmake based applications.

I would be interested in getting hold of a your qt4.bbclass, even if it's=
 not 100%
finished and working with you on it. Let me know if you are available for=
 a chat on IRC.

Cheers,
--=20
Jeremy LAINE
Bollor=E9 telecom | 11bis, rue Scribe | F-75009 Paris


