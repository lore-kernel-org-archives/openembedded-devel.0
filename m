Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1PVPFs-0005aX-Uh
	for openembedded-devel@lists.openembedded.org;
	Wed, 22 Dec 2010 15:01:25 +0100
Received: by wwi17 with SMTP id 17so5063691wwi.24
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Dec 2010 06:01:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:sender:received
	:in-reply-to:references:from:date:x-google-sender-auth:message-id
	:subject:to:content-type;
	bh=rBrE9+GQSdtLj7+IX67O6MHDPjbaU/O9swTGEC+NXgg=;
	b=Hz/b4Bbt00oDxMEhVkmSixQJhP6KqEcokXc3oo+1vGfRR3rZB2sZSWwO/4IBktOJoj
	UuuUL2WWqYD/+rd+4mU/9ab2ScATQteXjgH7CB95JKQF9K5E/At8ysrWVhC2u9tFzx0j
	k4dM8tfzYxSzLBTKchFA5pBjuz52mwLNsb2ZU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	b=l5k2ORaXXk6yZO6V3GgWOnZ0aobOaKMHdxvKDxWrtAQpS7yv6SjLWxGB50+eaKAglz
	G7APXcNfMmy16g9BT9bJKAQaa6WFVCSe7Z6p+rOrAd6huzGgQdVtEEbJL7GJ+jbyUbsp
	Fp16Fg7jDK+g4A1/z1miLZcekrkgjE4BoGx/o=
Received: by 10.216.59.193 with SMTP id s43mr1423215wec.42.1293026476968; Wed,
	22 Dec 2010 06:01:16 -0800 (PST)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.216.67.67 with HTTP; Wed, 22 Dec 2010 06:00:56 -0800 (PST)
In-Reply-To: <iescrt$keo$2@dough.gmane.org>
References: <20101221220041.GD19986@denix.org> <iescrt$keo$2@dough.gmane.org>
From: Chris Larson <clarson@kergoth.com>
Date: Wed, 22 Dec 2010 07:00:56 -0700
X-Google-Sender-Auth: mFxVZ1yugxSe00lKx9B1i4dOOcM
Message-ID: <AANLkTinjVkLHn9+3YryPDWKWTUQF0dzunBKVchhYACjq@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: base.bbclass changes broke BitBake 1.8.19
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
X-List-Received-Date: Wed, 22 Dec 2010 14:01:25 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Dec 22, 2010 at 1:28 AM, Koen Kooi <k.kooi@student.utwente.nl> wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> On 21-12-10 23:00, Denys Dmytriyenko wrote:
>> Chris,
>>
>> The c67b95955d023c1f198531b4f06100a40b05efa7 has introduced the following
>> problem with BitBake 1.8.19 and even af81d52e48cb6d4f91fff0c70e09dfd421e0057d
>> didn't fix it. Any thoughts? Thanks.
>
> Since the release is out, can be bump to 1.10.0 as minimum bitbake now?

I'm all for this, personally.  The only reason the TSC didn't decide
to bump it already was the release, so I don't see any reason why not.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics


