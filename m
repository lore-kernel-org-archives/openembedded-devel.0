Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Pj9TP-00036z-AE
	for openembedded-devel@lists.openembedded.org;
	Sat, 29 Jan 2011 13:00:11 +0100
Received: by iyj18 with SMTP id 18so3574655iyj.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 29 Jan 2011 03:59:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type:content-transfer-encoding;
	bh=+ItzeWh3rFlUuZGdezJh1MG+BpYnkOa25TqqpNbLSUA=;
	b=w920Yb5Pb2v/rVY2FBv1fwIWoExcGRjUITsV4pcH7a6ScKryX+I3kl3dtc4aBc5kok
	L4UjhCm6YTmhDO7ct8aZxJ1kXZ1n3k+F2GETgfY2TtgkfTJsKJw3ElUaL4scRtUVh7FS
	Xkt/iPs2OLM7USXBxJsvlTGOK00uBJcNLjXzE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=OfwZ+W/gCK8cmWgDEc+AgjEjD8gGQM2F2doLA1zxRaihY8ZCHDxln0km4MimEq9ofy
	2/TtT4heclYYQLpGSWto62kHFuStXZa+kTb25PWmnYDab/fkWhx4KsROW70MwpbEkzrO
	L4848xxttiFb9LibxDiy5ufgGxNany7RA2Vug=
MIME-Version: 1.0
Received: by 10.231.172.75 with SMTP id k11mr800345ibz.133.1296302355369; Sat,
	29 Jan 2011 03:59:15 -0800 (PST)
Received: by 10.231.36.68 with HTTP; Sat, 29 Jan 2011 03:59:15 -0800 (PST)
In-Reply-To: <20110129112942.GB3265@jama>
References: <1296240753-10120-1-git-send-email-tom_rini@mentor.com>
	<20110129112942.GB3265@jama>
Date: Sat, 29 Jan 2011 12:59:15 +0100
Message-ID: <AANLkTikgSv7C9zwrWDbVU7eVYOyWvcnxwKYQXypK08oj@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 0/5] Relocatable perl-native and use it always
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
X-List-Received-Date: Sat, 29 Jan 2011 12:00:11 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2011/1/29 Martin Jansa <martin.jansa@gmail.com>:
> On Fri, Jan 28, 2011 at 11:52:28AM -0700, Tom Rini wrote:
>> Hey all,
>>
>> As I've talked about before[1] there's build reproducibility issues
>> depending on when perl-native is built. =A0After talking with Mark Hatle
>> a little bit I started thinking about relocation in perl again and it
>> turns out that starting in 5.10, upstream perl supports relocation.
>>
>> This in turn makes it less painful to make perl-native be what we use
>> when we want perl runtime, nearly everywhere (since you can use pstaging
>> to avoid it the time next time).
>>
>> This patch set drops perl 5.8.8 and bumps all of the perl stuffs PR,
>> switches to relocatable perl-native, and then the big switch to using it
>> early.
>
> Looks good and as we're using 5.10 already then for whole series:
>
> Acked-by: Martin Jansa <Martin.Jansa@gmail.com>
>
> Can we also get rid of legacy staging from recipes/perl/perl_5.10.1.bb ?

Would be nice.
Then again we could also decide to keep 5.10.1 as is, and try to move
forward to 5.12.
poky already has that recipe.

Frans
>
> --
> Martin 'JaMa' Jansa =A0 =A0 jabber: Martin.Jansa@gmail.com
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
>


