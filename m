Received: from mail-ew0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1Ol5U3-0001Z3-UL
	for openembedded-devel@lists.openembedded.org;
	Mon, 16 Aug 2010 21:36:40 +0200
Received: by ewy7 with SMTP id 7so2674498ewy.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Aug 2010 12:36:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=VE/6DTLETXjWx8QYPWsSFxp3V9/kwhkyh3vAIdLbaWI=;
	b=ReB7LgJtYE+CsrDeNsO1Rcu9a81XUdIAJZqbPx7oQ0kEmsP02gz3QUd/8pxBkn/z4l
	n/wVus+dEXhLRWrsF1YSYMyUo7ByYgSqdSaY7sRIx5+p0I9gQs4vGBpdT/v4+MfPipx4
	mqfRXi+9e9tEaM6xJDe3wZ/LKoz3JNGKYlsEs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=ri3g7e8JYkzl+CaSwTy9izuJ9iQ5oejPUF85SzJd4YsYn1FZnK10f+6f7A3OaSmMS7
	lstspVFv9YsMu2YzGsGTtKl7DTLQvvT1Ycv2UyEmD2G6p27JdsKoYuPz252vcy7TJ2xR
	vcq8QZyYCJO0RWB3/1fnQlneWBjdMLeuCKFHQ=
Received: by 10.213.3.70 with SMTP id 6mr5264129ebm.51.1281987379159; Mon, 16
	Aug 2010 12:36:19 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.213.35.135 with HTTP; Mon, 16 Aug 2010 12:35:59 -0700 (PDT)
In-Reply-To: <201008162325.59305.roman@khimov.ru>
References: <1281983778-21054-1-git-send-email-khimov@altell.ru>
	<AANLkTi=gLCkfgLPgJT9oVVxxsfP10uf7w7r02Z5mBkOW@mail.gmail.com>
	<201008162325.59305.roman@khimov.ru>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 16 Aug 2010 12:35:59 -0700
Message-ID: <AANLkTik-LOv_7xTmgsEz8ip_smmZ+L4FeG0Cr5rHc1zF@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.215.47
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] openssl: update 1.0.0 to 1.0.0a
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
X-List-Received-Date: Mon, 16 Aug 2010 19:36:44 -0000
Content-Type: text/plain; charset=KOI8-R
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 16, 2010 at 12:25 PM, Roman I Khimov <roman@khimov.ru> wrote:
> =F7 =D3=CF=CF=C2=DD=C5=CE=C9=C9 =CF=D4 =F0=CF=CE=C5=C4=C5=CC=D8=CE=C9=CB =
16 =C1=D7=C7=D5=D3=D4=C1 2010 22:59:53 =C1=D7=D4=CF=D2 Frans Meulenbroeks
> =CE=C1=D0=C9=D3=C1=CC:
>> One small question: Do we want to keep this recipe at
>> DEFAULT_PREFERENCE =3D "-1" ??
>
> Well, we're using 1.0.0 since the day it's been released, and it's a perf=
ect
> fit for us, but I know that it _might_ break some things, just google for
> openssl 1.0.0 breakage/compatibility patches/etc, that's why I've pushed =
it
> that way so that distro maintainers could test whether it works for them =
with
> their particular package sets and act accordingly.
>
> I certainly have nothing against removing that line if everyone is OK wit=
h
> that.
>

IMO the newest version in a recipe should always be default preference
this way we can
stabilize recipe upgrades quicker. This also means a wider testing
before pushing a new recipe
DEFAULT_PREFERENCE =3D "-1" makes it to escape the testing.

> --
> =9Ahttp://roman.khimov.ru
> mailto: roman@khimov.ru
> gpg --keyserver hkp://subkeys.pgp.net --recv-keys 0xE5E055C3
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
>


