Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Ov2dy-0007Db-HJ
	for openembedded-devel@lists.openembedded.org;
	Mon, 13 Sep 2010 08:35:59 +0200
Received: by iwn2 with SMTP id 2so4903058iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 12 Sep 2010 23:35:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=IIIkwKP1pOQwp5ag2YGe4Yu0uKIu3P0Xzt4tmbNjSBE=;
	b=GpgMDZdHWq9ewwqa31L5avrvNY3y9SKsQGnzPelQTeESZjpMShS45pXOgOmtms7iBm
	IdvzaCamrEgSmAUogzcxFsj66y+j5QV9D9cZlirm3jEoma4sbAR+JQRXflm9F8jWpaW5
	7zAAXSTujJbB7baXOW/l3D+lh9ePz7ftTGZRc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=qp3gFtwxcyQBuAORjpZ8SN2wAabVxHCmjlZuAh3P+M12Hi3QDEdgC2h4VAmdTpV3Da
	XGFbsm1hnQpafs2eaayjGi0sR+98zFUKsVnILU/OGcnf5XyHkUlOMJWmPsydxXZiF/ED
	H+EsjVvT3nVvvyFND4X+jKC6QtsbcR1vQ8aDI=
MIME-Version: 1.0
Received: by 10.231.153.76 with SMTP id j12mr5704897ibw.66.1284359710118; Sun,
	12 Sep 2010 23:35:10 -0700 (PDT)
Received: by 10.231.208.17 with HTTP; Sun, 12 Sep 2010 23:35:10 -0700 (PDT)
In-Reply-To: <AANLkTi=7P_2nYWD5LSohKBF0ZHA7hR=Y5ekSmOgTqkng@mail.gmail.com>
References: <4C8CA2DC.40707@freyther.de>
	<AANLkTi=EALsQWTorEsz19dyJFX-AnStXdaHYJUy4iZXn@mail.gmail.com>
	<4C8CEB0D.1070206@freyther.de>
	<AANLkTi=7P_2nYWD5LSohKBF0ZHA7hR=Y5ekSmOgTqkng@mail.gmail.com>
Date: Mon, 13 Sep 2010 08:35:10 +0200
Message-ID: <AANLkTimi_+DHHCq7um4ea7fVDJJ7CHV8zN5hOrw00rUw@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] insane.bbclass: Enable the insane.bbclass for everyone in a warning mode
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
X-List-Received-Date: Mon, 13 Sep 2010 06:35:59 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/9/12 Chris Larson <clarson@kergoth.com>:

>
> I think we should reorganize insane.bbclass and split up its functionalit=
y,
> either into multiple classes or configurable via variables, as others hav=
e
> suggested in this thread. =A0If that's done, we can enable the core by
> default, but leave the bits that require additional dependencies as
> optional.
> --

Agree.

One of the ways to do so is to add more semantics to SECTION where
whatever is in SECTION triggers a dependency on the sanity tester part
for that section.
Alternately we could decide that every lib file has an inherit lib
clause or something like that.
Disadvantage is that we need to check/update all recipes and there is
a chance that someone forgets to add such a line.
(of course we could work around that by saying that e.g. SECTION is
mandatory and can contain only a predefined number of values. Still
that does not beat the case that someone just uses a wrong value).

BTW I feel that whether (QA or other) tests are executed should be
ultimately controllable by the person who builds (e.g. in the
local.conf). He/she is the one who has to pay for these (in terms of
time and cycles and he/she gets the benefits (or gets burned) by using
it.

Frans


