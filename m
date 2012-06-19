Received: from seketeli.net ([91.121.166.71] helo=ms.seketeli.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <apelete@seketeli.net>) id 1Sh4hT-0007gI-9g
	for openembedded-devel@openembedded.org; Tue, 19 Jun 2012 22:06:55 +0200
Received: from localhost (unknown [109.190.26.176])
	by ms.seketeli.net (Postfix) with ESMTP id 6CEAEEA040;
	Tue, 19 Jun 2012 22:03:54 +0200 (CEST)
Received: by localhost (Postfix, from userid 1000)
	id 42734604DE; Tue, 19 Jun 2012 21:56:11 +0200 (CEST)
Date: Tue, 19 Jun 2012 21:56:11 +0200
From: Apelete Seketeli <apelete@seketeli.net>
To: Martin Jansa <martin.jansa@gmail.com>
Message-ID: <20120619195610.GC4845@hermes>
References: <1340062930-19293-1-git-send-email-apelete@seketeli.net>
	<1340062930-19293-2-git-send-email-apelete@seketeli.net>
	<20120619052932.GN3178@jama.jama.net>
	<20120619060703.GA4845@hermes>
	<20120619063448.GO3178@jama.jama.net>
MIME-Version: 1.0
In-Reply-To: <20120619063448.GO3178@jama.jama.net>
X-Operating-System: Debian GNU/Linux wheezy/sid
X-URL: http://www.seketeli.net/~apelete
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-devel@openembedded.org,
	Kristoffer Ericson <kristoffer.ericson@gmail.com>
Subject: Re: [PATCH 1/1] gtk+: Regenerate no-demos.patch and update recipe
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
X-List-Received-Date: Tue, 19 Jun 2012 20:06:55 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Le 19-Jun-12, Martin Jansa a =E9crit:
>=20
> As you can see in
> http://git.openembedded.org/openembedded/commit/recipes/gtk+?id=3Da3b09=
20d0cc2cecac9eea4993ad18a64b207d7af
> and
> http://git.openembedded.org/openembedded/commit/recipes/gtk+?id=3Da3b09=
20d0cc2cecac9eea4993ad18a64b207d7af
>=20
> no-demos.patch is intentionally applied only for gtk+-native and even
> correctly packaged for target. So if you have issues building
> gtk+_2.20.1.bb then rebasing gtk+-2.20.1/no-demos.patch is right, but
> moving that patch from SRC_URI_append_virtclass-native to SRC_URI_appen=
d
> is wrong.

I see. I will undo the move to SRC_URI_append, keep the no-demos.patch
rebase thing and propose another to patch to fix the build issue then.

> BTW: I'm not using oe-classic at all, and I'm still reading oe-devel ML=
, please=20
> don't put me to To: directly, Thanks.

I wasn't sure if I should put you in the To: field directly or not,
thank you for clarifying this. The next patches will be sent to the
mailing list address only, I hope you will still take some time to
report and advise about any issue you spot :).

Regards.
--=20
        Apelete


