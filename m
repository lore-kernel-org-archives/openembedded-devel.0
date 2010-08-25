Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sean@chumby.com>) id 1Oo82N-0003sQ-6y
	for openembedded-devel@lists.openembedded.org;
	Wed, 25 Aug 2010 06:56:37 +0200
Received: by iwn2 with SMTP id 2so243398iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Aug 2010 21:56:00 -0700 (PDT)
Received: by 10.231.172.70 with SMTP id k6mr9739514ibz.125.1282712160126;
	Tue, 24 Aug 2010 21:56:00 -0700 (PDT)
Received: from [10.0.239.103] (cm229.psi191.maxonline.com.sg [58.146.191.229])
	by mx.google.com with ESMTPS id n20sm886174ibe.17.2010.08.24.21.55.57
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 24 Aug 2010 21:55:58 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1081)
From: Sean Cross <sean@chumby.com>
In-Reply-To: <4C6DA3DD.4080501@eukrea.com>
Date: Wed, 25 Aug 2010 12:55:54 +0800
Message-Id: <DC46371C-F872-45D1-910F-D1E0CCAC0FA2@chumby.com>
References: <7FC9418E-5EF5-4750-BFD7-DB7E43B38513@chumby.com>	<i4iq60$g6i$1@dough.gmane.org>
	<B49DA616-CD60-4E6E-A141-C3637BA9EB24@chumby.com>
	<4C6DA3DD.4080501@eukrea.com>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.1081)
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: sean@chumby.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
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
X-List-Received-Date: Wed, 25 Aug 2010 04:56:37 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable


On Aug 20, 2010, at 5:36 AM, Eric B=E9nard wrote:

> Hi Sean,
>=20
> Le 19/08/2010 21:21, Sean Cross a =E9crit :
>> On Aug 19, 2010, at 1:32 AM, Koen Kooi wrote:
>>> Can't this me merged into the .26.28 kernel recipe?
>>>=20
>> I can do that, but the resulting patch is 28 megabytes. I think
>> that's a bit big.
>>=20
>> It's Freescale's kernel patch, which supports all of their
>> processors, not just the i.MX233.  My guess is that nobody's tried to
>> get these patches into the kernel upstream.
>>=20
>> The resulting patch I get is mostly an additive patch, as I count
>> 800,000 added lines in the patch, and 1200 removed lines.
>>=20
> maybe using Freecale git server with the right revision will allow you
> to only have one smaller patch which adds support of your board :
> http://opensource.freescale.com/git?p=3Dimx/linux-2.6-imx.git;a=3Dsummar=
y

I'll work on doing that.  But I don't see any other Linux kernel recipes =
that use this repo.  What's the advantage of using this GIT server and =
including a patch against it, rather than pulling the chumby tgz file =
and not having any patches?


Sean=


