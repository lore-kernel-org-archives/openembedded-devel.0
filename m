Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1S87wj-0008K1-T5
	for openembedded-devel@lists.openembedded.org;
	Thu, 15 Mar 2012 11:30:14 +0100
Received: by ggcy3 with SMTP id y3so2828482ggc.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Mar 2012 03:21:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=rXZi2cT2zpjYyvmWAkkiw0PJ3bEpSccHYuFQEtfoBRg=;
	b=yXHQbWZBw41U01u3S6vGKnXd4W8xypKCywioMA7cTeBKbu6iiw7DIlRCd1LFfDtKVd
	R9ZpVYWgu4Z7ezg5QPoamhOnP2CbH1+okJ3fCo8ALiOxREyYNiJAa9S4Dzbq8Y3RAAUW
	+pxvUmJHhdBTcKCJ4ijxH4Z0br8y7MFZNEgw1Is7WcfDxJLUHT8eISHawvyLxSzIxMLO
	cV/mnIlRRWkFeg9cPpYNQKFHBWGlfNGRwt3eJljf9xsyQq3ChceLk5w7npUEE9+D4LpL
	m3vqw/iIrAW2yZF900LG8sWbuhj97o71X9gF3yiSUtp8i6Y0o0uQCyEhc7Bfr9c28w47
	O/cw==
MIME-Version: 1.0
Received: by 10.224.221.210 with SMTP id id18mr6796816qab.82.1331806887099;
	Thu, 15 Mar 2012 03:21:27 -0700 (PDT)
Received: by 10.229.230.67 with HTTP; Thu, 15 Mar 2012 03:21:27 -0700 (PDT)
In-Reply-To: <7ab914b2620b85f3d8363fed900c056ff1f5650a.1331754944.git.Martin.Jansa@gmail.com>
References: <cover.1331754944.git.Martin.Jansa@gmail.com>
	<7ab914b2620b85f3d8363fed900c056ff1f5650a.1331754944.git.Martin.Jansa@gmail.com>
Date: Thu, 15 Mar 2012 11:21:27 +0100
Message-ID: <CALbNGRSPmMZ2MGutnXuJtwerv=y8BDGiQnBUK-Lh6nk+5y9a1A@mail.gmail.com>
From: =?ISO-8859-1?Q?Andreas_M=FCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][meta-efl][PATCH 1/5] midori: upgrade to 0.4.4
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
X-List-Received-Date: Thu, 15 Mar 2012 10:30:14 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 14, 2012 at 8:59 PM, Martin Jansa <martin.jansa@gmail.com> wrot=
e:
> * custom waf to fix dirty vala version was dropped
> * I've fixed our vala to stop reporting dirty even for valid released tar=
balls
> =A0so you can still get dirty version but it's not so common to keep this=
 ugly binary here.
> * disable PARALLEL_MAKE to improve our chances agains build hangs
> =A0(btw fedora is doing the same
> =A0 http://osdir.com/ml/scm-fedora-commits/2011-11/msg04672.html)
>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
> =A0meta-oe/recipes-connectivity/midori/midori/waf =A0 =A0 | =A0Bin 92569 =
-> 0 bytes
> =A0.../recipes-connectivity/midori/midori_0.4.3.bb =A0 =A0| =A0 13 ------=
-------
> =A0.../recipes-connectivity/midori/midori_0.4.4.bb =A0 =A0| =A0 =A08 ++++=
++++
> =A03 files changed, 8 insertions(+), 13 deletions(-)
> =A0delete mode 100755 meta-oe/recipes-connectivity/midori/midori/waf
> =A0delete mode 100644 meta-oe/recipes-connectivity/midori/midori_0.4.3.bb
> =A0create mode 100644 meta-oe/recipes-connectivity/midori/midori_0.4.4.bb
>
I wanted to test this but task do_compile seems to run forever (now
for 1,5h) and I have an empty log.do_compile. Any pointers where to
look after?

Andreas


