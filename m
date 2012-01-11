Received: from stoexhub02.domain01.net ([83.145.59.143])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <anders@chargestorm.se>) id 1Rl4M6-0004yF-9S
	for openembedded-devel@lists.openembedded.org;
	Wed, 11 Jan 2012 21:01:06 +0100
Received: from STOEXMBXC01.domain01.net
	([fe80:0000:0000:0000:8caa:b43d:115.41.221.224]) by
	STOEXHUB02.domain01.net
	([10.12.10.2]) with mapi; Wed, 11 Jan 2012 20:52:19 +0100
From: Anders Darander <anders@chargestorm.se>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Date: Wed, 11 Jan 2012 20:52:20 +0100
Thread-Topic: [oe] [meta-oe][PATCH v3 3/3] systemd: conditionally
	RRECOMMENDS	kbd*
Thread-Index: AczQmobVRgFTVG0XTWiyvbRnRuo4SQ==
Message-ID: <FFE56B01-BC8B-4A8F-AD2A-9A1DEE3C2FCB@chargestorm.se>
References: <cover.1326196151.git.anders@chargestorm.se>
	<5dd3bb213c6027bdde9de0394b5dbbd0aeedaac7.1326196151.git.anders@chargestorm.se>
	<jei7qo$gvl$1@dough.gmane.org>
	<CAP9ODKou4VHCJrKOv6vQmqibprS3YRVzUJy6OCqaXbKBkwiiVA@mail.gmail.com>
In-Reply-To: <CAP9ODKou4VHCJrKOv6vQmqibprS3YRVzUJy6OCqaXbKBkwiiVA@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
Subject: Re: [meta-oe][PATCH v3 3/3] systemd: conditionally RRECOMMENDS	kbd*
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
X-List-Received-Date: Wed, 11 Jan 2012 20:01:06 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable


On 10 jan 2012, at 21:51, "Otavio Salvador" <otavio@ossystems.com.br> wrote=
:

> On Tue, Jan 10, 2012 at 18:42, Koen Kooi <koen@dominion.thruhere.net> wro=
te:
>=20
>> Op 10-01-12 12:52, Anders Darander schreef:
>>> If the machine lacks keyboard support, there is no need for
>>> kbd*-packages.
>>=20
>> NAK, this would make the complete systemd machine specific, which we do =
not
>> want.
>>=20
>=20
> IMO the keyboard support ought to be handled, in systemd case, as a distr=
o
> feature so allowing it to be machine independent but allowing for the
> flexibility of removing its recommendations if need.

Good point.

If we add a 'keyboard' distro feature, the issue would indeed be solved. I'=
ll try to see if I can find some time to make such a suggestion, including =
adding keyboard to the default distro features, to try to reduce problems f=
or existing users. (Altough, it might take a while, as I've just been put o=
 other assignments, reducing my time to work on oe).

Cheers,
 Anders=


