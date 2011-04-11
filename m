Received: from stoexhubfe02.domain01.net ([83.145.59.141])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <anders@chargestorm.se>) id 1Q9D7h-0004qZ-RO
	for openembedded-devel@lists.openembedded.org;
	Mon, 11 Apr 2011 11:09:29 +0200
Received: from STOEXMBXC03.domain01.net
	([fe80:0000:0000:0000:a8d1:7426:80.84.102.113]) by
	stoexhubfe02.domain01.net
	([10.12.10.7]) with mapi; Mon, 11 Apr 2011 11:07:16 +0200
From: Anders Darander <anders@chargestorm.se>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Date: Mon, 11 Apr 2011 11:08:13 +0200
Thread-Topic: [oe] [PATCH v2] lowpan-tools_0.2.2;	: fix build with static
	libnl1
Thread-Index: Acv4J9pRjoQyQAvmTw6ZfUgZAj5k9g==
Message-ID: <1217FED4-A7EC-4603-9CD7-19BEA0827E96@chargestorm.se>
References: <1302456441-3417-1-git-send-email-anders@chargestorm.se>
	<20110411080125.GB28101@jama.jama.net>
In-Reply-To: <20110411080125.GB28101@jama.jama.net>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
Subject: Re: [PATCH v2] lowpan-tools_0.2.2; : fix build with static libnl1
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
X-List-Received-Date: Mon, 11 Apr 2011 09:09:30 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



On 11 apr 2011, at 10:02, "Martin Jansa" <martin.jansa@gmail.com> wrote:

> On Sun, Apr 10, 2011 at 07:27:21PM +0200, Anders Darander wrote:
>> * add NL_CFLAGS to a few Makefiles.am
>=20
> look like adding -D_GNU_SOURCE not $(NL_CFLAGS) except iplink/Makefile.am=
=20
> and lib/Makefile.am, why was -D_GNU_SOURCE needed?

Hm, I should probably update that patch description to reflect that NL_CFLA=
GS is only added on a couple of places, while _GNU_SOURCE is added on a few=
 more places.

-D_GNU_SOURCE was added as otherwise a struct, ucred if I remember correctl=
y, was undefined. (I don't currently have access to that computer.)

> and lowpan-tools_0.2.2.bb gets PR bump from INC_PR, no need to bump .1
> too.

Ok, I bumped PR in lowpan-tools_0.2.2.bb as I modified that file also...

> but otherwise looks ok (I haven't tested it - never used lowpan-tools).
>=20

I'll try to make a somewhat better explanation in the included patch during=
 the evening, and I can also remove the PR bump before submitting a third r=
evision of the patch. Hopefully I can find some time this evening.
=20
Regards,
Anders=


