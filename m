Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OUDif-0002Ht-Pw
	for openembedded-devel@lists.openembedded.org;
	Thu, 01 Jul 2010 08:57:59 +0200
Received: by iwn34 with SMTP id 34so1747196iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Jun 2010 23:53:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type;
	bh=MT3hRI/dq3MiZ+4oxhcfO1CfDj5LOM2d8358YnmB+P4=;
	b=ZCDPPmhxfpLpGnJMrAn1MzyOEbnLJDb0HwgT+6zKUWd8iT1oR/gzbbneT7R1C4R7M/
	9b9RuZ1zX4+58N1pl2mcyss7T7DKaRYC6IM+u+4I2NWHt3toFC16hqjwxBr2YzOE3kQS
	JR30Hk5qd5L28ucn/O3JTiyvBLFzZEWNIXP7Y=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type;
	b=LhfMq7uD3IjGhgGBn0KzLhFm8Qlf32CALyuC27624YAU5G8woVgTzw9GQGXKXB5tAQ
	sEJbNolXkqBxnP2UFdcAjTh/FK2Bf9bJiluav3oME7+1Fn2lMUZ/AtDoNmB+RXclBGXh
	vCKtgOOU/smJC0FkzP8+5So7FIfGOuZ82Arpk=
Received: by 10.231.125.167 with SMTP id y39mr10012230ibr.93.1277967194727; 
	Wed, 30 Jun 2010 23:53:14 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.14.131 with HTTP; Wed, 30 Jun 2010 23:52:53 -0700 (PDT)
In-Reply-To: <i0f0bp$b11$1@dough.gmane.org>
References: <i0f0bp$b11$1@dough.gmane.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 30 Jun 2010 23:52:53 -0700
Message-ID: <AANLkTikXxcGoAOAIefF5cbiDOe7KeeqNPS9Ik_HD-uBh@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: CFLAGS_append_arm = " -fforward-propagate " breaks sdk builds
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
X-List-Received-Date: Thu, 01 Jul 2010 06:57:59 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Jun 30, 2010 at 1:47 AM, Koen Kooi <k.kooi@student.utwente.nl> wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Hi,
>
> When using an old compiler (e.g. the one ubuntu 8.04LTS ships with),
> zlib and ncurses fail to build because " -fforward-propagate" is not
> recognized as an option.
>

I wonder if there is a way to make OE aware of what gcc/binutils or
other cross tools versions it is being compiled with and then decide
on options based on that.
we could poke cross compiler on the fly
something like.

check_gcc=$(shell \
        if $(CC) $(1) -S -o /dev/null -xc /dev/null > /dev/null 2>&1;
\
        then echo "$(1)"; else echo "$(2)"; fi)
> This is due to:
>
> CFLAGS_append_arm = " -fforward-propagate "
>
> In the .inc files. My question: why does ncursus-sdk get that in cflags?!?!

its using BBLASSEXTEND now for sdk may be it uses TARGET_ARCH in overrides.

>
> regards,
>
> Koen
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
>
> iD8DBQFMKwS5MkyGM64RGpERAkrUAJ9/6f9Xwfq31TooCkrx39tuOO+twACfeLGb
> d7VMZZJgobUiZgNM1rfrLv8=
> =t8GK
> -----END PGP SIGNATURE-----
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


