Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Oa2P5-0008Ui-OG
	for openembedded-devel@lists.openembedded.org;
	Sat, 17 Jul 2010 10:05:48 +0200
Received: by bwz10 with SMTP id 10so1779071bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 17 Jul 2010 01:05:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=hyOD9cmKCW1Wv4zEXinK7PE8tQ+gqUqXSuAtR/CKmFI=;
	b=IIYYdtogl3RqY9sk4DtUQ+MWd/lRA+XXNyxLZn6diablh2TLSN9IjkY6RYUx5TEh/E
	/VbkKCZEqn8HZVaubRKgE8jnx6E4SSiMODykHtFNaipLPXC7mcU8Re7kszBEyitXA1m2
	dCDeB7sjP50B2HtLKGzsKiIt3K+kA+hwdfDVw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=oQBmKN7it0mV0rAB3ovraixGrKY8aR8N7mGMwFb5EPp7YSWrl4m6BWCG21BcWsvHN1
	RpD8fOAm63KZvZ71+ecF5F5h6S5YV00QLqJCpl5AHESvuJum3GsH7Nvjg0Z0Mu6mMNox
	jAJv0e9xGOrjfmJOtSu1ciY1gVLNn3gmSaWmg=
MIME-Version: 1.0
Received: by 10.204.163.7 with SMTP id y7mr1572369bkx.103.1279353941168; Sat, 
	17 Jul 2010 01:05:41 -0700 (PDT)
Received: by 10.204.66.68 with HTTP; Sat, 17 Jul 2010 01:05:41 -0700 (PDT)
In-Reply-To: <20100717075639.GA1156@gmail.com>
References: <1279226782-6124-1-git-send-email-fransmeulenbroeks@gmail.com>
	<20100717075639.GA1156@gmail.com>
Date: Sat, 17 Jul 2010 10:05:41 +0200
Message-ID: <AANLkTimHFFdqILpdd8z3Gb3456hQ0dZNQnBUlsZVkQ5r@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.47
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [PATCH 1/3] glibc 2.9: cleaned up; patches only in local dir
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
X-List-Received-Date: Sat, 17 Jul 2010 08:05:48 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/7/17 Khem Raj <raj.khem@gmail.com>

> On (15/07/10 22:46), Frans Meulenbroeks wrote:
> > moved all patches to glibc-2.9
> > removed references to other dirs.
>
>
> Well you forgot to copy glibc-2.4/etc dir into glibc-2.9
> this will render glibc 2.9 unbuildable.
>

Thanks for noticing this. Fixed.
(apparently forgot the -r when copying the dir over)

Frans

>
> Thx
> -Khem
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

