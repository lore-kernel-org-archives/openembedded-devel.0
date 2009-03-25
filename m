Received: from [212.27.42.6] (helo=smtp6-g21.free.fr)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jeremy.laine@bolloretelecom.eu>) id 1Lmbb3-0005yP-Eo
	for openembedded-devel@lists.openembedded.org;
	Wed, 25 Mar 2009 23:29:17 +0100
Received: from smtp6-g21.free.fr (localhost [127.0.0.1])
	by smtp6-g21.free.fr (Postfix) with ESMTP id C31D7E080FC
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Mar 2009 23:27:38 +0100 (CET)
Received: from sharky.jerryweb.org (mna75-4-81-56-56-40.fbx.proxad.net
	[81.56.56.40])
	by smtp6-g21.free.fr (Postfix) with ESMTP id DD027E08115
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Mar 2009 23:27:35 +0100 (CET)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by sharky.jerryweb.org (Postfix) with ESMTP id 3DC7018400B
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Mar 2009 23:27:40 +0100 (CET)
Message-ID: <49CAAFDC.3070004@bolloretelecom.eu>
Date: Wed, 25 Mar 2009 23:27:40 +0100
From: =?ISO-8859-1?Q?Jeremy_Lain=E9?= <jeremy.laine@bolloretelecom.eu>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.8.1.19) Gecko/20090103 Lightning/0.8 Thunderbird/2.0.0.19
	Mnenhy/0.7.5.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <b6ebd0a50903171218i7f5716afifd99177982b6df5b@mail.gmail.com>	<49C9347C.7010309@balister.org>	<FA1C2D98-DEF3-4694-A757-7C137F667CE3@ngndg.com>	<b6ebd0a50903241301r5b8972b4s59df7be41052ab7a@mail.gmail.com>	<dc6682e90903241330m1191395j478ee4180a969cfb@mail.gmail.com>	<49C94647.2040401@gmail.com>	<ac9c93b10903250151v6ea0586bv461debbe36f42ac7@mail.gmail.com>	<gqd31s$5vk$1@ger.gmane.org>
	<49CA5638.1050000@dls.net>	<gqdlka$cbd$1@ger.gmane.org>
	<ac9c93b10903251507u4e1edf78u4dbb1b2c7a318789@mail.gmail.com>
In-Reply-To: <ac9c93b10903251507u4e1edf78u4dbb1b2c7a318789@mail.gmail.com>
Subject: Re: Package Maintenance
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
X-List-Received-Date: Wed, 25 Mar 2009 22:29:17 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

>> Empty TMPDIR is only once case we should test for, I've seen many time=
s that
>> a 'populated' TMPDIR creates bugs, e.g. midori picking up libhildon to
>> mention a recent one. So 'always build from empty TMPDIR' will leave s=
erious
>> and harder to trackdown bugs unnoticed.
>=20
> Test with unpopulataed TMPDIR and test with maximal populated TMPDIR ?

Speaking of populated TMPDIR, is there a notion of conflicts for staging?=
 If two packages
want to put the same file into staging, will we barf an error or silently=
 ignore it?

--=20
Jeremy LAINE
Bollor=E9 telecom | 11bis, rue Scribe | F-75009 Paris


