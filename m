Received: from mail-px0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sean@chumby.com>) id 1OmAgB-0007Wf-9s
	for openembedded-devel@lists.openembedded.org;
	Thu, 19 Aug 2010 21:21:36 +0200
Received: by pxi11 with SMTP id 11so890731pxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Aug 2010 12:21:14 -0700 (PDT)
Received: by 10.142.83.12 with SMTP id g12mr164139wfb.173.1282245674006;
	Thu, 19 Aug 2010 12:21:14 -0700 (PDT)
Received: from [172.22.1.136] (ip65-44-204-2.z204-44-65.customer.algx.net
	[65.44.204.2])
	by mx.google.com with ESMTPS id 33sm2113398wfg.21.2010.08.19.12.21.11
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 19 Aug 2010 12:21:12 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1081)
From: Sean Cross <sean@chumby.com>
In-Reply-To: <i4iq60$g6i$1@dough.gmane.org>
Date: Thu, 19 Aug 2010 12:21:09 -0700
Message-Id: <B49DA616-CD60-4E6E-A141-C3637BA9EB24@chumby.com>
References: <7FC9418E-5EF5-4750-BFD7-DB7E43B38513@chumby.com>
	<i4iq60$g6i$1@dough.gmane.org>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.1081)
X-SA-Exim-Connect-IP: 209.85.212.175
X-SA-Exim-Mail-From: sean@chumby.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 2/3] Add chumby falconwing kernel recipe
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
X-List-Received-Date: Thu, 19 Aug 2010 19:21:36 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


On Aug 19, 2010, at 1:32 AM, Koen Kooi wrote:

> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>=20
>=20
> Can't this me merged into the .26.28 kernel recipe?
>=20
> On 19-08-10 01:03, Sean Cross wrote:
>>=20
>> Signed-off-by: Sean Cross <sean@chumby.com>
>> ---
>> recipes/linux/linux-chumby-falconwing.bb        |   14 +
>> recipes/linux/linux-chumby-falconwing/defconfig | 1987 =
+++++++++++++++++++++++
>> 2 files changed, 2001 insertions(+), 0 deletions(-)
>> create mode 100644 recipes/linux/linux-chumby-falconwing.bb
>> create mode 100644 recipes/linux/linux-chumby-falconwing/defconfig

I can do that, but the resulting patch is 28 megabytes. I think that's a =
bit big.

It's Freescale's kernel patch, which supports all of their processors, =
not just the i.MX233.  My guess is that nobody's tried to get these =
patches into the kernel upstream.

The resulting patch I get is mostly an additive patch, as I count =
800,000 added lines in the patch, and 1200 removed lines.

Which would you prefer?  Putting it in 2.6.28, or keeping it as a =
separate build?



