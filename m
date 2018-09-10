Return-Path: <costamagna.gianfranco@gmail.com>
Received: from mail-it0-f50.google.com (mail-it0-f50.google.com
	[209.85.214.50])
	by mail.openembedded.org (Postfix) with ESMTP id 9F3E17981E
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Sep 2018 06:42:34 +0000 (UTC)
Received: by mail-it0-f50.google.com with SMTP id p79-v6so28145203itp.3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 09 Sep 2018 23:42:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=cWxbTbLbqvJOYw4aRYvLOKCQDULbnr9F9AfBrxivbGA=;
	b=sGOlDZbuKiiYCVA7OizNOYIZxWlPigjjxtYsUbGvYcMdUV/CThoLTSKSxg5fSzPFg4
	qX2vvEi2I8UNg5bysZI/6zxVMgC/UAn3CQE50tBUObp8zs3uy5aAiOIem225kgl2wXf7
	4Nai6NdrGc/xgrqB4wIWTkchqhHJVUCIcks0Cd/wjcRWhYsyUyWRsEo5S2Ay+G142/W3
	PRpaz/TjccF0odYVZSdHMjnX6t2ncWYW1hQysz7wxH37mrMrAfEx7iGSyEAAQ+SLWyWx
	JdHUjqpbus2OmeWs+XqxluaicoknkSl62E7N5CaGF4n2JAHmwBTd5BBAxKajAHsLsUr7
	ncdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=cWxbTbLbqvJOYw4aRYvLOKCQDULbnr9F9AfBrxivbGA=;
	b=VFAjGw3bHmT2sA8Iyj8IoO1F6FUQJl6wq7dbNWe7ojde+49R7iYuSTdmbSg9TE3A15
	3ppV4FjNUGXw5JxivJOcZRoZ33D74vTbwqXookW8Ggjmdr0iXxseB2crNEjoDuMjN2or
	jFiedCw6u8xQW5KpZyrcSS4STv1vZpPbxFY2AZJd0kHevGnK1pZ/ZZCxd44nuz8qjDjN
	zRPbT4ueADal76MlKkYbploTrx6TraCrLBg/HCe/YbEi8BniKuPJ2wYW4ZPd83aOhW16
	mEprzJZnXRNBMGduqRoHdcyIAmY5odhwlh/ZEQwLNMJ5y4BvqlEphBNvGBo87q7zXVzm
	noTA==
X-Gm-Message-State: APzg51BigVIeh3ekEpnhJcyN0p3EkHcHoopc/40a6SlYpL9aC7lMWRYQ
	Q28p0unbbJqn20pYTENkUO0wDEBHvBXYgvE2JWo=
X-Google-Smtp-Source: ANB0Vdat4PfjxtYqdUMKoXHKbz0l+IJBq7Vi5ocdlq05XQ0sAMkW4GjB4a1UYgEpUvnjWqEr0f8wVUkU+iKDvEavH3g=
X-Received: by 2002:a02:a181:: with SMTP id
	n1-v6mr17095403jah.30.1536561755277; 
	Sun, 09 Sep 2018 23:42:35 -0700 (PDT)
MIME-Version: 1.0
References: <CAATN8PW7KbbYPKnHhxM7Y8ZxbxTPvx7yngd=W-hBQm95YZZgtA@mail.gmail.com>
	<CAMKF1so4Uh5YCbz=h9uxbXoAYX0QRJVUGbMecjNV=LQ8R0LWaA@mail.gmail.com>
In-Reply-To: <CAMKF1so4Uh5YCbz=h9uxbXoAYX0QRJVUGbMecjNV=LQ8R0LWaA@mail.gmail.com>
From: Gianfranco Costamagna <costamagna.gianfranco@gmail.com>
Date: Mon, 10 Sep 2018 08:42:23 +0200
Message-ID: <CAATN8PUi_f-Pw99oCTVdW1seUxiEHGHrtF61-J3BLB9Ap1JgPw@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH V2 07/10] wvstreams: Add openssl 1.1.x support
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 10 Sep 2018 06:42:34 -0000
Content-Type: text/plain; charset="UTF-8"

Got it.
I tried to understand if this was intentional, but I still fail to
understand the patchwork website :)

thanks than and sorry for wasting your time!

keep rocking

G.

Il giorno lun 10 set 2018 alle ore 08:19 Khem Raj <raj.khem@gmail.com> ha
scritto:

> On Sun, Sep 9, 2018 at 11:15 PM Gianfranco Costamagna
> <costamagna.gianfranco@gmail.com> wrote:
> >
> > Hello Khem,
> >
> > did you forget a
> > sed s/openssl10/openssl/g in the bb file? :)
>
> no, this is a squashed patch with the last one.
>
> >
> > thanks for applying the fix!
> >
> > G.
>

