Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1P1vww-0003dq-T4
	for openembedded-devel@lists.openembedded.org;
	Sat, 02 Oct 2010 08:52:06 +0200
Received: by iwn2 with SMTP id 2so4716275iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 01 Oct 2010 23:51:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=flmJfVTK0wpt0T7oobr91wKJfR1rfWSu01TP9EUtoE8=;
	b=GQCzMZ1/Xwg2afT8Wjpl9TofgOVLX1JXT8Y88WUTqgkvu0XmKtkGaJOndfwLDcLmah
	onZeBe/GtLZq2Rw7dWXKLtIxCqjzMZ0Au1+HFD+QMiE272FBRQCJN2vqQJ/LouPibOKo
	VNK9pNJxMr9e/W5TUoVOLryuNJbFRVDj6SZsk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=A94jNqXwk0v40Rp9+yIuYSj3Rm0fsMWBzg+VZxo3xKe3GFu/O9rGw/oYLVJAAq25Sc
	h5C3T5UZqy7Q0mcKVpHYcnmzvmkSi4++SlKDmNs0uUvd5G3Q6DfidYD0vZUbCak4OO1P
	YMgyT8YLI4HsjrZVTm0xVdoJ9q4YrHU5Bh3v0=
MIME-Version: 1.0
Received: by 10.231.31.135 with SMTP id y7mr6794090ibc.139.1286002308616; Fri,
	01 Oct 2010 23:51:48 -0700 (PDT)
Received: by 10.231.32.10 with HTTP; Fri, 1 Oct 2010 23:51:48 -0700 (PDT)
In-Reply-To: <4CA501AC.2090804@mentor.com>
References: <AANLkTi=6KMYVWORbcf+BLZYGV6JrscxBEjq-KWXnhzU+@mail.gmail.com>
	<4CA501AC.2090804@mentor.com>
Date: Sat, 2 Oct 2010 08:51:48 +0200
Message-ID: <AANLkTimnYZwzPk54jq-kWyvxOaFxHbUG0+4hamstW5xA@mail.gmail.com>
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
Subject: Re: [RFC] delete old monotone recipes
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
X-List-Received-Date: Sat, 02 Oct 2010 06:52:06 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/9/30 Tom Rini <tom_rini@mentor.com>:

>
> As an aside, I can't find anything called monotone-5 or monotone-6, just
> monotone. =A0But I'd otherwise suggest the normal rules apply, delete the
> unpinned versions assuming they're all GPLv2.
>

removed all older monotione-6 versions
BTW the license for all was MIT.
I assume you wanted to say that if the latest was GPLv3 and an earlier
one was still GPLv2 we should keep the v2 one too.

off-topic: I know there are some places where this is the case (like
samba), for those I would prefer if the last v2 recipe was named
differently from the v3 ones.

on-topic again:
do we still want to keep the monotone-5 recipe? (personally I'd say no).
And what about the latest monotone-6 recipe (although I do not really
expect it to be used, I'm leaning towards keeping it, just in case
people feel a sudden urge to restore an old OE montone db on their
target)
BTW: monotone itsels is already at 0.48

Frans


