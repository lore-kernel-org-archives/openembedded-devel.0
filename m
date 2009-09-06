Received: from [209.85.221.200] (helo=mail-qy0-f200.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1MkDDZ-0003tM-PI
	for openembedded-devel@lists.openembedded.org;
	Sun, 06 Sep 2009 10:35:25 +0200
Received: by qyk38 with SMTP id 38so816928qyk.27
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 06 Sep 2009 01:16:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=kdJjdeTxW+BgD6nIToLYgCSiF1W+fTqSwX8sBw5HsSw=;
	b=FS6baCplnp8Fr7puC1vZmVwMYHaR/wsr+/XuGP5N/TiW6bbB4ZvqRWampY4q9z/777
	YH5iN74i38rVcrvYnmBysrfsM9NQs1oJBu9hp6b9K2MES8FYpr4HWNpntUHqjASmACp4
	jXlVgTACyDB9hU2F7XUrqHquj/M5TpHhNsmHk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=w+87TffGkrrPI2mDMts8dCzRVBHI6X/1tSbN9svPOY/rTrYyY69bDzbbAyDlopVz7h
	F30k3uvlfsCkFXorT2CZrcBYmHhZ0XnsQR7yam1Hy/4Md86UivD5aNM2zaeFN5sA8MyP
	js5eaSNOnEeI64QBW1hOPO5CV5xO0TjBxMfrg=
MIME-Version: 1.0
Received: by 10.229.53.76 with SMTP id l12mr3533213qcg.105.1252224974523; Sun, 
	06 Sep 2009 01:16:14 -0700 (PDT)
In-Reply-To: <200909060131.26060.holger+oe@freyther.de>
References: <200909060131.26060.holger+oe@freyther.de>
Date: Sun, 6 Sep 2009 01:16:14 -0700
Message-ID: <19c1b8a90909060116g521271b5ycf40bd83b76c0f64@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: glibc and MIPS compile issue
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
X-List-Received-Date: Sun, 06 Sep 2009 08:35:26 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 5, 2009 at 4:31 PM, Holger Hans Peter
Freyther<holger+oe@freyther.de> wrote:
> Hey,
>
> I tried to compile for MIPS again and glibc fails with the below error:
>
>
> /home/ich/build/mipsel/db1200/tmp/work/mipsel-angstrom-linux/glibc-2.9-
> r35.2/build-mipsel-angstrom-linux/libc_pic.os: In function `_mcount':
> ../sysdeps/generic/unwind-pe.c:(.debug_macinfo+0x5b398c0): relocation
> truncated to fit: R_MIPS_HI16 against `_gp_disp'
> collect2: ld gab 1 als Ende-Status zur=C3=BCck
>
>
> has anyone a idea?

what binutils version are you using.
Does it happen with eglibc too ?

>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0z.
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


